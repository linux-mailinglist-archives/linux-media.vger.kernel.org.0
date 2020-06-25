Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9046A20A161
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 16:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405536AbgFYOz5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 10:55:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405482AbgFYOz5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 10:55:57 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D236EC08C5C1;
        Thu, 25 Jun 2020 07:55:56 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nicolas)
        with ESMTPSA id 5ED4D2A5603
Message-ID: <2d41ab4daef0e9a188e6416d0dc4a5abe20bb195.camel@collabora.com>
Subject: Re: [RFC 5/7] media: uapi: h264: pad v4l2_ctrl_h264_pps to 64-bit
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reply-To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date:   Thu, 25 Jun 2020 10:55:50 -0400
In-Reply-To: <20200623182809.1375-6-ezequiel@collabora.com>
References: <20200623182809.1375-1-ezequiel@collabora.com>
         <20200623182809.1375-6-ezequiel@collabora.com>
Organization: Collabora
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-5mB/fLJIBDmsj/H+AEVD"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-5mB/fLJIBDmsj/H+AEVD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 23 juin 2020 =C3=A0 15:28 -0300, Ezequiel Garcia a =C3=A9crit :
> The struct does not contain 64-bit types, and therefore
> doesn't suffer from compatibility issues.
>=20
> However, having it aligned to 64-bits is cleaner and
> has the advantage of allowing future extensions.

This one seems a bit random too, it's a final/fixed bitstream syntax.
I'm not certain this is really needed.

>=20
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 3 +++
>  drivers/media/v4l2-core/v4l2-ctrls.c                      | 5 +++++
>  include/media/h264-ctrls.h                                | 1 +
>  3 files changed, 9 insertions(+)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/=
Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index e3b5a28fb965..2c682f81aaad 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1662,6 +1662,9 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type =
-
>      * - __u16
>        - ``flags``
>        - See :ref:`Picture Parameter Set Flags <h264_pps_flags>`
> +    * - __u32
> +      - ``reserved``
> +      - Applications and drivers must set this to zero.
> =20
>  .. _h264_pps_flags:
> =20
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-co=
re/v4l2-ctrls.c
> index a751c14f9c22..003333b6c7f7 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -1735,6 +1735,7 @@ static int std_validate_compound(const struct v4l2_=
ctrl *ctrl, u32 idx,
>  	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
>  	struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
>  	struct v4l2_ctrl_h264_decode_params *p_h264_dec_params;
> +	struct v4l2_ctrl_h264_pps *p_h264_pps;
>  	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
>  	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
>  	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
> @@ -1792,7 +1793,11 @@ static int std_validate_compound(const struct v4l2=
_ctrl *ctrl, u32 idx,
>  		break;
> =20
>  	case V4L2_CTRL_TYPE_H264_SPS:
> +		break;
>  	case V4L2_CTRL_TYPE_H264_PPS:
> +		p_h264_pps =3D p;
> +		zero_reserved(*p_h264_pps);
> +		break;
>  	case V4L2_CTRL_TYPE_H264_SCALING_MATRIX:
>  		break;
>  	case V4L2_CTRL_TYPE_H264_SLICE_PARAMS:
> diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> index a938d16b901c..4119dc4486f3 100644
> --- a/include/media/h264-ctrls.h
> +++ b/include/media/h264-ctrls.h
> @@ -111,6 +111,7 @@ struct v4l2_ctrl_h264_pps {
>  	__s8 chroma_qp_index_offset;
>  	__s8 second_chroma_qp_index_offset;
>  	__u16 flags;
> +	__u32 reserved;
>  };
> =20
>  struct v4l2_ctrl_h264_scaling_matrix {

--=-5mB/fLJIBDmsj/H+AEVD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXvS69gAKCRBxUwItrAao
HEUIAJ9iIhGr2wan1WWM4uxySWtzEwaOAgCePb4hoAdrfOmAciC6Md6rdjr/uWE=
=562I
-----END PGP SIGNATURE-----

--=-5mB/fLJIBDmsj/H+AEVD--

