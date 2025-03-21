Return-Path: <linux-media+bounces-28545-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C50A6B2BB
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 02:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB6BF3B4ED0
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 01:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8821DFD86;
	Fri, 21 Mar 2025 01:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="SHNGNg9P"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C60C74C85;
	Fri, 21 Mar 2025 01:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742521788; cv=none; b=IltIzoy1hcTkEyKtV7DyeKsTCNEH+++673y28ppnW5M2TKamdD1A8iz28yVJHjneqWfyGzl56fmcwzxQYaRYrtyP97VFWewS9z7quK1Nd39JwAouGW6eUULNG8vtMuQlDrFod7PvpiR2Jt12iF/GBXwuFiSeTatD7la8GMSEB0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742521788; c=relaxed/simple;
	bh=jkcnqXtQ6bRucDa/VBKU6cIw/rMmmdIVunyIC7lQGyc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mQH6NYfIB8p5Fhnd6Sbn25oiKJ55Y6vrPC/9NEaF0GaRW5vI/zIEepcdZHuo9+gVEfGrJC/jcLi1tJf+i9dt7IY7mKcQk/UsHvs5zOcZ/Tk+sISmRTR4kCEpygz0l9woo40zbEM93eZP5v1n8jNHcegTkupuzPgLr6ftO+Cqigw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SHNGNg9P; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=RW/lK
	wc5mAv8wYptSe1TwvhJZQCxGjlY/X606DamiTg=; b=SHNGNg9PUByvu0DUOVJE9
	3YdcLyazvNJSBgDxJ12qOfZuLj6i79krdITJyBXSPv+HThuRcjYeYxRi1mvReJgb
	8DZ2FwKRMmIVPCuMHZIXjvloba9LWjvjrWQzLimwNygjc88rfRNh2qVJtiwFKu1h
	lQLQH/MXyg9Xx4nS61mA04=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wA3ocuRxdxn_rQiAw--.15122S2;
	Fri, 21 Mar 2025 09:49:05 +0800 (CST)
From: chenchangcheng <ccc194101@163.com>
To: laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chenchangcheng <chenchangcheng@kylinos.cn>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v5] media: uvcvideo: Fix bandwidth issue for Alcor camera
Date: Fri, 21 Mar 2025 09:49:04 +0800
Message-Id: <20250321014904.129768-1-ccc194101@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wA3ocuRxdxn_rQiAw--.15122S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3WFykXr1fKr47Jw1DuF45ZFb_yoW3uw45pa
	45GrZYyr18JrW8Cw17Ja1kWFy5Gwsaka12krZxKa4DZrn8Ary8XF43G3y0qFWvk3ZrZrnx
	ta4jqrWj934jyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jrwIDUUUUU=
X-CM-SenderInfo: 5fffimiurqiqqrwthudrp/1tbiwhoX3mfcw2pUFgAAsB

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

The maximum packet size of the device is 3 * 1024, according to the
logs above, the device needs to apply for a bandwidth of 0x2a0000.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503191330.AveQs7tb-lkp@intel.com/
Signed-off-by: chenchangcheng <chenchangcheng@kylinos.cn>
---
 drivers/media/usb/uvc/uvc_driver.c |  9 ++++
 drivers/media/usb/uvc/uvc_video.c  | 82 +++++++++++++++++-------------
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 3 files changed, 58 insertions(+), 34 deletions(-)

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
index e3567aeb0007..7af77bf1be9b 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -226,41 +226,55 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 	if ((ctrl->dwMaxPayloadTransferSize & 0xffff0000) == 0xffff0000)
 		ctrl->dwMaxPayloadTransferSize &= ~0xffff0000;
 
