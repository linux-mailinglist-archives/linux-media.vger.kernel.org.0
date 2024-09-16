Return-Path: <linux-media+bounces-18316-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA84997A7BD
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2024 21:20:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1BB41C238A9
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2024 19:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 157DC15F41B;
	Mon, 16 Sep 2024 19:20:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA1E15C13B
	for <linux-media@vger.kernel.org>; Mon, 16 Sep 2024 19:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726514431; cv=none; b=OGJTjRe8Q4Xe6ilN8clagflcIXLB9TrfwdtIll/OJlHo8sRmUwZMQvW5fGEdafEG8uI3hVwwHr0Xqt3sBDNbNiHzTwxL//3BriFBQylvxDW1tDjOA9mueNS7UIZUOL46/118MSFY/sjK5AEeS6K2v35BtpO5wZ0IDw8baGHhCJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726514431; c=relaxed/simple;
	bh=QX59rQ3klLVZ8bH5CX8/N1IEErnLsPT2o8OgEaaJvsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cXTrqGWLnc9iQvbG3v+pw+HI0NTsPqGqE6YfiB0r4ysO6YOon7rAyGuP22Po+2FnNQ2JBdUGk6z3lUOYV6o+yolwLDb3QgBBi0NxbBMBnEcsSs9q/nFAu6BpmrR3jHKb3V4V88Z9pGAxmAQqfmpjQ1cgFlJd5ir6ZF+BtK5B+Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=cowlark.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=cowlark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-374bfc395a5so3120386f8f.0
        for <linux-media@vger.kernel.org>; Mon, 16 Sep 2024 12:20:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726514428; x=1727119228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ESVKnGI4iuJIOKoeAuSEdxVodCqfxwnrdSZ4IitFn5c=;
        b=Wq16eECQtHs+y+JTNdP/D4UxP0PFXFo4Lm0+097XGLWIi6lLI5eXdlIhI/cMiWYNET
         2igzWVL/214TVg6o5wxbfbVIU+OZ4s6HwGPKT9Tvc8KVfklIOWCkqT2FPLH2toZtwLiq
         2jdcJpwbbNzK9V00+fsKbwtv2QptUewIdqU5CpU0VUdNCHdih+rsLH94QGzWipXlVsH/
         EPP6c8T84CVQ1i8VmN65bgxLTsMoc0wHPVnAp/Q70Ky1+kqUSyEHFuhKA//6Tbs0LRP2
         yAqktO+A+ixjokvIEP4Kae2BxRtDxdJrS3J6LB9z1Z/6US1AH88cG3pDuzJyYMSTdRQg
         i7LA==
X-Gm-Message-State: AOJu0Yxs311T8/kfjpDbnRCpoJAmkfKs8kVOvnPJsno0knuaoPzDotuD
	ecuy9uS9mk+J329u6epFXN46fOBMK20wPFSmSWF+JhveTWTyfKjAfPe50Q==
X-Google-Smtp-Source: AGHT+IHyVfVtpXS0ZwZnXRsR3wskg2GcRc4+0c4K8lD5mACPHeP6fho9/wSDHg8GmNIyrryth9g0Fg==
X-Received: by 2002:a5d:5745:0:b0:374:ca0c:51b0 with SMTP id ffacd0b85a97d-378c27a8a55mr9987910f8f.12.1726514428055;
        Mon, 16 Sep 2024 12:20:28 -0700 (PDT)
Received: from hilfy.lan ([2a02:169:1b5::22c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e7800299sm7826508f8f.73.2024.09.16.12.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 12:20:27 -0700 (PDT)
From: David Given <dg@cowlark.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	David Given <dg@cowlark.com>
Subject: [PATCH 2/2] Add a quirk for the NXP Semiconductors chipset, as used by the Kaiweets KTI-W02 infrared camera.
Date: Mon, 16 Sep 2024 21:14:07 +0200
Message-ID: <20240916191405.27373-4-dg@cowlark.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240916191405.27373-2-dg@cowlark.com>
References: <20240916191405.27373-2-dg@cowlark.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a quirk to made the NXP Semiconductors 1fc9:009b chipset work.

---
 drivers/media/usb/uvc/uvc_driver.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index f0febdc08..37f5d8346 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2428,6 +2428,8 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
  * The Logitech cameras listed below have their interface class set to
  * VENDOR_SPEC because they don't announce themselves as UVC devices, even
  * though they are compliant.
+ * 
+ * Sort these by vendor/product ID.
  */
 static const struct usb_device_id uvc_ids[] = {
 	/* Quanta ACER HD User Facing */
@@ -2964,6 +2966,15 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_PROBE_MINMAX
 					| UVC_QUIRK_IGNORE_SELECTOR_UNIT) },
+	/* NXP Semiconductors IR VIDEO */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x1fc9,
+	  .idProduct		= 0x009b,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },
 	/* Oculus VR Positional Tracker DK2 */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
-- 
2.45.2


