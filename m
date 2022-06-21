Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45A97552AE4
	for <lists+linux-media@lfdr.de>; Tue, 21 Jun 2022 08:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345845AbiFUGPv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jun 2022 02:15:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345843AbiFUGPm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jun 2022 02:15:42 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48F4C1A814
        for <linux-media@vger.kernel.org>; Mon, 20 Jun 2022 23:15:41 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id h82-20020a25d055000000b00668b6a4ee32so9141191ybg.3
        for <linux-media@vger.kernel.org>; Mon, 20 Jun 2022 23:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=X+WXInPQCjTg5RTSjnUeBCxCoOVcMQodGUx7VPS56bU=;
        b=T1IivO1404voJZrUpVrAUkR30a3xLY+o1+N/h1eHTb/dQxNbV1M+v0Ha8gz17m6hPV
         4NS+yK+oamBjtFA2Xkh6Xv7rb5uW/sDsn+v8mFZgc2MBrO7qHh48pKhhbngah3ZWbIPb
         L5T80fFberMc7VtftrkMmD335+dtd6/GSczk1ffrArBpijbA3gtUnBVblcsR7RPo/DSM
         Fs3rWGat0o8NoQ4cHxkjRN3pMYpkrrawWNM6xuxsES+Tuw33SVrua+5KMXf5fFDFXaqC
         6TpeYKxFUsbmfj4Itev610Ri9kGegE02pv3fVe7NAhiP7RRPQYzeGLjWthLJlodCxMdd
         vnrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=X+WXInPQCjTg5RTSjnUeBCxCoOVcMQodGUx7VPS56bU=;
        b=RJKE8x+AuOk5LeqWdvt4H/cFj+/zeg+pib+0GeWek7WBdWPnHFt7aELqH+ePuORTbk
         8Rl+Myr5abNBtZu1AjZpTqUvnkh5fPQSGPRk4r+myCMsekPS2dSo+9tS+YEnNyxpA3t2
         1G8sAoW2JExulzzAvP+lgAWfnFcH/2n93F0uOSwxd+0HDlx6r/jj6VpEjYU7nhJk7nts
         3+JijkEyUujiK/LLvviDtH1n+6VDI8LhqRe9jlc15XORz+Fs3D1QZ0j8qUkbuA3h3JU8
         q8d9gKvMXNs28sKiLkb6gv6XQLMlugmnSq5n/geghxRC2ZGTwMhDYTOL8ZsPy12py3Nz
         Igpg==
X-Gm-Message-State: AJIora/XKPgXrVfWvgJ8DFfDFjMN3myvayJm3wIOQyxmH9ff+FeyoFy0
        GQ5VwhT2g8FtMk7UndL5rR9GRaQGBOk=
X-Google-Smtp-Source: AGRyM1uT3u+daopFyXGLO4EPWuLS32aHCDoNxhwiYP7sti7Dy2qbDuq6vu8eH0W4IoYDArvG7+d9srdY5Qg=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:86ad:34d9:2b8f:477])
 (user=yunkec job=sendgmr) by 2002:a81:2f48:0:b0:30f:9fc3:bc0b with SMTP id
 v69-20020a812f48000000b0030f9fc3bc0bmr31685511ywv.433.1655792140470; Mon, 20
 Jun 2022 23:15:40 -0700 (PDT)
Date:   Tue, 21 Jun 2022 15:15:32 +0900
Message-Id: <20220621061532.3108909-1-yunkec@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
Subject: [PATCH v2] media: uvcvideo: user entity get_cur in uvc_ctrl_set
From:   Yunke Cao <yunkec@google.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Entity controls should get_cur using an entity-defined function
instead of via a query. Fix this in uvc_ctrl_set.

Fixes: 65900c581d01 ("media: uvcvideo: Allow entity-defined get_info and get_cur")
Signed-off-by: Yunke Cao <yunkec@google.com>
---
Changelog since v1:
-Factored out common logic into __uvc_ctrl_load_cur().

 drivers/media/usb/uvc/uvc_ctrl.c | 62 ++++++++++++++++++--------------
 1 file changed, 35 insertions(+), 27 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 0e78233fc8a0..e25177c95571 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -963,36 +963,48 @@ static s32 __uvc_ctrl_get_value(struct uvc_control_mapping *mapping,
 	return value;
 }
 
-static int __uvc_ctrl_get(struct uvc_video_chain *chain,
-	struct uvc_control *ctrl, struct uvc_control_mapping *mapping,
-	s32 *value)
+static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
+			       struct uvc_control *ctrl)
 {
-	int ret;
+	int ret = 0;
 
 	if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
 		return -EACCES;
 
-	if (!ctrl->loaded) {
-		if (ctrl->entity->get_cur) {
-			ret = ctrl->entity->get_cur(chain->dev,
-				ctrl->entity,
-				ctrl->info.selector,
-				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
-				ctrl->info.size);
-		} else {
-			ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
-				ctrl->entity->id,
-				chain->dev->intfnum,
-				ctrl->info.selector,
-				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
-				ctrl->info.size);
-		}
-		if (ret < 0)
-			return ret;
+	if (ctrl->loaded)
+		return 0;
 
-		ctrl->loaded = 1;
+	if (ctrl->entity->get_cur) {
+		ret = ctrl->entity->get_cur(chain->dev,
+			ctrl->entity,
+			ctrl->info.selector,
+			uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
+			ctrl->info.size);
+	} else {
+		ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
+				     ctrl->entity->id, chain->dev->intfnum,
+				     ctrl->info.selector,
+				     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
+				     ctrl->info.size);
 	}
 
+	if (ret < 0)
+		return ret;
+
+	ctrl->loaded = 1;
+
+	return ret;
+}
+
+static int __uvc_ctrl_get(struct uvc_video_chain *chain,
+	struct uvc_control *ctrl, struct uvc_control_mapping *mapping,
+	s32 *value)
+{
+	int ret = __uvc_ctrl_load_cur(chain, ctrl);
+
+	if (ret < 0)
+		return ret;
+
 	*value = __uvc_ctrl_get_value(mapping,
 				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
 
@@ -1788,11 +1800,7 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 			memset(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
 				0, ctrl->info.size);
 		} else {
-			ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
-				ctrl->entity->id, chain->dev->intfnum,
-				ctrl->info.selector,
-				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
-				ctrl->info.size);
+			ret = __uvc_ctrl_load_cur(chain, ctrl);
 			if (ret < 0)
 				return ret;
 		}
-- 
2.37.0.rc0.104.g0611611a94-goog
