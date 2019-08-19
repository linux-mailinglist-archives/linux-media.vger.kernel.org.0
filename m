Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12B70923A9
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 14:41:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727172AbfHSMlO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 08:41:14 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:54133 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbfHSMlO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 08:41:14 -0400
X-Originating-IP: 86.250.200.211
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 766A11BF20D;
        Mon, 19 Aug 2019 12:41:10 +0000 (UTC)
Date:   Mon, 19 Aug 2019 14:41:10 +0200
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
Subject: Re: [PATCH v7 02/11] media: uapi: h264: Rename pixel format
Message-ID: <20190819124110.GB32182@aptenodytes>
References: <20190816160132.7352-1-ezequiel@collabora.com>
 <20190816160132.7352-3-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="aVD9QWMuhilNxW9f"
Content-Disposition: inline
In-Reply-To: <20190816160132.7352-3-ezequiel@collabora.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--aVD9QWMuhilNxW9f
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 16 Aug 19, 13:01, Ezequiel Garcia wrote:
> The V4L2_PIX_FMT_H264_SLICE_RAW name was originally suggested
> because the pixel format would represent H264 slices without any
> start code.
>=20
> However, as we will now introduce a start code menu control,
> give the pixel format a more meaningful name, while it's
> still early enough to do so.

I definitely agree that SLICE_RAW is not the suffix we are looking for, but=
 I'm
not sure that _SLICE is self-describing given that we can operate either
per-frame or per-slice, and _SLICE sort of implies the latter. Also, VP8 us=
es
_FRAME to clearly indicate that it operates per-frame.

In addition, the _SLICE suffix is used by MPEG-2 in the stable API. Since we
certainly want MPEG-2 to allow per-slice and per-frame decoding as well as
H.264 and that the _SLICE format is specified to be the broken "concatenated
slices" that cedrus expects, we probably want to use another suffix. This w=
ay,
we could deprecated MPEG2_SLICE and introduce a new format for MPEG-2 that =
would
have consistent naming with the other mpeg formats.

One suggestion I had was to call it H264_PARSED (and apply this to MPEG-2 a=
nd
HEVC when similar controls to H.264 are set in place for them). I think Han=
s had
another suggestion for the name but I don't recall what it was at this poin=
t.

Either way, if this has to be some debate, we could perhaps take it off your
series and stay with SLICE_RAW for now, as long as we do rename it before m=
aking
the API stable.

What do you think?

Cheers,

Paul

> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Tested-by: Philipp Zabel <p.zabel@pengutronix.de>
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
>  Documentation/media/uapi/v4l/pixfmt-compressed.rst | 4 ++--
>  drivers/media/v4l2-core/v4l2-ioctl.c               | 2 +-
>  drivers/staging/media/sunxi/cedrus/cedrus_dec.c    | 2 +-
>  drivers/staging/media/sunxi/cedrus/cedrus_video.c  | 6 +++---
>  include/media/h264-ctrls.h                         | 2 +-
>  5 files changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/Documentation/media/uapi/v4l/pixfmt-compressed.rst b/Documen=
tation/media/uapi/v4l/pixfmt-compressed.rst
> index f52a7b67023d..9b65473a2288 100644
> --- a/Documentation/media/uapi/v4l/pixfmt-compressed.rst
> +++ b/Documentation/media/uapi/v4l/pixfmt-compressed.rst
> @@ -52,9 +52,9 @@ Compressed Formats
>        - ``V4L2_PIX_FMT_H264_MVC``
>        - 'M264'
>        - H264 MVC video elementary stream.
> -    * .. _V4L2-PIX-FMT-H264-SLICE-RAW:
> +    * .. _V4L2-PIX-FMT-H264-SLICE:
> =20
> -      - ``V4L2_PIX_FMT_H264_SLICE_RAW``
> +      - ``V4L2_PIX_FMT_H264_SLICE``
>        - 'S264'
>        - H264 parsed slice data, without the start code and as
>  	extracted from the H264 bitstream.  This format is adapted for
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
> index bb5b4926538a..39f10621c91b 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1343,7 +1343,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *f=
mt)
>  		case V4L2_PIX_FMT_H264:		descr =3D "H.264"; break;
>  		case V4L2_PIX_FMT_H264_NO_SC:	descr =3D "H.264 (No Start Codes)"; brea=
k;
>  		case V4L2_PIX_FMT_H264_MVC:	descr =3D "H.264 MVC"; break;
> -		case V4L2_PIX_FMT_H264_SLICE_RAW:	descr =3D "H.264 Parsed Slice Data";=
 break;
