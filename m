Return-Path: <linux-media+bounces-24295-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A897A0287D
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 15:49:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98B631882044
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 14:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0692D4207A;
	Mon,  6 Jan 2025 14:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X6kYUGDK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3977886323
	for <linux-media@vger.kernel.org>; Mon,  6 Jan 2025 14:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736174913; cv=none; b=YGsXqzOZPX+6TjAdMpc/s/x5dRAxpdZUIaNS0K5vfsqfxynKsJboOawAmnL22R78p7Qlf6KvZFILykjvYlF1NRMIaQrU0y/FbxxJLlUyhdkbb3Rfvmc8swKN08FNHGvgixmVK1wbADULi1Ojt3CUNJkcWimC75TDTaotK39ygxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736174913; c=relaxed/simple;
	bh=oPHJcqZ/FqhaePj2ZYYcePbf8j0Ba41SxJl2o1daoek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HtM5yUaAknvmRvZxUieW3SC5Ymz0Z0wQQ3uhTzA3tKFySj9/t5JCH13RB+tu5LKJwDcbHbqVgq+JCz55k6zkHmSV4R7M+J8kheZw4Mopqikak8B0pd4eiy7wMISldCu1+G5B56G42K6bygm1cUxFfoSV4rqejPAbvlLUbGFHR1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=X6kYUGDK; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3002c324e7eso166292981fa.3
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2025 06:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736174908; x=1736779708; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=27aIZ25RkTpwRXpOX50AFZjiZhFUTcDPbsoLTQXOXrM=;
        b=X6kYUGDKsvOie86tsQJamLX2uDqWJRu0KAHO1DLc5pgsrv5DQHN7SYEC69MtywmApq
         GNpPwb1EvwOIboTYQc5jOvBdU4D+9WCSHsJCXmg8Sszzm2RpuNLyrR5bnFMl59JvWt+W
         yFWIvpmeGwaDIxz/IxvyCpAuirP3VisN2ui0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736174908; x=1736779708;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=27aIZ25RkTpwRXpOX50AFZjiZhFUTcDPbsoLTQXOXrM=;
        b=O3bxLqWOLrsFKi1SMy8o8lKcnyulUICGv0/sTc4JHbf4NaXps7rAPG+XoMkqBmjHxu
         kgBIdB+BWsiJVKjSN6OF3bSPNo/P5qNXqoy2KoVB8Jbs4w8H0Bab2uA2yZUGuBOyoJOt
         KoSTyAf2jGqdKDjB+Pub0cPmWC0SrjA/96Lnbx0nFtsqB8pG79GaM93nUk2u/mqF71mk
         AIYSFmmwA2Lwg+7gn0Rh8T1R5Jq6O0nOXHliZQMRmGX3uHYKdQ03881GAhfzaT/YXFm0
         PxWpAVLPUzq/ULlrpdRAqmeCWKLDExje4W+NqPG4hJJukD7oOR+Ro8W5bqY4fKpG3SPw
         4wYw==
X-Forwarded-Encrypted: i=1; AJvYcCWFcqJnps2TlsW5tPPVujLz7lhEjSl/Hio+03YHEVTXn1rAXeBNJU9h7c6GEHMI65wp2OvMc014NUKEDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSLAMh0FjD3P3igSBpSHHWAQ1eSBm0C9birEDRzXnMhhN8s8Hm
	H1VZlL8Xbpeu5WjSfO1xN66Sx0Al9w8x6kdtp3U6aD8QgeKvDBONZ2TPCCuozbQzktBzXo18Rk1
	Rxg==
