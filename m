Return-Path: <linux-media+bounces-18322-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AE497ABA3
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 08:47:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7BA2B2B5ED
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 06:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE50139D04;
	Tue, 17 Sep 2024 06:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m1/EcVur"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A4F18B1A
	for <linux-media@vger.kernel.org>; Tue, 17 Sep 2024 06:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726555621; cv=none; b=cSOTHRRyWe3r0LPBee3wTuy69wBrjGLhtLRuLlDaZsfmc54beQebn6tFJdK36EjzgNbCz5+mux6DV36nmMe9PP3DyT/PCCFtEJ/EQp3EVTYDMSrBXqMLfCcDwqfWW0FXpBm9zdewN5myO36ubXxK/EW5P51nRKqxrsHSTCzNQ98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726555621; c=relaxed/simple;
	bh=UBVltcCDVuqRt0UfiRP5DRub5Waeoi8tzPwQ3R/VDCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X9/T05RMmy67P15yTVZmMGzHiWcwjT3lizp9CM231k3zlDIfHgCi3T4GSZJdtzKeFa3mgp+Kc8M7lwqTGii9/ivn3uwxWKZjHOoclrgLbIZv4WECqVBD36k9gDW5MSI02U12dypfrgclH9W4Lp7J1kOPJs1wT5sGq5NRZkOlANk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m1/EcVur; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20551e2f1f8so45098315ad.2
        for <linux-media@vger.kernel.org>; Mon, 16 Sep 2024 23:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726555619; x=1727160419; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AxjTn00MPYdQqfX8ZmSuh3ns56zaheElYo0vMGc/mo0=;
        b=m1/EcVurK57Af6a78G0lbwQetbvLhrbVXM06eWOoO4ljovCeoqi6i9NxrHEGyTuBBJ
         cdVgLlg56XTQqqs+8kZ9ebaxKzPMwB9p3H/mGSfP+EYTQVEj5sR8w3S5g36uqRV1vnpt
         bPMPPMjUbzzvhUcf2Jsd9I/f/V2WPyZ+9W0+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726555619; x=1727160419;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxjTn00MPYdQqfX8ZmSuh3ns56zaheElYo0vMGc/mo0=;
        b=hT9H5nuG2EKnTvLjsXNqp5tHHTWUl2ivx0gTT5DXtCuyh9CAXJgXi80XlVPTanxmy0
         /UjkarzwTAvD13CWtpbdtVKy07u8z+DCXLrpuVcah0eT4fAVNBG10HJ06XhB60TBYDUm
         5g3f5UeA6z3HOIHWHK23wjh8SBDZFkXzuTo/7VDQpticwXYYtZTd85gKCUxuY4fOSCMM
         z+5z1y4y6rkSeBrkNYh467AyOT1r1w6Xkhhmg2dcVg7ruxY94IM4m5UgsWXFwJPeo8YE
         hG24x3al/Dxwp2oOCNgMwms71ntzZbWk5ZRjl3uNJIdZ4PU91f53xqaWYOiCl7ZNpJBY
         PLnA==
X-Gm-Message-State: AOJu0YybXb0Zm5LTtkz4pE9hKJxLGXVVzh1Hwyf1qX//LVnniRbaZ5dQ
	RMCs0t62st97qmY+Mw18diRT5Zeypbw0b/UZm7Tf7hOSrg/04TIAoUSZA1M3+ZajAuioM8q8pUI
	=
