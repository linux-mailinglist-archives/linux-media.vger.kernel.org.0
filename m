Return-Path: <linux-media+bounces-44058-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F43EBC8346
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 11:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8A30C353058
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 09:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8C4D2D6E7D;
	Thu,  9 Oct 2025 09:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZ3qndaR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35E32D47F4
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 09:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760000932; cv=none; b=LDrLlSDSWNtM7UKpTAaAF5B8cgcmHrUZDw1AEAAgbQ20g+812/Iomu5L34IGOEziYNgYqE1SY7/mY5qUUdxI/HhfkPit3sUEYDyrSEOF8ZGK4XZ+CdKsNTSUw94tSYcTKPU+jPuSq+S7Rk4BW71vb6LMKiel+WbqUI2YdxSGoLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760000932; c=relaxed/simple;
	bh=tEiATFEG8PmMlrXRl6Ytiy0m9cwWwNxbOSVA3NQd2Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=on4RTorONlL1ie9lUQfRl/hZRt0cYVRyYbevFKri1QPfUt3ZSaECxcb8UK00x5GnNoFZN78RDPg7IeTWlCtChvKwcznQf7SsPLjMYEt3J/5hwGF7Iksg1t5pGemELj738cSlBRL7f1sQPHhzD1D/WJxcvWxgLtLssw7QzFgmjYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZ3qndaR; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b3ee18913c0so108204566b.3
        for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 02:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760000924; x=1760605724; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gW3E1SPskWLqeIa7evtPlkpfcrdKw/91bZWeZc+CW/8=;
        b=RZ3qndaRl/uciBYCawdY/T6XgZ1fJE/OVHD5ZOAvmakSHHRkVqBw5Sb7QDW9orMpEH
         ih5IwgUMbm04Mk3T6FugGMW67MDEKTreoqDjh+v6Mr0jJi13F/OamCuv5kcEAzZhb62U
         uI/j5cWQzesFhXPnsbTmwSa5kEYO/wvcKAeai1DcIIaqwgTdDigjaO01qtKraaTMLWYJ
         3Izbsed5odCs2graKMqu7uFlTXlwiuTKGTJDO7poeEHa+vVaW1ubeUl4ewVO9GXwDLid
         R/wuEp5CK+n0kmuxfBSyqdeuSYem6TuBItUuEOG0tAVs2fnAdHzTnBeMH+qXElFuRp5v
         E6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760000924; x=1760605724;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gW3E1SPskWLqeIa7evtPlkpfcrdKw/91bZWeZc+CW/8=;
        b=o8JZmSI7vqL+o8nY0n5YwmgKZl8sVx1T7WCl0wPoPu3vPRMQOJgqkUmK9flDSMKSOo
         DZ/pYe9reumlB7jFFnfHpb4mlHQUR/0lJuA41lElRR6ScqRcMcwjqSQ5Z9Zj93WuPwRU
         +aQxEK5626LBXMC2qhhQtQ+kPZLA59G0Jai9jlxlqNI8+cIxObVTnO5XM9jzwSeVdDR2
         WZKKK/iRl9smkiOy+OlHg7uVCRwyuFIMAIX3oa6IdsMGxjs1Wve2WUj386f/2QYMm2ha
         TXg2vFPaxRwhizEas+bSoXOoR+cQpW3GtjV7XwGeQ/ojvO4fOStH/+h6J/5mO9I60aiP
         8ykg==
X-Forwarded-Encrypted: i=1; AJvYcCWCLFoFcMuZvEMKggUGSFrkGaTtOJDHg0uFok6fW94fVSnbWghl3bMEaxOCA4wPDEmaqZ79RxbrzMje9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJCLUyTUhDaRqw1Yiz1gu1QQrPazKrIohghKtP2dbjCNOHI2Qc
	YQRchgLfS+RWFDveSW7HyWFOhAA28I2uvsIcXz3I1HNzQQ+ZAvHUONT7
X-Gm-Gg: ASbGncuohCh5r0462uEwQY+SgTc/8sMX5lsXXrm+ejVfEIimQuNCUbHvynjtPyKesIS
	xjzPUIiTfGMxnPRTg+CrJ9QoNvpnO39aJoLdRmeekqKwjxXmPQZOZu5NMVRsTeoYBMUt3UtwxPP
	t4i3XaHOZl3AJmvB8dDMe450R9ozJoQwOA7ugaySJWANEdRj0HU03KV7eNMZGsq1WUXRsl1Fm0P
	GfHh0Y6PDJTrd56ZAqOE1rtEDOJR4vNRqfLrCjdW0clWQOKApvbLh30ZtzRpxNMnMIXxPXXmRgD
	up3A4D7F4IUhAvlqCXYGYjqhyjtX4+1/Jo1zP5OcBWr2rCGiiwYYTqIalL/iEimORt3hB0T12vk
	kErXtVqZNtP1CaxtIUxaDsTgxGqfa4zHsLA4+4Ly/ZiUWQsfc/Yo0JXYzjWfuSCw8DtQ=
X-Google-Smtp-Source: AGHT+IG2Cur3Nb+xqdKrQQHk6kBQGpPu/873OnKGKNPuPmYXCkSv8HAccPi8oW74FSw0Le9+Ee2qMQ==
X-Received: by 2002:a17:907:3e8c:b0:b48:4966:91a5 with SMTP id a640c23a62f3a-b50aba9e585mr739835966b.30.1760000923397;
        Thu, 09 Oct 2025 02:08:43 -0700 (PDT)
Received: from imap.gmail.com ([84.39.160.182])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869b4dfbfsm1850471366b.68.2025.10.09.02.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 02:08:42 -0700 (PDT)
Date: Thu, 9 Oct 2025 11:08:40 +0200
From: Wojciech =?utf-8?Q?G=C5=82adysz?= <kontra.wojciech.gladysz@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Gladysz WojciechX <wojciechx.gladysz@realsenseai.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, yogev.modlin@realsenseai.com
Subject: Re: Realsense camera patch
Message-ID: <wm5gfxhvifqamhatze5pfeyzfm6hnyknd4ww2bf75nwmw3okyn@7jmk66eibia5>
References: <CO1PR18MB463349680603EC2C284B7FEFF71BA@CO1PR18MB4633.namprd18.prod.outlook.com>
 <CANiDSCtwhpCAgQY73phJE0okN+Smv_AbA6Q+w2tuTVW1_qcbDg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCtwhpCAgQY73phJE0okN+Smv_AbA6Q+w2tuTVW1_qcbDg@mail.gmail.com>

