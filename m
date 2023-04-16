Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05D986E3BBF
	for <lists+linux-media@lfdr.de>; Sun, 16 Apr 2023 21:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbjDPT5E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Apr 2023 15:57:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjDPT5C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Apr 2023 15:57:02 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09BD9C5
        for <linux-media@vger.kernel.org>; Sun, 16 Apr 2023 12:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1681675019; i=ps.report@gmx.net;
        bh=St6cVSrSvAM+z03XxuQ/FCuE53/YhYG9J3lOf1TmHCo=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=qlEKW+VsS6Mw+NzGQwQTJ7oUyPm7d7SNetcov5isSFUrJbUhNS69IX/foxa5U8Rxh
         XQr/knyoml3ArYnsArJUY+GXmm4mcOp2K9K0sEcnUH3XthO3xkTPxz1nSaHtIOvff+
         YuWVLDfztF/pIr5uk7NIYrzXGWiWW8R/iNsI1jCFavUWAwoWhxS2DwTZ8IMpmUfChU
         Qx3gVA05aZ1i98jX8S5Gvcoq1XfFdgFkBt1ZxENSIHnVTgAbY9XECfazVYzTrFBz4V
         qwsrRWNmsRgdj64MT+ETsO0tnVk8XLkmDZNGPj0cpr8J5yQbqsAA1T0IUqAXbfiZD2
         G5CLuRgEOBgMQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.47]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MV67o-1pwLzJ0kRa-00S8mO; Sun, 16
 Apr 2023 21:56:59 +0200
From:   Peter Seiderer <ps.report@gmx.net>
To:     linux-media@vger.kernel.org
Cc:     Peter Seiderer <ps.report@gmx.net>
Subject: [PATCH v4l-utils v2] meson: re-enable qv4l2 without Qt OpenGL support
Date:   Sun, 16 Apr 2023 21:56:53 +0200
Message-Id: <20230416195653.23099-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:oYLrPGRkPx+VBayhcY2X3RJcp1XqoRBSBDzmqyHflPVxw0s9SAN
 PXXJIvOVfImv+cNXzZnRKHXtcdHMAmJ6E4boPt2dN4QyUz/gS2ymrZifLqNimnOQQGirGsg
 FgDl1D6lW6pPRH/Six2qW7UbX2If3WVKQNdCwvb2K5GHKfKNKuG3BcoD+ciXPT0uu0VHXn2
 LDa0OdAt9Fi/t+XKZNgIQ==
UI-OutboundReport: notjunk:1;M01:P0:BFVbnNmhKwA=;iokPC36UHU6DJzO89UuMU6RjOhf
 e5Mc5ymxz+iriwnSLYLn81xcV5HbMb5hRTq+sbw8l/yQZ7a19X28WHiMvJ8ViRz6EwNjmeXM3
 FuaHKfwe5JqnSTs8QdRm83o16OEbn0D4ZfLObDGe5V2uZqIy30wz/7pTSt7BQ3P2HuDKjjGm6
 VgL1IWjCRZ1mJkrxb351Dl6VvZoHObSPSUyW7WPkwAUxByyLfhaznaiHDrSHLhjn0wvJtu0B5
 LwgsJ4NCjKB5li5et8/wMaxBEIPVf60/gkR3KOLriE5zmYhbK8NwgtOzTWe2vrQflDl9oFGyK
 hW12l7P3k00rTOdyefyyx8Vloj5ryZDNIDXKo4N2jjLne+DQK5j6x5yiMBJTcuFSEUJoHMR/c
 WJFIF0COmx3Ipus8i2jW2nKwrlTYqHr8HujB3gJkG0Eu1aOWI+OUN2zRedz7VVsxyNzu3P47J
 1SRRvNvt6aK17oAKuWdv2kjGWvMptAhpwhAa5vIMz+wXztT1M2wP2fGMyWRpRA4YqKXbKF51Q
 z3HGH02PtMBj7u1T2haVDkxogQ59QxVgAJtqSlCNU+ghJH2MQhhlW/jE3uAZFhD8n3OoSmzlk
 Xw9hP+DriqXx81Hq7RLt6GaDYk9xfOqatZPWsNTm4laoXELdEswzuvtglmpaNie/NR2iqRGY0
 3fAfnyIRuCxJYHBrOjXZNm2YLYCr2eYZV8RcrL0Yh9nTUoTd21a1tqaIOPKGTn51qbZAuNHS/
 2JaoU2W54i9tRuVYbNT+q6e4GF0+WokyaBGVGABaz5tu8bhzkO0ql+arLXIKwdTm2qP5ZUdSU
 p+dO+XR60xXYLtGT27U43oCFzLSMib7ChRdNB1Bd2tvk94v+1Hwa3lLwsMn3J9IWIhrMgQ23O
 rCBh2aQnNXWWa1BSuIiaPjguf96ttUy6qjwzAKqQpoCc3ABju6TfdMQONwthfzXbff2PASTW5
 sEFmKw==
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MIME_BASE64_TEXT,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

