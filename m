Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25F67370663
	for <lists+linux-media@lfdr.de>; Sat,  1 May 2021 10:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231927AbhEAIVX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 May 2021 04:21:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231871AbhEAIVN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 May 2021 04:21:13 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D69FC061342
        for <linux-media@vger.kernel.org>; Sat,  1 May 2021 01:20:24 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id y1so200526plg.11
        for <linux-media@vger.kernel.org>; Sat, 01 May 2021 01:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CHYuxRMx2G9OxlyPukHJZmXS6/yVwJCnqXBPckFpWCE=;
        b=PdbQEM9YM85rtzmOupYskTDyBpLhtZYnL6O0x9TVMbo+ZsuPGODn5naX8HbNoNuiTy
         dT1gSX/E0dTAR0jSej+P17bjIMNZ1zBsCZLmJ/C0q4WhWWkMD2/fu05Bl5RTtdssuUge
         Y8GB5NPqhVmTCFTPQMvnrbgJpm+PSYC2SXL8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CHYuxRMx2G9OxlyPukHJZmXS6/yVwJCnqXBPckFpWCE=;
        b=rWQZKqThDQDhIDprvxzWKfBA4rEkIO31QXy070VUiJM+X3m+bsepee+ceQQ1Tc2W3g
         dn6czmDdk3xvS7lGy9axCFLxzOjegPkQPAq+Sv3wDvFAM+B3I0C9Yc7lbs6X2FKR0Dz/
         buAPYZWkE4awagPslQ5ummMEMinIlQ1vckB0BsLD97RDL0wjCStrmdboB0jT6+JIHgrM
         LrLk2S9bm//wF6jiVDpJm8H5+WPUBOBXWTFJDPEx2sy0iNGQv9wEITTHyMwAXcfoZO6y
         3ghSnt37oSrLOqaukSpyiN+zakAvtdv+643f34VYOi2KIPrtQ1bbpfkc8kdkHcM88UKN
         LhmA==
X-Gm-Message-State: AOAM533F7wV1F/R6DJnToAGeuZnpWy2uO35jAdra1+Y1rnlLSd8Eg6QQ
        Fp1FeIhqdE9NgNHA0E0bcZNoGg==
X-Google-Smtp-Source: ABdhPJyJDe+88t94rta+S8dgXEEsG4BXtzagK2NUaIBnYm9XrgkHavMREOqg72oCEwJPvZl7jtmF7A==
X-Received: by 2002:a17:90b:4a4e:: with SMTP id lb14mr18610347pjb.115.1619857223705;
        Sat, 01 May 2021 01:20:23 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:8be7:e987:d00a:1442])
        by smtp.gmail.com with ESMTPSA id b7sm3763003pjq.36.2021.05.01.01.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 01:20:23 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv5 5/5] media: uvcvideo: add UVC 1.5 ROI control
Date:   Sat,  1 May 2021 17:20:01 +0900
Message-Id: <20210501082001.100533-6-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
In-Reply-To: <20210501082001.100533-1-senozhatsky@chromium.org>
References: <20210501082001.100533-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch implements UVC 1.5 Region of Interest (ROI) control.

Note that, UVC 1.5 defines CT_DIGITAL_WINDOW_CONTROL controls
and mentions that ROI rectangle coordinates "must be within
the current Digital Window as specified by the CT_WINDOW control."
(4.2.2.1.20 Digital Region of Interest (ROI) Control).

It's is not entirely clear if we need to implement WINDOW_CONTROL.
ROI is naturally limited by GET_MIN and GET_MAX rectangles.

Another thing to note is that ROI support is implemented as
V4L2 selection target: selection rectangle represents ROI
rectangle.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 189 ++++++++++++++++++++++++++++++-
 1 file changed, 186 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 252136cc885c..fc2ccc144cdd 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1139,14 +1139,74 @@ static int uvc_ioctl_querymenu(struct file *file, void *fh,
 	return uvc_query_v4l2_menu(chain, qm);
 }
 
