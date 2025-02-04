Return-Path: <linux-media+bounces-25649-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA8EA2783C
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 18:23:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 409E47A3832
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 17:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB0321639A;
	Tue,  4 Feb 2025 17:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k4AlSJeR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA4E215F5A
	for <linux-media@vger.kernel.org>; Tue,  4 Feb 2025 17:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738689796; cv=none; b=bohOBkMyg4jBh7acNU/bmrDhVAQOGpb3nReylbbM/z7IX5FBsrLWheaJ8kM2UGXP4TdK0SwDmKAhuGLijmQQc4XWb7qOTRvmMUINPgj3+yDBSDQTnEU636d750eShJyB8EaXBgJXB+Ud4ZE2heCo1bZUQCAMcLuw48h72pvEXSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738689796; c=relaxed/simple;
	bh=+Mc8NydDU1OM/dB7ToFbrdv1mQz3p3QgEZwtAF6rsQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nz4OEj+MvD1/0p437moOEX3fA8qyJp9wVjqG9h6O01wwny2MaLUZ9IlqSXKpg7c3rJKqy9xZKMkV4u8qs1Bk1E3Vg19puzZmZCaGnNEIE9i+y5TkDUaStyC+BBuAmhpGESFR68ayByXFYHU9pkf2zSr3OZEmYC1NkqiIJPx+m84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k4AlSJeR; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-543e47e93a3so6251564e87.2
        for <linux-media@vger.kernel.org>; Tue, 04 Feb 2025 09:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738689789; x=1739294589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5BBuYTzTxCxHlA89cur3oiUM9mGTbCPIm1uiSGbWU0=;
        b=k4AlSJeR2dphoTGgUNpeB1fA5uvgIAnc4y9wHikTtOEnP2htCv/3NHN2OLfILBNcJX
         kgCwcDdDmOchaWEGmoQ+mAlN9s/jc4oyitMBR2ml/n1hyjGwR12/fzkQusLZEY4UprTO
         s1+PBIDDJ3HirQzoiIs6URRvvletUQuPpDywQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738689789; x=1739294589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e5BBuYTzTxCxHlA89cur3oiUM9mGTbCPIm1uiSGbWU0=;
        b=PwrwLYKBSiRd9dXQu64AIaWnXjEVjA1r3/hLV9bYMw5iPG1vkupCwjeQ9Cfblc56Ic
         FI/AmqM+OddwTJgkTgQ1N3TTAg85eNhfkC5x8FKz8ys+XjuOrAhd66nwx8zbJ9EeXJtx
         JfRUjq2fooPbIVjwmfhL5RkFYep/OxbpvUJOIBebXu2vEwQcaZsXxl9o7ixmEEK+tup3
         haLV010Wn2w86eMRiujrJKR+9DCd02dh94ItGmQ5N/qPSJhsEYSAxAbIE1+sis4CWHCi
         7VOspjX3jxg9LE7ZUyfybjxCInF611ka6V3RyxdBOUKUL9fnCReJsaen8HMvR1LqBk0C
         mHHA==
X-Forwarded-Encrypted: i=1; AJvYcCW5OJemFz+WEcM7zdhwm7uYFOE7TxIlAB19rLsOtEqFEjqcVJFNFZDPbslC32Z59ITVtIuWH585R55wZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Dz7K346xQQ/R/Hu7LayXxJ+bwlnIYjoYOqmZsB7gF18V53ZC
	MpZKalXeY8W7+Ji1SUMKYFDLLej3b769ud1iZ+Kl749fqJFSLhycX506KcrjkT4OA+k/nbjOFqI
	SKw==