From: Wojciech Gladysz <kontra.wojciech.gladysz@gmail.com>
Date: Thu, 9 Oct 2025 10:56:36 +0300
Subject: [PATCH 1/1] v4l2: metadata for realsense cameras

Add metadata to uvc driver for the following realsense cameras:
Bus 002 Device 010: ID 8086:0b56 Intel Corp. Intel(R) RealSense(TM) Depth Camera 555
Bus 002 Device 008: ID 8086:1155 Intel Corp. Intel(R) RealSense(TM) Depth Camera 421 
Bus 002 Device 004: ID 8086:1156 Intel Corp. Intel(R) RealSense(TM) Depth Camera 436 

Signed-off-by: Wojciech Gladysz <kontra.wojciech.gladysz@gmail.com>
---
Bus 002 Device 010: ID 8086:0b56 Intel Corp. Intel(R) RealSense(TM) Depth Camera 555
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.20
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0         9
  idVendor           0x8086 Intel Corp.
  idProduct          0x0b56 
  bcdDevice           50.c5
  iManufacturer           1 Intel(R) RealSense(TM) Depth Camera 555
  iProduct                2 Intel(R) RealSense(TM) Depth Camera 555
  iSerial                 3 471300003-02
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x08f1
    bNumInterfaces         11
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0xc0
      Self Powered
    MaxPower              440mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         3
      bFunctionClass         14 Video
      bFunctionSubClass       3 Video Interface Collection
      bFunctionProtocol       0 
      iFunction               5 Intel(R) RealSense(TM) Depth Camera 555 Depth
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      1 Video Control
      bInterfaceProtocol      1 
      iInterface              5 Intel(R) RealSense(TM) Depth Camera 555 Depth
      VideoControl Interface Descriptor:
        bLength                14
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdUVC               1.50
        wTotalLength       0x005c
        dwClockFrequency       48.000000MHz
        bInCollection           2
        baInterfaceNr( 0)       1
        baInterfaceNr( 1)       2
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
        bmControls           0x00200000
          Region of Interest
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      5 (PROCESSING_UNIT)
        bUnitID                 2
        bSourceID               1
        wMaxMultiplier      16384
        bControlSize            3
        bmControls     0x00000200
          Gain
        iProcessing             0 
        bmVideoStandards     0x00
      VideoControl Interface Descriptor:
        bLength                29
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 3
        guidExtensionCode         {c9606ccb-594c-4d25-af47-ccc496435995}
        bNumControls           23
        bNrInPins               1
        baSourceID( 0)          2
        bControlSize            4
        bmControls( 0)       0xff
        bmControls( 1)       0x5f
        bmControls( 2)       0x70
        bmControls( 3)       0x00
        iExtension              6 Intel(R) RealSense(TM) Depth Camera 555 RGB
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
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             5
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               3
        iTerminal               0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x87  EP 7 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               6
        bMaxBurst               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      1 
      iInterface              5 Intel(R) RealSense(TM) Depth Camera 555 Depth
      VideoStreaming Interface Descriptor:
        bLength                            14
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         1
        wTotalLength                   0x00f2
        bEndpointAddress                 0x82  EP 2 IN
        bmInfo                              0
        bTerminalLink                       4
        bStillCaptureMethod                 0
        bTriggerSupport                     0
        bTriggerUsage                       0
        bControlSize                        1
        bmaControls( 0)                     0
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        1
        bNumFrameDescriptors                5
        guidFormat                            {2036315a-0000-0010-8000-00aa00389b71}
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
        bVariableSize                     0
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            256
        wHeight                           144
        dwMinBitRate                 53084160
        dwMaxBitRate                 53084160
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  1
        dwBytesPerLine                    512
        dwFrameInterval( 0)            111111
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            448
        wHeight                           252
        dwMinBitRate                  9031680
        dwMaxBitRate                108380160
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  4
        dwBytesPerLine                    896
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 18432000
        dwMaxBitRate                221184000
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  4
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            896
        wHeight                           504
        dwMinBitRate                 36126720
        dwMaxBitRate                433520640
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  4
        dwBytesPerLine                   1792
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 73728000
        dwMaxBitRate                442368000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  3
        dwBytesPerLine                   2560
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
        dwFrameInterval( 2)           2000000
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      1 
      iInterface              8 Intel(R) RealSense(TM) Depth Camera 555 Y
      VideoStreaming Interface Descriptor:
        bLength                            18
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         5
        wTotalLength                   0x03c8
        bEndpointAddress                 0x83  EP 3 IN
        bmInfo                              0
        bTerminalLink                       5
        bStillCaptureMethod                 0
        bTriggerSupport                     0
        bTriggerUsage                       0
        bControlSize                        1
        bmaControls( 0)                     0
        bmaControls( 1)                     0
        bmaControls( 2)                     0
        bmaControls( 3)                     0
        bmaControls( 4)                     0
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        1
        bNumFrameDescriptors                5
        guidFormat                            {00000032-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                       8
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
        bVariableSize                     0
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            256
        wHeight                           144
        dwMinBitRate                 26542080
        dwMaxBitRate                 26542080
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  1
        dwBytesPerLine                    256
        dwFrameInterval( 0)            111111
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            448
        wHeight                           252
        dwMinBitRate                  4515840
        dwMaxBitRate                 54190080
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  4
        dwBytesPerLine                    448
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                  9216000
        dwMaxBitRate                110592000
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  4
        dwBytesPerLine                    640
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            896
        wHeight                           504
        dwMinBitRate                 18063360
        dwMaxBitRate                216760320
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  4
        dwBytesPerLine                    896
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 36864000
        dwMaxBitRate                221184000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  3
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
        dwFrameInterval( 2)           2000000
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        2
        bNumFrameDescriptors                5
        guidFormat                            {59565955-0000-0010-8000-00aa00389b71}
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
        bVariableSize                     0
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            256
        wHeight                           144
        dwMinBitRate                 53084160
        dwMaxBitRate                 53084160
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  1
        dwBytesPerLine                    512
        dwFrameInterval( 0)            111111
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            448
        wHeight                           252
        dwMinBitRate                  9031680
        dwMaxBitRate                108380160
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  4
        dwBytesPerLine                    896
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 18432000
        dwMaxBitRate                221184000
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  4
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            896
        wHeight                           504
        dwMinBitRate                 36126720
        dwMaxBitRate                433520640
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  4
        dwBytesPerLine                   1792
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 73728000
        dwMaxBitRate                442368000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  3
        dwBytesPerLine                   2560
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
        dwFrameInterval( 2)           2000000
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        3
        bNumFrameDescriptors                5
        guidFormat                            {20203859-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                       8
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
        bVariableSize                     0
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            256
        wHeight                           144
        dwMinBitRate                 26542080
        dwMaxBitRate                 26542080
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  1
        dwBytesPerLine                    256
        dwFrameInterval( 0)            111111
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            448
        wHeight                           252
        dwMinBitRate                  4515840
        dwMaxBitRate                 54190080
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  4
        dwBytesPerLine                    448
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                  9216000
        dwMaxBitRate                110592000
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  4
        dwBytesPerLine                    640
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            896
        wHeight                           504
        dwMinBitRate                 18063360
        dwMaxBitRate                216760320
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  4
        dwBytesPerLine                    896
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 36864000
        dwMaxBitRate                221184000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  3
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
        dwFrameInterval( 2)           2000000
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        4
        bNumFrameDescriptors                4
        guidFormat                            {20493859-0000-0010-8000-00aa00389b71}
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
        bVariableSize                     0
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            448
        wHeight                           252
        dwMinBitRate                  9031680
        dwMaxBitRate                108380160
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  4
        dwBytesPerLine                    896
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 18432000
        dwMaxBitRate                221184000
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  4
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            896
        wHeight                           504
        dwMinBitRate                 36126720
        dwMaxBitRate                433520640
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  4
        dwBytesPerLine                   1792
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 73728000
        dwMaxBitRate                442368000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  3
        dwBytesPerLine                   2560
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
        dwFrameInterval( 2)           2000000
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        5
        bNumFrameDescriptors                1
        guidFormat                            {49363159-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                      32
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
        bVariableSize                     0
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           800
        dwMinBitRate                491520000
        dwMaxBitRate                819200000
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwBytesPerLine                   5120
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            666666
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         3
      bInterfaceCount         2
      bFunctionClass         14 Video
      bFunctionSubClass       3 Video Interface Collection
      bFunctionProtocol       0 
      iFunction               6 Intel(R) RealSense(TM) Depth Camera 555 RGB
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass        14 Video
      bInterfaceSubClass      1 Video Control
      bInterfaceProtocol      1 
      iInterface              6 Intel(R) RealSense(TM) Depth Camera 555 RGB
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdUVC               1.50
        wTotalLength       0x0051
        dwClockFrequency       48.000000MHz
        bInCollection           1
        baInterfaceNr( 0)       4
      VideoControl Interface Descriptor:
        bLength                18
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             6
        wTerminalType      0x0201 Camera Sensor
        bAssocTerminal          0
        iTerminal               0 
        wObjectiveFocalLengthMin      0
        wObjectiveFocalLengthMax      0
        wOcularFocalLength            0
        bControlSize                  3
        bmControls           0x0000000e
          Auto-Exposure Mode
          Auto-Exposure Priority
          Exposure Time (Absolute)
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      5 (PROCESSING_UNIT)
        bUnitID                 7
        bSourceID               6
        wMaxMultiplier      16384
        bControlSize            3
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
        bLength                28
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 8
        guidExtensionCode         {b8ec416e-a3ac-4580-8d5c-0bee1597e43d}
        bNumControls            2
        bNrInPins               1
        baSourceID( 0)          7
        bControlSize            3
        bmControls( 0)       0x03
        bmControls( 1)       0x00
        bmControls( 2)       0x00
        iExtension              0 
      VideoControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             9
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               7
        iTerminal               0 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        4
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      1 
      iInterface              6 Intel(R) RealSense(TM) Depth Camera 555 RGB
      VideoStreaming Interface Descriptor:
        bLength                            16
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         3
        wTotalLength                   0x022c
        bEndpointAddress                 0x84  EP 4 IN
        bmInfo                              0
        bTerminalLink                       9
        bStillCaptureMethod                 0
        bTriggerSupport                     0
        bTriggerUsage                       0
        bControlSize                        1
        bmaControls( 0)                     0
        bmaControls( 1)                     0
        bmaControls( 2)                     0
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        1
        bNumFrameDescriptors                5
        guidFormat                            {32595559-0000-0010-8000-00aa00389b71}
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
        bVariableSize                     0
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            448
        wHeight                           252
        dwMinBitRate                  9031680
        dwMaxBitRate                108380160
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  4
        dwBytesPerLine                    896
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 18432000
        dwMaxBitRate                221184000
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  4
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            896
        wHeight                           504
        dwMinBitRate                 36126720
        dwMaxBitRate                433520640
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  4
        dwBytesPerLine                   1792
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 73728000
        dwMaxBitRate                442368000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  4
        dwBytesPerLine                   2560
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
        dwFrameInterval( 2)           1000000
        dwFrameInterval( 3)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           800
        dwMinBitRate                245760000
        dwMaxBitRate                491520000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwBytesPerLine                   2560
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        2
        bNumFrameDescriptors                5
        guidFormat                            {3032344d-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                      12
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
        bVariableSize                     0
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            448
        wHeight                           252
        dwMinBitRate                  6773760
        dwMaxBitRate                 81285120
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  4
        dwBytesPerLine                    672
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 13824000
        dwMaxBitRate                165888000
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  4
        dwBytesPerLine                    960
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            896
        wHeight                           504
        dwMinBitRate                 27095040
        dwMaxBitRate                325140480
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  4
        dwBytesPerLine                   1344
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 55296000
        dwMaxBitRate                331776000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  4
        dwBytesPerLine                   1920
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
        dwFrameInterval( 2)           1000000
        dwFrameInterval( 3)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           800
        dwMinBitRate                184320000
        dwMaxBitRate                368640000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwBytesPerLine                   1920
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        3
        bNumFrameDescriptors                1
        guidFormat                            {36315752-1a66-a242-9065-d01814a8ef8a}
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
        bVariableSize                     0
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           800
        dwMinBitRate                245760000
        dwMaxBitRate                491520000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwBytesPerLine                   2560
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        5
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      0 
      bInterfaceProtocol      1 Keyboard
      iInterface              9 Intel(R) RealSense(TM) HID
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.10
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength    1002
         Report Descriptors: 
           ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x86  EP 6 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               2
        bMaxBurst               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        6
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 
      bInterfaceProtocol      1 
      iInterface              0 
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         7
      bInterfaceCount         2
      bFunctionClass          2 Communications
      bFunctionSubClass       2 Abstract (modem)
      bFunctionProtocol       0 
      iFunction               0 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        7
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         2 Communications
      bInterfaceSubClass      2 Abstract (modem)
      bInterfaceProtocol      1 AT-commands (v.25ter)
      iInterface              0 
      CDC Header:
        bcdCDC               1.10
      CDC Call Management:
        bmCapabilities       0x00
        bDataInterface          0
      CDC ACM:
        bmCapabilities       0x02
          line coding and serial state
      CDC Union:
        bMasterInterface        7
        bSlaveInterface         8 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x8a  EP 10 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval              16
        bMaxBurst               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        8
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass        10 CDC Data
      bInterfaceSubClass      0 
      bInterfaceProtocol      1 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x85  EP 5 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x05  EP 5 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         9
      bInterfaceCount         2
      bFunctionClass          2 Communications
      bFunctionSubClass       2 Abstract (modem)
      bFunctionProtocol       0 
      iFunction               0 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        9
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         2 Communications
      bInterfaceSubClass      2 Abstract (modem)
      bInterfaceProtocol      1 AT-commands (v.25ter)
      iInterface              0 
      CDC Header:
        bcdCDC               1.10
      CDC Call Management:
        bmCapabilities       0x01
          call management
        bDataInterface          0
      CDC ACM:
        bmCapabilities       0x02
          line coding and serial state
      CDC Union:
        bMasterInterface        9
        bSlaveInterface         10 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x8b  EP 11 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval              16
        bMaxBurst               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber       10
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass        10 CDC Data
      bInterfaceSubClass      0 
      bInterfaceProtocol      1 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x09  EP 9 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x89  EP 9 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x0032
  bNumDeviceCaps          3
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
    bU1DevExitLat          10 micro seconds
    bU2DevExitLat        2047 micro seconds
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x00000006
      BESL Link Power Management (LPM) Supported
  Platform Device Capability:
    bLength                28
    bDescriptorType        16
    bDevCapabilityType      5
    bReserved               0
    PlatformCapabilityUUID    {d8dd60df-4589-4cc7-9cd2-659d9e648a9f}
    CapabilityData[0]    0x00
    CapabilityData[1]    0x00
    CapabilityData[2]    0x03
    CapabilityData[3]    0x06
    CapabilityData[4]    0x44
    CapabilityData[5]    0x02
    CapabilityData[6]    0x20
    CapabilityData[7]    0x00
Device Status:     0x0001
  Self Powered

Bus 002 Device 008: ID 8086:1155 Intel Corp. Intel(R) RealSense(TM) Depth Camera 421 
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.20
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0         9
  idVendor           0x8086 Intel Corp.
  idProduct          0x1155 
  bcdDevice           51.04
  iManufacturer           1 Intel(R) RealSense(TM) Depth Camera 421 
  iProduct                2 Intel(R) RealSense(TM) Depth Camera 421 
  iSerial                 3 012345678901
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x09a3
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              720mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         3
      bFunctionClass         14 Video
      bFunctionSubClass       3 Video Interface Collection
      bFunctionProtocol       0 
      iFunction               5 Intel(R) RealSense(TM) Depth Camera 421  Depth
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      1 Video Control
      bInterfaceProtocol      0 
      iInterface              5 Intel(R) RealSense(TM) Depth Camera 421  Depth
      VideoControl Interface Descriptor:
        bLength                14
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdUVC               1.50
        wTotalLength       0x005b
        dwClockFrequency       48.000000MHz
        bInCollection           2
        baInterfaceNr( 0)       1
        baInterfaceNr( 1)       2
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
        bmControls           0x00200000
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      5 (PROCESSING_UNIT)
        bUnitID                 2
        bSourceID               1
        wMaxMultiplier      16384
        bControlSize            3
        bmControls     0x00000200
          Gain
        iProcessing             0 
        bmVideoStandards     0x00
      VideoControl Interface Descriptor:
        bLength                28
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 3
        guidExtensionCode         {c9606ccb-594c-4d25-af47-ccc496435995}
        bNumControls           17
        bNrInPins               1
        baSourceID( 0)          2
        bControlSize            3
        bmControls( 0)       0xff
        bmControls( 1)       0xdd
        bmControls( 2)       0x01
        iExtension              6 Intel(R) RealSense(TM) Depth Camera 421  RGB
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
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             5
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               3
        iTerminal               0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x87  EP 7 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               6
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
      iInterface              5 Intel(R) RealSense(TM) Depth Camera 421  Depth
      VideoStreaming Interface Descriptor:
        bLength                            15
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         2
        wTotalLength                   0x02f3
        bEndpointAddress                 0x82  EP 2 IN
        bmInfo                              0
        bTerminalLink                       4
        bStillCaptureMethod                 0
        bTriggerSupport                     0
        bTriggerUsage                       0
        bControlSize                        1
        bmaControls( 0)                     0
        bmaControls( 1)                     0
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        1
        bNumFrameDescriptors                8
        guidFormat                            {2036315a-0000-0010-8000-00aa00389b71}
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
        bVariableSize                     0
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            256
        wHeight                           144
        dwMinBitRate                 53084160
        dwMaxBitRate                176947200
        dwDefaultFrameInterval          33333
        bFrameIntervalType                  2
        dwBytesPerLine                    512
        dwFrameInterval( 0)             33333
        dwFrameInterval( 1)            111111
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            424
        wHeight                           240
        dwMinBitRate                  9768960
        dwMaxBitRate                146534400
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    848
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            480
        wHeight                           270
        dwMinBitRate                 12441600
        dwMaxBitRate                186624000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    960
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 22118400
        dwMaxBitRate                331776000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 29491200
        dwMaxBitRate                442368000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           100
        dwMinBitRate                135680000
        dwMaxBitRate                407040000
        dwDefaultFrameInterval          33333
        bFrameIntervalType                  2
        dwBytesPerLine                   1696
        dwFrameInterval( 0)             33333
        dwFrameInterval( 1)            100000
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           480
        dwMinBitRate                 39075840
        dwMaxBitRate                586137600
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1696
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 88473600
        dwMaxBitRate                442368000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  3
        dwBytesPerLine                   2560
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
        dwFrameInterval( 2)           1666665
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        2
        bNumFrameDescriptors                8
        guidFormat                            {00000050-0000-0010-8000-00aa00389b71}
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
        bVariableSize                     0
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            256
        wHeight                           144
        dwMinBitRate                 53084160
        dwMaxBitRate                176947200
        dwDefaultFrameInterval          33333
        bFrameIntervalType                  2
        dwBytesPerLine                    512
        dwFrameInterval( 0)             33333
        dwFrameInterval( 1)            111111
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            424
        wHeight                           240
        dwMinBitRate                  9768960
        dwMaxBitRate                146534400
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    848
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            480
        wHeight                           270
        dwMinBitRate                 12441600
        dwMaxBitRate                186624000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    960
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 22118400
        dwMaxBitRate                331776000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 29491200
        dwMaxBitRate                442368000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           100
        dwMinBitRate                135680000
        dwMaxBitRate                407040000
        dwDefaultFrameInterval          33333
        bFrameIntervalType                  2
        dwBytesPerLine                   1696
        dwFrameInterval( 0)             33333
        dwFrameInterval( 1)            100000
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           480
        dwMinBitRate                 39075840
        dwMaxBitRate                586137600
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1696
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 88473600
        dwMaxBitRate                442368000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  3
        dwBytesPerLine                   2560
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
        dwFrameInterval( 2)           1666665
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              8 Intel(R) RealSense(TM) Depth Camera 421  Y
      VideoStreaming Interface Descriptor:
        bLength                            18
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         5
        wTotalLength                   0x05da
        bEndpointAddress                 0x83  EP 3 IN
        bmInfo                              0
        bTerminalLink                       5
        bStillCaptureMethod                 0
        bTriggerSupport                     0
        bTriggerUsage                       0
        bControlSize                        1
        bmaControls( 0)                     0
        bmaControls( 1)                     0
        bmaControls( 2)                     0
        bmaControls( 3)                     0
        bmaControls( 4)                     0
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        1
        bNumFrameDescriptors                7
        guidFormat                            {00000032-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                       8
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
        bVariableSize                     0
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            424
        wHeight                           240
        dwMinBitRate                  4884480
        dwMaxBitRate                 73267200
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    424
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            480
        wHeight                           270
        dwMinBitRate                  6220800
        dwMaxBitRate                 93312000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    480
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 11059200
        dwMaxBitRate                165888000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    640
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 14745600
        dwMaxBitRate                221184000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    640
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           100
        dwMinBitRate                 67840000
        dwMaxBitRate                203520000
        dwDefaultFrameInterval          33333
        bFrameIntervalType                  2
        dwBytesPerLine                    848
        dwFrameInterval( 0)             33333
        dwFrameInterval( 1)            100000
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           480
        dwMinBitRate                 19537920
        dwMaxBitRate                293068800
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    848
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 44236800
        dwMaxBitRate                221184000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  3
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
        dwFrameInterval( 2)           1666665
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        2
        bNumFrameDescriptors                7
        guidFormat                            {59565955-0000-0010-8000-00aa00389b71}
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
        bVariableSize                     0
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            424
        wHeight                           240
        dwMinBitRate                  9768960
        dwMaxBitRate                146534400
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    848
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            480
        wHeight                           270
        dwMinBitRate                 12441600
        dwMaxBitRate                186624000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    960
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 22118400
        dwMaxBitRate                331776000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 29491200
        dwMaxBitRate                442368000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           100
        dwMinBitRate                135680000
        dwMaxBitRate                407040000
        dwDefaultFrameInterval          33333
        bFrameIntervalType                  2
        dwBytesPerLine                   1696
        dwFrameInterval( 0)             33333
        dwFrameInterval( 1)            100000
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           480
        dwMinBitRate                 39075840
        dwMaxBitRate                586137600
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1696
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 88473600
        dwMaxBitRate                442368000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  3
        dwBytesPerLine                   2560
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
        dwFrameInterval( 2)           1666665
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        3
        bNumFrameDescriptors                7
        guidFormat                            {20203859-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                       8
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
        bVariableSize                     0
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            424
        wHeight                           240
        dwMinBitRate                  4884480
        dwMaxBitRate                 73267200
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    424
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            480
        wHeight                           270
        dwMinBitRate                  6220800
        dwMaxBitRate                 93312000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    480
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 11059200
        dwMaxBitRate                165888000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    640
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 14745600
        dwMaxBitRate                221184000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    640
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           100
        dwMinBitRate                 67840000
        dwMaxBitRate                203520000
        dwDefaultFrameInterval          33333
        bFrameIntervalType                  2
        dwBytesPerLine                    848
        dwFrameInterval( 0)             33333
        dwFrameInterval( 1)            100000
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           480
        dwMinBitRate                 19537920
        dwMaxBitRate                293068800
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    848
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 44236800
        dwMaxBitRate                221184000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  3
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
        dwFrameInterval( 2)           1666665
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        4
        bNumFrameDescriptors                8
        guidFormat                            {20493859-0000-0010-8000-00aa00389b71}
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
        bVariableSize                     0
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            424
        wHeight                           240
        dwMinBitRate                  9768960
        dwMaxBitRate                146534400
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    848
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            480
        wHeight                           270
        dwMinBitRate                 12441600
        dwMaxBitRate                186624000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    960
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 22118400
        dwMaxBitRate                331776000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 29491200
        dwMaxBitRate                442368000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           100
        dwMinBitRate                135680000
        dwMaxBitRate                407040000
        dwDefaultFrameInterval          33333
        bFrameIntervalType                  2
        dwBytesPerLine                   1696
        dwFrameInterval( 0)             33333
        dwFrameInterval( 1)            100000
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           480
        dwMinBitRate                 39075840
        dwMaxBitRate                586137600
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1696
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 88473600
        dwMaxBitRate                442368000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  3
        dwBytesPerLine                   2560
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
        dwFrameInterval( 2)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           800
        dwMinBitRate                245760000
        dwMaxBitRate                491520000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwBytesPerLine                   2560
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        5
        bNumFrameDescriptors                2
        guidFormat                            {49323159-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                      24
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
        bVariableSize                     0
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           400
        dwMinBitRate                 92160000
        dwMaxBitRate                153600000
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwBytesPerLine                   1920
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            666666
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           800
        dwMinBitRate                368640000
        dwMaxBitRate                614400000
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwBytesPerLine                   3840
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            666666
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
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
        bMaxBurst              15
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x0032
  bNumDeviceCaps          3
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
    bU1DevExitLat          10 micro seconds
    bU2DevExitLat        2047 micro seconds
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x00000006
      BESL Link Power Management (LPM) Supported
  Platform Device Capability:
    bLength                28
    bDescriptorType        16
    bDevCapabilityType      5
    bReserved               0
    PlatformCapabilityUUID    {d8dd60df-4589-4cc7-9cd2-659d9e648a9f}
    CapabilityData[0]    0x00
    CapabilityData[1]    0x00
    CapabilityData[2]    0x03
    CapabilityData[3]    0x06
    CapabilityData[4]    0x44
    CapabilityData[5]    0x02
    CapabilityData[6]    0x20
    CapabilityData[7]    0x00
Device Status:     0x0000
  (Bus Powered)

Bus 002 Device 004: ID 8086:1156 Intel Corp. Intel(R) RealSense(TM) Depth Camera 436 
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.20
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0         9
  idVendor           0x8086 Intel Corp.
  idProduct          0x1156 
  bcdDevice           51.10
  iManufacturer           1 Intel(R) RealSense(TM) Depth Camera 436 
  iProduct                2 Intel(R) RealSense(TM) Depth Camera 436 
  iSerial                 3 345523060654
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0bac
    bNumInterfaces          7
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              720mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         3
      bFunctionClass         14 Video
      bFunctionSubClass       3 Video Interface Collection
      bFunctionProtocol       0 
      iFunction               5 Intel(R) RealSense(TM) Depth Camera 436  Depth
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      1 Video Control
      bInterfaceProtocol      0 
      iInterface              5 Intel(R) RealSense(TM) Depth Camera 436  Depth
      VideoControl Interface Descriptor:
        bLength                14
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdUVC               1.50
        wTotalLength       0x005b
        dwClockFrequency       48.000000MHz
        bInCollection           2
        baInterfaceNr( 0)       1
        baInterfaceNr( 1)       2
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
        bmControls           0x00200000
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      5 (PROCESSING_UNIT)
        bUnitID                 2
        bSourceID               1
        wMaxMultiplier      16384
        bControlSize            3
        bmControls     0x00000200
          Gain
        iProcessing             0 
        bmVideoStandards     0x00
      VideoControl Interface Descriptor:
        bLength                28
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 3
        guidExtensionCode         {c9606ccb-594c-4d25-af47-ccc496435995}
        bNumControls           17
        bNrInPins               1
        baSourceID( 0)          2
        bControlSize            3
        bmControls( 0)       0xff
        bmControls( 1)       0xdd
        bmControls( 2)       0x01
        iExtension              6 Intel(R) RealSense(TM) Depth Camera 436  RGB
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
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             5
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               3
        iTerminal               0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x87  EP 7 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               6
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
      iInterface              5 Intel(R) RealSense(TM) Depth Camera 436  Depth
      VideoStreaming Interface Descriptor:
        bLength                            15
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         2
        wTotalLength                   0x02f3
        bEndpointAddress                 0x82  EP 2 IN
        bmInfo                              0
        bTerminalLink                       4
        bStillCaptureMethod                 0
        bTriggerSupport                     0
        bTriggerUsage                       0
        bControlSize                        1
        bmaControls( 0)                     0
        bmaControls( 1)                     0
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        1
        bNumFrameDescriptors                8
        guidFormat                            {2036315a-0000-0010-8000-00aa00389b71}
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
        bVariableSize                     0
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            256
        wHeight                           144
        dwMinBitRate                 53084160
        dwMaxBitRate                176947200
        dwDefaultFrameInterval          33333
        bFrameIntervalType                  2
        dwBytesPerLine                    512
        dwFrameInterval( 0)             33333
        dwFrameInterval( 1)            111111
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            424
        wHeight                           240
        dwMinBitRate                  9768960
        dwMaxBitRate                146534400
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    848
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            480
        wHeight                           270
        dwMinBitRate                 12441600
        dwMaxBitRate                186624000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    960
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 22118400
        dwMaxBitRate                331776000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 29491200
        dwMaxBitRate                442368000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           100
        dwMinBitRate                135680000
        dwMaxBitRate                407040000
        dwDefaultFrameInterval          33333
        bFrameIntervalType                  2
        dwBytesPerLine                   1696
        dwFrameInterval( 0)             33333
        dwFrameInterval( 1)            100000
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           480
        dwMinBitRate                 39075840
        dwMaxBitRate                586137600
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1696
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 88473600
        dwMaxBitRate                442368000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  3
        dwBytesPerLine                   2560
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
        dwFrameInterval( 2)           1666665
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        2
        bNumFrameDescriptors                8
        guidFormat                            {00000050-0000-0010-8000-00aa00389b71}
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
        bVariableSize                     0
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            256
        wHeight                           144
        dwMinBitRate                 53084160
        dwMaxBitRate                176947200
        dwDefaultFrameInterval          33333
        bFrameIntervalType                  2
        dwBytesPerLine                    512
        dwFrameInterval( 0)             33333
        dwFrameInterval( 1)            111111
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            424
        wHeight                           240
        dwMinBitRate                  9768960
        dwMaxBitRate                146534400
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    848
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            480
        wHeight                           270
        dwMinBitRate                 12441600
        dwMaxBitRate                186624000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    960
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 22118400
        dwMaxBitRate                331776000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 29491200
        dwMaxBitRate                442368000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           100
        dwMinBitRate                135680000
        dwMaxBitRate                407040000
        dwDefaultFrameInterval          33333
        bFrameIntervalType                  2
        dwBytesPerLine                   1696
        dwFrameInterval( 0)             33333
        dwFrameInterval( 1)            100000
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           480
        dwMinBitRate                 39075840
        dwMaxBitRate                586137600
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1696
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 88473600
        dwMaxBitRate                442368000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  3
        dwBytesPerLine                   2560
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
        dwFrameInterval( 2)           1666665
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              8 Intel(R) RealSense(TM) Depth Camera 436  Y
      VideoStreaming Interface Descriptor:
        bLength                            18
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         5
        wTotalLength                   0x05b8
        bEndpointAddress                 0x83  EP 3 IN
        bmInfo                              0
        bTerminalLink                       5
        bStillCaptureMethod                 0
        bTriggerSupport                     0
        bTriggerUsage                       0
        bControlSize                        1
        bmaControls( 0)                     0
        bmaControls( 1)                     0
        bmaControls( 2)                     0
        bmaControls( 3)                     0
        bmaControls( 4)                     0
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        1
        bNumFrameDescriptors                7
        guidFormat                            {00000032-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                       8
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
        bVariableSize                     0
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            424
        wHeight                           240
        dwMinBitRate                  4884480
        dwMaxBitRate                 73267200
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    424
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            480
        wHeight                           270
        dwMinBitRate                  6220800
        dwMaxBitRate                 93312000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    480
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 11059200
        dwMaxBitRate                165888000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    640
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 14745600
        dwMaxBitRate                221184000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    640
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           100
        dwMinBitRate                 67840000
        dwMaxBitRate                203520000
        dwDefaultFrameInterval          33333
        bFrameIntervalType                  2
        dwBytesPerLine                    848
        dwFrameInterval( 0)             33333
        dwFrameInterval( 1)            100000
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           480
        dwMinBitRate                 19537920
        dwMaxBitRate                293068800
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    848
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 44236800
        dwMaxBitRate                221184000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  3
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
        dwFrameInterval( 2)           1666665
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        2
        bNumFrameDescriptors                7
        guidFormat                            {59565955-0000-0010-8000-00aa00389b71}
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
        bVariableSize                     0
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            424
        wHeight                           240
        dwMinBitRate                  9768960
        dwMaxBitRate                146534400
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    848
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            480
        wHeight                           270
        dwMinBitRate                 12441600
        dwMaxBitRate                186624000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    960
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 22118400
        dwMaxBitRate                331776000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 29491200
        dwMaxBitRate                442368000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           100
        dwMinBitRate                135680000
        dwMaxBitRate                407040000
        dwDefaultFrameInterval          33333
        bFrameIntervalType                  2
        dwBytesPerLine                   1696
        dwFrameInterval( 0)             33333
        dwFrameInterval( 1)            100000
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           480
        dwMinBitRate                 39075840
        dwMaxBitRate                586137600
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1696
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 88473600
        dwMaxBitRate                442368000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  3
        dwBytesPerLine                   2560
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
        dwFrameInterval( 2)           1666665
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        3
        bNumFrameDescriptors                7
        guidFormat                            {20203859-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                       8
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
        bVariableSize                     0
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            424
        wHeight                           240
        dwMinBitRate                  4884480
        dwMaxBitRate                 73267200
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    424
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            480
        wHeight                           270
        dwMinBitRate                  6220800
        dwMaxBitRate                 93312000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    480
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 11059200
        dwMaxBitRate                165888000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    640
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 14745600
        dwMaxBitRate                221184000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    640
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           100
        dwMinBitRate                 67840000
        dwMaxBitRate                203520000
        dwDefaultFrameInterval          33333
        bFrameIntervalType                  2
        dwBytesPerLine                    848
        dwFrameInterval( 0)             33333
        dwFrameInterval( 1)            100000
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           480
        dwMinBitRate                 19537920
        dwMaxBitRate                293068800
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    848
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 44236800
        dwMaxBitRate                221184000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  3
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
        dwFrameInterval( 2)           1666665
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        4
        bNumFrameDescriptors                8
        guidFormat                            {20493859-0000-0010-8000-00aa00389b71}
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
        bVariableSize                     0
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            424
        wHeight                           240
        dwMinBitRate                  9768960
        dwMaxBitRate                146534400
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    848
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            480
        wHeight                           270
        dwMinBitRate                 12441600
        dwMaxBitRate                186624000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    960
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 22118400
        dwMaxBitRate                331776000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 29491200
        dwMaxBitRate                442368000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           100
        dwMinBitRate                135680000
        dwMaxBitRate                407040000
        dwDefaultFrameInterval          33333
        bFrameIntervalType                  2
        dwBytesPerLine                   1696
        dwFrameInterval( 0)             33333
        dwFrameInterval( 1)            100000
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           480
        dwMinBitRate                 39075840
        dwMaxBitRate                586137600
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1696
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 88473600
        dwMaxBitRate                442368000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  3
        dwBytesPerLine                   2560
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
        dwFrameInterval( 2)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           800
        dwMinBitRate                245760000
        dwMaxBitRate                491520000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwBytesPerLine                   2560
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        5
        bNumFrameDescriptors                1
        guidFormat                            {49323159-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                      24
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
        bVariableSize                     0
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           800
        dwMinBitRate                368640000
        dwMaxBitRate                614400000
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwBytesPerLine                   3840
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            666666
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         3
      bInterfaceCount         2
      bFunctionClass         14 Video
      bFunctionSubClass       3 Video Interface Collection
      bFunctionProtocol       0 
      iFunction               6 Intel(R) RealSense(TM) Depth Camera 436  RGB
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass        14 Video
      bInterfaceSubClass      1 Video Control
      bInterfaceProtocol      0 
      iInterface              6 Intel(R) RealSense(TM) Depth Camera 436  RGB
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdUVC               1.50
        wTotalLength       0x0051
        dwClockFrequency       48.000000MHz
        bInCollection           1
        baInterfaceNr( 0)       4
      VideoControl Interface Descriptor:
        bLength                18
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             6
        wTerminalType      0x0201 Camera Sensor
        bAssocTerminal          0
        iTerminal               0 
        wObjectiveFocalLengthMin      0
        wObjectiveFocalLengthMax      0
        wOcularFocalLength            0
        bControlSize                  3
        bmControls           0x0000000e
          Auto-Exposure Mode
          Auto-Exposure Priority
          Exposure Time (Absolute)
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      5 (PROCESSING_UNIT)
        bUnitID                 7
        bSourceID               6
        wMaxMultiplier      16384
        bControlSize            3
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
        bLength                28
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 8
        guidExtensionCode         {b8ec416e-a3ac-4580-8d5c-0bee1597e43d}
        bNumControls            2
        bNrInPins               1
        baSourceID( 0)          7
        bControlSize            3
        bmControls( 0)       0x03
        bmControls( 1)       0x00
        bmControls( 2)       0x00
        iExtension              0 
      VideoControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             9
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               7
        iTerminal               0 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        4
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              6 Intel(R) RealSense(TM) Depth Camera 436  RGB
      VideoStreaming Interface Descriptor:
        bLength                            15
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         2
        wTotalLength                   0x018f
        bEndpointAddress                 0x84  EP 4 IN
        bmInfo                              0
        bTerminalLink                       9
        bStillCaptureMethod                 0
        bTriggerSupport                     0
        bTriggerUsage                       0
        bControlSize                        1
        bmaControls( 0)                     0
        bmaControls( 1)                     0
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        1
        bNumFrameDescriptors                7
        guidFormat                            {32595559-0000-0010-8000-00aa00389b71}
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
        bVariableSize                     0
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            424
        wHeight                           240
        dwMinBitRate                  9768960
        dwMaxBitRate                 97689600
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  4
        dwBytesPerLine                    848
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            480
        wHeight                           270
        dwMinBitRate                 12441600
        dwMaxBitRate                124416000
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  4
        dwBytesPerLine                    960
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 22118400
        dwMaxBitRate                221184000
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  4
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 29491200
        dwMaxBitRate                294912000
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  4
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           480
        dwMinBitRate                 39075840
        dwMaxBitRate                390758400
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  4
        dwBytesPerLine                   1696
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 88473600
        dwMaxBitRate                442368000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  3
        dwBytesPerLine                   2560
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
        dwFrameInterval( 2)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           800
        dwMinBitRate                 98304000
        dwMaxBitRate                491520000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  3
        dwBytesPerLine                   2560
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
        dwFrameInterval( 2)           1666665
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        2
        bNumFrameDescriptors                1
        guidFormat                            {36315752-1a66-a242-9065-d01814a8ef8a}
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
        bVariableSize                     0
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           800
        dwMinBitRate                491520000
        dwMaxBitRate                491520000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwBytesPerLine                   2560
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        5
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      0 
      bInterfaceProtocol      0 
      iInterface              9 Intel(R) RealSense(TM) HID
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.10
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength    1000
         Report Descriptors: 
           ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x86  EP 6 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               2
        bMaxBurst               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        6
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
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
        bMaxBurst              15
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x0032
  bNumDeviceCaps          3
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
    bU1DevExitLat          10 micro seconds
    bU2DevExitLat        2047 micro seconds
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x00000006
      BESL Link Power Management (LPM) Supported
  Platform Device Capability:
    bLength                28
    bDescriptorType        16
    bDevCapabilityType      5
    bReserved               0
    PlatformCapabilityUUID    {d8dd60df-4589-4cc7-9cd2-659d9e648a9f}
    CapabilityData[0]    0x00
    CapabilityData[1]    0x00
    CapabilityData[2]    0x03
    CapabilityData[3]    0x06
    CapabilityData[4]    0x44
    CapabilityData[5]    0x02
    CapabilityData[6]    0x20
    CapabilityData[7]    0x00
Device Status:     0x0000
  (Bus Powered)

 drivers/media/usb/uvc/uvc_driver.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index fb6afb8e84f0..e4e9d156ce34 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -3223,6 +3223,33 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
+	/* Intel D555 Depth Camera */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x8086,
+	  .idProduct		= 0x0b56,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_15,
+	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
+	/* Intel D421 Depth Module */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x8086,
+	  .idProduct		= 0x1155,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_UNDEFINED,
+	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
+	/* Intel D436 Camera */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x8086,
+	  .idProduct		= 0x1156,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_15,
+	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
 	/* Generic USB Video Class */
 	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_UNDEFINED) },
 	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_15) },
-- 
2.43.0


