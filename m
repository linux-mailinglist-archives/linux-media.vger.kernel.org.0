Return-Path: <linux-media+bounces-21162-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3C69C1F1D
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 15:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E323B22C2D
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 14:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706361F426F;
	Fri,  8 Nov 2024 14:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UGPVkinZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AC61E5000
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 14:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731075840; cv=none; b=f+LG6UiFFIPHvP1dvTuggiAXypYe3OzLQFAlCnZuPUtXfMfFvHX/5Nyy3t2lvHSMyEWfZK1wKnbx9yg1JTTFRWiqIoGLenBV1I7KM8MmRaUpq9xAuuATk94aX9vrJr4Ig+ap9UFDu1WhzTX0Pm9JeoC2baPhGtejOBrYIWdJ8Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731075840; c=relaxed/simple;
	bh=nwezx+MzWYUp1sxZ5p8vu96Ca27g5M9sth8SL868hZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E5g8snXKEYJ1Hd1GptTwTpN6I/7azI1FAqZa0GCl7PxJ9N4K0cF0f4wuPeRKPkBFP4JAYS/VpjqqbL0ozd5/TMDPQHkJc00rtfV4vO7RKbDKf5TThlST0YKJ4E50zFcCo0z+SPoZAuPzIAk7VutwasR50qidUNTrFyiNjZ1v5ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UGPVkinZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.local (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F1FB12C5;
	Fri,  8 Nov 2024 15:23:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731075828;
	bh=nwezx+MzWYUp1sxZ5p8vu96Ca27g5M9sth8SL868hZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UGPVkinZj2Jbrt7lKjKhPqkls1/uqvNhR0pzustctJgcFSJHX3q+RszKjkI2o2SIR
	 wBUHRiUXOS005sHBWlxcZ3rnDq8VkQsJOypDaTMS/J4h5nc4drzkKs4ueleNfg+Uuc
	 UXP8xskddVD4B1x2nth7t1hbuxlgBtwOPaE32yo8=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH 2/3] media: uvcvideo: Add new quirk definition for the Sonix Technology Co. 292a camera
Date: Fri,  8 Nov 2024 14:23:09 +0000
Message-ID: <20241108142310.19794-3-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241108142310.19794-1-isaac.scott@ideasonboard.com>
References: <20241108142310.19794-1-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the definition of a new quirk that supports the Sonix Technology
Co. 292A camera, which uses the AR0330 sensor. The camera supports the
output of two simultaneous streams, which need to be handled
appropriately by the driver.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
 drivers/media/usb/uvc/uvcvideo.h   | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 0fac689c6350..15aee3f2b5f9 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2752,6 +2752,15 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },
+	/* Sonix Technology Co. Ltd. - 292A IPC AR0330 */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x0c45,
+	  .idProduct		= 0x6366,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_MJPEG_NO_EOF) },
 	/* MT6227 */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index b7d24a853ce4..116b1e383c25 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -76,6 +76,7 @@
 #define UVC_QUIRK_NO_RESET_RESUME	0x00004000
 #define UVC_QUIRK_DISABLE_AUTOSUSPEND	0x00008000
 #define UVC_QUIRK_INVALID_DEVICE_SOF	0x00010000
+#define UVC_QUIRK_MJPEG_NO_EOF          0x00020000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001
-- 
2.43.0


