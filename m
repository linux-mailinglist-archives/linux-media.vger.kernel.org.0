Return-Path: <linux-media+bounces-23016-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E85C9EACDB
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 10:49:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A375169D54
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 09:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3449237A5F;
	Tue, 10 Dec 2024 09:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f0af1yjh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2F42253F7
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 09:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733823789; cv=none; b=reQh3xat5q7mD1Hyfx5t23dptXUBEulJcs2Q4j/69HoiEHuJFIBwwKKuFY+ckirv8O62msvEjw4gTBeUq8+xdRWrIRM7ps0UFFbcltJlQ86GyvnGTD1Q2PTEoNHJSFWdE7M9T/TEw4qPYwvVtXx08mCK9Ml9lZPoRZqlrgSwNHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733823789; c=relaxed/simple;
	bh=HryVrfF4ja+UE4Nf++7Oms3/m6HrslBSeTxh251rrlM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KE9XtMey66Xnpxc7TII/ITVNeOXKXXaE4hEYDYaxiIKpuUP9oAkvUy+mmOnD6m0GjGtCD74TfS2WWmRpN0JpfXPHcY0tiaNhJUjYeCSyyccrSr+hq6PrNpZqHyF5Df0SaPAZHv9X9DMsXYJl/pI4GHSZDRbz8kzmiQ03xQR8omY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=f0af1yjh; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6d8fa32d3d6so36791586d6.2
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 01:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733823786; x=1734428586; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2aUprzMfZUWIyjxGkmKCAmM/uBFiYLCsY67DDg7bs5I=;
        b=f0af1yjhXQk3n/QhWxnOwXAk86JDvwdsC9G9REOtCneE3HR/fvHr1WL8vb5MtzQx5i
         5ippmVTwnw9GX7WqHldvZKeLNIh7HBknE99q2rjkl2kcXVT9N48dlKLc1XPT89ZdClu/
         rTIYfahCmL4h6JthpJ8p6q/VB8Gd52FDYYjAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733823786; x=1734428586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2aUprzMfZUWIyjxGkmKCAmM/uBFiYLCsY67DDg7bs5I=;
        b=CuS9JVnSV5IWL6Bv0dhT6Nou/uiHdwF8z2W+tKeVrpuQ8c1HIXrLa2dz7foq8L7qCp
         ksTZ83QGIEUtnztQXYP0OLG0v38Guv9ClLc/jmzvDiRb8BBRiv1JRS9HmKQzJ0d6qwAc
         XZuaK7xjTeJgSkdLsMjrdfLddqRX6ZEFp7a3dsfDtNbCexLXh0ZUKtEMurnt2wQ4mpG7
         1jy2w1z1yJKtgM5VxDvIyiFTzrHFSTGSzLg4nOF8qPFtBReqLI5GMNDwAyxyqBLXhzFu
         QOG/RkwA80ykUMOwirCASbMX5enH2Lz8njBNcHyH4bdyfuLzoa6NlbapP8tdiGTNcRg/
         8V5w==
X-Forwarded-Encrypted: i=1; AJvYcCX0a7BYF2MVa4WA8hx+VoXZ9YX6V/krworS4OtSZL3tPyKXD3ZcsBuoP4wm3QjSIMv2NnfQnQfI8llPHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVS358v1F4wXyif3AN87nEUkw6UqyId5skubnVrHDDOGEz5qwL
	a2Xf7gUkTY5ttokEp2ZXztSXKbSDJlqBL6lvGXSDGXZu1iOtb3uXzYlBqd7jew==
X-Gm-Gg: ASbGncvpLe7lqVIYihGgyrmJZM0qkUmkNU4J7f9FDsQFPynH84Ep5JUj9ADo0A1bT7f
	C6P+TaeRZn7Nz/2Bs6CJ2nUJCD5Y2paMdj71iE+yNO+l0vCklSHypbMHN5BZPlQ+ZRV9P5nhcCj
	hQROWmmbaHEU+CcZbsM30VktGaMK6e6ciTXGvKOSucMZ4zGgEvVY9xw6V22FxI1ckfcyVnWSikt
	7oMghPDEpbU+WXoW/2hWGjoc1eagD3EmVZ/lotSHAQwLUi3CpHhQBLKsDfwCjugGPHG9DBBjRwv
	FPsiGieneYA5yQWrdQ/nnkAb2QSM
X-Google-Smtp-Source: AGHT+IEV5cazRGN6FSky6OmAJjjskESsyqTGoGeNqQvsriM6DHVN+Snh/fT73/JwaEBDp9NXdAYkiw==
X-Received: by 2002:a05:6214:f06:b0:6d8:ab7e:e55e with SMTP id 6a1803df08f44-6d91e40b22amr56041826d6.34.1733823785890;
        Tue, 10 Dec 2024 01:43:05 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d92f7c2bc1sm773326d6.83.2024.12.10.01.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:43:05 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:42:53 +0000
