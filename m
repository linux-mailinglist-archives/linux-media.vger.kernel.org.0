Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD12A34A52E
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 11:00:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbhCZJ7u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 05:59:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbhCZJ67 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 05:58:59 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B1CBC0613B1
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 02:58:59 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id o19so5634560edc.3
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 02:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uCrEyotbYF7tjluvQkWSRucWwy5lZOwnlMYsosdr5+s=;
        b=KRXW799zU2MTkSiZwFPeS/NQnIfH+m9lYWRHp/dmwKY+tmOr2yVorJWeFyRXrK65Te
         CnldOEnO1NNXxfPRFjj0aGq/W9BnGpxTlaLBd2HPBlLowAt8bGqEVbHG6LfWKeMQeVhY
         3ZJSd/EDfxdk7heSx/BtvGbxpys+b3clSZVGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uCrEyotbYF7tjluvQkWSRucWwy5lZOwnlMYsosdr5+s=;
        b=nz7hQ0fcNRpm5zM89k5jBUcmrACTNAJXe7vetK+mS8xO+sYwd1CZgQ+K3rAKt4WMio
         eikrQA4v+CKPr2WE+kQ/qaX51mq8kT933M8v/ADvz5QiM7GMTgAM/3a0/O8Knc6fZS7u
         xazIPBG2rwCYo25u7lkA0S9Ox4aOunpSevBpwTaIkfAkOhM0gIIOkBa9n9ZnEFJfIe3P
         haUyFo4aXXotZyOk5LDJGzw79aZmbMpCvFteeZX3py2GBTWmA+1RfIPrGfCvayKf4foU
         ukJlmp4rtuyq1hdeVqBjkEYgt9OQsCXPazy9LEaE9EVSne1q+fmePy7AqdN5xgt+aCj6
         N2wg==
X-Gm-Message-State: AOAM530J6F9yNL2A9QchQof4NtDpRlvq9yaedLx76xo7R1hcSs6SEnG+
        aULQSIluwicpr4/MueksFZpyow==
X-Google-Smtp-Source: ABdhPJwGZlffD5wb8dSneMODwCyR7usaPrHR/9r/bzx2a8jFZm4TQieAiVLvCyG4R0aFXP7Gv9tfsA==
X-Received: by 2002:aa7:d74b:: with SMTP id a11mr13885736eds.92.1616752738024;
        Fri, 26 Mar 2021 02:58:58 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id h13sm4036658edz.71.2021.03.26.02.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:58:57 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Hans Verkuil <hans.verkuil@cisco.com>
Subject: [PATCH v9 19/22] uvcvideo: uvc_ctrl_is_accessible: check for INACTIVE
Date:   Fri, 26 Mar 2021 10:58:37 +0100
Message-Id: <20210326095840.364424-20-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210326095840.364424-1-ribalda@chromium.org>
References: <20210326095840.364424-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil@xs4all.nl>

Check for inactive controls in uvc_ctrl_is_accessible().
Use the new value for the master_id controls if present,
otherwise use the existing value to determine if it is OK
to set the control. Doing this here avoids attempting to
set an inactive control, which will return an error from the
USB device.

Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 28 +++++++++++++++++++++++++++-
 drivers/media/usb/uvc/uvc_v4l2.c |  4 ++--
 drivers/media/usb/uvc/uvcvideo.h |  3 ++-
 3 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index d9d4add1e813..6e7b904bc33d 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1047,10 +1047,18 @@ static int uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
 }
 
 int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
-			   bool read)
+			   const struct v4l2_ext_controls *ctrls,
+			   unsigned long ioctl)
 {
+	struct uvc_control_mapping *master_map = NULL;
+	struct uvc_control *master_ctrl = NULL;
 	struct uvc_control_mapping *mapping;
 	struct uvc_control *ctrl;
+	bool read = ioctl == VIDIOC_G_EXT_CTRLS;
+	bool try = ioctl == VIDIOC_TRY_EXT_CTRLS;
+	s32 val;
+	int ret;
+	int i;
 
 	if (__uvc_query_v4l2_class(chain, v4l2_id, 0) >= 0)
 		return -EACCES;
@@ -1065,6 +1073,24 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR) && !read)
 		return -EACCES;
 
+	if (read || try || !mapping->master_id)
+		return 0;
+
+	for (i = ctrls->count - 1; i >= 0; i--)
+		if (ctrls->controls[i].id == mapping->master_id)
+			return ctrls->controls[i].value ==
+					mapping->master_manual ? 0 : -EACCES;
+
+	__uvc_find_control(ctrl->entity, mapping->master_id, &master_map,
+			   &master_ctrl, 0);
+
+	if (!master_ctrl || !(master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
+		return 0;
+
+	ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
+	if (ret >= 0 && val != mapping->master_manual)
+		return -EACCES;
+
 	return 0;
 }
 
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 8d8b12a4db34..0f4d893eff46 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1000,8 +1000,8 @@ static int uvc_ctrl_check_access(struct uvc_video_chain *chain,
 	int ret = 0;
 
 	for (i = 0; i < ctrls->count; ++ctrl, ++i) {
-		ret = uvc_ctrl_is_accessible(chain, ctrl->id,
-					    ioctl == VIDIOC_G_EXT_CTRLS);
+		ret = uvc_ctrl_is_accessible(chain, ctrl->id, ctrls,
+					    ioctl);
 		if (ret)
 			break;
 	}
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 0313b30f0cea..20bc681315fb 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -901,7 +901,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
 int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
-			   bool read);
+			   const struct v4l2_ext_controls *ctrls,
+			   unsigned long ioctl);
 
 int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 		      struct uvc_xu_control_query *xqry);
-- 
2.31.0.291.g576ba9dcdaf-goog

