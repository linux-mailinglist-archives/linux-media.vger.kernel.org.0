Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52D8A36F940
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 13:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231935AbhD3L1Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 07:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231877AbhD3L1X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 07:27:23 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FA98C06138B
        for <linux-media@vger.kernel.org>; Fri, 30 Apr 2021 04:26:35 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id p4so758071pfo.3
        for <linux-media@vger.kernel.org>; Fri, 30 Apr 2021 04:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tWbnebzY/SCalv5CLDUzsq2VSK849EXYk/c3zQI/mpY=;
        b=SUkqYNMflQ276DJ4ik+rnlG2BUrmkiNNxiv3+bdrpXQLiHhAHDrCIAb/guz6qe+m1h
         KLDt3E9xFYG1FGlOIW7hmuIk69/X+pv3FZh2gdPsCjZsTFhsRsWQnCpBiMIXb5zV2gz7
         pwpM671vRQ4OrZHM901/l+lKVm/4ziPjnnpak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tWbnebzY/SCalv5CLDUzsq2VSK849EXYk/c3zQI/mpY=;
        b=XtkFrSPv1uLlnU8r2WRUY1m6KXY6oro1RV+woLfRur88iRfo5uhnbxJUMgy0WiDKQ4
         BX3ap85bAnItMyjHIQhrFAiQ0O/JY/3qark9BnFs3AOPaHKYn9eFfQa5zSW44sz9X74e
         rzpifvfKKHcTNBt/bZOPgQnuqZztJMPpmvEuDExu3LP9niE26eWcl+xd+DeXO1HOovfG
         bgoM57TQ99aZKwnmIPTlQxhAGJ9ELvLa+h3Cod6XTnMntVQkoDfkcpaVWiPr9bP7YkUq
         5L7CSsNcs2Kjkh+HbeExBwzbJVCpqwjiD5z7Rzr/Biuih1ZZvXfbVe/IW8ZpNqBcIwjl
         54dQ==
X-Gm-Message-State: AOAM5320KhJqQFX59+vebq6c0k2vJk2cvyR2/WuSZSHMcp8wgIarwsL9
        rrUJK2ieuHQdnRLU6XJ3z90UAQ==
X-Google-Smtp-Source: ABdhPJwiW+KMFAzt34715myGZwmix+KKr58KHtttwGkYaM7iqy4nz6R6dJaSGzOx7Riwt7eoFSHOpA==
X-Received: by 2002:a05:6a00:16c5:b029:280:4678:5c94 with SMTP id l5-20020a056a0016c5b029028046785c94mr4509105pfc.18.1619781994916;
        Fri, 30 Apr 2021 04:26:34 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:2c33:77c9:7bef:267e])
        by smtp.gmail.com with ESMTPSA id l10sm1809457pjy.42.2021.04.30.04.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 04:26:34 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv4 5/5] media: uvcvideo: add UVC 1.5 ROI control
Date:   Fri, 30 Apr 2021 20:26:11 +0900
Message-Id: <20210430112611.475039-6-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
In-Reply-To: <20210430112611.475039-1-senozhatsky@chromium.org>
References: <20210430112611.475039-1-senozhatsky@chromium.org>
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
 drivers/media/usb/uvc/uvc_v4l2.c | 185 ++++++++++++++++++++++++++++++-
 1 file changed, 182 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 252136cc885c..eb4e306d7a38 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1139,14 +1139,73 @@ static int uvc_ioctl_querymenu(struct file *file, void *fh,
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
@@ -1173,6 +1232,125 @@ static int uvc_ioctl_g_selection(struct file *file, void *fh,
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
@@ -1533,6 +1711,7 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
 	.vidioc_try_ext_ctrls = uvc_ioctl_try_ext_ctrls,
 	.vidioc_querymenu = uvc_ioctl_querymenu,
 	.vidioc_g_selection = uvc_ioctl_g_selection,
+	.vidioc_s_selection = uvc_ioctl_s_selection,
 	.vidioc_g_parm = uvc_ioctl_g_parm,
 	.vidioc_s_parm = uvc_ioctl_s_parm,
 	.vidioc_enum_framesizes = uvc_ioctl_enum_framesizes,
-- 
2.31.1.527.g47e6f16901-goog

