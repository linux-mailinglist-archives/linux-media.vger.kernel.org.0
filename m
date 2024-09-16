Return-Path: <linux-media+bounces-18310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EAD97A094
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2024 13:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18DB31F23DD4
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2024 11:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A469414F12F;
	Mon, 16 Sep 2024 11:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CQg8GTZ5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CB04962E
	for <linux-media@vger.kernel.org>; Mon, 16 Sep 2024 11:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726487733; cv=none; b=HjV+wkykuMWF8+yp0+s03cY8mpGZS+J3SleJ/RyfcLTBYfoH51kE57ollHv9qOuSiUOND4cl3Jem7MjKOO0yc3L5svs3Ae0M6pnpXW6xsrUf6gA4MOi6SGg5O68d6KcI6PM6yNwxKY3HCg/DrYfHDX14DRckM6xi0eMIf8pNXso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726487733; c=relaxed/simple;
	bh=ly7Y5bDNOzqlP3jXTdXYQB7ND4B7FljAHZu/OjU3j9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e4H+Eg6jS0m1VWlgEVqwsPNiab252V3UmIpeK/aakIJ0U1y+QYH64jZm+HD6L27Bfb/C+tiObFDpZk3Zhin2NYzbIjkbVxw3dy4xWGMbWZcFzEjn8qEjXKjJVgI+ilmjyalDNPCVR40oSwjZb07czUgHsa62jF8zAK38Aa53J5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CQg8GTZ5; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2053a0bd0a6so43802935ad.3
        for <linux-media@vger.kernel.org>; Mon, 16 Sep 2024 04:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726487729; x=1727092529; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tunw2sAoP6knppIh5HYN+eXeKYnrpGUJ/1w8l0j+5Vo=;
        b=CQg8GTZ522cm3sB60v1Di2dRk3Ba6uawXWMEZ9J6d/y5o4VPWUkl4JCzFXqjbOt+mF
         OisfqYuaaAzBTKlEVprJjF8C3dN22DZeoawQGTFw0irm6EtnOFdD58R5PiY1NI+0el+2
         IFqZjmI+g1Z4x8puGvU9DSokw/Mh9vIOlwiPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726487729; x=1727092529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tunw2sAoP6knppIh5HYN+eXeKYnrpGUJ/1w8l0j+5Vo=;
        b=Glh5rKwoXEnxa+ZYVZYkeyy/IsT5aKfIbqu9Dik83nRCudwiY1lQcvuuKjpdJW0vI3
         5EwH9biMTDOYdyKXmcfvtApZLxlBmALtojapemya46DDZVZm+q9IQBxjWfAX5lnb3bc6
         v8BjeIIGu6CpfVTGP8z/CvwLKAqZaXXXQr3o+XzDIWjWfGLgtzulXygkUVf+DafaFSZU
         ZjF7Z6dypTzzrTPy2DLH8uWbxCGr0kgQATU/Jo0Ppx88NKe1OBQOurwyzrhtlgpRXRl5
         QxXpng726U73apMeaFQL96M9oprn6ITmZXJocKJHQwuk2VY1nS8fjeDlyMTFe2bgOZMg
         QyAA==
X-Gm-Message-State: AOJu0YwpwjR+LHljihdLKeSBgQQs/o43G3hXvQt5Ou5y6Tdp5C/h6bbZ
	kliuX+vOnFkya184L7D2zufIj+YiK/ttzxd1wtmb4s5pifG/2qvDHeMRgvNtmrmbXdEYEgPlk9U
	=
