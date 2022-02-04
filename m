Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 246914A95B5
	for <lists+linux-media@lfdr.de>; Fri,  4 Feb 2022 10:04:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240986AbiBDJEd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Feb 2022 04:04:33 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:49537 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbiBDJEb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Feb 2022 04:04:31 -0500
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id C55EC240006;
        Fri,  4 Feb 2022 09:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1643965467;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=G9dI6OMW3Cy5MmYGRDLK8UzEGwe9kyx3ckqsq6r+kHE=;
        b=f6kc1N7JBlgEeDJ09jtJz2ZXUur8lNWzG8WZAxtfIWl7ANe3m/piu0au7Js28hHi60zKSz
        1wwovHFgg52lsUZSH/9Dyph96BRYFzKHPhPSS45inZWQBKN++tuj82o+pui2zycPfe6lit
        mpO9VO8LaxdIpW67HodZcmEiUsSw6px82WUXIK7FdVfZZSDXzh1gSymmR8+g2BjDALAQql
        0e3y2eFe1H3cVfgosLdHPy+O2EgPHR6cSzICbBrTx2Y2IaZ9jqlhurC5ZVGNSVeUwV6Rxq
        MV/fFQgzIfh2OOYo3OsqZHQB6TZZwR/bU3LllRo6vKnAr9Ynk8c7+3rjm1jerA==
Date:   Fri, 4 Feb 2022 10:04:26 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Subject: Re: [PATCH RESEND] media: i2c: Fix pixel array positions in ov8865
Message-ID: <YfzsGpgmEh12OJNm@aptenodytes>
References: <20220203213344.863433-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AMBbhWCU1Ngv5M4U"
Content-Disposition: inline
In-Reply-To: <20220203213344.863433-1-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--AMBbhWCU1Ngv5M4U
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Thu 03 Feb 22, 21:33, Daniel Scally wrote:
> The ov8865's datasheet gives the pixel array as 3296x2528, and the
> active portion as the centre 3264x2448. This makes for a top offset
> of 40 and a left offset of 16, not 32 and 80.

Yep that makes better sense to me!

Could you also invert the lines so we have left first, matching
width being defined first in other instances?

Thanks!

Paul

> Fixes: acd25e220921 ("media: i2c: Add .get_selection() support to ov8865")
>=20
> Reported-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
>=20
> Apologies; sent to the wrong list initially
>=20
>  drivers/media/i2c/ov8865.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> index d9d016cfa9ac..53e21ae8e886 100644
> --- a/drivers/media/i2c/ov8865.c
> +++ b/drivers/media/i2c/ov8865.c
> @@ -457,8 +457,8 @@
> =20
>  #define OV8865_NATIVE_WIDTH			3296
>  #define OV8865_NATIVE_HEIGHT			2528
> -#define OV8865_ACTIVE_START_TOP			32
> -#define OV8865_ACTIVE_START_LEFT		80
> +#define OV8865_ACTIVE_START_TOP			40
> +#define OV8865_ACTIVE_START_LEFT		16
>  #define OV8865_ACTIVE_WIDTH			3264
>  #define OV8865_ACTIVE_HEIGHT			2448
> =20
> --=20
> 2.25.1
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--AMBbhWCU1Ngv5M4U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmH87BoACgkQ3cLmz3+f
v9EUjAf+M6dOmFL6/Q5O3DrPYKfupAw1pMNBYcwzrjPEz0npXdEd9P666UDRn9w9
O3s13pG8XpcfBGff9/tOpmpGxN/pmuarRo3tYTy8EMCJ8brmdX987uKxSEOIVOvf
0oIH8GVrARshNv1O21BpCregc2rek6JqgOpe7oCmt4W3WXeELR1nSofBuQUKeY+P
2PaJ6Uwx5La5z1C5T38IWdhZbvZYyIAeMP7PVTGiiAW4HgUvEBaodF948re6Vd18
6gSdUay0f2extvEx6t2TwuFpAAaM18AjYUDQOLWBbc7/YTtQ8Z9ykm8RJXd8N3/4
ji8wk5LPkjVWBd4ny9EwRKVC6Y7aQg==
=o0br
-----END PGP SIGNATURE-----

--AMBbhWCU1Ngv5M4U--
