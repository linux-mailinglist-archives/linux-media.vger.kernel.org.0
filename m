Return-Path: <linux-media+bounces-43957-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D73BC50D7
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 14:58:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17E273BACDB
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 12:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF52283C97;
	Wed,  8 Oct 2025 12:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ilSngjMN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324141DD543
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 12:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759928197; cv=none; b=mJUu48YSZZSP1YYodwQM9ydYUHUpJwAC5pTev/BaP5QcFf6VmX8gqONK7OPrSOkn1QDuVjsJkcbrFvBrzSKTbdIxh8qRhnorjuC6tuKEE6r9Ovg0r+daGa0JOMUGOtN06gHqott0kqS0g9HpBdjk5JE/Xu6fHlN/d6n6v98ZRns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759928197; c=relaxed/simple;
	bh=+hEX+r4TqTXxCkM3m1LWrR3xZDZNQeYmEMPsXRFZOO8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=HJdTCSczfV20n+hBrHBptcbXlqKvg+/ulbnr3Z5ZXavzUSh6GKEdua01MyRVl4PcQcXOumC/EtklCIIZIs+z2r+3xfgt7d9CpUeHMTe7TFlVjCXX2S3jtXBbcoXHtEfRomDbJtjfZGRs8wJa3GqI94653NjrmVu/6G9XJpq7ziY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ilSngjMN; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4dac61ed7a5so68356841cf.3
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 05:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759928192; x=1760532992; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9PqSidEDppi++ZECuGVdRB2iB4y8UAt02emOqwm0wRc=;
        b=ilSngjMNx23nyMOIdqpycmtNZa9ob6SEBA77oE4umbmUbyre5+P5RMGeEm0+GNdnEJ
         yZsW6IEDTjLS+0Q3JYB+VNf747Re12PIrPaO1W1qgTD5FtALaW2dFJFT6VxVqlCSwhMM
         LEVELpdYR64rEakfVESc4He0os9QVrLTOtS1IQoThhlBGNaBnimhApZDml12fjYHG9em
         61oKa2XahysyunSS/PUm9tP2yGr1Psq7aPUK8kHdDGHmFcCySCFGCQf3M/jZdcFJZljX
         FM9tmnUqozZ/R0yGfT9iAqHaaLUzH1w9bA0mjhwjb8UOQOai5/S8WLmw2FSk6bt1xqqb
         uBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759928192; x=1760532992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9PqSidEDppi++ZECuGVdRB2iB4y8UAt02emOqwm0wRc=;
        b=Tf7+3+GOaqpeCCqEGYeLYtkxJpiLhK2UDCLxDh2flznkjKBx76P3kTrn+qX1Smf8jc
         3KYtozxhiglt2wpSk+oXtf4Gfo8NP/zM+Ejcka8TPm1kJGceV1GhAqzD/HIrCk9qVRx0
         beLaSX0oVel3q72Y23WDgnww8M9UFRAymsVFO8NoM79LSpmde7/Wp/IIlW2TrSa/7/ab
         r8gs5qG03pZ+H/uHRKiP7XuczGl7ubZg+TeSBzgS73rMJGfb0kiIIlhQP0k2EWtIfP75
         gSAU6GtlykUWAHrXF7BDclYcbW7RPmzOQmSyz2FQ9AlkT8rQ2Kx+NWYBhxS5duiHmJhf
         VrYg==
X-Gm-Message-State: AOJu0YzYAGS1m/CXmhu7bM78wy8QIJk29nJE/Zk4aHrw6Mvm36x8yY8s
	MOvC+dQImypdmdSqn7iWk7Jpz0/Fhtmk6sz8g8EMXBgd7o9oiJEQCKAbRPpGdFriDOkU4zaTKss
	pqlnLiU95mmgXLpC6iWIbnGwo3uTL4Qpesp0C
X-Gm-Gg: ASbGncviVreWEIW8RsiaUxSVYJA64tyTORtEqrwJ/eK2/+XvHE1U9YF6oOoiBHy1DGi
	iSTTFb64o16R+SE79Y0BF2iX1/QD6xPkbuQmOI8vWw0MNSPFkgTPUCaespR3VJOkjcayAMtqqYu
	8GwSIi5OGIAWeXY9iDXShp8sqUe8N8X1bm96oADPZ9JYx3HH9yRj0P1slP7ItUwLFiIXA6gDxpq
	ci6PThjVzUjUmHeKNkyJ5QcOqH8O9Cdoozs0xUhUw==
