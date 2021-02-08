Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFB9E3129EA
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 06:20:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbhBHFT7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 00:19:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbhBHFT5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Feb 2021 00:19:57 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5221C06178A;
        Sun,  7 Feb 2021 21:19:17 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id y10so7188163plk.7;
        Sun, 07 Feb 2021 21:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=It5Ch/nqC0qJ8EYUTBnD11LjDHOdhSlQ+XoGvBTRd6s=;
        b=jnySY9sJVNoFTy9SF3Y9LamrcgJ/Awy9JA5iyjA4UynBbnaEm+zJEzzZeZKmQ5XhzS
         rmqoU6bT7qlDXlTcxNZ/0JCXgUohaZ+9g9B8ofkDeBgJAFlXelIN+bGsoFXMS3/7N2C/
         kTW/oD0zHtazk8m4QdCksTwPpOkanEsqqCtAWzcbqaFuPrzhzI+tRmfGAwBp9zXeKOyL
         Arh4+1bOx55UEkKqG3WYd2ASN0vaCnRdoRqT95w2t7T8Hk4GTWf7AxrGYJc6pfEhD+PA
         js6HPLJMB3uYiFRjOkcDy64jSMjMDqvTqzLafPDL5AR5Ei31+qg6zx9vt+AuKQHMJDeB
         78UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=It5Ch/nqC0qJ8EYUTBnD11LjDHOdhSlQ+XoGvBTRd6s=;
        b=PG/lm25KOCWOM4T+wIb1z47UYqVTZ2bFEguqg6eQ8erfbF1j7h15eACUHP2iTBoQnz
         QUjMHGcDX9usx/BgOmeUOMHJsnaqntASCRUjls9t1MC9trxamB1uOU2UPQL+eM14Owhn
         MTLTg6uc6V2+8WbpcbMWjwY5YIKIddoEaSkxh0mIu2/3xvANMPSZ3KSjorbdArm8Qly2
         mcOladzlOV5YIxHpAF4dVHiUut+P47PXLjYbwqLTfCo3qDs8bTKD5msHzlrPtAqU2K9K
         Of8HGPTMPUNngMRMkCIYQRnsK+dOqVIrijOmx0m+pj8KR1PNpXwS51ae/UGPjP0wFH6N
         fYUA==
X-Gm-Message-State: AOAM531tmeaDzeovKZ4XaTY+vY2CsvBUjLvGJTMFpl4sQAMOiq+z/5/m
        mMvpivPOmTSRqa9mAzQ5/Pq8cFwElxhQNg==
X-Google-Smtp-Source: ABdhPJxc8wbfBYAODw/Hgw93VnAwvCNxjuSxrM1PqhrrwfPBUbOyszjqeP1KhzYrECTIrFR0N//fcQ==
X-Received: by 2002:a17:902:c9d2:b029:e2:ad28:65e8 with SMTP id q18-20020a170902c9d2b02900e2ad2865e8mr14810308pld.85.1612761557176;
        Sun, 07 Feb 2021 21:19:17 -0800 (PST)
Received: from localhost.localdomain ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id 1sm14644458pjk.34.2021.02.07.21.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 21:19:16 -0800 (PST)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        sergey.senozhatsky@gmail.com,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv2 3/3] media: uvcvideo: add UVC 1.5 ROI control
Date:   Mon,  8 Feb 2021 14:17:49 +0900
Message-Id: <20210208051749.1785246-4-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210208051749.1785246-1-sergey.senozhatsky@gmail.com>
References: <20210208051749.1785246-1-sergey.senozhatsky@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sergey Senozhatsky <senozhatsky@chromium.org>

This patch implements parts of UVC 1.5 Region of Interest (ROI)
control, using the uvcvideo selection API.

There are several things to mention here.

First, UVC 1.5 defines CT_DIGITAL_WINDOW_CONTROL; and ROI rectangle
coordinates "must be within the current Digital Window as specified
by the CT_WINDOW control."  (4.2.2.1.20 Digital Region of Interest
(ROI) Control.) This is not entirely clear if we need to implement
CT_DIGITAL_WINDOW_CONTROL. ROI is naturally limited by: ROI GET_MIN
and GET_MAX rectangles. Besides, the H/W that I'm playing with
implements ROI, but doesn't implement CT_DIGITAL_WINDOW_CONTROL,
so WINDOW_CONTROL is probably optional.

Second, the patch doesn't implement all of the ROI requests.
Namely, SEL_TGT_BOUNDS for ROI implements GET_MAX (that is maximal
ROI rectangle area). GET_MIN is not implemented (as of now) since
it's not very clear if user space would need such information.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 143 ++++++++++++++++++++++++++++++-
 1 file changed, 140 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 252136cc885c..71b4577196e5 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1139,14 +1139,60 @@ static int uvc_ioctl_querymenu(struct file *file, void *fh,
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
+};
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
+	case V4L2_SEL_TGT_ROI_DEFAULT:
+		query = UVC_GET_DEF;
+		break;
+	case V4L2_SEL_TGT_ROI_CURRENT:
+		query = UVC_GET_CUR;
+		break;
+	case V4L2_SEL_TGT_ROI_BOUNDS:
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
+		sel->r.left	= roi->left;
+		sel->r.top	= roi->top;
+		sel->r.width	= roi->right;
+		sel->r.height	= roi->bottom;
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
@@ -1173,6 +1219,96 @@ static int uvc_ioctl_g_selection(struct file *file, void *fh,
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
+	case V4L2_SEL_TGT_ROI_CURRENT:
+	case V4L2_SEL_TGT_ROI_DEFAULT:
+	case V4L2_SEL_TGT_ROI_BOUNDS:
+		return uvc_ioctl_g_roi_target(file, fh, sel);
+	}
+
+	return -EINVAL;
+}
+
+static bool validate_roi_bounds(struct uvc_streaming *stream,
+				struct v4l2_selection *sel)
+{
+	bool ok = true;
+
+	if (sel->r.left > USHRT_MAX || sel->r.top > USHRT_MAX ||
+	    sel->r.width > USHRT_MAX || sel->r.height > USHRT_MAX)
+		return false;
+
+	/* perhaps also can test against ROI GET_MAX */
+
+	mutex_lock(&stream->mutex);
+	if ((u16)sel->r.width > stream->cur_frame->wWidth)
+		ok = false;
+	if ((u16)sel->r.height > stream->cur_frame->wHeight)
+		ok = false;
+	mutex_unlock(&stream->mutex);
+
+	return ok;
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
+	roi->left	= sel->r.left;
+	roi->top	= sel->r.top;
+	roi->right	= sel->r.width;
+	roi->bottom	= sel->r.height;
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
@@ -1533,6 +1669,7 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
 	.vidioc_try_ext_ctrls = uvc_ioctl_try_ext_ctrls,
 	.vidioc_querymenu = uvc_ioctl_querymenu,
 	.vidioc_g_selection = uvc_ioctl_g_selection,
+	.vidioc_s_selection = uvc_ioctl_s_selection,
 	.vidioc_g_parm = uvc_ioctl_g_parm,
 	.vidioc_s_parm = uvc_ioctl_s_parm,
 	.vidioc_enum_framesizes = uvc_ioctl_enum_framesizes,
-- 
2.30.0

