Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B99AF340F2B
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 21:30:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233208AbhCRUaQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 16:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233079AbhCRU3j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 16:29:39 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C12C8C061761
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 13:29:38 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id dm8so8315020edb.2
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 13:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6u0H3HcjCN7wbvUeb6d+tjWfGi5XOQshuyE+ITzc2f8=;
        b=hOB40sW1gIDsdcmP+sjEngYg9atkRX8TyMVFLInTlxOkJRnSMYOFSpf9vE8tv7Uh1r
         hZbP/mX0x4PpzgGLSWHgoKGWrKMWigUxEP/Lan1xGIJm70HPz/lO1IPY55D8QUu1c+xB
         YZN0+rABBRrGH2grcijHhuA7mjw3tbvCs0y4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6u0H3HcjCN7wbvUeb6d+tjWfGi5XOQshuyE+ITzc2f8=;
        b=KkItHH/cFKJLmZvudGLNoA4q9o+PrLaYlP6PjuR3mDf6m3etIS47LaUeep0hPMh2Xy
         wkeyYeR0d20KL/KIrjMqA3X6OlGC5b/Tgp5ywZiLVjE8Ly26cIjJ23mIOZ+Tunb7f/lZ
         HAsVaoYcymC31/tm96NycztjHLDSpgxNcAldTibP6aSAzCKO8QPMcyrk5JUmC0KQ0Z71
         yzbPiD1heUoWvOTTOyKviwso4A/MSxMOsDU38DgtP5pfxw9eHNoK/QzDzbEW1ScqXbAR
         hyhqc3zWaP60IeAZdpAIe13mKsU7RTVy9vKPHZZdCjUdHtDSVSE7SObYpaJkaJm3OdPe
         xT1A==
X-Gm-Message-State: AOAM530rMnNrxRPXRBu28NWac9ng3WGrcN0PyInxx9EC/T2FgaVK728M
        BBambE/qACY4P5CK6p+yMq2wEw==
X-Google-Smtp-Source: ABdhPJznsh1KfYALMPp6j3sGExqTleqpyHHdSK/5aWUFj/gZ55+bxT8jkGJ5XAJgaBLCsqeRpQXaGw==
X-Received: by 2002:a05:6402:4386:: with SMTP id o6mr6098366edc.307.1616099377576;
        Thu, 18 Mar 2021 13:29:37 -0700 (PDT)
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
Subject: [PATCH v7 12/17] media: uvcvideo: Check controls flags before accessing them
Date:   Thu, 18 Mar 2021 21:29:23 +0100
Message-Id: <20210318202928.166955-13-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210318202928.166955-1-ribalda@chromium.org>
References: <20210318202928.166955-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We can figure out if reading/writing a set of controls can fail without
accessing them by checking their flags.

This way we can honor the API closer:

If an error is found when validating the list of controls passed with
VIDIOC_G_EXT_CTRLS, then error_idx shall be set to ctrls->count to
indicate to userspace that no actual hardware was touched.

Fixes v4l2-compliance:
Control ioctls (Input 0):
		warn: v4l2-test-controls.cpp(765): g_ext_ctrls(0) invalid error_idx 0
                fail: v4l2-test-controls.cpp(645): invalid error index write only control
        test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 22 ++++++++++++++++++
 drivers/media/usb/uvc/uvc_v4l2.c | 39 ++++++++++++++++++++++++++++----
 drivers/media/usb/uvc/uvcvideo.h |  2 ++
 3 files changed, 58 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 929e70dff11a..24fd5afc4e4f 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1046,6 +1046,28 @@ static int uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
 	return 0;
 }
 
