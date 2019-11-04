Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6AC8EDC02
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 11:02:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727444AbfKDKCc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 05:02:32 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:41617 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726364AbfKDKCc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 05:02:32 -0500
X-Originating-IP: 86.250.200.211
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 9B449E000F;
        Mon,  4 Nov 2019 10:02:28 +0000 (UTC)
Date:   Mon, 4 Nov 2019 11:02:28 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     mripard@kernel.org, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH 1/3] media: cedrus: Properly signal size in mode register
Message-ID: <20191104100228.GD502900@aptenodytes>
References: <20191026074959.1073512-1-jernej.skrabec@siol.net>
 <20191026074959.1073512-2-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="o0ZfoUVt4BxPQnbU"
Content-Disposition: inline
In-Reply-To: <20191026074959.1073512-2-jernej.skrabec@siol.net>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--o0ZfoUVt4BxPQnbU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jernej,

On Sat 26 Oct 19, 09:49, Jernej Skrabec wrote:
> Mode register also holds information if video width is bigger than 2048
> and if it is equal to 4096.
>=20
> Rework cedrus_engine_enable() to properly signal this properties.

Thanks for the patch, looks good to me!

Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

One minor thing: maybe we should have a way to set the maximum dimensions
depending on the generation of the engine in use and the actual maximum
supported by the hardware.

Maybe either as dedicated new fields in struct cedrus_variant or as
capability flags.

Anyway that can be done later since we were already hardcoding this.

Cheers,

Paul

> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_h264.c  | 2 +-
>  drivers/staging/media/sunxi/cedrus/cedrus_h265.c  | 2 +-
>  drivers/staging/media/sunxi/cedrus/cedrus_hw.c    | 9 +++++++--
>  drivers/staging/media/sunxi/cedrus/cedrus_hw.h    | 2 +-
>  drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c | 2 +-
>  drivers/staging/media/sunxi/cedrus/cedrus_regs.h  | 2 ++
>  6 files changed, 13 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h264.c
> index 7487f6ab7576..d2c854ecdf15 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -485,7 +485,7 @@ static void cedrus_h264_setup(struct cedrus_ctx *ctx,
>  {
>  	struct cedrus_dev *dev =3D ctx->dev;
> =20
> -	cedrus_engine_enable(dev, CEDRUS_CODEC_H264);
> +	cedrus_engine_enable(ctx, CEDRUS_CODEC_H264);
> =20
>  	cedrus_write(dev, VE_H264_SDROT_CTRL, 0);
>  	cedrus_write(dev, VE_H264_EXTRA_BUFFER1,
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h265.c
> index 9bc921866f70..6945dc74e1d7 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> @@ -276,7 +276,7 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
>  	}
> =20
>  	/* Activate H265 engine. */
> -	cedrus_engine_enable(dev, CEDRUS_CODEC_H265);
> +	cedrus_engine_enable(ctx, CEDRUS_CODEC_H265);
> =20
>  	/* Source offset and length in bits. */
> =20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/sta=
ging/media/sunxi/cedrus/cedrus_hw.c
> index 570a9165dd5d..3acfa21bc124 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> @@ -30,7 +30,7 @@
>  #include "cedrus_hw.h"
>  #include "cedrus_regs.h"
> =20
> -int cedrus_engine_enable(struct cedrus_dev *dev, enum cedrus_codec codec)
> +int cedrus_engine_enable(struct cedrus_ctx *ctx, enum cedrus_codec codec)
>  {
>  	u32 reg =3D 0;
> =20
> @@ -58,7 +58,12 @@ int cedrus_engine_enable(struct cedrus_dev *dev, enum =
cedrus_codec codec)
>  		return -EINVAL;
>  	}
> =20
> -	cedrus_write(dev, VE_MODE, reg);
> +	if (ctx->src_fmt.width =3D=3D 4096)
> +		reg |=3D VE_MODE_PIC_WIDTH_IS_4096;
> +	if (ctx->src_fmt.width > 2048)
> +		reg |=3D VE_MODE_PIC_WIDTH_MORE_2048;
> +
> +	cedrus_write(ctx->dev, VE_MODE, reg);
> =20
>  	return 0;
>  }
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.h b/drivers/sta=
ging/media/sunxi/cedrus/cedrus_hw.h
> index 27d0882397aa..604ff932fbf5 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
> @@ -16,7 +16,7 @@
>  #ifndef _CEDRUS_HW_H_
>  #define _CEDRUS_HW_H_
> =20
> -int cedrus_engine_enable(struct cedrus_dev *dev, enum cedrus_codec codec=
);
> +int cedrus_engine_enable(struct cedrus_ctx *ctx, enum cedrus_codec codec=
);
>  void cedrus_engine_disable(struct cedrus_dev *dev);
> =20
>  void cedrus_dst_format_set(struct cedrus_dev *dev,
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_mpeg2.c
> index 13c34927bad5..8bcd6b8f9e2d 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> @@ -96,7 +96,7 @@ static void cedrus_mpeg2_setup(struct cedrus_ctx *ctx, =
struct cedrus_run *run)
>  	quantization =3D run->mpeg2.quantization;
> =20
>  	/* Activate MPEG engine. */
> -	cedrus_engine_enable(dev, CEDRUS_CODEC_MPEG2);
> +	cedrus_engine_enable(ctx, CEDRUS_CODEC_MPEG2);
> =20
>  	/* Set intra quantization matrix. */
> =20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/s=
taging/media/sunxi/cedrus/cedrus_regs.h
> index 4275a307d282..ace3d49fcd82 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> @@ -35,6 +35,8 @@
> =20
>  #define VE_MODE					0x00
> =20
> +#define VE_MODE_PIC_WIDTH_IS_4096		BIT(22)
> +#define VE_MODE_PIC_WIDTH_MORE_2048		BIT(21)
>  #define VE_MODE_REC_WR_MODE_2MB			(0x01 << 20)
>  #define VE_MODE_REC_WR_MODE_1MB			(0x00 << 20)
>  #define VE_MODE_DDR_MODE_BW_128			(0x03 << 16)
> --=20
> 2.23.0
>=20

--o0ZfoUVt4BxPQnbU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl2/9zQACgkQ3cLmz3+f
v9EubAgAmUIZeySh71s8rHkCSlkdX+UHT6XXaoe+hv3ONRwlmpfPCj+EV1Mrw45E
Goi0n/i1MK9LemXtxLB0ZK1pC5rQX2MfF+6qtFHVHYKya1wq/V9Y1j0Pl+Pun2q8
xCRg0HerWiI7KtQbNlZYXTVoPC8CQKIU1mq3t4aJfeUacygESgR1sHkS9d4XioEN
yP8hfRdePwpkgel46F++Cl84z4qGS+GrKEtvKMtHLiPunkc7IBa2PqwfYkgdKJzW
uOWAqrOx6MLqtuXjrERD6zvwIU7GV+0FR8YKVPIIdYAZgC1PuW3e8HRqhL1ZZ4T8
ucGvXZ4OzlmoGUDghjbT+7HLXLXX0A==
=HSxM
-----END PGP SIGNATURE-----

--o0ZfoUVt4BxPQnbU--
