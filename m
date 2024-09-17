Return-Path: <linux-media+bounces-18354-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C7797B56D
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 23:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C322F1C22EE1
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 21:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 938A51917E0;
	Tue, 17 Sep 2024 21:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cowlark.com header.i=@cowlark.com header.b="Awd/zEiB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.mythic-beasts.com (mx1.mythic-beasts.com [46.235.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D63185B52
	for <linux-media@vger.kernel.org>; Tue, 17 Sep 2024 21:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726610309; cv=none; b=FoVhJHjt7f5xK4BcADEt65wPYFTraxUpve0qNyfO4fNFeVl3ufpmIQmv+1YWRIShGS/o7zDqtyLl6ThbL+aBDUAcnrCcEEY70XsB28RYP1Yt5XX0hXVcmcocyNym2ErCadQvuVc88P34gvZ51gBgHKNbF/+RBaQRHedrbecTWqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726610309; c=relaxed/simple;
	bh=BiBAJ4wMEvGrRVN2YUKbWzUr2lHS5l2xN5JpPijYqbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tjZDqlJPDBX9yh5zKFh09QQS5ChzWGpvsPJmMv0zE7M5B3DRbpZ5h6JvmBZDNI0uroIP7wtKf8WJsIj1zJPHGla1IKrq2+yjxq8wR84EWH/H0MiWSB0QUdvGwegn1bX4+corEXczPUoU7lQVB59BS67IdzG8XSWt0VYKL7FOJWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cowlark.com; spf=pass smtp.mailfrom=cowlark.com; dkim=pass (2048-bit key) header.d=cowlark.com header.i=@cowlark.com header.b=Awd/zEiB; arc=none smtp.client-ip=46.235.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cowlark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cowlark.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cowlark.com
	; s=mythic-beasts-k1; h=To:Subject:Date:From;
	bh=SO14VsqeMc8ffHHDGI8pD8zl4Zf8D4eOpAsLeW4YKNk=; b=Awd/zEiBZpfLHZIKOjuznVfVfZ
	bp0ea87ObHrISj46BIRbTTp7TeoGOq9U7Gz60lyO9kEIbMUIg0r1hz2dYwRLY5PKzaKc8+D0G6wbh
	Ng6tTFQaI6GbcYkTyrK46Jqm8QiiHgTM5Gg+cXS9ODRpc850IAUI/yhBkC5AASmwblZCQmEUXFEPq
	OWhtu/y+v+szK34bG1XkwPIQc+IL9USH6OFL49NGrQoCTeeARUKiucZ64Le2Hcit0rRLUqWNFId1J
	UWhnDiKcYu9USvX3jYGQG+sYiL1OuAdy1UsfCjJqAsptaPq9fbpZAdgvNLNPjCglv8hyY+iOxOGpZ
	JgDeZ/xQ==;
Received: by mailhub-cam-d.mythic-beasts.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dg@cowlark.com>)
	id 1sqgDB-008bfo-VK
	for linux-media@vger.kernel.org; Tue, 17 Sep 2024 22:58:18 +0100
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2d8815ef6d2so5122344a91.0
        for <linux-media@vger.kernel.org>; Tue, 17 Sep 2024 14:58:16 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw+7Rhv0mUNE3VnJtiZSeOuGg0m0mhwxhgznJzlX5mhm/HuF/rX
	lnkaHmri8NIgc94W9tjjHFwqTdWuFXir51xJ1owrQ/l+mJNQUsMj8bBJFkAQNbyyjFMc6iR7TOw
	T2vh/PZ+AQLF0w22TaHWifG7OKd8=
X-Google-Smtp-Source: AGHT+IEccZd+h2WCcSLGyoaTeLHq3d7ZUpGbYApQzwx25wjTaq/JJa1BLNU9FqZocsRgb4i0QydSkbDxXp0fprcHtj8=
X-Received: by 2002:a17:90a:5d17:b0:2d8:83ce:d4c0 with SMTP id
 98e67ed59e1d1-2db9ffcc174mr25382893a91.13.1726610294861; Tue, 17 Sep 2024
 14:58:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240916191405.27373-2-dg@cowlark.com> <CANiDSCtnUrmgM5ED70rt5ogCwEYNbxc82=MNEd0O46Fukx=dZg@mail.gmail.com>
In-Reply-To: <CANiDSCtnUrmgM5ED70rt5ogCwEYNbxc82=MNEd0O46Fukx=dZg@mail.gmail.com>
From: David Given <dg@cowlark.com>
Date: Tue, 17 Sep 2024 23:58:03 +0200
X-Gmail-Original-Message-ID: <CALgV52gJ=suypHvMwRELftuBB8DviwDjLz3-iK5Q0oHAukZf0g@mail.gmail.com>
Message-ID: <CALgV52gJ=suypHvMwRELftuBB8DviwDjLz3-iK5Q0oHAukZf0g@mail.gmail.com>
Subject: Re: [PATCH 1/2] Add support for the D3DFMT_R5G6B5 pixmap type.
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
X-BlackCat-Spam-Score: 0

