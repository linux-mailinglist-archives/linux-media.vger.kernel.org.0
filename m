Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACBB4340F2E
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 21:30:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233223AbhCRUaS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 16:30:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233132AbhCRU3k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 16:29:40 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C10EC06175F
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 13:29:39 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id r12so6022409ejr.5
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 13:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oDvgQ7zr4LP4hONbUbR/B+hiXt3aduz+tBCu4CBH/00=;
        b=ZbhkKybQgWF5nut7L35CxYcq2MTshVwI0OZxfs0XQ9GISQkZ/QRtP52w6MdHgysJ5k
         fEAIAlGFmQih8DVMQwg58mOc7bmq5Wjq/T7fmQB0cvwLiRPMiIrDr0ZtJ9wMix+6v+94
         IKb8zf1pvGgC7By0aXjmiO+ka8xseIlRHft7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oDvgQ7zr4LP4hONbUbR/B+hiXt3aduz+tBCu4CBH/00=;
        b=XrlKAAFZL0rfctYpfcNgjgTtQAeGt8wBBlymBAt0K37MTQQRBBpSTnlW+4ZEEzaYwO
         ciRjGuVB+vwXP/W7EU13IKe+82MnUxkFOyxNZSMwIbM9Yisfjp454IQZ/u7XqtXt5uTU
         rUC4/+SVjWJFnBBX7eF7NTBhPxwn55+p7fdzOKTi1no/nff4mSo0EzsGjtSJjXPNmBSt
         fnU+4SoKTHzJa9jkAqA+X7XzzlCOPWbz4NoA+GU7dl6RivRVCYysd5XHan0ooXBsmJWG
         GR+PWFMUG5cH4RjmqR5t7kQJFfdKgK/jBRfMlMq1NGaqHTIhK6kV8FXAicjJ4SrfV09t
         xhhA==
X-Gm-Message-State: AOAM533cM/8XK/J4ckMbjazPXoUXPGRqIlXK8dEVyqtE5FreQJxZNmSO
        Ir4C6ibGAlZynyb77J2XZl/Xjg==
X-Google-Smtp-Source: ABdhPJyxeTnbXRyU8AfMi/0xJk/FI6EgqL+1xR84K5yoC3/SWz+EZM7DqcRv8X+Blgt3ZnJoFsaUcA==
X-Received: by 2002:a17:907:2054:: with SMTP id pg20mr399017ejb.213.1616099378160;
        Thu, 18 Mar 2021 13:29:38 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id a22sm2533767ejr.89.2021.03.18.13.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 13:29:37 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v7 13/17] media: uvcvideo: Return -EACCES to inactive controls
Date:   Thu, 18 Mar 2021 21:29:24 +0100
Message-Id: <20210318202928.166955-14-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210318202928.166955-1-ribalda@chromium.org>
References: <20210318202928.166955-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If a control is inactive return -EACCES to let the userspace know that
the value will not be applied automatically when the control is active
again.

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 68 ++++++++++++++++++++++----------
 drivers/media/usb/uvc/uvc_v4l2.c | 11 +++++-
 drivers/media/usb/uvc/uvcvideo.h |  2 +-
 3 files changed, 58 insertions(+), 23 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 24fd5afc4e4f..1ec8333811bc 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1046,8 +1046,33 @@ static int uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
 	return 0;
 }
 
