Return-Path: <linux-media+bounces-29910-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7104EA84032
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 12:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D83C9E44C4
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 10:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A53E26E151;
	Thu, 10 Apr 2025 10:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="czqOtPAd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895B626B0AB
	for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 10:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279393; cv=none; b=FGnXZnIhBSTKEkX9xRP1TtW+uegE8y6v7I4NVFi1SJs7OI56OhEPGh4pciYVATuXz1/ZuHqZlvqUP/JY5uLjOfOEkyXUNdJPSEWh0GLl8iv4IXxmEZabBuwmjW0dDmq8yqQMmHgtlbPBhthbgw2nTXPJ5QJtqhDGEFhxDmPHYe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279393; c=relaxed/simple;
	bh=gTsgc+Ph18FbKu9Wj1raKMn5BPobWjsjsr4sPt1e5wI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=It4Qf3bjxQvAGcP96sdZ9OXKZy1CMVEFiLg5GWjhLcdyu/jrnOH2eMGwXp/Zr59j+t7guw3urdupsjVHZIPOhBKeGIgLqXR67iK8rDmNISEnMXCnQmArY5qV8enk8h27ORdZ5PzpmVGDOe+2W+IrLuCmk4jT8MdWdcqimVjwLUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=czqOtPAd; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30bfc8faef9so5741151fa.1
        for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 03:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744279387; x=1744884187; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DitDOoXNurnUlKNLyUEr5AP/j6OhRSV+p02e35yZUxU=;
        b=czqOtPAdU5rAM8HQdYZoBPnoNziFoEDewMXQZJXp7DK3+ndtAdxGPktwRxC53fpq1Z
         u+CZPkhKA6waWJtbaLKEMP7Ml5u7NoAqVt67N/T502U8Eb41j6rC3EmSycUb0+7smEul
         NFgtoXOtUFmh+EK1Df+xLm1JC0pWOl+nb46YU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744279387; x=1744884187;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DitDOoXNurnUlKNLyUEr5AP/j6OhRSV+p02e35yZUxU=;
        b=gEjhzguJQEre5VvoZV26aLc2Ta1X3wynAAvfQckJX93XeH2XV2VT9A0M4xnWHEyYMz
         2xC4ujFjLOcGbLXphS3GkJKgMdGalQb6VvIpv+CfFEyM6ZVxbiiLy0sy9cxQYoO5/EkS
         xvpoqXSn4YS3KDaIDT8VuCVlRw48FfxWgqzc5L9JIb0JPZWJnM4b2KWkzCqMS4l3mTCS
         TnwTLPJTAPxeEtSdYVI03ASz/YK3b9ddWeJ0cMWYXS/hPxsaeVRLCE2/0daZmar4LN/x
         PiPXB+PkE/xcpudCnSBuGeNGmPG0VasjgPbpVY0vo1ejQl+EsT4hUIZczW8ZlWmUvi9T
         6T0w==
X-Forwarded-Encrypted: i=1; AJvYcCVEUXVCu5D7IKUVu6syc+6kx7sRqkM8EdnUhwux19MSTsE4BdYSrGxjVle6NnUv7iB3xFBfZnHKKIwV2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiHvE9jZ+pZLN2I4NSAkF/jZnn10CK8dmG4gEzNqxby9Q6QwWT
	8qYEZI/LW1QpsdQX3A7m2/5KInfZB2emZt8rhGclzfC8f93CpT2yzdPTqV2Q6myruB37P3W2yQ9
	LuA==
