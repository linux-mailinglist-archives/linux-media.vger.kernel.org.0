Return-Path: <linux-media+bounces-8247-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC72B892522
	for <lists+linux-media@lfdr.de>; Fri, 29 Mar 2024 21:19:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD7331C2179E
	for <lists+linux-media@lfdr.de>; Fri, 29 Mar 2024 20:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B66613BAEF;
	Fri, 29 Mar 2024 20:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jrHPWXk4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040E84437C
	for <linux-media@vger.kernel.org>; Fri, 29 Mar 2024 20:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711743558; cv=none; b=aGVKQexi2qibm1CqVqBu4eWgByJEARendsC0ZA0YOT8Ryfguplj5W6+YcpZhgnz8hXiBkcCrPK81jZJ3d6nI3heeNvXyYfpEl4eNxKRFAz7NMPm1isnnZDQApbPxBO3BMip30KIqt35+vEPpQQr1QleuHWW9V6qetCI4cvGylOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711743558; c=relaxed/simple;
	bh=rlVT+A7P0+M7DQSgYFKJUFHaX4Xww7TPrMUaIZ3nnas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+0B20axEpOVF6nqYwjzFwWnyCFDjKmG6e2P+QW7OW1IBwbvWX/WgViBj+m1qzFfsZaABkHuI68cBYEx7MpoPW0Nf51V2oNAlnrVTYUVQTnS47/D5rkZncHJ44x2LChGj+91K2rXlmOQwRSEg2XoK+y5Yjlpzjshq7G/9DOSn40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jrHPWXk4; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1dee917abd5so137365ad.1
        for <linux-media@vger.kernel.org>; Fri, 29 Mar 2024 13:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711743555; x=1712348355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xc1B/KzNb5fuAu79OocVzaBbGY8Smo5+Ca0wgrVA1PI=;
        b=jrHPWXk4L2tLi0rfc2RHnsAXGXSyDS3a/LRVn1wX6Ywwk2fut3UoxnyFjHTQTvX85m
         zfVEYYTuUi1PPi+uoO24hAYI1bYmHoKpjB2tiA/QX+NAbTfMhG96748NPcbLWwokRz0Q
         0VARF+6q+tXy1AeLtMo9im2m2lpxq4tImx0bGPU74FcSxmFeoAUBQyzafadrWpOgtvEp
         eL8J1dIl3wLK0gtpqNkbk/YZBROAw151hYFNF/8YTIaSxXw3EqKf8WSpkcfXLLFDjb/9
         BTrNp4g8FujD9Om6kgQ16ee6gBozb/djlEit87ebi53yyKTNJ5CR4iTynnqRAiRQulCP
         ZcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711743555; x=1712348355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xc1B/KzNb5fuAu79OocVzaBbGY8Smo5+Ca0wgrVA1PI=;
        b=CR7NgmzZNrie8/Kp2aXuQugIp5jX1thBZACU/w/grPNMpxbqs7E9JkTvBBZM6/N199
         vfnkoPHvIs8kOCwtyjEY9jnrj/Xu+fJ+emJAK7Q9a91rCaOtxgK1u8m8D6YC741LTUHI
         up3e8CS6hy3OgyQyuYdN0NDSRh4qF69GCca2xGs2IVW895eAaJOxYxo8E3E0nXZmIuzw
         wquJV8NyU7FwzodRD/rTgjS4wRWM83/fue7+/lra25fKA/23zFPPLPXaIaXbFopBE3Ix
         hLWWnrU0IR8O0r4jlbGJT57+QQm4BEXLhL4YjkjtHsBwT7FBx+WcEBDBsisTRNQPMbWe
         LqAA==
X-Forwarded-Encrypted: i=1; AJvYcCUH+qnnKcFD4mmWrtho63xcmCPIB/k2MXF7OkuM/2IG1bfPrxrj74sLJJnvRxMr4kYiqJEs3zhTWULJk1aOK1Dn1aN/errVdQDq3JA=
X-Gm-Message-State: AOJu0YwDyxlxJlAGk/qOvHUVporgLPntMUYie8oWQZ+/f+TN+8uZZDFd
	5x+zDHi0P7E6Fd9qUswwnt/u5SaCc2JYE56DHCVa7BnR8py/fTv46SQv795fDg==
X-Google-Smtp-Source: AGHT+IGPHfOm4VyHRdbt+OF49JdkIGYmbMfYA6a7eigDoydW913jtuONF1p9hINFOSPxQt7YYfJW2g==
X-Received: by 2002:a17:902:da89:b0:1e0:a8b8:abbd with SMTP id j9-20020a170902da8900b001e0a8b8abbdmr272383plx.28.1711743555062;
        Fri, 29 Mar 2024 13:19:15 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id sb8-20020a17090b50c800b002a1f5b8e787sm3726pjb.14.2024.03.29.13.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:19:14 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:19:10 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 13/18] platform/chrome: cros_ec_vbc: provide ID table for
 avoiding fallback match
Message-ID: <ZgciPjZH4JP1nD_R@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-14-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LnnzVqJRKlkZ2tEc"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-14-tzungbi@kernel.org>


--LnnzVqJRKlkZ2tEc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:25PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_vbc.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_vbc.c b/drivers/platform/chr=
ome/cros_ec_vbc.c
> index 274ea0c64b33..787a19db4911 100644
> --- a/drivers/platform/chrome/cros_ec_vbc.c
> +++ b/drivers/platform/chrome/cros_ec_vbc.c
> @@ -6,6 +6,7 @@
> =20
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_ec_proto.h>
> @@ -133,16 +134,22 @@ static void cros_ec_vbc_remove(struct platform_devi=
ce *pd)
>  			   &cros_ec_vbc_attr_group);
>  }
> =20
> +static const struct platform_device_id cros_ec_vbc_id[] =3D {
> +	{ DRV_NAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, cros_ec_vbc_id);
> +
>  static struct platform_driver cros_ec_vbc_driver =3D {
>  	.driver =3D {
>  		.name =3D DRV_NAME,
>  	},
>  	.probe =3D cros_ec_vbc_probe,
>  	.remove_new =3D cros_ec_vbc_remove,
> +	.id_table =3D cros_ec_vbc_id,
>  };
> =20
>  module_platform_driver(cros_ec_vbc_driver);
> =20
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("Expose the vboot context nvram to userspace");
> -MODULE_ALIAS("platform:" DRV_NAME);
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20
>=20

--LnnzVqJRKlkZ2tEc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgciPgAKCRBzbaomhzOw
wm9pAP971js6nk1ojT1TFykJTGPn9mT3ynf2ygoMhjcr/EzN+QD+MNHAfGc/6M3n
6a8WNJXTO+xfhNM17z3PnpAKZ8MXrQE=
=sfxZ
-----END PGP SIGNATURE-----

--LnnzVqJRKlkZ2tEc--

