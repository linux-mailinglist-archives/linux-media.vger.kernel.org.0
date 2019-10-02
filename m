Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C196AC93DB
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 23:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbfJBVyt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 17:54:49 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:58889 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726128AbfJBVyt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 17:54:49 -0400
Received: from aptenodytes (unknown [132.205.230.6])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id AA261100003;
        Wed,  2 Oct 2019 21:54:44 +0000 (UTC)
Date:   Wed, 2 Oct 2019 17:54:42 -0400
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     mripard@kernel.org, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] media: cedrus: Fix decoding for some H264 videos
Message-ID: <20191002215442.GA24151@aptenodytes>
References: <20191002193553.1633467-1-jernej.skrabec@siol.net>
 <20191002193553.1633467-2-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
In-Reply-To: <20191002193553.1633467-2-jernej.skrabec@siol.net>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed 02 Oct 19, 21:35, Jernej Skrabec wrote:
> It seems that for some H264 videos at least one bitstream parsing
> trigger must be called in order to be decoded correctly. There is no
> explanation why this helps, but it was observed that two sample videos
> with this fix are now decoded correctly and there is no regression with
> others.

I understand there might be some magic going on under the hood here, but I =
would
be interested in trying to understand what's really going on.

For instance, comparing register dumps of the whole H264 block before/after
calling the hardware parser could help, and comparing that to using the pre=
vious
code (without hardware parsing).

I could try and have a look if you have an available sample for testing the
erroneous case!

Another minor thing: do you have some idea of whether the udelay call adds
significant delay in the process?

Cheers and thanks for the patch!

Paul

> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  .../staging/media/sunxi/cedrus/cedrus_h264.c  | 30 +++++++++++++++++--
>  .../staging/media/sunxi/cedrus/cedrus_regs.h  |  3 ++
>  2 files changed, 30 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h264.c
> index d6a782703c9b..bd848146eada 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -6,6 +6,7 @@
>   * Copyright (c) 2018 Bootlin
>   */
> =20
> +#include <linux/delay.h>
>  #include <linux/types.h>
> =20
>  #include <media/videobuf2-dma-contig.h>
> @@ -289,6 +290,28 @@ static void cedrus_write_pred_weight_table(struct ce=
drus_ctx *ctx,
>  	}
>  }
> =20
> +/*
> + * It turns out that using VE_H264_VLD_OFFSET to skip bits is not reliab=
le. In
> + * rare cases frame is not decoded correctly. However, setting offset to=
 0 and
> + * skipping appropriate amount of bits with flush bits trigger always wo=
rks.
> + */
> +static void cedrus_skip_bits(struct cedrus_dev *dev, int num)
> +{
> +	int count =3D 0;
> +
> +	while (count < num) {
> +		int tmp =3D min(num - count, 32);
>
> +
> +		cedrus_write(dev, VE_H264_TRIGGER_TYPE,
> +			     VE_H264_TRIGGER_TYPE_FLUSH_BITS |
> +			     VE_H264_TRIGGER_TYPE_N_BITS(tmp));
> +		while (cedrus_read(dev, VE_H264_STATUS) & VE_H264_STATUS_VLD_BUSY)
> +			udelay(1);
> +
> +		count +=3D tmp;
> +	}
> +}
> +
>  static void cedrus_set_params(struct cedrus_ctx *ctx,
>  			      struct cedrus_run *run)
>  {
> @@ -299,12 +322,11 @@ static void cedrus_set_params(struct cedrus_ctx *ct=
x,
>  	struct vb2_buffer *src_buf =3D &run->src->vb2_buf;
>  	struct cedrus_dev *dev =3D ctx->dev;
>  	dma_addr_t src_buf_addr;
> -	u32 offset =3D slice->header_bit_size;
> -	u32 len =3D (slice->size * 8) - offset;
> +	u32 len =3D slice->size * 8;
>  	u32 reg;
> =20
>  	cedrus_write(dev, VE_H264_VLD_LEN, len);
> -	cedrus_write(dev, VE_H264_VLD_OFFSET, offset);
> +	cedrus_write(dev, VE_H264_VLD_OFFSET, 0);
> =20
>  	src_buf_addr =3D vb2_dma_contig_plane_dma_addr(src_buf, 0);
>  	cedrus_write(dev, VE_H264_VLD_END,
> @@ -323,6 +345,8 @@ static void cedrus_set_params(struct cedrus_ctx *ctx,
>  	cedrus_write(dev, VE_H264_TRIGGER_TYPE,
>  		     VE_H264_TRIGGER_TYPE_INIT_SWDEC);
> =20
> +	cedrus_skip_bits(dev, slice->header_bit_size);
> +
>  	if (((pps->flags & V4L2_H264_PPS_FLAG_WEIGHTED_PRED) &&
>  	     (slice->slice_type =3D=3D V4L2_H264_SLICE_TYPE_P ||
>  	      slice->slice_type =3D=3D V4L2_H264_SLICE_TYPE_SP)) ||
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/s=
taging/media/sunxi/cedrus/cedrus_regs.h
> index 3329f9aaf975..b52926a54025 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> @@ -538,13 +538,16 @@
>  					 VE_H264_CTRL_SLICE_DECODE_INT)
> =20
>  #define VE_H264_TRIGGER_TYPE		0x224
> +#define VE_H264_TRIGGER_TYPE_N_BITS(x)		(((x) & 0x3f) << 8)
>  #define VE_H264_TRIGGER_TYPE_AVC_SLICE_DECODE	(8 << 0)
>  #define VE_H264_TRIGGER_TYPE_INIT_SWDEC		(7 << 0)
> +#define VE_H264_TRIGGER_TYPE_FLUSH_BITS		(3 << 0)
> =20
>  #define VE_H264_STATUS			0x228
>  #define VE_H264_STATUS_VLD_DATA_REQ_INT		VE_H264_CTRL_VLD_DATA_REQ_INT
>  #define VE_H264_STATUS_DECODE_ERR_INT		VE_H264_CTRL_DECODE_ERR_INT
>  #define VE_H264_STATUS_SLICE_DECODE_INT		VE_H264_CTRL_SLICE_DECODE_INT
> +#define VE_H264_STATUS_VLD_BUSY			BIT(8)
> =20
>  #define VE_H264_STATUS_INT_MASK			VE_H264_CTRL_INT_MASK
> =20
> --=20
> 2.23.0
>=20

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl2VHKIACgkQ3cLmz3+f
v9Fh/Af9GyVy5KNZkifK5kCwy7+K0g6QPZG35LlJmVdVto99qVx6UcgP9NZS/uBX
EebSolJysTj4DgpkXz/vsQy1gdMzMylUQAY0mqb6WCXlyyHkI54vOiXP1TcACSO2
9z2eK1RuJfOxxTxWqoo7CP46Fl5tAKnEGox60Xt8B+ouPDsE4aFTNYhxz9szJj0O
E3W5oCWdsoKVnp7zlTwrNTk0rQKJcKxSWVOtE+AvZUYRNqDysIYs1UNje70XLGjM
fQKjAP29I8XShgJqRtZVHHGyWS2EooK3r7UJw9dhbGQZ+jJGJuGdd3Bj858sRBC2
5Pxis3T4ttOXAvBWtDX2jBZgqZG78g==
=R09t
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
