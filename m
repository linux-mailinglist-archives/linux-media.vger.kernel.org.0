Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD8934059F0
	for <lists+linux-media@lfdr.de>; Thu,  9 Sep 2021 17:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240691AbhIIPCY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Sep 2021 11:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238469AbhIIPCK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Sep 2021 11:02:10 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9874C061786
        for <linux-media@vger.kernel.org>; Thu,  9 Sep 2021 08:00:51 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id q3so3090892edt.5
        for <linux-media@vger.kernel.org>; Thu, 09 Sep 2021 08:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2/YVdOGpA7p9VVsleNcFecmocu6P9r8RpItIOBc2sY0=;
        b=YlnW+Tf82GzMUYEZ5yXPtk6LJVaLm17//C+nq0HjUgu5F8UDQPNqwxLMnM16+ackxX
         70XwEOLqJ+GzlQ04FpROOPEnMLAfc3OgjtZY8pxF2w/3zdVuwdlGO3KnIpb7FYMMQKRE
         5kHUVvl8IOYkg5oTyEQsHFPf9+9qOlLjI2sOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2/YVdOGpA7p9VVsleNcFecmocu6P9r8RpItIOBc2sY0=;
        b=aEuqKwV/rmY4YqAy/tIs2fUTgKHxihECt3dKtKT6p4nkEgZ8fx36pLbEBLXKDX226r
         HwTNheE6IH2zpA5UfEbJ5jMcl9lzFNDwauRWV3+re5XdLM1msE1s8OYysokdg3mH2B/L
         d2g8XyAAI0xPmMr+MZRhZ7MTXZn/q5my17Mceh5Xw/6D/NUai6r0dBwX7f2dRsRUih0B
         Daz7edNP5eZ3gw80uzC9VmsCbGBFW/4+vLG05ziFoyIy2yaphmlfN/67egtH8XLuRqkk
         paIYJb1SGjXDh9ltKZzTxiyZtVC6Nusk6OmQT6XBoTFfMn1rMUDJoQy+s8SD5Y04uNj5
         nHgA==
X-Gm-Message-State: AOAM531y2kHJP3TEQVzAsOpdbuspvChsZv+5hYmmsrZLpP/fT0okkAkd
        MtFSCJjjoemypQej2mmB3faDLQ==
X-Google-Smtp-Source: ABdhPJz37LCWT9WiUPpq3gTOV9N1xZiHDeZSY4YJWCwNmcAE46U0jzuGtaZMivcP4GFcguje6Slfwg==
X-Received: by 2002:aa7:df09:: with SMTP id c9mr3736664edy.243.1631199650286;
        Thu, 09 Sep 2021 08:00:50 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id h8sm1139644ejj.22.2021.09.09.08.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 08:00:50 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Subject: [PATCH 1/4] media: uvcvideo: uvc_ctrl_is_accessible: check for INACTIVE
Date:   Thu,  9 Sep 2021 17:00:43 +0200
Message-Id: <20210909150046.57615-2-ribalda@chromium.org>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
In-Reply-To: <20210909150046.57615-1-ribalda@chromium.org>
References: <20210909150046.57615-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
USB device, which returns an invalid errorcode.

This fixes:
  warn: v4l2-test-controls.cpp(483): s_ctrl returned EIO
  warn: v4l2-test-controls.cpp(483): s_ctrl returned EIO
test VIDIOC_G/S_CTRL: OK
  warn: v4l2-test-controls.cpp(739): s_ext_ctrls returned EIO
  warn: v4l2-test-controls.cpp(739): s_ext_ctrls returned EIO
  warn: v4l2-test-controls.cpp(816): s_ext_ctrls returned EIO
test VIDIOC_G/S/TRY_EXT_CTRLS: OK

Tested with:
v4l2-ctl -c auto_exposure=1
OK
v4l2-ctl -c exposure_time_absolute=251
OK
v4l2-ctl -c auto_exposure=3
OK
v4l2-ctl -c exposure_time_absolute=251
VIDIOC_S_EXT_CTRLS: failed: Input/output error
exposure_time_absolute: Input/output error
ERROR
v4l2-ctl -c auto_exposure=3,exposure_time_absolute=251,auto_exposure=1
v4l2-ctl -C auto_exposure,exposure_time_absolute  
auto_exposure: 1
exposure_time_absolute: 251

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 47 +++++++++++++++++++++++++++++++-
 drivers/media/usb/uvc/uvc_v4l2.c |  4 +--
 drivers/media/usb/uvc/uvcvideo.h |  3 +-
 3 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 30bfe9069a1f..5f6aca7336d9 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1042,11 +1042,33 @@ static int uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
 	return 0;
 }
 
+/**
+ * uvc_ctrl_is_accessible() - Check if a control can be read/writen/tried.
+ * @chain: uvc_video_chain that the controls belong to.
+ * @v4l2_id: video4linux id of the control.
+ * @ctrl: Other controls that will be accessed in the ioctl.
+ * @ioctl: ioctl used to access the control.
+ *
+ * Check if a control can be accessed by a specicific ioctl operation,
+ * assuming that other controls are also going to be accessed by that ioctl.
+ * We need to check the value of the other controls, to support operations
+ * where a master value is changed with a slave value. Eg.
+ * auto_exposure=1,exposure_time_absolute=251
+ *
+ */
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
@@ -1061,6 +1083,29 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR) && !read)
 		return -EACCES;
 
+	if (read || try || !mapping->master_id)
+		return 0;
+
+	/*
+	 * Iterate backwards in cases where the master control is accessed
+	 * multiple times in the same ioctl. We want the last value.
+	 */
+	for (i = ctrls->count - 1; i >= 0; i--) {
+		if (ctrls->controls[i].id == mapping->master_id)
+			return ctrls->controls[i].value ==
+					mapping->master_manual ? 0 : -EACCES;
+	}
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
index 7a565a7371d2..ad0f422d6999 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -816,8 +816,8 @@ static int uvc_ctrl_check_access(struct uvc_video_chain *chain,
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
index e872e9a96faf..a087d66d2105 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -868,7 +868,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
 int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
-			   bool read);
+			   const struct v4l2_ext_controls *ctrls,
+			   unsigned long ioctl);
 
 int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 		      struct uvc_xu_control_query *xqry);
-- 
2.33.0.153.gba50c8fa24-goog

