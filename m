Return-Path: <linux-media+bounces-21430-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F9D9C925E
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 20:23:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9266B2878B
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 19:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DB581B85C5;
	Thu, 14 Nov 2024 19:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S/gNryTz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797E71B4C35
	for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 19:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731611465; cv=none; b=U8PuUt4BFgYCZwP8ZR506BP+1WKYY8BmpYqGvTcFMOPPPWFsMCLyfp9FPbqCozh9zc9NY08z/U2YWztMN0CiTAs7+3ywNiqh0lqveQwPomtaIyJ+XiqjUoigf2GjhyUusq2caruhFWH6jXRRpl5Db07ckBF4rimzWEtVh0yCUMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731611465; c=relaxed/simple;
	bh=G5/w2LpBfII/nbK2O7RqW+iuApIAiWZ+5waBhl2Gw9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b2HOV4DrtibRVtID3hmkO2QMMEp/pvuel85rWcCuw4VJnGBOvpPP+WvtaDN9djnUqisx0niNe60wJYRk3E+7YXeSRxV1wBHYnjVuA0vS7wXfT8pDSEviqunHheI5xSlk0r8o9s9eCzKNteyD9dZgAF7awyUq/NnjR+SZ3TocxCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=S/gNryTz; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7b35b1ca0c2so116257585a.0
        for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 11:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731611462; x=1732216262; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UcG3FhcuZvbG2+NnY7etdL0t4ZcduW99Sq/T3Mxk4/I=;
        b=S/gNryTzOns6I0sSuG8FgXJGCWOl6Q6wIc9olx9B+Hcw87xRgQjKHebbApc179VntG
         vQjqfBaPS4XJgzqnto4BucktBakgR3OGZVJYt5QwiDa0rEzOWKehkB8AXvW9fRoN4HHt
         Oyg/9ngVUH5EEZSEmA3ywN+VlWtFQZaT5cm2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731611462; x=1732216262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UcG3FhcuZvbG2+NnY7etdL0t4ZcduW99Sq/T3Mxk4/I=;
        b=Y9Ntuuvx5JMLyLAeA9llNGnEEjivrvqmkATKbdzAAtjPLkQ8o8dAz2LjDP2AUP0YuR
         QYUf0RxoIuY4ahaPppbPimNMe6mgQ4ve8xDU8LVGWDFHWjFLNhSDowVk8ZC49HvQFCiF
         Q2NDQPAFW4Eai/ktkVecsz2VcF4KSOy3LebddZgHEW95WSAteHfhi4YbSmKnciRYseSh
         lp1hMtMyu1zsjDPl/k+5U/8Gyd8e2AIicqwM7Nuuq1erVjclMS9hRnU/G+W2HJn8o0X+
         vECjYTVsSPkGFK/uAT3rgzVTZHpaaVXRwTzDGsoVMKeBGo61KriFAVN5g81t+1FvUtv3
         NPNw==
X-Forwarded-Encrypted: i=1; AJvYcCU6b+2LhdtTA1OVldzOPz5UPH+prygEwRXSvDDNWI3yaYq4ePUCfPvEeQgu0DBbSCyDWJD5L3a8NjQJ5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrDlYwztzIdin5lTeByv4MKF/lFr8Js8a1Ag6CFLAH815nN7wD
	+X+W90j71YgB0kUhB/ilnewgcSEECwmyBxyGjw4H8mSkdkXWS/gudTxSD3dJfQ==
X-Google-Smtp-Source: AGHT+IHuR1WrTlDipWbGX/ArVVt+6TY3Oto5+lhHEishv/BK6dw2+cEm5UP4ltJavxeCNCbGdQOA4A==
X-Received: by 2002:ad4:5742:0:b0:6d3:5bcc:485c with SMTP id 6a1803df08f44-6d3e8dbbffcmr70212226d6.0.1731611462443;
        Thu, 14 Nov 2024 11:11:02 -0800 (PST)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3ee7cc7e1sm8857766d6.53.2024.11.14.11.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 11:11:02 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 14 Nov 2024 19:10:47 +0000
Subject: [PATCH v15 18/19] media: uvcvideo: implement UVC v1.5 ROI
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241114-uvc-roi-v15-18-64cfeb56b6f8@chromium.org>
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
In-Reply-To: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, Ricardo Ribalda <ribalda@kernel.org>, 
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
---
 drivers/media/usb/uvc/uvc_ctrl.c   | 81 ++++++++++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |  7 ++++
 include/uapi/linux/usb/video.h     |  1 +
 include/uapi/linux/uvcvideo.h      | 13 ++++++
 include/uapi/linux/v4l2-controls.h |  9 +++++
 5 files changed, 111 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index f262e05ad3a8..5b619ef40dd3 100644
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
+	uvc_rect->top = max(0xffff, v4l2_rect->top);
+	uvc_rect->left = max(0xffff, v4l2_rect->left);
+	uvc_rect->bottom = max(0xffff, v4l2_rect->height + v4l2_rect->top - 1);
+	uvc_rect->right = max(0xffff, v4l2_rect->width + v4l2_rect->left - 1);
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
@@ -1465,6 +1543,9 @@ static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
 
 static size_t uvc_mapping_v4l2_size(struct uvc_control_mapping *mapping)
 {
+	if (mapping->v4l2_type == V4L2_CTRL_TYPE_RECT)
+		return sizeof(struct v4l2_rect);
+
 	if (uvc_ctrl_mapping_is_compound(mapping))
 		return DIV_ROUND_UP(mapping->size, 8);
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 8aca1a2fe587..d910a5e5b514 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -294,6 +294,13 @@ struct uvc_streaming_header {
 	u8 bTriggerUsage;
 };
 
+struct uvc_rect {
+	u16 top;
+	u16 left;
+	u16 bottom;
+	u16 right;
+} __packed;
+
 enum uvc_buffer_state {
 	UVC_BUF_STATE_IDLE	= 0,
 	UVC_BUF_STATE_QUEUED	= 1,
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
index 974fd254e573..6c91d6fa4708 100644
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
@@ -1089,6 +1096,8 @@ enum v4l2_auto_focus_range {
 
 #define V4L2_CID_HDR_SENSOR_MODE		(V4L2_CID_CAMERA_CLASS_BASE+36)
 
+/* CAMERA-class private control IDs */
+
 /* FM Modulator class control IDs */
 
 #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)

-- 
2.47.0.338.g60cca15819-goog