X-Gm-Gg: ASbGncuitAg6uoEkXwArvJHy9GcH0iOxIJtd0BhxiE8lf5cpa4CCq9wqeloFRiia273
	vQBjAACZ6Jz8T4m4NSRsZZuEB9oUdjYbPbq/UzA0Pw6BCWHYIWQsCAcLiJak1kjtZHCVBY5pTed
	KheUZB1+LcbWe2HFrOmH0XURNwMuFc1hkhm0ZyWxs79Zg4aHKZUSRbcum2b4x8igsgdeX8+kTbB
	IXm6kiheRulmQvtsduq3AlMditq5OxcxcGYUHnnOB2EGpj3+iBDuhs/0ECL/Mx941cR36cykkMq
	ZG/IigwCzv5SoiN6u6WcBHWHtNpnibpFKZ1NDnuIMwpF8pS6HL2cdoZqvoFGYtFzqLb7MV5+kjv
	cmWo=
X-Google-Smtp-Source: AGHT+IF88gkHQzvn1p/sc5/9e0eZpO5yqylyBRfbsLRpb44VlbIgmU6PHo7krzmpzpluN5Wr55WNjQ==
X-Received: by 2002:a05:651c:144b:b0:30b:ca48:1089 with SMTP id 38308e7fff4ca-30fa41a6aeemr7786961fa.2.1744279387309;
        Thu, 10 Apr 2025 03:03:07 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464cc461sm4215931fa.32.2025.04.10.03.03.05
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 03:03:05 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-549b159c84cso737939e87.3
        for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 03:03:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXcg+fChqVTgWYq4xoeNwAoaHMtjkbfDfSZBwEXIPYuDSn9WpNzjB/94vNOsJ+05R2j82D/5Ph/hjFozQ==@vger.kernel.org
X-Received: by 2002:a05:6512:1149:b0:545:8a1:5379 with SMTP id
 2adb3069b0e04-54cb687869bmr786722e87.43.1744279385026; Thu, 10 Apr 2025
 03:03:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324022120.216923-1-ccc194101@163.com> <20250410020715.GA15367@pendragon.ideasonboard.com>
 <CANiDSCuGT=Yw9QeBQmWwa5hk6DULhwd557t-=HRQN+nPQq5b0w@mail.gmail.com> <20250410091437.GA24866@pendragon.ideasonboard.com>
