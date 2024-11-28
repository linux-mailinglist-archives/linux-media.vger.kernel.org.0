Return-Path: <linux-media+bounces-22221-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 471149DB9F7
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 15:53:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C3CE2815BA
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 14:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDBF1C07EC;
	Thu, 28 Nov 2024 14:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DhKwMi3o"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197151BCA0E
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 14:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732805522; cv=none; b=Bfiw95eszrVS+i6bk/izQWyWmvCnbPfOkwMWTlP5/M5ltQm9ZuXKYWRG/Z6PySp6Ikpfka8+d8giwjl4vx5ENMZ5ykMfNS5gun4zHvN5fXBIjnm+p1LsTsfHX/OHuBsebvjGyhZ+VSzCwaKI+EZvYQ6X7b6VLiPEvA/8SFvKaLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732805522; c=relaxed/simple;
	bh=wOe/fwOqMrq2Pfo5yzQgmriasDxgmlPfXlg498NyXJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G3r9VqWby1kiKt9GWQSAwh8NfS+vuzxmSw9doreAWRcj3MgyXLHBD9KbFMpW5z9PFbNIKkdtgMY/A6NIdn+lYIfsWlPa8ul7c0mM7cghJ2u+lUr0zL8UAuV8rkGrmSnVTwdoWiPSxfM3U4lUINVhgkiyn9v2MqYtcx3I+Z7FJic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DhKwMi3o; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8C31C21;
	Thu, 28 Nov 2024 15:51:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732805486;
	bh=wOe/fwOqMrq2Pfo5yzQgmriasDxgmlPfXlg498NyXJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DhKwMi3oYKfnFNEzF52WrfynWU8ujEErkanoM5acxpbH5FE+JE/OxYdY4ttjncPFG
	 0WwPB6+GnFIiiORsuI73unNQQ5gGs6FCshmrwL1AZ9b0p4idUuHILZc/W1BlU2r/eA
	 Vhl/fSkxQZk+03CfnsqmG8ck9l4Uriv9She3uVsc=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v8 2/2] media: uvcvideo: Add new quirk definition for the Sonix Technology Co. 292a camera
Date: Thu, 28 Nov 2024 14:51:44 +0000
Message-ID: <20241128145144.61475-3-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241128145144.61475-1-isaac.scott@ideasonboard.com>
References: <20241128145144.61475-1-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Sonix Technology Co. 292A camera (which uses an AR0330 sensor), can
produce MJPEG and H.264 streams concurrently. When doing so, it drops
the last packets of MJPEG frames every time the H.264 stream generates a
key frame. Set the UVC_QUIRK_MJPEG_NO_EOF quirk to work around the
issue.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
 1 file changed, 9 insertions(+)

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
-- 
2.43.0


