Return-Path: <linux-media+bounces-8244-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 067FE89250A
	for <lists+linux-media@lfdr.de>; Fri, 29 Mar 2024 21:15:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38A901C21BD3
	for <lists+linux-media@lfdr.de>; Fri, 29 Mar 2024 20:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C7413B58D;
	Fri, 29 Mar 2024 20:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0EScXTpC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639BD13B789
	for <linux-media@vger.kernel.org>; Fri, 29 Mar 2024 20:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711743318; cv=none; b=oitrFj2AOAcPhwPb/1ix5P4tOVc85gAEwN+oSojbQ7V31tpueljwx12rvpK+1v/FMjiiBwpM/4RU2OGg7kghqS4qJu8//PAcTNS8bHz0G6oVCiSExC/sMa7VyGXCuo/TSkvKVbQ7A/6D7f/mPXweZ2SFbxo5SR/tK3wpGvpwXTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711743318; c=relaxed/simple;
	bh=dXWldQQUfRjIiALMG2fpm7IzG1GZYymi2LOeiMlqhfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GsJ96HPN2Tdjmhfg+/szTOPsb4ghTDNbQl5bMUN8cY3luHK0DI6IYBHqMDBz983UdWQvhIEk+oaoySEBkxh4voc8fA/DGkmMHtB5o52K0DsTNkMSPdBfkyThlVFBVewz3IXzgaTGDSoGcBNX/GSGKmMSxTnAkpNmvFQ6xILaS/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0EScXTpC; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1e21ddc1911so205805ad.0
        for <linux-media@vger.kernel.org>; Fri, 29 Mar 2024 13:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711743316; x=1712348116; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yN1pkTi7aGGxVn5vpEISrBEiKtfH60LTekrIRie/ugU=;
        b=0EScXTpCTX3J/WVCUBGZS+W/HKRAICnfMAI2cJOWSNAObjtnDJ8jnOEWrgQdMp/BZ5
         GG95ECnheyUDK4P9j9aJV7WdBAfr0tYa1G7/Be0LqK7XmnLZKyvtEYwtflxN98xAPgMT
         6abHfqg945wuojsYuu8sHumI/YGsuHKALUNPfJ42c8Mvsb496QX02tRIi+6p5X6anKAc
         vr0KUKkRN8XsdJHn/dGIsXGDx4LqZvoEXlIlHpuWVQ3tEI0xhx0ntcZi007/95ERCaD6
         CiD1WwRbtf0KkvXcDLxIcCUCNoLfKBqvjOoJ7GlJ+EKb5PM3BUNRsMC97IWr9N+j5aWw
         iPMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711743316; x=1712348116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yN1pkTi7aGGxVn5vpEISrBEiKtfH60LTekrIRie/ugU=;
        b=lCnst2HNhrXcNx02dQ9g+4iJtn7qwwUuPgpyqjl8OQd9tCctFK/flvEf3esWOCcQgl
         WVvRlRyM8SzbUBdpcL6SEk/o2Iuv8H4I47lawv0kv+eC3y06DhCB7uK+rCUBmyu/uvBz
         Pa/unDnXU/N5qj6EI5BTrWSdFgDFlRLHzBMP7xl2fo2SOEW9pokKcr++luVpH5EpydBC
         htmzCEfZCWH2LKBjWiq59LqXZi0uv85/DP7ro/D+wXNWr94l3A/51nX9IhEMFGJsjDvz
         FeiJjJyoPWWsgattMBIMGrZlFY6VYriHXMQK5GzcQjSB2oag9mGfSXZl38ZK+TEotLxI
         0hug==
X-Forwarded-Encrypted: i=1; AJvYcCVn1UBCGofD9KMi2G8fp5PqFwDdjNvzT1gpfHYA2wKhWSFIQUR6cMTut8SRAKEHBwsX7k5CTtHAayDSSE1cpT0KM8sXXXY/cE93ASM=
X-Gm-Message-State: AOJu0YwH3S3lUqY96dikjtSS3Q6dgDTSo8sWR5ZW+Kpqxc5BXIRcFUeT
	DqPr4fK6swplYePNvVbXJw12iPlYQiBHivtJbd02Ude+ZS4SV2uVGqo1UDXUyQ==
X-Google-Smtp-Source: AGHT+IELgYsPgtgZHiC/GgmdWaxQgiRaeVrDrmbZyhMqlUMmBsEI5Rbq2xP36HxYbxYmBe5WHyb+Dw==
X-Received: by 2002:a17:902:d50b:b0:1e0:c472:9c36 with SMTP id b11-20020a170902d50b00b001e0c4729c36mr215001plg.5.1711743316290;
        Fri, 29 Mar 2024 13:15:16 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id n12-20020aa78a4c000000b006e5359e621csm3373144pfa.182.2024.03.29.13.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:15:15 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:15:11 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 10/18] platform/chrome: cros_ec_sysfs: provide ID table
 for avoiding fallback match
Message-ID: <ZgchTzDnQ3lSMekc@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-11-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hUV5Tr+K+hDD5f4j"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-11-tzungbi@kernel.org>


--hUV5Tr+K+hDD5f4j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:22PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_sysfs.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_sysfs.c b/drivers/platform/c=
hrome/cros_ec_sysfs.c
> index 93e67ab4af06..9c944146ee50 100644
> --- a/drivers/platform/chrome/cros_ec_sysfs.c
> +++ b/drivers/platform/chrome/cros_ec_sysfs.c
> @@ -8,6 +8,7 @@
>  #include <linux/device.h>
>  #include <linux/fs.h>
>  #include <linux/kobject.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_ec_proto.h>
> @@ -347,16 +348,22 @@ static void cros_ec_sysfs_remove(struct platform_de=
vice *pd)
>  	sysfs_remove_group(&ec_dev->class_dev.kobj, &cros_ec_attr_group);
>  }
> =20
> +static const struct platform_device_id cros_ec_sysfs_id[] =3D {
> +	{ DRV_NAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, cros_ec_sysfs_id);
> +
>  static struct platform_driver cros_ec_sysfs_driver =3D {
>  	.driver =3D {
>  		.name =3D DRV_NAME,
>  	},
>  	.probe =3D cros_ec_sysfs_probe,
>  	.remove_new =3D cros_ec_sysfs_remove,
> +	.id_table =3D cros_ec_sysfs_id,
>  };
> =20
>  module_platform_driver(cros_ec_sysfs_driver);
> =20
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("Expose the ChromeOS EC through sysfs");
> -MODULE_ALIAS("platform:" DRV_NAME);
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20
>=20

--hUV5Tr+K+hDD5f4j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgchTwAKCRBzbaomhzOw
wvBqAQDen0/do0dgzoX5uwMVMdBEGV3WYcnAuC5mW+EvIGvD9gEA6Mkzg3IFKEY5
dNVkS3JCON7V/qjfWBgjb7L2I5P7oAY=
=500V
-----END PGP SIGNATURE-----

--hUV5Tr+K+hDD5f4j--