+int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
+			   bool read)
+{
+	struct uvc_control_mapping *mapping;
+	struct uvc_control *ctrl;
+
+	if (__uvc_query_v4l2_class(chain, v4l2_id, 0) >= 0)
+		return -EACCES;
+
+	ctrl = uvc_find_control(chain, v4l2_id, &mapping);
+	if (!ctrl)
+		return -EINVAL;
+
+	if (!(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) && read)
+		return -EACCES;
+
+	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR) && !read)
+		return -EACCES;
+
+	return 0;
+}
+
 static const char *uvc_map_get_name(const struct uvc_control_mapping *map)
 {
 	const char *name;
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index ed262f61e6a6..fbb99f3c2fb4 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1045,6 +1045,26 @@ static int uvc_ioctl_s_ctrl(struct file *file, void *fh,
 	return 0;
 }
 
+static int uvc_ctrl_check_access(struct uvc_video_chain *chain,
+				 struct v4l2_ext_controls *ctrls,
+				 unsigned long ioctl)
+{
+	struct v4l2_ext_control *ctrl = ctrls->controls;
+	unsigned int i;
+	int ret = 0;
+
+	for (i = 0; i < ctrls->count; ++ctrl, ++i) {
+		ret = uvc_ctrl_is_accessible(chain, ctrl->id,
+					    ioctl == VIDIOC_G_EXT_CTRLS);
+		if (ret)
+			break;
+	}
+
+	ctrls->error_idx = ioctl == VIDIOC_TRY_EXT_CTRLS ? i : ctrls->count;
+
+	return ret;
+}
+
 static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 				 struct v4l2_ext_controls *ctrls)
 {
@@ -1054,6 +1074,10 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 	unsigned int i;
 	int ret;
 
+	ret = uvc_ctrl_check_access(chain, ctrls, VIDIOC_G_EXT_CTRLS);
+	if (ret < 0)
+		return ret;
+
 	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL) {
 		for (i = 0; i < ctrls->count; ++ctrl, ++i) {
 			struct v4l2_queryctrl qc = { .id = ctrl->id };
@@ -1090,13 +1114,17 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 
 static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
 				     struct v4l2_ext_controls *ctrls,
-				     bool commit)
+				     unsigned long ioctl)
 {
 	struct v4l2_ext_control *ctrl = ctrls->controls;
 	struct uvc_video_chain *chain = handle->chain;
 	unsigned int i;
 	int ret;
 
+	ret = uvc_ctrl_check_access(chain, ctrls, ioctl);
+	if (ret < 0)
+		return ret;
+
 	ret = uvc_ctrl_begin(chain);
 	if (ret < 0)
 		return ret;
@@ -1105,14 +1133,15 @@ static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
 		ret = uvc_ctrl_set(handle, ctrl);
 		if (ret < 0) {
 			uvc_ctrl_rollback(handle);
-			ctrls->error_idx = commit ? ctrls->count : i;
+			ctrls->error_idx = ioctl == VIDIOC_S_EXT_CTRLS ?
+						    ctrls->count : i;
 			return ret;
 		}
 	}
 
 	ctrls->error_idx = 0;
 
-	if (commit)
+	if (ioctl == VIDIOC_S_EXT_CTRLS)
 		return uvc_ctrl_commit(handle, ctrls->controls, ctrls->count);
 	else
 		return uvc_ctrl_rollback(handle);
@@ -1123,7 +1152,7 @@ static int uvc_ioctl_s_ext_ctrls(struct file *file, void *fh,
 {
 	struct uvc_fh *handle = fh;
 
-	return uvc_ioctl_s_try_ext_ctrls(handle, ctrls, true);
+	return uvc_ioctl_s_try_ext_ctrls(handle, ctrls, VIDIOC_S_EXT_CTRLS);
 }
 
 static int uvc_ioctl_try_ext_ctrls(struct file *file, void *fh,
@@ -1131,7 +1160,7 @@ static int uvc_ioctl_try_ext_ctrls(struct file *file, void *fh,
 {
 	struct uvc_fh *handle = fh;
 
-	return uvc_ioctl_s_try_ext_ctrls(handle, ctrls, false);
+	return uvc_ioctl_s_try_ext_ctrls(handle, ctrls, VIDIOC_TRY_EXT_CTRLS);
 }
 
 static int uvc_ioctl_querymenu(struct file *file, void *fh,
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index dc20021f7ee0..9471c342a310 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -902,6 +902,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
 
 int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
+int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
+			   bool read);
 
 int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 		      struct uvc_xu_control_query *xqry);
-- 
2.31.0.rc2.261.g7f71774620-goog

