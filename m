Return-Path: <linux-media+bounces-8240-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E53D8924F5
	for <lists+linux-media@lfdr.de>; Fri, 29 Mar 2024 21:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81F751C219AE
	for <lists+linux-media@lfdr.de>; Fri, 29 Mar 2024 20:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918A913B5B6;
	Fri, 29 Mar 2024 20:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="whlEyCXW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52D513B58D
	for <linux-media@vger.kernel.org>; Fri, 29 Mar 2024 20:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711743112; cv=none; b=rmN/TgnYuIKBRXB8rdTiMmQxlMlMZ5eC0a0hBZ7/UJzfGKaHBYVegeeO6B2I4yOLsPXxMELHS5xvdDRiHzdT6M6/TPcoGwWCT3q7Hrj4o8cn12HbHOAV9pBvGOzmrUEjNi7dury1jW8gk19Q/q/ifAnbsil0ZC4I+IsmdMOKE38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711743112; c=relaxed/simple;
	bh=BIuag0g6C6Y3y8ZICTD7oRnrFkAWMfEOyFsH4BKw78I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j45n+CWPSqQsXRWDHf0k2w0OR6MK9IJwWShmISh2dUz9mw82ZKZ8XO63YAqpzvsFPIDLcd9G4iTRsfakbmLb8YHVAD9r/E9rcWjJrbOQ9u/EKUDFUxzRhpRsTW9XGv7JUpP1ffeLGsixLUs2Fht5eoYDzss43BHXccaD8rcQIm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=whlEyCXW; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1deddb82b43so170405ad.0
        for <linux-media@vger.kernel.org>; Fri, 29 Mar 2024 13:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711743110; x=1712347910; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FFzyg0npWqeBaTEsJ+0b6NEDJj79+MH/Mz+iGKuuB4g=;
        b=whlEyCXWZPzyxxrHdFjImZgsNXQ6Jp2KcdR0B6VIu/PLhBop/Qbfbxh9ZTnTXJRhpy
         SFiAZG+8sbyxMt/3KhluHhSfA3YphsdRQv8PEJ5QfBHfsPwBLEaEWUHA/nF0kJ2u7K4m
         cY5j1RQhLGpXac8EBFZgCFfuHA7Ls7cx5JeDCwmNHqsnuTOyHz5hbRSLnGS50Jc9BPmc
         ZYL+Eto9KtTvO+YzaPur1rHiWe5dQmcEOtG0Ed2TYi2QDYaY/yuzmbHkShuN/lqlI/Ac
         4Fpm2zG3arHVyCVTvjkrjfDjCJrlomm++xWkIkWEaNH0rwHkwRydEg1e3FoN8MFfXuSD
         JT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711743110; x=1712347910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFzyg0npWqeBaTEsJ+0b6NEDJj79+MH/Mz+iGKuuB4g=;
        b=Llr1Jv2oYBLgfBLHdWz1/iwOLQT7jhE0LA67pCqAoYJWM60+8DUPEqrnrWck7BRazX
         AWJqk7egBDc5cREgKhM+awLCTYK+AMJ2XofVRGC25vNWodsPUflT5XEI2XcoPcDY/mse
         IC8yDgcNrxK6nGiu/OLybTUIojKRJDKXUUgITMl44FGNfEwhYPF6AjUtmEWvFOQAix/x
         gIKhriuividrjxkRAn+n3FJIya897PeXB6bwwYh61ZTlQRUC0/BSAQ7N/BgKSrckQiQY
         mCJ/j9BCAxR0NIMsVKQux28bXhZFXfwc0vb+w4Y057copjNmPRcZNNdmTyHNb91zD6yI
         EWKw==
X-Forwarded-Encrypted: i=1; AJvYcCXeMuN4JdoL/p8wCaG/8YzsQpzokZ7pZCqQA2oodhvRsDMtnQh6ozzR0QOYa+Y40aPpSJL3wDOgGt3IUYXBCrP/SlGXVP36T2a7NtU=
X-Gm-Message-State: AOJu0YwbLHkuTRmUcYJ/PX1NIAy0gZhjyJtZPVjwXuNvpFd9+fcFIEnK
	0/WlB7A27EOO5VUQMDIfWZgOtfCzfJ3yJ+CAWy0Lq/79fTa7U8YjTERMoo3TnA==
X-Google-Smtp-Source: AGHT+IEL58LbYxlBBeN18c2RvVRQC+ZIyhfJ0rX5w8lvsXWRLgTuRmFh+TgKTeiotO7VuCrRGTZyVw==
X-Received: by 2002:a17:902:f689:b0:1de:fbe1:beb1 with SMTP id l9-20020a170902f68900b001defbe1beb1mr225765plg.7.1711743109564;
        Fri, 29 Mar 2024 13:11:49 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id e25-20020aa78c59000000b006e6529c7d75sm3376947pfd.3.2024.03.29.13.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:11:48 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:11:44 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 06/18] platform/chrome: cros_usbpd_logger: provide ID
 table for avoiding fallback match
Message-ID: <ZgcggNwgH25rWqnw@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-7-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hOhqASqjoSJjHZPV"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-7-tzungbi@kernel.org>


--hOhqASqjoSJjHZPV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:18PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/platform/chrome/cros_usbpd_logger.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/chrome/cros_usbpd_logger.c b/drivers/platfo=
rm/chrome/cros_usbpd_logger.c
> index f618757f8b32..930c2f47269f 100644
> --- a/drivers/platform/chrome/cros_usbpd_logger.c
> +++ b/drivers/platform/chrome/cros_usbpd_logger.c
> @@ -7,6 +7,7 @@
> =20
>  #include <linux/ktime.h>
>  #include <linux/math64.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_ec_proto.h>
> @@ -249,6 +250,12 @@ static int __maybe_unused cros_usbpd_logger_suspend(=
struct device *dev)
>  static SIMPLE_DEV_PM_OPS(cros_usbpd_logger_pm_ops, cros_usbpd_logger_sus=
pend,
>  			 cros_usbpd_logger_resume);
> =20
> +static const struct platform_device_id cros_usbpd_logger_id[] =3D {
> +	{ DRV_NAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, cros_usbpd_logger_id);
> +
>  static struct platform_driver cros_usbpd_logger_driver =3D {
>  	.driver =3D {
>  		.name =3D DRV_NAME,
> @@ -256,10 +263,10 @@ static struct platform_driver cros_usbpd_logger_dri=
ver =3D {
>  	},
>  	.probe =3D cros_usbpd_logger_probe,
>  	.remove_new =3D cros_usbpd_logger_remove,
> +	.id_table =3D cros_usbpd_logger_id,
>  };
> =20
>  module_platform_driver(cros_usbpd_logger_driver);
> =20
>  MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("Logging driver for ChromeOS EC USBPD Charger.");
> -MODULE_ALIAS("platform:" DRV_NAME);
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20
>=20

--hOhqASqjoSJjHZPV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgcggAAKCRBzbaomhzOw
wp6CAQDZ4IPSXJWCQwtAiu25DxG5FmLKai6jWzCOofpAyGyOiQEAgs8jaeM8T1OV
pUoh3bLUDXyza8oOtFZY7Eis8bue9Ao=
=H648
-----END PGP SIGNATURE-----

--hOhqASqjoSJjHZPV--

