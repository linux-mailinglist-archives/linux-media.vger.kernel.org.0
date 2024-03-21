Return-Path: <linux-media+bounces-7555-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04787886426
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 00:55:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B9D9284576
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 23:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351941E539;
	Thu, 21 Mar 2024 23:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QsFrDkzF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC901DFCF
	for <linux-media@vger.kernel.org>; Thu, 21 Mar 2024 23:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711065301; cv=none; b=mjMLg9UDFjLMa/NDSuD+Cz0Vrzs6A8shtiqfkH+USnFnsiOHazCGmzf/W1yQ2Bz2DEEXnSe+dE0IR1fY4sOGs8KMLYvC80sWsva7BrQduBF0xsTnZ5EwhvxaFWuR7D5wXJpZbq+PqbrJpKOukC8y8xAzABz3gsA7au7S+gRNwyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711065301; c=relaxed/simple;
	bh=ErJDfHI3/G27Qv2eXDZd3chfO4/vjNrWbpjuBz6Eo4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Icsf46XaOzCf2HUq008YCv7W0qBdNFWtW+g+OkT2JPy0Txeic0DSOFmCM/4JGwGk+S1GU5nmW4YHiVf1ex5GQRyuZulEVdz8JpJlIX3yMgfTgkI4poc0Dlr6m0SljzUNhc5r7RkfxMV4m2Cq1glOt7Yz9mQ2QKKaArKaytgT5g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QsFrDkzF; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5a496fde460so764256eaf.1
        for <linux-media@vger.kernel.org>; Thu, 21 Mar 2024 16:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711065297; x=1711670097; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j9k+T1FHjL5oI9jwHv7ut/LLueSmhdew285yiJNiMpM=;
        b=QsFrDkzF1yrWrGcIAR0sR1UvAjK1/E2YSkYePMxrvcyE7Sh27hfpQzGquzb9mJsZMc
         aCOy8QjqMdE3YbmnhlMwwAlFONnW506yzozTSEuUFwgVokq8edfbqOWi5udvX9VGx4UK
         lyIrk3a5eSrT03ZD8Pk+19PiFHpIu0Gx/SA73pdIns+2TnY9OpHeE2GiXyS8z/bmDPRv
         nFE9fUaY8Ltp+LdnLeLcICkEoTmUIP5PSwJKDfHruU7NqbfidJL7KBcaxkVsZYc8t7II
         VZY8Cu+HSNh7ndpg1lXccDKsTP0FSkDuVQGEwZtay95wsL0nuuxzWY/A1qJIqAdlrP+G
         2ytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711065297; x=1711670097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9k+T1FHjL5oI9jwHv7ut/LLueSmhdew285yiJNiMpM=;
        b=ZgvpXccppSxCKh3ueRBUghMS14VKz/xFuFLYf8qecbDLxs0rnMxGEd4O6DrKmZR/iQ
         ZQaLqQ7EY8wcyvhXDtnKk2FKh06QReUuB1QmE032DX0vSeEJ3TA6HbqU0dNzrLRVbFb1
         N/g4Tsg6qpN/Y1YEofmtWM+BWtLXxRtmRrC8+NaSu13k0eTK7RcI1k5/+HXgp4g9aBuN
         qdXYngQIwmjP66LvR50xjalgqy6kGV4s1XZ1SKtq20+/qUK3TjVxNImkn2QVRPOdRrFU
         MQ3tC0H1X+8NljV+2d4MDqV+dzLMNuFt+TaG3a9MWXlGNYBglWfqMx+Pw3Lf9+0s3xM7
         WFBA==
X-Forwarded-Encrypted: i=1; AJvYcCUlUFsQXMtui9Fz1IP9c82kMYZLnAIqrZh8LcGULfRuzXbtpLchgcAPCwB+TGpYv8IFcZiGj3o+gbALMoyKmqRjw8pVd2t2PeZkRZI=
X-Gm-Message-State: AOJu0YxE9J2/cBByuFu4NId5+XBt2vG55sOy3EkhuSMiKNAaru/JnEqQ
	LC+RpVzYfcw9weG8O2FJVmEnOBPWoXrjbGGJlEwGwaEWXVjMXtVDCEQtOdCO4guRpiR5gIc4fjJ
	My961Jnnbj8MlyIlUbcOLiG6JzYL5BrOmcAATyGBM
X-Google-Smtp-Source: AGHT+IG8OmpfDshxccXdxuDE340RlQwfoY4Ix+G+2TYzpCNDQxsKVO3psg1nK6EMBXERAZV/ZNMelbw2rMQEgt/bdyg=
X-Received: by 2002:a05:6820:308a:b0:5a4:f5b6:4eca with SMTP id
 eu10-20020a056820308a00b005a4f5b64ecamr1029768oob.7.1711065296930; Thu, 21
 Mar 2024 16:54:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240319044200.32488-1-linh.tp.vu@gmail.com> <CANiDSCvMTyAm-V4wMsab1A3OH6Oq_XgP8mE17OtiDuZWPjU1zg@mail.gmail.com>
