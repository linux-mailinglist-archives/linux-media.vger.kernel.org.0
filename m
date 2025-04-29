Return-Path: <linux-media+bounces-31323-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D1499AA0DBF
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 15:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE0997B38E3
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 13:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8DF32D29D5;
	Tue, 29 Apr 2025 13:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MqJP1k2d"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501FE2C257C
	for <linux-media@vger.kernel.org>; Tue, 29 Apr 2025 13:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745934451; cv=none; b=VPY98D0QdmikPD6T5B/RAdKtthc0xz4S2sRkuxu0morBqx0cBkUFeg4c97bNXh3LNTCAi/M07L0ckEjN/a4F1vCnmYNLtO7AYyRc/18XSfahWWwmVDPeLLzHAoC5LJ/RXlffHMnSprMWND42n3DlXDdvUmQtFmAa7Z8usnubhco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745934451; c=relaxed/simple;
	bh=pof8yP94mdDttGxh38mnBzB+VgpR9Ua691PVjYsd7vg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IOv8PGVId+ZE5Y+Zdt26/5o+w/O/a9AdaLYBYlDLHJsj7gL8esZszlCYKFlkvZsOr5n/rI9g6aw+F6xypkhw4dmTt2BhG1m7UP/cIzPpn1Fw7D3gaq1jagwiodN5nO7YytWko6txBSz20kBiV328QiafPs2/giaymFs6ZhtQjSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MqJP1k2d; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54d6f933152so8193989e87.1
        for <linux-media@vger.kernel.org>; Tue, 29 Apr 2025 06:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745934447; x=1746539247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3XSmQ7kUSeus5/Dn9M1UsGJBVKzSt+OwJlM1ExhsSwA=;
        b=MqJP1k2dMmpljq7hfyaRaNSzl2+sfX2/O59VG5ZLEYflC4gw2yrzflUxfLxXiR/aN0
         ogQOdasG9l769F8wRRausRiOjuxDdFUyae8tsZKdajzMDXaeyi/FYFQjTppRh53rjgnn
         3gO5swvnIteCJRi+oDrQG9enuq8BoJalAXG5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745934447; x=1746539247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3XSmQ7kUSeus5/Dn9M1UsGJBVKzSt+OwJlM1ExhsSwA=;
        b=EMjShPsKqBP7TrggEb2kSfmfQLJM5wlSz102bhupfKBlxtWlInhxbBaM2awMQ6UYSB
         Y2hIGmfdcyiI6gDn/5557P8+VjKu7Zi6XHh6g8i6syB63qwN6viMsnF9xoVggKmdvG6x
         AicVf3aIbF/R8RyI4KJiGh0BNUe884In+82a2Uzqcr7agDrYcOW4fevX+mcM1HC9nAIf
         9eKvSMO3GwRAHafubHrUJD7+sdeEAC5fXhbJ49O3ZFgW/X1hUZl5agnJ2PUS0dMZ8eJr
         O2/spDLRpekDWGNwlIM6fQa2lNDzM2N0K3K1LdcCsua3NUdu1eLrRKHqE9Qwp/iwVYVh
         Uzdw==
X-Forwarded-Encrypted: i=1; AJvYcCX2/ubIyek+JjOiKz6oyb4fM6gI+f4W94rbBculczL9QNhmaZ/xmcvXeWrCBwPMgMEikcyv4XL/tZOo5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5YPG5CPlzbo15+1DSrG9huWjytxledLW53xT6s6ReZ7V8J/Ee
	tCOe8VRUL4XfYv1iPCCXZCnxbE/nOtlMkQWNDoZuYpelHrd9G5aOFXenRh1keA==
X-Gm-Gg: ASbGncuEE0utRBH6iP3aRc8v5f/Dl+7z01mstGdOL3PURswl61PoTMi6xzCSERVMYG3
	sVNDgLBlOO48l4kYydQ9PqkiWJvq7bKtpNiRkNJqg4r0X+DCe7ZSpbW6qdTeYCb0zVVKbmx2GSH
	zrsX4V1eBnKACL5XotMjO9smWKmrpRAu43gEBEPbqDwC1raYt5zDOy2swedfaR+1iS//TSjzgiO
	Iw50Q/6GT600tlV9Fj8zVjGNQv3lgyWG7Fhv3Mw0Hk5OvRC5KcXBk3zorXCgKkfsmYyxaLEKBt+
	GHHaiM0unuXNXN3QXwqrlz0AkF60ndNHZ4LdA4LHHlF/bjg8I7zzyXZHdty6/xxdhDdmvyd1JVW
	QedXRViozQ1c7oV5NnRZm
X-Google-Smtp-Source: AGHT+IFYLnU/7fMeN0Gg9PDxITl1rxZMa5y1OVRvGbZ9W4xGotKJbK9Iqb9KCh2ZoNTNWOCeuSZIIA==
X-Received: by 2002:ac2:5d47:0:b0:545:8a1:5379 with SMTP id 2adb3069b0e04-54e90001400mr3315662e87.43.1745934447538;
        Tue, 29 Apr 2025 06:47:27 -0700 (PDT)
