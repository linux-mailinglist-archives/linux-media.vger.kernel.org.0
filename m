Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D540DA66A
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 09:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408148AbfJQH0s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 03:26:48 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:55633 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404931AbfJQH0s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 03:26:48 -0400
X-Originating-IP: 86.250.200.211
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 0F2BAE0008;
        Thu, 17 Oct 2019 07:26:45 +0000 (UTC)
Date:   Thu, 17 Oct 2019 09:26:45 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     mripard@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
        wens@csie.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] staging: media: cedrus: use
 devm_platform_ioremap_resource() to simplify code
Message-ID: <20191017072645.GA2778@aptenodytes>
References: <20191016085604.21076-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline
In-Reply-To: <20191016085604.21076-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed 16 Oct 19, 16:56, YueHaibing wrote:
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.

This is still:
Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Please collect the tag in your next version, if there's a need for one.

Cheers,

Paul

> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/sta=
ging/media/sunxi/cedrus/cedrus_hw.c
> index a942cd9..f19b87c 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> @@ -146,7 +146,6 @@ static irqreturn_t cedrus_irq(int irq, void *data)
>  int cedrus_hw_probe(struct cedrus_dev *dev)
>  {
>  	const struct cedrus_variant *variant;
> -	struct resource *res;
>  	int irq_dec;
>  	int ret;
> =20
> @@ -225,8 +224,7 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
>  		goto err_sram;
>  	}
> =20
> -	res =3D platform_get_resource(dev->pdev, IORESOURCE_MEM, 0);
> -	dev->base =3D devm_ioremap_resource(dev->dev, res);
> +	dev->base =3D devm_platform_ioremap_resource(dev->pdev, 0);
>  	if (IS_ERR(dev->base)) {
>  		dev_err(dev->dev, "Failed to map registers\n");
> =20
> --=20
> 2.7.4
>=20
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl2oF7UACgkQ3cLmz3+f
v9EItgf9GvoiVbIh3tmX/jiHYvuTXM7tm9aRYWoFX7LVixCUoe6h+o7qBdsHSBks
RxI0BSWHEEieShZlIK0Fyof7bx04lEbJc072Bp31b6xFJxdQ1w+xatMjwfh5bILZ
jcAHPnMwKntbmetL8qPB2pDcq//vDYvGOkN73ZqFPO8kCU6rYxX0+Y/Eaw0be7EB
2Duq2Rm0E7OswN9jebQ4fm4tpt4bZj4qX7h4tUkwFKGpzzt4jYyaqpr5jQ7Bw1LK
nyn5TAVJPA9P+Mo5P59R+2E4HX6DKma2jy5lRSnZddG2iR1F3kh1MbOs1qUothp4
PvvSH42W4cFR1G5Q+dbvEK4UAWOqQA==
=pqsv
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
