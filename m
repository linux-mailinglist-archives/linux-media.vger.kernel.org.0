Return-Path: <linux-media+bounces-18367-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9994F97B730
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 06:07:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4D46B27F8C
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 04:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D38D313A3EC;
	Wed, 18 Sep 2024 04:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P+GWrT8g"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCC03C08A
	for <linux-media@vger.kernel.org>; Wed, 18 Sep 2024 04:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726632450; cv=none; b=EN734jah+zeEonXKKfAhIvXFaMBd9oS3vd41o11eBiZFIRwuoVX2rs0XVfwMdelbMGUSPV53wOLnHwJ2gzReqOebccJvNxXFrfVZhOtO86XLvTqLCMJfpnFvWS8ABFJy2E7vndY/2Ur0trwx4vfJZfKQkkK8BAJpdppptMXOlgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726632450; c=relaxed/simple;
	bh=f0lgStvu23QXD0iYIU/7Lrqon1ITD3IaRy2pAeOA4Es=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=immzefyKBqu+tc5oXH/xd1YATRftS0FXe8i91B9ixaeV0h3K5s8XOJ2C4ShJL4i8GQVil61yjdRM7bxaBJpRg4Z30JHn7G1gFdvPNHMg3S1FYqKA6LtTqOxM8+SD2kHJdJ+rusnthVUzvXXiqNDr4rsmPLm7dyoHgJ+soRmB9ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=P+GWrT8g; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2053f6b8201so60630605ad.2
        for <linux-media@vger.kernel.org>; Tue, 17 Sep 2024 21:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726632447; x=1727237247; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/dxwwjVf58dPsQT7kT2CFY1VIoEe6VQW+8eiCFf+IVQ=;
        b=P+GWrT8gUhHiHaINiJNXBcNBRdU5Ub/02WcfQlbIdl3tjBT3Cci4M3b0qYNgWS/kuZ
         xR1cMBkhwWMVrbxOmC6/ehas5CnZSpR51eKpSVK4qqu2AzY+Di9p8WMYa7715i/qIM1a
         BxoVg3yC6SWhoA29GnBB5W8si97pu/7SSiRdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726632447; x=1727237247;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/dxwwjVf58dPsQT7kT2CFY1VIoEe6VQW+8eiCFf+IVQ=;
        b=K23kn7yGOiyTOLBm1dfioBlvXDzKyQMisaKV0et2bdE+Xs5RzBJdplx99zj0wiZUxN
         UAyJImR5a4gFo2jEf3Ej+RD7+CxWAQa1P+A13nl1IOynylAdOpqQiQS6naPwMbysT/f9
         y97WGeuCcMotdR32gbA3+NdiPEiLba7YfdGWb1x7gWmWEb16z6fF57OlI9l6DnWAW05H
         vYh8g+5EvaLBlJ3cLesRNKKJ3ELssKxHQU4mlKW6rbO0Xs9tYPGcceR80Me3m3m+oEz+
         aIgjn/xEa0HHBA9V2D5wRDkeiu+7hPqsg48/6UFmyiAoi7zLyOTTip7gbe9ImxgB0Imq
         bAlA==
X-Gm-Message-State: AOJu0Yz5hjN6tciGyGckwPmawpGaGLMA6D0Ix2x6lf9jwIatEKcmmknU
	l4AgTKhI64KHM3dyucQDh9EPXqYo7n/bjbxlfkNKUVi/Qawu6ylbM5IwvVmbDEp1BOwlUKerP+w
	=
X-Google-Smtp-Source: AGHT+IGiiMJiflqUHVYz7/zh63AWo3HPsQrnzCz9dKkIVhLw4vYm0/FdoFdqg9gihZh0uNEj4BNbyg==
X-Received: by 2002:a17:903:2b04:b0:203:a22f:6b09 with SMTP id d9443c01a7336-2076e334c05mr335899605ad.13.1726632447261;
        Tue, 17 Sep 2024 21:07:27 -0700 (PDT)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com. [209.85.210.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dd609186d4sm355697a91.38.2024.09.17.21.07.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Sep 2024 21:07:26 -0700 (PDT)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71790ed8c2dso5753292b3a.3
        for <linux-media@vger.kernel.org>; Tue, 17 Sep 2024 21:07:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:cfa3:b0:1d2:f124:a1e6 with SMTP id
 adf61e73a8af0-1d2f124acf3mr2240827637.9.1726632445451; Tue, 17 Sep 2024
 21:07:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240917215728.50342-1-dg@cowlark.com> <20240917215728.50342-2-dg@cowlark.com>
In-Reply-To: <20240917215728.50342-2-dg@cowlark.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 18 Sep 2024 06:07:08 +0200
X-Gmail-Original-Message-ID: <CANiDSCtH93upn++v0_xOOetN+wVCtTnu1_XNPA9RWNmy7qRM5w@mail.gmail.com>
Message-ID: <CANiDSCtH93upn++v0_xOOetN+wVCtTnu1_XNPA9RWNmy7qRM5w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: add a quirk for the NXP Semiconductors
 chipset, as used by the Kaiweets KTI-W02 infrared camera.
To: David Given <dg@cowlark.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"

Hi

On Tue, 17 Sept 2024 at 23:58, David Given <dg@cowlark.com> wrote:
>
> Adds a quirk to made the NXP Semiconductors 1fc9:009b chipset work.
nit:s/made/make/
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

ERROR: trailing whitespace
38#213: FILE: drivers/media/usb/uvc/uvc_driver.c:2431:
39+ * $

You can run checkpatch on your patches before sending them to test them locally.

./scripts/checkpatch  --strict -g HEAD

Thanks for your patience :)

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

