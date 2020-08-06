Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EFD223DC4E
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 18:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729265AbgHFQsq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 12:48:46 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:42586 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729181AbgHFQsE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 12:48:04 -0400
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 4BD373A9E62;
        Thu,  6 Aug 2020 15:47:30 +0000 (UTC)
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id B435D1C0003;
        Thu,  6 Aug 2020 15:47:07 +0000 (UTC)
Date:   Thu, 6 Aug 2020 17:47:07 +0200
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
Subject: Re: [PATCH v2 01/14] media: uapi: h264: Update reference lists
Message-ID: <20200806154707.GA1621078@aptenodytes>
References: <20200806151310.98624-1-ezequiel@collabora.com>
 <20200806151310.98624-2-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline
In-Reply-To: <20200806151310.98624-2-ezequiel@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu 06 Aug 20, 12:12, Ezequiel Garcia wrote:
> From: Jernej Skrabec <jernej.skrabec@siol.net>
>=20
> When dealing with with interlaced frames, reference lists must tell if
> each particular reference is meant for top or bottom field. This info
> is currently not provided at all in the H264 related controls.
>=20
> Make reference lists hold a structure which will also hold an
> enumerator type along index into DPB array. The enumerator must
> be used to specify if reference is for top or bottom field.
>=20
> Currently the only user of these lists is Cedrus which is just compile
> fixed here. Actual usage of will come in a following commit.

Is there a particular reason we are adding this to the ref_pic_list[0-1]
instead of the DPB entries directly?

It feels nicer to avoid making the lists structs when the entries they are
referring to are already in a struct. I think this is the approach Kwiboo t=
ook
when adding support for fields in references some time ago.

What do you think?

Cheers,

Paul

> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
> v2:
> * As pointed out by Jonas, enum v4l2_h264_dpb_reference here.
> ---
>  .../media/v4l/ext-ctrls-codec.rst             | 44 ++++++++++++++++++-
>  .../staging/media/sunxi/cedrus/cedrus_h264.c  |  6 +--
>  include/media/h264-ctrls.h                    | 23 +++++++---
>  3 files changed, 62 insertions(+), 11 deletions(-)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/=
Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index d0d506a444b1..f2b2a381369f 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1843,10 +1843,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_typ=
e -
>      * - __u32
>        - ``slice_group_change_cycle``
>        -
> -    * - __u8
> +    * - struct :c:type:`v4l2_h264_reference`
>        - ``ref_pic_list0[32]``
>        - Reference picture list after applying the per-slice modifications
> -    * - __u8
> +    * - struct :c:type:`v4l2_h264_reference`
>        - ``ref_pic_list1[32]``
>        - Reference picture list after applying the per-slice modifications
>      * - __u32
> @@ -1926,6 +1926,46 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type=
 -