X-Gm-Gg: ASbGnctExrMfkAVOH1xAmjN9bSl4Lzlo87xyBETZ0QgVHxjhsxdXCe0vSu30MHQ+Nff
	HplK1D7pVYFGXhbTycezFFUAM8gSpoCXzMsi2VdvWC60aoLeOGdqmw8KKS+HILMYo41Z+jNQg/f
	01AfvayCwm/l7kyxccHi6XPZ9sVU+snw7IfZ+BrvwRXoIXlji3ujAleEZJ2y+Wr1c2ax0wUl8Sy
	y4p7KhKEnIImJ5C5hsgnjBe6ullOY3TIoGOIPu9zsb+KXNVm2Uhdj8mowPqFZnUUvTQhSZB/3sS
	IrWUlLscP1AtWpwqe9w=
X-Google-Smtp-Source: AGHT+IH4ouI55w4EKrmyVO+6JC0wLuhcRVTmu/qXzvs/5nM/QAZB5mxUWaoK5u4JOjrLcmpCZOeLEA==
X-Received: by 2002:a05:651c:4cb:b0:300:41a8:125b with SMTP id 38308e7fff4ca-30468623ab5mr163351241fa.37.1736174908079;
        Mon, 06 Jan 2025 06:48:28 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30484c377b1sm49000071fa.35.2025.01.06.06.48.27
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 06:48:27 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53ffaaeeb76so15409006e87.0
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2025 06:48:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWESCXHsjTkiV0O2DX6dbb5BA5d3BtHMXqGSsYHPXEvFgNO+o0HX1yzE/9vgjqrrPJjfglacQWvXWy3dA==@vger.kernel.org
X-Received: by 2002:ac2:4e08:0:b0:540:2022:e3b7 with SMTP id
 2adb3069b0e04-5422956f508mr15718534e87.53.1736174907133; Mon, 06 Jan 2025
 06:48:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250106140923.56896-1-hdegoede@redhat.com> <20250106140923.56896-3-hdegoede@redhat.com>