X-Google-Smtp-Source: AGHT+IESug/R9xj2Fxu786i9BY/36yXkiIGu2DHrFXyQGKLfrGUb+16OSwwhE+LMR3nrunThfBtfHpXQEW5EmnqWaEY=
X-Received: by 2002:ac8:7d89:0:b0:4dd:ca89:8d7d with SMTP id
 d75a77b69052e-4e6ead629e6mr41997801cf.56.1759928191580; Wed, 08 Oct 2025
 05:56:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Angel4005 <ooara1337@gmail.com>
Date: Wed, 8 Oct 2025 15:56:20 +0300
X-Gm-Features: AS18NWCMu4U8AonCNwa15lfB9ldhzBQmet9NALf4uoe8PPJlfTxmV_9BpaBZ7mw
Message-ID: <CAOzBiVuS7ygUjjhCbyWg-KiNx+HFTYnqH5+GJhd6cYsNLT=DaA@mail.gmail.com>
Subject: [REGRESSION] uvcvideo: Grandstream GUV3100 (2bab:0011) broken on
 recent kernels (including LTS)
To: linux-media@vger.kernel.org
Cc: linux-uvc-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I encountered regression (breakage) for the Grandstream GUV3100 webcam
(ID 2bab:0011) in the uvcvideo driver.

Testing showed that the camera WORKS on kernel 6.16.8.arch3-1.

However, it does NOT WORK on newer kernel versions, including the
latest stable version (6.17.1.arch1-1) and the latest LTS kernel
version (6.12.51-1).

Problem: The driver finds the device but cannot start the video
stream, resulting in an error in dmesg: =E2=80=9CNo streaming interface fou=
nd
for terminal 65535.=E2=80=9D

I checked all known quirks (0x128, 0x100, 0x400) without success. The
logs attached below were collected on a non-working kernel with the
quirks=3D0x400 parameter applied.

I hope this information will help restore device support.

Thank you for your work!

--- 1. lsusb -d 2bab:0011 -v (Full USB descriptor) ---


