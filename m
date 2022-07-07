Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A30F569E2D
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 10:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234091AbiGGIxl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 04:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233783AbiGGIxk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 04:53:40 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 921AD1E3E6
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 01:53:39 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id t10-20020a5b07ca000000b0066ec1bb6e2cso398266ybq.14
        for <linux-media@vger.kernel.org>; Thu, 07 Jul 2022 01:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=/yvdzx+V3HZK3V3JkRU+fAG4K3WGZJnFfTOCSKTQOEY=;
        b=jD/5g6uPEzIlWGFdIzbXthauuTMSfUCPSY7vtnTW2RdkwEqSVGoQ0gbx1fc/ZQIA0v
         mzw3uo6cOz7b5cHomezgyNmUxCYXen5acCmeA5w70mpAVyDonPjKvpPN3RMpps+3kHNo
         9ppo3MYZ3xzEnmMo1mSfjNPESswxImlWrJAjRks3unyAilSWLnczaCiEywSzs2ilUmSa
         zjtYNDJ6CbZ0WGMqsl/PjD31ZO8OVaqbToExVh1Y9NDQDdBuM93iMu7pnDHJBbPISw0l
         7Ctt3FgOYlfhbeLnL4v8a1fkXED5VoIW/ynPrglPhx1rQ3Ercicl8g6jIByQL/h4dK4T
         kpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=/yvdzx+V3HZK3V3JkRU+fAG4K3WGZJnFfTOCSKTQOEY=;
        b=5gy/PhUbaLgHdSKjILs3QfzX5Xyt8EeuwpuM7mlyFSvIqDHwXZ4urnqMYIVmDYjmTF
         dmLClwgVizaMjwipCykFoGf7hkpNL0Qd9t+F4ZtS68YzxjIj0bB8zjxDuTNE0zfL2GlS
         ajLZ5AVzDQv70LrCD7Bf00Ek3s56JlsjCM0UmqSrU/fEdNFQ/Ll+42HuVrTmWVk8wtqo
         VvDKwTmA2ZAIOghP7DwJMAewsOv7lEOMADFf8j33q8d7kyY6bYse6b1SGC1NvphSOmh7
         5IZmQ465urH5ykYLjM3QxG3rO8CO8tGZ9lnk27D5mrxJ+lwL2sDwAYjEcMjacT8hbJtP
         gO0w==
X-Gm-Message-State: AJIora/IAflplbqEzpRphgYOSwHwVfCcbRVfyQjLrDZ7UeaSA95N+hQN
        Ft8p/8Vpqy0v3ttM3fDnUUMPir4SDk8=
X-Google-Smtp-Source: AGRyM1vFS0Wh5K3xlbueJfPYcQ97xyzjRAbI6nAGfspCfSKwINs6DCFHKL428XQkFO1HVqzJ+X8hJUIshL8=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:6983:53f0:ed41:769c])
 (user=yunkec job=sendgmr) by 2002:a81:2301:0:b0:31b:f327:88c0 with SMTP id
 j1-20020a812301000000b0031bf32788c0mr52025696ywj.338.1657184018862; Thu, 07
 Jul 2022 01:53:38 -0700 (PDT)
Date:   Thu,  7 Jul 2022 17:53:31 +0900
Message-Id: <20220707085331.283402-1-yunkec@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v3] media: uvcvideo: use entity get_cur in uvc_ctrl_set
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

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Yunke Cao <yunkec@google.com>
---
Changelog since v2:
-Move the logic of setting ctrl_data to 0 into load_cur.
-Do not initialize ret=0.
-Fix __uvc_ctrl_get() spacing.
-Fix typo in the title.

Changelog since v1:
-Factored out common logic into __uvc_ctrl_load_cur().

 drivers/media/usb/uvc/uvc_ctrl.c | 85 ++++++++++++++++++--------------
 1 file changed, 48 insertions(+), 37 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 0e78233fc8a0..181ce4b5db1e 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -963,35 +963,57 @@ static s32 __uvc_ctrl_get_value(struct uvc_control_mapping *mapping,
 	return value;
 }
 
+static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
+			       struct uvc_control *ctrl)
+{
+	int ret;
+
+	if (ctrl->loaded)
+		return 0;
+
+	if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0) {
+		memset(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
+		       0, ctrl->info.size);
+		ctrl->loaded = 1;
+
+		return 0;
+	}
+
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
+	}
+
+	if (ret < 0)
+		return ret;
+
+	ctrl->loaded = 1;
+
+	return ret;
+}
+
 static int __uvc_ctrl_get(struct uvc_video_chain *chain,
-	struct uvc_control *ctrl, struct uvc_control_mapping *mapping,
-	s32 *value)
+			  struct uvc_control *ctrl,
+			  struct uvc_control_mapping *mapping,
+			  s32 *value)
 {
 	int ret;
 
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
-
-		ctrl->loaded = 1;
-	}
+	ret = __uvc_ctrl_load_cur(chain, ctrl);
+	if (ret < 0)
+		return ret;
 
 	*value = __uvc_ctrl_get_value(mapping,
 				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
@@ -1783,21 +1805,10 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 	 * needs to be loaded from the device to perform the read-modify-write
 	 * operation.
 	 */
-	if (!ctrl->loaded && (ctrl->info.size * 8) != mapping->size) {
-		if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0) {
-			memset(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
-				0, ctrl->info.size);
-		} else {
-			ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
-				ctrl->entity->id, chain->dev->intfnum,
-				ctrl->info.selector,
-				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
-				ctrl->info.size);
-			if (ret < 0)
-				return ret;
-		}
-
-		ctrl->loaded = 1;
+	if ((ctrl->info.size * 8) != mapping->size) {
+		ret = __uvc_ctrl_load_cur(chain, ctrl);
+		if (ret < 0)
+			return ret;
 	}
 
 	/* Backup the current value in case we need to rollback later. */
-- 
2.37.0.rc0.161.g10f37bed90-goog

