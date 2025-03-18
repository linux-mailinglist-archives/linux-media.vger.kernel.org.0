Return-Path: <linux-media+bounces-28400-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F60DA66F2C
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 09:58:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AEEA16AC1A
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 08:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B7C2054F1;
	Tue, 18 Mar 2025 08:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="bnaGcj9z"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A8C1F180C;
	Tue, 18 Mar 2025 08:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742288290; cv=none; b=DPmr4poCaujO0Kipua8QDICLOR8JZT3kGfQreltWMh29DlJKTmevV/Mk1KDtsEFMMyGN43NKpNLK1Ga/5NMC5TWQIAVMYd2PvRk8NbxJC6AJtN9FaMfG6zC617yRD2BEkGCso41KAheTRTzw1tr8nixnZmT65/J0UWa9T1rzzHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742288290; c=relaxed/simple;
	bh=3AncosxsLamCWiHCEmH1zsWJ5Ucoxtb5R4+Ij2PmXdI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HNUOsaVrkTkAiwOfphNFxMmdBO4W1ckhoLzb6mpfyPYu+GFgnwFufppBfTW7+NVoYR2wU9jDEdZeD7CewKHrNgUKIywtu2vin4UW94aWUNIeRzPlEY7QdI7rDrHT8jpMMnKIUIl9IH5HNMz0J5fSK+DT5DNSUSZ5Sc0IBEsgDgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=bnaGcj9z; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=NiuG1
	rRVfu3yTyRAvwmrFoMC5cJiKVxVCSB6tApsb6g=; b=bnaGcj9z1+gv8UuXUbUpG
	nQ1szrldbQsJ6bN73aIgJXbyLucGrv+Q66fcGxIQl+WlOcmi3MT6AMfKfzTk1Uq+
	8f5a4rsWUyC1omIx7Z0fv5hTtqX5HzaIDB0I2Bo13aZRLCYHOsWBVFk7VqQT6WVG
	arLHu4t1aJTslrdMaOmajQ=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDXU+58NdlnhYFWDQ--.25180S2;
	Tue, 18 Mar 2025 16:57:34 +0800 (CST)
From: chenchangcheng <ccc194101@163.com>
To: laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chenchangcheng <chenchangcheng@kylinos.cn>
Subject: [PATCH v2] media: uvcvideo: Fix bandwidth issue for Alcor camera
Date: Tue, 18 Mar 2025 16:57:24 +0800
Message-Id: <20250318085724.1151547-1-ccc194101@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgDXU+58NdlnhYFWDQ--.25180S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3WFykXr1fKry8XrW3AF13urg_yoW7CF1fpa
	s8ArWFyry8GrW8Gw17J3WvvFy5Ganakay2krZ3Ka4kZF1UAr18XF45KayIgFW0k3ZF9rnF
	yF1Yvr4Uu34jqF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnKsUUUUUU=
X-CM-SenderInfo: 5fffimiurqiqqrwthudrp/1tbiTRgU3mfZLqTOYgAAsH

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
index 5e388f05f3fc..20be830d37c0 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -77,6 +77,7 @@
 #define UVC_QUIRK_DISABLE_AUTOSUSPEND	0x00008000
 #define UVC_QUIRK_INVALID_DEVICE_SOF	0x00010000
 #define UVC_QUIRK_MJPEG_NO_EOF		0x00020000
+#define UVC_QUIRK_OVERFLOW_BANDWIDTH 0x00040000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001

base-commit: 4701f33a10702d5fc577c32434eb62adde0a1ae1
-- 
2.25.1


