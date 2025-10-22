Return-Path: <linux-media+bounces-45242-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E416BFC29D
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 15:33:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 56F48562F92
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 13:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30DE9344057;
	Wed, 22 Oct 2025 13:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LENNzr/D"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B814632E6B6
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 13:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761139574; cv=none; b=tFvKlPkw6aLXz/Eb1kuLvdC5RDbk8CQ2QYIO/4uDvLdrammUPacNNZ2+V+q0FqOCHnwlk5TVdxSzakBn1Io4wC4AkbkJO6gWP6Zw/0G0dscLKEjxOQ+PnrwupHGiZcYDiCYOVImF/XJV2J7btI2ktm/vB9HGjEVoQ2CwiIOrW+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761139574; c=relaxed/simple;
	bh=aeSnv2R+QvfgKhY4GETbAHxtHzvxRwrgVzVkc2LVmdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UQwpJaSE2mmw7GGCuQkTwL+3cet/NuzSWAEqVVVYFL5BvWPtKq0fuKs9A6PrSo+WOVPISMjV56Dxekg/EHACVT7vLT/VlIvarNcgSWdYoDPaEQJzaXydum0CAKFvhwOQ2T3NTkcrgEjzPh5cI/76HK/nhiDigFRzbFU5VagvrcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LENNzr/D; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-375eff817a3so75506441fa.1
        for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 06:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1761139568; x=1761744368; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dIa8OXN6SN0lvvT1+dcibGIeK+e86K1JnNlx8c4XPTY=;
        b=LENNzr/DD8faJQQQ2JtkNzcKaDS5OP1DUkYZ6lbW0Z5hgFhtarhqec7OR9jqSP5dh3
         0gejV8dGAyVC9DsL0yEcyv+JIQEp30oHDgw+Mh/gbKjTDNwFnA8TrSFYoo/dgmCtCIuY
         APJfpWyNvMhbZ/Z98v8Mv8jKzTgW92/9XzvwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761139568; x=1761744368;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dIa8OXN6SN0lvvT1+dcibGIeK+e86K1JnNlx8c4XPTY=;
        b=XcSON/cAWVwrT6L7VFeh5zI0wfOUQMr0jXFLZfrqapZ3K1qirOthP+wQGSMAPVdw/y
         +LnVj2mgmY07vtfwm1zUiKiTHHisz7qvvY+QSHanhZnievlYGQYUP6bh4Fcic0K6NknH
         cCbYArg7s3jbNnKv6Mh/VHNee9SN3BiI3pFfsaJH1i0o9uK5GT/i5G5bvzYjQdTARIX8
         Qb139HKxCFJhYjdqeaZ//cHUJo8twej3nKNlTyJoS4o4HcVuPirps7WENYunt1QZcZv/
         +6DVEgVlVqV/ri4B+gMGK02E09A+DxuzOWc/8VOqzaRKazFX51InuGW8vq5GDF5IMoLO
         xb4A==
X-Forwarded-Encrypted: i=1; AJvYcCUJSB2wW+FrmrM22oMoNVufvmetSfmEpbBL8C5x3dnvhsea0kYC4ALolzSIH6eaGF/NCQ3MNHoLF6hcmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzThqXsNj8Qu8UW1pVTKMCCx9PW0bmN3aruXC4oTtZktrMWGqOx
	0Gq0VnHPLrbmlSsRwG4riJxNzOWvcLALKGu/yT4Uy5lf2sjaVOIasPHzYI5ZlymM5NH+siuQ66F
	cpXjzIg==
X-Gm-Gg: ASbGnctfmyDR1RSDMmpAbJsxSVzI6r66FhKL9HUB+va998NQf5BW7RyOmRIMctmhs1E
	ZN99SwDddxg5oHW3qX/C82QQtO0RU+aO6XavtuwKnRw7ktc7PKNtdFslDukiRC0f8Xxt24wGv13
	/d46MV8tM8TvCUz4Kt0b5VMDEhEa4v171nBLanI5NBD1tDkBUwPSkZ4HlyOjlWwf7wE8Twjqx8V
	qLggk6Nf9gKO68+yjtrA816bvNoz/cNiBezskHst3CdPVzko/YvaK/9izi7FDg86hUH1nOmN+0V
	YT6lf2tJ6oaVcvKzHys8O++t3Rl1/v/gHuMH2GtZRqMUwiqwnnnwkcdNYpCEsy7zV7fuKwOsz8E
	yimuqZGsxi32C8k8hpDZI7UBUjE2l40RgWK8LWk2+hh4Ej97DYKG4WuDRp6apZVM41EtG+ackEG
	v8J49mvLrl5fgnJpXqrF8Q/sN0VR+QIDR4faiygnANWV/Q/zbw
