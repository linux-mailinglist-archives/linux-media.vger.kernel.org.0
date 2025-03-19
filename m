Return-Path: <linux-media+bounces-28461-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0E3A685D1
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 08:34:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25F1F3BD90B
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 07:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF279212B28;
	Wed, 19 Mar 2025 07:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nZ1/nTCA"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374211EEE6;
	Wed, 19 Mar 2025 07:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742369659; cv=none; b=NN3aDrkURAdZ6IN5GH1slWsE4Rfv92nxlGXzXDzLGtymHDYR6Pd6Z7Br7KLQQEX8a3r6z+xpFIUDGRTv8lfnljiSQopTTlQsaJ2G/1ZwOKdtOW7TH1X7A7PsEdTymU8YWKhzSDZv8qhcANUkIS+wI4n2yZijszIHiZmLi3sp7nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742369659; c=relaxed/simple;
	bh=35knIKziWAt7L1/ZRDI5XcFef2xoKKr80ICiJCImJ4g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tbcZskoGRbuJFJwNMTKpy4JxBfz5PPmRxWPz9VRAB2RPgBMdAKFMt3Hhd+rUiA25MyH+x+UPQ3YnoS3cQy/+dw0CU8RVyVao6VGTtDjNMfT323sf+2S+/Ji6e8ExOWfU7XgYs8idDh3PYuoLEfXNRcX+6FM3yo2UHynDDmHZgJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nZ1/nTCA; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=zAsLS
	KrJ7SOI6vFhXGrxwx9PLVWFXZbPSUWQb4jt+Kc=; b=nZ1/nTCAq31L8P8vsbMoj
	v3pb3/3mN4ijrMvpFAwsC1aoDcQiJFDxG37Z0vIojYZBm6kKZXl5WZVjtAgsJn1o
	WIJizAQvHKD+Xl0mbuZWl+oPqh5vAkVqLFLDU0PSX6mvQBglg9CRiyvymMv+wnih
	naP5jiD/WBOwSMpS2cX8cc=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3f9FRc9pnC2OeAQ--.43204S2;
	Wed, 19 Mar 2025 15:33:39 +0800 (CST)
From: chenchangcheng <ccc194101@163.com>
To: laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chenchangcheng <chenchangcheng@kylinos.cn>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v4] media: uvcvideo: Fix bandwidth issue for Alcor camera
Date: Wed, 19 Mar 2025 15:33:35 +0800
Message-Id: <20250319073335.935621-1-ccc194101@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3f9FRc9pnC2OeAQ--.43204S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3WFykXr1fKry8XrW3AF13urg_yoW7Zw1kpa
	s8ArWFyry8GrW8Gw17J3WvqFy5Ganakay2krs3Ka4kZr1UAr18XF45KayIqFW0k3ZF9rnF
	yFn0vr4Uu34jqF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07joApnUUUUU=
X-CM-SenderInfo: 5fffimiurqiqqrwthudrp/1tbiTQIV3mfab219GAAAse

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

Signed-off-by: chenchangcheng <chenchangcheng@kylinos.cn>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503191330.AveQs7tb-lkp@intel.com/
---
 drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
 drivers/media/usb/uvc/uvc_video.c  | 9 +++++++++
 drivers/media/usb/uvc/uvcvideo.h   | 1 +
 3 files changed, 19 insertions(+)

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
index e3567aeb0007..4adae8362629 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -262,6 +262,15 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 
 		ctrl->dwMaxPayloadTransferSize = bandwidth;
 	}
+
+	if (format->flags & UVC_FMT_FLAG_COMPRESSED &&
+	    stream->dev->quirks & UVC_QUIRK_OVERFLOW_BANDWIDTH &&
+	    ctrl->dwMaxPayloadTransferSize > stream->maxpsize) {
+		dev_warn(&stream->intf->dev,
+			 "the max payload transmission size (%d) exceededs the size of the ep max packet (%d). use the default value of 1024 bytes.\n",
+			 ctrl->dwMaxPayloadTransferSize, stream->maxpsize);
+		ctrl->dwMaxPayloadTransferSize = 1024;
+	}
 }
 
 static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
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


