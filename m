Return-Path: <linux-media+bounces-25578-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C236A258DA
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 13:01:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A9FE18845D5
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 12:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C77207A23;
	Mon,  3 Feb 2025 11:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KA6Et9/O"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8786F207673
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 11:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583779; cv=none; b=u4cnXAc5PEOg1CSuYjh/AC9+lfp0pgJqju/N9bk+C4dSY443IUumTxB5UHqrzIMMFhLQinmCsNhrJadwiF7xq+ljhn6XPcmTGbGX4zVdpQE7R0eREvwSn2C4Kf3SEMsuKVX4YafiVM3L0eSvatNqVzwphecu9GZLzD9z3VnW/Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583779; c=relaxed/simple;
	bh=uoDgA7Ask5lby9P/39d4vN4hW7FdsMBOxZqNa+PJc8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lXD8CI5oOhasXbe7uAIeywa41Vgb9oNFE8/CW5RxKJE8ZDrPfzl96MMYmbyS6cGfApi2U/qDBedc4QY5UIwE+vOShP1lnGlTnRADXoDf1VykS+hlAyOSEvzXyZ9OF1zXXG//EFLSeEC2Sos5F+pMLAA59ynJ9qL/nYexQ6l2Vvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KA6Et9/O; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4aff5b3845eso1740173137.2
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2025 03:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738583776; x=1739188576; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vFYRGeCzJOfJUKMdvCEhAtCULTSQXsTNlkRTO/9J5mE=;
        b=KA6Et9/Ocl1X+iX4QwtUvFgjMfZ0jbtdx2N7LjnbLV3kSyeGY/q/mcTmyMK7PMVd4i
         q/pP8+9ZFQzAf74PsspPSFMEhHbXgPI7+vBPNpUx6ySpn/swwVHgigqVjpTtifGrRx+/
         drDERKJ4UiF76wbare4HzlQ261rOsgj9MuHBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583776; x=1739188576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vFYRGeCzJOfJUKMdvCEhAtCULTSQXsTNlkRTO/9J5mE=;
        b=RoScQ3lM+D294aK69KFfKSQuz+dne/cgg46+opnJE7ca/ngfoFtJXgA0qq7/7TxTN2
         dKE4pgS3neTDGz25z4rYqPFNigvSEagW0d/G+4hQlViRyILDeHT7CBp9syX08gsxyfZT
         mptDw7sbUmNnJCpp7Q3bOY5dKGvilZmBU4LByobCoIsvP9m6UaCirbcMMbvjOJU1AgLz
         xmCUd5XgWlNFh6PcVx5i62FNGRIuHr2t1y8yWwhBzlZ5Zbl/Q5+gl5G8BwKVXWIrQokU
         P4mADFUVFpNX8k9oCDL+TrkQSMZNG0xx0dB9dqSZ9IvedBTP2VoYdytUw80aJdjqpC3t
         2Gug==
X-Forwarded-Encrypted: i=1; AJvYcCV5gU2p6HI5mFd9n0zMFOl+ZEs/eeRw+yVW5Ff2BFWfCeo0GBHn1wJ8v8D65byf8UF5HQ757oD1buVIFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb+/xf6rcRqbyy269KeW7/d2odLKJrD0fJ6ZXYZ+5Now3gspfj
	AQ+XjGzDjldf3/sjoX+g1MhR+U10zqHGyU8cTlh6BNVsWPJSprr1dPMjxUfw/A==
X-Gm-Gg: ASbGncuhqXN6zW3tY2YDvj2TCctNFXNCJjIuL/EkBY+84pnP60VejmPyFmdekOAG2Xq
	Trep66tkqgFR6F31Y6+XTNImhbYUURaUU0BjCUiWbZQO62RA0r84M0IDFXy19mJCSMh5f/dOyZB
	EZ5fHbhFn8NUsUv3A3NX46XUIl18L9eTP/NIDZI5CiE33JGaQ0d99a4ajtMB8Ad+MA9ceUH0LMB
	70m2xdSkUQocuZ8cQFNO4OJ0T54U/MPYiiN5gfXil3zhbvxMZkd3NkvoOH813kQUpa/2Y5uG9H3
	7dHTp4Wx+Z4Yb1267Fy42JQrU1MN5T05uWd452FhbTa6hDzaao7QU/5V4VrsYpjA9A==
X-Google-Smtp-Source: AGHT+IHYtVnOP1UvTNuLIrRZJBooMq5HXe0ZnaNjRqi/l+lz2Cce4XN8mYqgW8JXX1ukyajHXr1Qew==
X-Received: by 2002:a05:6102:3ed0:b0:4b4:6988:b12b with SMTP id ada2fe7eead31-4b9a523c972mr14865751137.23.1738583776355;
        Mon, 03 Feb 2025 03:56:16 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baa9aefcsm1592770137.12.2025.02.03.03.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:56:15 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Feb 2025 11:55:52 +0000
Subject: [PATCH v17 16/17] media: uvcvideo: implement UVC v1.5 ROI
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250203-uvc-roi-v17-16-5900a9fed613@chromium.org>
References: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
In-Reply-To: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
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
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c   | 81 ++++++++++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |  7 ++++
 include/uapi/linux/usb/video.h     |  1 +
 include/uapi/linux/uvcvideo.h      | 13 ++++++
 include/uapi/linux/v4l2-controls.h |  7 ++++
 5 files changed, 109 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 17a7ce525f71..1906ce5b7d50 100644
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
index 6fc1cb9e99d1..b63720e21075 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -543,6 +543,13 @@ struct uvc_device_info {
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
index 526b5155e23c..e1d9f5773187 100644
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
2.48.1.362.g079036d154-goog


