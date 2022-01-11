Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93E3048A953
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 09:28:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348899AbiAKI2O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 03:28:14 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:44751 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348889AbiAKI2O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 03:28:14 -0500
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 88C98C000D;
        Tue, 11 Jan 2022 08:28:12 +0000 (UTC)
Date:   Tue, 11 Jan 2022 09:28:12 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] ov5648: Don't pack controls struct
Message-ID: <Yd0/nL7iQityle6P@aptenodytes>
References: <20220110224831.266749-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Y3bK95cwuUGkI+Qf"
Content-Disposition: inline
In-Reply-To: <20220110224831.266749-1-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--Y3bK95cwuUGkI+Qf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Tue 11 Jan 22, 00:48, Sakari Ailus wrote:
> Don't pack the driver specific struct containing control pointers. This
> lead to potential alignment issues when working with the pointers.

Thanks for looking into the report and making this fix.

Honestly I was a bit puzzled because I explicitly added the __packed
to avoid possible holes in the structures that could be problematic
when using v4l2_ctrl_auto_cluster and I think the problem still stands.

I feel like solving both issues at once would require having the controls
that belong in the same cluster declared as an array and not individual
members of the struct.

What do you think?

Cheers,

Paul

> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: e43ccb0a045f ("media: i2c: Add support for the OV5648 image sensor=
")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ov5648.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
> index 87f9b724cd7f..3478650ee732 100644
> --- a/drivers/media/i2c/ov5648.c
> +++ b/drivers/media/i2c/ov5648.c
> @@ -639,7 +639,7 @@ struct ov5648_ctrls {
>  	struct v4l2_ctrl *pixel_rate;
> =20
>  	struct v4l2_ctrl_handler handler;
> -} __packed;
> +};
> =20
>  struct ov5648_sensor {
>  	struct device *dev;
> --=20
> 2.30.2
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--Y3bK95cwuUGkI+Qf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmHdP5wACgkQ3cLmz3+f
v9F6lggAlMudsgmlm4Mn27vG0xY4cbwu/7fQDdSImITCp/EegVkpsMAsBU/Gb+VA
178x4wB2tmtbe0rCr6IfPIsQX7vxz3RXxuaaY4vuWwzoE6oNXp6Ayfjvn07ehhyL
Qvs4QlEVIdJfw/6AcIf5ojwnN8adtesLxV91qTwHRljJ0bWJ1rsIDLfJdBgoPO/m
ji2+eZ0nwJfzdMWwdYwKpozQDplBcMjz9VRW8D0ZgtKwauUwIRYBPg6d4hiV7EzU
tE+6APRItRI8ujWuRlpnkTGjLs5Ul+2EtIm1K/aDimws9r6OZNzpP0I6RUzGiwvb
Xn9nlZZwMfkGSpWkrS2cmQGEPU5fcQ==
=husr
-----END PGP SIGNATURE-----

--Y3bK95cwuUGkI+Qf--
