class FooController < ApplicationController
  # テストページ
  def index
    @entry = Entry.new
    @entry.id = 100
    @message = 'たまちゃん'
  end

  # モーダルを開く
  def modal_open
    render :partial => 'modal'
  end

  # モーダル内検索
  def ajax_search
    keyword = params[:search][:keyword].strip
    if keyword.blank?
      @stations = MasterStation.find(:all)
    else
      keyword = "%#{keyword}%"
      @stations = MasterStation.find(:all, :conditions => ["name like ?", keyword])
    end

    render :update do |html|
      if @stations.empty?
        html.replace_html :result, "見つかりませんでした。"
      else
        html.replace_html :result, render(:partial => "search_result")
      end
    end
  end

  # 検索結果をクリックで、このアクションを実行。 master_station_id をセット
  def ajax_set_station
    station = MasterStation.find params[:id]

    render :update do |html|
      html["entry_master_station_id"].value = station.id  # hiddenに値セット
      html["entry_dummy_label"].value = station.name  # 駅名をダミーラベルにセット
      html.<< "Control.Modal.close()"  # モーダルを閉じる
    end
  end
end