Bus 001 Device 004: ID 2bab:0011 GRANDSTREAM GUV3100 GRANDSTREAM GUV3100
Negotiated speed: High Speed (480Mbps)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 [unknown]
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x2bab GRANDSTREAM GUV3100
  idProduct          0x0011 GRANDSTREAM GUV3100
  bcdDevice            4.09
  iManufacturer           4 GRANDSTREAM GUV3100
  iProduct                5 GRANDSTREAM GUV3100
  iSerial                 0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0b33
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          7 video
    bmAttributes         0xc0
      Self Powered
    MaxPower                2mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         2
      bFunctionClass         14 Video
      bFunctionSubClass       3 Video Interface Collection
      bFunctionProtocol       0
      iFunction               8 GRANDSTREAM GUV3100
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass        14 Video
      bInterfaceSubClass      1 Video Control
      bInterfaceProtocol      0
      iInterface              8 GRANDSTREAM GUV3100
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdUVC               1.00
        wTotalLength       0x0072
        dwClockFrequency       48.000000MHz
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
        bmControls           0x00001e00
          Zoom (Absolute)
          Zoom (Relative)
          PanTilt (Absolute)
          PanTilt (Relative)
      VideoControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      5 (PROCESSING_UNIT)
        bUnitID                 2
        bSourceID               1
        wMaxMultiplier      16384
        bControlSize            2
        bmControls     0x0000177f
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
        iProcessing             0
        bmVideoStandards     0x00
      VideoControl Interface Descriptor:
        bLength                31
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 3
        guidExtensionCode         {a29e7641-de04-47e3-8b2b-f4341aff003b}
        bNumControls           48
        bNrInPins               1
        baSourceID( 0)          2
        bControlSize            6
        bmControls( 0)       0xff
        bmControls( 1)       0xff
        bmControls( 2)       0xff
        bmControls( 3)       0xff
        bmControls( 4)       0xff
        bmControls( 5)       0xff
        iExtension              0
      VideoControl Interface Descriptor:
        bLength                31
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 4
        guidExtensionCode         {ffe52d21-8030-4e2c-82d9-f587d00540bd}
        bNumControls           48
        bNrInPins               1
        baSourceID( 0)          2
        bControlSize            6
        bmControls( 0)       0xff
        bmControls( 1)       0xff
        bmControls( 2)       0xff
        bmControls( 3)       0xff
        bmControls( 4)       0xff
        bmControls( 5)       0xff
        iExtension              0
      VideoControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             4
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               3
        iTerminal               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              9 Video Streaming
      VideoStreaming Interface Descriptor:
        bLength                            14
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         1
        wTotalLength                   0x0a12
        bEndpointAddress                 0x81  EP 1 IN
        bmInfo                              0
        bTerminalLink                       4
        bStillCaptureMethod                 0
        bTriggerSupport                     0
        bTriggerUsage                       0
        bControlSize                        1
        bmaControls( 0)                     0
      VideoStreaming Interface Descriptor:
        bLength                            27
        bDescriptorType                    36
        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
        bFormatIndex                        1
        bNumFrameDescriptors                8
        guidFormat
{32595559-0000-0010-8000-00aa00389b71}
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
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 18432000
        dwMaxBitRate                110592000
        dwMaxVideoFrameBufferSize      460800
        dwDefaultFrameInterval        1000000
        bFrameIntervalType                  2
        dwFrameInterval( 0)           1000000
        dwFrameInterval( 1)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1024
        wHeight                           576
        dwMinBitRate                 47185920
        dwMaxBitRate                283115520
        dwMaxVideoFrameBufferSize     1179648
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            800
        wHeight                           600
        dwMinBitRate                 18432000
        dwMaxBitRate                110592000
        dwMaxVideoFrameBufferSize      460800
        dwDefaultFrameInterval        1000000
        bFrameIntervalType                  2
        dwFrameInterval( 0)           1000000
        dwFrameInterval( 1)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            800
        wHeight                           448
        dwMinBitRate                 28672000
        dwMaxBitRate                172032000
        dwMaxVideoFrameBufferSize      716800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 24576000
        dwMaxBitRate                147456000
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  5
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           1000000
        dwFrameInterval( 4)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 18432000
        dwMaxBitRate                110592000
        dwMaxVideoFrameBufferSize      460800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            480
        wHeight                           270
        dwMinBitRate                 10368000
        dwMaxBitRate                 62208000
        dwMaxVideoFrameBufferSize      259200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            320
        wHeight                           180
        dwMinBitRate                 18432000
        dwMaxBitRate                110592000
        dwMaxVideoFrameBufferSize      460800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            11
        bDescriptorType                    36
        bDescriptorSubtype                  6 (FORMAT_MJPEG)
        bFormatIndex                        2
        bNumFrameDescriptors               14
        bFlags                              0
          Fixed-size samples: No
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 1 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                165888000
        dwMaxBitRate                829440000
        dwMaxVideoFrameBufferSize     4147200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1600
        wHeight                           896
        dwMinBitRate                114688000
        dwMaxBitRate                688128000
        dwMaxVideoFrameBufferSize     2867200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 73728000
        dwMaxBitRate                442368000
        dwMaxVideoFrameBufferSize     1843200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1024
        wHeight                           576
        dwMinBitRate                 47185920
        dwMaxBitRate                283115520
        dwMaxVideoFrameBufferSize     1179648
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            960
        wHeight                           540
        dwMinBitRate                207360000
        dwMaxBitRate                248832000
        dwMaxVideoFrameBufferSize     1036800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            800
        wHeight                           600
        dwMinBitRate                 38400000
        dwMaxBitRate                230400000
        dwMaxVideoFrameBufferSize      960000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            800
        wHeight                           448
        dwMinBitRate                 28672000
        dwMaxBitRate                172032000
        dwMaxVideoFrameBufferSize      716800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            720
        wHeight                           576
        dwMinBitRate                 33177600
        dwMaxBitRate                199065600
        dwMaxVideoFrameBufferSize      829440
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         9
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            720
        wHeight                           480
        dwMinBitRate                 27648000
        dwMaxBitRate                165888000
        dwMaxVideoFrameBufferSize      691200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        10
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 24576000
        dwMaxBitRate                147456000
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        11
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 92160000
        dwMaxBitRate                110592000
        dwMaxVideoFrameBufferSize      460800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        12
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            480
        wHeight                           270
        dwMinBitRate                 10368000
        dwMaxBitRate                 62208000
        dwMaxVideoFrameBufferSize      259200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        13
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            352
        wHeight                           288
        dwMinBitRate                  8110080
        dwMaxBitRate                 48660480
        dwMaxVideoFrameBufferSize      202752
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        14
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            320
        wHeight                           240
        dwMinBitRate                  6144000
        dwMaxBitRate                 36864000
        dwMaxVideoFrameBufferSize      153600
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        3
        bNumFrameDescriptors               14
        guidFormat
{34363248-0000-0010-8000-00aa00389b71}
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
        bVariableSize                     1
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                165888000
        dwMaxBitRate                829440000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1600
        wHeight                           896
        dwMinBitRate                103680000
        dwMaxBitRate                124416000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 73728000
        dwMaxBitRate                442368000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1024
        wHeight                           576
        dwMinBitRate                103680000
        dwMaxBitRate                124416000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            960
        wHeight                           540
        dwMinBitRate                103680000
        dwMaxBitRate                124416000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            800
        wHeight                           600
        dwMinBitRate                103680000
        dwMaxBitRate                124416000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            800
        wHeight                           448
        dwMinBitRate                103680000
        dwMaxBitRate                124416000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            720
        wHeight                           576
        dwMinBitRate                103680000
        dwMaxBitRate                124416000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         9
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            720
        wHeight                           480
        dwMinBitRate                 27648000
        dwMaxBitRate                165888000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                        10
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                103680000
        dwMaxBitRate                124416000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                        11
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                103680000
        dwMaxBitRate                124416000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                        12
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            480
        wHeight                           270
        dwMinBitRate                103680000
        dwMaxBitRate                124416000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                        13
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            352
        wHeight                           288
        dwMinBitRate                103680000
        dwMaxBitRate                124416000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                        14
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            320
        wHeight                           240
        dwMinBitRate                103680000
        dwMaxBitRate                124416000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        4
        bNumFrameDescriptors               14
        guidFormat
{35363248-0000-0010-8000-00aa00389b71}
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
        bVariableSize                     1
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                165888000
        dwMaxBitRate                829440000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1600
        wHeight                           896
        dwMinBitRate                103680000
        dwMaxBitRate                124416000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 73728000
        dwMaxBitRate                442368000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1024
        wHeight                           576
        dwMinBitRate                103680000
        dwMaxBitRate                124416000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            960
        wHeight                           540
        dwMinBitRate                103680000
        dwMaxBitRate                124416000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            800
        wHeight                           600
        dwMinBitRate                103680000
        dwMaxBitRate                124416000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            800
        wHeight                           448
        dwMinBitRate                103680000
        dwMaxBitRate                124416000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            720
        wHeight                           576
        dwMinBitRate                103680000
        dwMaxBitRate                124416000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         9
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            720
        wHeight                           480
        dwMinBitRate                 27648000
        dwMaxBitRate                165888000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                        10
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                103680000
        dwMaxBitRate                124416000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                        11
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                103680000
        dwMaxBitRate                124416000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                        12
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            480
        wHeight                           270
        dwMinBitRate                103680000
        dwMaxBitRate                124416000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                        13
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            352
        wHeight                           288
        dwMinBitRate                103680000
        dwMaxBitRate                124416000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                        14
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            320
        wHeight                           240
        dwMinBitRate                103680000
        dwMaxBitRate                124416000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              9 Video Streaming
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0c00  2x 1024 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       2
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              9 Video Streaming
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x1400  3x 1024 bytes
        bInterval               1
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         2
      bInterfaceCount         2
      bFunctionClass          1 Audio
      bFunctionSubClass       0 [unknown]
      bFunctionProtocol       0
      iFunction              11 GRANDSTREAM GUV3100
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol      0
      iInterface             11 GRANDSTREAM GUV3100
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               1.00
        wTotalLength       0x0027
        bInCollection           1
        baInterfaceNr(0)        3
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0201 Microphone
        bAssocTerminal          0
        bNrChannels             1
        wChannelConfig     0x0001
          Left Front (L)
        iChannelNames           0
        iTerminal               0
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             3
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               5
        iTerminal               0
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                 5
        bSourceID               1
        bControlSize            1
        bmaControls(0)       0x03
          Mute Control
          Volume Control
        bmaControls(1)       0x00
        iFeature                0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0
      iInterface              0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0
      iInterface              0
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             1
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        48000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0060  1x 96 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x01
            Sampling Frequency
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
Device Qualifier (for other device speed):
  bLength                10
  bDescriptorType         6
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 [unknown]
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  bNumConfigurations      1
Device Status:     0x0001
  Self Powered