-static int uvc_ioctl_g_selection(struct file *file, void *fh,
-				 struct v4l2_selection *sel)
+/* UVC 1.5 ROI rectangle is half the size of v4l2_rect */
+struct uvc_roi_rect {
+	__u16			top;
+	__u16			left;
+	__u16			bottom;
+	__u16			right;
+	__u16			auto_controls;
+} __packed;
+
+static int uvc_ioctl_g_roi_target(struct file *file, void *fh,
+				  struct v4l2_selection *sel)
 {
 	struct uvc_fh *handle = fh;
 	struct uvc_streaming *stream = handle->stream;
+	struct uvc_video_chain *chain = handle->chain;
+	struct uvc_roi_rect *roi;
+	u8 query;
+	int ret;
 
-	if (sel->type != stream->type)
+	switch (sel->target) {
+	case V4L2_SEL_TGT_ROI:
+		query = UVC_GET_CUR;
+		break;
+	case V4L2_SEL_TGT_ROI_DEFAULT:
+		query = UVC_GET_DEF;
+		break;
+	case V4L2_SEL_TGT_ROI_BOUNDS_MIN:
+		query = UVC_GET_MAX;
+		break;
+	case V4L2_SEL_TGT_ROI_BOUNDS_MAX:
+		query = UVC_GET_MAX;
+		break;
+	default:
 		return -EINVAL;
+	}
+
+	/* hcd requires transfer buffer to be DMA capable */
+	roi = kzalloc(sizeof(struct uvc_roi_rect), GFP_KERNEL);
+	if (!roi)
+		return -ENOMEM;
+
+	/*
+	 * Synchronize with uvc_ioctl_query_ext_ctrl() that can set
+	 * ROI auto_controls concurrently.
+	 */
+	mutex_lock(&chain->ctrl_mutex);
+
+	ret = uvc_query_ctrl(stream->dev, query, 1, stream->dev->intfnum,
+			     UVC_CT_REGION_OF_INTEREST_CONTROL, roi,
+			     sizeof(struct uvc_roi_rect));
+	if (!ret) {
+		/* ROI left, top, right, bottom are global coordinates. */
+		sel->r.left	= roi->left;
+		sel->r.top	= roi->top;
+		sel->r.width	= roi->right - roi->left + 1;
+		sel->r.height	= roi->bottom - roi->top + 1;
+	}
+
+	mutex_unlock(&chain->ctrl_mutex);
+	kfree(roi);
+	return ret;
+}
+
+static int uvc_ioctl_g_sel_target(struct file *file, void *fh,
+				  struct v4l2_selection *sel)
+{
+	struct uvc_fh *handle = fh;
+	struct uvc_streaming *stream = handle->stream;
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP_DEFAULT:
@@ -1173,6 +1233,128 @@ static int uvc_ioctl_g_selection(struct file *file, void *fh,
 	return 0;
 }
 
+static int uvc_ioctl_g_selection(struct file *file, void *fh,
+				 struct v4l2_selection *sel)
+{
+	struct uvc_fh *handle = fh;
+	struct uvc_streaming *stream = handle->stream;
+
+	if (sel->type != stream->type)
+		return -EINVAL;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
+	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
+		return uvc_ioctl_g_sel_target(file, fh, sel);
+	case V4L2_SEL_TGT_ROI:
+	case V4L2_SEL_TGT_ROI_DEFAULT:
+	case V4L2_SEL_TGT_ROI_BOUNDS_MIN:
+	case V4L2_SEL_TGT_ROI_BOUNDS_MAX:
+		return uvc_ioctl_g_roi_target(file, fh, sel);
+	}
+
+	return -EINVAL;
+}
+
+static void validate_roi_bounds(struct uvc_streaming *stream,
+				struct v4l2_selection *sel)
+{
+	lockdep_assert_held(&stream->mutex);
+
+	if (sel->r.left > USHRT_MAX)
+		sel->r.left = 0;
+
+	if (sel->r.top > USHRT_MAX)
+		sel->r.top = 0;
+
+	if (sel->r.width + sel->r.left > USHRT_MAX || !sel->r.width) {
+		sel->r.left = 0;
+		sel->r.width = stream->cur_frame->wWidth;
+	}
+
+	if (sel->r.height + sel->r.top > USHRT_MAX || !sel->r.height) {
+		sel->r.top = 0;
+		sel->r.height = stream->cur_frame->wHeight;
+	}
+}
+
+static int uvc_ioctl_s_roi(struct file *file, void *fh,
+			   struct v4l2_selection *sel)
+{
+	struct uvc_fh *handle = fh;
+	struct uvc_streaming *stream = handle->stream;
+	struct uvc_video_chain *chain = handle->chain;
+	struct uvc_roi_rect *roi;
+	int ret;
+
+	/* hcd requires transfer buffer to be DMA capable */
+	roi = kzalloc(sizeof(struct uvc_roi_rect), GFP_KERNEL);
+	if (!roi)
+		return -ENOMEM;
+
+	/*
+	 * Synchronize with uvc_ioctl_query_ext_ctrl() that can set
+	 * ROI auto_controls concurrently.
+	 */
+	mutex_lock(&chain->ctrl_mutex);
+
+	/*
+	 * Get current ROI configuration. We are especially interested in
+	 * ->auto_controls, because we will use GET_CUR ->auto_controls
+	 * value for SET_CUR. Some firmwares require sizeof(uvc_roi_rect)
+	 * to be 5 * sizeof(__u16) so we need to set correct rectangle
+	 * dimensions and correct auto_controls value.
+	 */
+	ret = uvc_query_ctrl(stream->dev, UVC_GET_CUR, 1, stream->dev->intfnum,
+			     UVC_CT_REGION_OF_INTEREST_CONTROL, roi,
+			     sizeof(struct uvc_roi_rect));
+	if (ret)
+		goto out;
+
+	mutex_lock(&stream->mutex);
+
+	validate_roi_bounds(stream, sel);
+
+	/*
+	 * ROI left, top, right, bottom are global coordinates.
+	 * Note that we use ->auto_controls value which we read earlier.
+	 */
+	roi->left		= sel->r.left;
+	roi->top		= sel->r.top;
+	roi->right		= sel->r.width + sel->r.left - 1;
+	roi->bottom		= sel->r.height + sel->r.top - 1;
+
+	ret = uvc_query_ctrl(stream->dev, UVC_SET_CUR, 1, stream->dev->intfnum,
+			     UVC_CT_REGION_OF_INTEREST_CONTROL, roi,
+			     sizeof(struct uvc_roi_rect));
+
+	mutex_unlock(&stream->mutex);
+
+out:
+	mutex_unlock(&chain->ctrl_mutex);
+	kfree(roi);
+	return ret;
+}
+
+static int uvc_ioctl_s_selection(struct file *file, void *fh,
+				 struct v4l2_selection *sel)
+{
+	struct uvc_fh *handle = fh;
+	struct uvc_streaming *stream = handle->stream;
+
+	if (sel->type != stream->type)
+		return -EINVAL;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_ROI:
+		return uvc_ioctl_s_roi(file, fh, sel);
+	}
+
+	return -EINVAL;
+}
+
 static int uvc_ioctl_g_parm(struct file *file, void *fh,
 			    struct v4l2_streamparm *parm)
 {
@@ -1533,6 +1715,7 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
 	.vidioc_try_ext_ctrls = uvc_ioctl_try_ext_ctrls,
 	.vidioc_querymenu = uvc_ioctl_querymenu,
 	.vidioc_g_selection = uvc_ioctl_g_selection,
+	.vidioc_s_selection = uvc_ioctl_s_selection,
 	.vidioc_g_parm = uvc_ioctl_g_parm,
 	.vidioc_s_parm = uvc_ioctl_s_parm,
 	.vidioc_enum_framesizes = uvc_ioctl_enum_framesizes,
-- 
2.31.1.527.g47e6f16901-goog

