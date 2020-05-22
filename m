Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C168B1DF0A0
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 22:27:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731002AbgEVU1o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 16:27:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730976AbgEVU1n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 16:27:43 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CDBFC061A0E;
        Fri, 22 May 2020 13:27:43 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nicolas)
        with ESMTPSA id 61F5E2A0D98
Message-ID: <91ff6561f7ad1170283127dd1a54b72d64524ec5.camel@collabora.com>
Subject: Re: [PATCH] media: rkvdec: Fix H264 scaling list order
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reply-To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Jonas Karlman <jonas@kwiboo.se>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Fri, 22 May 2020 16:27:37 -0400
In-Reply-To: <20200522202130.13306-1-jonas@kwiboo.se>
References: <20200522202130.13306-1-jonas@kwiboo.se>
Organization: Collabora
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-ugTiZ55EwgDvKXpGml0K"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-ugTiZ55EwgDvKXpGml0K
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 22 mai 2020 =C3=A0 20:21 +0000, Jonas Karlman a =C3=A9crit :
> The Rockchip Video Decoder driver is expecting that the values in a
> scaling list are in zig-zag order and applies the inverse scanning proces=
s
> to get the values in matrix order.
>=20
> Commit 0b0393d59eb4 ("media: uapi: h264: clarify expected
> scaling_list_4x4/8x8 order") clarified that the values in the scaling lis=
t
> should already be in matrix order.
>=20
> Fix this by removing the reordering and change to use two memcpy.
>=20
> Fixes: cd33c830448b ("media: rkvdec: Add the rkvdec driver")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

I've tested it over GStreamer implementation. Note that in addition to
this patch, we should now fix the documentation. The documentation says
that the scaling list order should be that same as in the bitstream
(that means zigzag order). But I believe it make sense to move to
raster order as we know have the knowledge that this is what all the HW
we supports uses and is what one would pass to VAAPI, NVDEC and DXVA2
too.

Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/staging/media/rkvdec/rkvdec-h264.c | 70 +++++++---------------
>  1 file changed, 22 insertions(+), 48 deletions(-)
>=20
> diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging=
/media/rkvdec/rkvdec-h264.c
> index cd4980d06be7..2719f0c66a4a 100644
> --- a/drivers/staging/media/rkvdec/rkvdec-h264.c
> +++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
> @@ -18,11 +18,16 @@
>  /* Size with u32 units. */
>  #define RKV_CABAC_INIT_BUFFER_SIZE	(3680 + 128)
>  #define RKV_RPS_SIZE			((128 + 128) / 4)
> -#define RKV_SCALING_LIST_SIZE		(6 * 16 + 6 * 64 + 128)
>  #define RKV_ERROR_INFO_SIZE		(256 * 144 * 4)
> =20
>  #define RKVDEC_NUM_REFLIST		3
> =20
> +struct rkvdec_scaling_matrix {
> +	u8 scaling_list_4x4[6][16];
> +	u8 scaling_list_8x8[6][64];
> +	u8 padding[128];
> +};
> +
>  struct rkvdec_sps_pps_packet {
>  	u32 info[8];
>  };
> @@ -86,7 +91,7 @@ struct rkvdec_ps_field {
>  /* Data structure describing auxiliary buffer format. */
>  struct rkvdec_h264_priv_tbl {
>  	s8 cabac_table[4][464][2];
> -	u8 scaling_list[RKV_SCALING_LIST_SIZE];
> +	struct rkvdec_scaling_matrix scaling_list;
>  	u32 rps[RKV_RPS_SIZE];
>  	struct rkvdec_sps_pps_packet param_set[256];
>  	u8 err_info[RKV_ERROR_INFO_SIZE];
> @@ -785,56 +790,25 @@ static void assemble_hw_rps(struct rkvdec_ctx *ctx,
>  	}
>  }
> =20
> -/*
> - * NOTE: The values in a scaling list are in zig-zag order, apply invers=
e
> - * scanning process to get the values in matrix order.
> - */
> -static const u32 zig_zag_4x4[16] =3D {
> -	0, 1, 4, 8, 5, 2, 3, 6, 9, 12, 13, 10, 7, 11, 14, 15
> -};
> -
> -static const u32 zig_zag_8x8[64] =3D {
> -	0,  1,  8, 16,  9,  2,  3, 10, 17, 24, 32, 25, 18, 11,  4,  5,
> -	12, 19, 26, 33, 40, 48, 41, 34, 27, 20, 13,  6,  7, 14, 21, 28,
> -	35, 42, 49, 56, 57, 50, 43, 36, 29, 22, 15, 23, 30, 37, 44, 51,
> -	58, 59, 52, 45, 38, 31, 39, 46, 53, 60, 61, 54, 47, 55, 62, 63
> -};
> -
> -static void reorder_scaling_list(struct rkvdec_ctx *ctx,
> -				 struct rkvdec_h264_run *run)
> +static void assemble_hw_scaling_list(struct rkvdec_ctx *ctx,
> +				     struct rkvdec_h264_run *run)
>  {
>  	const struct v4l2_ctrl_h264_scaling_matrix *scaling =3D run->scaling_ma=
trix;
> -	const size_t num_list_4x4 =3D ARRAY_SIZE(scaling->scaling_list_4x4);
> -	const size_t list_len_4x4 =3D ARRAY_SIZE(scaling->scaling_list_4x4[0]);
> -	const size_t num_list_8x8 =3D ARRAY_SIZE(scaling->scaling_list_8x8);
> -	const size_t list_len_8x8 =3D ARRAY_SIZE(scaling->scaling_list_8x8[0]);
>  	struct rkvdec_h264_ctx *h264_ctx =3D ctx->priv;
>  	struct rkvdec_h264_priv_tbl *tbl =3D h264_ctx->priv_tbl.cpu;
> -	u8 *dst =3D tbl->scaling_list;
> -	const u8 *src;
> -	int i, j;
> -
> -	BUILD_BUG_ON(ARRAY_SIZE(zig_zag_4x4) !=3D list_len_4x4);
> -	BUILD_BUG_ON(ARRAY_SIZE(zig_zag_8x8) !=3D list_len_8x8);
> -	BUILD_BUG_ON(ARRAY_SIZE(tbl->scaling_list) <
> -		     num_list_4x4 * list_len_4x4 +
> -		     num_list_8x8 * list_len_8x8);
> -
> -	src =3D &scaling->scaling_list_4x4[0][0];
> -	for (i =3D 0; i < num_list_4x4; ++i) {
> -		for (j =3D 0; j < list_len_4x4; ++j)
> -			dst[zig_zag_4x4[j]] =3D src[j];
> -		src +=3D list_len_4x4;
> -		dst +=3D list_len_4x4;
> -	}
> =20
> -	src =3D &scaling->scaling_list_8x8[0][0];
> -	for (i =3D 0; i < num_list_8x8; ++i) {
> -		for (j =3D 0; j < list_len_8x8; ++j)
> -			dst[zig_zag_8x8[j]] =3D src[j];
> -		src +=3D list_len_8x8;
> -		dst +=3D list_len_8x8;
> -	}
> +	BUILD_BUG_ON(sizeof(tbl->scaling_list.scaling_list_4x4) !=3D
> +		     sizeof(scaling->scaling_list_4x4));
> +	BUILD_BUG_ON(sizeof(tbl->scaling_list.scaling_list_8x8) !=3D
> +		     sizeof(scaling->scaling_list_8x8));
> +
> +	memcpy(tbl->scaling_list.scaling_list_4x4,
> +	       scaling->scaling_list_4x4,
> +	       sizeof(scaling->scaling_list_4x4));
> +
> +	memcpy(tbl->scaling_list.scaling_list_8x8,
> +	       scaling->scaling_list_8x8,
> +	       sizeof(scaling->scaling_list_8x8));
>  }
> =20
>  /*
> @@ -1126,7 +1100,7 @@ static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
>  	v4l2_h264_build_b_ref_lists(&reflist_builder, h264_ctx->reflists.b0,
>  				    h264_ctx->reflists.b1);
> =20
> -	reorder_scaling_list(ctx, &run);
> +	assemble_hw_scaling_list(ctx, &run);
>  	assemble_hw_pps(ctx, &run);
>  	assemble_hw_rps(ctx, &run);
>  	config_registers(ctx, &run);

--=-ugTiZ55EwgDvKXpGml0K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXsg1uQAKCRBxUwItrAao
HCP1AJ0SJnDm3+/AQ2A6yNQv7C6m4CLJtACffi7AgkxZKFAwhUn011nQ6ii/HEk=
=p1oh
-----END PGP SIGNATURE-----

--=-ugTiZ55EwgDvKXpGml0K--