In-Reply-To: <20250410091437.GA24866@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 10 Apr 2025 12:02:52 +0200
X-Gmail-Original-Message-ID: <CANiDSCsv3PEbsmrqZy7niiZczm_WmXt9qvqUVqwMS_WOJ2FvSQ@mail.gmail.com>
X-Gm-Features: ATxdqUG-RZUeX9LwTPIeZyiSd4f2kz4Kpu-sVsxs-Fn1fvhf5XnyZVw7i9WzQPo
Message-ID: <CANiDSCsv3PEbsmrqZy7niiZczm_WmXt9qvqUVqwMS_WOJ2FvSQ@mail.gmail.com>
Subject: Re: [PATCH v6] media: uvcvideo: Fix bandwidth issue for Alcor camera
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: chenchangcheng <ccc194101@163.com>, hdegoede@redhat.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chenchangcheng <chenchangcheng@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Apr 2025 at 11:15, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Apr 10, 2025 at 07:32:34AM +0200, Ricardo Ribalda wrote:
> > Hi Laurent
> >
> > On Thu, 10 Apr 2025 at 04:07, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > On Mon, Mar 24, 2025 at 10:21:20AM +0800, chenchangcheng wrote:
> > > > From: chenchangcheng <chenchangcheng@kylinos.cn>
> > > >
> > > > Some broken device return wrong dwMaxPayloadTransferSize fields,
> > > > as follows:
> > > > [  218.632537] [pid:20427,cpu6,guvcview,8]uvcvideo: Device requested 2752512 B/frame bandwidth.
> > > > [  218.632598] [pid:20427,cpu6,guvcview,9]uvcvideo: No fast enough alt setting for requested bandwidth.
> > > >
> > > > The maximum packet size of the device is 3 * 1024, according to the
> > > > logs above, the device needs to apply for a bandwidth of 0x2a0000.
> > > >
> > > > Bus 001 Device 008: ID 1b17:6684 Alcor Corp. Slave camera
> > > > Device Descriptor:
> > > >   bLength                18
> > > >   bDescriptorType         1
> > > >   bcdUSB               2.00
> > > >   bDeviceClass          239 Miscellaneous Device
> > > >   bDeviceSubClass         2
> > > >   bDeviceProtocol         1 Interface Association
> > > >   bMaxPacketSize0        64
> > > >   idVendor           0x1b17
> > > >   idProduct          0x6684
> > > >   bcdDevice            1.05
> > > >   iManufacturer           1 Alcor Corp.
> > > >   iProduct                2 Slave camera
> > > >   iSerial                 0
> > > >   bNumConfigurations      1
> > > >   Configuration Descriptor:
> > > >     bLength                 9
> > > >     bDescriptorType         2
> > > >     wTotalLength       0x02ad
> > > >     bNumInterfaces          2
> > > >     bConfigurationValue     1
> > > >     iConfiguration          0
> > > >     bmAttributes         0x80
> > > >       (Bus Powered)
> > > >     MaxPower              200mA
> > > >     Interface Association:
> > > >       bLength                 8
> > > >       bDescriptorType        11
> > > >       bFirstInterface         0
> > > >       bInterfaceCount         2
> > > >       bFunctionClass         14 Video
> > > >       bFunctionSubClass       3 Video Interface Collection
> > > >       bFunctionProtocol       0
> > > >       iFunction               4 Slave camera
> > > >     Interface Descriptor:
> > > >       bLength                 9
> > > >       bDescriptorType         4
> > > >       bInterfaceNumber        0
> > > >       bAlternateSetting       0
> > > >       bNumEndpoints           1
> > > >       bInterfaceClass        14 Video
> > > >       bInterfaceSubClass      1 Video Control
> > > >       bInterfaceProtocol      0
> > > >       iInterface              4 Slave camera
> > > >       VideoControl Interface Descriptor:
> > > >
> > > >       ....
> > > >
> > > >       Endpoint Descriptor:
> > > >         bLength                 7
> > > >         bDescriptorType         5
> > > >         bEndpointAddress     0x81  EP 1 IN
> > > >         bmAttributes            3
> > > >           Transfer Type            Interrupt
> > > >           Synch Type               None
> > > >           Usage Type               Data
> > > >         wMaxPacketSize     0x0010  1x 16 bytes
> > > >         bInterval               7
> > > >     Interface Descriptor:
> > > >       bLength                 9
> > > >       bDescriptorType         4
> > > >       bInterfaceNumber        1
> > > >       bAlternateSetting       0
> > > >       bNumEndpoints           0
> > > >       bInterfaceClass        14 Video
> > > >       bInterfaceSubClass      2 Video Streaming
> > > >       bInterfaceProtocol      0
> > > >       iInterface              0
> > > >       VideoStreaming Interface Descriptor:
> > > >         bLength                            14
> > > >         bDescriptorType                    36
> > > >         bDescriptorSubtype                  1 (INPUT_HEADER)
> > > >         bNumFormats                         1
> > > >         wTotalLength                   0x01ef
> > > >         bEndPointAddress                  130
> > > >         bmInfo                              0
> > > >         bTerminalLink                       3
> > > >         bStillCaptureMethod                 2
> > > >         bTriggerSupport                     1
> > > >         bTriggerUsage                       0
> > > >         bControlSize                        1
> > > >         bmaControls( 0)                     0
> > > >       VideoStreaming Interface Descriptor:
> > > >         bLength                            11
> > > >         bDescriptorType                    36
> > > >         bDescriptorSubtype                  6 (FORMAT_MJPEG)
> > > >         bFormatIndex                        1
> > > >         bNumFrameDescriptors                9
> > > >         bFlags                              1
> > > >           Fixed-size samples: Yes
> > > >         bDefaultFrameIndex                  1
> > > >         bAspectRatioX                       0
> > > >         bAspectRatioY                       0
> > > >         bmInterlaceFlags                 0x00
> > > >           Interlaced stream or variable: No
> > > >           Fields per frame: 1 fields
> > > >           Field 1 first: No
> > > >           Field pattern: Field 1 only
> > > >         bCopyProtect                        0
> > > >       VideoStreaming Interface Descriptor:
> > > >         bLength                            50
> > > >         bDescriptorType                    36
> > > >         bDescriptorSubtype                  7 (FRAME_MJPEG)
> > > >         bFrameIndex                         1
> > > >         bmCapabilities                   0x00
> > > >           Still image unsupported
> > > >         wWidth                           1920
> > > >         wHeight                          1080
> > > >         dwMinBitRate                248832000
> > > >         dwMaxBitRate                1492992000
> > > >         dwMaxVideoFrameBufferSize     6220800
> > > >         dwDefaultFrameInterval         333333
> > > >         bFrameIntervalType                  6
> > > >         dwFrameInterval( 0)            333333
> > > >         dwFrameInterval( 1)            400000
> > > >         dwFrameInterval( 2)            500000
> > > >         dwFrameInterval( 3)            666666
> > > >         dwFrameInterval( 4)           1000000
> > > >         dwFrameInterval( 5)           2000000
> > > >
> > > >       ......
> > > >
> > > >       VideoStreaming Interface Descriptor:
> > > >         bLength                            42
> > > >         bDescriptorType                    36
> > > >         bDescriptorSubtype                  3 (STILL_IMAGE_FRAME)
> > > >         bEndpointAddress                    0
> > > >         bNumImageSizePatterns               9
> > > >         wWidth( 0)                       1920
> > > >         wHeight( 0)                      1080
> > > >         wWidth( 1)                       2048
> > > >         wHeight( 1)                      1536
> > > >         wWidth( 2)                       1280
> > > >         wHeight( 2)                       720
> > > >         wWidth( 3)                       2592
> > > >         wHeight( 3)                      1944
> > > >         wWidth( 4)                       1280
> > > >         wHeight( 4)                      1024
> > > >         wWidth( 5)                       1280
> > > >         wHeight( 5)                       960
> > > >         wWidth( 6)                       1600
> > > >         wHeight( 6)                      1200
> > > >         wWidth( 7)                        800
> > > >         wHeight( 7)                       600
> > > >         wWidth( 8)                        640
> > > >         wHeight( 8)                       480
> > > >         bNumCompressionPatterns             0
> > > >       VideoStreaming Interface Descriptor:
> > > >         bLength                             6
> > > >         bDescriptorType                    36
> > > >         bDescriptorSubtype                 13 (COLORFORMAT)
> > > >         bColorPrimaries                     1 (BT.709,sRGB)
> > > >         bTransferCharacteristics            1 (BT.709)
> > > >         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
> > > >     Interface Descriptor:
> > > >       bLength                 9
> > > >       bDescriptorType         4
> > > >       bInterfaceNumber        1
> > > >       bAlternateSetting       1
> > > >       bNumEndpoints           1
> > > >       bInterfaceClass        14 Video
> > > >       bInterfaceSubClass      2 Video Streaming
> > > >       bInterfaceProtocol      0
> > > >       iInterface              0
> > > >       Endpoint Descriptor:
> > > >         bLength                 7
> > > >         bDescriptorType         5
> > > >         bEndpointAddress     0x82  EP 2 IN
> > > >         bmAttributes            5
> > > >           Transfer Type            Isochronous
> > > >           Synch Type               Asynchronous
> > > >           Usage Type               Data
> > > >         wMaxPacketSize     0x1400  3x 1024 bytes
> > > >         bInterval               1
> > > >     Interface Descriptor:
> > > >       bLength                 9
> > > >       bDescriptorType         4
> > > >       bInterfaceNumber        1
> > > >       bAlternateSetting       2
> > > >       bNumEndpoints           1
> > > >       bInterfaceClass        14 Video
> > > >       bInterfaceSubClass      2 Video Streaming
> > > >       bInterfaceProtocol      0
> > > >       iInterface              0
> > > >       Endpoint Descriptor:
> > > >         bLength                 7
> > > >         bDescriptorType         5
> > > >         bEndpointAddress     0x82  EP 2 IN
> > > >         bmAttributes            5
> > > >           Transfer Type            Isochronous
> > > >           Synch Type               Asynchronous
> > > >           Usage Type               Data
> > > >         wMaxPacketSize     0x0b84  2x 900 bytes
> > > >         bInterval               1
> > > >     Interface Descriptor:
> > > >       bLength                 9
> > > >       bDescriptorType         4
> > > >       bInterfaceNumber        1
> > > >       bAlternateSetting       3
> > > >       bNumEndpoints           1
> > > >       bInterfaceClass        14 Video
> > > >       bInterfaceSubClass      2 Video Streaming
> > > >       bInterfaceProtocol      0
> > > >       iInterface              0
> > > >       Endpoint Descriptor:
> > > >         bLength                 7
> > > >         bDescriptorType         5
> > > >         bEndpointAddress     0x82  EP 2 IN
> > > >         bmAttributes            5
> > > >           Transfer Type            Isochronous
> > > >           Synch Type               Asynchronous
> > > >           Usage Type               Data
> > > >         wMaxPacketSize     0x0c00  2x 1024 bytes
> > > >         bInterval               1
> > > >     Interface Descriptor:
> > > >       bLength                 9
> > > >       bDescriptorType         4
> > > >       bInterfaceNumber        1
> > > >       bAlternateSetting       4
> > > >       bNumEndpoints           1
> > > >       bInterfaceClass        14 Video
> > > >       bInterfaceSubClass      2 Video Streaming
> > > >       bInterfaceProtocol      0
> > > >       iInterface              0
> > > >       Endpoint Descriptor:
> > > >         bLength                 7
> > > >         bDescriptorType         5
> > > >         bEndpointAddress     0x82  EP 2 IN
> > > >         bmAttributes            5
> > > >           Transfer Type            Isochronous
> > > >           Synch Type               Asynchronous
> > > >           Usage Type               Data
> > > >         wMaxPacketSize     0x0c00  2x 1024 bytes
> > > >         bInterval               1
> > > > Device Qualifier (for other device speed):
> > > >   bLength                10
> > > >   bDescriptorType         6
> > > >   bcdUSB               2.00
> > > >   bDeviceClass          239 Miscellaneous Device
> > > >   bDeviceSubClass         2
> > > >   bDeviceProtocol         1 Interface Association
> > > >   bMaxPacketSize0        64
> > > >   bNumConfigurations      1
> > > > Device Status:     0x0000
> > > >   (Bus Powered)
> > > >
> > > > Signed-off-by: chenchangcheng <chenchangcheng@kylinos.cn>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_driver.c |  9 +++++++++
> > > >  drivers/media/usb/uvc/uvc_video.c  | 10 ++++++++++
> > > >  drivers/media/usb/uvc/uvcvideo.h   |  1 +
> > > >  3 files changed, 20 insertions(+)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > > index deadbcea5e22..9b1dedf9773b 100644
> > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > @@ -3023,6 +3023,15 @@ static const struct usb_device_id uvc_ids[] = {
> > > >         .bInterfaceSubClass   = 1,
> > > >         .bInterfaceProtocol   = 0,
> > > >         .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_STATUS_INTERVAL) },
> > > > +     /* Alcor Corp. Slave camera */
> > > > +     { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > > > +                             | USB_DEVICE_ID_MATCH_INT_INFO,
> > > > +       .idVendor             = 0x1b17,
> > > > +       .idProduct            = 0x6684,
> > > > +       .bInterfaceClass      = USB_CLASS_VIDEO,
> > > > +       .bInterfaceSubClass   = 1,
> > > > +       .bInterfaceProtocol   = 0,
> > > > +       .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_OVERFLOW_BANDWIDTH) },
> > > >       /* MSI StarCam 370i */
> > > >       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > > >                               | USB_DEVICE_ID_MATCH_INT_INFO,
> > > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > > > index e3567aeb0007..56f23c363870 100644
> > > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > > @@ -262,6 +262,16 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
> > > >
> > > >               ctrl->dwMaxPayloadTransferSize = bandwidth;
> > > >       }
> > > > +
> > > > +     if (stream->intf->num_altsetting > 1 &&
> > > > +         ctrl->dwMaxPayloadTransferSize > stream->maxpsize &&
> > > > +         stream->dev->quirks & UVC_QUIRK_OVERFLOW_BANDWIDTH) {
> > > > +             dev_warn(&stream->intf->dev,
> > > > +                      "the max payload transmission size (%d) exceededs the size of the ep max packet (%d). Using the max size.\n",
> > > > +                      ctrl->dwMaxPayloadTransferSize,
> > > > +                      stream->maxpsize);
> > > > +             ctrl->dwMaxPayloadTransferSize = stream->maxpsize;
> > >
> > > If the requested bandwidth exceed the maximum the device can use, it's
> > > clearly a firmware bug. Why do we need a quirk for this, can't we use
> > > the maximum usable bandwidth in that case, regardless of the particular
> > > device ?
> >
> > Wouldn't that break devices with invalid max_bpi (maxp, maxp_mult,
> > wBytesPerInterval)?
>
> I meant the maximum theoretical bandwidth available to the device,
> corresponding to the maximum max_bpi value for the current speed. In
> this case the device is requesting 2752512 B/frame.

