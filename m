Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED7327BF0C7
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 04:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1441853AbjJJCWB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 22:22:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1441833AbjJJCWA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 22:22:00 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BC80A4
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 19:21:59 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5a1f12cf1ddso50883657b3.0
        for <linux-media@vger.kernel.org>; Mon, 09 Oct 2023 19:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696904518; x=1697509318; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eGg+Bt9jkw0iGa7ol+nB6Xgm3s3q27aJePZnVTI8Jv4=;
        b=R/tkPOCQzSx7be2EidBvFlRwV6gQZBoUbsn62lcLPXSn3zl+nBWEZ260Qn6ZFQ+NLg
         iOlNOOWPtaWM9NoNOlC205DlLt0+RrEIjWY96elodpLfcAayzEZ4Z6p/aLThgSbzii1G
         OtiC1GedGUGDmXIXFMF4MeieoDKS04EuREtrMfkLmbMXTsbUffNswlX9EgXPZrlltx+L
         OF0hybwRi3I05W8qTUvaM+aKAYR0LDFCEiwNCta4NapSehJi46wjw5WbgZN6uxDVQAeL
         AB3TCmOLzr4gFM/Iavn84wxg+bJqOQjVi51kJQ/dMBszXckRQT4cmAuWUZIaYe0S/8FF
         UynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696904518; x=1697509318;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eGg+Bt9jkw0iGa7ol+nB6Xgm3s3q27aJePZnVTI8Jv4=;
        b=JD0wRmioV8D5WRPyCoEu7+HN8/xnKKyeyPSFeikXyM1KVaB9vF36GFHcCpOYCjNy1l
         CP0IHY0kXuOkAgIFH3pESLo1fA9B6iwf8WiJTsdyUSgjt218PNV0EdF1oG0Kq2Vx0MtW
         mkUQdPHSYWJ3/Rcruw2Cxo4WNg21xK9V8fYf93T72yS9tO2wPwHuUouhPMhKU6PIfYmu
         /Nv/x1ouTZHKQWPl0A2hGePKgMYUhkHUqrzC6qPNHsKYQQlkKgVldEidgwGjf7KkaDxk
         hqzhF4fbY1N8MxX0JqyZiRaRewxV/GzEvuyFNd3+RWvDbccOYjq9fqkliYhW3P0rpZAQ
         FLJg==
X-Gm-Message-State: AOJu0Yx6bmypA3XqVSWi+gdmRZyzomQBnaUegr/K9I8x20h45kgMQuxj
        qYLAXjKQwuQ+cMKk3iDsEUDyMoMAPWo=
X-Google-Smtp-Source: AGHT+IGqGDigNevLvpTkcHhBgkud7KrBq9QG5Y4M1YtHBdcK4havHqi4tLXvWaUxeoAsZpgEVoMJ1WGKQ8c=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:7303:2d54:5b83:e60b])
 (user=yunkec job=sendgmr) by 2002:a25:824f:0:b0:d9a:66eb:b516 with SMTP id
 d15-20020a25824f000000b00d9a66ebb516mr206ybn.6.1696904518378; Mon, 09 Oct
 2023 19:21:58 -0700 (PDT)
Date:   Tue, 10 Oct 2023 11:21:26 +0900
In-Reply-To: <20231010022136.1504015-1-yunkec@google.com>
Mime-Version: 1.0
References: <20231010022136.1504015-1-yunkec@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Message-ID: <20231010022136.1504015-4-yunkec@google.com>
Subject: [PATCH v13 03/11] media: uvcvideo: introduce __uvc_ctrl_get_std()
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Refactor uvc_ctrl to make adding compound control easier.

Currently __uvc_ctrl_get() only work for non-compound controls.
Move the logic into __uvc_ctrl_std(), return error for compound
controls.

Make __uvc_ctrl_get() call __uvc_ctrl_std() inside. Also modify some of the
callers of __uvc_ctrl_get() to call __uvc_ctrl_get_std() instead.