X-Gm-Gg: ASbGncvWSe/UEWqRbf/WmU8NthWyqs9a/l2JnHARLApw1blL+3jNqZjmYhB9neYEXOC
	IUmumj/P8PfnzfjKkZ6RQJ4213kgi2z+w6kfN9oQqGPQIcltnzaTNo4jOdIOQnUmAd0ZrErTxbU
	OuqzT/tz/ZCMz27j1wZx/+JCOrsstDUbcMOMzufJP7CSDFGBZwXK3KQDfAlCwwRJYgBafqUZJfu
	CdMHJ+Xrn9C+RAk11VLaukNnT1O1kfzRVk9DzI+zFieNnsLntxT/Z83r+HgBnUHwpvA3gzgkCFw
	8uqYHHbbA9BetrkGf6mvkypjAuuSmOKDnKHkyNDBrNh44wTYKpoKlv4=
X-Google-Smtp-Source: AGHT+IFOFrzBfsJ3TirjtMcl5l2sI9k6HL9iZtTLOv0XVSK6n1m0EVLWZGuKH/H2Zipu3dudqRb1jQ==
X-Received: by 2002:ac2:44b1:0:b0:540:1f7d:8bce with SMTP id 2adb3069b0e04-543e4c32c76mr6625584e87.38.1738689789302;
        Tue, 04 Feb 2025 09:23:09 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a309b250sm18968201fa.50.2025.02.04.09.23.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 09:23:08 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-543e47e93a3so6251414e87.2
        for <linux-media@vger.kernel.org>; Tue, 04 Feb 2025 09:23:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWIKAERVPYpi4VFdvqop3bzKohKxDaIVgIfL/9VfK0VDrAYEB0tTDzS4mt84u47c66IR+XwFPAtuVl/Gw==@vger.kernel.org
X-Received: by 2002:ac2:5211:0:b0:53e:3a22:7a2e with SMTP id
 2adb3069b0e04-543e4c3fcf9mr7317073e87.47.1738689787581; Tue, 04 Feb 2025
 09:23:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129-uvc-eprobedefer-v1-1-643b2603c0d2@chromium.org>
In-Reply-To: <20250129-uvc-eprobedefer-v1-1-643b2603c0d2@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 4 Feb 2025 09:22:56 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XDUmo=OEFtoOt6vkpCVQ628QK2xX8+PBnqJVvj0y7pug@mail.gmail.com>
X-Gm-Features: AWEUYZnrPiry48nd_-swhnr9bFmRqR2dsreF7sUVpPQTg7S8Rc3CqXimX23DP7c
Message-ID: <CAD=FV=XDUmo=OEFtoOt6vkpCVQ628QK2xX8+PBnqJVvj0y7pug@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix deferred probing error
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jan 29, 2025 at 4:40=E2=80=AFAM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> uvc_gpio_parse() can return -EPROBE_DEFER when the GPIOs it depends on
> have not yet been probed. This return code should be propagated to the
> caller of uvc_probe() to ensure that probing is retried when the required
> GPIOs become available.
>
> Currently, this error code is incorrectly converted to -ENODEV,
> causing some internal cameras to be ignored.
>
> This commit fixes this issue by propagating the -EPROBE_DEFER error.
>
> Cc: stable@vger.kernel.org
> Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/u=
vc_driver.c
> index a10d4f4d9f95..73a7f23b616c 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2253,9 +2253,10 @@ static int uvc_probe(struct usb_interface *intf,
>         }
>
>         /* Parse the associated GPIOs. */
> -       if (uvc_gpio_parse(dev) < 0) {
> +       ret =3D uvc_gpio_parse(dev);
> +       if (ret < 0) {
>                 uvc_dbg(dev, PROBE, "Unable to parse UVC GPIOs\n");
> -               goto error;
> +               goto error_retcode;

FWIW, since you're specifically considering the -EPROBE_DEFER case,
it's probably worthwhile to make sure that dev_err_probe() is called.
That eventually calls device_set_deferred_probe_reason() which can be
helpful for tracking down problems.

It looks like uvc_gpio_parse() already calls this if gpiod_to_irq()
returns an error code probably you also want to make sure that
dev_err_probe() also gets called in the case where
devm_gpiod_get_optional() returns -EPROBE_DEFER. In that case,
potentially one could also get rid of the uvc_dbg() above.

In any case, IMO even without those changes your patch is still worth
landing. ...and maybe my suggestion should be in a separate follow-on
patch anyway. Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

