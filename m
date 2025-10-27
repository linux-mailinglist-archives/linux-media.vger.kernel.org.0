Return-Path: <linux-media+bounces-45633-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ADFC0C36C
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 08:59:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 63EB64F1D56
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 07:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 566D02E5B0C;
	Mon, 27 Oct 2025 07:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KqHI9Mfl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36D22E5407
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 07:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761551854; cv=none; b=tyiF8Cvd2c86ddDubz8WPNu130yzug3OKCTy22sQ5qXKgyHx5X9nIccqPa2I1hYQlbM2CEeilg98qRqnBTu8aMrVYRN+LIdIjGYY7gwVZ8cZyHy955+jowoZcXaIlHbz2SbHSSE3Z3JM0UGb4jUk3f4gbcHDs06BYN5nk00pplM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761551854; c=relaxed/simple;
	bh=Z1okCuulMLIr1YTQJjrqsE4HKq0fhd6AoRVUWKoq970=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f5eruMgw9cYX4jEz8w6u80mw7y4lP54ORmDm0QJNumHZaEeRyi6z9+xnWB4Fnb+hVxuYUyAh0YvbBtnpvcxfRQWHy6jVS9hRaBdEx1E3uiw8YGNMpFeRsnEvgpQFOBYf8xY+0tm3VQcyN3zh1ong5wHAzh9OkIPuTd8HdCvxAIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KqHI9Mfl; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-591eb980286so4459963e87.2
        for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 00:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1761551851; x=1762156651; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ayv+21ceSp1bYlkzspFJkEJSM3a78Z5afjxNdRx5mpY=;
        b=KqHI9MflLL6rhxXRmmhN8cCDpF1OhBONpUcgsCZyAOJtPauJQsFt1gH6jY/1m3pRsv
         1prLq+PszT25li4BJ5qp9KwBXchLGS5D7MdJ/a8t4A3Ps1/S2cEzDYyuatz+6fcsJgTW
         xJTyzk1L7vdN0htVBTv2BVjT+HPjvxaE+zWfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761551851; x=1762156651;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ayv+21ceSp1bYlkzspFJkEJSM3a78Z5afjxNdRx5mpY=;
        b=qN6FTP+NPkkCTnMybQXbkx6Y6NpWDrIodEPgBsLP+9L7D+/LtWps1M5j9PhOlvLLfo
         4vZQm1pBA60Dmg7h8DapGc/rHSiSehmX6ckBsKeBnHBwF3CG49b/MKAkIBEXOXtcJP3i
         joTh9GTA5ExSnv+uDCskkZImAkDpWnBqnR95EuC4pGFWJwiV2enozp6IPzW4EXPsKIc/
         OJ8QWLbJ/I2g1ixqYqqpHVG0FKmkQ2lEL8UjXCX6u9ZEo7kGGhqE4EONt7HnxVwQpsCF
         gZlO9ml8POkTiRjh5KyNbv6WWP05+xK7JHSQY1SFdsJLLFLBiBYq9jXYyDkgDVe4idyH
         9T9g==
X-Forwarded-Encrypted: i=1; AJvYcCXkvbHtYI0+S8yspq+gfKYNBYTO6PXvo/ad7HWbfP/3PqfW0iK6EtdHBNRnoq9T9xcc+P+DbzLZLCkkUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ5b71w7lYPQOlsyVVAqBvewLD59PiC7XbjfWol3a/GAm3Oyk8
	dLLmn9RD38AlyOGWgaNydfPR9+Q1RJ21DnVXVyCa7sSjI/iC+ihKJPvfYT/z97GQXvZkawe0ier
	G8YY=
X-Gm-Gg: ASbGncvKkCyuPHE6i7sCDAVDxtHG3k5WommWqlCTHoUDWYJw2pmWwFa+C+rZct+Ia9J
	RZ/+iWdv7DUGWM+pevzUhfImYpS3m66eDD7dJsOHjTe9Vbnp9SYpFdoMPI+CKd/AuomTuBoc/KY
	SKxAc7qeKpy+fJT4mCqKNAItSwqVF6hsLN1zAw9u0nWHtaMD6N0V+BQKGxJJ+CFn1G6GLoW+pYV
	3ln4lxq7Pjo+UhxFOPCIaHKPO7xWgB0oTg+9uPYmTgGqdDfNRc1tYVoVAcb9Sli1ceTOP+nTi2v
	qi7NuP+YDn7da8eQB2BOIHfN1LElajjQ3MhI/XXLp0Pi5ybUNNfantDm39SqhcGSBq1fXdUpyAQ
	VMA1XwXexeuCdkQY7DO2IVc/vO3XmWZI4DCscnSvEC/yMXk52rygIe1FQ6skIaBVIQZ5kFf7iiT
	iAtPgZ2qOSot+cMKWma5PJgP27lAYXKJ8aN24oGmQErw==
