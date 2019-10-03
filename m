Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09D3ECB0CD
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 23:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729968AbfJCVHe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 17:07:34 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:55307 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728766AbfJCVHd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 17:07:33 -0400
X-Originating-IP: 132.205.230.8
Received: from aptenodytes (unknown [132.205.230.8])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 5BE6420021;
        Thu,  3 Oct 2019 21:07:30 +0000 (UTC)
Date:   Thu, 3 Oct 2019 17:07:29 -0400
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        kernel@pengutronix.de
Subject: Re: [PATCH 1/2] media: uapi: h264: Add
 num_ref_idx_active_override_flag
Message-ID: <20191003210729.GB3927@aptenodytes>
References: <20190905101533.525-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="p4qYPpj5QlsIQJ0K"
Content-Disposition: inline
In-Reply-To: <20190905101533.525-1-p.zabel@pengutronix.de>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--p4qYPpj5QlsIQJ0K
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu 05 Sep 19, 12:15, Philipp Zabel wrote:
> This flag tells the kernel whether the slice header contained the
> num_ref_idx_l[01]_active_minus1 syntax elements, or whether the
> num_ref_idx_l[01]_default_active_minus1 from PPS should be used
> instead.

Looks good to me:
Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 3 +++
>  include/media/h264-ctrls.h                       | 1 +
>  2 files changed, 4 insertions(+)
>=20
> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documenta=
tion/media/uapi/v4l/ext-ctrls-codec.rst
> index bc5dd8e76567..451a5b0f2a35 100644
> --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> @@ -1860,6 +1860,9 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>      * - ``V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH``
>        - 0x00000008
>        -
> +    * - ``V4L2_H264_SLICE_FLAG_NUM_REF_IDX_ACTIVE_OVERRIDE
> +      - 0x00000010
> +      - Corresponds to the num_ref_idx_active_override_flag syntax eleme=
nt.
> =20
>  ``Prediction Weight Table``
> =20
> diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> index e877bf1d537c..dab519aea9bf 100644
> --- a/include/media/h264-ctrls.h
> +++ b/include/media/h264-ctrls.h
> @@ -133,6 +133,7 @@ struct v4l2_h264_pred_weight_table {
>  #define V4L2_H264_SLICE_FLAG_BOTTOM_FIELD		0x02
>  #define V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED	0x04
>  #define V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH		0x08
> +#define V4L2_H264_SLICE_FLAG_NUM_REF_IDX_ACTIVE_OVERRIDE	0x10
> =20
>  struct v4l2_ctrl_h264_slice_params {
>  	/* Size in bytes, including header */
> --=20
> 2.20.1
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--p4qYPpj5QlsIQJ0K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl2WYxAACgkQ3cLmz3+f
v9GAawf/dllViVAsM2H8FsNpely7WBH4+i80DBk4GnfwO1oe0E8PLRpRTc9LSvBA
BvNh6XIkwj2UYPzneZS9sXXXsfZpBgetXfYQ1p0vAFMGqt9gkxr1+moTpaoXj1uc
xQ6lcVPSD5NvMIj+JxCHV+vsa2Ab7pHOR8a8xAxjmhhiI79NSIqX3giBz4TOIUd6
6J8fpJt+M5Bmbi+QOxneMH4so4SutP5MsGvY8sRssHLU9jKHPq+X/TinQ+fuE+PR
9EwEe0tJtuuGlsu/CoINkgMWQWiENrJG/5Q5oYKmhhhzI1vMq9L5k9QApHI+KjM7
esvuP8K11NYxnOhvf3FghLnsMGcHEQ==
=cYaz
-----END PGP SIGNATURE-----

--p4qYPpj5QlsIQJ0K--