X-Google-Smtp-Source: AGHT+IHHrtsL2E6YeCDf3y/VS/1zJgdcaJBBSRWLDqciXh5bhc6SGg7/qStIWMxA6LL+4YV4HxCuzg==
X-Received: by 2002:a05:651c:25d1:20b0:378:ca11:a25 with SMTP id 38308e7fff4ca-378ca1142bfmr8205151fa.8.1761139568405;
        Wed, 22 Oct 2025 06:26:08 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a91b7106sm39211041fa.8.2025.10.22.06.26.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 06:26:08 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-592f22b1e49so356795e87.0
        for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 06:26:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXZALug5t3DQ1NrTZ5PCSRBXtCLjyKMpC/hVku5797Zm9LXwR5XFvqzfktENlXR4fhXcUV0ADd19dvGVg==@vger.kernel.org
X-Received: by 2002:a05:6512:12c2:b0:587:7f2d:2580 with SMTP id
 2adb3069b0e04-591d85357d6mr7835358e87.32.1761139567504; Wed, 22 Oct 2025
 06:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-fix-uvc-v1-1-e4cd03606735@realsenseai.com>
In-Reply-To: <20251022-fix-uvc-v1-1-e4cd03606735@realsenseai.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 22 Oct 2025 15:25:55 +0200
X-Gmail-Original-Message-ID: <CANiDSCvc8ssEruBX+sRcn70dB-XkJie80nGGzvEy73++jTC3Dg@mail.gmail.com>
X-Gm-Features: AS18NWCARYb3Ee9APeYWCQm8P8GoE-Fvu3BrW22Lp7RL_ycBh0q5_V3w0hfycPo
Message-ID: <CANiDSCvc8ssEruBX+sRcn70dB-XkJie80nGGzvEy73++jTC3Dg@mail.gmail.com>
Subject: Re: [PATCH] change: drop 'Intel' from RealSense camera comments
To: yogev.modlin@realsenseai.com
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Yogev

On Wed, 22 Oct 2025 at 13:15, ymodlin via B4 Relay
<devnull+yogev.modlin.realsenseai.com@kernel.org> wrote:
>
> From: ymodlin <yogev.modlin@realsenseai.com>
>
> RealSense branding is now independent of Intel. Update all driver
> comments referencing "Intel RealSense" to just "RealSense" to reflect
> current ownership. No code logic changes.

I think it is more useful that the comments match the output of lsusb
than the legal name of its manufacturer.

What about something like this:

Realsense/Intel D415/ASRC depth camera

?

Regards

PS: The CI complain about two things, please take care of those as well

>
> Signed-off-by: Yogev Modlin <yogev.modlin@realsenseai.com>
> ---
> Since Realsense has been spin-off Intel, the comment should be change.
>
> Signed-off-by: ymodlin <yogev.modlin@realsenseai.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index fb6afb8e84f0..b1457678833e 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -3142,7 +3142,7 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_DISABLE_AUTOSUSPEND) },
> -       /* Intel D410/ASR depth camera */
> +       /* Realsense D410/ASR depth camera */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>           .idVendor             = 0x8086,
> @@ -3151,7 +3151,7 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -       /* Intel D415/ASRC depth camera */
> +       /* Realsense D415/ASRC depth camera */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>           .idVendor             = 0x8086,
> @@ -3160,7 +3160,7 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -       /* Intel D430/AWG depth camera */
> +       /* Realsense D430/AWG depth camera */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>           .idVendor             = 0x8086,
> @@ -3169,7 +3169,7 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -       /* Intel RealSense D4M */
> +       /* Realsense RealSense D4M */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>           .idVendor             = 0x8086,
> @@ -3178,7 +3178,7 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -       /* Intel D435/AWGC depth camera */
> +       /* Realsense D435/AWGC depth camera */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>           .idVendor             = 0x8086,
> @@ -3187,7 +3187,7 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -       /* Intel D435i depth camera */
> +       /* Realsense D435i depth camera */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>           .idVendor             = 0x8086,
> @@ -3196,7 +3196,7 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -       /* Intel D405 Depth Camera */
> +       /* Realsense D405 Depth Camera */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>           .idVendor             = 0x8086,
> @@ -3205,7 +3205,7 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -       /* Intel D455 Depth Camera */
> +       /* Realsense D455 Depth Camera */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>           .idVendor             = 0x8086,
> @@ -3214,7 +3214,7 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -       /* Intel D421 Depth Module */
> +       /* Realsense D421 Depth Module */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>           .idVendor             = 0x8086,
>
> ---
> base-commit: 552c50713f273b494ac6c77052032a49bc9255e2
> change-id: 20251022-fix-uvc-2937db31ca93
>
> Best regards,
> --
> ymodlin <yogev.modlin@realsenseai.com>
>
>
>


-- 
Ricardo Ribalda

