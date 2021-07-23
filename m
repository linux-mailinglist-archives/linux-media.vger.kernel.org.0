Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 030673D359F
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 09:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233890AbhGWHES (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 03:04:18 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:63565 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbhGWHES (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 03:04:18 -0400
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 4532C40005;
        Fri, 23 Jul 2021 07:44:48 +0000 (UTC)
Date:   Fri, 23 Jul 2021 09:44:47 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yang Li <yang.lee@linux.alibaba.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 02/13] media: i2c: Fix incorrect value in comment
Message-ID: <YPpzb5pqpSycAlxN@aptenodytes>
References: <20210722203407.3588046-1-djrscally@gmail.com>
 <20210722203407.3588046-3-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="R/Y2PH++JXhbPuq9"
Content-Disposition: inline
In-Reply-To: <20210722203407.3588046-3-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--R/Y2PH++JXhbPuq9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu 22 Jul 21, 21:33, Daniel Scally wrote:
> The PLL configuration defined here sets 72MHz (which is correct), not
> 80MHz. Correct the comment.

This is:

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Thanks,

Paul
=20
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
>  drivers/media/i2c/ov8865.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> index fe60cda3dea7..2ef146e7e7ef 100644
> --- a/drivers/media/i2c/ov8865.c
> +++ b/drivers/media/i2c/ov8865.c
> @@ -713,7 +713,7 @@ static const struct ov8865_pll2_config ov8865_pll2_co=
nfig_native =3D {
>  /*
>   * EXTCLK =3D 24 MHz
>   * DAC_CLK =3D 360 MHz
> - * SCLK =3D 80 MHz
> + * SCLK =3D 72 MHz
>   */
> =20
>  static const struct ov8865_pll2_config ov8865_pll2_config_binning =3D {
> --=20
> 2.25.1
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--R/Y2PH++JXhbPuq9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmD6c28ACgkQ3cLmz3+f
v9GemQf/eS5FxzlwerdEt7CM/aYMaFHYwTUXIjaOp7zz/vDqMdy/g8b7KncfZ9bi
PiEGMHVLobC0WhtTBBbggmj7mUMyLWu2xZ+3lzqQwqt4oHsMf35tcAc8WYSvz7H0
D0eR7z9CBcSLAiXS/hX2jAMF03pY2MMgPvxbYQu21C9zSPiB+/7PCIwCscdwIRkC
gS6CXXFu7Wq2QnmnfXJWpBkW4QubgpaRShC13O2I91R7WXk5G3rNUJxXCpnFyD/b
S46VtsdwUhQjOzHdFjGZT4h1AHcubGltz/bb+0u+YlLhGcAX9/PAEVf0JpDguHpW
g9a5pszIIl1vnnjoHCOfq8xOKLXyGQ==
=yawe
-----END PGP SIGNATURE-----

--R/Y2PH++JXhbPuq9--
