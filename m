Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7DCE341522
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 06:54:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233960AbhCSFyQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 01:54:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233913AbhCSFyE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 01:54:04 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24FDAC06174A
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 22:54:04 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id mz6-20020a17090b3786b02900c16cb41d63so4323931pjb.2
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 22:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nN3cyypD50YIer7R6hJ7b5NtipMav+xNrUBvw8Xf75k=;
        b=RUVhBkNNCKfY5LsCwBttb3GCaoAb2QQoiS7zXktBU+mkbVQrDL3FzWjDjCSeAu9O+M
         bY3UZK6zg6F2qRg4xddcOc520JLN3uKzPk1uTq97m8ypN9Ja80AUveRgvCFEIqshNVdX
         Jtiw5IIbjWk/A/mBaMvuhlfb3l/a6xjhzyncA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nN3cyypD50YIer7R6hJ7b5NtipMav+xNrUBvw8Xf75k=;
        b=GQFNUSO5LvYX+ftOUC57eN6H23iU98j0YD4+4GmIJn0Boz5rBSQsagj6xrEyDBEhvV
         xx6HUrsjbrOiEKZsu/WX/gju8pVvcEnnB34PQPQsjEf8G87MAg1FGQcft71NQghSa1l+
         oKd5NOo3oiAtGxvqa3EqlgXL6R3YSyFwo8RLn15uOHCEwSxXvG/gv0xNIaqLQhHaX2Jd
         9LOZowTelzNbsPAtqsxP6dBwifHGYbzAjJMoYrL17yvFqiwSSl/x2BpogHEFVmyndeTO
         +ZyyKe/79Zv7ImnmTI6taLtElhiqTS9r0KTTHbzW6dDzpGG8eCN0RSRcWl0bvjEK/vgz
         TfKA==
X-Gm-Message-State: AOAM533ysBd/FGHuWKBk20gHJCM83/Etr3xQAOwqwWtnhAz8XHH6DIfy
        NM202neNjDbVQHtW1D8tNYal2w==
X-Google-Smtp-Source: ABdhPJzXyIANw3Xu3yt4hSLEe7n6BV56rGQo1GcEl1h9jvcceyFcjoYIOHmZPNGSNwv9ZC44kRNpUw==
X-Received: by 2002:a17:90a:c201:: with SMTP id e1mr8079682pjt.30.1616133243755;
        Thu, 18 Mar 2021 22:54:03 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:6577:f83d:5865:dfac])
        by smtp.gmail.com with ESMTPSA id o13sm4043704pgv.40.2021.03.18.22.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 22:54:03 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 5/6] media: uvcvideo: add UVC 1.5 ROI control
Date:   Fri, 19 Mar 2021 14:53:41 +0900
Message-Id: <20210319055342.127308-6-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210319055342.127308-1-senozhatsky@chromium.org>
References: <20210319055342.127308-1-senozhatsky@chromium.org>
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
rectangle and selection flags represent ROI auto-controls.
User-space is required to set valid values for both rectangle
and auto-controls every time SET_CUR is issued.

Usage example:

       struct v4l2_selection roi = {0, };

       roi.target     = V4L2_SEL_TGT_ROI;
       roi.r.left     = 0;
       roi.r.top      = 0;
       roi.r.width    = 42;
       roi.r.height   = 42;
       roi.flags      = V4L2_SEL_FLAG_ROI_AUTO_EXPOSURE;

       ioctl(fd, VIDIOC_S_SELECTION, &roi);

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 147 ++++++++++++++++++++++++++++++-
 include/uapi/linux/usb/video.h   |   1 +
 2 files changed, 145 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 252136cc885c..d0fe6c33fab6 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1139,14 +1139,66 @@ static int uvc_ioctl_querymenu(struct file *file, void *fh,
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
+	ret = uvc_query_ctrl(stream->dev, query, 1, stream->dev->intfnum,
+			     UVC_CT_REGION_OF_INTEREST_CONTROL, roi,
+			     sizeof(struct uvc_roi_rect));
+	if (!ret) {
+		/* ROI left, top, right, bottom are global coordinates. */
+		sel->r.left	= roi->left;
+		sel->r.top	= roi->top;
+		sel->r.width	= roi->right - roi->left + 1;
+		sel->r.height	= roi->bottom - roi->top + 1;
+		sel->flags	= roi->auto_controls;
+	}
+
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
@@ -1173,6 +1225,94 @@ static int uvc_ioctl_g_selection(struct file *file, void *fh,
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
+static bool validate_roi_bounds(struct uvc_streaming *stream,
+				struct v4l2_selection *sel)
+{
+	if (sel->r.left > USHRT_MAX ||
+	    sel->r.top > USHRT_MAX ||
+	    (sel->r.width + sel->r.left) > USHRT_MAX ||
+	    (sel->r.height + sel->r.top) > USHRT_MAX ||
+	    !sel->r.width || !sel->r.height)
+		return false;
+
+	if (sel->flags > V4L2_SEL_FLAG_ROI_AUTO_HIGHER_QUALITY)
+		return false;
+
+	return true;
+}
+
+static int uvc_ioctl_s_roi(struct file *file, void *fh,
+			   struct v4l2_selection *sel)
+{
+	struct uvc_fh *handle = fh;
+	struct uvc_streaming *stream = handle->stream;
+	struct uvc_roi_rect *roi;
+	int ret;
+
+	if (!validate_roi_bounds(stream, sel))
+		return -E2BIG;
+
+	roi = kzalloc(sizeof(struct uvc_roi_rect), GFP_KERNEL);
+	if (!roi)
+		return -ENOMEM;
+
+	/* ROI left, top, right, bottom are global coordinates. */
+	roi->left		= sel->r.left;
+	roi->top		= sel->r.top;
+	roi->right		= sel->r.width + sel->r.left - 1;
+	roi->bottom		= sel->r.height + sel->r.top - 1;
+	roi->auto_controls	= sel->flags;
+
+	ret = uvc_query_ctrl(stream->dev, UVC_SET_CUR, 1, stream->dev->intfnum,
+			     UVC_CT_REGION_OF_INTEREST_CONTROL, roi,
+			     sizeof(struct uvc_roi_rect));
+
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
@@ -1533,6 +1673,7 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
 	.vidioc_try_ext_ctrls = uvc_ioctl_try_ext_ctrls,
 	.vidioc_querymenu = uvc_ioctl_querymenu,
 	.vidioc_g_selection = uvc_ioctl_g_selection,
+	.vidioc_s_selection = uvc_ioctl_s_selection,
 	.vidioc_g_parm = uvc_ioctl_g_parm,
 	.vidioc_s_parm = uvc_ioctl_s_parm,
 	.vidioc_enum_framesizes = uvc_ioctl_enum_framesizes,
diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/video.h
index d854cb19c42c..c87624962896 100644
--- a/include/uapi/linux/usb/video.h
+++ b/include/uapi/linux/usb/video.h
@@ -104,6 +104,7 @@
 #define UVC_CT_ROLL_ABSOLUTE_CONTROL			0x0f
 #define UVC_CT_ROLL_RELATIVE_CONTROL			0x10
 #define UVC_CT_PRIVACY_CONTROL				0x11
+#define UVC_CT_REGION_OF_INTEREST_CONTROL		0x14
 
 /* A.9.5. Processing Unit Control Selectors */
 #define UVC_PU_CONTROL_UNDEFINED			0x00
-- 
2.31.0.rc2.261.g7f71774620-goog

