Return-Path: <linux-media+bounces-18393-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9D797C0F2
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 22:41:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2017C1C2085D
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 20:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C43D1CB300;
	Wed, 18 Sep 2024 20:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gBVVJR3E"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBC214B94A
	for <linux-media@vger.kernel.org>; Wed, 18 Sep 2024 20:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726692080; cv=none; b=cwitc0vgUIE6e1qVvRTMURVPvsce4iGcoG/wCt/qIQKFeV2f0lE3qmY5H/sO21fGgh9UIkRfT6rOlHDkf8bQIQfb9WgbGBmM3qVFCjeABNoPdkHoP1YKweq1Iu4tjpHsT3h5Hy9sqrgD8lW5eTtBCr+PLAnW0/WAqkVm7Lgmp9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726692080; c=relaxed/simple;
	bh=+C16hhW8SG5uMyOEHaNw0MG2N2XiUUedpCUHEIYPDuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KzDZ8a5XSUtIlHZX7kuBs6wbKbiWqnoOPhMxkLtzj0fIO0sByyR+AWBuD2bnTFmr4UKI0qejoHIT/FRTua/DzLNBAMk63Rhl9hOX/GQlbZgFXiC/EjFiU43H0NQQSQhh/LJS1TW+wYNv1axzl18zpidlpbDDpXPIeNuKRN2mgCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gBVVJR3E; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20570b42f24so2191285ad.1
        for <linux-media@vger.kernel.org>; Wed, 18 Sep 2024 13:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726692077; x=1727296877; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2oI0rZTZelx/gxI7U2mixwD1r7OayA39Zxmw1whHWSQ=;
        b=gBVVJR3EmyVC4Na9hdjws/12uLSiX26U+yKMCca3bMDm/5Z0Hnr84LXPF6IjodvGP1
         jRx/t86qOhk6AnQ0Qw0pUMOU1CNJvj+A6NAraXnwMuAOoQQitSleJej5scajZNrgxUvP
         UVgFVDry0brv5Juniqq8p+CXbYxF6sMQ9JQm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726692077; x=1727296877;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2oI0rZTZelx/gxI7U2mixwD1r7OayA39Zxmw1whHWSQ=;
        b=OShLanGpACnBIc51PDigCg+MJnxRr9mZ/jO2287FJ/RR6Xditay/AfgdvGDjEYh0mY
         eyyR28IarJ8y90OcqNmZNC0bN/4QsxlXgGX1rEqZrHT00FDx4dmVzjcPGHlWXer+gGOc
         9jZkco3TBdVaFxtno+oYQtGDL0XWBWTvOXZ5gpTUXy43e549gRp7GKl2mvMGEtAFfiuo
         xk+poh1rTFCaN/WAO96ylYwqe3/8a5RTrCJ/bKgAvuY2Wr8dAhVXmDshHTA5x6oBwvDF
         atT729uP+V3TYpNxP5atifMI7lqFVh04sy8zMQd3qYkKv/UgML1B2Xlc4puOa+2zW1wJ
         G3nA==
X-Gm-Message-State: AOJu0YwiWgJwFpIC0ktBicXW1iB4VaTB7um37yvCFBnCB8YBUNlIwwoI
	c9UL9RlR6PIYYAKhwTN9nAsB0e2LMgLUdW2F53krsBcVIm7BULDlJYnBigUL7WEw4c+AZmMhlrM
	=
X-Google-Smtp-Source: AGHT+IE6mEYv0pvb4Om9vlqYEd2fsVEIsAo928XVcsDVQXVsSMwa0l+rm5Fmh/gWsBT2LzaXCKe8Ww==
X-Received: by 2002:a17:902:f693:b0:205:68a4:b2d8 with SMTP id d9443c01a7336-2076e3155e9mr414664105ad.11.1726692077414;
        Wed, 18 Sep 2024 13:41:17 -0700 (PDT)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com. [209.85.210.175])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d4e04sm68741665ad.125.2024.09.18.13.41.16
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 13:41:16 -0700 (PDT)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-719858156f4so62478b3a.3
        for <linux-media@vger.kernel.org>; Wed, 18 Sep 2024 13:41:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:c799:b0:1cf:2875:c4af with SMTP id
 adf61e73a8af0-1cf75ea25f4mr34526104637.8.1726692075591; Wed, 18 Sep 2024
 13:41:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240918180540.10830-1-dg@cowlark.com> <20240918180540.10830-2-dg@cowlark.com>
In-Reply-To: <20240918180540.10830-2-dg@cowlark.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 18 Sep 2024 22:40:59 +0200
X-Gmail-Original-Message-ID: <CANiDSCstKs_xSKr5qJQ31Wpz6mprqtx9zLWs-qmsi2DmUVBHpA@mail.gmail.com>
Message-ID: <CANiDSCstKs_xSKr5qJQ31Wpz6mprqtx9zLWs-qmsi2DmUVBHpA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: add a quirk for the NXP Semiconductors
 chipset, as used by the Kaiweets KTI-W02 infrared camera.
To: David Given <dg@cowlark.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Sept 2024 at 20:06, David Given <dg@cowlark.com> wrote:
>
> Adds a quirk to make the NXP Semiconductors 1fc9:009b chipset work.
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
> Signed-off-by: David Given <dg@cowlark.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index f0febdc08..37f5d8346 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2428,6 +2428,8 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
>   * The Logitech cameras listed below have their interface class set to
>   * VENDOR_SPEC because they don't announce themselves as UVC devices, even
>   * though they are compliant.
> + *
> + * Sort these by vendor/product ID.
>   */
>  static const struct usb_device_id uvc_ids[] = {
>         /* Quanta ACER HD User Facing */
> @@ -2964,6 +2966,15 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_PROBE_MINMAX
>                                         | UVC_QUIRK_IGNORE_SELECTOR_UNIT) },
> +       /* NXP Semiconductors IR VIDEO */
> +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> +         .idVendor             = 0x1fc9,
> +         .idProduct            = 0x009b,
> +         .bInterfaceClass      = USB_CLASS_VIDEO,
> +         .bInterfaceSubClass   = 1,
> +         .bInterfaceProtocol   = 0,
> +         .driver_info          = (kernel_ulong_t)&uvc_quirk_probe_minmax },
>         /* Oculus VR Positional Tracker DK2 */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> --
> 2.45.2
>
>


-- 
Ricardo Ribalda

