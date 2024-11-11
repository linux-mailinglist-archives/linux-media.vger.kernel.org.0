Return-Path: <linux-media+bounces-21266-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 120279C43DC
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 18:40:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB1CC2813BC
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 17:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8708F1ADFE8;
	Mon, 11 Nov 2024 17:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IwHyR2lY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730541B3B28
	for <linux-media@vger.kernel.org>; Mon, 11 Nov 2024 17:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731346621; cv=none; b=Zi8yHkwYYq95fe5HAPrG9mxe/ovrLg+NGFeIEIWgAji8YuF6ZV9Ebu5QSVwhpJCSbbEa8PXlNyPd5lj2q5Qj9ufLod8kf8KKGIqkfIwJgfpFpz/AuQGubPwsEQ8J1dkKiCN5/zhdQxf4vmWdQbXgCTzAKg8O2HT+lfOYfTyDOCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731346621; c=relaxed/simple;
	bh=1E47PqxTJ5L7o8edDg7vV3GOuHVMnxQaST22oQSQedg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y2+1K/W7y+J0SlXK7l80frJ7Imp7kAH/IxPVK5vp2Sw/K0ae2H8thyrTDOniGl6iBjHNYHb13EiGVWirfPbXLU2GZ68bHTsS9Jz10Sq+RDq802wlTVtRRxKPadhWY3gfSNiyekih+3XMfygCN5a4Uan1o7S0gHxnAXf0r3SDBuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IwHyR2lY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.local (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C39010D8;
	Mon, 11 Nov 2024 18:36:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731346600;
	bh=1E47PqxTJ5L7o8edDg7vV3GOuHVMnxQaST22oQSQedg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IwHyR2lY/oMqjI0QTO+toohulmV/DW2gZhiG6DU74tk7ao9pL6pEo3QDLMX1EGkVT
	 lXBV50leAbce/6OB/ShHptjp7NuRXlr5WhuB1RpZer+P8G0qmqDctD3VCXzXtE1Fl3
	 Gnqp7SwN3PV19kKBlELl4qhLhCRE3wqDYdOt5Isk=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v5 2/2] media: uvcvideo: Add new quirk definition for the Sonix Technology Co. 292a camera
Date: Mon, 11 Nov 2024 17:36:39 +0000
Message-ID: <20241111173639.25131-3-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241111173639.25131-1-isaac.scott@ideasonboard.com>
References: <20241111173639.25131-1-isaac.scott@ideasonboard.com>
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


