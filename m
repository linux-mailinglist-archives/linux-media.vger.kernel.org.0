Return-Path: <linux-media+bounces-8245-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A83892510
	for <lists+linux-media@lfdr.de>; Fri, 29 Mar 2024 21:16:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4360B233D0
	for <lists+linux-media@lfdr.de>; Fri, 29 Mar 2024 20:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8665A13BAE5;
	Fri, 29 Mar 2024 20:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P/dvOtaC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590C213AA3C
	for <linux-media@vger.kernel.org>; Fri, 29 Mar 2024 20:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711743396; cv=none; b=tRHB/VLIQqZ2ehhaOBkXydxLZTC+bcyE9xgrWsb+e1Pz33k2cgGOrIFJYZY4YczRdBA81dIaoncXKa9Hg2kJZONinKPcmVnGJjwMn2uhf/X+UeZJqdYjIU4QkrZAdBjWQbiOetVTL44R+5VD77mVRkY9XfqJKl9Gwgfq+5MMOvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711743396; c=relaxed/simple;
	bh=iurDl9jNzThi2nWfJN/vDf4QGMwJVgsII7gq9vDVmOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ya3sTDEZMquzoolysCSVxYCMHFrEmoTCbByt2giUDSQAwjWGru7lrzuFZBIpCD0E2QHMjlQ8HTbPxtLwr+CIuqoRnsvZQaiuxD1UWrEDy81tjlZahAN+7xy7hgh29cHojpBKaQHocUfa6YenzZ2F0TNU18YfSx8kjf7cBy5S+5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P/dvOtaC; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1deddb82b43so170955ad.0
        for <linux-media@vger.kernel.org>; Fri, 29 Mar 2024 13:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711743394; x=1712348194; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Ug/Nx0Nw3Mb6s6W+35FMxXK5lFsNQqLVjSaEYeIaBk=;
        b=P/dvOtaCS6LJpPsv6t7EV6TFH9XChno+pf225TuhMEGlugVgNHC56h9r8cVac5uEYM
         hiMbyUjrqZRoXQAxuOVkePm1xTupP/+tjbSwVouw7kgM7Z8S+NUVWbvZ3FYY0/+d7y4k
         Jylsd9fVxgbGJHY5uC/tl/c6xScK+AiKaPEHy629lLRffe9ynXUuNzs4zOm9TF32WbDJ
         NLA6vlaS1yYSSetuWxKGuhOKh7yNWQVWzC07wNgwKgdh0rFA+XuoUFvXLzRwpGbrp3y8
         BYgQA5bWhTg37F1iV0dviknPgaba5wItjQYvpnXibW4DZqWW5RtgT9OsZZaNn4x3ZnVP
         8wbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711743394; x=1712348194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ug/Nx0Nw3Mb6s6W+35FMxXK5lFsNQqLVjSaEYeIaBk=;
        b=jIxjB59ocNLUc9D9xTJkMEurLBQmiHyhn7Avf6T5dL5HItLBipaqqcPzggwa6H/hte
         UqH1GC0EdmhZzUy+WiU/ZcV2j3YsKz2ZzSJNnmbA1b/ws7NrPg7JHjAT0soxJRDOpRIe
         sM6VYGYU7sZiByWwWlOeF0tS8Thiyz7C7nmiL7Ohz6eDhbJtvbh33lvwak6SCaNaYdmD
         KyQ7BrcRY7p1hjZrquB/+hSRcG9uGIzgeWd5b73SNoAqxHh7MMxCAoXLzEbjvHveRaBF
         LW/sMHHTg9AZT5NYWQdA33k7+VHtwYpV/mnHLnVefLtuf1U80gCgJmOUvCqFswH2Oquv
         P30Q==
X-Forwarded-Encrypted: i=1; AJvYcCWVPDOWJU5J7oUEByN/smOYdxOchizj2qTFkuzGrPFGK7paxyy3wkUdMrZrKlgQGVMNJqx/4u4K2ji7kHdXbssJ/0UgOiWuc9Z+Prc=
X-Gm-Message-State: AOJu0YzOxZOkMfcy4OKKk0TFhSFoKfEpbR1X1w1WVP57Uh6hJVXJG0KC
	Un4AEBAzbMK9pilt3oVTec8KjHvykPfgwRUvbpKIRsOOp1RBmNipKMruL6xlYA==
X-Google-Smtp-Source: AGHT+IGaS23rXNTO3GSlC5fiIYhhJWJkLcIM7K1oz40WmiVvyxUfsN5SX67N9WEjb/a2JD4P5U+fPg==
X-Received: by 2002:a17:902:ec83:b0:1e0:a5ea:6860 with SMTP id x3-20020a170902ec8300b001e0a5ea6860mr268318plg.24.1711743393382;
        Fri, 29 Mar 2024 13:16:33 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id fk12-20020a056a003a8c00b006ea858e6e78sm3399982pfb.45.2024.03.29.13.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:16:32 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:16:28 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 11/18] power: supply: cros_pchg: provide ID table for
 avoiding fallback match
Message-ID: <ZgchnIUMSnbpIFit@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-12-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rNlrJ3uzdAY9E2PQ"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-12-tzungbi@kernel.org>


--rNlrJ3uzdAY9E2PQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:23PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/power/supply/cros_peripheral_charger.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/power/supply/cros_peripheral_charger.c b/drivers/pow=
er/supply/cros_peripheral_charger.c
> index a204f2355be4..d406f2a78449 100644
> --- a/drivers/power/supply/cros_peripheral_charger.c
> +++ b/drivers/power/supply/cros_peripheral_charger.c
> @@ -5,6 +5,7 @@
>   * Copyright 2020 Google LLC.
>   */
> =20
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/notifier.h>
>  #include <linux/platform_data/cros_ec_commands.h>
> @@ -367,16 +368,22 @@ static int __maybe_unused cros_pchg_resume(struct d=
evice *dev)
> =20
>  static SIMPLE_DEV_PM_OPS(cros_pchg_pm_ops, NULL, cros_pchg_resume);
> =20
> +static const struct platform_device_id cros_pchg_id[] =3D {
> +	{ DRV_NAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, cros_pchg_id);
> +
>  static struct platform_driver cros_pchg_driver =3D {
>  	.driver =3D {
>  		.name =3D DRV_NAME,
>  		.pm =3D &cros_pchg_pm_ops,
>  	},
> -	.probe =3D cros_pchg_probe
> +	.probe =3D cros_pchg_probe,
> +	.id_table =3D cros_pchg_id,
>  };
> =20
>  module_platform_driver(cros_pchg_driver);
> =20
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("ChromeOS EC peripheral device charger");
> -MODULE_ALIAS("platform:" DRV_NAME);
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20

--rNlrJ3uzdAY9E2PQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgchnAAKCRBzbaomhzOw
wvQUAQDFLWqdSf5h9aYvqQDJdspoU8KMSBpjENexGMOgS8BcJwEA6Q7aPmkms44D
Yxc+iiCcTh4l5osXYKOfRPdXas2PuwA=
=ovPB
-----END PGP SIGNATURE-----

--rNlrJ3uzdAY9E2PQ--

