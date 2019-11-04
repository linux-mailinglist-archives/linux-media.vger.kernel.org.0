Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18FABEDC46
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 11:15:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbfKDKOw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 05:14:52 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:41677 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfKDKOv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 05:14:51 -0500
X-Originating-IP: 86.250.200.211
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 74C8EE0004;
        Mon,  4 Nov 2019 10:14:42 +0000 (UTC)
Date:   Mon, 4 Nov 2019 11:14:42 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     mripard@kernel.org, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH 3/3] media: cedrus: Increase maximum supported size
Message-ID: <20191104101442.GF502900@aptenodytes>
References: <20191026074959.1073512-1-jernej.skrabec@siol.net>
 <20191026074959.1073512-4-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rV8arf8D5Dod9UkK"
Content-Disposition: inline
In-Reply-To: <20191026074959.1073512-4-jernej.skrabec@siol.net>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--rV8arf8D5Dod9UkK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat 26 Oct 19, 09:49, Jernej Skrabec wrote:
> There are few variations of 4k resolutions. The biggest one is
> 4096x2304 which is also supported by HW. It has also nice property that
> both width and size are divisible by maximum HEVC CTB size, which is 64.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

As I said on the other email, it would be nice to eventually reflect the ac=
tual
per-platform maximum dimensions instead of hardcoding the maximum for all
platforms confounded.

Cheers,

Paul

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_video.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_video.c
> index cc15a5cf107d..15cf1f10221b 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -29,8 +29,8 @@
> =20
>  #define CEDRUS_MIN_WIDTH	16U
>  #define CEDRUS_MIN_HEIGHT	16U
> -#define CEDRUS_MAX_WIDTH	3840U
> -#define CEDRUS_MAX_HEIGHT	2160U
> +#define CEDRUS_MAX_WIDTH	4096U
> +#define CEDRUS_MAX_HEIGHT	2304U
> =20
>  static struct cedrus_format cedrus_formats[] =3D {
>  	{
> --=20
> 2.23.0
>=20

--rV8arf8D5Dod9UkK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl2/+hEACgkQ3cLmz3+f
v9F9EQf7BuXGwf7hxl/hT3TH7m427gHG7ubncUhQ9fE5TUozKfHLhBQtDy0nutMV
e80cMMJgttDQQIh4dPL7AullJp4uAjP3x0+poGS1pdKNyjrdNciU5WMCIpBKWivd
BfOohr0AHgdsg9zDWZf1fLzmsv89M6194mpwpj6eq6n7keN5VVBAzPKHDPqOLRTN
913aRH1vp/ox3ksnvlgZjqPNx8ZkrdF4U0vWNSsh22KuCY5LE5sA4u/6mzgqqYO1
FgpEoj1Wr2LmYdzzHwerWHU4i6ypmZt21wEXcfHFIf1uilTVddWn3BTgFjVk96ix
bVC1uditJShGLWVwSxwq+nPaY6mpuQ==
=Iloe
-----END PGP SIGNATURE-----

--rV8arf8D5Dod9UkK--
