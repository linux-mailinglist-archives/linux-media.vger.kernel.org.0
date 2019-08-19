Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 778D89237D
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 14:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbfHSMbk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 08:31:40 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:46477 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726594AbfHSMbj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 08:31:39 -0400
X-Originating-IP: 86.250.200.211
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id D8119240008;
        Mon, 19 Aug 2019 12:31:31 +0000 (UTC)
Date:   Mon, 19 Aug 2019 14:31:31 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 06/11] media: cedrus: Cleanup control initialization
Message-ID: <20190819123131.GA32182@aptenodytes>
References: <20190816160132.7352-1-ezequiel@collabora.com>
 <20190816160132.7352-7-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Content-Disposition: inline
In-Reply-To: <20190816160132.7352-7-ezequiel@collabora.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 16 Aug 19, 13:01, Ezequiel Garcia wrote:
> In order to introduce other controls, the control initialization
> needs to support an initial struct v4l2_ctrl_control.
>=20
> While here, let's cleanup the control initialization,
> removing unneeded fields.

Thanks for the change!

Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
> Changes in v7:
> * None.
> Changes in v6:
> * None.
> Changes in v5:
> * None.
> Changes in v4:
> * New patch.
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.c | 45 +++++++++++----------
>  drivers/staging/media/sunxi/cedrus/cedrus.h |  3 +-
>  2 files changed, 25 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
> index 370937edfc14..7bdc413bf727 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -29,44 +29,51 @@
> =20
>  static const struct cedrus_control cedrus_controls[] =3D {
>  	{
> -		.id		=3D V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS,
> -		.elem_size	=3D sizeof(struct v4l2_ctrl_mpeg2_slice_params),
> +		.cfg =3D {
> +			.id	=3D V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS,
> +		},
>  		.codec		=3D CEDRUS_CODEC_MPEG2,
>  		.required	=3D true,
>  	},
>  	{
> -		.id		=3D V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION,
> -		.elem_size	=3D sizeof(struct v4l2_ctrl_mpeg2_quantization),
> +		.cfg =3D {
> +			.id	=3D V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION,
> +		},
>  		.codec		=3D CEDRUS_CODEC_MPEG2,
>  		.required	=3D false,
>  	},
>  	{
> -		.id		=3D V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS,
> -		.elem_size	=3D sizeof(struct v4l2_ctrl_h264_decode_params),
> +		.cfg =3D {
> +			.id	=3D V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS,
> +		},
>  		.codec		=3D CEDRUS_CODEC_H264,
>  		.required	=3D true,
>  	},
>  	{
> -		.id		=3D V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS,
> -		.elem_size	=3D sizeof(struct v4l2_ctrl_h264_slice_params),
> +		.cfg =3D {
> +			.id	=3D V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS,
> +		},
>  		.codec		=3D CEDRUS_CODEC_H264,
>  		.required	=3D true,
>  	},
>  	{
> -		.id		=3D V4L2_CID_MPEG_VIDEO_H264_SPS,
> -		.elem_size	=3D sizeof(struct v4l2_ctrl_h264_sps),
> +		.cfg =3D {
> +			.id	=3D V4L2_CID_MPEG_VIDEO_H264_SPS,
> +		},
>  		.codec		=3D CEDRUS_CODEC_H264,
>  		.required	=3D true,
>  	},
>  	{
> -		.id		=3D V4L2_CID_MPEG_VIDEO_H264_PPS,
> -		.elem_size	=3D sizeof(struct v4l2_ctrl_h264_pps),
> +		.cfg =3D {
> +			.id	=3D V4L2_CID_MPEG_VIDEO_H264_PPS,
> +		},
>  		.codec		=3D CEDRUS_CODEC_H264,
>  		.required	=3D true,
>  	},
>  	{
> -		.id		=3D V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX,
> -		.elem_size	=3D sizeof(struct v4l2_ctrl_h264_scaling_matrix),
> +		.cfg =3D {
> +			.id	=3D V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX,
> +		},
>  		.codec		=3D CEDRUS_CODEC_H264,
>  		.required	=3D true,
>  	},
> @@ -106,12 +113,8 @@ static int cedrus_init_ctrls(struct cedrus_dev *dev,=
 struct cedrus_ctx *ctx)
>  		return -ENOMEM;
> =20
>  	for (i =3D 0; i < CEDRUS_CONTROLS_COUNT; i++) {
> -		struct v4l2_ctrl_config cfg =3D {};
> -
> -		cfg.elem_size =3D cedrus_controls[i].elem_size;
> -		cfg.id =3D cedrus_controls[i].id;
> -
> -		ctrl =3D v4l2_ctrl_new_custom(hdl, &cfg, NULL);
> +		ctrl =3D v4l2_ctrl_new_custom(hdl, &cedrus_controls[i].cfg,
> +					    NULL);
>  		if (hdl->error) {
>  			v4l2_err(&dev->v4l2_dev,
>  				 "Failed to create new custom control\n");
> @@ -178,7 +181,7 @@ static int cedrus_request_validate(struct media_reque=
st *req)
>  			continue;
> =20
>  		ctrl_test =3D v4l2_ctrl_request_hdl_ctrl_find(hdl,
> -							    cedrus_controls[i].id);
> +							    cedrus_controls[i].cfg.id);
>  		if (!ctrl_test) {
>  			v4l2_info(&ctx->dev->v4l2_dev,
>  				  "Missing required codec control\n");
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.h
> index d8e6777e5e27..2f017a651848 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> @@ -49,8 +49,7 @@ enum cedrus_h264_pic_type {
>  };
> =20
>  struct cedrus_control {
> -	u32			id;
> -	u32			elem_size;
> +	struct v4l2_ctrl_config cfg;
>  	enum cedrus_codec	codec;
>  	unsigned char		required:1;
>  };
> --=20
> 2.22.0
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl1alqMACgkQ3cLmz3+f
v9FHGgf9GLCQ3HMQRLLRzQ23YG4MhNKPyvS67MXgy+nC7SUk4wllp+NwI9uTGkXZ
my2QXgKSmJZOZL5D6SMa2IRMbfebAUfRcosZSjsu9HBheoMnXnRst06mSaQd+Q0H
KoaHiAL65KKGaiWPgkMqVpr1mpJv6qaJ5BpFa+IRqKKPXxfn70CG7A7odiyEzAVN
oFe0Ai8iiHlhw7dCL3vxcotf4radt8PivRBp8jRwXtTv54XV1TrYDjRysMCwzmZl
pTSS8ioM8QwSyxjDzH45kDFXQH3Hxh4iIUTh1SYAfxUNSWRieaWhN3BGIJ63It1h
3Lgr7cpxBlH/5+y4H35NpZmqgSPLNQ==
=C07M
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--
