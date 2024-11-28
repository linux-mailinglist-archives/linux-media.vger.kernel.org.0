Return-Path: <linux-media+bounces-22241-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D47C09DBB94
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 17:54:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99F93283CB0
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 16:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1611BE86A;
	Thu, 28 Nov 2024 16:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BA/lC8tw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EEB1917F1
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 16:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732812850; cv=none; b=rtRguq8SZgUQLuCxFQDdEh9SCEBQPazbWVLupTBKZ0C34YMeaic7ZKO00ddV0/EbZxVpS5cIVZoRbqzt/XVxbPQEBEH76puQRMGhkwyv1tMvXuVNineioIB6gphdbGxQbpvFywKDTwo/GihzhTnlIgU8ZuIqJSq3G5n/goVGR40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732812850; c=relaxed/simple;
	bh=xAAaP9PO0VFDO1BgWN3xrErREZRhLwRsoUn6gkCmSQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iG83pNUA8wjMR24dIVEpbpOvmQ+VMqKIQcv2Lh5LhvNtNn6bkaiw/uT0EU26Dfj7gjeP5m6rDAxlpQxzsfS3Okr//FdxlsRaasyIQIdtXH9tx1kvSRWA0eipXid4cN++dF/f33LV49ifBZ3dSSfdzSBYEDmPi4gupUr9ljgXE/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BA/lC8tw; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-51526b9e341so271528e0c.0
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 08:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732812847; x=1733417647; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OLqMWnrpYT/DpZTSK5SRM6TlKLRMb6Wk83UxaPKXzw=;
        b=BA/lC8twBdo78Fk0AeR23vBmjDjbPHJAdnmKaOxZnY/hdiTPBiDY1E8IrQOsvwVI3K
         SN/Uv/DGdb4cfkD9TXWufypgDzj81whe3CMwlc0z6JhkV5cvMEsSeJQwX+1r3i+oJfj4
         qCuH4W5JG6V8a/p6+MTO74dEE6daj8UgASDWWR9rV/4qMZidKwH9pWI6mvAvv7thCsMs
         AO8bzL4296KC5vbJGj6nkVjQcBiC0SDufkiL2Sm337uGTp5H5JDzAi+HwxRziqvaHWQJ
         mFkZpFMCnXWi4hWF8JxmwMUrNsiInANzQBcWyjuNZaEI8ebuMoJhyvNZvklXssNadVwN
         2Etw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732812847; x=1733417647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1OLqMWnrpYT/DpZTSK5SRM6TlKLRMb6Wk83UxaPKXzw=;
        b=rcvHWi1jZJcXNJhqkw0mPQFfBfNplaZGuSZ3QDThrtqWLGVOizTBoekN+Kb5R9eKqF
         99z2o2omtN1x465auj1WNlVaCe1F00CNagu4PrPguXdiVRQFVt4F6zd9m4cLAvN+JO4f
         5iqYFuqGlWj7hvhMjpzEZXQgczCzTclZ0Weup2njV54u852VVrDtR1PzaI4oZjFBWbgF
         4vlTfYCPjAC/2Til9iEHCk2sOuNUqB9IfcatEDteTjhpgsm5nkBFSrSUeUVQw8ApQH5u
         c4w+iz0k/ORHaqB2c7U21pAXgJODHreAlBJ1Sm2qRNLkiha/14Xftv6aUvkc7rO1YKow
         Kx3A==
X-Forwarded-Encrypted: i=1; AJvYcCVijm29aKlKiN+UnfSjJjmkG4BsxEhcESeA29rxkmJIuKxYLkvBSorHQXxi9qIr1Uc49OY61I1DbH85kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTk8tGrCYeE8HvpEZUstRSUQ7MeErbzKzAlsngbfuWUsZoUnLd
	dGzYVrKIpdIw/QvmiNKvw/3eTVqnc+kZAb22PnYISEi8Mj0ALODvLG2hxEzPMmw3qUtbPamqb0J
	HwreBprdTp/K2Npwj7CocA5ByZbw=
