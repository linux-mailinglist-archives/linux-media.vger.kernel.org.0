Return-Path: <linux-media+bounces-13868-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD69911269
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 21:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 763DF1F2187E
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 19:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F311B47B0;
	Thu, 20 Jun 2024 19:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqXnw1Sb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065211B9AC9
	for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 19:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718912605; cv=none; b=pfbRmNdf2Q+LYLiE6yaPZ3d8WU7g1j3i6TAhdOsk9nXzN90yJhExBPv8uiegXCsIQBTCSjVwo9Gfv9IlFNVEOKH2EiHJRZ9/1M1tIbzTJF1YIyW1RIe8Y9HpUABReEDL3IRTITN4X2cFCqs8Xhf8ch5tSSCVGiyb5CAGm2J5Vog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718912605; c=relaxed/simple;
	bh=h4imYgPbg/QY5hMEdap7iUxT6yUsYm6AUoY4e6ZiTMs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=X5D9h9ydydB38fhfbeNY+Oo5yaH4uABTZYWC6yQmxk2ptaHY8ltaoTKj0hzOIT+2JGPPT+1a71RzqNjHhIkLIGVKvKuysv//eDBVhDP6PwAbRnWGrceX9Y1PrwnXrFmRRWtHzzntdKvgbLWRNEpTwiBhGuOi4WRRUwUKvoL5PIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GqXnw1Sb; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57d1679ee6eso2874641a12.1
        for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 12:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718912601; x=1719517401; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0N39sIEWwuZqLgZZeIAUKXx3xhIpmwA6YWyRVbfEtP8=;
        b=GqXnw1Sb8chfQZGKYqcvbFFFguCbzijNnrfG1kHT0kXjaoqZI9XJ1jvWXxbbMqk2SN
         y5nzmoHts5Q+ENA9+B6GLYSy2/GhwZeTnamAghF5C/u7a9Jetx7O+V+AbaEpmzKU0oA5
         gXNV4r8Ft2j7UF7eaR7a7qqdI/eEcEFHqG6qtv3c/1gWG07JWKT094QOEzUhlkqQid3o
         orGZsnQ2PY+1gshjbfGdDnexBjlOx00elj5WsWTdWUf1YfUVHBV5+9NS/L+6zTNXwrz3
         0dBW8OgGDUZ5VE6okkFT9EB37dXCh/6Pg4GI8AT+ho6M2k1cfxRjLZ1gKfaol47rMEGd
         xkIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718912601; x=1719517401;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0N39sIEWwuZqLgZZeIAUKXx3xhIpmwA6YWyRVbfEtP8=;
        b=bezQRNhU/JSieTHRYtkAn3N8cpenXUuXjE0M1hdq/sMrEGuRZ1vIY0WfHbu1k7m12i
         F0h2ft8cEl1S4m35FHpra4AzQ7D/rwazf1uiOaaB69UjzUe8Po7esV0WHIqDKeY6/TyB
         Z1bhNzLGxnvaOgDuPbzhQOdQdsvba35gK4sgjpYIZnBkX6Xmqj2eUV3QhKLoZb0njrYT
         ceQZO1Xe25Y6pH/gdDEDIuckoXq2f5CvvMvyFHubzDMPKlUF5gc8Ad9iCvDgvkm8D5S5
         FQL8XgDRLwnugL+JBj3VZ8d32pM4/Dr8xPibOT8QU8I3K8SUmVEyBvq8TLoTcAQOgdJu
         ixEw==
X-Gm-Message-State: AOJu0Ywg4Bj+cK+opMwEESX6xCMoZ0/vF+zhFj6nc5MylkprO/5rIWAa
	+iPpEV4H1b1YPubAm/OwCkPMUuQjagn8rxFQUkLOvSiOPxKbT5k3zoV/EM/JExFMBQCKOcpqocu
	yFwIqciBlgL8OH9u03PAFp8m1Ak6qaKoh