>        - ``chroma_offset[32][2]``
>        -
> =20
> +``Picture Reference``
> +
> +.. c:type:: v4l2_h264_reference
> +
> +.. cssclass:: longtable
> +
> +.. flat-table:: struct v4l2_h264_reference
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - enum :c:type:`v4l2_h264_dpb_reference`
> +      - ``reference``
> +      - Specifies how the DPB entry is referenced.
> +    * - __u8
> +      - ``index``
> +      - Index into the :c:type:`v4l2_ctrl_h264_decode_params`.dpb array.
> +
> +.. c:type:: v4l2_h264_dpb_reference
> +
> +.. cssclass:: longtable
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - ``V4L2_H264_DPB_TOP_REF``
> +      - 0x1
> +      - The top field in field pair is used for
> +        short-term reference.
> +    * - ``V4L2_H264_DPB_BOTTOM_REF``
> +      - 0x2
> +     - The bottom field in field pair is used for
> +        short-term reference.
> +    * - ``V4L2_H264_DPB_FRAME_REF``
> +      - 0x3
> +      - The frame (or the top/bottom fields, if it's a field pair)
> +        is used for short-term reference.
> +
>  ``V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS (struct)``
>      Specifies the decode parameters (as extracted from the bitstream)
>      for the associated H264 slice data. This includes the necessary
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h264.c
> index 54ee2aa423e2..cce527bbdf86 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -166,8 +166,8 @@ static void cedrus_write_frame_list(struct cedrus_ctx=
 *ctx,
> =20
>  static void _cedrus_write_ref_list(struct cedrus_ctx *ctx,
>  				   struct cedrus_run *run,
> -				   const u8 *ref_list, u8 num_ref,
> -				   enum cedrus_h264_sram_off sram)
> +				   const struct v4l2_h264_reference *ref_list,
> +				   u8 num_ref, enum cedrus_h264_sram_off sram)
>  {
>  	const struct v4l2_ctrl_h264_decode_params *decode =3D run->h264.decode_=
params;
>  	struct vb2_queue *cap_q;
> @@ -188,7 +188,7 @@ static void _cedrus_write_ref_list(struct cedrus_ctx =
*ctx,
>  		int buf_idx;
>  		u8 dpb_idx;
> =20
> -		dpb_idx =3D ref_list[i];
> +		dpb_idx =3D ref_list[i].index;
>  		dpb =3D &decode->dpb[dpb_idx];
> =20
>  		if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
> diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> index 080fd1293c42..4c0bb7f5fb05 100644
> --- a/include/media/h264-ctrls.h
> +++ b/include/media/h264-ctrls.h
> @@ -19,6 +19,8 @@
>   */
>  #define V4L2_H264_NUM_DPB_ENTRIES 16
> =20
> +#define V4L2_H264_REF_LIST_LEN (2 * V4L2_H264_NUM_DPB_ENTRIES)
> +
>  /* Our pixel format isn't stable at the moment */
>  #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 =
parsed slices */
> =20
> @@ -140,6 +142,19 @@ struct v4l2_h264_pred_weight_table {
>  #define V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED	0x04
>  #define V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH		0x08
> =20
> +enum v4l2_h264_dpb_reference {
> +	V4L2_H264_DPB_TOP_REF =3D 0x1,
> +	V4L2_H264_DPB_BOTTOM_REF =3D 0x2,
> +	V4L2_H264_DPB_FRAME_REF =3D 0x3,
> +};
> +
> +struct v4l2_h264_reference {
> +	enum v4l2_h264_dpb_reference fields;
> +
> +	/* Index into v4l2_ctrl_h264_decode_params.dpb[] */
> +	__u8 index;
> +};
> +
>  struct v4l2_ctrl_h264_slice_params {
>  	/* Size in bytes, including header */
>  	__u32 size;
> @@ -178,12 +193,8 @@ struct v4l2_ctrl_h264_slice_params {
>  	__u8 num_ref_idx_l1_active_minus1;
>  	__u32 slice_group_change_cycle;
> =20
> -	/*
> -	 * Entries on each list are indices into
> -	 * v4l2_ctrl_h264_decode_params.dpb[].
> -	 */
> -	__u8 ref_pic_list0[32];
> -	__u8 ref_pic_list1[32];
> +	struct v4l2_h264_reference ref_pic_list0[V4L2_H264_REF_LIST_LEN];
> +	struct v4l2_h264_reference ref_pic_list1[V4L2_H264_REF_LIST_LEN];
> =20
>  	__u32 flags;
>  };
> --=20
> 2.27.0
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl8sJfsACgkQ3cLmz3+f
v9G7JQf/TnWncpqO5avCsiYx8iHH1eLwDhPb6bnmWUzXT4OaXdC12feSeLbDMMg1
LJCN8vURx+PCw7lwqV86i3gVlvePQZ+BukVOELAomGEDJP4Wrr2mrz7Z0p5encuv
nQrzHqEdKZVi4CLXxNEsrqidJo/74vnUgeP10jtPG72+nluwXmOlACXeNJgA2/Ca
UfHUCjy6eXVvLShfabxuej+5GP4zVWAHRtwJi8Ar3Ik/WyazhWoqCvNguA2LxgUl
IRYWs4suJUAbR4ftreTcqEeb0bM60F7mxAik8UtnVvZd3YMgQL+4FBiA6nW+pYzu
ZFcdsq53+2TSQY/8E1vOZrZ87qwRiw==
=EiuI
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
