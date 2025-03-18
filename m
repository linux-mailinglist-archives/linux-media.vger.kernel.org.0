Return-Path: <linux-media+bounces-28399-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB0FA66F0B
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 09:52:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 299DF1888F4F
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 08:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7DF42046B0;
	Tue, 18 Mar 2025 08:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nkQXHasS"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B581A3056;
	Tue, 18 Mar 2025 08:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742287913; cv=none; b=FWpkq3MKoZYDYVV4yjdvMflx0NV4TuJUv/5FJcgelbtA6G+PmkCkkxp7b2f6A8sVEJynniYPIMO5tQ/aRBS5mogBfC+STot2Na9+p5nyZjkC0woLQJkl0q/YanLr/E248NLvqgbqbCcCSQ0yWNEfxKN6dq09s51vwJmI/ZSt0UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742287913; c=relaxed/simple;
	bh=HOe+xVpTb8u9dPsOtOzS76u7qOWu+6pm9CeuogPh9VA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BdnsHnwFGeyY7P8M1Pt4Q0EnIprn3hBOQF6NuzlaKVQcCVMAqJi0XCstovwryA0vtYL876xoZqrNHNI6gAc2IgrV9N3GqdFSOmIiBq2jEnBrrwHG8tA0hrcojwtNabAfCvd9NOQk55JtWqm4iIvG+4z8/olw6vzUr2DmR72Zqh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nkQXHasS; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=CeRLn
	hBerGM8kQzF1o1GGPkqE4WIWv/wKLqahPoeDKw=; b=nkQXHasSQtkw8wuYExu57
	ddc6rnxcbYBjYSBaWg3/FYsc+kFYsG4kVhM+LOnyrkmVn4xYYL4oSZQU6ui3I4zE
	F+kBmiuckRd2w/swnxgDWNhx4Y3foB2QEb3amb92kx7DD2rTloEtmrNrd0o+K4cy
	NEnkqqJHWwS2kDW+cuZ4J8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wAH1fYVNNlnZzPPAA--.22859S2;
	Tue, 18 Mar 2025 16:51:33 +0800 (CST)
From: chenchangcheng <ccc194101@163.com>
To: laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chenchangcheng <chenchangcheng@kylinos.cn>
Subject: [PATCH] media: uvcvideo: Fix bandwidth issue for Alcor camera
Date: Tue, 18 Mar 2025 16:51:31 +0800
Message-Id: <20250318085131.1137866-1-ccc194101@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAH1fYVNNlnZzPPAA--.22859S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3WFykXr1fKry8XrW3AF13urg_yoW7CF13pa
	s8ArWFyry8GrW8Gw17J3WvvFy5Ganakay2krZ3Ka4kZr1UAr18XF45KayIgFW0kFnF9rnF
	yF1Yvr4Uu34jqF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnMa8UUUUU=
X-CM-SenderInfo: 5fffimiurqiqqrwthudrp/1tbiwgkU3mfZMiI7xwAAsT

From: chenchangcheng <chenchangcheng@kylinos.cn>