X-Google-Smtp-Source: AGHT+IF+W8pyequH19lxbqfM31IZu5mzpvvO4UhGHrzSralu7/rrFRj8CetvEzkvRFs+lzfLERe4kA==
X-Received: by 2002:a17:902:f693:b0:205:68a4:b2d8 with SMTP id d9443c01a7336-2076e3155e9mr264008845ad.11.1726487729472;
        Mon, 16 Sep 2024 04:55:29 -0700 (PDT)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com. [209.85.214.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d27dasm34645305ad.172.2024.09.16.04.55.28
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2024 04:55:28 -0700 (PDT)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1fee6435a34so37098665ad.0
        for <linux-media@vger.kernel.org>; Mon, 16 Sep 2024 04:55:28 -0700 (PDT)
X-Received: by 2002:a17:90b:524c:b0:2da:5edd:c165 with SMTP id
 98e67ed59e1d1-2dba0060fb3mr16656082a91.30.1726487727635; Mon, 16 Sep 2024
 04:55:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALgV52gHPWrcBBv2m6fAAyF_i_8T7cRTtBRS+FKe4TgfRVG0DA@mail.gmail.com>
In-Reply-To: <CALgV52gHPWrcBBv2m6fAAyF_i_8T7cRTtBRS+FKe4TgfRVG0DA@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Sep 2024 13:55:15 +0200
X-Gmail-Original-Message-ID: <CANiDSCti8SmcNWjhEKm1qM+Bzm30dumU=dptmHzcHeiObv-k+Q@mail.gmail.com>
Message-ID: <CANiDSCti8SmcNWjhEKm1qM+Bzm30dumU=dptmHzcHeiObv-k+Q@mail.gmail.com>
Subject: Re: [PATCH] uvc: add support for the Kaiweets KTI-W02 infrared camera
To: David Given <dg@cowlark.com>
Cc: linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

HI David

Can you add the output of lsusb -v -d 1fc9 ?

Also, the patch should be implemented of top of
https://git.linuxtv.org/media_stage.git/log/

Could you rebase your patch and send as v2?
https://patchwork.linuxtv.org/project/linux-media/patch/CALgV52gHPWrcBBv2m6fAAyF_i_8T7cRTtBRS+FKe4TgfRVG0DA@mail.gmail.com/

Thanks!



On Sun, 15 Sept 2024 at 21:32, David Given <dg@cowlark.com> wrote:
>
> - adds support for the D3DFMT_R5G6B5 bitmap format (just RGBP but with
> a different GUID)
> - adds a quirk for the Kaiweets camera which uses it
>
> The camera uses an NXP chipset (product ID 0x1fc9), but I can't find
> any references to a device with vendor ID 0x009b. It may be specific
> to the Kaiweets camera.
>
> diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
> index c54c2268f..c12d58932 100644
> --- a/drivers/media/common/uvc.c
> +++ b/drivers/media/common/uvc.c
> @@ -96,6 +96,10 @@ static const struct uvc_format_desc uvc_fmts[] = {
>          .guid        = UVC_GUID_FORMAT_RGBP,
>          .fcc        = V4L2_PIX_FMT_RGB565,
>      },
> +    {
> +        .guid        = UVC_GUID_FORMAT_D3DFMT_R5G6B5,
> +        .fcc        = V4L2_PIX_FMT_RGB565,
> +    },
>      {
>          .guid        = UVC_GUID_FORMAT_BGR3,
>          .fcc        = V4L2_PIX_FMT_BGR24,
> diff --git a/drivers/media/usb/uvc/uvc_driver.c
> b/drivers/media/usb/uvc/uvc_driver.c
> index f0febdc08..5a29f6970 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -3072,6 +3072,15 @@ static const struct usb_device_id uvc_ids[] = {
>        .bInterfaceSubClass    = 1,
>        .bInterfaceProtocol    = 0,
>        .driver_info        = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> +    /* NXP Semiconductors IR VIDEO */
> +    { .match_flags        = USB_DEVICE_ID_MATCH_DEVICE
> +                | USB_DEVICE_ID_MATCH_INT_INFO,

The quirks are sorted by idVendor:IdProduct

> +      .idVendor        = 0x1fc9,
> +      .idProduct        = 0x009b,
> +      .bInterfaceClass    = USB_CLASS_VIDEO,
> +      .bInterfaceSubClass    = 1,
> +      .bInterfaceProtocol    = 0,
> +      .driver_info        = (kernel_ulong_t)&uvc_quirk_probe_minmax },
>      /* Generic USB Video Class */
>      { USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_UNDEFINED) },
>      { USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_15) },
> diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> index 88d96095b..01c3b2f45 100644
> --- a/include/linux/usb/uvc.h
> +++ b/include/linux/usb/uvc.h
> @@ -140,6 +140,9 @@
>  #define UVC_GUID_FORMAT_D3DFMT_L8 \
>      {0x32, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, \
>       0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> +#define UVC_GUID_FORMAT_D3DFMT_R5G6B5 \
> +    {0x7b, 0xeb, 0x36, 0xe4, 0x4f, 0x52, 0xce, 0x11, \
> +     0x9f, 0x53, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70}
>  #define UVC_GUID_FORMAT_KSMEDIA_L8_IR \
>      {0x32, 0x00, 0x00, 0x00, 0x02, 0x00, 0x10, 0x00, \
>       0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
>


-- 
Ricardo Ribalda

