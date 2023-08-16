Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AED3C77DE34
	for <lists+linux-media@lfdr.de>; Wed, 16 Aug 2023 12:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243735AbjHPKKA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Aug 2023 06:10:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243742AbjHPKJ5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Aug 2023 06:09:57 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8666C1
        for <linux-media@vger.kernel.org>; Wed, 16 Aug 2023 03:09:54 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B9CDFF806;
        Wed, 16 Aug 2023 10:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1692180593;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=h5lQWAeW+NPtPE1/7EDtPleEl+xEGXup9jpMcYQ0n6M=;
        b=DlYF10Orb/YRYdAJs40h8geepm6lgzERhMPFuAx1rfJ/3D5mqvGKAigz3jivXKPYWOycQn
        qpxAjJqFrAc0N299pIhFnHFZHdgK/nvL9HTAX6AZ9bhMxRgSGiwOGvbiQ5XggUY7Yo0wMm
        oWEo+kO2upJ/QaYtpHrS5Eon0/ocUF6tCrRS5RA1aHOJHnPiLy3qMkcZSPBPSWSheJ65qe
        H/fSWk1/uHEdaiXI8H0F5lcOYbUqDsyg/lDKX8wUzaV3CfgNe+U5nbe9xR2BN7TsKKUFy3
        njFLId+hO/MILW2rbPy3ZtCs67tNbZoIXSYuzxmrVTDZP/UGsG6PEk+X5scbOg==
Date:   Wed, 16 Aug 2023 12:09:47 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Ruan Jinjie <ruanjinjie@huawei.com>
Cc:     TheSven73@gmail.com, gregkh@linuxfoundation.org,
        mripard@kernel.org, mchehab@kernel.org, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org,
        linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH -next 2/2] media: staging: media: sunxi: cedrus: Remove
 redundant of_match_ptr()
Message-ID: <ZNyga6GGlSiKpMqE@aptenodytes>
References: <20230811024945.2256437-1-ruanjinjie@huawei.com>
 <20230811024945.2256437-3-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="A9Pa7haUiISTifj7"
Content-Disposition: inline
In-Reply-To: <20230811024945.2256437-3-ruanjinjie@huawei.com>
X-GND-Sasl: paul.kocialkowski@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--A9Pa7haUiISTifj7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 11 Aug 23, 10:49, Ruan Jinjie wrote:
> The driver depends on CONFIG_OF, it is not necessary to use
> of_match_ptr() here.
>=20
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>

Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Thanks for the patch!

Paul

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
> index 8e248d4a0aec..f52df6836045 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -708,7 +708,7 @@ static struct platform_driver cedrus_driver =3D {
>  	.remove_new	=3D cedrus_remove,
>  	.driver		=3D {
>  		.name		=3D CEDRUS_NAME,
> -		.of_match_table	=3D of_match_ptr(cedrus_dt_match),
> +		.of_match_table	=3D cedrus_dt_match,
>  		.pm		=3D &cedrus_dev_pm_ops,
>  	},
>  };
> --=20
> 2.34.1
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--A9Pa7haUiISTifj7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmTcoGsACgkQ3cLmz3+f
v9EqXwf8CN23uyCZvWuHCFCGwyazYagcl06F9igVRFlNx1JcpSilPC0s/vCeZzks
240k+JQDOqoIeC6sHKJfyfBWSEWwc7j7GnKQRZnVA0+bU5fl4f3/wDWzKl6hnUVR
aW6ZVyVigGKuTeGw3DwvRXvdFHPvLwAuDJ3SYz2E51XJ06KPaVxZyu2ifoQUqIXk
RWUJkZR6e/lt/9376J5JItKThqFa8LEe2RBk3E55GeNHBXBr2d/9Q36XW/wdow38
E84wzyD4jFeO1iRdm1n0rZIojgtwTc2iPxm+OM8vvGaCdgliLpfpezZZ+1zWuJCq
5+q6bs4Dr5apCGu86U3CcviVi3oL2w==
=frhy
-----END PGP SIGNATURE-----

--A9Pa7haUiISTifj7--