Subject: [PATCH v16 17/18] media: uvcvideo: implement UVC v1.5 ROI
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241210-uvc-roi-v16-17-e8201f7e8e57@chromium.org>
References: <20241210-uvc-roi-v16-0-e8201f7e8e57@chromium.org>
In-Reply-To: <20241210-uvc-roi-v16-0-e8201f7e8e57@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Yunke Cao <yunkec@google.com>
X-Mailer: b4 0.13.0

From: Yunke Cao <yunkec@google.com>

Implement support for ROI as described in UVC 1.5:
4.2.2.1.20 Digital Region of Interest (ROI) Control

ROI control is implemented using V4L2 control API as
two UVC-specific controls:
V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Yunke Cao <yunkec@google.com>
Tested-by: Yunke Cao <yunkec@google.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c   | 81 ++++++++++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |  7 ++++
 include/uapi/linux/usb/video.h     |  1 +
 include/uapi/linux/uvcvideo.h      | 13 ++++++
 include/uapi/linux/v4l2-controls.h |  7 ++++
 5 files changed, 109 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index dd6129becf58..86ea24b10b54 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -358,6 +358,24 @@ static const struct uvc_control_info uvc_ctrls[] = {
 		.flags		= UVC_CTRL_FLAG_GET_CUR
 				| UVC_CTRL_FLAG_AUTO_UPDATE,
 	},
+	/*
+	 * UVC_CTRL_FLAG_AUTO_UPDATE is needed because the RoI may get updated
+	 * by sensors.
+	 * "This RoI should be the same as specified in most recent SET_CUR
+	 * except in the case where the ‘Auto Detect and Track’ and/or
+	 * ‘Image Stabilization’ bit have been set."
+	 * 4.2.2.1.20 Digital Region of Interest (ROI) Control
+	 */
+	{
+		.entity		= UVC_GUID_UVC_CAMERA,
+		.selector	= UVC_CT_REGION_OF_INTEREST_CONTROL,
+		.index		= 21,
+		.size		= 10,
+		.flags		= UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_CUR
+				| UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX
+				| UVC_CTRL_FLAG_GET_DEF
+				| UVC_CTRL_FLAG_AUTO_UPDATE,
+	},
 };
 
 static const u32 uvc_control_classes[] = {
@@ -603,6 +621,44 @@ static const struct uvc_control_mapping *uvc_ctrl_filter_plf_mapping(
 	return out_mapping;
 }
 
+static int uvc_get_rect(struct uvc_control_mapping *mapping, u8 query,
+			const void *uvc_in, size_t v4l2_size, void *v4l2_out)
+{
+	const struct uvc_rect *uvc_rect = uvc_in;
+	struct v4l2_rect *v4l2_rect = v4l2_out;
+
+	if (WARN_ON(v4l2_size != sizeof(struct v4l2_rect)))
+		return -EINVAL;
+
+	if (uvc_rect->left > uvc_rect->right ||
+	    uvc_rect->top > uvc_rect->bottom)
+		return -EIO;
+
+	v4l2_rect->top = uvc_rect->top;
+	v4l2_rect->left = uvc_rect->left;
+	v4l2_rect->height = uvc_rect->bottom - uvc_rect->top + 1;
+	v4l2_rect->width = uvc_rect->right - uvc_rect->left + 1;
+
+	return 0;
+}
+
+static int uvc_set_rect(struct uvc_control_mapping *mapping, size_t v4l2_size,
+			const void *v4l2_in, void *uvc_out)
+{
+	struct uvc_rect *uvc_rect = uvc_out;
+	const struct v4l2_rect *v4l2_rect = v4l2_in;
+
+	if (WARN_ON(v4l2_size != sizeof(struct v4l2_rect)))
+		return -EINVAL;
+
+	uvc_rect->top = min(0xffff, v4l2_rect->top);
+	uvc_rect->left = min(0xffff, v4l2_rect->left);
+	uvc_rect->bottom = min(0xffff, v4l2_rect->top + v4l2_rect->height - 1);
+	uvc_rect->right = min(0xffff, v4l2_rect->left + v4l2_rect->width - 1);
+
+	return 0;
+}
+
 static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	{
 		.id		= V4L2_CID_BRIGHTNESS,
@@ -897,6 +953,28 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
 		.filter_mapping	= uvc_ctrl_filter_plf_mapping,
 	},
+	{
+		.id		= V4L2_CID_UVC_REGION_OF_INTEREST_RECT,
+		.entity		= UVC_GUID_UVC_CAMERA,
+		.selector	= UVC_CT_REGION_OF_INTEREST_CONTROL,
+		.size		= sizeof(struct uvc_rect) * 8,
+		.offset		= 0,
+		.v4l2_type	= V4L2_CTRL_TYPE_RECT,
+		.data_type	= UVC_CTRL_DATA_TYPE_RECT,
+		.get		= uvc_get_rect,
+		.set		= uvc_set_rect,
+		.name		= "Region Of Interest Rectangle",
+	},
+	{
+		.id		= V4L2_CID_UVC_REGION_OF_INTEREST_AUTO,
+		.entity		= UVC_GUID_UVC_CAMERA,
+		.selector	= UVC_CT_REGION_OF_INTEREST_CONTROL,
+		.size		= 16,
+		.offset		= 64,
+		.v4l2_type	= V4L2_CTRL_TYPE_BITMASK,
+		.data_type	= UVC_CTRL_DATA_TYPE_BITMASK,
+		.name		= "Region Of Interest Auto Controls",
+	},
 };
 
 /* ------------------------------------------------------------------------
@@ -1473,6 +1551,9 @@ static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
 
 static size_t uvc_mapping_v4l2_size(struct uvc_control_mapping *mapping)
 {
+	if (mapping->v4l2_type == V4L2_CTRL_TYPE_RECT)
+		return sizeof(struct v4l2_rect);
+
 	if (uvc_ctrl_mapping_is_compound(mapping))
 		return DIV_ROUND_UP(mapping->size, 8);
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 8aca1a2fe587..17b79108599f 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -538,6 +538,13 @@ struct uvc_device_info {
 	u16	uvc_version;
 };
 
+struct uvc_rect {
+	u16 top;
+	u16 left;
+	u16 bottom;
+	u16 right;
+} __packed;
+
 struct uvc_status_streaming {
 	u8	button;
 } __packed;
diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/video.h
index 2ff0e8a3a683..2afb4420e6c4 100644
--- a/include/uapi/linux/usb/video.h
+++ b/include/uapi/linux/usb/video.h
@@ -104,6 +104,7 @@
 #define UVC_CT_ROLL_ABSOLUTE_CONTROL			0x0f
 #define UVC_CT_ROLL_RELATIVE_CONTROL			0x10
 #define UVC_CT_PRIVACY_CONTROL				0x11
+#define UVC_CT_REGION_OF_INTEREST_CONTROL		0x14
 
 /* A.9.5. Processing Unit Control Selectors */
 #define UVC_PU_CONTROL_UNDEFINED			0x00
