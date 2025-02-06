Return-Path: <linux-media+bounces-25725-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB91BA2B16F
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 19:41:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3CD718844BE
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 18:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A78190477;
	Thu,  6 Feb 2025 18:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a94DQrux"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3CC19F13B
	for <linux-media@vger.kernel.org>; Thu,  6 Feb 2025 18:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867252; cv=none; b=NeZoCtBWgE3Y21Xfz+CVkCQOAhxgI2oSfH934eY9hWQtU5iiMr4pp0iF2CoxgaIkPtR1N9wAhn+KGmHpCQztF+BUlh2+pGWedLsVJNEe3cQkU1weaG0PqDeCzYmbewLtySGDjNNhnDBfqfczafZpPVZQcwK8QuMc4NCLb7OpVwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867252; c=relaxed/simple;
	bh=Lf6xAoUU7NXYgLYtGsalOIOw/EEkhs0Vm3ezNCm6rGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o5kULp5IpqJR1TFQFVbT/B41ggf46GjTK1lbgKFv5POj7m8GJzoKX7/YIPVk6TyvsKmvSYvHU/3p7M1ws3f8L9reVAso+OQeoRd+Jd1stMLDzMn9WI4cAD7SVQ5UuyWfol7QsGXNlIDZjtn61UNTaE8ekupn1hH5FIYgAPZ2AYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a94DQrux; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30615661f98so13649931fa.2
        for <linux-media@vger.kernel.org>; Thu, 06 Feb 2025 10:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738867247; x=1739472047; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/1KLNT4FmOlGoDXvAF/z9DFY3XvpbckXqXugGtWIbQ=;
        b=a94DQruxT7agE1iI+jz5k711GH1Zt4b/y2JJsktdmNJl7WbFdm6QLTYYEUMK+sVzCR
         CAokLQaiB+G5a84ZlH570s4hQxAbrdvHpeavR1ywQrJPl1pRV3Q2D4nxNa/8OXOnHf/6
         KdY3MjspdQmYzx7gY0aN+sO4auX78zYm71TbWyqbCqUna5mHb3I10GUP9AQpX2EQ6TEL
         p64pBZrWC0nyAc6+sqUw/nPDDQOZRHZ7s6rZlYEidrKXr746QH1364cJmGtl+TXBeGFq
         9ugkeEn08pbgCHOYxCYyLDUL1MHqzJjq3c17Z7iQR2beh26uOGMYROWj7UZsmC7Jl6n9
         60Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867247; x=1739472047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/1KLNT4FmOlGoDXvAF/z9DFY3XvpbckXqXugGtWIbQ=;
        b=t0bYmd6seQ6rpC26Z/CWh1TPPO3jdRNkUiUFPNgAQPqPEtpv+gWfHmpLPodCV/xGwe
         SpRdQXweGiSqR3ELuGscvB9EoQIHAI2QEo5m09gf6Pg5Fy4wmvq4G5HuyQU1l4zHdUB9
         DJKCWW8RrRiqLR1gT+4apgPwrFtUraJiO7gWUDwc7OTA3h9PIPFuZKoGOxEjb1VluUPf
         0VHcvIFXOlJOb6DHnZ6E5uENoJ3pRtwxYzt4afbfUb/tnzfqoqiwP7GI7fxWqn4u7sAt
         p2fne9ODR8Qa86+y5nV3RQ5AnAmFmxAotY4jWvUKR2CwOY0PHzl58G4vBlBUCpLiX0LN
         0JpA==
X-Forwarded-Encrypted: i=1; AJvYcCUaIVR8JLA5hKk24HklTF0BR0AT4Fj0UmwsBUE5ROnRvTGVCLbIQd92SUr+ojUpHapYtkSc6j1VqlNhbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwK99oiET1SVzQv4aucWMRRPvYWrr1+vhoH/h8KBzy1HXAQiu58
	gEI5ae0yVZg3wc4DMSinV4l/Rzj20yY6+Zfyj/j0BMYkXXfaSUAEmK652OkEYtU4qJ5xAHVCStD
	37mke9PyX9E6Hn5yUF86LKGW9cfZcLgsZXyqrPw==
X-Gm-Gg: ASbGncu9uEo9JprlEUO2dN8zqiqBMsMuyc2uTm64mSOMSqTzYaQG9sKBAwnDU8adw5B
	nKtr8Mhe5pdGEE6hpIfnSyvCVtj9h3YpO0NJYiRLU6H2z3oGKWBj5hsPzqLOsukekmZL7rW8=
X-Google-Smtp-Source: AGHT+IHspHnGQVYfpoYQGi9ctVZueJrpds613XgEY1o23R9cbS1fqYkeI3XWSr+wkrN1AUux/D6h/Xqji3ktxx+ndmY=
X-Received: by 2002:a2e:bd8b:0:b0:300:38ff:f8de with SMTP id
 38308e7fff4ca-307e57fd2f3mr198711fa.16.1738867247273; Thu, 06 Feb 2025
 10:40:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com> <20250131163408.2019144-11-laurentiu.palcu@oss.nxp.com>
In-Reply-To: <20250131163408.2019144-11-laurentiu.palcu@oss.nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 19:40:36 +0100
X-Gm-Features: AWEUYZmtqR_uDonJm17O7Egr0R6Qg4Q94CdBZrZSOSqXSwlcXN7zzDhUzAF6Dck
Message-ID: <CACRpkdYo9690n57FYAM1heSU+zGTKuze8B3d+Q4Py=HJr34-Eg@mail.gmail.com>
Subject: Re: [RFC 10/12] staging: media: max96712: add gpiochip functionality
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurentiu,

thanks for your patch!

On Fri, Jan 31, 2025 at 5:35=E2=80=AFPM Laurentiu Palcu
<laurentiu.palcu@oss.nxp.com> wrote:

> The deserializer has GPIOs that can be used for various purposes. Add
> support for gpiochip.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Since you are using CONFIG_GPIOLIB unconditionally you need
to add

select GPIOLIB

in the Kconfig for this driver, or the autobuilder will soon start to
spam you with compilation errors.

> +static int max96712_gpiochip_probe(struct max96712_priv *priv)
> +{
> +       struct device *dev =3D &priv->client->dev;
> +       struct gpio_chip *gc =3D &priv->gpio_chip;
> +       int i, ret =3D 0;
> +
> +       gc->label =3D dev_name(dev);
> +       gc->parent =3D dev;

I don't think you need to assign parent. (Default)

> +       gc->owner =3D THIS_MODULE;

Or this. (Default)

> +       gc->ngpio =3D MAX96712_NUM_GPIO;
> +       gc->base =3D -1;
> +       gc->can_sleep =3D true;
> +       gc->get_direction =3D max96712_gpio_get_direction;
> +       gc->direction_input =3D max96712_gpio_direction_in;
> +       gc->direction_output =3D max96712_gpio_direction_out;
> +       gc->request =3D gpiochip_generic_request;
> +       gc->set =3D max96712_gpiochip_set;
> +       gc->get =3D max96712_gpiochip_get;
> +       gc->of_gpio_n_cells =3D 2;

Isn't that the default? Do you need to assign this?

Other than that this looks good, so with the small fix above:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