+static bool uvc_ctrl_is_inactive(struct uvc_video_chain *chain,
+				 struct uvc_control *ctrl,
+				 struct uvc_control_mapping *mapping)
+{
+	struct uvc_control_mapping *master_map = NULL;
+	struct uvc_control *master_ctrl = NULL;
+	s32 val;
+	int ret;
+
+	if (!mapping->master_id)
+		return false;
+
+	__uvc_find_control(ctrl->entity, mapping->master_id, &master_map,
+			   &master_ctrl, 0);
+
+	if (!master_ctrl || !(master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
+		return false;
+
+	ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
+	if (ret < 0 || val == mapping->master_manual)
+		return false;
+
+	return true;
+}
+
 int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
-			   bool read)
+			   unsigned long ioctl)
 {
 	struct uvc_control_mapping *mapping;
 	struct uvc_control *ctrl;
@@ -1059,11 +1084,26 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 	if (!ctrl)
 		return -EINVAL;
 
-	if (!(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) && read)
-		return -EACCES;
-
-	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR) && !read)
-		return -EACCES;
+	switch (ioctl) {
+	case VIDIOC_G_CTRL:
+	case VIDIOC_G_EXT_CTRLS:
+		if (!(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
+			return -EACCES;
+		break;
+	case VIDIOC_S_EXT_CTRLS:
+	case VIDIOC_S_CTRL:
+		if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
+			return -EACCES;
+		if (uvc_ctrl_is_inactive(chain, ctrl, mapping))
+			return -EACCES;
+		break;
+	case VIDIOC_TRY_EXT_CTRLS:
+		if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
+			return -EACCES;
+		break;
+	default:
+		return -EINVAL;
+	}
 
 	return 0;
 }
@@ -1087,8 +1127,6 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 	struct uvc_control_mapping *mapping,
 	struct v4l2_queryctrl *v4l2_ctrl)
 {
-	struct uvc_control_mapping *master_map = NULL;
-	struct uvc_control *master_ctrl = NULL;
 	const struct uvc_menu_info *menu;
 	unsigned int i;
 
@@ -1104,18 +1142,8 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
 		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	if (mapping->master_id)
-		__uvc_find_control(ctrl->entity, mapping->master_id,
-				   &master_map, &master_ctrl, 0);
-	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
-		s32 val;
-		int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
-		if (ret < 0)
-			return ret;
-
-		if (val != mapping->master_manual)
-				v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
-	}
+	if (uvc_ctrl_is_inactive(chain, ctrl, mapping))
+		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
 
 	if (!ctrl->cached) {
 		int ret = uvc_ctrl_populate_cache(chain, ctrl);
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index fbb99f3c2fb4..ddebdeb5a81b 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -999,6 +999,10 @@ static int uvc_ioctl_g_ctrl(struct file *file, void *fh,
 	struct v4l2_ext_control xctrl;
 	int ret;
 
+	ret = uvc_ctrl_is_accessible(chain, ctrl->id, VIDIOC_G_CTRL);
+	if (ret)
+		return ret;
+
 	memset(&xctrl, 0, sizeof(xctrl));
 	xctrl.id = ctrl->id;
 
@@ -1023,6 +1027,10 @@ static int uvc_ioctl_s_ctrl(struct file *file, void *fh,
 	struct v4l2_ext_control xctrl;
 	int ret;
 
+	ret = uvc_ctrl_is_accessible(chain, ctrl->id, VIDIOC_S_CTRL);
+	if (ret)
+		return ret;
+
 	memset(&xctrl, 0, sizeof(xctrl));
 	xctrl.id = ctrl->id;
 	xctrl.value = ctrl->value;
@@ -1054,8 +1062,7 @@ static int uvc_ctrl_check_access(struct uvc_video_chain *chain,
 	int ret = 0;
 
 	for (i = 0; i < ctrls->count; ++ctrl, ++i) {
-		ret = uvc_ctrl_is_accessible(chain, ctrl->id,
-					    ioctl == VIDIOC_G_EXT_CTRLS);
+		ret = uvc_ctrl_is_accessible(chain, ctrl->id, ioctl);
 		if (ret)
 			break;
 	}
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 9471c342a310..a93aeedb5499 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -903,7 +903,7 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
 int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
-			   bool read);
+			   unsigned long ioctl);
 
 int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 		      struct uvc_xu_control_query *xqry);
-- 
2.31.0.rc2.261.g7f71774620-goog