--- 2. dmesg (Kernel log after connecting to a broken kernel) ---

[  363.567249] usb 1-1.3: new high-speed USB device number 6 using ehci-pci
[  363.658563] usb 1-1.3: New USB device found, idVendor=3D2bab,
idProduct=3D0011, bcdDevice=3D 4.09
[  363.658569] usb 1-1.3: New USB device strings: Mfr=3D4, Product=3D5,
SerialNumber=3D0
[  363.658571] usb 1-1.3: Product: GRANDSTREAM GUV3100
[  363.658573] usb 1-1.3: Manufacturer: GRANDSTREAM GUV3100
[  363.672993] uvcvideo 1-1.3:1.0: Found multiple Units with ID 4
[  363.673014] usb 1-1.3: Found UVC 1.00 device GRANDSTREAM GUV3100 (2bab:0=
011)
[  363.673017] usb 1-1.3: Forcing device quirks to 0x400 by module
parameter for testing purpose.
[  363.673018] usb 1-1.3: Please report required quirks to the
linux-media mailing list.
[  363.700829] usb 1-1.3: No streaming interface found for terminal 65535.
[  363.710048] usb 1-1.3: Warning! Unlikely big volume range (=3D7680),
cval->res is probably wrong.
[  363.710052] usb 1-1.3: [5] FU [Mic Capture Volume] ch =3D 1, val =3D 512=
0/12800/1

