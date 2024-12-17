Return-Path: <linux-media+bounces-23571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 901A89F49AA
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 12:14:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EBCE188AA9B
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 11:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFCF81E282D;
	Tue, 17 Dec 2024 11:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jwblr6t1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEFA12C80C
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 11:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734434044; cv=none; b=qu/A2TK4NJdC2WRM5iCwO1QlNyRTOrXuLrZJyPNXE6Emz4nJDOHx5ZKZKixYeHXkVMX5rqLXTSmdDt1ykqJjqmEo1zxP9pv+cvdlCoG6lsaM6PuDtO+WlpAX0Awdoy+GXc41UctKUBA2n/bk+pVJkmEmJerzbG09CiJtcW3cOeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734434044; c=relaxed/simple;
	bh=8SoE1vviwSn3XgmzdGVI5fEkumKe7td4ofxojT72G0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YF/MQDo2ReXO8BlnqIoeFYzDBCSoVDDWwirlP4wk5lurJ17s+MIlxY8THNA5ALQcXfBM3+dLC42RnM/c33X/Wk+JQNRo/ljvCUAbfnMSIi6GSIbmlAzNiWctev0KXcfu+UfFDQcKXOwcm0hZBn5tL17IInH0RaWpfxLkd4LaVy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jwblr6t1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 914A255;
	Tue, 17 Dec 2024 12:13:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734434003;
	bh=8SoE1vviwSn3XgmzdGVI5fEkumKe7td4ofxojT72G0M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jwblr6t1plSsV+p4DklWXjTLjTMUWPfE0cjhbaym0surTp6+hZGjyYTGZcvQ+07qS
	 hC/oVPguUwyDEpqYXrrbNfHJCnKz+AzwrVCeBzYlPDkEL1sZNMT/O/2Jhc0BkV4g5o
	 rm+huO1newBjg9MjpmX8PGj97O4DhL5WClvC4H3g=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH 3/2] media: uvcvideo: Add Kurokesu C1 PRO camera
Date: Tue, 17 Dec 2024 11:13:51 +0000
Message-ID: <20241217111351.1890805-1-isaac.scott@ideasonboard.com>
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

Add support for the Kurokesu C1 PRO camera. This camera
experiences the same issues faced by the Sonix Technology Co. 292A IPC
AR0330. As such, enable the UVC_QUIRK_MJPEG_NO_EOF quirk for this device
to prevent frames from being erroneously dropped.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
This camera experiences the same issues as the other camera in this
series. As it is dependent on the series that is not yet merged, I am
appending it here so they can be merged together.
 drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 1d029ef654bd..45028b45906a 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2768,6 +2768,15 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_MJPEG_NO_EOF) },
+	/* Kurokesu C1 PRO */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x16d0,
+	  .idProduct		= 0x0ed1,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_MJPEG_NO_EOF) },
 	/* MT6227 */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
-- 
2.43.0


