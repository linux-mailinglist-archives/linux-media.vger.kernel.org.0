Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E711077F110
	for <lists+linux-media@lfdr.de>; Thu, 17 Aug 2023 09:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348430AbjHQHS0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Aug 2023 03:18:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348435AbjHQHSR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Aug 2023 03:18:17 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F4D3FE
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 00:18:15 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d71f505d21dso1259189276.3
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 00:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692256695; x=1692861495;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zevxs++lsxnv93OkZO8YTVF7cg6tcC1IV3pWEIaVFvo=;
        b=K6Fo7jfc/NfYyGW/gKCkhAWuFitYeUtAq48eOZH/qSeNGbXJQuwxdzB34chA4iMhoz
         hy6EUXZMraKV0nuNikI69BOa7JalNZjuz58YW1CDr2i0MUWaTNp2Yg+w5xXBvWyTcwFo
         a5wfDBfml4Q2nFqCXb96IR2v+YJAhI+AQUghl1/ebhvCQK5zbPA0ZFMrd65aKR3EliIF
         pPtBRecJqzV3hNLFhAyEYjkI5UYImmfCpB4i6UzkQpW6/ouFiIDGZW58AsUqMZuOQUpE
         tEu+OPESePPZFgipqi1AMsM9cw507YMCy2nsIiMO05vDyyAtMJfzEtQxltmulW/8sjyd
         MNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692256695; x=1692861495;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zevxs++lsxnv93OkZO8YTVF7cg6tcC1IV3pWEIaVFvo=;
        b=kf0e71jKEJoFoS1dOU3RARtB1Uk515qHMteJu8TrT+jIq6MhYGoXgFu/n7dVRIHvPa
         LA1dkxJgcUPiTzWSxpagxPc8LKm7eExxeCOW+42R2Q6YFkTYi60H9cBvtwRt5iF1zVxW
         II9nxedOuslA94Eq+bYnWYNTTmxNQ3PH4e51oWm0X015OTKR2nMcTDM/C38V+N+UnBq6
         TmLESD2GxcaA7Idjm80+7UAPXDxVvZeXiq7sJhIBiLAtAXoXJG2Gyhls5T07GJr9T25j
         Q3DktAO9Vne2jfbTyt98YdeBoyTpOOFSP8Eccp6jm+/s877xvc3GvcqxqLuImd11kGqJ
         Euzw==
X-Gm-Message-State: AOJu0Yzse2jW5eN5dBMaLkoFG7+UoPDJU4mkNU9ZkGI4s7e40EBxHDZt
        xOYIPP20hO2QUhJ+R48Pt2UdBPAfZyI=
X-Google-Smtp-Source: AGHT+IHqZvC/focITkNuRyugPIJvG6653iOKkoM3ea+k43LN9HeWDqYft/Jpi72vCsTXAQaLry8IimnTbsY=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:cb5f:f997:f2a2:88c6])
 (user=yunkec job=sendgmr) by 2002:a25:ce45:0:b0:d4c:d744:2ad with SMTP id
 x66-20020a25ce45000000b00d4cd74402admr52139ybe.10.1692256694769; Thu, 17 Aug
 2023 00:18:14 -0700 (PDT)
Date:   Thu, 17 Aug 2023 16:17:31 +0900
In-Reply-To: <20230817071750.2830271-1-yunkec@google.com>
Mime-Version: 1.0
References: <20230817071750.2830271-1-yunkec@google.com>
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
Message-ID: <20230817071750.2830271-4-yunkec@google.com>
Subject: [PATCH v12 03/11] media: uvcvideo: introduce __uvc_ctrl_get_std()
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
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
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
index 4a4ceb6289f5..b73a7e3812cf 100644
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
 
@@ -1529,7 +1534,8 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
 	if (ctrl == NULL)
 		return;
 
-	if (__uvc_ctrl_get(chain, ctrl, mapping, &val) == 0)
+	if (uvc_ctrl_mapping_is_compound(mapping) ||
+	    __uvc_ctrl_get_std(chain, ctrl, mapping, &val) == 0)
 		changes |= V4L2_EVENT_CTRL_CH_VALUE;
 
 	uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
@@ -1700,7 +1706,8 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
 		u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
 		s32 val = 0;
 
-		if (__uvc_ctrl_get(handle->chain, ctrl, mapping, &val) == 0)
+		if (uvc_ctrl_mapping_is_compound(mapping) ||
+		    __uvc_ctrl_get_std(handle->chain, ctrl, mapping, &val) == 0)
 			changes |= V4L2_EVENT_CTRL_CH_VALUE;
 
 		uvc_ctrl_fill_event(handle->chain, &ev, ctrl, mapping, val,
@@ -1880,7 +1887,10 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
 	if (ctrl == NULL)
 		return -EINVAL;
 
-	return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
+	if (uvc_ctrl_mapping_is_compound(mapping))
+		return -EINVAL;
+	else
+		return __uvc_ctrl_get_std(chain, ctrl, mapping, &xctrl->value);
 }
 
 static int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
@@ -2039,8 +2049,12 @@ int uvc_ctrl_set(struct uvc_fh *handle,
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
2.41.0.694.ge786442a9b-goog

