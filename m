Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7822AF85
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 09:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbfE0HrM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 03:47:12 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:50817 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbfE0HrL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 03:47:11 -0400
X-Originating-IP: 90.88.147.134
Received: from localhost (aaubervilliers-681-1-27-134.w90-88.abo.wanadoo.fr [90.88.147.134])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id F3FD5FF804;
        Mon, 27 May 2019 07:47:00 +0000 (UTC)
Date:   Mon, 27 May 2019 09:47:00 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 02/10] media: rc: sunxi: Add A31 compatible
Message-ID: <20190527074700.rvhqua44ixudt52z@flea>
References: <20190526222536.10917-1-peron.clem@gmail.com>
 <20190526222536.10917-3-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xx34rvresls3nexu"
Content-Disposition: inline
In-Reply-To: <20190526222536.10917-3-peron.clem@gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--xx34rvresls3nexu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, May 27, 2019 at 12:25:28AM +0200, Cl=E9ment P=E9ron wrote:
> Allwiner A31 has a different memory mapping so add the compatible
> we will need it later.
>
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> ---
>  drivers/media/rc/sunxi-cir.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
> index 307e44714ea0..29ac33b68596 100644
> --- a/drivers/media/rc/sunxi-cir.c
> +++ b/drivers/media/rc/sunxi-cir.c
> @@ -319,6 +319,7 @@ static int sunxi_ir_remove(struct platform_device *pd=
ev)
>  static const struct of_device_id sunxi_ir_match[] =3D {
>  	{ .compatible =3D "allwinner,sun4i-a10-ir", },
>  	{ .compatible =3D "allwinner,sun5i-a13-ir", },
> +	{ .compatible =3D "allwinner,sun6i-a31-ir", },

We should also move from reset_get_optional to the non optional
variant for the A31, and ignore it otherwise.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--xx34rvresls3nexu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOuV9AAKCRDj7w1vZxhR
xYI4APwLA7XkEJEvZo163pjX8FYq/eehfm/B/XlHpRd4MGPiPAEA7XTUsahB0xGh
X93+OkLnWss/BMtLjZmj/mbzvyOITAo=
=oSdS
-----END PGP SIGNATURE-----

--xx34rvresls3nexu--