diff --git a/include/uapi/linux/uvcvideo.h b/include/uapi/linux/uvcvideo.h
index f86185456dc5..cbe15bca9569 100644
--- a/include/uapi/linux/uvcvideo.h
+++ b/include/uapi/linux/uvcvideo.h
@@ -16,6 +16,7 @@
 #define UVC_CTRL_DATA_TYPE_BOOLEAN	3
 #define UVC_CTRL_DATA_TYPE_ENUM		4
 #define UVC_CTRL_DATA_TYPE_BITMASK	5
+#define UVC_CTRL_DATA_TYPE_RECT		6
 
 /* Control flags */
 #define UVC_CTRL_FLAG_SET_CUR		(1 << 0)
@@ -38,6 +39,18 @@
 
 #define UVC_MENU_NAME_LEN 32
 
+/* V4L2 driver-specific controls */
+#define V4L2_CID_UVC_REGION_OF_INTEREST_RECT	(V4L2_CID_USER_UVC_BASE + 1)
+#define V4L2_CID_UVC_REGION_OF_INTEREST_AUTO	(V4L2_CID_USER_UVC_BASE + 2)
+#define V4L2_UVC_REGION_OF_INTEREST_AUTO_EXPOSURE		(1 << 0)
+#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IRIS			(1 << 1)
+#define V4L2_UVC_REGION_OF_INTEREST_AUTO_WHITE_BALANCE		(1 << 2)
+#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FOCUS			(1 << 3)
+#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FACE_DETECT		(1 << 4)
+#define V4L2_UVC_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK	(1 << 5)
+#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION	(1 << 6)
+#define V4L2_UVC_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY		(1 << 7)
+
 struct uvc_menu_info {
 	__u32 value;
 	__u8 name[UVC_MENU_NAME_LEN];
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 974fd254e573..72e32814ea83 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -215,6 +215,13 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_THP7312_BASE		(V4L2_CID_USER_BASE + 0x11c0)
 
+/*
+ * The base for the uvc driver controls.
+ * See linux/uvcvideo.h for the list of controls.
+ * We reserve 64 controls for this driver.
+ */
+#define V4L2_CID_USER_UVC_BASE			(V4L2_CID_USER_BASE + 0x11e0)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */

-- 
2.47.0.338.g60cca15819-goog


