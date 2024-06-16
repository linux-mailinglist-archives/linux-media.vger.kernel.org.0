Return-Path: <linux-media+bounces-13346-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 483CC90A0C3
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 01:14:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A20D4281FB7
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 23:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6FD173537;
	Sun, 16 Jun 2024 23:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AJJ5XmXT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266707347C
	for <linux-media@vger.kernel.org>; Sun, 16 Jun 2024 23:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718579663; cv=none; b=a4P0lrGUwKRoDro9qndpZplhDE30lEEol3DF50DNlNDh8hvepPnWLReboCr9uCm37gZF1PSpqGYuUXcrqQmNZqhxsULFtsl0wiiJqMvgaFXP2xUDIsEMjoeFuzGhik5PiT2v3zcRwczLkVsGfCIOP6NCcB5ljQjNes2rgA6r8fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718579663; c=relaxed/simple;
	bh=Fs5XjOWtP7BoJyan1KSozNGL/hGPvlGlUKtZyLNTy34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kNgFZVitVwDMe13VN9op2DiVWYELPMzENa3tJJey8E3DJ+UjHhjlsVbzTEmpG9uc/AdPNWQlnaOBQeDnXmOVtSuj5rJTxCI6GGlgzupl9ZHyxf6OhMO8f+hnjiDVpTyVoJ288s0uJiy+gxnQ+lxQkl9G82oIcnVmMvR6W6Exb7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AJJ5XmXT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E0CF5A9A;
	Mon, 17 Jun 2024 01:14:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718579643;
	bh=Fs5XjOWtP7BoJyan1KSozNGL/hGPvlGlUKtZyLNTy34=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AJJ5XmXTnfm7hKCBSrKkfI8wffSPOgyJ/rmaeZ+uTTUWj4Sy7EOkiFwurJ+X9F1xB
	 OZU5HLcjTQSAEYsabnymx6PEzVWY36VrLsIF7HTjFTuqpirQyP6BmopQjkLfCY5YZa
	 dw9rydKY9Yx8Ni+0V2XrqoBFUee1GOwMQszjlPXE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v3 5/6] media: uvcvideo: Remove PLF device quirking
Date: Mon, 17 Jun 2024 02:13:49 +0300
Message-ID: <20240616231350.6787-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240616231350.6787-1-laurent.pinchart@ideasonboard.com>
References: <20240616231350.6787-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ricardo Ribalda <ribalda@chromium.org>

We can use heuristics to figure out the proper range of the control
instead of quirking every single device.

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c   |   4 +-
 drivers/media/usb/uvc/uvc_driver.c | 131 -----------------------------
 drivers/media/usb/uvc/uvcvideo.h   |   2 -
 3 files changed, 2 insertions(+), 135 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index bd5d8aed385d..e2452ba62939 100644
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
index cafafe0c625a..3fb48889d1ec 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2400,20 +2400,6 @@ MODULE_PARM_DESC(timeout, "Streaming control requests timeout");
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
@@ -2444,33 +2430,6 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
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
@@ -2637,42 +2596,6 @@ static const struct usb_device_id uvc_ids[] = {
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
@@ -3057,15 +2980,6 @@ static const struct usb_device_id uvc_ids[] = {
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
 	/* Insta360 Link */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
@@ -3075,51 +2989,6 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_DISABLE_AUTOSUSPEND) },
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
-	/* Shine-Optics Integrated Camera */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x3277,
-	  .idProduct		= 0x009e,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_15,
-	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_uvc11 },
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
index 93b421918d3b..da3c38922ebd 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -756,8 +756,6 @@ int uvc_status_start(struct uvc_device *dev, gfp_t flags);
 void uvc_status_stop(struct uvc_device *dev);
 
 /* Controls */
-extern const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited;
-extern const struct uvc_control_mapping uvc_ctrl_power_line_mapping_uvc11;
 extern const struct v4l2_subscribed_event_ops uvc_ctrl_sub_ev_ops;
 
 int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
-- 
Regards,

Laurent Pinchart