I would not count on devices providing different USB descriptors based
on the current_speed.
Or if they provide different USB descriptors, they might not have
tested them properly.

So I would be very careful about not breaking current devices. and the
quirk is great for that.

But yeah 0x2A0000 is *pretty* big.. USB3 only has 2 bytes for BytesPerInterval

What about?:

#define MAX_BPI_SIXE 0xffff // BytesPerInterval can only hold 2 bytes
if (stream->intf->num_altsetting > 1 && ctrl->dwMaxPayloadTransferSize
> MAX_BPI_SIZE) {
 dev_warn_ratelimit(&stream->intf->dev, "UVC non compliance:  the max
payload ....");
 ctrl->dwMaxPayloadTransferSize = stream->maxpsize;
}


+       if (stream->intf->num_altsetting > 1 &&
+           ctrl->dwMaxPayloadTransferSize > stream->maxpsize &&
+           stream->dev->quirks & UVC_QUIRK_OVERFLOW_BANDWIDTH) {
+               dev_warn(&stream->intf->dev,
+                        "the max payload transmission size (%d)
exceededs the size of the ep max packet (%d). Using the max size.\n",
+                        ctrl->dwMaxPayloadTransferSize,
+                        stream->maxpsize);
+               ctrl->dwMaxPayloadTransferSize = stream->maxpsize;
+       }


>
> > I think the approach taken by this patch is the most conservative one.
> > If we get a good number of devices using this quirk we can implement
> > an heuristic using the info from multiple descriptors.
> >
> > > > +     }
> > > >  }
> > > >
> > > >  static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
> > > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > > index 5e388f05f3fc..8b43d725c259 100644
> > > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > > @@ -77,6 +77,7 @@
> > > >  #define UVC_QUIRK_DISABLE_AUTOSUSPEND        0x00008000
> > > >  #define UVC_QUIRK_INVALID_DEVICE_SOF 0x00010000
> > > >  #define UVC_QUIRK_MJPEG_NO_EOF               0x00020000
> > > > +#define UVC_QUIRK_OVERFLOW_BANDWIDTH 0x00040000
> > > >
> > > >  /* Format flags */
> > > >  #define UVC_FMT_FLAG_COMPRESSED              0x00000001
> > > >
> > > > base-commit: 4701f33a10702d5fc577c32434eb62adde0a1ae1
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