> +		case V4L2_PIX_FMT_H264_SLICE:	descr =3D "H.264 Parsed Slice Data"; bre=
ak;
>  		case V4L2_PIX_FMT_H263:		descr =3D "H.263"; break;
>  		case V4L2_PIX_FMT_MPEG1:	descr =3D "MPEG-1 ES"; break;
>  		case V4L2_PIX_FMT_MPEG2:	descr =3D "MPEG-2 ES"; break;
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/st=
aging/media/sunxi/cedrus/cedrus_dec.c
> index bdad87eb9d79..56ca4c9ad01c 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> @@ -46,7 +46,7 @@ void cedrus_device_run(void *priv)
>  			V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION);
>  		break;
> =20
> -	case V4L2_PIX_FMT_H264_SLICE_RAW:
> +	case V4L2_PIX_FMT_H264_SLICE:
>  		run.h264.decode_params =3D cedrus_find_control_data(ctx,
>  			V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS);
>  		run.h264.pps =3D cedrus_find_control_data(ctx,
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_video.c
> index 681dfe3367a6..eeee3efd247b 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -38,7 +38,7 @@ static struct cedrus_format cedrus_formats[] =3D {
>  		.directions	=3D CEDRUS_DECODE_SRC,
>  	},
>  	{
> -		.pixelformat	=3D V4L2_PIX_FMT_H264_SLICE_RAW,
> +		.pixelformat	=3D V4L2_PIX_FMT_H264_SLICE,
>  		.directions	=3D CEDRUS_DECODE_SRC,
>  	},
>  	{
> @@ -104,7 +104,7 @@ static void cedrus_prepare_format(struct v4l2_pix_for=
mat *pix_fmt)
> =20
>  	switch (pix_fmt->pixelformat) {
>  	case V4L2_PIX_FMT_MPEG2_SLICE:
> -	case V4L2_PIX_FMT_H264_SLICE_RAW:
> +	case V4L2_PIX_FMT_H264_SLICE:
>  		/* Zero bytes per line for encoded source. */
>  		bytesperline =3D 0;
> =20
> @@ -449,7 +449,7 @@ static int cedrus_start_streaming(struct vb2_queue *v=
q, unsigned int count)
>  		ctx->current_codec =3D CEDRUS_CODEC_MPEG2;
>  		break;
> =20
> -	case V4L2_PIX_FMT_H264_SLICE_RAW:
> +	case V4L2_PIX_FMT_H264_SLICE:
>  		ctx->current_codec =3D CEDRUS_CODEC_H264;
>  		break;
> =20
> diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> index e1404d78d6ff..6160a69c0143 100644
> --- a/include/media/h264-ctrls.h
> +++ b/include/media/h264-ctrls.h
> @@ -14,7 +14,7 @@
>  #include <linux/videodev2.h>
> =20
>  /* Our pixel format isn't stable at the moment */
> -#define V4L2_PIX_FMT_H264_SLICE_RAW v4l2_fourcc('S', '2', '6', '4') /* H=
264 parsed slices */
> +#define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 =
parsed slices */
> =20
>  /*
>   * This is put insanely high to avoid conflicting with controls that
> --=20
> 2.22.0
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--aVD9QWMuhilNxW9f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl1amOYACgkQ3cLmz3+f
v9FbNQf9FUsvvX+rt+98RlG0Ufj+V8MrfHqu/bM2WO7ayPUDT7qm1sC46F8uurVU
iGLjgEYLkkJMYEWcEKGspv/C79AwlOtZtDQCKbpcfg+S7G7xG+JJuQhHqg6JXqGn
Js09sHFePUbZlvD8kDs/GKaTOAa4UmtzWk6Wjw30FkCWvG93h7mDJ8IgZ3XQsOnj
vtV7VBddAefYDT3/JnvbmqWCb5r52lzDBISdCTk7Z0bxrxXpV4DstLkO6zgGtBo0
OnXdm/HmzHkZQ27pkA8MpSQrc4Q+W88xudpKCSksV1fTyzacP2sC+DIKjBgMB1DN
60LEflf4vNzYPRNDD1UBf/iceHmJng==
=R5eV
-----END PGP SIGNATURE-----

--aVD9QWMuhilNxW9f--