X-Google-Smtp-Source: AGHT+IEjR4vknnO0ZfzCGi+Ns6YaTo64rfbN6jRV/sww57czK7Dvwx7Ows7QddvAExnEiUshqwMetA==
X-Received: by 2002:a17:90b:4f4e:b0:2d3:df93:1e5f with SMTP id 98e67ed59e1d1-2dbb9dc96a0mr17142748a91.6.1726555618799;
        Mon, 16 Sep 2024 23:46:58 -0700 (PDT)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com. [209.85.215.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dbb9c3f593sm8687554a91.9.2024.09.16.23.46.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2024 23:46:58 -0700 (PDT)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7163489149eso3223224a12.1
        for <linux-media@vger.kernel.org>; Mon, 16 Sep 2024 23:46:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f83:b0:1d2:e8a5:8bc4 with SMTP id
 adf61e73a8af0-1d2e8a59489mr711998637.44.1726555616798; Mon, 16 Sep 2024
 23:46:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240916191405.27373-2-dg@cowlark.com>
In-Reply-To: <20240916191405.27373-2-dg@cowlark.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 17 Sep 2024 08:46:43 +0200
X-Gmail-Original-Message-ID: <CANiDSCtnUrmgM5ED70rt5ogCwEYNbxc82=MNEd0O46Fukx=dZg@mail.gmail.com>
Message-ID: <CANiDSCtnUrmgM5ED70rt5ogCwEYNbxc82=MNEd0O46Fukx=dZg@mail.gmail.com>
Subject: Re: [PATCH 1/2] Add support for the D3DFMT_R5G6B5 pixmap type.
To: David Given <dg@cowlark.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"

Hi David

Could you take a look at the errors reported by the CI?

https://patchwork.linuxtv.org/project/linux-media/patch/20240916191405.27373-2-dg@cowlark.com/

A small nit: is that I think the lsusb output belongs to your second patch...

Thanks!

On Mon, 16 Sept 2024 at 21:19, David Given <dg@cowlark.com> wrote:
>
> This media format is used by the NXP Semiconductors 1fc9:009b chipset,
> used by the Kaiweets KTI-W02 infrared camera.
>
> lsusb for the device reports:
>
> Bus 003 Device 011: ID 1fc9:009b NXP Semiconductors IR VIDEO
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass          239 Miscellaneous Device
>   bDeviceSubClass         2 [unknown]
>   bDeviceProtocol         1 Interface Association
>   bMaxPacketSize0        64
>   idVendor           0x1fc9 NXP Semiconductors
>   idProduct          0x009b IR VIDEO
>   bcdDevice            1.01
>   iManufacturer           1 Guide sensmart
>   iProduct                2 IR VIDEO
>   iSerial                 0
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x00c2
>     bNumInterfaces          2
>     bConfigurationValue     1
>     iConfiguration          0
>     bmAttributes         0xc0
>       Self Powered
>     MaxPower              100mA
>     Interface Association:
>       bLength                 8
>       bDescriptorType        11
>       bFirstInterface         0
>       bInterfaceCount         2
>       bFunctionClass         14 Video
>       bFunctionSubClass       3 Video Interface Collection
>       bFunctionProtocol       0
>       iFunction               3 IR Camera
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      1 Video Control
>       bInterfaceProtocol      0
>       iInterface              0
>       VideoControl Interface Descriptor:
>         bLength                13
>         bDescriptorType        36
>         bDescriptorSubtype      1 (HEADER)
>         bcdUVC               1.00
>         wTotalLength       0x0033
>         dwClockFrequency        6.000000MHz
>         bInCollection           1
>         baInterfaceNr( 0)       1
>       VideoControl Interface Descriptor:
>         bLength                18
>         bDescriptorType        36
>         bDescriptorSubtype      2 (INPUT_TERMINAL)
>         bTerminalID             1
>         wTerminalType      0x0201 Camera Sensor
>         bAssocTerminal          0
>         iTerminal               0
>         wObjectiveFocalLengthMin      0
>         wObjectiveFocalLengthMax      0
>         wOcularFocalLength            0
>         bControlSize                  3
>         bmControls           0x00000000
>       VideoControl Interface Descriptor:
>         bLength                 9
>         bDescriptorType        36
>         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
>         bTerminalID             2
>         wTerminalType      0x0101 USB Streaming
>         bAssocTerminal          0
>         bSourceID               1
>         iTerminal               0
>       VideoControl Interface Descriptor:
>         bLength                11
>         bDescriptorType        36
>         bDescriptorSubtype      5 (PROCESSING_UNIT)
>       Warning: Descriptor too short
>         bUnitID                 3
>         bSourceID               1
>         wMaxMultiplier          0
>         bControlSize            2
>         bmControls     0x00000000
>         iProcessing             0
>         bmVideoStandards     0x62
>           NTSC - 525/60
>           PAL - 525/60
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0008  1x 8 bytes
>         bInterval               1
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       0
>       bNumEndpoints           0
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0
>       iInterface              0
>       VideoStreaming Interface Descriptor:
>         bLength                            14
>         bDescriptorType                    36
>         bDescriptorSubtype                  1 (INPUT_HEADER)
>         bNumFormats                         1
>         wTotalLength                   0x0055
>         bEndpointAddress                 0x82  EP 2 IN
>         bmInfo                              0
>         bTerminalLink                       2
>         bStillCaptureMethod                 2
>         bTriggerSupport                     0
>         bTriggerUsage                       0
>         bControlSize                        1
>         bmaControls( 0)                     0
>       VideoStreaming Interface Descriptor:
>         bLength                            27
>         bDescriptorType                    36
>         bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
>         bFormatIndex                        1
>         bNumFrameDescriptors                1
>         guidFormat                            {e436eb7b-524f-11ce-9f53-0020af0ba770}
>         bBitsPerPixel                      16
>         bDefaultFrameIndex                  1
>         bAspectRatioX                       0
>         bAspectRatioY                       0
>         bmInterlaceFlags                 0x00
>           Interlaced stream or variable: No
>           Fields per frame: 2 fields
>           Field 1 first: No
>           Field pattern: Field 1 only
>         bCopyProtect                        0
>       VideoStreaming Interface Descriptor:
>         bLength                            34
>         bDescriptorType                    36
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
>         bFrameIndex                         1
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            240
>         wHeight                           322
>         dwMinBitRate                 12364800
>         dwMaxBitRate                 30912000
>         dwMaxVideoFrameBufferSize      154560
>         dwDefaultFrameInterval         400000
>         bFrameIntervalType                  2
>         dwFrameInterval( 0)            400000
>         dwFrameInterval( 1)           1000000
>       VideoStreaming Interface Descriptor:
>         bLength                            10
>         bDescriptorType                    36
>         bDescriptorSubtype                  3 (STILL_IMAGE_FRAME)
>         bEndpointAddress                 0x00  EP 0 OUT
>         bNumImageSizePatterns               1
>         wWidth( 0)                        240
>         wHeight( 0)                       322
>         bNumCompressionPatterns             0
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       1
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x0400  1x 1024 bytes
>         bInterval               1
> Device Status:     0x0001
>   Self Powered
>
> ---
>  drivers/media/common/uvc.c | 4 ++++
>  include/linux/usb/uvc.h    | 3 +++
>  2 files changed, 7 insertions(+)
>
> diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
> index c54c2268f..c12d58932 100644
> --- a/drivers/media/common/uvc.c
> +++ b/drivers/media/common/uvc.c
> @@ -96,6 +96,10 @@ static const struct uvc_format_desc uvc_fmts[] = {
>                 .guid           = UVC_GUID_FORMAT_RGBP,
>                 .fcc            = V4L2_PIX_FMT_RGB565,
>         },
> +       {
> +               .guid           = UVC_GUID_FORMAT_D3DFMT_R5G6B5,
> +               .fcc            = V4L2_PIX_FMT_RGB565,
> +       },
>         {
>                 .guid           = UVC_GUID_FORMAT_BGR3,
>                 .fcc            = V4L2_PIX_FMT_BGR24,
> diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> index 88d96095b..01c3b2f45 100644
> --- a/include/linux/usb/uvc.h
> +++ b/include/linux/usb/uvc.h
> @@ -140,6 +140,9 @@
>  #define UVC_GUID_FORMAT_D3DFMT_L8 \
>         {0x32, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, \
>          0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> +#define UVC_GUID_FORMAT_D3DFMT_R5G6B5 \
> +       {0x7b, 0xeb, 0x36, 0xe4, 0x4f, 0x52, 0xce, 0x11, \
> +        0x9f, 0x53, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70}
>  #define UVC_GUID_FORMAT_KSMEDIA_L8_IR \
>         {0x32, 0x00, 0x00, 0x00, 0x02, 0x00, 0x10, 0x00, \
>          0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> --
> 2.45.2
>
>


-- 
Ricardo Ribalda