Some broken device return wrong dwMaxPayloadTransferSize fields,
as follows:
[  218.211425] [pid:20391,cpu4,guvcview,3]uvcvideo: Trying format 0x47504a4d (MJPG): 640x480.
[  218.211425] [pid:20391,cpu4,guvcview,4]uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
[  218.252532] [pid:20391,cpu4,guvcview,1]uvcvideo: Trying format 0x47504a4d (MJPG): 640x480.
[  218.252532] [pid:20391,cpu4,guvcview,2]uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
[  218.293426] [pid:20391,cpu7,guvcview,8]videobuf2_common: __setup_offsets: buffer 0, plane 0 offset 0x00000000
[  218.294067] [pid:20391,cpu7,guvcview,9]videobuf2_common: __setup_offsets: buffer 1, plane 0 offset 0x000e1000
[  218.294433] [pid:20391,cpu7,guvcview,0]videobuf2_common: __setup_offsets: buffer 2, plane 0 offset 0x001c2000
[  218.294677] [pid:20391,cpu7,guvcview,1]videobuf2_common: __setup_offsets: buffer 3, plane 0 offset 0x002a3000
[  218.294677] [pid:20391,cpu7,guvcview,2]videobuf2_common: __vb2_queue_alloc: allocated 4 buffers, 1 plane(s) each
[  218.294738] [pid:20391,cpu7,guvcview,3]uvcvideo: uvc_v4l2_mmap
[  218.294799] [pid:20391,cpu7,guvcview,4]videobuf2_common: vb2_mmap: buffer 0, plane 0 successfully mapped
[  218.294799] [pid:20391,cpu7,guvcview,5]uvcvideo: uvc_v4l2_mmap
[  218.294830] [pid:20391,cpu7,guvcview,6]videobuf2_common: vb2_mmap: buffer 1, plane 0 successfully mapped
[  218.294830] [pid:20391,cpu7,guvcview,7]uvcvideo: uvc_v4l2_mmap
[  218.294830] [pid:20391,cpu7,guvcview,8]videobuf2_common: vb2_mmap: buffer 2, plane 0 successfully mapped
[  218.294860] [pid:20391,cpu7,guvcview,9]uvcvideo: uvc_v4l2_mmap
[  218.294860] [pid:20391,cpu7,guvcview,0]videobuf2_common: vb2_mmap: buffer 3, plane 0 successfully mapped
[  218.294860] [pid:20391,cpu7,guvcview,1]videobuf2_common: vb2_core_qbuf: qbuf of buffer 0 succeeded
[  218.294891] [pid:20391,cpu7,guvcview,2]videobuf2_common: vb2_core_qbuf: qbuf of buffer 1 succeeded
[  218.294891] [pid:20391,cpu7,guvcview,3]videobuf2_common: vb2_core_qbuf: qbuf of buffer 2 succeeded
[  218.294891] [pid:20391,cpu7,guvcview,4]videobuf2_common: vb2_core_qbuf: qbuf of buffer 3 succeeded
[  218.294891] [pid:20391,cpu7,guvcview,5]uvcvideo: Setting frame interval to 1/25 (400000).
[  218.632537] [pid:20427,cpu6,guvcview,8]uvcvideo: Device requested 2752512 B/frame bandwidth.
[  218.632598] [pid:20427,cpu6,guvcview,9]uvcvideo: No fast enough alt setting for requested bandwidth.

The maximum packet size of the device is 3 * 1024,
but according to the logs above, the device needs to apply for a bandwidth of 0x2a0000.

Signed-off-by: chenchangcheng <chenchangcheng@kylinos.cn>
---
 drivers/media/usb/uvc/uvc_driver.c |  9 +++++++++
 drivers/media/usb/uvc/uvc_video.c  | 10 ++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 3 files changed, 20 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index deadbcea5e22..6d739c3cc88f 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -3188,6 +3188,15 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
+	/* Alcor Corp. Slave camera */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x1b17,
+	  .idProduct		= 0x6684,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_OVERFLOW_BANDWIDTH) },
 	/* Generic USB Video Class */
 	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_UNDEFINED) },
 	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_15) },
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e3567aeb0007..463d6bf2c7df 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -262,6 +262,16 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 
 		ctrl->dwMaxPayloadTransferSize = bandwidth;
 	}
+
+	if (format->flags & UVC_FMT_FLAG_COMPRESSED &&
+	    stream->dev->quirks & UVC_QUIRK_OVERFLOW_BANDWIDTH &&
+	    ctrl->dwMaxPayloadTransferSize > stream->maxpsize) {
+		uvc_printk(KERN_WARNING, "the max payload transmission size [%d]
+			   exceededs the size of the ep max packet.
+			   use the default value of 1024 bytes.\n",
+			   ctrl->dwMaxPayloadTransferSize);
+		ctrl->dwMaxPayloadTransferSize = 1024;
+	}
 }
 
 static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 5e388f05f3fc..d64b4641c316 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -77,6 +77,7 @@
 #define UVC_QUIRK_DISABLE_AUTOSUSPEND	0x00008000
 #define UVC_QUIRK_INVALID_DEVICE_SOF	0x00010000
 #define UVC_QUIRK_MJPEG_NO_EOF		0x00020000
+#define UVC_QUIRK_OVERFLOW_BANDWIDTH 0x0040000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001

base-commit: 4701f33a10702d5fc577c32434eb62adde0a1ae1
-- 
2.25.1