In-Reply-To: <20250106140923.56896-3-hdegoede@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 6 Jan 2025 15:48:15 +0100
X-Gmail-Original-Message-ID: <CANiDSCviVQyoaf70KG=uPGJo1jsiHhzmG7XmfBCzCy6YpXr4Fg@mail.gmail.com>
X-Gm-Features: AbW1kvaxWoGTxSVGBbremaNwZ93odg8u_Nnzs_fDuHhl8T3KlxlB9etF44SvgzE
Message-ID: <CANiDSCviVQyoaf70KG=uPGJo1jsiHhzmG7XmfBCzCy6YpXr4Fg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: uvc: limit max bandwidth for HDMI capture
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Jan 2025 at 15:09, Hans de Goede <hdegoede@redhat.com> wrote:
>
> From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>
> This device:
>         534d:2109 MacroSilicon
>
> Announces that it supports several frame intervals for
> their resolutions for MJPEG compression:
>
>         VideoStreaming Interface Descriptor:
>         bLength                            46
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         1
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1920
>         wHeight                          1080
>         dwMinBitRate                   768000
>         dwMaxBitRate                196608000
>         dwMaxVideoFrameBufferSize     4147200
>         dwDefaultFrameInterval         166666
>         bFrameIntervalType                  5
>         dwFrameInterval( 0)            166666
>         dwFrameInterval( 1)            333333
>         dwFrameInterval( 2)            400000
>         dwFrameInterval( 3)            500000
>         dwFrameInterval( 4)           1000000
>
> However, the highest frame interval (166666), which means 60 fps
> is not supported. If set to it, URB packages will be dropped,
> causing JPEG decoding errors and part of the video frames will
> be missed.
>
> Also, as specified at the device's documentation, for such
> resolution, the maximum interval is 30 fps (interval == 333333).
>
> The last format that supports such frame interval is 1280x720.
>
> Add a quirk to estimate a raw bandwidth, by doing:
>         width * height * framerate
> E. g.:
>         1920 * 1080 * 30 = 62208000
>
> if the bandwidth is greater than such threshold, get
> the next value from the dwFrameInterval.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Link: https://lore.kernel.org/r/bca0634691cea503c2c5df62b98ba66f0c85bf85.1624350539.git.mchehab+huawei@kernel.org
> [hdegoede@redhat.com add "pixels per second" comment, use UVC_FIVAL_DENOM]
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 14 ++++++++++++++
>  drivers/media/usb/uvc/uvc_video.c  | 29 ++++++++++++++++++++++++++---
>  drivers/media/usb/uvc/uvcvideo.h   |  1 +
>  3 files changed, 41 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index f754640fddf5..6d001d4f0902 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2491,6 +2491,11 @@ static const struct uvc_device_info uvc_quirk_fix_bandwidth = {
>         .quirks = UVC_QUIRK_FIX_BANDWIDTH,
>  };
>
> +static const struct uvc_device_info uvc_quirk_fix_bw_622 = {
> +       .quirks = UVC_QUIRK_FIX_BANDWIDTH,
> +       .max_bandwidth = 62208000,
> +};
> +
>  static const struct uvc_device_info uvc_quirk_probe_def = {
>         .quirks = UVC_QUIRK_PROBE_DEF,
>  };
> @@ -2794,6 +2799,15 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = (kernel_ulong_t)&uvc_quirk_fix_bandwidth },
> +       /* MacroSilicon HDMI capture */
> +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> +         .idVendor             = 0x534d,
> +         .idProduct            = 0x2109,
> +         .bInterfaceClass      = USB_CLASS_VIDEO,
> +         .bInterfaceSubClass   = 1,
> +         .bInterfaceProtocol   = 0,
> +         .driver_info          = (kernel_ulong_t)&uvc_quirk_fix_bw_622 },
>         /* Genesys Logic USB 2.0 PC Camera */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 41cb1b45fa23..af5233ab667e 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -225,9 +225,32 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
>         if ((ctrl->dwMaxPayloadTransferSize & 0xffff0000) == 0xffff0000)
>                 ctrl->dwMaxPayloadTransferSize &= ~0xffff0000;
>
> -       if (!(format->flags & UVC_FMT_FLAG_COMPRESSED) &&
> -           stream->dev->quirks & UVC_QUIRK_FIX_BANDWIDTH &&
> -           stream->intf->num_altsetting > 1) {
> +       if (!(stream->dev->quirks & UVC_QUIRK_FIX_BANDWIDTH))
> +               return;
> +
> +       /* Handle UVC_QUIRK_FIX_BANDWIDTH */
> +

Shouldn't this quirk be better implemented in uvc_try_frame_interval() ?

> +       if (format->flags & UVC_FMT_FLAG_COMPRESSED) {
> +               u32 bandwidth;
> +
> +               if (!stream->dev->info->max_bandwidth || !frame->bFrameIntervalType)
> +                       return;
> +
> +               for (i = 0; i < frame->bFrameIntervalType; ++i) {
> +                       bandwidth = frame->wWidth * frame->wHeight;
> +                       bandwidth *= UVC_FIVAL_DENOM / frame->dwFrameInterval[i];

frame->dwFrameInterval[i] comes from the device, it is not sanitized.
We need to make sure it is not zero.

> +
> +                       if (bandwidth <= stream->dev->info->max_bandwidth)
> +                               break;
> +               }
> +
> +               if (ctrl->dwFrameInterval < frame->dwFrameInterval[i])
> +                       ctrl->dwFrameInterval = frame->dwFrameInterval[i];
> +
> +               return;
> +       }
> +
> +       if (stream->intf->num_altsetting > 1) {
>                 u32 interval;
>                 u32 bandwidth;
>
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 966ff82c2ba8..6b702219173f 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -535,6 +535,7 @@ static inline u32 uvc_urb_index(const struct uvc_urb *uvc_urb)
>
>  struct uvc_device_info {
>         u32     quirks;
> +       u32     max_bandwidth; /* In pixels per second */
>         u32     meta_format;
>         u16     uvc_version;
>  };
> --
> 2.47.1
>
>


-- 
Ricardo Ribalda

