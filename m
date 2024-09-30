Return-Path: <linux-media+bounces-18882-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB22798AC62
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 20:50:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B62A1F218A0
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 18:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BABD198E93;
	Mon, 30 Sep 2024 18:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HwlkzIQO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C64B5466B
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 18:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727722221; cv=none; b=GHnhULbWL+Hn6qgODydTaLhcQwlYgYdvfzZGM1NkEsQ+FGygx9wihUZ/4X4AvWF2iQxi38K0OImtLEtgB8wMLlI0ox3t5tXFKOKoOaHnP6fi08UKxa3Eb/cTuNfDMoob8Sxc3fmm/QqYxt90NYzA0wMiSRpcTcijjiuFxyFS8+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727722221; c=relaxed/simple;
	bh=YzEJzPf9pIeJXIAdKAGcCVdYzOJyEBEN4IOWQiaOzNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qa5DPtWp8FuAUhZycBnKUQ1MacnDomSHmn2MLtPjBA5xPfEdSwYNsm1O06zwkI/JO8RA2IMFyY6YtOl6Ek1mURdeYxUDFNBRy0rymGEQ8iGCTrFT7bLtrg9txnQiCv67W6f+u19Snxzwc5+svNBqrYN2ebVH/aH0DZraQemVGMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HwlkzIQO; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5e1b50fea4bso2776642eaf.2
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 11:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727722218; x=1728327018; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tNyIa/gmgnbhZYjmWsGHrECsnrF80wsVf6mbMZ2UyZI=;
        b=HwlkzIQOGPJj1jIB3Q1DtR7ApuvgMaDCJRE0w5ZEh/pTf0Ao2Z2fxDBFNQmH7iqmRE
         ZL1Q/jR3AbIlEkTJ+RajkgS99VTwcATV3mLMTA3C5H/GechY7SedHT8aatcBLQn8v9Aa
         ZcSFE5AmLOyHewKhvmeIyweqnb+ObqWAG/4+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727722218; x=1728327018;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tNyIa/gmgnbhZYjmWsGHrECsnrF80wsVf6mbMZ2UyZI=;
        b=FiZrirjQMUPu51vcJGBHUc8BdXfudDPIkWTAMB4Zl4+8lpDuHEKSXgZo8lgqlVqZ0U
         0DegPGXOi8KiGePZIcxfM2dDswV4J1HKAhR1ggVlFWZUgKP1Bb8btG0n0LNi1rxii/3H
         FBj7yowpzbIhipLg2CWpcB6tbw5Hy7a1zKqeON8CftcS0T9wvzIbqZA4PIoXk3OYmyf/
         3QHcmgeMcZf+oMClgevnpNWelBE9kWg6hHuvi60Fb5L6eagyPPbJObOjEBLmfu9yd+39
         fTlBYG/rHcJJjrD0hOAfooAk1siA2JXxxAlCAyoGpYPgiPx4fpg5naL8tuVsUVTYdyzY
         3/Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWnyWWQOnoqNDjpzOmZO3gkVj/K0sZRgyqCv78j52pi5rlX+7mEFCe9L44mWYIm7rDLIcuq+gwuV/CUTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ9cMzdEnbl9PcL8psi+1WhkamRh1N1nckNn3oVaV0y/mPF5fl
	RllFIWSCfpPbk8QdABxJjdL0pTvdvm7Pjn9G2Q4r4IE7kBrbGWcSwMYQLhSKudSmAC2y7FgKNjY
	=
X-Google-Smtp-Source: AGHT+IECY9kdOLs9H8rIzJmTPZzrmy4AEwOnd9yCI3tJH9/f8z9iKM6MIGwDET/EXdyAqsjgO7MBjg==
X-Received: by 2002:a05:6820:617:b0:5e1:eba9:8fee with SMTP id 006d021491bc7-5e7725c9cd0mr6917749eaf.1.1727722218158;
        Mon, 30 Sep 2024 11:50:18 -0700 (PDT)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com. [209.85.167.175])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5e770eaa056sm2308255eaf.31.2024.09.30.11.50.16
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 11:50:17 -0700 (PDT)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3e28ac7b12bso2663432b6e.3
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 11:50:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWh3Im4bzGAPlxKAEaGI3GHa+9Ah4htaC4iqo7yp/sUN8jtQ/kS24kxdtWCvaj3jvu3ECmE2ztRvSZt/w==@vger.kernel.org
X-Received: by 2002:a05:6808:1b98:b0:3e3:a909:d53b with SMTP id
 5614622812f47-3e3a909dae7mr2883633b6e.3.1727722216007; Mon, 30 Sep 2024
 11:50:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240930184705.59508-1-takshakmudgal@gmail.com>
In-Reply-To: <20240930184705.59508-1-takshakmudgal@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 20:49:59 +0200
X-Gmail-Original-Message-ID: <CANiDSCt-hkO4b85OgORCCJXYe44VQxKY9ZuXPfbWFTtajwjqBg@mail.gmail.com>
Message-ID: <CANiDSCt-hkO4b85OgORCCJXYe44VQxKY9ZuXPfbWFTtajwjqBg@mail.gmail.com>
Subject: Re: [PATCH] uvc: Add support for Quanta ACER HD User Facing Camera (0408:4033)
To: Takshak Mudgal <takshakmudgal@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Takshak

There is already a patch for this under review:
https://lore.kernel.org/linux-media/20240924-uvc-quanta-v1-1-2de023863767@chromium.org/

Will likely land in 6.13

Regards!

On Mon, 30 Sept 2024 at 20:48, Takshak Mudgal <takshakmudgal@gmail.com> wrote:
>
> This patch adds support for the Quanta ACER HD User Facing Camera
> with USB ID 0408:4033, which is found in some Acer Nitro 5 and
> Aspire 3 series laptops. The camera is UVC 1.1 compliant but
> requires explicit enumeration to function correctly.
>
> Signed-off-by: Takshak Mudgal <takshakmudgal@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index f0febdc08..40db8a5f4 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2430,6 +2430,24 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
>   * though they are compliant.
>   */
>  static const struct usb_device_id uvc_ids[] = {
> +       /**
> +          * Fix for the problem with cameras on Acer Nitro 5 Series & Acer Aspire 3 Series.
> +          *
> +          * Fix required for the camera here
> +          * Thanks for @Giuliano69 for providing the fix
> +         */
> +       /* Quanta ACER HD User Facing 4033 - Experimental !! */
> +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> +         .idVendor             = 0x0408,
> +         .idProduct            = 0x4033,
> +         .bInterfaceClass      = USB_CLASS_VIDEO,
> +         .bInterfaceSubClass   = 1,
> +         .bInterfaceProtocol   = UVC_PC_PROTOCOL_15,
> +         .driver_info          = (kernel_ulong_t)&(const struct uvc_device_info){
> +               .uvc_version    = 0x010a,
> +         } },
> +       /* Fix end here */
>         /* Quanta ACER HD User Facing */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> --
> 2.46.2
>
>


-- 
Ricardo Ribalda