Done, I hope.

On Tue, 17 Sept 2024 at 08:46, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi David
>
> Could you take a look at the errors reported by the CI?
>
> https://patchwork.linuxtv.org/project/linux-media/patch/20240916191405.27373-2-dg@cowlark.com/
>
> A small nit: is that I think the lsusb output belongs to your second patch...
>
> Thanks!
>
> On Mon, 16 Sept 2024 at 21:19, David Given <dg@cowlark.com> wrote:
> >
> > This media format is used by the NXP Semiconductors 1fc9:009b chipset,
> > used by the Kaiweets KTI-W02 infrared camera.
> >
> > lsusb for the device reports:
> >
> > Bus 003 Device 011: ID 1fc9:009b NXP Semiconductors IR VIDEO
> > Device Descriptor:
> >   bLength                18
> >   bDescriptorType         1
> >   bcdUSB               2.00
> >   bDeviceClass          239 Miscellaneous Device
> >   bDeviceSubClass         2 [unknown]
> >   bDeviceProtocol         1 Interface Association
> >   bMaxPacketSize0        64
> >   idVendor           0x1fc9 NXP Semiconductors
> >   idProduct          0x009b IR VIDEO
> >   bcdDevice            1.01
> >   iManufacturer           1 Guide sensmart
> >   iProduct                2 IR VIDEO
> >   iSerial                 0
> >   bNumConfigurations      1
> >   Configuration Descriptor:
> >     bLength                 9
> >     bDescriptorType         2
> >     wTotalLength       0x00c2
> >     bNumInterfaces          2
> >     bConfigurationValue     1
> >     iConfiguration          0
> >     bmAttributes         0xc0
> >       Self Powered
> >     MaxPower              100mA
> >     Interface Association:
> >       bLength                 8
> >       bDescriptorType        11
> >       bFirstInterface         0
> >       bInterfaceCount         2
> >       bFunctionClass         14 Video
> >       bFunctionSubClass       3 Video Interface Collection
> >       bFunctionProtocol       0
> >       iFunction               3 IR Camera
> >     Interface Descriptor:
> >       bLength                 9
> >       bDescriptorType         4
> >       bInterfaceNumber        0
> >       bAlternateSetting       0
> >       bNumEndpoints           1
> >       bInterfaceClass        14 Video
> >       bInterfaceSubClass      1 Video Control
> >       bInterfaceProtocol      0
> >       iInterface              0
> >       VideoControl Interface Descriptor:
> >         bLength                13
> >         bDescriptorType        36
> >         bDescriptorSubtype      1 (HEADER)
> >         bcdUVC               1.00
> >         wTotalLength       0x0033
> >         dwClockFrequency        6.000000MHz
> >         bInCollection           1
> >         baInterfaceNr( 0)       1
> >       VideoControl Interface Descriptor:
> >         bLength                18
> >         bDescriptorType        36
> >         bDescriptorSubtype      2 (INPUT_TERMINAL)
> >         bTerminalID             1
> >         wTerminalType      0x0201 Camera Sensor
> >         bAssocTerminal          0
> >         iTerminal               0
> >         wObjectiveFocalLengthMin      0
> >         wObjectiveFocalLengthMax      0
> >         wOcularFocalLength            0
> >         bControlSize                  3
> >         bmControls           0x00000000
> >       VideoControl Interface Descriptor:
> >         bLength                 9
> >         bDescriptorType        36
> >         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
> >         bTerminalID             2
> >         wTerminalType      0x0101 USB Streaming
> >         bAssocTerminal          0
> >         bSourceID               1
> >         iTerminal               0
> >       VideoControl Interface Descriptor:
> >         bLength                11
> >         bDescriptorType        36
> >         bDescriptorSubtype      5 (PROCESSING_UNIT)
> >       Warning: Descriptor too short
> >         bUnitID                 3
> >         bSourceID               1
> >         wMaxMultiplier          0
> >         bControlSize            2
> >         bmControls     0x00000000
> >         iProcessing             0
> >         bmVideoStandards     0x62
> >           NTSC - 525/60
> >           PAL - 525/60
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x81  EP 1 IN
> >         bmAttributes            3
> >           Transfer Type            Interrupt
> >           Synch Type               None
> >           Usage Type               Data
> >         wMaxPacketSize     0x0008  1x 8 bytes
> >         bInterval               1
> >     Interface Descriptor:
> >       bLength                 9
> >       bDescriptorType         4
> >       bInterfaceNumber        1
> >       bAlternateSetting       0
> >       bNumEndpoints           0
> >       bInterfaceClass        14 Video
> >       bInterfaceSubClass      2 Video Streaming
> >       bInterfaceProtocol      0
> >       iInterface              0
> >       VideoStreaming Interface Descriptor:
> >         bLength                            14
> >         bDescriptorType                    36
> >         bDescriptorSubtype                  1 (INPUT_HEADER)
> >         bNumFormats                         1
> >         wTotalLength                   0x0055
> >         bEndpointAddress                 0x82  EP 2 IN
> >         bmInfo                              0
> >         bTerminalLink                       2
> >         bStillCaptureMethod                 2
> >         bTriggerSupport                     0
> >         bTriggerUsage                       0
> >         bControlSize                        1
> >         bmaControls( 0)                     0
> >       VideoStreaming Interface Descriptor:
> >         bLength                            27
> >         bDescriptorType                    36
> >         bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
> >         bFormatIndex                        1
> >         bNumFrameDescriptors                1
> >         guidFormat                            {e436eb7b-524f-11ce-9f53-0020af0ba770}
> >         bBitsPerPixel                      16
> >         bDefaultFrameIndex                  1
> >         bAspectRatioX                       0
> >         bAspectRatioY                       0
> >         bmInterlaceFlags                 0x00
> >           Interlaced stream or variable: No
> >           Fields per frame: 2 fields
> >           Field 1 first: No
> >           Field pattern: Field 1 only
> >         bCopyProtect                        0
> >       VideoStreaming Interface Descriptor:
> >         bLength                            34
> >         bDescriptorType                    36
> >         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
> >         bFrameIndex                         1
> >         bmCapabilities                   0x00
> >           Still image unsupported
> >         wWidth                            240
> >         wHeight                           322
> >         dwMinBitRate                 12364800
> >         dwMaxBitRate                 30912000
> >         dwMaxVideoFrameBufferSize      154560
> >         dwDefaultFrameInterval         400000
> >         bFrameIntervalType                  2
> >         dwFrameInterval( 0)            400000
> >         dwFrameInterval( 1)           1000000
> >       VideoStreaming Interface Descriptor:
> >         bLength                            10
> >         bDescriptorType                    36
> >         bDescriptorSubtype                  3 (STILL_IMAGE_FRAME)
> >         bEndpointAddress                 0x00  EP 0 OUT
> >         bNumImageSizePatterns               1
> >         wWidth( 0)                        240
> >         wHeight( 0)                       322
> >         bNumCompressionPatterns             0
> >     Interface Descriptor:
> >       bLength                 9
> >       bDescriptorType         4
> >       bInterfaceNumber        1
> >       bAlternateSetting       1
> >       bNumEndpoints           1
> >       bInterfaceClass        14 Video
> >       bInterfaceSubClass      2 Video Streaming
> >       bInterfaceProtocol      0
> >       iInterface              0
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x82  EP 2 IN
> >         bmAttributes            5
> >           Transfer Type            Isochronous
> >           Synch Type               Asynchronous
> >           Usage Type               Data
> >         wMaxPacketSize     0x0400  1x 1024 bytes
> >         bInterval               1
> > Device Status:     0x0001
> >   Self Powered
> >
> > ---
> >  drivers/media/common/uvc.c | 4 ++++
> >  include/linux/usb/uvc.h    | 3 +++
> >  2 files changed, 7 insertions(+)
> >
> > diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
> > index c54c2268f..c12d58932 100644
> > --- a/drivers/media/common/uvc.c
> > +++ b/drivers/media/common/uvc.c
> > @@ -96,6 +96,10 @@ static const struct uvc_format_desc uvc_fmts[] = {
> >                 .guid           = UVC_GUID_FORMAT_RGBP,
> >                 .fcc            = V4L2_PIX_FMT_RGB565,
> >         },
> > +       {
> > +               .guid           = UVC_GUID_FORMAT_D3DFMT_R5G6B5,
> > +               .fcc            = V4L2_PIX_FMT_RGB565,
> > +       },
> >         {
> >                 .guid           = UVC_GUID_FORMAT_BGR3,
> >                 .fcc            = V4L2_PIX_FMT_BGR24,
> > diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> > index 88d96095b..01c3b2f45 100644
> > --- a/include/linux/usb/uvc.h
> > +++ b/include/linux/usb/uvc.h
> > @@ -140,6 +140,9 @@
> >  #define UVC_GUID_FORMAT_D3DFMT_L8 \
> >         {0x32, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, \
> >          0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> > +#define UVC_GUID_FORMAT_D3DFMT_R5G6B5 \
> > +       {0x7b, 0xeb, 0x36, 0xe4, 0x4f, 0x52, 0xce, 0x11, \
> > +        0x9f, 0x53, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70}
> >  #define UVC_GUID_FORMAT_KSMEDIA_L8_IR \
> >         {0x32, 0x00, 0x00, 0x00, 0x02, 0x00, 0x10, 0x00, \
> >          0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> > --
> > 2.45.2
> >
> >
>
>
> --
> Ricardo Ribalda

