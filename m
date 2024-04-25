Return-Path: <linux-media+bounces-10117-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF25A8B22A1
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 15:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CFE11C2105B
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 13:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03BAC149C5E;
	Thu, 25 Apr 2024 13:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iprldJVc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86BE1494BC
	for <linux-media@vger.kernel.org>; Thu, 25 Apr 2024 13:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714051638; cv=none; b=AiObav965RTeZcomjvt1Qzi0zw5c5ji6RLgRe+5wDi9sUYiId/FwCg3s5JuwiMoR4kGALrqNAk85ZMX/TyRCs7w+onkFvahr0gmeXbk7nZBOqDOf9stYRG90PlLe6LZb7jMT9OcpQCoTwnV+qWVPhVyBp4uC5OkG9FrmvgisjKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714051638; c=relaxed/simple;
	bh=/N2IazfM9XbasLYktR2Zurx8zmy+ly3wLUCERcohGhE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mUoSHJI7RAZqtU4EjP3pK2RdcNqyMBRm2FMevQ6/4UwrU+D+3RoMbY+nb51l3Bhclv39n8xpTsUuVRr+6QNWiKy5PaoMPlHmdV7qqWK71aEpdfmAsRSaHSZ5ADPGMXNfZ7WN4Mbb3xnjYlWihsNClPg6dumkq81x9xRdhxLooys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iprldJVc; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5723edf0ae5so852712a12.0
        for <linux-media@vger.kernel.org>; Thu, 25 Apr 2024 06:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714051635; x=1714656435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pJsyCc6S0yIZyvOGVbCtUUVVfWrjq/y7T7qoMVFfbPs=;
        b=iprldJVc7IVY6wstXjzHcdwqiqExwJ4vJzfFnV9aKym8ptEJyA+P/AMK1AKz47cO7C
         U1oXhu7gaYhEAk14eWl8ShxIX1QSpJ9nEzqbuT0kYJbKRMVsknFMnx8HCaVUPUcVT2Jo
         j2YioRGsy5dpPEiGQVxPuBjmniF0HZmHxsn01XZeyAyeaue4wTlaDmX3oBidba+vD3ki
         6M9kyBzmKXadcfksDrCYGA/lJ5mMr1SvkQRPIF07ACrQYXOg44T8uaj8JYJRWIh3JKQM
         +CujVB7nahj63VlPKzIXZLB1K+kkqBV16Ql+7rd4JXMqwlNsZGjmFMl1/32dXOGd5w7x
         8/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714051635; x=1714656435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJsyCc6S0yIZyvOGVbCtUUVVfWrjq/y7T7qoMVFfbPs=;
        b=OilWo2RduRjtKNUspjdsSBiVbxFq/TD8tTKtYSxn2Ts+4eSAsLaZV+uxr/mOYCuszf
         Qya8hp/z7f7Ee5qQKmDWNotr70di0iy00jJwm5uPQCZnSx6mMmuTJDTzEUxtgPsnlfb9
         bwPriBc+uaApWr9hz2xVyRp2nVNUpdPR5iDy6vJxl3u8GolILl3gvjWB+VRrLGtypJGi
         Zg8o3yJpGvYBQu5lMLT3JMTQjYnk0l3NkCDM+3ulckQTzI6mBInLfsQQZcuF3ACuSyVu
         1e8edpMlMsmGjXjyOp3gNal31oc9RrbdsiCoVa4aI1w/BNR+8pRt4KWP0qshaLUwN1D5
         3Otw==
X-Gm-Message-State: AOJu0Yzc9IOo9UlZfoxyCygJoUTEXTrbPtQdkP2bYA5EKkSClK5p6Gff
	AWnqQ91RztOKExxdeZiV1RkxFRwhcCa0eLDgNJgr8d12aLhJD8YgNTmDsdjairoMkw==
X-Google-Smtp-Source: AGHT+IGnKXk4RfMQsVE1LIJze+SuAD22R2IOrCa7Kfe9xEEtDMkz5mjSsYJHvDPo16GdvAdr/Mkcgg==
X-Received: by 2002:a50:cc92:0:b0:572:1625:ae99 with SMTP id q18-20020a50cc92000000b005721625ae99mr4070554edi.31.1714051634792;
        Thu, 25 Apr 2024 06:27:14 -0700 (PDT)
Received: from localhost.localdomain ([46.161.125.46])
        by smtp.googlemail.com with ESMTPSA id es16-20020a056402381000b00572253b8d8dsm2650343edb.71.2024.04.25.06.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 06:27:14 -0700 (PDT)
From: Ilyas Erezhepov <localevil3@gmail.com>
To: linux-media@vger.kernel.org
Cc: Ilyas Erezhepov <localevil3@gmail.com>,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH] Add "Quanta ACER HD User Facing" devices.
Date: Thu, 25 Apr 2024 15:23:06 +0200
Message-ID: <20240425132334.18546-2-localevil3@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds two built-in video cameras for Acer laptops.

Signed-off-by: Ilyas Erezhepov <localevil3@gmail.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

---
 drivers/media/usb/uvc/uvc_driver.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 08fcd2ffa727..502c03b6dabe 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2454,6 +2454,29 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_15,
 	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
+	/* Quanta ACER HD User Facing  0x4035 */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor 		= 0x0408,
+	  .idProduct 		= 0x4035,
+	  .bInterfaceClass 	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass 	= 1,
+	  .bInterfaceProtocol 	= UVC_PC_PROTOCOL_15,
+	  .driver_info 		= (kernel_ulong_t) &(const struct uvc_device_info ) {
+		.uvc_version = 0x010a, 
+	  } 
+	},									
+	/* Quanta ACER HD User Facing 4033 */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor 		= 0x0408,
+	  .idProduct 		= 0x4033,
+	  .bInterfaceClass 	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass 	= 1,
+	  .bInterfaceProtocol 	= UVC_PC_PROTOCOL_15,
+	  .driver_info 		= (kernel_ulong_t) &(const struct uvc_device_info ) {
+		.uvc_version = 0x010a, } 
+	},
 	/* LogiLink Wireless Webcam */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
-- 
2.44.0