X-Gm-Gg: ASbGncvPDMkVLK/RtMpme5dmX4NkW7+J8kgmSYnH9ixaEPb/booSB6iSfrYFg5XnuCA
	gIgPGrqD9SMara9Ouw6K5AsaZI+aaAQ==
X-Google-Smtp-Source: AGHT+IEGdsyyMLjjTOA2MCi8xn3jimZDODH1G/8GiuhpoCjhHp4Z67K8diOmwetpAmnEJAEPybdr9jErZiVPEoq/PUA=
X-Received: by 2002:a05:6122:2009:b0:50d:7a14:ddf6 with SMTP id
 71dfb90a1353d-51556a12036mr9987230e0c.10.1732812847573; Thu, 28 Nov 2024
 08:54:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241128152338.4583-1-hdegoede@redhat.com> <20241128152338.4583-4-hdegoede@redhat.com>
In-Reply-To: <20241128152338.4583-4-hdegoede@redhat.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 28 Nov 2024 17:53:51 +0100
Message-ID: <CAPybu_3dbFxTd3GF+_dfwEnVtmUiZsZ+bsyPqh9+G4m+nHHkxA@mail.gmail.com>
Subject: Re: [PATCH 3/4] media: ov2740: Add powerdown GPIO support
To: Hans de Goede <hdegoede@redhat.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2024 at 4:24=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> The ov2740 sensor has both reset and power_down inputs according to
> the datasheet one or the other should always be tied to DOVDD but on
> some designs both are attached to GPIOs.
>
> Add support for controlling both a reset and a powerdown GPIO.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Ricardo Ribalda <ribalda@chromium.org>

Same question as before :)

> ---
>  drivers/media/i2c/ov2740.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index 998e1977978d..14d0a0588cc2 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -525,6 +525,7 @@ struct ov2740 {
>
>         /* GPIOs, clocks */
>         struct gpio_desc *reset_gpio;
> +       struct gpio_desc *powerdown_gpio;
>         struct clk *clk;
>
>         /* Current mode */
> @@ -1306,6 +1307,7 @@ static int ov2740_suspend(struct device *dev)
>         struct ov2740 *ov2740 =3D to_ov2740(sd);
>
>         gpiod_set_value_cansleep(ov2740->reset_gpio, 1);
> +       gpiod_set_value_cansleep(ov2740->powerdown_gpio, 1);
>         clk_disable_unprepare(ov2740->clk);
>         return 0;
>  }
> @@ -1320,6 +1322,7 @@ static int ov2740_resume(struct device *dev)
>         if (ret)
>                 return ret;
>
> +       gpiod_set_value_cansleep(ov2740->powerdown_gpio, 0);
>         gpiod_set_value_cansleep(ov2740->reset_gpio, 0);
>         msleep(20);
>
> @@ -1348,9 +1351,17 @@ static int ov2740_probe(struct i2c_client *client)
>         if (IS_ERR(ov2740->reset_gpio)) {
>                 return dev_err_probe(dev, PTR_ERR(ov2740->reset_gpio),
>                                      "failed to get reset GPIO\n");
> -       } else if (ov2740->reset_gpio) {
> +       }
> +
> +       ov2740->powerdown_gpio =3D devm_gpiod_get_optional(dev, "powerdow=
n", GPIOD_OUT_HIGH);
> +       if (IS_ERR(ov2740->powerdown_gpio)) {
> +               return dev_err_probe(dev, PTR_ERR(ov2740->powerdown_gpio)=
,
> +                                    "failed to get powerdown GPIO\n");
> +       }
> +
> +       if (ov2740->reset_gpio || ov2740->powerdown_gpio) {
>                 /*
> -                * Ensure reset is asserted for at least 20 ms before
> +                * Ensure reset/powerdown is asserted for at least 20 ms =
before
>                  * ov2740_resume() deasserts it.
>                  */
>                 msleep(20);
> --
> 2.47.0
>
>


--=20
Ricardo Ribalda