Signed-off-by: Yunke Cao <yunkec@google.com>
---
Changelog since v12:
- No change.
Changelog since v11:
- Minor change to avoid negative if statement.
Changelog since v10:
- Better commit message.
Changelog since v9:
- No change.
Changelog since v8:
- No change.
Changelog since v7:
- Newly added patch. Split the refactoring of uvc_ctrl_get from v7 3/7.

 drivers/media/usb/uvc/uvc_ctrl.c | 42 +++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 8d8333786333..4a685532f7eb 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1081,15 +1081,15 @@ static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
 	return ret;
 }
 
-static int __uvc_ctrl_get(struct uvc_video_chain *chain,
-			  struct uvc_control *ctrl,
-			  struct uvc_control_mapping *mapping,
-			  s32 *value)
+static int __uvc_ctrl_get_std(struct uvc_video_chain *chain,
+			      struct uvc_control *ctrl,
+			      struct uvc_control_mapping *mapping,
+			      s32 *value)
 {
 	int ret;
 
-	if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
-		return -EACCES;
+	if (uvc_ctrl_mapping_is_compound(mapping))
+		return -EINVAL;
 
 	ret = __uvc_ctrl_load_cur(chain, ctrl);
 	if (ret < 0)
@@ -1199,7 +1199,7 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 	if (!master_ctrl || !(master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
 		return 0;
 
-	ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
+	ret = __uvc_ctrl_get_std(chain, master_ctrl, master_map, &val);
 	if (ret >= 0 && val != mapping->master_manual)
 		return -EACCES;
 
@@ -1264,8 +1264,13 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 		__uvc_find_control(ctrl->entity, mapping->master_id,
 				   &master_map, &master_ctrl, 0);
 	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
-		s32 val;
-		int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
+		s32 val = 0;
+		int ret;
+
+		if (uvc_ctrl_mapping_is_compound(master_map))
+			return -EINVAL;
+
+		ret = __uvc_ctrl_get_std(chain, master_ctrl, master_map, &val);
 		if (ret < 0)
 			return ret;
 
@@ -1532,7 +1537,8 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
 	if (ctrl == NULL)
 		return;
 
-	if (__uvc_ctrl_get(chain, ctrl, mapping, &val) == 0)
+	if (uvc_ctrl_mapping_is_compound(mapping) ||
+	    __uvc_ctrl_get_std(chain, ctrl, mapping, &val) == 0)
 		changes |= V4L2_EVENT_CTRL_CH_VALUE;
 
 	uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
@@ -1703,7 +1709,8 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
 		u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
 		s32 val = 0;
 
-		if (__uvc_ctrl_get(handle->chain, ctrl, mapping, &val) == 0)
+		if (uvc_ctrl_mapping_is_compound(mapping) ||
+		    __uvc_ctrl_get_std(handle->chain, ctrl, mapping, &val) == 0)
 			changes |= V4L2_EVENT_CTRL_CH_VALUE;
 
 		uvc_ctrl_fill_event(handle->chain, &ev, ctrl, mapping, val,
@@ -1883,7 +1890,10 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
 	if (ctrl == NULL)
 		return -EINVAL;
 
-	return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
+	if (uvc_ctrl_mapping_is_compound(mapping))
+		return -EINVAL;
+	else
+		return __uvc_ctrl_get_std(chain, ctrl, mapping, &xctrl->value);
 }
 
 static int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
@@ -2042,8 +2052,12 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 		       ctrl->info.size);
 	}
 
-	mapping->set(mapping, value,
-		uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
+	if (uvc_ctrl_mapping_is_compound(mapping))
+		return -EINVAL;
+	else
+		mapping->set(mapping, value,
+			     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
+
 
 	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
 		ctrl->handle = handle;
-- 
2.42.0.609.gbb76f46606-goog

