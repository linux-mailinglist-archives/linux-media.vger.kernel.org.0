Return-Path: <linux-media+bounces-8250-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC540892533
	for <lists+linux-media@lfdr.de>; Fri, 29 Mar 2024 21:22:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0BDC1F21EC3
	for <lists+linux-media@lfdr.de>; Fri, 29 Mar 2024 20:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B5C713BAF3;
	Fri, 29 Mar 2024 20:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Vhe6bEZo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3926613BAD2
	for <linux-media@vger.kernel.org>; Fri, 29 Mar 2024 20:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711743719; cv=none; b=lusvSmsZ2ejGW93eUq1pcqjtmpayOs7lpU8msVf3i0cCenBowm8i0RlxgC3mQpueR+2aLjK+GV1j84UQz0zoAT5gPR+rFp12tLP42LObbuB7/GWHRDx0qE3Ms+kT0BQYWecJqinNBAmvlYc9dgmjNpOlVCVR/arsVAl7kqY55Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711743719; c=relaxed/simple;
	bh=UNaKjzakgC3/YqdJUQaCrQMV5+3RTvaedPtnhZgej14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bpazxx7ZBraRPoeqZLlEoOMyWmDUXXn+OGxzk3o/Oa4GHj7zIh+9hrYEPadhlnr79DQ/I4soa0jcaRACc4EvuEYISg7afE2JE8WHJXloLqnL4n0hiXO/gM7DVdUrgOzG2i8qAv/zzb3ST0ZEXhfzhRxzeELlny+ImoVW2hUEMfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Vhe6bEZo; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1e062f3a47bso167465ad.1
        for <linux-media@vger.kernel.org>; Fri, 29 Mar 2024 13:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711743717; x=1712348517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SLn+lLgkDX5fY2sRI7cVb/miAMO8Hgz/20wFvN6AVl8=;
        b=Vhe6bEZoV/RosRV5rhzxto9uuLel8vKVrghUDj4qiV+goUnEGlIfrmP5pM14DwZbJz
         1EafcBt5QmFNJfbxDIZzFLg+dIsMjrTcjTNN9ZTqK2PpuLJEsmnAbKxIXSn3TvlMd3iV
         AJGQ6qYSgRkn86BSo7A2D3kFcWYmvUWCbLzjzO4jIUhOC6Idmlu0EVbHD7jsqirTsIRr
         8lcbRM+gCEKoqNCJsbAzqO8msAo6G2Gx8Uv4cC8C2lec9p7786Y8WQFcZaunR7pY3OyQ
         7RzAw9UEvyqxRMpzdkkOJZNKMUtF+y59bZpyMN7LaIjaOFlOm7wSk8HqFeJvcj5Qw/mK
         OnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711743717; x=1712348517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLn+lLgkDX5fY2sRI7cVb/miAMO8Hgz/20wFvN6AVl8=;
        b=aVeG2NROaNxxNlSUDXe/bh7VCU6HNQQgbe7BDrpi2iq90hYmjVwyY9/rQ5NsWjyqC7
         d3lJsWBpjHM3jrIgldWnSeEbXuH1xE4VVzXWz0rVBF8En0eFV65ykI19vO/q4osMIdyY
         ES6P9BPVneVegJbOSQNQtscNBDVhWq16NkepbrK68IBEiOBmVyj4gNtZzWf19jjiLHf6
         6GyE2vpn6SL5qQqR1zuBvEw1zISz05jhpAYFrtFD1AwXN5Ov4NCFo8KzARzx02em0ugS
         UMAwoqBS4APhnFyWZNacz8wjBT/5gDeGNIL5SUg4niigwV9Qwzfv1i94OHLKIM9EUfT2
         iHJw==
X-Forwarded-Encrypted: i=1; AJvYcCUEJSUG511WgrBnN+vnNTs1SSN2Q+aWnmNMqgK6UMqSjRYPNfBUc+h4XYC7F7GRexNo1OIvZjmFkFHZiXG51Vi+HZGsGIyNEJYP/bs=
X-Gm-Message-State: AOJu0Yxahq/x7MmkAvYWwFMwhpIJBubDWSnYPs9YfKgtgCk+BI6dbCeb
	uNaeWpGShkrXCNp1efw9C2N2rLgz+bVXDxgzEpgHNTf9eU+2ZSfwC4Hwjs5DMQ==
X-Google-Smtp-Source: AGHT+IEMJwj2jd4/l859KGpWpENBcoKXmdmgnTzTcBXMh2Vl4SpUYa4OQU9H7SXbsGL7YqZVJFFicA==
X-Received: by 2002:a17:902:cec6:b0:1e0:f525:a831 with SMTP id d6-20020a170902cec600b001e0f525a831mr275700plg.28.1711743717066;
        Fri, 29 Mar 2024 13:21:57 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id bw28-20020a056a02049c00b005dcaa45d87esm2911148pgb.42.2024.03.29.13.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:21:56 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:21:52 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 16/18] platform/chrome: wilco_ec: debugfs: provide ID
 table for avoiding fallback match
Message-ID: <Zgci4OqaNBLBl2yF@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-17-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lXtHlkwSH46+O9d2"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-17-tzungbi@kernel.org>


--lXtHlkwSH46+O9d2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:28PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/platform/chrome/wilco_ec/debugfs.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/chrome/wilco_ec/debugfs.c b/drivers/platfor=
m/chrome/wilco_ec/debugfs.c
> index 93c11f81ca45..983f2fa44ba5 100644
> --- a/drivers/platform/chrome/wilco_ec/debugfs.c
> +++ b/drivers/platform/chrome/wilco_ec/debugfs.c
> @@ -10,6 +10,7 @@
>  #include <linux/ctype.h>
>  #include <linux/debugfs.h>
>  #include <linux/fs.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/wilco-ec.h>
>  #include <linux/platform_device.h>
> @@ -265,17 +266,23 @@ static void wilco_ec_debugfs_remove(struct platform=
_device *pdev)
>  	debugfs_remove_recursive(debug_info->dir);
>  }
> =20
> +static const struct platform_device_id wilco_ec_debugfs_id[] =3D {
> +	{ DRV_NAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, wilco_ec_debugfs_id);
> +
>  static struct platform_driver wilco_ec_debugfs_driver =3D {
>  	.driver =3D {
>  		.name =3D DRV_NAME,
>  	},
>  	.probe =3D wilco_ec_debugfs_probe,
>  	.remove_new =3D wilco_ec_debugfs_remove,
> +	.id_table =3D wilco_ec_debugfs_id,
>  };
> =20
>  module_platform_driver(wilco_ec_debugfs_driver);
> =20
> -MODULE_ALIAS("platform:" DRV_NAME);
>  MODULE_AUTHOR("Nick Crews <ncrews@chromium.org>");
>  MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("Wilco EC debugfs driver");
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20

--lXtHlkwSH46+O9d2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgci4AAKCRBzbaomhzOw
wia/AP41p7WV0zGE8a4VlHRNVebcAVah1YwJhtCsuzSE1aniUwEA0q9rvwuwO+b9
QHhNI8FMZWtiwak8zvmc3GzQq3ODqgk=
=NyE4
-----END PGP SIGNATURE-----

--lXtHlkwSH46+O9d2--

