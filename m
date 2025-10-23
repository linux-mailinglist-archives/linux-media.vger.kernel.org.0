Return-Path: <linux-media+bounces-45373-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AACCC00A08
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 13:08:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5291C19A53CC
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 11:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA30E30C345;
	Thu, 23 Oct 2025 11:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="not an e-mail key" (0-bit key) header.d=floofy.city header.i=@floofy.city header.b="cycY2Tus"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.automatia.nl (mail.automatia.nl [178.251.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DA22E0B68
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 11:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761217676; cv=none; b=euyhauhHra3xjeTRsZc9GpxQEI4a15VOnoHW7O3rSSJyR6NesaooXTz6/55Yuw4pJi7iP9kr/cEixFvaf0JpXj/gOfH24FepY406smsrdliOS7AcZgW8UmHLGg+8JgB8BHM7xChCrcc+box6T1Kd1QxDdFFBNCYG0YOlPP5in/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761217676; c=relaxed/simple;
	bh=05ZDUPZOfN+8BYuIsmFFRdzHMJT7tLM39xIhIrMFiZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ckP3JxLA/Cy71eMcAQH618+kKno1Doly4dxRKRpOaiTHppf3ZU8Dc2Yklfp2oYryks7CFB/vpJLPlfuJmr9IbVDdLAoDmYvmB06itmN35cVZqsUvTq6y/pb/4fJ+7e44pBFttg8wAh+pojU3yI7bcfqmJwemEIKCqy67acmou2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=floofy.city; spf=pass smtp.mailfrom=floofy.city; dkim=fail (0-bit key) header.d=floofy.city header.i=@floofy.city header.b=cycY2Tus reason="not an e-mail key"; arc=none smtp.client-ip=178.251.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=floofy.city
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=floofy.city
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A14A69FADB;
	Thu, 23 Oct 2025 13:07:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=floofy.city; s=mail;
	t=1761217670; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=3ECpbngnfF3VkgaPvZCUJM4eM8b7IP1YvcvH5EadPYw=;
	b=cycY2TusvKLB7R0uAMUS48NSHuujiR7qWzXc7auvM14wr+S30tQxccMzcmTojcaVn6gHob
	v5cY+YY7yBQCotW23YtBOEsk02i+CPSw3VvxjN02rl8ZGqMgdGwtLTATuJL4CmvrmVrk2B
	gqeF9Sc5M0KVSqpGKuKpLyfs1pAFPdQ/1z0yvZgcc6MdIm/h77X4f+XfrbwCYo3seCGRj+
	Tel0zryUJ76c+GqsybnK8/wUceIw8wuz5cxNOOkPwo/SfEegOp1oPtOUcdKPgkzNpQaBED
	dY/dOF4pePgf9tEwuIp18PGejdptyxdewYAjC5OHj21W9I7tXRSt5Ycfq1Fdng==
Message-ID: <7dc01c6e-d9d7-4645-bd17-d0fc0f8b596d@floofy.city>
Date: Thu, 23 Oct 2025 13:07:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PROBLEM: regression in commit 0e2ee70291e64 breaks
 non-spec-compliant webcams
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: hansg@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org
References: <dd1c8e46-5616-4395-baac-56fdc4a67be2@floofy.city>
 <20251023103804.GH19043@pendragon.ideasonboard.com>
Content-Language: en-US
From: Lili Orosz <lily@floofy.city>
In-Reply-To: <20251023103804.GH19043@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Laurent,

Thank you for the quick reply.

Below is the output of the lsusb command:

```
Bus 001 Device 002: ID 1d6b:0105 Linux Foundation FunctionFS Gadget
Negotiated speed: High Speed (480Mbps)
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass          239 Miscellaneous Device
   bDeviceSubClass         2 [unknown]
   bDeviceProtocol         1 Interface Association
   bMaxPacketSize0        64
   idVendor           0x1d6b Linux Foundation
   idProduct          0x0105 FunctionFS Gadget
   bcdDevice            4.09
   iManufacturer           4 LSK Meeting Eye for Business & Home
   iProduct                5 LSK Meeting Eye for Business & Home
   iSerial                 0
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0b33
     bNumInterfaces          4
     bConfigurationValue     1
     iConfiguration          7 video
     bmAttributes         0xc0
       Self Powered
     MaxPower                2mA
     Interface Association:
       bLength                 8
       bDescriptorType        11
       bFirstInterface         0
       bInterfaceCount         2
       bFunctionClass         14 Video
       bFunctionSubClass       3 Video Interface Collection
       bFunctionProtocol       0
       iFunction               8 LSK Meeting Eye for Business & Home
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass        14 Video
       bInterfaceSubClass      1 Video Control
       bInterfaceProtocol      0
       iInterface              8 LSK Meeting Eye for Business & Home
       VideoControl Interface Descriptor:
         bLength                13
         bDescriptorType        36
         bDescriptorSubtype      1 (HEADER)
         bcdUVC               1.00
         wTotalLength       0x0072
         dwClockFrequency       48.000000MHz
         bInCollection           1
         baInterfaceNr( 0)       1
       VideoControl Interface Descriptor:
         bLength                18
         bDescriptorType        36
         bDescriptorSubtype      2 (INPUT_TERMINAL)
         bTerminalID             1
         wTerminalType      0x0201 Camera Sensor
         bAssocTerminal          0
         iTerminal               0
         wObjectiveFocalLengthMin      0
         wObjectiveFocalLengthMax      0
         wOcularFocalLength            0
         bControlSize                  3
         bmControls           0x00001e00
           Zoom (Absolute)
           Zoom (Relative)
           PanTilt (Absolute)
           PanTilt (Relative)
       VideoControl Interface Descriptor:
         bLength                12
         bDescriptorType        36
         bDescriptorSubtype      5 (PROCESSING_UNIT)
         bUnitID                 2
         bSourceID               1
         wMaxMultiplier      16384
         bControlSize            2
         bmControls     0x0000177f
           Brightness
           Contrast
           Hue
           Saturation
           Sharpness
           Gamma
           White Balance Temperature
           Backlight Compensation
           Gain
           Power Line Frequency
           White Balance Temperature, Auto
         iProcessing             0
         bmVideoStandards     0x00
       VideoControl Interface Descriptor:
         bLength                31
         bDescriptorType        36
         bDescriptorSubtype      6 (EXTENSION_UNIT)
         bUnitID                 3
         guidExtensionCode  {a29e7641-de04-47e3-8b2b-f4341aff003b}
         bNumControls           48
         bNrInPins               1
         baSourceID( 0)          2
         bControlSize            6
         bmControls( 0)       0xff
         bmControls( 1)       0xff
         bmControls( 2)       0xff
         bmControls( 3)       0xff
         bmControls( 4)       0xff
         bmControls( 5)       0xff
         iExtension              0
       VideoControl Interface Descriptor:
         bLength                31
         bDescriptorType        36
         bDescriptorSubtype      6 (EXTENSION_UNIT)
         bUnitID                 4
         guidExtensionCode  {ffe52d21-8030-4e2c-82d9-f587d00540bd}
         bNumControls           48
         bNrInPins               1
         baSourceID( 0)          2
         bControlSize            6
         bmControls( 0)       0xff
         bmControls( 1)       0xff
         bmControls( 2)       0xff
         bmControls( 3)       0xff
         bmControls( 4)       0xff
         bmControls( 5)       0xff
         iExtension              0
       VideoControl Interface Descriptor:
         bLength                 9
         bDescriptorType        36
         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
         bTerminalID             4
         wTerminalType      0x0101 USB Streaming
         bAssocTerminal          0
         bSourceID               3
         iTerminal               0
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      0
       iInterface              9 Video Streaming
       VideoStreaming Interface Descriptor:
         bLength                            14
         bDescriptorType                    36
         bDescriptorSubtype                  1 (INPUT_HEADER)
         bNumFormats                         1
         wTotalLength                   0x0a12
         bEndpointAddress                 0x81  EP 1 IN
         bmInfo                              0
         bTerminalLink                       4
         bStillCaptureMethod                 0
         bTriggerSupport                     0
         bTriggerUsage                       0
         bControlSize                        1
         bmaControls( 0)                     0
       VideoStreaming Interface Descriptor:
         bLength                            27
         bDescriptorType                    36
         bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
         bFormatIndex                        1
         bNumFrameDescriptors                8
         guidFormat {32595559-0000-0010-8000-00aa00389b71}
         bBitsPerPixel                      16
         bDefaultFrameIndex                  1
         bAspectRatioX                       0
         bAspectRatioY                       0
         bmInterlaceFlags                 0x00
           Interlaced stream or variable: No
           Fields per frame: 2 fields
           Field 1 first: No
           Field pattern: Field 1 only
         bCopyProtect                        0
       VideoStreaming Interface Descriptor:
         bLength                            34
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                         1
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                           1280
         wHeight                           720
         dwMinBitRate                 18432000
         dwMaxBitRate                110592000
         dwMaxVideoFrameBufferSize      460800
         dwDefaultFrameInterval        1000000
         bFrameIntervalType                  2
         dwFrameInterval( 0)           1000000
         dwFrameInterval( 1)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                         2
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                           1024
         wHeight                           576
         dwMinBitRate                 47185920
         dwMaxBitRate                283115520
         dwMaxVideoFrameBufferSize     1179648
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            34
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                         3
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            800
         wHeight                           600
         dwMinBitRate                 18432000
         dwMaxBitRate                110592000
         dwMaxVideoFrameBufferSize      460800
         dwDefaultFrameInterval        1000000
         bFrameIntervalType                  2
         dwFrameInterval( 0)           1000000
         dwFrameInterval( 1)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                         4
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            800
         wHeight                           448
         dwMinBitRate                 28672000
         dwMaxBitRate                172032000
         dwMaxVideoFrameBufferSize      716800
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            46
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                         5
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            640
         wHeight                           480
         dwMinBitRate                 24576000
         dwMaxBitRate                147456000
         dwMaxVideoFrameBufferSize      614400
         dwDefaultFrameInterval         400000
         bFrameIntervalType                  5
         dwFrameInterval( 0)            400000
         dwFrameInterval( 1)            500000
         dwFrameInterval( 2)            666666
         dwFrameInterval( 3)           1000000
         dwFrameInterval( 4)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                         6
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            640
         wHeight                           360
         dwMinBitRate                 18432000
         dwMaxBitRate                110592000
         dwMaxVideoFrameBufferSize      460800
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                         7
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            480
         wHeight                           270
         dwMinBitRate                 10368000
         dwMaxBitRate                 62208000
         dwMaxVideoFrameBufferSize      259200
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
         bFrameIndex                         8
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            320
         wHeight                           180
         dwMinBitRate                 18432000
         dwMaxBitRate                110592000
         dwMaxVideoFrameBufferSize      460800
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            11
         bDescriptorType                    36
         bDescriptorSubtype                  6 (FORMAT_MJPEG)
         bFormatIndex                        2
         bNumFrameDescriptors               14
         bFlags                              0
           Fixed-size samples: No
         bDefaultFrameIndex                  1
         bAspectRatioX                       0
         bAspectRatioY                       0
         bmInterlaceFlags                 0x00
           Interlaced stream or variable: No
           Fields per frame: 1 fields
           Field 1 first: No
           Field pattern: Field 1 only
         bCopyProtect                        0
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         1
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                           1920
         wHeight                          1080
         dwMinBitRate                165888000
         dwMaxBitRate                829440000
         dwMaxVideoFrameBufferSize     4147200
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         2
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                           1600
         wHeight                           896
         dwMinBitRate                114688000
         dwMaxBitRate                688128000
         dwMaxVideoFrameBufferSize     2867200
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         3
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                           1280
         wHeight                           720
         dwMinBitRate                 73728000
         dwMaxBitRate                442368000
         dwMaxVideoFrameBufferSize     1843200
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         4
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                           1024
         wHeight                           576
         dwMinBitRate                 47185920
         dwMaxBitRate                283115520
         dwMaxVideoFrameBufferSize     1179648
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         5
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            960
         wHeight                           540
         dwMinBitRate                207360000
         dwMaxBitRate                248832000
         dwMaxVideoFrameBufferSize     1036800
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         6
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            800
         wHeight                           600
         dwMinBitRate                 38400000
         dwMaxBitRate                230400000
         dwMaxVideoFrameBufferSize      960000
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         7
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            800
         wHeight                           448
         dwMinBitRate                 28672000
         dwMaxBitRate                172032000
         dwMaxVideoFrameBufferSize      716800
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         8
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            720
         wHeight                           576
         dwMinBitRate                 33177600
         dwMaxBitRate                199065600
         dwMaxVideoFrameBufferSize      829440
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         9
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            720
         wHeight                           480
         dwMinBitRate                 27648000
         dwMaxBitRate                165888000
         dwMaxVideoFrameBufferSize      691200
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                        10
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            640
         wHeight                           480
         dwMinBitRate                 24576000
         dwMaxBitRate                147456000
         dwMaxVideoFrameBufferSize      614400
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                        11
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            640
         wHeight                           360
         dwMinBitRate                 92160000
         dwMaxBitRate                110592000
         dwMaxVideoFrameBufferSize      460800
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                        12
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            480
         wHeight                           270
         dwMinBitRate                 10368000
         dwMaxBitRate                 62208000
         dwMaxVideoFrameBufferSize      259200
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                        13
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            352
         wHeight                           288
         dwMinBitRate                  8110080
         dwMaxBitRate                 48660480
         dwMaxVideoFrameBufferSize      202752
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                        14
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            320
         wHeight                           240
         dwMinBitRate                  6144000
         dwMaxBitRate                 36864000
         dwMaxVideoFrameBufferSize      153600
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            28
         bDescriptorType                    36
         bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
         bFormatIndex                        3
         bNumFrameDescriptors               14
         guidFormat {34363248-0000-0010-8000-00aa00389b71}
         bBitsPerPixel                      16
         bDefaultFrameIndex                  1
         bAspectRatioX                       0
         bAspectRatioY                       0
         bmInterlaceFlags                 0x00
           Interlaced stream or variable: No
           Fields per frame: 2 fields
           Field 1 first: No
           Field pattern: Field 1 only
         bCopyProtect                        0
         bVariableSize                     1
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
         bFrameIndex                         1
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                           1920
         wHeight                          1080
         dwMinBitRate                165888000
         dwMaxBitRate                829440000
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwBytesPerLine                      0
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
         bFrameIndex                         2
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                           1600
         wHeight                           896
         dwMinBitRate                103680000
         dwMaxBitRate                124416000
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwBytesPerLine                      0
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
         bFrameIndex                         3
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                           1280
         wHeight                           720
         dwMinBitRate                 73728000
         dwMaxBitRate                442368000
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwBytesPerLine                      0
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
         bFrameIndex                         4
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                           1024
         wHeight                           576
         dwMinBitRate                103680000
         dwMaxBitRate                124416000
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwBytesPerLine                      0
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
         bFrameIndex                         5
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            960
         wHeight                           540
         dwMinBitRate                103680000
         dwMaxBitRate                124416000
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwBytesPerLine                      0
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
         bFrameIndex                         6
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            800
         wHeight                           600
         dwMinBitRate                103680000
         dwMaxBitRate                124416000
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwBytesPerLine                      0
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
         bFrameIndex                         7
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            800
         wHeight                           448
         dwMinBitRate                103680000
         dwMaxBitRate                124416000
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwBytesPerLine                      0
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
         bFrameIndex                         8
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            720
         wHeight                           576
         dwMinBitRate                103680000
         dwMaxBitRate                124416000
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwBytesPerLine                      0
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
         bFrameIndex                         9
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            720
         wHeight                           480
         dwMinBitRate                 27648000
         dwMaxBitRate                165888000
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwBytesPerLine                      0
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
         bFrameIndex                        10
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            640
         wHeight                           480
         dwMinBitRate                103680000
         dwMaxBitRate                124416000
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwBytesPerLine                      0
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
         bFrameIndex                        11
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            640
         wHeight                           360
         dwMinBitRate                103680000
         dwMaxBitRate                124416000
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwBytesPerLine                      0
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
         bFrameIndex                        12
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            480
         wHeight                           270
         dwMinBitRate                103680000
         dwMaxBitRate                124416000
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwBytesPerLine                      0
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
         bFrameIndex                        13
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            352
         wHeight                           288
         dwMinBitRate                103680000
         dwMaxBitRate                124416000
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwBytesPerLine                      0
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
         bFrameIndex                        14
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            320
         wHeight                           240
         dwMinBitRate                103680000
         dwMaxBitRate                124416000
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwBytesPerLine                      0
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            28
         bDescriptorType                    36
         bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
         bFormatIndex                        4
         bNumFrameDescriptors               14
         guidFormat {35363248-0000-0010-8000-00aa00389b71}
         bBitsPerPixel                      16
         bDefaultFrameIndex                  1
         bAspectRatioX                       0
         bAspectRatioY                       0
         bmInterlaceFlags                 0x00
           Interlaced stream or variable: No
           Fields per frame: 2 fields
           Field 1 first: No
           Field pattern: Field 1 only
         bCopyProtect                        0
         bVariableSize                     1
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
         bFrameIndex                         1
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                           1920
         wHeight                          1080
         dwMinBitRate                165888000
         dwMaxBitRate                829440000
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwBytesPerLine                      0
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
         bFrameIndex                         2
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                           1600
         wHeight                           896
         dwMinBitRate                103680000
         dwMaxBitRate                124416000
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwBytesPerLine                      0
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
         bFrameIndex                         3
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                           1280
         wHeight                           720
         dwMinBitRate                 73728000
         dwMaxBitRate                442368000
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwBytesPerLine                      0
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
         bFrameIndex                         4
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                           1024
         wHeight                           576
         dwMinBitRate                103680000
         dwMaxBitRate                124416000
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwBytesPerLine                      0
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
         bFrameIndex                         5
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            960
         wHeight                           540
         dwMinBitRate                103680000
         dwMaxBitRate                124416000
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwBytesPerLine                      0
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
         bFrameIndex                         6
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            800
         wHeight                           600
         dwMinBitRate                103680000
         dwMaxBitRate                124416000
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwBytesPerLine                      0
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
         bFrameIndex                         7
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            800
         wHeight                           448
         dwMinBitRate                103680000
         dwMaxBitRate                124416000
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwBytesPerLine                      0
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
         bFrameIndex                         8
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            720
         wHeight                           576
         dwMinBitRate                103680000
         dwMaxBitRate                124416000
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwBytesPerLine                      0
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
         bFrameIndex                         9
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            720
         wHeight                           480
         dwMinBitRate                 27648000
         dwMaxBitRate                165888000
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwBytesPerLine                      0
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
         bFrameIndex                        10
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            640
         wHeight                           480
         dwMinBitRate                103680000
         dwMaxBitRate                124416000
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwBytesPerLine                      0
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
         bFrameIndex                        11
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            640
         wHeight                           360
         dwMinBitRate                103680000
         dwMaxBitRate                124416000
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwBytesPerLine                      0
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
         bFrameIndex                        12
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            480
         wHeight                           270
         dwMinBitRate                103680000
         dwMaxBitRate                124416000
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwBytesPerLine                      0
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
         bFrameIndex                        13
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            352
         wHeight                           288
         dwMinBitRate                103680000
         dwMaxBitRate                124416000
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwBytesPerLine                      0
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                            50
         bDescriptorType                    36
         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
         bFrameIndex                        14
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            320
         wHeight                           240
         dwMinBitRate                103680000
         dwMaxBitRate                124416000
         dwDefaultFrameInterval         333333
         bFrameIntervalType                  6
         dwBytesPerLine                      0
         dwFrameInterval( 0)            333333
         dwFrameInterval( 1)            400000
         dwFrameInterval( 2)            500000
         dwFrameInterval( 3)            666666
         dwFrameInterval( 4)           1000000
         dwFrameInterval( 5)           2000000
       VideoStreaming Interface Descriptor:
         bLength                             6
         bDescriptorType                    36
         bDescriptorSubtype                 13 (COLORFORMAT)
         bColorPrimaries                     1 (BT.709,sRGB)
         bTransferCharacteristics            1 (BT.709)
         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       1
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      0
       iInterface              9 Video Streaming
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0c00  2x 1024 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       2
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      0
       iInterface              9 Video Streaming
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x1400  3x 1024 bytes
         bInterval               1
     Interface Association:
       bLength                 8
       bDescriptorType        11
       bFirstInterface         2
       bInterfaceCount         2
       bFunctionClass          1 Audio
       bFunctionSubClass       0 [unknown]
       bFunctionProtocol       0
       iFunction              11 LSK Meeting Eye for Business & Home
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        2
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass         1 Audio
       bInterfaceSubClass      1 Control Device
       bInterfaceProtocol      0
       iInterface             11 LSK Meeting Eye for Business & Home
       AudioControl Interface Descriptor:
         bLength                 9
         bDescriptorType        36
         bDescriptorSubtype      1 (HEADER)
         bcdADC               1.00
         wTotalLength       0x0027
         bInCollection           1
         baInterfaceNr(0)        3
       AudioControl Interface Descriptor:
         bLength                12
         bDescriptorType        36
         bDescriptorSubtype      2 (INPUT_TERMINAL)
         bTerminalID             1
         wTerminalType      0x0201 Microphone
         bAssocTerminal          0
         bNrChannels             1
         wChannelConfig     0x0001
           Left Front (L)
         iChannelNames           0
         iTerminal               0
       AudioControl Interface Descriptor:
         bLength                 9
         bDescriptorType        36
         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
         bTerminalID             3
         wTerminalType      0x0101 USB Streaming
         bAssocTerminal          0
         bSourceID               5
         iTerminal               0
       AudioControl Interface Descriptor:
         bLength                 9
         bDescriptorType        36
         bDescriptorSubtype      6 (FEATURE_UNIT)
         bUnitID                 5
         bSourceID               1
         bControlSize            1
         bmaControls(0)       0x03
           Mute Control
           Volume Control
         bmaControls(1)       0x00
         iFeature                0
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        3
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol      0
       iInterface              0
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        3
       bAlternateSetting       1
       bNumEndpoints           1
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol      0
       iInterface              0
       AudioStreaming Interface Descriptor:
         bLength                 7
         bDescriptorType        36
         bDescriptorSubtype      1 (AS_GENERAL)
         bTerminalLink           3
         bDelay                  1 frames
         wFormatTag         0x0001 PCM
       AudioStreaming Interface Descriptor:
         bLength                11
         bDescriptorType        36
         bDescriptorSubtype      2 (FORMAT_TYPE)
         bFormatType             1 (FORMAT_TYPE_I)
         bNrChannels             1
         bSubframeSize           2
         bBitResolution         16
         bSamFreqType            1 Discrete
         tSamFreq[ 0]        48000
       Endpoint Descriptor:
         bLength                 9
         bDescriptorType         5
         bEndpointAddress     0x82  EP 2 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0060  1x 96 bytes
         bInterval               4
         bRefresh                0
         bSynchAddress           0
         AudioStreaming Endpoint Descriptor:
           bLength                 7
           bDescriptorType        37
           bDescriptorSubtype      1 (EP_GENERAL)
           bmAttributes         0x01
             Sampling Frequency
           bLockDelayUnits         0 Undefined
           wLockDelay         0x0000
Device Qualifier (for other device speed):
   bLength                10
   bDescriptorType         6
   bcdUSB               2.00
   bDeviceClass          239 Miscellaneous Device
   bDeviceSubClass         2 [unknown]
   bDeviceProtocol         1 Interface Association
   bMaxPacketSize0        64
   bNumConfigurations      1
Device Status:     0x0001
   Self Powered
```

I don't think it makes a difference, but this output is from a system 
running the patched kernel (where the webcam works).

Kind regards,
Lili Orosz

On 2025. 10. 23. 12:38, Laurent Pinchart wrote:
> Hi Lili,
>
> On Thu, Oct 23, 2025 at 12:12:23PM +0200, Lili Orosz wrote:
>> Hello,
>>
>> The change in commit 0e2ee70291e64 reintroduces an issue that was
>> reverted once before. It prevents webcams that do not follow the spec
>> and have non-unique unit IDs from being usable. This issue is present
>> both in 6.12.54 (LTS) as well as mainline.
>>
>> The camera I tested with and can confirm is affected: LSK Meeting Eye
>> for Business & Home. It's very likely that this is not the only
>> non-compliant webcam out there.
> Could you please share the full `lsusb -v` output for your device ?
>
>> If I build the kernel with that commit reverted, my webcam begins to
>> function as intended again.

