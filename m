Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16ADB6EF03F
	for <lists+linux-media@lfdr.de>; Wed, 26 Apr 2023 10:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240083AbjDZIae (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Apr 2023 04:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240033AbjDZIac (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Apr 2023 04:30:32 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E6833C39
        for <linux-media@vger.kernel.org>; Wed, 26 Apr 2023 01:30:31 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-b92309d84c1so33625891276.1
        for <linux-media@vger.kernel.org>; Wed, 26 Apr 2023 01:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682497830; x=1685089830;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1hIp5mYZdj0KUTMM3jiGLfDWgzgFP0+qMCQ75klt6RA=;
        b=gco/yaljPrlZFch8My0p513IbVr+1SrxD6QAMqqr7jxoEslynQBM0hAYTI7TXAZAuY
         cUNxJGD2YVJjUwy0FjjddbUdHePjpm4vbl3MuqkSRCgs+0b9S6tslJPddJ65GArj/qxE
         wMd2loQ0go8oUl3tFpxIu+9FnIBdOLG0dwFYbaWMNqDXntYBWfFcwwwpkceLGOoADqpg
         ssHnCAeYyF16zioJVDpkpxkaOeKExd6lp2//2hmDpn/uo2AuR/7uLarzOhu0oyLKFFhm
         2xdbzTl00JJ8+mdfufwir7XVSqCreZmFVgqTUJdMa+675D7Oaxpo+Ab5v9baW0Y0MqXA
         kHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682497830; x=1685089830;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1hIp5mYZdj0KUTMM3jiGLfDWgzgFP0+qMCQ75klt6RA=;
        b=UictSVNfS3okelg4QL/lyCSt5VcvADyXpspp/3WV9HTwXB3owMa/1xT8aHhMwWCKFf
         X5jiD5caO9D2YfMHrTc92FYfIqwrWSN+4M5uXZ1aDVf0T1RPHLjua3pmfwohJZq40Tqy
         D0K5/I5g3Oo+aG9tedmp5TlK+MRgC+bP69/7plxc3RwVP5IHvkL2QsF6a67TToGvjQLZ
         IvtuOh38prYiSfUn5paZSJl2ahb9rv++tu1MTlA4v39C7kGpQYVctWcsmi3wv/ZeK2pP
         PgBxD/k+/GDM/luhDywRysbMdBwY2i0VuTX2HuYk6VNPm6u9EsOSDXyjKZhGSQlQ3mha
         WTMQ==
X-Gm-Message-State: AC+VfDx0xiNAhirhs3d7ed/ic11TF4I13MSe3VLcP99uxe2kXKD0hz2J
        MN9W1M0NebtzQoG9VcKNdsBXIpCbCSw=
X-Google-Smtp-Source: ACHHUZ6BHAR7fp2+EukKY6YESnegGOYPoSN7zFJXI7b9kchlFzpLw5vuFnhpX/AAeRi9AuEnmo/pAip8sME=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:1f4e:598b:ed:99bd])
 (user=yunkec job=sendgmr) by 2002:a81:7e0f:0:b0:556:c670:941d with SMTP id
 o15-20020a817e0f000000b00556c670941dmr1070272ywn.4.1682497830616; Wed, 26 Apr
 2023 01:30:30 -0700 (PDT)
Date:   Wed, 26 Apr 2023 17:29:15 +0900
In-Reply-To: <20230426082923.132909-1-yunkec@google.com>
Mime-Version: 1.0
References: <20230426082923.132909-1-yunkec@google.com>
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
Message-ID: <20230426082923.132909-4-yunkec@google.com>
Subject: [PATCH v11 03/11] media: uvcvideo: introduce __uvc_ctrl_get_std()
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
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
index 4a4ceb6289f5..c4a9ea461eb0 100644
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
+	if (!uvc_ctrl_mapping_is_compound(mapping))
+		mapping->set(mapping, value,
+			     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
+	else
+		return -EINVAL;
+
 
 	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
 		ctrl->handle = handle;
-- 
2.40.1.495.gc816e09b53d-goog

