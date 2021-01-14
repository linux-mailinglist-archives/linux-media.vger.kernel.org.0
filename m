Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E14C2F5C9F
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 09:50:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727359AbhANItq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 03:49:46 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:35413 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727199AbhANItq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 03:49:46 -0500
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id EC869FF80E;
        Thu, 14 Jan 2021 08:49:02 +0000 (UTC)
Date:   Thu, 14 Jan 2021 09:49:02 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        =?utf-8?B?S8OpdmluIEwnaMO0cGl0YWw=?= <kevin.lhopital@bootlin.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] media: i2c: fix spelling mistakes: "enpoint" ->
 "endpoint"
Message-ID: <YAAFfh1iytVAvJK2@aptenodytes>
References: <20210113100517.10959-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DMj+727u0fJbYvjc"
Content-Disposition: inline
In-Reply-To: <20210113100517.10959-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--DMj+727u0fJbYvjc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed 13 Jan 21, 10:05, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> There are two spelling mistakes in dev_err messages. Fix these.

Thanks for the patch!

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/media/i2c/ov5648.c | 2 +-
>  drivers/media/i2c/ov8865.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
> index 609aa67b54ce..46ad0a539853 100644
> --- a/drivers/media/i2c/ov5648.c
> +++ b/drivers/media/i2c/ov5648.c
> @@ -2453,7 +2453,7 @@ static int ov5648_probe(struct i2c_client *client)
> =20
>  	handle =3D fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
>  	if (!handle) {
> -		dev_err(dev, "unable to find enpoint node\n");
> +		dev_err(dev, "unable to find endpoint node\n");
>  		return -EINVAL;
>  	}
> =20
> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> index fda5a55979aa..fd5be8ef079c 100644
> --- a/drivers/media/i2c/ov8865.c
> +++ b/drivers/media/i2c/ov8865.c
> @@ -2799,7 +2799,7 @@ static int ov8865_probe(struct i2c_client *client)
> =20
>  	handle =3D fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
>  	if (!handle) {
> -		dev_err(dev, "unable to find enpoint node\n");
> +		dev_err(dev, "unable to find endpoint node\n");
>  		return -EINVAL;
>  	}
> =20
> --=20
> 2.29.2
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--DMj+727u0fJbYvjc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmAABX4ACgkQ3cLmz3+f
v9H8RAf/fVSXIjjtgpBr2fjzagLAkOv9OO1WvvSMheagyn+1E+t74WB15cEKvTAb
IZ1C+iNFkkodpmp2bX2YxptrBtLIvxZ6PpuxTp1prS/X0f0yHd2emEl6i+vgBlvi
MlFNDNRihyNARSeSwtJUmAOo8nxYwwvKnGIzGzIo6hYFFoxvfxD/H1DoFflfbVXK
1CeI2QeMZu0ZUvHQxCr9/o6uQspnrQoWw38x935H2NYDdQjarKwWp07kLvsnTYAn
EReG/Y8IK5y7J9VyPx5ig05WzHDkk/J4ngUoOzcWeg+pn4/+TvMrUyDZOZ++M08C
MbsldPtZX+e5JUEFJvdw9hP8QTeBGw==
=8PNC
-----END PGP SIGNATURE-----

--DMj+727u0fJbYvjc--