UmUtZW5hYmxlIHF2NGwyIHdpdGhvdXQgUXQgT3BlbkdMIHN1cHBvcnQgKGFzIHBvc3NpYmxlIHdp
dGggdGhlCmxlZ2FjeSBhdXRvY29uZi9hdXRvbWFrZSBidWlsZCBzeXN0ZW0pLgoKU2lnbmVkLW9m
Zi1ieTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0PgotLS0KQ2hhbmdlcyB2MSAt
PiB2MjoKICAtIGFkZCBxdmlkY2FwIG1pc3NpbmcgYWRkaXRpb25hbCBkZXBfcXQ1X29wZW5nbCBk
ZXBlbmRlbmN5Ci0tLQogbWVzb24uYnVpbGQgICAgICAgICAgICAgICB8IDEwICsrKysrKy0tLS0K
IHV0aWxzL3F2NGwyL21lc29uLmJ1aWxkICAgfCAgMyArKy0KIHV0aWxzL3F2aWRjYXAvbWVzb24u
YnVpbGQgfCAgMyArKy0KIDMgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCmluZGV4IDFl
NzZiMGY0Li5iMjc0NTBlYSAxMDA2NDQKLS0tIGEvbWVzb24uYnVpbGQKKysrIGIvbWVzb24uYnVp
bGQKQEAgLTcwLDggKzcwLDcgQEAgaWYgZGVwX2Fsc2EuZm91bmQoKQogICAgIGNvbmYuc2V0KCdI
QVZFX0FMU0EnLCAxKQogZW5kaWYKIAotZGVwX2dsID0gZGVwZW5kZW5jeSgnZ2wnLCByZXF1aXJl
ZCA6IGdldF9vcHRpb24oJ3F2aWRjYXAnKS5lbmFibGVkKCkgb3IKLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBnZXRfb3B0aW9uKCdxdjRsMicpLmVuYWJsZWQoKSkKK2RlcF9n
bCA9IGRlcGVuZGVuY3koJ2dsJywgcmVxdWlyZWQgOiBnZXRfb3B0aW9uKCdxdmlkY2FwJykuZW5h
YmxlZCgpKQogZGVwX2dsdSA9IGRlcGVuZGVuY3koJ2dsdScsIHJlcXVpcmVkIDogZmFsc2UpCiAK
IGRlcF9qc29uYyA9IGRlcGVuZGVuY3koJ2pzb24tYycsIHJlcXVpcmVkIDogZ2V0X29wdGlvbign
djRsMi10cmFjZXInKSwgdmVyc2lvbiA6ICc+PTAuMTUnKQpAQCAtODAsOSArNzksMTIgQEAgZGVw
X2xpYmRsID0gY2MuZmluZF9saWJyYXJ5KCdkbCcpCiBkZXBfbGliZWxmID0gY2MuZmluZF9saWJy
YXJ5KCdlbGYnLCByZXF1aXJlZCA6IGdldF9vcHRpb24oJ2JwZicpKQogZGVwX2xpYm0gPSBjYy5m
aW5kX2xpYnJhcnkoJ20nKQogZGVwX2xpYnJ0ID0gY2MuZmluZF9saWJyYXJ5KCdydCcpCi1kZXBf
cXQ1ID0gZGVwZW5kZW5jeSgncXQ1JywgbW9kdWxlczogWydDb3JlJywgJ0d1aScsICdXaWRnZXRz
JywgJ09wZW5HTCddLAorZGVwX3F0NSA9IGRlcGVuZGVuY3koJ3F0NScsIG1vZHVsZXM6IFsnQ29y
ZScsICdHdWknLCAnV2lkZ2V0cyddLAogICAgICAgICAgICAgICAgICAgICAgcmVxdWlyZWQgOiBn
ZXRfb3B0aW9uKCdxdmlkY2FwJykuZW5hYmxlZCgpIG9yIGdldF9vcHRpb24oJ3F2NGwyJykuZW5h
YmxlZCgpKQogCitkZXBfcXQ1X29wZW5nbCA9IGRlcGVuZGVuY3koJ3F0NScsIG1vZHVsZXM6IFsn
T3BlbkdMJ10sCisgICAgICAgICAgICAgICAgICAgICByZXF1aXJlZCA6IGdldF9vcHRpb24oJ3F2
aWRjYXAnKS5lbmFibGVkKCkpCisKIGRlcF9saWJicGYgPSBkZXBlbmRlbmN5KCdsaWJicGYnLCBy
ZXF1aXJlZCA6IGdldF9vcHRpb24oJ2JwZicpLCB2ZXJzaW9uIDogJz49MC43JykKIAogZGVwX3Nk
bCA9IGRlcGVuZGVuY3koJ1NETDInLCByZXF1aXJlZDogZmFsc2UpCkBAIC0yOTEsNyArMjkzLDcg
QEAgcXQ1X29wZW5nbF90ZXN0ID0gJycnCiAjZW5kaWYKICcnJwogaGF2ZV9xdDVfb3BlbmdsID0g
Y3BwLmNvbXBpbGVzKHF0NV9vcGVuZ2xfdGVzdCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBkZXBlbmRlbmNpZXMgOiBbZGVwX2dsLCBkZXBfcXQ1XSwKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBkZXBlbmRlbmNpZXMgOiBbZGVwX2dsLCBkZXBfcXQ1LCBkZXBfcXQ1X29w
ZW5nbF0sCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYXJncyA6ICctZlBJQycpCiBp
ZiBoYXZlX3F0NV9vcGVuZ2wKICAgICBjb25mLnNldCgnSEFWRV9RVEdMJywgMSkKZGlmZiAtLWdp
dCBhL3V0aWxzL3F2NGwyL21lc29uLmJ1aWxkIGIvdXRpbHMvcXY0bDIvbWVzb24uYnVpbGQKaW5k
ZXggNTQ2NzZiZTguLjQ4NjBlMzMxIDEwMDY0NAotLS0gYS91dGlscy9xdjRsMi9tZXNvbi5idWls
ZAorKysgYi91dGlscy9xdjRsMi9tZXNvbi5idWlsZApAQCAtMSw0ICsxLDQgQEAKLWlmIGdldF9v
cHRpb24oJ3F2NGwyJykuZGlzYWJsZWQoKSBvciBub3QgZGVwX2dsLmZvdW5kKCkgb3Igbm90IGRl
cF9xdDUuZm91bmQoKQoraWYgZ2V0X29wdGlvbigncXY0bDInKS5kaXNhYmxlZCgpIG9yIG5vdCBk
ZXBfcXQ1LmZvdW5kKCkKICAgICBzdWJkaXJfZG9uZSgpCiBlbmRpZgogCkBAIC0zMyw2ICszMyw3
IEBAIHF2NGwyX2RlcHMgPSBbCiAgICAgZGVwX2xpYnY0bDJ1dGlsLAogICAgIGRlcF9saWJ2NGxj
b252ZXJ0LAogICAgIGRlcF9xdDUsCisgICAgZGVwX3F0NV9vcGVuZ2wsCiAgICAgZGVwX3RocmVh
ZHMsCiBdCiAKZGlmZiAtLWdpdCBhL3V0aWxzL3F2aWRjYXAvbWVzb24uYnVpbGQgYi91dGlscy9x
dmlkY2FwL21lc29uLmJ1aWxkCmluZGV4IGZhYWUxOGZiLi42M2Q3NmYyOSAxMDA2NDQKLS0tIGEv
dXRpbHMvcXZpZGNhcC9tZXNvbi5idWlsZAorKysgYi91dGlscy9xdmlkY2FwL21lc29uLmJ1aWxk
CkBAIC00LDcgKzQsNyBAQCBpZiBxdmlkY2FwX29wdGlvbi5lbmFibGVkKCkgYW5kIG5vdCBoYXZl
X3F0NV9vcGVuZ2wKICAgICBlcnJvcigncXZpZGNhcCBlbmFibGVkIGJ1dCBRdDUgaXMgbWlzc2lu
ZyBPcGVuR0wgc3VwcG9ydCcpCiBlbmRpZgogCi1pZiBxdmlkY2FwX29wdGlvbi5kaXNhYmxlZCgp
IG9yIG5vdCBkZXBfZ2wuZm91bmQoKSBvciBub3QgZGVwX3F0NS5mb3VuZCgpIG9yIG5vdCBoYXZl
X3F0NV9vcGVuZ2wKK2lmIHF2aWRjYXBfb3B0aW9uLmRpc2FibGVkKCkgb3Igbm90IGRlcF9nbC5m
b3VuZCgpIG9yIG5vdCBkZXBfcXQ1X29wZW5nbC5mb3VuZCgpIG9yIG5vdCBoYXZlX3F0NV9vcGVu
Z2wKICAgICBzdWJkaXJfZG9uZSgpCiBlbmRpZgogCkBAIC0zMCw2ICszMCw3IEBAIHF2aWRjYXBf
ZGVwcyA9IFsKICAgICBkZXBfbGlidjRsMnV0aWwsCiAgICAgZGVwX2xpYnY0bGNvbnZlcnQsCiAg
ICAgZGVwX3F0NSwKKyAgICBkZXBfcXQ1X29wZW5nbCwKICAgICBkZXBfdGhyZWFkcywKIF0KIAot
LSAKMi40MC4wCgo=
