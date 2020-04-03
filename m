Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59B3E19D20A
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 10:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390509AbgDCIWJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 04:22:09 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:38439 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390480AbgDCIWJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 04:22:09 -0400
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 233BE40011;
        Fri,  3 Apr 2020 08:22:06 +0000 (UTC)
Date:   Fri, 3 Apr 2020 10:22:06 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com, Hans Verkuil <hverkuil@xs4all.nl>,
        Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] cedrus: Drop unneeded CONFIG_OF dependency
Message-ID: <20200403082206.GA626942@aptenodytes>
References: <20200402194653.13535-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline
In-Reply-To: <20200402194653.13535-1-ezequiel@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ezequiel,

On Thu 02 Apr 20, 16:46, Ezequiel Garcia wrote:
> The driver is perfectly capable of being built without CONFIG_OF.
> Remove this dependency, which is useful for compile-only tests.

Thanks for the patch!

Alas, the driver won't do anything useful without OF enabled, so it seems
useful to keep that dependency.

I would suggest making this a: depends on OF || COMPILE_TEST
instead. What do you think?

Cheers,

Paul

> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/staging/media/sunxi/cedrus/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/Kconfig b/drivers/staging=
/media/sunxi/cedrus/Kconfig
> index 17733e9a088f..59b8d1b29865 100644
> --- a/drivers/staging/media/sunxi/cedrus/Kconfig
> +++ b/drivers/staging/media/sunxi/cedrus/Kconfig
> @@ -3,7 +3,6 @@ config VIDEO_SUNXI_CEDRUS
>  	tristate "Allwinner Cedrus VPU driver"
>  	depends on VIDEO_DEV && VIDEO_V4L2 && MEDIA_CONTROLLER
>  	depends on HAS_DMA
> -	depends on OF
>  	depends on MEDIA_CONTROLLER_REQUEST_API
>  	select SUNXI_SRAM
>  	select VIDEOBUF2_DMA_CONTIG
> --=20
> 2.26.0.rc2
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl6G8i4ACgkQ3cLmz3+f
v9E5EAf+LnnIIgFiaXemYf16Hj/6fAMGOm/Qgibd2niaA5siXu/3jrwN+P2BQfAR
2Yk8j5IulMT8A4UhNQT1H/czCfqEu5tMsKvRpNbhPcgLh9d3EVuT/kEg8dJ7tr8o
PI5OL2MFtMScsNpqIf9437iAlD/uEy6Ym6ai4AVqCxjjReFLstkG7EdWGsiIhh/p
sWrtMMXKzc7vFE9IMKUk2JVGWL9b6oJdphGjMI0XvaXlxAO1/kBPcq7LN1F+1Qtk
AfwKholY4NTB3U93lx1HF6H3KBV5nqjcNK9q/2z2WWKE6Src81844FlGSugzjSSg
GGwo7ReiQ8aL1c6i+Jx1OJCT5hOYbA==
=aJii
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
