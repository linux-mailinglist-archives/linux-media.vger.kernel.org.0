Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A756AC942D
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 00:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727510AbfJBWOi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 18:14:38 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:46303 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbfJBWOi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 18:14:38 -0400
X-Originating-IP: 132.205.230.6
Received: from aptenodytes (unknown [132.205.230.6])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 3D79540002;
        Wed,  2 Oct 2019 22:14:33 +0000 (UTC)
Date:   Wed, 2 Oct 2019 18:14:31 -0400
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     mripard@kernel.org, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] media: cedrus: Use helpers to access capture queue
Message-ID: <20191002221431.GC24151@aptenodytes>
References: <20191002193553.1633467-1-jernej.skrabec@siol.net>
 <20191002193553.1633467-4-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="E13BgyNx05feLLmH"
Content-Disposition: inline
In-Reply-To: <20191002193553.1633467-4-jernej.skrabec@siol.net>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--E13BgyNx05feLLmH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed 02 Oct 19, 21:35, Jernej Skrabec wrote:
> Accessing capture queue structue directly is not safe. Use helpers for
> that.

Looks good to me, thanks!

Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.h      | 8 ++++++--
>  drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 8 ++++++--
>  2 files changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.h
> index 986e059e3202..c45fb9a7ad07 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> @@ -197,12 +197,16 @@ static inline dma_addr_t cedrus_buf_addr(struct vb2=
_buffer *buf,
>  static inline dma_addr_t cedrus_dst_buf_addr(struct cedrus_ctx *ctx,
>  					     int index, unsigned int plane)
>  {
> -	struct vb2_buffer *buf;
> +	struct vb2_buffer *buf =3D NULL;
> +	struct vb2_queue *vq;
> =20
>  	if (index < 0)
>  		return 0;
> =20
> -	buf =3D ctx->fh.m2m_ctx->cap_q_ctx.q.bufs[index];
> +	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
> +	if (vq)
> +		buf =3D vb2_get_buffer(vq, index);
> +
>  	return buf ? cedrus_buf_addr(buf, &ctx->dst_fmt, plane) : 0;
>  }
> =20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h264.c
> index 4a0e69855c7f..4650982c69a8 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -97,7 +97,7 @@ static void cedrus_write_frame_list(struct cedrus_ctx *=
ctx,
>  	const struct v4l2_ctrl_h264_decode_params *decode =3D run->h264.decode_=
params;
>  	const struct v4l2_ctrl_h264_slice_params *slice =3D run->h264.slice_par=
ams;
>  	const struct v4l2_ctrl_h264_sps *sps =3D run->h264.sps;
> -	struct vb2_queue *cap_q =3D &ctx->fh.m2m_ctx->cap_q_ctx.q;
> +	struct vb2_queue *cap_q;
>  	struct cedrus_buffer *output_buf;
>  	struct cedrus_dev *dev =3D ctx->dev;
>  	unsigned long used_dpbs =3D 0;
> @@ -105,6 +105,8 @@ static void cedrus_write_frame_list(struct cedrus_ctx=
 *ctx,
>  	unsigned int output =3D 0;
>  	unsigned int i;
> =20
> +	cap_q =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
> +
>  	memset(pic_list, 0, sizeof(pic_list));
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(decode->dpb); i++) {
> @@ -168,12 +170,14 @@ static void _cedrus_write_ref_list(struct cedrus_ct=
x *ctx,
>  				   enum cedrus_h264_sram_off sram)
>  {
>  	const struct v4l2_ctrl_h264_decode_params *decode =3D run->h264.decode_=
params;
> -	struct vb2_queue *cap_q =3D &ctx->fh.m2m_ctx->cap_q_ctx.q;
> +	struct vb2_queue *cap_q;
>  	struct cedrus_dev *dev =3D ctx->dev;
>  	u8 sram_array[CEDRUS_MAX_REF_IDX];
>  	unsigned int i;
>  	size_t size;
> =20
> +	cap_q =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
> +
>  	memset(sram_array, 0, sizeof(sram_array));
> =20
>  	for (i =3D 0; i < num_ref; i++) {
> --=20
> 2.23.0
>=20

--E13BgyNx05feLLmH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl2VIUcACgkQ3cLmz3+f
v9HzRAf+OqbOygEqhcbZloYVPB2rS29QcQKUP4rVGVIuXOB1zlPNlUSIhRoHZsmg
0he5hJDyuo7Kq6MZR9mvCUJkag/AOb+cBC2SJfvTvnVCKB55mVdRCWQUtoTzlSXJ
PFrH2udiYvCdTC8O373wlaUvQTfWlf2uRtkd34wl0WgZsS2UuTQ4kGw9XvhG4sTT
c4Ghncxb5kKRBta7hjlEa048lf/Xouj8Et06XYbLwlrcD6F2fWjiyZ+3lkwVEmIO
cOxQvtOmY9Gzwdz3fKGuhhHkfQ/lwaaOyHcbrMjvH3/Pqirqg6fQP7/7CuoBStEc
UIrz8/f7mOG4vou/8BmrQRYaAr+4zw==
=9PuQ
-----END PGP SIGNATURE-----

--E13BgyNx05feLLmH--
