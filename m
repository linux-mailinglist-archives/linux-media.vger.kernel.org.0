Return-Path: <linux-media+bounces-18390-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6060E97BFFB
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 20:06:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2309C2827D6
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 18:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51E11C9ECC;
	Wed, 18 Sep 2024 18:05:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FB117C98E
	for <linux-media@vger.kernel.org>; Wed, 18 Sep 2024 18:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726682753; cv=none; b=jQrpLdrpM8Z5ZyBG0etim68El3Hs1Uimu/bpqOQ5i9nSE7TR+rueGcE8yJ/j+gC6tuCHGa9aHQboOm+G6ugaqUONjV9YED0ZW9CToUEZblIokV56Q07vM+LUey23wsS9vTrZi0+ft3A1clYI+o+JZvS3oQYsz4tnpLJJmFue8SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726682753; c=relaxed/simple;
	bh=fhJsbcqo8NwTgz//CDf/BCaxevFhfOLRbjAow/pRVas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l6MQV4m0xHT+MWbZVY/dm+T20cFLFbKT+qX9EzOFlLyKzwlKtImasf4vjuiaqZjgzNzY5ZAX/FYyyxpTR/FUk+ePEBS/r6HXnDjiwPWFE1GU7Hbt2CkOAzdZPpv4BPHq+TsNd5fcD8Ff5U1Pb6RIoe/V+ZwNAyuRUNjwT2TAUs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=cowlark.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=cowlark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42cae6bb895so69884345e9.1
        for <linux-media@vger.kernel.org>; Wed, 18 Sep 2024 11:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726682749; x=1727287549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LV8eKYDBIAo1gq26g7oBzanqOtetRZ4z8Sqcj3oepok=;
        b=K6qH2xif2bRqnGG2jynIE6b9jqr1BaehAuVsRdY3jSXrmTXekU1vwgsLnHe3uhiBLe
         jy4QoEvhMdCyWlBRWPmARYB7DN/1f4o7OTa3IeWXFc00JwVMq19clbrJzvOKiIzCIdUL
         iYrQEB4CkrFiKBzxWQDK+9/7FJ7lWaaT2eTveL5Wrj+Pugngztq666Dwyn4N4FZCbDBz
         xscR2+3KybLFq3SoiARM7cttns2X1AoSqDyCyMGRrUJjifPyF5ulIhndVXVscOs5UHC+
         cscUzt883F7CfktkyR3S58+v94S3BD38W+YWEupJjg2ZI0iSiGzm0N5p91tH67+xMhIb
         pslQ==
X-Gm-Message-State: AOJu0YzuTO5XpXTTdx8hY3pgvItaImD8U9sXl0JawCRSLe7VIADi8imi
	uRPZo3dCW3pb/tcT73KI9m+N7bYsLVgNdikyfIv64opDt/zUd9zchAOSDw==
X-Google-Smtp-Source: AGHT+IFoRv4Gk+mySjEja94TY2BGYxbY73Dnz309jnf4lWRju4s289+dFkspZQJKRIz6ax0jMtp2IA==
X-Received: by 2002:adf:efc9:0:b0:374:cbe8:6f43 with SMTP id ffacd0b85a97d-378c2d12462mr13198236f8f.33.1726682749174;
        Wed, 18 Sep 2024 11:05:49 -0700 (PDT)
Received: from hilfy.lan ([2a02:169:1b5::22c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e7804476sm13001024f8f.90.2024.09.18.11.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 11:05:48 -0700 (PDT)
From: David Given <dg@cowlark.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	David Given <dg@cowlark.com>
Subject: [PATCH v3 2/2] media: add a quirk for the NXP Semiconductors chipset, as used by the Kaiweets KTI-W02 infrared camera.
Date: Wed, 18 Sep 2024 20:05:40 +0200
Message-ID: <20240918180540.10830-2-dg@cowlark.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240918180540.10830-1-dg@cowlark.com>
References: <20240918180540.10830-1-dg@cowlark.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a quirk to make the NXP Semiconductors 1fc9:009b chipset work.

lsusb for the device reports:

Bus 003 Device 011: ID 1fc9:009b NXP Semiconductors IR VIDEO
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 [unknown]
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x1fc9 NXP Semiconductors
  idProduct          0x009b IR VIDEO
  bcdDevice            1.01
  iManufacturer           1 Guide sensmart
  iProduct                2 IR VIDEO
  iSerial                 0 
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x00c2
    bNumInterfaces          2
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0xc0
      Self Powered
    MaxPower              100mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         2
      bFunctionClass         14 Video
      bFunctionSubClass       3 Video Interface Collection
      bFunctionProtocol       0 
      iFunction               3 IR Camera
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      1 Video Control
      bInterfaceProtocol      0 
      iInterface              0 
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdUVC               1.00
        wTotalLength       0x0033
        dwClockFrequency        6.000000MHz
        bInCollection           1
        baInterfaceNr( 0)       1
      VideoControl Interface Descriptor:
        bLength                18
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0201 Camera Sensor
        bAssocTerminal          0
        iTerminal               0 
        wObjectiveFocalLengthMin      0
        wObjectiveFocalLengthMax      0
        wOcularFocalLength            0
        bControlSize                  3
        bmControls           0x00000000
      VideoControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             2
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               1
        iTerminal               0 
      VideoControl Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      5 (PROCESSING_UNIT)
      Warning: Descriptor too short
        bUnitID                 3
        bSourceID               1
        wMaxMultiplier          0
        bControlSize            2
        bmControls     0x00000000
        iProcessing             0 
        bmVideoStandards     0x62
          NTSC - 525/60
          PAL - 525/60
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0008  1x 8 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      VideoStreaming Interface Descriptor:
        bLength                            14
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         1
        wTotalLength                   0x0055
        bEndpointAddress                 0x82  EP 2 IN
        bmInfo                              0
        bTerminalLink                       2
        bStillCaptureMethod                 2
        bTriggerSupport                     0
        bTriggerUsage                       0
        bControlSize                        1
        bmaControls( 0)                     0
      VideoStreaming Interface Descriptor:
        bLength                            27
        bDescriptorType                    36
        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
        bFormatIndex                        1
        bNumFrameDescriptors                1
        guidFormat                            {e436eb7b-524f-11ce-9f53-0020af0ba770}
        bBitsPerPixel                      16
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            240
        wHeight                           322
        dwMinBitRate                 12364800
        dwMaxBitRate                 30912000
        dwMaxVideoFrameBufferSize      154560
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)           1000000
      VideoStreaming Interface Descriptor:
        bLength                            10
        bDescriptorType                    36
        bDescriptorSubtype                  3 (STILL_IMAGE_FRAME)
        bEndpointAddress                 0x00  EP 0 OUT
        bNumImageSizePatterns               1
        wWidth( 0)                        240
        wHeight( 0)                       322
        bNumCompressionPatterns             0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
Device Status:     0x0001
  Self Powered

Signed-off-by: David Given <dg@cowlark.com>

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


