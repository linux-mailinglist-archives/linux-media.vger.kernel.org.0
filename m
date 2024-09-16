Return-Path: <linux-media+bounces-18315-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A2097A7B6
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2024 21:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2AA49B23AF9
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2024 19:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD7E15855C;
	Mon, 16 Sep 2024 19:19:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080F42BD08
	for <linux-media@vger.kernel.org>; Mon, 16 Sep 2024 19:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726514377; cv=none; b=SKToAaV5J8Q2Z2uhtUL5v6QVjQ0sbUaWyZ6RVSMb+O9xAvpwsMRUXc509kA0Lg6TKgYJ/SZ98TBCb1QfaYY58TeKmdtIkNQuSVzWp17caGJbqTqFaHbJV28aMQlhDSNcZp5Qcivcckj0oxnPbNRiefAAulKtAf0zBOwIh/83NBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726514377; c=relaxed/simple;
	bh=2o3Y+WM5C91e1aSeny8++7v9seANE3EzYLbDNdlVWaE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pPS7wgTwpCLAp8bOdjweOoV9MLyGZJKb8G1+KYh53vo8apV3fHIjCjA1tjnzOdw25S/aveiTxa3vV09UU4afo7aQckqZKLFYksF+FPCHAu5/z82j+CN3qBOfnq+sMQqwRqtsTO572QZi+0yAX1xK4Yxy+/HVDjAJFUEzXA8+0zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=cowlark.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=cowlark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4280ca0791bso47579095e9.1
        for <linux-media@vger.kernel.org>; Mon, 16 Sep 2024 12:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726514374; x=1727119174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZpZZXZzX3Duxo2d1+n+upHFA2y5+dnJtBIScVQbibx8=;
        b=P9PtkcoNsGxbWKUex86Gu/8i6LAs/N2EuEsDdXzJS5gbF/W7tLuvCIIXH1niof1430
         h15l0qyC1vkdH6oCc3Vl45W5vp/Mbu3fp2LupKwNdwSCvnjkoaWjI8pHJs6wglmZDDq9
         pUxp9TNxN4t1NqFhb3xoeWx7PwM3D0lwjy+og3b/xRgztZo9pqXvidHMpkR5Z7GKVLGF
         mm/8OexHFVpsRCrstw67ZX7trm2McUCxjr/W/jTini5aWw9IZkXKDFhYeGmv1RUIfKKq
         1LbBlkUbSdDIozxsdeVJhcXxFqERpV/vkr8eJdk3V/oR3xUlV/BYf6il3y8RkvSosLRD
         vZMA==
X-Gm-Message-State: AOJu0Yw9xGX7WXaTJ2qASbiwPx8kuITT8/oEX4wSmQq19aMfgcPMOasy
	VgodAA7/sAYNvbDB3BzxJHA2yaGru37AtCA3KjFPZfHUK0N6o4RNZqNR6w==
X-Google-Smtp-Source: AGHT+IENjw3JNY0E4Usyd5T1jvM56hVJaEZeM2S/B7q0LugNgt/uxSSHmTz9IL31lvR5CQG1krKAXw==
X-Received: by 2002:adf:f64f:0:b0:374:c142:80e7 with SMTP id ffacd0b85a97d-378c2cfecfbmr8605491f8f.1.1726514373768;
        Mon, 16 Sep 2024 12:19:33 -0700 (PDT)
Received: from hilfy.lan ([2a02:169:1b5::22c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e7800299sm7826508f8f.73.2024.09.16.12.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 12:19:33 -0700 (PDT)
From: David Given <dg@cowlark.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	David Given <dg@cowlark.com>
Subject: [PATCH 1/2] Add support for the D3DFMT_R5G6B5 pixmap type.
Date: Mon, 16 Sep 2024 21:14:05 +0200
Message-ID: <20240916191405.27373-2-dg@cowlark.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This media format is used by the NXP Semiconductors 1fc9:009b chipset,
used by the Kaiweets KTI-W02 infrared camera.

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

---
 drivers/media/common/uvc.c | 4 ++++
 include/linux/usb/uvc.h    | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
index c54c2268f..c12d58932 100644
--- a/drivers/media/common/uvc.c
+++ b/drivers/media/common/uvc.c
@@ -96,6 +96,10 @@ static const struct uvc_format_desc uvc_fmts[] = {
 		.guid		= UVC_GUID_FORMAT_RGBP,
 		.fcc		= V4L2_PIX_FMT_RGB565,
 	},
+	{
+		.guid		= UVC_GUID_FORMAT_D3DFMT_R5G6B5,
+		.fcc		= V4L2_PIX_FMT_RGB565,
+	},
 	{
 		.guid		= UVC_GUID_FORMAT_BGR3,
 		.fcc		= V4L2_PIX_FMT_BGR24,
diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
index 88d96095b..01c3b2f45 100644
--- a/include/linux/usb/uvc.h
+++ b/include/linux/usb/uvc.h
@@ -140,6 +140,9 @@
 #define UVC_GUID_FORMAT_D3DFMT_L8 \
 	{0x32, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, \
 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_D3DFMT_R5G6B5 \
+	{0x7b, 0xeb, 0x36, 0xe4, 0x4f, 0x52, 0xce, 0x11, \
+	 0x9f, 0x53, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70}
 #define UVC_GUID_FORMAT_KSMEDIA_L8_IR \
 	{0x32, 0x00, 0x00, 0x00, 0x02, 0x00, 0x10, 0x00, \
 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-- 
2.45.2


