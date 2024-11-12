Return-Path: <linux-media+bounces-21303-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D51A9C57F2
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 13:38:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C07E4B33142
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 11:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6C920CCE5;
	Tue, 12 Nov 2024 11:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="H0WLw0xo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F415230987
	for <linux-media@vger.kernel.org>; Tue, 12 Nov 2024 11:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731410978; cv=none; b=dYbT84wzfxUphp15sDBXvVSLRzDxghzfQ8xuETl/V6rXHUZOJ5Xfek6sc+pFwOZR7KHOy5Y2KAssusRBJDbb8Nz1TTZ3ccs6utGuFx8AMxYinWdlbntKaRVdFySO+Fdigswlk7YWC0a1dI9DdYNKu3mSGBV95+WSkf+WpXCc2Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731410978; c=relaxed/simple;
	bh=1E47PqxTJ5L7o8edDg7vV3GOuHVMnxQaST22oQSQedg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hHg7mIGDbomHFR+MrIO09oINdMroEtiImC98xoGlKOlXTLwADsX9gmldWiME3qrkAMx/Dh1OpZ+HY3w5iiTMa8gLPPFQFWUwRN7tfbu62T0uvng2RXeQe9k57yE8qG8gbNolxHsEGEARVeEIsZywmkhokR7v7XVYKJYAA4NBR+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=H0WLw0xo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.local (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8382F02;
	Tue, 12 Nov 2024 12:29:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731410961;
	bh=1E47PqxTJ5L7o8edDg7vV3GOuHVMnxQaST22oQSQedg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H0WLw0xoetgfw7pMDGn4hYhoEvfh+qUnsUMHivoOjn+RPKEkNzdkGXNG3ZQ7ascFV
	 6CaPpZmtUgYXxIWUg3xMSUH7vHg/JHF7H6YT+FCmQ9R+0c4oPJXhB65LA0eCtCXG4f
	 L83RauxHjNXOEfTaW0shL9a/QZvufPgDEUuMj1Nc=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v7 2/2] media: uvcvideo: Add new quirk definition for the Sonix Technology Co. 292a camera
Date: Tue, 12 Nov 2024 11:29:26 +0000
Message-ID: <20241112112926.17848-3-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241112112926.17848-1-isaac.scott@ideasonboard.com>
References: <20241112112926.17848-1-isaac.scott@ideasonboard.com>
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


