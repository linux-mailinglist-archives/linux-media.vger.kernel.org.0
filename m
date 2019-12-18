Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3A01241F0
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2019 09:41:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbfLRIk6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Dec 2019 03:40:58 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:54153 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726682AbfLRIk6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Dec 2019 03:40:58 -0500
X-Originating-IP: 109.190.253.16
Received: from aptenodytes (unknown [109.190.253.16])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 58A6B1BF203;
        Wed, 18 Dec 2019 08:40:49 +0000 (UTC)
Date:   Wed, 18 Dec 2019 09:40:47 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     mchehab@kernel.org, mripard@kernel.org, hverkuil@xs4all.nl,
        gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] media: cedrus: Fix decoding for some HEVC videos
Message-ID: <20191218084047.GA2900@aptenodytes>
References: <20191213161516.54688-1-jernej.skrabec@siol.net>
 <20191213161516.54688-2-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline
In-Reply-To: <20191213161516.54688-2-jernej.skrabec@siol.net>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 13 Dec 19, 17:15, Jernej Skrabec wrote:
> It seems that for some HEVC videos at least one bitstream parsing
> trigger must be called in order to be decoded correctly. There is no
> explanation why this helps, but it was observed that several videos
> with this fix are now decoded correctly and there is no regression with
> others.
>=20
> Without this fix, those same videos totally crash HEVC decoder (other
> decoder engines are unaffected). After decoding those problematic
> videos, HEVC decoder always returns only green image (all zeros).
> Only complete HW reset helps.
>=20
> This fix is similar to that for H264.

Thanks for the fix, interesting that the same issue shows up on HEVC!
I suspect that Allwinner folks never really tested the engine without
using it for bitstream parsing.

Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  .../staging/media/sunxi/cedrus/cedrus_h265.c  | 25 ++++++++++++++++---
>  .../staging/media/sunxi/cedrus/cedrus_regs.h  |  1 +
>  2 files changed, 23 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h265.c
> index 109d3289418c..5a207f1e137c 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> @@ -7,6 +7,7 @@
>   * Copyright (C) 2018 Bootlin
>   */
> =20
> +#include <linux/delay.h>
>  #include <linux/types.h>
> =20
>  #include <media/videobuf2-dma-contig.h>
> @@ -283,6 +284,23 @@ static void cedrus_h265_write_scaling_list(struct ce=
drus_ctx *ctx,
>  		}
>  }
> =20
> +static void cedrus_h265_skip_bits(struct cedrus_dev *dev, int num)
> +{
> +	int count =3D 0;
> +
> +	while (count < num) {
> +		int tmp =3D min(num - count, 32);
> +
> +		cedrus_write(dev, VE_DEC_H265_TRIGGER,
> +			     VE_DEC_H265_TRIGGER_FLUSH_BITS |
> +			     VE_DEC_H265_TRIGGER_TYPE_N_BITS(tmp));
> +		while (cedrus_read(dev, VE_DEC_H265_STATUS) & VE_DEC_H265_STATUS_VLD_B=
USY)
> +			udelay(1);
> +
> +		count +=3D tmp;
> +	}
> +}
> +
>  static void cedrus_h265_setup(struct cedrus_ctx *ctx,
>  			      struct cedrus_run *run)
>  {
> @@ -347,10 +365,9 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
> =20
>  	/* Source offset and length in bits. */
> =20
> -	reg =3D slice_params->data_bit_offset;
> -	cedrus_write(dev, VE_DEC_H265_BITS_OFFSET, reg);
> +	cedrus_write(dev, VE_DEC_H265_BITS_OFFSET, 0);
> =20
> -	reg =3D slice_params->bit_size - slice_params->data_bit_offset;
> +	reg =3D slice_params->bit_size;
>  	cedrus_write(dev, VE_DEC_H265_BITS_LEN, reg);
> =20
>  	/* Source beginning and end addresses. */
> @@ -385,6 +402,8 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
>  	/* Initialize bitstream access. */
>  	cedrus_write(dev, VE_DEC_H265_TRIGGER, VE_DEC_H265_TRIGGER_INIT_SWDEC);
> =20
> +	cedrus_h265_skip_bits(dev, slice_params->data_bit_offset);
> +
>  	/* Bitstream parameters. */
> =20
>  	reg =3D VE_DEC_H265_DEC_NAL_HDR_NAL_UNIT_TYPE(slice_params->nal_unit_ty=
pe) |
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/s=
taging/media/sunxi/cedrus/cedrus_regs.h
> index 0d9449fe2b28..df1cceef8d93 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> @@ -424,6 +424,7 @@
> =20
>  #define VE_DEC_H265_TRIGGER			(VE_ENGINE_DEC_H265 + 0x34)
> =20
> +#define VE_DEC_H265_TRIGGER_TYPE_N_BITS(x)	(((x) & 0x3f) << 8)
>  #define VE_DEC_H265_TRIGGER_STCD_VC1		(0x02 << 4)
>  #define VE_DEC_H265_TRIGGER_STCD_AVS		(0x01 << 4)
>  #define VE_DEC_H265_TRIGGER_STCD_HEVC		(0x00 << 4)
> --=20
> 2.24.0
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl355g8ACgkQ3cLmz3+f
v9F0uwf/R/7HIpAkOCE+eajb2oib3qb5ln2OZ7fCjMlLQDlRZ1bcsz1oTGipGarM
dYR0EkPQBmnMNeNb6ETU2fUcchrvZPSaaC5LcU/qhFVEFH/gL7B4bkzOihBnGtSQ
MABZstZZMDLgq6zos5bfzUrCYgFJ3J2xeLupendqeQoHOoOssMrAsjoXsZ6pmeQg
q6u6PXxv/SEb/PB32iNyq1ryvaTMs4dvQzF0LB0Ds5nKStG7zzbcj3lCNT/azRdR
8xk9AXbf9jpdfb0zeqOkC92jODe8hytbX7FCQmZpZiKNaNbde9XV2+wG83hJuHW5
090NQ6+4oit/hO9RMuSSDq6fR2P4+g==
=plwW
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--
