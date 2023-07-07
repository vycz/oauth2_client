import 'package:oauth2_client/oauth2_client.dart';

class TheGameOAuth2Client extends OAuth2Client {
  TheGameOAuth2Client(
      {required String redirectUri, required String customUriScheme})
      : super(
            authorizeUrl: 'https://user.config.vip/login/oauth/authorize',
            tokenUrl: 'https://user.config.vip/api/login/oauth/access_token',
            revokeUrl: 'https://user.config.vip/api/login/oauth/revoke',
            redirectUri: redirectUri,
            customUriScheme: customUriScheme);
}