X-Google-Smtp-Source: AGHT+IEDk1JfTiijRyApzmFMLsD1lblW1esrIJ5w/MrNpdMntyxBTCuI7BzYJwqv21nLXqwO/2bllinoGqByChlJzLU=
X-Received: by 2002:a05:6402:791:b0:57d:455:d395 with SMTP id
 4fb4d7f45d1cf-57d0455d5d4mr4840927a12.7.1718912600606; Thu, 20 Jun 2024
 12:43:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Daniel Liz <darkliz@gmail.com>
Date: Thu, 20 Jun 2024 16:43:09 -0300
Message-ID: <CAPvqTd7WkMWfrNqAFiuMNZ87Bva-_WB0N+DrBF2ZMo+_zTpFXg@mail.gmail.com>
Subject: [WEBCAM] Driver error 0a50:6100
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

dmesg log
[1494270.396597] usb 2-2.1.1: new high-speed USB device number 19 using xhci_hcd
[1494270.517471] usb 2-2.1.1: New USB device found, idVendor=0a50,
idProduct=6100, bcdDevice= 1.00
[1494270.517480] usb 2-2.1.1: New USB device strings: Mfr=2,
Product=1, SerialNumber=3
[1494270.517483] usb 2-2.1.1: Product: HD WEB CAMERA
[1494270.517485] usb 2-2.1.1: Manufacturer: HD WEB CAMERA
[1494270.517488] usb 2-2.1.1: SerialNumber: SN0001
[1494270.519254] usb 2-2.1.1: Found UVC 1.00 device HD WEB CAMERA (0a50:6100)
[1494270.530420] usb 2-2.1.1: 3:1: cannot get freq at ep 0x84
[1494270.801508] usb 2-2.1.1: 3:1: cannot get freq at ep 0x84
[1494270.806591] usb 2-2.1.1: 3:1: cannot get freq at ep 0x84

uname -a
Linux flordeliz 6.5.0-35-generic #35~22.04.1-Ubuntu SMP
PREEMPT_DYNAMIC Tue May  7 09:00:52 UTC 2 x86_64 x86_64 x86_64
GNU/Linux

lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description: Ubuntu 22.04.4 LTS
Release: 22.04
Codename: jammy


