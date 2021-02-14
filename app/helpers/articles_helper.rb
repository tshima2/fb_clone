module ArticlesHelper

  def choose_new_or_edit
    #new view もしくはedit viewにて、confirmアクションに遷移する際の遷移先urlと遷移先viewで使用するラベルを返却
    if action_name=='new' || action_name=='create' || action_name=='confirm'
      { uri: confirm_articles_path, header: '新規作成', label: '投稿する' }
    elsif action_name=='edit' || action_name=='update'
      { uri: article_path, header: '編集', label: '編集結果を保存する' }
    end
  end

end
