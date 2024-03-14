service ZaapService {
    string connect(1:string gameName, 2:string releaseName, 3:i32 instanceId, 4:string hash);
    string auth_getGameToken(1:string gameSession, 2:i32 gameId);
    bool updater_isUpdateAvailable(1:string gameSession);
    string settings_get(1:string gameSession, 2:string key);
    void settings_set(1:string gameSession, 2:string key, 3:string value);
    string askForGuestComplete(1:string gameSession);
    string userInfo_get(1:string gameSession);
    void release_restartOnExit(1:string gameSession);
    void release_exitAndRepair(1:string gameSession, 2:bool restartAfterRepair);
    string zaapVersion_get(1:string gameSession);
    bool zaapMustUpdate_get(1:string gameSession);
    bool payArticle(1:string gameSession, 2:string shopApiKey, 3:i32 articleId, 4:OverlayPosition pos);
    bool payArticleWithPid(1:string gameSession, 2:string shopApiKey, 3:i32 articleId, 4:i32 pid, 5:OverlayPosition pos);
    bool hasPremiumAccess(1:string gameSession);
    string auth_getGameTokenWithWindowId(1:string gameSession, 2:i32 gameId, 3:i32 windowId);
    string system_addNotification(1:string gameSession, 2:NotificationOptions notificationOptions);
    NotificationResult addNotification(1:string gameSession, 2:NotificationParams notificationParams);
}

struct OverlayPosition {
    1:i32 _posX,
    2:i32 _posY,
    3:i32 _width,
    4:i32 _height
}

enum NotificationResultType {
    CLICK = 1,
    CLOSE = 2,
    FADE = 3,
    REPLY = 4,
    ACTION = 5
}

struct NotificationOptions {
  1:string _title,
  2:string _subtitle,
  3:string _body,
  4:bool _silent,
  5:string _icon,
  6:bool _hasReply,
  7:string _timeoutType,
  8:string _replyPlaceholder,
  9:string _sound,
  10:string _urgency,
  11:list<string> _actions,
  12:string _closeButtonText,
  13:string _toastXml
}

struct NotificationParams {
  1:string _id,
  2:string _body,
  3:list<string> _image,
  4:string _subTitle,
  5:string _background,
  6:i32 _timeout
}

struct NotificationResult {
  1:string _id,
  2:NotificationResultType _type,
  3:string _reply,
  4:string _actionIndex
}