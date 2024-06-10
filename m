Return-Path: <linux-media+bounces-12901-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D95902C47
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 01:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 804DD1C21045
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 23:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78733154C08;
	Mon, 10 Jun 2024 23:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lcxFhA/Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208CA153581
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 23:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718061002; cv=none; b=ROTrZjS+dpegjzNVIrgN3u6YSJmo9mQR8D7I9LTalX30jbxiMDOjvTBMPGxf9iYvjyM/gY0t3LUcdVbeQJUZJwY6IP/T7DGs56Td+yaQ2knOmlxP/ludNn/Q5fAfaZ+ouoKX+uyaSxS5T9cd3qjGzWM7ysWglcyGrx8mYMVjp1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718061002; c=relaxed/simple;
	bh=OUIAEYxW2pt7xlzXmaotUnfEstFIYjmqTiX5MYoVVRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SrGp2RITtPphdg93t876CTP68nuDMzZ+5YU2sPos48Vf/QnnkoQhzL/ecsM3qzYZgUNnX7pejvLSJLHDfN9RqkTv8NeeRk9ebC/PM5jGThi3vVOqLyYuEZ+Oc7wqOKu9RNv5kaFK2HY8RnhTG58y0Fqqlcx/bUPyjWdqXHCTmvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lcxFhA/Q; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5b9706c84e5so2837963eaf.1
        for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 16:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718061000; x=1718665800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hm98dOi0/zRzUBfFNpcElUy3e9wDhIJ4KCCov/nGFTQ=;
        b=lcxFhA/QvMiB5odiKSNsODLs2xDUqc8EUHOGLPGoQyfuWTyCCBMuNMwdptmeaugV5j
         KX+yec+tggkrBjmbHtWZjMpu9xUItgo2VTgg2Nw3viO/Tsv4+fXfyNCxjclVdoIDD4xU
         X1jwxWszNmhW4eSIp6rn71OOf3gqpXfvna6x8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718061000; x=1718665800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hm98dOi0/zRzUBfFNpcElUy3e9wDhIJ4KCCov/nGFTQ=;
        b=s9G/BNpfIc++foihwmi17ys85LHdAR7fV7J8gThtCWKxMoUsvzVDfEl6OgHnv+ZH4X
         0jN/zrhQDbUZ1NAH3ubOzPHsdnGRH+v16IH0mIQyKbA0Stpemxn9dm7+7JQyHoNRrySN
         gT/2YMnIkie0l+HMCxCo1sEhbAxQb8Bk622+Jh82uzBhR2862yq3c3aCxvdtpWNH8RZ0
         cYZC/0oXZw0jvtsLQawdg6kwANHMMN542amZ706d8/Pi4cTNQR7jQtvuJwdNYjfrXZUo
         cNsGi2KptmBs9zmA9ZYjDmgKc15Fw1xwcgEik7sacTB+k2IvoUwZqLsse0RJ2bhZl3Uo
         0txw==
X-Forwarded-Encrypted: i=1; AJvYcCU8f24XpDXBm+/TKdUH1164kM8tBefd8TBraPBuliv4kF7fpF5TCDqv3T7usSBAPY7tDlvygsKfm5Xgu3j+vFiW3z0njy+MZdN2z24=
X-Gm-Message-State: AOJu0YymZBU2a4SXK6jLJNe/453TaCiN5OnVTArvESl3eYHK8SWI+cKa
	Io0wPMRsesUQSdbkuZ8X1dkPliYKNYjj+iLUWf7mQKULyK7v5wvkH3Fz2J16sA==
X-Google-Smtp-Source: AGHT+IEceemHixBzieP2KZfovugvjCMFKfE0k8sKaMP22e3NHBGqtiLQaG5XPws0aTira0s0kS/A3g==
X-Received: by 2002:a05:6358:840b:b0:19f:5b1f:91b1 with SMTP id e5c5f4694b2df-19f5b1f9254mr115528755d.14.1718061000049;
        Mon, 10 Jun 2024 16:10:00 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b06519d521sm35256946d6.65.2024.06.10.16.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 16:09:58 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 10 Jun 2024 23:09:56 +0000
Subject: [PATCH v2 5/7] media: uvcvideo: Remove PLF device quirking
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240610-billion-v2-5-38e861475f85@chromium.org>
References: <20240610-billion-v2-0-38e861475f85@chromium.org>
In-Reply-To: <20240610-billion-v2-0-38e861475f85@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