Received: from ribalda.c.googlers.com (228.231.88.34.bc.googleusercontent.com. [34.88.231.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb2626fsm1902375e87.46.2025.04.29.06.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 06:47:27 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 29 Apr 2025 13:47:26 +0000
Subject: [PATCH 2/2] media: uvcvideo: Add keep-sorted statement and sort
 uvc_ids
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-keep-sorted-v1-2-2fa3538c0315@chromium.org>
References: <20250429-keep-sorted-v1-0-2fa3538c0315@chromium.org>
In-Reply-To: <20250429-keep-sorted-v1-0-2fa3538c0315@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hans@jjverkuil.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

We had some quirks that were out of order.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 70 ++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 33 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 7ced8980543af5a207938d12a5eb833ee8a34c38..5f93a586c55936b0b41276b85df4456b64662fb0 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2500,6 +2500,8 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
  * Sort these by vendor/product ID.
  */
 static const struct usb_device_id uvc_ids[] = {
+	/* keep-sorted start block=yes */
+
 	/* Quanta ACER HD User Facing */
 	{
 	  .idVendor		= 0x0408,
@@ -2603,108 +2605,108 @@ static const struct usb_device_id uvc_ids[] = {
 	  .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	},
-	/* Logitech Quickcam Fusion */
+	/* Logitech HD Pro Webcam C920 */
 	{
 	  .idVendor		= 0x046d,
-	  .idProduct		= 0x08c1,
-	  .bInterfaceClass	= USB_CLASS_VENDOR_SPEC,
+	  .idProduct		= 0x082d,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_RESTORE_CTRLS_ON_INIT
+					       | UVC_QUIRK_INVALID_DEVICE_SOF),
 	  .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	},
-	/* Logitech Quickcam Orbit MP */
+	/* Logitech HD Pro Webcam C922 */
 	{
 	  .idVendor		= 0x046d,
-	  .idProduct		= 0x08c2,
-	  .bInterfaceClass	= USB_CLASS_VENDOR_SPEC,
+	  .idProduct		= 0x085c,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_INVALID_DEVICE_SOF),
 	  .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	},
-	/* Logitech Quickcam Pro for Notebook */
+	/* Logitech Rally Bar Huddle */
 	{
 	  .idVendor		= 0x046d,
-	  .idProduct		= 0x08c3,
-	  .bInterfaceClass	= USB_CLASS_VENDOR_SPEC,
+	  .idProduct		= 0x087c,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_NO_RESET_RESUME),
 	  .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	},
-	/* Logitech Quickcam Pro 5000 */
+	/* Logitech Rally Bar */
 	{
 	  .idVendor		= 0x046d,
-	  .idProduct		= 0x08c5,
-	  .bInterfaceClass	= USB_CLASS_VENDOR_SPEC,
+	  .idProduct		= 0x089b,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_NO_RESET_RESUME),
 	  .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	},
-	/* Logitech Quickcam OEM Dell Notebook */
+	/* Logitech Quickcam Fusion */
 	{
 	  .idVendor		= 0x046d,
-	  .idProduct		= 0x08c6,
+	  .idProduct		= 0x08c1,
 	  .bInterfaceClass	= USB_CLASS_VENDOR_SPEC,
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	},
-	/* Logitech Quickcam OEM Cisco VT Camera II */
+	/* Logitech Quickcam Orbit MP */
 	{
 	  .idVendor		= 0x046d,
-	  .idProduct		= 0x08c7,
+	  .idProduct		= 0x08c2,
 	  .bInterfaceClass	= USB_CLASS_VENDOR_SPEC,
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	},
-	/* Logitech HD Pro Webcam C920 */
+	/* Logitech Quickcam Pro for Notebook */
 	{
 	  .idVendor		= 0x046d,
-	  .idProduct		= 0x082d,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .idProduct		= 0x08c3,
+	  .bInterfaceClass	= USB_CLASS_VENDOR_SPEC,
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
-	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_RESTORE_CTRLS_ON_INIT
-					       | UVC_QUIRK_INVALID_DEVICE_SOF),
 	  .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	},
-	/* Logitech HD Pro Webcam C922 */
+	/* Logitech Quickcam Pro 5000 */
 	{
 	  .idVendor		= 0x046d,
-	  .idProduct		= 0x085c,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .idProduct		= 0x08c5,
+	  .bInterfaceClass	= USB_CLASS_VENDOR_SPEC,
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
-	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_INVALID_DEVICE_SOF),
 	  .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	},
-	/* Logitech Rally Bar Huddle */
+	/* Logitech Quickcam OEM Dell Notebook */
 	{
 	  .idVendor		= 0x046d,
-	  .idProduct		= 0x087c,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .idProduct		= 0x08c6,
+	  .bInterfaceClass	= USB_CLASS_VENDOR_SPEC,
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
-	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_NO_RESET_RESUME),
 	  .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	},
-	/* Logitech Rally Bar */
+	/* Logitech Quickcam OEM Cisco VT Camera II */
 	{
 	  .idVendor		= 0x046d,
-	  .idProduct		= 0x089b,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .idProduct		= 0x08c7,
+	  .bInterfaceClass	= USB_CLASS_VENDOR_SPEC,
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
-	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_NO_RESET_RESUME),
 	  .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	},
@@ -3352,6 +3354,8 @@ static const struct usb_device_id uvc_ids[] = {
 	  .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	},
+
+	/* keep-sorted end */
 	/* Generic USB Video Class */
 	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_UNDEFINED) },
 	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_15) },

-- 
2.49.0.901.g37484f566f-goog


