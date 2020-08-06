Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 336A423DD01
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 18:59:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729687AbgHFQ7H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 12:59:07 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:40360 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728652AbgHFQ6o (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 12:58:44 -0400
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 15E803A5156;
        Thu,  6 Aug 2020 15:55:52 +0000 (UTC)
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 44E35FF806;
        Thu,  6 Aug 2020 15:50:29 +0000 (UTC)
Date:   Thu, 6 Aug 2020 17:50:28 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [PATCH v2 08/14] media: uapi: h264: Drop SLICE_PARAMS 'size'
 field
Message-ID: <20200806155028.GB1621078@aptenodytes>
References: <20200806151310.98624-1-ezequiel@collabora.com>
 <20200806151310.98624-9-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4bRzO86E/ozDv8r1"
Content-Disposition: inline
In-Reply-To: <20200806151310.98624-9-ezequiel@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--4bRzO86E/ozDv8r1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu 06 Aug 20, 12:13, Ezequiel Garcia wrote:
> The SLICE_PARAMS control is intended for slice-based
> devices. In this mode, the OUTPUT buffer contains
> a single slice, and so the buffer's plane payload size
> can be used to query the slice size.

If we later extend the API for supporting multiple slices with dynamic array
controls, I guess we'll need to know the size of each slice in each control
elements. So I'd rather keep that even if it's indeed redundant with
vb2_get_plane_payload in single-slice mode.

What do you think?

Paul

> To reduce the API surface drop the size from the
> SLICE_PARAMS control.
>=20
> A follow-up change will remove other members in SLICE_PARAMS
> so we don't need to add padding fields here.
>=20
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 3 ---
>  drivers/staging/media/sunxi/cedrus/cedrus_h264.c          | 7 +++----
>  include/media/h264-ctrls.h                                | 3 ---
>  3 files changed, 3 insertions(+), 10 deletions(-)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/=
Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 427fc5727ec0..fff74b7bf32a 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1760,9 +1760,6 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>      :stub-columns: 0
>      :widths:       1 1 2
> =20
> -    * - __u32
> -      - ``size``
> -      -
>      * - __u32
>        - ``start_byte_offset``
>          Offset (in bytes) from the beginning of the OUTPUT buffer to the=
 start
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h264.c
> index a9ba78b15907..8b6f05aadbe8 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -324,17 +324,16 @@ static void cedrus_set_params(struct cedrus_ctx *ct=
x,
>  	struct vb2_buffer *src_buf =3D &run->src->vb2_buf;
>  	struct cedrus_dev *dev =3D ctx->dev;
>  	dma_addr_t src_buf_addr;
> -	u32 len =3D slice->size * 8;
> +	size_t slice_bytes =3D vb2_get_plane_payload(src_buf, 0);
>  	unsigned int pic_width_in_mbs;
>  	bool mbaff_pic;
>  	u32 reg;
> =20
> -	cedrus_write(dev, VE_H264_VLD_LEN, len);
> +	cedrus_write(dev, VE_H264_VLD_LEN, slice_bytes * 8);
>  	cedrus_write(dev, VE_H264_VLD_OFFSET, 0);
> =20
>  	src_buf_addr =3D vb2_dma_contig_plane_dma_addr(src_buf, 0);
> -	cedrus_write(dev, VE_H264_VLD_END,
> -		     src_buf_addr + vb2_get_plane_payload(src_buf, 0));
> +	cedrus_write(dev, VE_H264_VLD_END, src_buf_addr + slice_bytes);
>  	cedrus_write(dev, VE_H264_VLD_ADDR,
>  		     VE_H264_VLD_ADDR_VAL(src_buf_addr) |
>  		     VE_H264_VLD_ADDR_FIRST | VE_H264_VLD_ADDR_VALID |
> diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> index 4f05ee265997..f74736fcfa00 100644
> --- a/include/media/h264-ctrls.h
> +++ b/include/media/h264-ctrls.h
> @@ -158,9 +158,6 @@ struct v4l2_h264_reference {
>  };
> =20
>  struct v4l2_ctrl_h264_slice_params {
> -	/* Size in bytes, including header */
> -	__u32 size;
> -
>  	/* Offset in bytes to the start of slice in the OUTPUT buffer. */
>  	__u32 start_byte_offset;
> =20
> --=20
> 2.27.0
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--4bRzO86E/ozDv8r1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl8sJsQACgkQ3cLmz3+f
v9GziAf/aWLfWuyKKjVuqFynldaS4RSWzbw6EJfK4ufM4h4s7Mv1daAa2UgJw0Vo
zow7RsiuGlB66zWBGumoUKPpM3HHu2MQ0yed9OpzRAuNWJH+v0SBHCUbJ85b9VeH
0XQ+VeVIewp9Vud0ddtOZlrtoKS5MXXOatJ1jUtWveTRSHKiCZXZfYizSemxfJWh
bKVPdKM3jXsDL/Q91eRC4rKAQTlTqG9DnO2hwbW8bTZx1tFzyU+qLSyjrHtiv8mG
/go8eJzl+Y00DoI6YDt+E6PBSFPZkFsXv3Xsm+v4ZHUO9p2WTs80Me+RkjlOTWZ+
Sly1KTP5SiIuH11EXTOciAlKNeqCtw==
=qVuK
-----END PGP SIGNATURE-----

--4bRzO86E/ozDv8r1--