sudo lsusb -v -d 0a50:6100
Bus 002 Device 019: ID 0a50:6100 Mimaki Engineering Co., Ltd HD WEB CAMERA
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x0a50 Mimaki Engineering Co., Ltd
  idProduct          0x6100
  bcdDevice            1.00
  iManufacturer           2 HD WEB CAMERA
  iProduct                1 HD WEB CAMERA
  iSerial                 3 SN0001
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x030e
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              500mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         2
      bFunctionClass         14 Video
      bFunctionSubClass       3 Video Interface Collection
      bFunctionProtocol       0
      iFunction               5 HD WEB CAMERA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      1 Video Control
      bInterfaceProtocol      0
      iInterface              5 HD WEB CAMERA
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdUVC               1.00
        wTotalLength       0x004d
        dwClockFrequency       15.000000MHz
        bInCollection           1
        baInterfaceNr( 0)       1
      VideoControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             4
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               3
        iTerminal               0
      VideoControl Interface Descriptor:
        bLength                26
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 3
        guidExtensionCode         {28f03370-6311-4a2e-ba2c-6890eb334016}
        bNumControls            8
        bNrInPins               1
        baSourceID( 0)          2
        bControlSize            1
        bmControls( 0)       0x3f
        iExtension              0
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
        bmControls           0x0002002a
          Auto-Exposure Mode
          Exposure Time (Absolute)
          Focus (Absolute)
          Focus, Auto
      VideoControl Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      5 (PROCESSING_UNIT)
      Warning: Descriptor too short
        bUnitID                 2
        bSourceID               1
        wMaxMultiplier          0
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
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               6
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
        bLength                            15
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         2
        wTotalLength                   0x01bb
        bEndpointAddress                 0x81  EP 1 IN
        bmInfo                              0
        bTerminalLink                       4
        bStillCaptureMethod                 0
        bTriggerSupport                     0
        bTriggerUsage                       0
        bControlSize                        1
        bmaControls( 0)                     0
        bmaControls( 1)                     0
      VideoStreaming Interface Descriptor:
        bLength                            11
        bDescriptorType                    36
        bDescriptorSubtype                  6 (FORMAT_MJPEG)
        bFormatIndex                        1
        bNumFrameDescriptors                6
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
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                995328000
        dwMaxBitRate                995328000
        dwMaxVideoFrameBufferSize     4147789
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2592
        wHeight                          1944
        dwMinBitRate                403107840
        dwMaxBitRate                1209323520
        dwMaxVideoFrameBufferSize    10078285
        dwDefaultFrameInterval         666666
        bFrameIntervalType                  3
        dwFrameInterval( 0)            666666
        dwFrameInterval( 1)           1000000
        dwFrameInterval( 2)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2560
        wHeight                          1440
        dwMinBitRate                294912000
        dwMaxBitRate                884736000
        dwMaxVideoFrameBufferSize     7373389
        dwDefaultFrameInterval         666666
        bFrameIntervalType                  3
        dwFrameInterval( 0)            666666
        dwFrameInterval( 1)           1000000
        dwFrameInterval( 2)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                442368000
        dwMaxBitRate                442368000
        dwMaxVideoFrameBufferSize     1843789
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                294912000
        dwMaxBitRate                294912000
        dwMaxVideoFrameBufferSize      614989
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            166666
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                995328000
        dwMaxBitRate                995328000
        dwMaxVideoFrameBufferSize     4147789
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            27
        bDescriptorType                    36
        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
        bFormatIndex                        2
        bNumFrameDescriptors                6
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
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                 66355200
        dwMaxBitRate                 66355200
        dwMaxVideoFrameBufferSize     4147200
        dwDefaultFrameInterval        5000000
        bFrameIntervalType                  1
        dwFrameInterval( 0)           5000000
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2592
        wHeight                          1944
        dwMinBitRate                161243136
        dwMaxBitRate                161243136
        dwMaxVideoFrameBufferSize    10077696
        dwDefaultFrameInterval        5000000
        bFrameIntervalType                  1
        dwFrameInterval( 0)           5000000
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2560
        wHeight                          1440
        dwMinBitRate                117964800
        dwMaxBitRate                117964800
        dwMaxVideoFrameBufferSize     7372800
        dwDefaultFrameInterval        5000000
        bFrameIntervalType                  1
        dwFrameInterval( 0)           5000000
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 73728000
        dwMaxBitRate                 73728000
        dwMaxVideoFrameBufferSize     1843200
        dwDefaultFrameInterval        2000000
        bFrameIntervalType                  1
        dwFrameInterval( 0)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 24576000
        dwMaxBitRate                 73728000
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         666666
        bFrameIntervalType                  3
        dwFrameInterval( 0)            666666
        dwFrameInterval( 1)           1000000
        dwFrameInterval( 2)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                 66355200
        dwMaxBitRate                 66355200
        dwMaxVideoFrameBufferSize     4147200
        dwDefaultFrameInterval        5000000
        bFrameIntervalType                  1
        dwFrameInterval( 0)           5000000
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
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0080  1x 128 bytes
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
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0100  1x 256 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       3
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0320  1x 800 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       4
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0b20  2x 800 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       5
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x1320  3x 800 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       6
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
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
      bFunctionSubClass       0
      bFunctionProtocol       0
      iFunction               4 HD WEB CAMERA Audio
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol      0
      iInterface              4 HD WEB CAMERA Audio
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               1.00
        wTotalLength       0x0029
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
        wChannelConfig     0x0000
        iChannelNames           0
        iTerminal               0
      AudioControl Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                 2
        bSourceID               1
        bControlSize            2
        bmaControls(0)     0x0001
          Mute Control
        bmaControls(1)     0x0002
          Volume Control
        iFeature                0
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             3
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               2
        iTerminal               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0
      iInterface              4 HD WEB CAMERA Audio
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0
      iInterface              4 HD WEB CAMERA Audio
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                20
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             1
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            4 Discrete
        tSamFreq[ 0]         8000
        tSamFreq[ 1]        11025
        tSamFreq[ 2]        22050
        tSamFreq[ 3]        24000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x00c0  1x 192 bytes
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
  bDeviceSubClass         2
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  bNumConfigurations      1
Device Status:     0x0000
  (Bus Powered)