-	if (!(format->flags & UVC_FMT_FLAG_COMPRESSED) &&
-	    stream->dev->quirks & UVC_QUIRK_FIX_BANDWIDTH &&
-	    stream->intf->num_altsetting > 1) {
-		u32 interval;
-		u32 bandwidth;
-
-		interval = (ctrl->dwFrameInterval > 100000)
-			 ? ctrl->dwFrameInterval
-			 : frame->dwFrameInterval[0];
-
-		/*
-		 * Compute a bandwidth estimation by multiplying the frame
-		 * size by the number of video frames per second, divide the
-		 * result by the number of USB frames (or micro-frames for
-		 * high- and super-speed devices) per second and add the UVC
-		 * header size (assumed to be 12 bytes long).
-		 */
-		bandwidth = frame->wWidth * frame->wHeight / 8 * format->bpp;
-		bandwidth *= 10000000 / interval + 1;
-		bandwidth /= 1000;
-		if (stream->dev->udev->speed >= USB_SPEED_HIGH)
-			bandwidth /= 8;
-		bandwidth += 12;
-
-		/*
-		 * The bandwidth estimate is too low for many cameras. Don't use
-		 * maximum packet sizes lower than 1024 bytes to try and work
-		 * around the problem. According to measurements done on two
-		 * different camera models, the value is high enough to get most
-		 * resolutions working while not preventing two simultaneous
-		 * VGA streams at 15 fps.
-		 */
-		bandwidth = max_t(u32, bandwidth, 1024);
+	if (stream->intf->num_altsetting > 1) {
+		if (!(format->flags & UVC_FMT_FLAG_COMPRESSED) &&
+		    stream->dev->quirks & UVC_QUIRK_FIX_BANDWIDTH) {
+			u32 interval;
+			u32 bandwidth;
+
+			interval = (ctrl->dwFrameInterval > 100000)
+				 ? ctrl->dwFrameInterval
+				 : frame->dwFrameInterval[0];
+
+			/*
+			 * Compute a bandwidth estimation by multiplying the
+			 * frame size by the number of video frames per second,
+			 * divide the result by the number of USB frames (or
+			 * micro-frames for high- and super-speed devices) per
+			 * second and add the UVC header size (assumed to be
+			 * 12 bytes long).
+			 */
+			bandwidth = frame->wWidth * frame->wHeight / 8
+				    * format->bpp;
+			bandwidth *= 10000000 / interval + 1;
+			bandwidth /= 1000;
+			if (stream->dev->udev->speed >= USB_SPEED_HIGH)
+				bandwidth /= 8;
+			bandwidth += 12;
+
+			/*
+			 * The bandwidth estimate is too low for many cameras.
+			 * Don't use maximum packet sizes lower than 1024 bytes
+			 * to try and work around the problem. According to
+			 * measurements done on two different camera models,
+			 * the value is high enough to get most resolutions
+			 * working while not preventing two simultaneous VGA
+			 * streams at 15 fps.
+			 */
+			bandwidth = max_t(u32, bandwidth, 1024);
+
+			ctrl->dwMaxPayloadTransferSize = bandwidth;
+		}
 
-		ctrl->dwMaxPayloadTransferSize = bandwidth;
+		if (format->flags & UVC_FMT_FLAG_COMPRESSED &&
+		    stream->dev->quirks & UVC_QUIRK_OVERFLOW_BANDWIDTH &&
+		    ctrl->dwMaxPayloadTransferSize > stream->maxpsize) {
+			dev_warn(&stream->intf->dev,
+				 "the max payload transmission size (%d) exceededs the size of the ep max packet (%d). use the default value of 1024 bytes.\n",
+				 ctrl->dwMaxPayloadTransferSize,
+				 stream->maxpsize);
+			ctrl->dwMaxPayloadTransferSize = 1024;
+		}
 	}
 }
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 5e388f05f3fc..8b43d725c259 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -77,6 +77,7 @@
 #define UVC_QUIRK_DISABLE_AUTOSUSPEND	0x00008000
 #define UVC_QUIRK_INVALID_DEVICE_SOF	0x00010000
 #define UVC_QUIRK_MJPEG_NO_EOF		0x00020000
+#define UVC_QUIRK_OVERFLOW_BANDWIDTH	0x00040000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001

base-commit: 4701f33a10702d5fc577c32434eb62adde0a1ae1
-- 
2.25.1


