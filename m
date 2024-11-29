Return-Path: <linux-media+bounces-21904-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D339D700E
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 14:26:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62BB9283F31
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 13:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A691E1035;
	Sun, 24 Nov 2024 12:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XLrtuXcr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680E014AD2D;
	Sun, 24 Nov 2024 12:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732453101; cv=none; b=Ubs2mX2Y0Z4AVZhRLprP3e99qU2iiPBy+DeRJ/RLCcbhqa7zMIktyzBKO+/opcpkqFyRJNHjMBYs/p+NTVKXcXHQi7S1K4Z7iT41vKuNuv0D47fErpjVfkghj7GYSg5NOgjsbEJKORphZA3DDmtOlwX1ae87t9ZDjPWEAshND4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732453101; c=relaxed/simple;
	bh=2HPEpfrIwJlFSRtt1OG6Ud9t0ly4CBNBlL5oJaRCwqw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PY6TpG7OrAsVa1Li4Q5ezPWGn2rXt7UK01cExydjAX1g2To09sQPDA7/LaiiC59uWLgJWD0zape3jNNCuZf5hRM1txF8V+u0it5fXNmQeJ77y/UcmS3kWxBD+27ON8c7NqyT04dO8BMajEsMcMkFXcxhxP6f5r4hOfAu+1I6lWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XLrtuXcr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A1BBC4CECC;
	Sun, 24 Nov 2024 12:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732453101;
	bh=2HPEpfrIwJlFSRtt1OG6Ud9t0ly4CBNBlL5oJaRCwqw=;
	h=From:To:Cc:Subject:Date:From;
	b=XLrtuXcrGvh3Rk2wcgiJy44Siuf7ShV9nkBQQUl4i1xTyRG19W3IeUtP6J/N2Fa7z
	 ohk2WvtD5HyUCRN1kuZykQPd0wpWL33ZYCpoFMZG9sJQEJOEqvBWyVsxAQMQQEbwF0
	 SRKbZrT3UHEM7Qyy6t0JiYGnvIZu/o63pXUsrfXX9XqlPMV2AU828E3/QB5eWWHYAG
	 wsnuP5PQle3+tfYVZoVFNY4olxeSuc3K28y7q6R4A3shOx0VXfPK2KS/nT7eBhQV1M
	 3rAZ2RTO3L80wfq6A7vC17Br4KShasM27IoH/AejPaPP10h2z4Gr+WorYK9wYjIkDx
	 jyMR1WPacAUgA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: David Given <dg@cowlark.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 1/5] media: uvcvideo: Add a quirk for the Kaiweets KTI-W02 infrared camera
Date: Sun, 24 Nov 2024 07:58:01 -0500
Message-ID: <20241124125817.3341248-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.286
Content-Transfer-Encoding: 8bit

From: David Given <dg@cowlark.com>

[ Upstream commit b2ec92bb5605452d539a7aa1e42345b95acd8583 ]

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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Link: https://lore.kernel.org/r/20240918180540.10830-2-dg@cowlark.com
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 2f913ea44b281..2c2ceb50500ce 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2425,6 +2425,8 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
  * The Logitech cameras listed below have their interface class set to
  * VENDOR_SPEC because they don't announce themselves as UVC devices, even
  * though they are compliant.
+ *
+ * Sort these by vendor/product ID.
  */
 static const struct usb_device_id uvc_ids[] = {
 	/* LogiLink Wireless Webcam */
@@ -2893,6 +2895,15 @@ static const struct usb_device_id uvc_ids[] = {
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
2.43.0