X-Google-Smtp-Source: AGHT+IHvY+fqv76/LYQ5XZYfKiFIVXl67Ozy3AQYD6PJekCrdjGRtUvWR5B9ib+AkLJxmu5u9Fbung==
X-Received: by 2002:a05:6512:159b:b0:55f:6fb4:e084 with SMTP id 2adb3069b0e04-591d85739edmr12476478e87.50.1761551850983;
        Mon, 27 Oct 2025 00:57:30 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f41bf3sm2119944e87.20.2025.10.27.00.57.30
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 00:57:30 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-378e603f7e4so33054301fa.0
        for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 00:57:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXWi9qq0cab3b5rJoI9mphtc7yeQSd5YqTV8nHBxtz72fXTuPwYsQjgPXPpddjRX2AmjM2wyVDLMTFrkA==@vger.kernel.org
X-Received: by 2002:a2e:b8d6:0:b0:378:e108:7b5b with SMTP id
 38308e7fff4ca-378e1087e28mr31341341fa.5.1761551849708; Mon, 27 Oct 2025
 00:57:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251026-fix-uvc-v4-0-610eb1329600@realsenseai.com> <20251026-fix-uvc-v4-1-610eb1329600@realsenseai.com>
In-Reply-To: <20251026-fix-uvc-v4-1-610eb1329600@realsenseai.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 27 Oct 2025 08:57:14 +0100
X-Gmail-Original-Message-ID: <CANiDSCshOoYXh_HzCQyw_NMKs46vXb1LQhtwhM-OK7z7yz_nvQ@mail.gmail.com>
X-Gm-Features: AWmQ_bk_LATzLIgwIcd_8DVJum-MIVKytMBTGVubUq-bnzBKxTtqI7cwC8Qub7A
Message-ID: <CANiDSCshOoYXh_HzCQyw_NMKs46vXb1LQhtwhM-OK7z7yz_nvQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] media: uvcvideo: change comment to 'Intel RealSense'
To: yogev.modlin@realsenseai.com
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 26 Oct 2025 at 17:43, ymodlin via B4 Relay
<devnull+yogev.modlin.realsenseai.com@kernel.org> wrote:
>
> From: ymodlin <yogev.modlin@realsenseai.com>
>
> RealSense branding is now independent of Intel. Update all driver
> comments referencing "Intel" to "Intel RealSense" to reflect
> current ownership. No code logic changes.
>
> Signed-off-by: ymodlin <yogev.modlin@realsenseai.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index fb6afb8e84f0..dbdacc64ea6b 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -3142,7 +3142,7 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_DISABLE_AUTOSUSPEND) },
> -       /* Intel D410/ASR depth camera */
> +       /* Intel Realsense D410/ASR depth camera */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>           .idVendor             = 0x8086,
> @@ -3151,7 +3151,7 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -       /* Intel D415/ASRC depth camera */
> +       /* Intel Realsense D415/ASRC depth camera */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>           .idVendor             = 0x8086,
> @@ -3160,7 +3160,7 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -       /* Intel D430/AWG depth camera */
> +       /* Intel Realsense D430/AWG depth camera */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>           .idVendor             = 0x8086,
> @@ -3169,7 +3169,7 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -       /* Intel RealSense D4M */
> +       /* Intel Realsense RealSense D4M */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>           .idVendor             = 0x8086,
> @@ -3178,7 +3178,7 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -       /* Intel D435/AWGC depth camera */
> +       /* Intel Realsense D435/AWGC depth camera */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>           .idVendor             = 0x8086,
> @@ -3187,7 +3187,7 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -       /* Intel D435i depth camera */
> +       /* Intel Realsense D435i depth camera */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>           .idVendor             = 0x8086,
> @@ -3196,7 +3196,7 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -       /* Intel D405 Depth Camera */
> +       /* Intel Realsense D405 Depth Camera */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>           .idVendor             = 0x8086,
> @@ -3205,7 +3205,7 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -       /* Intel D455 Depth Camera */
> +       /* Intel Realsense D455 Depth Camera */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>           .idVendor             = 0x8086,
> @@ -3214,7 +3214,7 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -       /* Intel D421 Depth Module */
> +       /* Intel Realsense D421 Depth Module */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>           .idVendor             = 0x8086,
>
> --
> 2.43.0
>
>
>


-- 
Ricardo Ribalda