In-Reply-To: <CANiDSCvMTyAm-V4wMsab1A3OH6Oq_XgP8mE17OtiDuZWPjU1zg@mail.gmail.com>
From: Linh Vu <linh.tp.vu@gmail.com>
Date: Fri, 22 Mar 2024 10:54:45 +1100
Message-ID: <CAD4e14uBMtVTYBAWibcsff+FYgZqA-c8RW4qCE7YHSy6xZknKw@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: fix incorrect minimum value mapping for
 relative ptz controls
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Gergo Koteles <soyer@irl.hu>, laurent.pinchart@ideasonboard.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ricardo,

Apology for the late reply, I had to go into the office to grab some device=
s.

Below is the "lsusb -v" dump, followed by raw values for UVC_GET_MIN and _M=
AX
for UVC_CT_PANTILT_RELATIVE_CONTROL and UVC_CT_ZOOM_RELATIVE_CONTROL
for 2 different PTZ cameras I've got.

Bus 002 Device 005: ID 3564:fef8 Remo Tech Co., Ltd. OBSBOT Tiny 2
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.10
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0         9
  idVendor           0x3564
  idProduct          0xfef8
  bcdDevice            4.09
  iManufacturer           1 Remo Tech Co., Ltd.
  iProduct                2 OBSBOT Tiny 2
  iSerial                 0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x04c2
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          4 OBSBOT Multifunction
    bmAttributes         0xc0
      Self Powered
    MaxPower                0mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         2
      bFunctionClass         14 Video
      bFunctionSubClass       3 Video Interface Collection
      bFunctionProtocol       0
      iFunction               5 OBSBOT Tiny 2 StreamCamera
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      1 Video Control
      bInterfaceProtocol      0
      iInterface              5 OBSBOT Tiny 2 StreamCamera
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdUVC               1.00
        wTotalLength       0x004e
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
        bmControls           0x00023e3e
          Auto-Exposure Mode
          Auto-Exposure Priority
          Exposure Time (Absolute)
          Exposure Time (Relative)
          Focus (Absolute)
          Zoom (Absolute)
          Zoom (Relative)
          PanTilt (Absolute)
          PanTilt (Relative)
          Roll (Absolute)
          Focus, Auto
      VideoControl Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      5 (PROCESSING_UNIT)
      Warning: Descriptor too short
        bUnitID                 3
        bSourceID               1
        wMaxMultiplier        400
        bControlSize            2
        bmControls     0x0000f7df
          Brightness
          Contrast
          Hue
          Saturation
          Sharpness
          White Balance Temperature
          White Balance Component
          Backlight Compensation
          Gain
          Power Line Frequency
          White Balance Temperature, Auto
          White Balance Component, Auto
          Digital Multiplier
          Digital Multiplier Limit
        iProcessing             0
        bmVideoStandards     0x1b
          None
          NTSC - 525/60
          SECAM - 625/50
          NTSC - 625/50
      VideoControl Interface Descriptor:
        bLength                27
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 2
        guidExtensionCode         {9a1e7291-6843-4683-6d92-39bc7906ee49}
        bNumControls            7
        bNrInPins               1
        baSourceID( 0)          3
        bControlSize            2
        bmControls( 0)       0x7f
        bmControls( 1)       0x00
        iExtension              0
      VideoControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             7
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               2
        iTerminal               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0010  1x 16 bytes
        bInterval               8
        bMaxBurst               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              6 Video Streaming
      VideoStreaming Interface Descriptor:
        bLength                            16
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         3
        wTotalLength                   0x03c0
        bEndpointAddress                 0x81  EP 1 IN
        bmInfo                              0
        bTerminalLink                       7
        bStillCaptureMethod                 0
        bTriggerSupport                     0
        bTriggerUsage                       0
        bControlSize                        1
        bmaControls( 0)                     4
        bmaControls( 1)                     0
        bmaControls( 2)                     4
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
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                995328000
        dwMaxBitRate                1990656000
        dwMaxVideoFrameBufferSize     4147200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            400000
        dwFrameInterval( 3)            416666
        dwFrameInterval( 4)            500000
        dwFrameInterval( 5)            666666
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           3840
        wHeight                          2160
        dwMinBitRate                1327104000
        dwMaxBitRate                1327104000
        dwMaxVideoFrameBufferSize    16588800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  5
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            416666
        dwFrameInterval( 3)            500000
        dwFrameInterval( 4)            666666
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                221184000
        dwMaxBitRate                884736000
        dwMaxVideoFrameBufferSize     1843200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            400000
        dwFrameInterval( 3)            416666
        dwFrameInterval( 4)            500000
        dwFrameInterval( 5)            666666
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           960
        dwMinBitRate                294912000
        dwMaxBitRate                1179648000
        dwMaxVideoFrameBufferSize     2457600
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            400000
        dwFrameInterval( 3)            416666
        dwFrameInterval( 4)            500000
        dwFrameInterval( 5)            666666
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1440
        dwMinBitRate                663552000
        dwMaxBitRate                1327104000
        dwMaxVideoFrameBufferSize     5529600
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            400000
        dwFrameInterval( 3)            416666
        dwFrameInterval( 4)            500000
        dwFrameInterval( 5)            666666
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           4000
        wHeight                          3000
        dwMinBitRate                1920000000
        dwMaxBitRate                1920000000
        dwMaxVideoFrameBufferSize    24000000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  5
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            416666
        dwFrameInterval( 3)            500000
        dwFrameInterval( 4)            666666
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
      VideoStreaming Interface Descriptor:
        bLength                            27
        bDescriptorType                    36
        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
        bFormatIndex                        2
        bNumFrameDescriptors                7
        guidFormat
{32595559-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                      16
        bDefaultFrameIndex                  5
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 55296000
        dwMaxBitRate                221184000
        dwMaxVideoFrameBufferSize      460800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            400000
        dwFrameInterval( 3)            416666
        dwFrameInterval( 4)            500000
        dwFrameInterval( 5)            666666
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 73728000
        dwMaxBitRate                294912000
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            400000
        dwFrameInterval( 3)            416666
        dwFrameInterval( 4)            500000
        dwFrameInterval( 5)            666666
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                221184000
        dwMaxBitRate                884736000
        dwMaxVideoFrameBufferSize     1843200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            400000
        dwFrameInterval( 3)            416666
        dwFrameInterval( 4)            500000
        dwFrameInterval( 5)            666666
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           960
        dwMinBitRate                294912000
        dwMaxBitRate                1179648000
        dwMaxVideoFrameBufferSize     2457600
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            400000
        dwFrameInterval( 3)            416666
        dwFrameInterval( 4)            500000
        dwFrameInterval( 5)            666666
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                497664000
        dwMaxBitRate                995328000
        dwMaxVideoFrameBufferSize     4147200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  5
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            416666
        dwFrameInterval( 3)            500000
        dwFrameInterval( 4)            666666
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1440
        dwMinBitRate                663552000
        dwMaxBitRate                1327104000
        dwMaxVideoFrameBufferSize     5529600
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  5
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            416666
        dwFrameInterval( 3)            500000
        dwFrameInterval( 4)            666666
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           3840
        wHeight                          2160
        dwMinBitRate                1990656000
        dwMaxBitRate                1990656000
        dwMaxVideoFrameBufferSize    16588800
        dwDefaultFrameInterval         666666
        bFrameIntervalType                  1
        dwFrameInterval( 0)            666666
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        3
        bNumFrameDescriptors                5
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
        dwMinBitRate                497664000
        dwMaxBitRate                1990656000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            400000
        dwFrameInterval( 3)            416666
        dwFrameInterval( 4)            500000
        dwFrameInterval( 5)            666666
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           3840
        wHeight                          2160
        dwMinBitRate                1327104000
        dwMaxBitRate                1327104000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  5
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            416666
        dwFrameInterval( 3)            500000
        dwFrameInterval( 4)            666666
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                221184000
        dwMaxBitRate                884736000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            400000
        dwFrameInterval( 3)            416666
        dwFrameInterval( 4)            500000
        dwFrameInterval( 5)            666666
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           960
        dwMinBitRate                294912000
        dwMaxBitRate                1179648000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            400000
        dwFrameInterval( 3)            416666
        dwFrameInterval( 4)            500000
        dwFrameInterval( 5)            666666
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1440
        dwMinBitRate                663552000
        dwMaxBitRate                1327104000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwBytesPerLine                      0
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            400000
        dwFrameInterval( 3)            416666
        dwFrameInterval( 4)            500000
        dwFrameInterval( 5)            666666
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              13
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         2
      bInterfaceCount         2
      bFunctionClass          1 Audio
      bFunctionSubClass       0
      bFunctionProtocol       0
      iFunction               8 OBSBOT Tiny2 Audio
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol      0
      iInterface              8 OBSBOT Tiny2 Audio
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
        bTerminalID             3
        wTerminalType      0x0201 Microphone
        bAssocTerminal          0
        bNrChannels             2
        wChannelConfig     0x0003
          Left Front (L)
          Right Front (R)
        iChannelNames          13 Capture Channels
        iTerminal              12 OBSBOT Tiny2 Microphone
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             4
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               5
        iTerminal              14 Capture Output terminal
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                 5
        bSourceID               3
        bControlSize            2
        bmaControls(0)     0x0003
          Mute Control
          Volume Control
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
      iInterface             17 OBSBOT Tiny2 Microphone
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0
      iInterface             18 Capture Active
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           4
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
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
        wMaxPacketSize     0x00c0  1x 192 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        bMaxBurst               0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x01
            Sampling Frequency
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x0016
  bNumDeviceCaps          2
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x00000006
      BESL Link Power Management (LPM) Supported
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x00
    wSpeedsSupported   0x000f
      Device can operate at Low Speed (1Mbps)
      Device can operate at Full Speed (12Mbps)
      Device can operate at High Speed (480Mbps)
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   1
      Lowest fully-functional device speed is Full Speed (12Mbps)
    bU1DevExitLat           1 micro seconds
    bU2DevExitLat         500 micro seconds
Device Status:     0x0001
  Self Powered

...
[ 1154.692514] speed: GET_MIN 00 0x1 00
[ 1154.693014] speed: GET_MAX 00 0xa0 00
[ 1154.693352] speed: GET_MIN 00 0x1 00
[ 1154.693634] speed: GET_MAX 00 0x78 00
...
[ 1314.517485] zoom: GET_MAX 00 0x0 00
[ 1314.517900] zoom: GET_MAX 00 0x0 064
...

---
Bus 002 Device 003: ID 2e7e:0893  UHD Camera
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0         9
  idVendor           0x2e7e
  idProduct          0x0893
  bcdDevice            0.01
  iManufacturer           0
  iProduct                2 UHD Camera
  iSerial                 1 3258004D
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x09fa
    bNumInterfaces          5
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xc0
      Self Powered
    MaxPower              400mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         2
      bFunctionClass         14 Video
      bFunctionSubClass       3 Video Interface Collection
      bFunctionProtocol       0
      iFunction               0
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
        wTotalLength       0x00a0
        dwClockFrequency       30.000000MHz
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
        wObjectiveFocalLengthMax  16384
        wOcularFocalLength           20
        bControlSize                  3
        bmControls           0x00039eea
          Auto-Exposure Mode
          Exposure Time (Absolute)
          Focus (Absolute)
          Focus (Relative)
          Iris (Absolute)
          Zoom (Absolute)
          Zoom (Relative)
          PanTilt (Absolute)
          PanTilt (Relative)
          Reserved
          Reserved
          Focus, Auto
      VideoControl Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      5 (PROCESSING_UNIT)
      Warning: Descriptor too short
        bUnitID                 3
        bSourceID               1
        wMaxMultiplier      16384
        bControlSize            2
        bmControls     0x0000071f
          Brightness
          Contrast
          Hue
          Saturation
          Sharpness
          Backlight Compensation
          Gain
          Power Line Frequency
        iProcessing             0
        bmVideoStandards     0x1b
          None
          NTSC - 525/60
          SECAM - 625/50
          NTSC - 625/50
      VideoControl Interface Descriptor:
        bLength                27
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                12
        guidExtensionCode         {a29e7641-de04-47e3-8b2b-f4341aff003b}
        bNumControls            7
        bNrInPins               1
        baSourceID( 0)          3
        bControlSize            2
        bmControls( 0)       0x07
        bmControls( 1)       0x2b
        iExtension              0
      VideoControl Interface Descriptor:
        bLength                27
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                13
        guidExtensionCode         {a29e7641-de04-47e3-8b2b-f4341aff003b}
        bNumControls            7
        bNrInPins               1
        baSourceID( 0)          3
        bControlSize            2
        bmControls( 0)       0x07
        bmControls( 1)       0x2b
        iExtension              0
      VideoControl Interface Descriptor:
        bLength                27
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                14
        guidExtensionCode         {3c16a808-701c-49c7-af98-2ec6c125b963}
        bNumControls            1
        bNrInPins               1
        baSourceID( 0)          3
        bControlSize            2
        bmControls( 0)       0x00
        bmControls( 1)       0x10
        iExtension              0
      VideoControl Interface Descriptor:
        bLength                28
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                15
        guidExtensionCode         {9d33bbe7-e619-435c-8fac-528eecccbca4}
        bNumControls            9
        bNrInPins               1
        baSourceID( 0)          3
        bControlSize            3
        bmControls( 0)       0xe0
        bmControls( 1)       0x3c
        bmControls( 2)       0x00
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
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               8
        bMaxBurst               0
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
        bLength                            16
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         3
        wTotalLength                   0x0712
        bEndpointAddress                 0x83  EP 3 IN
        bmInfo                              0
        bTerminalLink                       4
        bStillCaptureMethod                 0
        bTriggerSupport                     0
        bTriggerUsage                       0
        bControlSize                        1
        bmaControls( 0)                     0
        bmaControls( 1)                     0
        bmaControls( 2)                     0
      VideoStreaming Interface Descriptor:
        bLength                            11
        bDescriptorType                    36
        bDescriptorSubtype                  6 (FORMAT_MJPEG)
        bFormatIndex                        1
        bNumFrameDescriptors                8
        bFlags                              1
          Fixed-size samples: Yes
        bDefaultFrameIndex                  7
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 1 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            66
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 24576000
        dwMaxBitRate                294912000
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                 10
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            200000
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            400000
        dwFrameInterval( 4)            416666
        dwFrameInterval( 5)            500000
        dwFrameInterval( 6)            666666
        dwFrameInterval( 7)           1000000
        dwFrameInterval( 8)           1333333
        dwFrameInterval( 9)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            66
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 18432000
        dwMaxBitRate                221184000
        dwMaxVideoFrameBufferSize      460800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                 10
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            200000
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            400000
        dwFrameInterval( 4)            416666
        dwFrameInterval( 5)            500000
        dwFrameInterval( 6)            666666
        dwFrameInterval( 7)           1000000
        dwFrameInterval( 8)           1333333
        dwFrameInterval( 9)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            66
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            720
        wHeight                           408
        dwMinBitRate                 23500800
        dwMaxBitRate                282009600
        dwMaxVideoFrameBufferSize      587520
        dwDefaultFrameInterval         333333
        bFrameIntervalType                 10
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            200000
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            400000
        dwFrameInterval( 4)            416666
        dwFrameInterval( 5)            500000
        dwFrameInterval( 6)            666666
        dwFrameInterval( 7)           1000000
        dwFrameInterval( 8)           1333333
        dwFrameInterval( 9)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            66
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            720
        wHeight                           480
        dwMinBitRate                 27648000
        dwMaxBitRate                331776000
        dwMaxVideoFrameBufferSize      691200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                 10
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            200000
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            400000
        dwFrameInterval( 4)            416666
        dwFrameInterval( 5)            500000
        dwFrameInterval( 6)            666666
        dwFrameInterval( 7)           1000000
        dwFrameInterval( 8)           1333333
        dwFrameInterval( 9)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            66
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1024
        wHeight                           576
        dwMinBitRate                 47185920
        dwMaxBitRate                566231040
        dwMaxVideoFrameBufferSize     1179648
        dwDefaultFrameInterval         333333
        bFrameIntervalType                 10
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            200000
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            400000
        dwFrameInterval( 4)            416666
        dwFrameInterval( 5)            500000
        dwFrameInterval( 6)            666666
        dwFrameInterval( 7)           1000000
        dwFrameInterval( 8)           1333333
        dwFrameInterval( 9)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            66
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 73728000
        dwMaxBitRate                884736000
        dwMaxVideoFrameBufferSize     1843200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                 10
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            200000
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            400000
        dwFrameInterval( 4)            416666
        dwFrameInterval( 5)            500000
        dwFrameInterval( 6)            666666
        dwFrameInterval( 7)           1000000
        dwFrameInterval( 8)           1333333
        dwFrameInterval( 9)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            66
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                165888000
        dwMaxBitRate                1990656000
        dwMaxVideoFrameBufferSize     4147200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                 10
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            200000
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            400000
        dwFrameInterval( 4)            416666
        dwFrameInterval( 5)            500000
        dwFrameInterval( 6)            666666
        dwFrameInterval( 7)           1000000
        dwFrameInterval( 8)           1333333
        dwFrameInterval( 9)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            58
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           3840
        wHeight                          2160
        dwMinBitRate                663552000
        dwMaxBitRate                3981312000
        dwMaxVideoFrameBufferSize    16588800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  8
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            416666
        dwFrameInterval( 3)            500000
        dwFrameInterval( 4)            666666
        dwFrameInterval( 5)           1000000
        dwFrameInterval( 6)           1333333
        dwFrameInterval( 7)           2000000
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
      VideoStreaming Interface Descriptor:
        bLength                            27
        bDescriptorType                    36
        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
        bFormatIndex                        2
        bNumFrameDescriptors                2
        guidFormat
{32595559-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                      16
        bDefaultFrameIndex                  2
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            58
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 73728000
        dwMaxBitRate                442368000
        dwMaxVideoFrameBufferSize     1843200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  8
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            416666
        dwFrameInterval( 3)            500000
        dwFrameInterval( 4)            666666
        dwFrameInterval( 5)           1000000
        dwFrameInterval( 6)           1333333
        dwFrameInterval( 7)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            58
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                165888000
        dwMaxBitRate                995328000
        dwMaxVideoFrameBufferSize     4147200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  8
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            416666
        dwFrameInterval( 3)            500000
        dwFrameInterval( 4)            666666
        dwFrameInterval( 5)           1000000
        dwFrameInterval( 6)           1333333
        dwFrameInterval( 7)           2000000
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        3
        bNumFrameDescriptors                8
        guidFormat
{34363248-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                      16
        bDefaultFrameIndex                  7
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
        bLength                            66
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 24576000
        dwMaxBitRate                294912000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                 10
        dwBytesPerLine                      0
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            200000
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            400000
        dwFrameInterval( 4)            416666
        dwFrameInterval( 5)            500000
        dwFrameInterval( 6)            666666
        dwFrameInterval( 7)           1000000
        dwFrameInterval( 8)           1333333
        dwFrameInterval( 9)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            66
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 18432000
        dwMaxBitRate                221184000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                 10
        dwBytesPerLine                      0
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            200000
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            400000
        dwFrameInterval( 4)            416666
        dwFrameInterval( 5)            500000
        dwFrameInterval( 6)            666666
        dwFrameInterval( 7)           1000000
        dwFrameInterval( 8)           1333333
        dwFrameInterval( 9)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            66
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            720
        wHeight                           408
        dwMinBitRate                 23500800
        dwMaxBitRate                282009600
        dwDefaultFrameInterval         333333
        bFrameIntervalType                 10
        dwBytesPerLine                      0
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            200000
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            400000
        dwFrameInterval( 4)            416666
        dwFrameInterval( 5)            500000
        dwFrameInterval( 6)            666666
        dwFrameInterval( 7)           1000000
        dwFrameInterval( 8)           1333333
        dwFrameInterval( 9)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            66
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            720
        wHeight                           480
        dwMinBitRate                 27648000
        dwMaxBitRate                331776000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                 10
        dwBytesPerLine                      0
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            200000
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            400000
        dwFrameInterval( 4)            416666
        dwFrameInterval( 5)            500000
        dwFrameInterval( 6)            666666
        dwFrameInterval( 7)           1000000
        dwFrameInterval( 8)           1333333
        dwFrameInterval( 9)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            66
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1024
        wHeight                           576
        dwMinBitRate                 47185920
        dwMaxBitRate                566231040
        dwDefaultFrameInterval         333333
        bFrameIntervalType                 10
        dwBytesPerLine                      0
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            200000
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            400000
        dwFrameInterval( 4)            416666
        dwFrameInterval( 5)            500000
        dwFrameInterval( 6)            666666
        dwFrameInterval( 7)           1000000
        dwFrameInterval( 8)           1333333
        dwFrameInterval( 9)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            66
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 73728000
        dwMaxBitRate                884736000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                 10
        dwBytesPerLine                      0
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            200000
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            400000
        dwFrameInterval( 4)            416666
        dwFrameInterval( 5)            500000
        dwFrameInterval( 6)            666666
        dwFrameInterval( 7)           1000000
        dwFrameInterval( 8)           1333333
        dwFrameInterval( 9)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            66
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                165888000
        dwMaxBitRate                1990656000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                 10
        dwBytesPerLine                      0
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            200000
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            400000
        dwFrameInterval( 4)            416666
        dwFrameInterval( 5)            500000
        dwFrameInterval( 6)            666666
        dwFrameInterval( 7)           1000000
        dwFrameInterval( 8)           1333333
        dwFrameInterval( 9)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            58
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           3840
        wHeight                          2160
        dwMinBitRate                663552000
        dwMaxBitRate                3981312000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  8
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            416666
        dwFrameInterval( 3)            500000
        dwFrameInterval( 4)            666666
        dwFrameInterval( 5)           1000000
        dwFrameInterval( 6)           1333333
        dwFrameInterval( 7)           2000000
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        4
        bNumFrameDescriptors                8
        guidFormat
{35363248-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                      16
        bDefaultFrameIndex                  7
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
        bLength                            66
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 24576000
        dwMaxBitRate                294912000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                 10
        dwBytesPerLine                      0
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            200000
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            400000
        dwFrameInterval( 4)            416666
        dwFrameInterval( 5)            500000
        dwFrameInterval( 6)            666666
        dwFrameInterval( 7)           1000000
        dwFrameInterval( 8)           1333333
        dwFrameInterval( 9)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            66
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 18432000
        dwMaxBitRate                221184000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                 10
        dwBytesPerLine                      0
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            200000
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            400000
        dwFrameInterval( 4)            416666
        dwFrameInterval( 5)            500000
        dwFrameInterval( 6)            666666
        dwFrameInterval( 7)           1000000
        dwFrameInterval( 8)           1333333
        dwFrameInterval( 9)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            66
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            720
        wHeight                           408
        dwMinBitRate                 23500800
        dwMaxBitRate                282009600
        dwDefaultFrameInterval         333333
        bFrameIntervalType                 10
        dwBytesPerLine                      0
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            200000
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            400000
        dwFrameInterval( 4)            416666
        dwFrameInterval( 5)            500000
        dwFrameInterval( 6)            666666
        dwFrameInterval( 7)           1000000
        dwFrameInterval( 8)           1333333
        dwFrameInterval( 9)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            66
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            720
        wHeight                           480
        dwMinBitRate                 27648000
        dwMaxBitRate                331776000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                 10
        dwBytesPerLine                      0
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            200000
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            400000
        dwFrameInterval( 4)            416666
        dwFrameInterval( 5)            500000
        dwFrameInterval( 6)            666666
        dwFrameInterval( 7)           1000000
        dwFrameInterval( 8)           1333333
        dwFrameInterval( 9)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            66
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1024
        wHeight                           576
        dwMinBitRate                 47185920
        dwMaxBitRate                566231040
        dwDefaultFrameInterval         333333
        bFrameIntervalType                 10
        dwBytesPerLine                      0
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            200000
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            400000
        dwFrameInterval( 4)            416666
        dwFrameInterval( 5)            500000
        dwFrameInterval( 6)            666666
        dwFrameInterval( 7)           1000000
        dwFrameInterval( 8)           1333333
        dwFrameInterval( 9)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            66
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 73728000
        dwMaxBitRate                884736000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                 10
        dwBytesPerLine                      0
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            200000
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            400000
        dwFrameInterval( 4)            416666
        dwFrameInterval( 5)            500000
        dwFrameInterval( 6)            666666
        dwFrameInterval( 7)           1000000
        dwFrameInterval( 8)           1333333
        dwFrameInterval( 9)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            66
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                165888000
        dwMaxBitRate                1990656000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                 10
        dwBytesPerLine                      0
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            200000
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            400000
        dwFrameInterval( 4)            416666
        dwFrameInterval( 5)            500000
        dwFrameInterval( 6)            666666
        dwFrameInterval( 7)           1000000
        dwFrameInterval( 8)           1333333
        dwFrameInterval( 9)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            58
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           3840
        wHeight                          2160
        dwMinBitRate                663552000
        dwMaxBitRate                3981312000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  8
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            416666
        dwFrameInterval( 3)            500000
        dwFrameInterval( 4)            666666
        dwFrameInterval( 5)           1000000
        dwFrameInterval( 6)           1333333
        dwFrameInterval( 7)           2000000
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
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x00c0  1x 192 bytes
        bInterval               1
        bMaxBurst               0
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
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0180  1x 384 bytes
        bInterval               1
        bMaxBurst               0
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
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               1
        bMaxBurst               0
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
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0280  1x 640 bytes
        bInterval               1
        bMaxBurst               0
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
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0320  1x 800 bytes
        bInterval               1
        bMaxBurst               0
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
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
        bMaxBurst               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       7
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
        bMaxBurst               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       8
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
        bMaxBurst               2
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       9
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
        bMaxBurst               3
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting      10
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
        bMaxBurst               4
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting      11
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
        bMaxBurst               5
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting      12
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
        bMaxBurst               6
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting      13
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
        bMaxBurst               7
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting      14
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
        bMaxBurst               8
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting      15
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
        bMaxBurst              10
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting      16
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
        bMaxBurst              12
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting      17
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
        bMaxBurst              15
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      0
      bInterfaceProtocol      0
      iInterface              0
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.11
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength      29
         Report Descriptors:
           ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0030  1x 48 bytes
        bInterval               1
        bMaxBurst               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0030  1x 48 bytes
        bInterval               1
        bMaxBurst               0
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         3
      bInterfaceCount         2
      bFunctionClass          1 Audio
      bFunctionSubClass       1 Control Device
      bFunctionProtocol       0
      iFunction               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol      0
      iInterface              0
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               1.00
        wTotalLength       0x0026
        bInCollection           1
        baInterfaceNr(0)        4
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0201 Microphone
        bAssocTerminal          0
        bNrChannels             1
        wChannelConfig     0x0003
          Left Front (L)
          Right Front (R)
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
        bLength                 8
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                 5
        bSourceID               1
        bControlSize            1
        bmaControls(0)       0x03
          Mute Control
          Volume Control
        iFeature                0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        4
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0
      iInterface              0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        4
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
        bNrChannels             2
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        48000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x85  EP 5 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x00c0  1x 192 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        bMaxBurst               0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x0016
  bNumDeviceCaps          2
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x00000000
      (Missing must-be-set LPM bit!)
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x00
    wSpeedsSupported   0x000c
      Device can operate at High Speed (480Mbps)
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   3
      Lowest fully-functional device speed is SuperSpeed (5Gbps)
    bU1DevExitLat           0 micro seconds
    bU2DevExitLat           0 micro seconds
Device Status:     0x0001
  Self Powered

...
[ 1541.366590] speed: GET_MIN 00 0x0 00
[ 1541.367110] speed: GET_MAX 00 0x18 00
[ 1541.367901] speed: GET_MIN 00 0x0 00
[ 1541.368444] speed: GET_MAX 00 0x14 00
...
[ 1704.283565] zoom: GET_MAX 00 0x0 00
[ 1704.284028] zoom: GET_MAX 00 0x0 07
...

Best regards/Tr=C3=A2n tr=E1=BB=8Dng,


Linh Vu (V=C5=A9 Th=E1=BB=8B Ph=C6=B0=C6=A1ng Linh)
linh.tp.vu@gmail.com



On Tue, Mar 19, 2024 at 8:52=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> Hi Linh
>
> Could you share the "lsusb  -v " info of your device, and also what
> are the raw values from the device for UVC_GET_MAX, UVC_GET_MIN for
> UVC_CT_PANTILT_RELATIVE_CONTROL and UVC_CT_ZOOM_RELATIVE_CONTROL ?
>
> Something like this (not tested :) ):
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc=
_ctrl.c
> index e59a463c27618..76c7adc3aa579 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -415,7 +415,11 @@ static s32 uvc_ctrl_get_zoom(struct
> uvc_control_mapping *mapping,
>                 return (zoom =3D=3D 0) ? 0 : (zoom > 0 ? data[2] : -data[=
2]);
>
>         case UVC_GET_MIN:
> +               printk(KERN_ERR "zoom: GET_MIN 0%x 0x%x 0%x\n",
> data[0], data[1], data[2]);
> +               return data[2];
>         case UVC_GET_MAX:
> +               printk(KERN_ERR "zoom: GET_MAX 0%x 0x%x 0%x\n",
> data[0], data[1], data[2]);
> +               fallthrough;
>         case UVC_GET_RES:
>         case UVC_GET_DEF:
>         default:
> @@ -441,8 +445,11 @@ static s32 uvc_ctrl_get_rel_speed(struct
> uvc_control_mapping *mapping,
>                 return (rel =3D=3D 0) ? 0 : (rel > 0 ? data[first+1]
>                                                  : -data[first+1]);
>         case UVC_GET_MIN:
> +               printk(KERN_ERR "speed: GET_MIN 0%x 0x%x 0%x\n",
> data[first], data[first+1], data[first+2]);
>                 return -data[first+1];
>         case UVC_GET_MAX:
> +               printk(KERN_ERR "speed: GET_MAX 0%x 0x%x 0%x\n",
> data[first], data[first+1], data[first+2]);
> +               fallthrough;
>         case UVC_GET_RES:
>         case UVC_GET_DEF:
>         default:
>
> Thanks!
>
> On Tue, 19 Mar 2024 at 06:30, Linh Vu <linh.tp.vu@gmail.com> wrote:
> >
> > When mapping from UVC_CT_PANTILT_RELATIVE_CONTROL
> > to V4L2_CID_PAN_SPEED and V4L2_CID_TILT_SPEED,
> > and from UVC_CT_ZOOM_RELATIVE_CONTROL to V4L2_CID_ZOOM_CONTINUOUS,
> > the minimum value of the movement should be negated of the maximum valu=
e.
> >
> > For example, if a UVC device (e.g., OBSBOT Tiny 2) declares a pan speed
> > range [1, 160], its V4L2_CID_PAN_SPEED mapping has range [-160, 160].
> >
> > Currently, calling ioctl with VIDIOC_QUERY_EXT_CTRL and V4L2_CID_PAN_SP=
EED
> > returns a minimum value of -1. When calling ioctl with VIDIOC_S_CTRL,
> > V4L2_CID_PAN_SPEED and -100, the speed (velocity) of the pan movement g=
ets
> > clamped to -1.
> >
> > To get the minimum value of V4L2_CID_PAN_SPEED,
> > uvc_ctrl_get_rel_speed is called with
> > uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN) as data,
> > which should be uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX).
> >
> > The same thing should be done for V4L2_CID_TILT_SPEED and
> > V4L2_CID_ZOOM_CONTINUOUS.
> >
> > For V4L2_CID_ZOOM_CONTINUOUS, uvc_ctrl_get_zoom does not add the
> > sign to the returned minimum value, so it's impossible to zoom out.
> >
> > Modify the data that is passed when querying the minimum
> > value for V4L2_CID_PAN_SPEED, V4L2_CID_TILT_SPEED and
> > V4L2_CID_ZOOM_CONTINUOUS.
> > Also add sign to the returned minimum value in uvc_ctrl_get_zoom.
> > Thus, the correct minimum value for relative PTZ controls can be return=
ed.
> >
> > Signed-off-by: Linh Vu <linh.tp.vu@gmail.com>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 24 +++++++++++++++++++-----
> >  1 file changed, 19 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/u=
vc_ctrl.c
> > index e59a463c27618..00fd7e74e6d6b 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -415,6 +415,7 @@ static s32 uvc_ctrl_get_zoom(struct uvc_control_map=
ping *mapping,
> >                 return (zoom =3D=3D 0) ? 0 : (zoom > 0 ? data[2] : -dat=
a[2]);
> >
> >         case UVC_GET_MIN:
> > +               return -data[2];
> >         case UVC_GET_MAX:
> >         case UVC_GET_RES:
> >         case UVC_GET_DEF:
> > @@ -1322,9 +1323,16 @@ static int __uvc_query_v4l2_ctrl(struct uvc_vide=
o_chain *chain,
> >                 break;
> >         }
> >
> > -       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN)
> > -               v4l2_ctrl->minimum =3D mapping->get(mapping, UVC_GET_MI=
N,
> > -                                    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_=
MIN));
> > +       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN) {
> > +               if (v4l2_ctrl->id =3D=3D V4L2_CID_PAN_SPEED
> > +               || v4l2_ctrl->id =3D=3D V4L2_CID_TILT_SPEED
> > +               || v4l2_ctrl->id =3D=3D V4L2_CID_ZOOM_CONTINUOUS)
> > +                       v4l2_ctrl->minimum =3D mapping->get(mapping, UV=
C_GET_MIN,
> > +                                               uvc_ctrl_data(ctrl, UVC=
_CTRL_DATA_MAX));
> > +               else
> > +                       v4l2_ctrl->minimum =3D mapping->get(mapping, UV=
C_GET_MIN,
> > +                                               uvc_ctrl_data(ctrl, UVC=
_CTRL_DATA_MIN));
> > +       }
> >
> >         if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX)
> >                 v4l2_ctrl->maximum =3D mapping->get(mapping, UVC_GET_MA=
X,
> > @@ -1909,9 +1917,15 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> >                         if (ret < 0)
> >                                 return ret;
> >                 }
> > +               if (mapping->id =3D=3D V4L2_CID_PAN_SPEED
> > +               || mapping->id =3D=3D V4L2_CID_TILT_SPEED
> > +               || mapping->id =3D=3D V4L2_CID_ZOOM_CONTINUOUS)
> > +                       min =3D mapping->get(mapping, UVC_GET_MIN,
> > +                                       uvc_ctrl_data(ctrl, UVC_CTRL_DA=
TA_MAX));
> > +               else
> > +                       min =3D mapping->get(mapping, UVC_GET_MIN,
> > +                                       uvc_ctrl_data(ctrl, UVC_CTRL_DA=
TA_MIN));
> >
> > -               min =3D mapping->get(mapping, UVC_GET_MIN,
> > -                                  uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MI=
N));
> >                 max =3D mapping->get(mapping, UVC_GET_MAX,
> >                                    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MA=
X));
> >                 step =3D mapping->get(mapping, UVC_GET_RES,
> >
> > base-commit: e0b8eb0f6d652981bfd9ba7c619c9d81ed087ad0
> > --
> > 2.34.1
> >
> >
>
>
> --
> Ricardo Ribalda