We can use heuristics to figure out the proper range of the control
instead of quirking every single device.

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c   |   4 +-
 drivers/media/usb/uvc/uvc_driver.c | 122 -------------------------------------
 drivers/media/usb/uvc/uvcvideo.h   |   2 -
 3 files changed, 2 insertions(+), 126 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index efc46f53ac81..d74019cb27fe 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -459,7 +459,7 @@ static void uvc_ctrl_set_rel_speed(struct uvc_control_mapping *mapping,
 	data[first+1] = min_t(int, abs(value), 0xff);
 }
 
-const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited = {
+static const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited = {
 	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
 	.entity		= UVC_GUID_UVC_PROCESSING,
 	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
@@ -471,7 +471,7 @@ const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited = {
 				  V4L2_CID_POWER_LINE_FREQUENCY_50HZ),
 };
 
-const struct uvc_control_mapping uvc_ctrl_power_line_mapping_uvc11 = {
+static const struct uvc_control_mapping uvc_ctrl_power_line_mapping_uvc11 = {
 	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
 	.entity		= UVC_GUID_UVC_PROCESSING,
 	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index bbd90123a4e7..5f689fee60a9 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2383,20 +2383,6 @@ MODULE_PARM_DESC(timeout, "Streaming control requests timeout");
  * Driver initialization and cleanup
  */
 
-static const struct uvc_device_info uvc_ctrl_power_line_limited = {
-	.mappings = (const struct uvc_control_mapping *[]) {
-		&uvc_ctrl_power_line_mapping_limited,
-		NULL, /* Sentinel */
-	},
-};
-
-static const struct uvc_device_info uvc_ctrl_power_line_uvc11 = {
-	.mappings = (const struct uvc_control_mapping *[]) {
-		&uvc_ctrl_power_line_mapping_uvc11,
-		NULL, /* Sentinel */
-	},
-};
-
 static const struct uvc_device_info uvc_quirk_probe_minmax = {
 	.quirks = UVC_QUIRK_PROBE_MINMAX,
 };
@@ -2427,33 +2413,6 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
  * though they are compliant.
  */
 static const struct usb_device_id uvc_ids[] = {
-	/* Quanta USB2.0 HD UVC Webcam */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x0408,
-	  .idProduct		= 0x3090,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
-	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
-	/* Quanta USB2.0 HD UVC Webcam */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x0408,
-	  .idProduct		= 0x4030,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
-	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
-	/* Quanta USB2.0 HD UVC Webcam */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x0408,
-	  .idProduct		= 0x4034,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_15,
-	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
 	/* LogiLink Wireless Webcam */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
@@ -2583,42 +2542,6 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_RESTRICT_FRAME_RATE) },
-	/* Chicony EasyCamera */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x04f2,
-	  .idProduct		= 0xb5eb,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
-	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
-	/* Chicony Electronics Co., Ltd Integrated Camera */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x04f2,
-	  .idProduct		= 0xb67c,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_15,
-	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_uvc11 },
-	/* Chicony EasyCamera */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x04f2,
-	  .idProduct		= 0xb6ba,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
-	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
-	/* Chicony EasyCamera */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x04f2,
-	  .idProduct		= 0xb746,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
-	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
 	/* Alcor Micro AU3820 (Future Boy PC USB Webcam) */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
@@ -3003,51 +2926,6 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_FORCE_BPP) },
-	/* SunplusIT Inc HD Camera */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x2b7e,
-	  .idProduct		= 0xb752,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_15,
-	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_uvc11 },
-	/* Lenovo Integrated Camera */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x30c9,
-	  .idProduct		= 0x0093,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_15,
-	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_uvc11 },
-	/* Sonix Technology USB 2.0 Camera */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x3277,
-	  .idProduct		= 0x0072,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
-	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
-	/* Acer EasyCamera */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x5986,
-	  .idProduct		= 0x1172,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
-	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
-	/* Acer EasyCamera */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x5986,
-	  .idProduct		= 0x1180,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
-	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
 	/* Intel D410/ASR depth camera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index fa0396dd5b35..4df02a40c74f 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -753,8 +753,6 @@ int uvc_status_start(struct uvc_device *dev, gfp_t flags);
 void uvc_status_stop(struct uvc_device *dev);
 
 /* Controls */
-extern const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited;
-extern const struct uvc_control_mapping uvc_ctrl_power_line_mapping_uvc11;
 extern const struct v4l2_subscribed_event_ops uvc_ctrl_sub_ev_ops;
 
 int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,

-- 
2.45.2.505.gda0bf45e8d-goog


