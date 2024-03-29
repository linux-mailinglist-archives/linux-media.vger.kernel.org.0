Return-Path: <linux-media+bounces-8236-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB3B8924DB
	for <lists+linux-media@lfdr.de>; Fri, 29 Mar 2024 21:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5ED5228598C
	for <lists+linux-media@lfdr.de>; Fri, 29 Mar 2024 20:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 568C213B58D;
	Fri, 29 Mar 2024 20:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W9YG10t+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A571DFC4
	for <linux-media@vger.kernel.org>; Fri, 29 Mar 2024 20:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711742775; cv=none; b=WLMVHPJsjCittQqrEMUMl8EnSpBu0e494F97IMLa4LgV0bi/BwS7Slw4Hu5xwPzFYcaUiXxCNhRY49gM9LNEswcgnnylIaHbhJYwPVi4sHCrjPtfnDE8BgeF4VHCrSZb1ddELY3SRRXbxFjrosqnCwccv8p8MN75moidB1nH6xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711742775; c=relaxed/simple;
	bh=JVZETo+D+/j7EHIklh7NmOhv6pq+zB/Xpv/SD0UOxqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AjcwEH8Q+iZgurvGVhRn7HijCx8t53YFNb3Y/UzMSeFBnkwhUTketOnicxg5opioCi8gfGg6yKpqqkuHFIg+jjPEPnraAHbteOe0mX+bfj6TwO1y82rWH2WF27d+uL6v+raHVFXXv6JOwQ15Kbajx7ZpphuGII+XfdrCC04lROw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W9YG10t+; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1deddb82b43so169715ad.0
        for <linux-media@vger.kernel.org>; Fri, 29 Mar 2024 13:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711742774; x=1712347574; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ME6h+FGwPpoiLOPiIo4YgT09yOaLcy6hI+xIBJNUDPM=;
        b=W9YG10t+7pwz6BOmK1XHYelbbZhXeahyHAR83K6yeYKH/XEtEzLjkOvVtJa6iic0nq
         PkhGRSsdtbtLND28Eh6xfW7cefd4yjSK0TZuRdrAJwWbTZvpV6Dxf9+KO462qCUDb9pL
         swTNWIHfVLLKpsXcTLELNPBm5S9Ws4B6gZ3QPsO91OKd7lm3hsVBKLcb7ZEIkUBwAfTJ
         L/xIA245KgmcsUMxqyETGNPVLEze1M7Ka08uE8yztk8OdXUahdX2mc/kVdIZM1W4moZ4
         spgXo1m2Q6WbNqGFH/Hel+OFkPmK7KuJgUN363Opc6e64Y8xlbBVTh/f8PtTrhjM8isP
         wf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711742774; x=1712347574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ME6h+FGwPpoiLOPiIo4YgT09yOaLcy6hI+xIBJNUDPM=;
        b=C1ZUx0AJNDA0DllFEASz7z74Sinp710i8B5Abmr+XGa8TduIwBXsk66irZmhX+vltC
         KAt1VBPmwQqF2Ymw2zKeffStMJtmpy2eutjKRCdmTGD/Y05plCDj1Tw8ZJboW7TSinhy
         dbsEW83YR5c3RHCgyCxN/IZDF9ipp8e8takx3bewk+2NLh38DEa6cW1l7Ixl7p+Su/66
         X3jzOy+Cxtlm6TPOUKjMg02W/OGos0pFpxH1NGxRu6PbBkAGkCXZIwcRJxHGLAvLdlva
         IBWcT8YisqtgKd4WzFkbMwrzV8rtd3oOvhdJNsgkYD3JzWG1e7JY9ott41Sp4Aurn6dC
         U3kw==
X-Forwarded-Encrypted: i=1; AJvYcCUVs9MOb8QBTPWuft9s/QkGY0RH6y7CbEnowq2QeBZaNPHhDz49f8kKcPTo5N5AhrtPpzZ2vfeA8KtXoG4+FBK4Lsimq/psLULOUlE=
X-Gm-Message-State: AOJu0Yx1uAaIBD6GGf97yk8yGG77JcXrfkJo2k3H7EF7XbEn5I/sBieP
	2PE8KYHKo7tt/lODnfH2btsxX/+pcYmMMYMR/x5POb0R7Lfm2WSWh+crWpBQlQ==
X-Google-Smtp-Source: AGHT+IFadMcTqCENqH+IwvG7y9B7d3SQmXd4yfvo+gKLzrDANhZAHeI8x8Ishtr16ARjGSFR5NV6Kg==
X-Received: by 2002:a17:902:dad1:b0:1e0:bc5e:5ed7 with SMTP id q17-20020a170902dad100b001e0bc5e5ed7mr218138plx.21.1711742773197;
        Fri, 29 Mar 2024 13:06:13 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id g29-20020a63565d000000b005f05b06229dsm3279633pgm.41.2024.03.29.13.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:06:12 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:06:08 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 02/18] gpio: cros-ec: provide ID table for avoiding
 fallback match
Message-ID: <ZgcfMGaUdRAF3ual@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-3-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dZbc6vNr4SmSaBx6"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-3-tzungbi@kernel.org>


--dZbc6vNr4SmSaBx6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:14PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.  Also allow automatic module loading by adding
> MODULE_DEVICE_TABLE().
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/gpio/gpio-cros-ec.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpio/gpio-cros-ec.c b/drivers/gpio/gpio-cros-ec.c
> index 842e1c060414..0c09bb54dc0c 100644
> --- a/drivers/gpio/gpio-cros-ec.c
> +++ b/drivers/gpio/gpio-cros-ec.c
> @@ -12,6 +12,7 @@
>  #include <linux/errno.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_ec_proto.h>
> @@ -197,11 +198,18 @@ static int cros_ec_gpio_probe(struct platform_devic=
e *pdev)
>  	return devm_gpiochip_add_data(dev, gc, cros_ec);
>  }
> =20
> +static const struct platform_device_id cros_ec_gpio_id[] =3D {
> +	{ "cros-ec-gpio", 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, cros_ec_gpio_id);
> +
>  static struct platform_driver cros_ec_gpio_driver =3D {
>  	.probe =3D cros_ec_gpio_probe,
>  	.driver =3D {
>  		.name =3D "cros-ec-gpio",
>  	},
> +	.id_table =3D cros_ec_gpio_id,
>  };
>  module_platform_driver(cros_ec_gpio_driver);
> =20
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20

--dZbc6vNr4SmSaBx6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgcfMAAKCRBzbaomhzOw
wrsVAQCbmcMHhqo3HMCc1DY+LRw0jrWTP50JPwOqZsPjGwy82QEAu8/TS+FucMH8
GTihTZMhngYGKB4GIJj5N6Y9bkNkogU=
=WVNx
-----END PGP SIGNATURE-----

--dZbc6vNr4SmSaBx6--

