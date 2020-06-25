Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB67520A17C
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 17:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405647AbgFYPBY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 11:01:24 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37624 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405502AbgFYPBY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 11:01:24 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nicolas)
        with ESMTPSA id 73EA82A5609
Message-ID: <079f79676335c32941e0021b84849164858c09df.camel@collabora.com>
Subject: Re: [RFC 4/7] media: uapi: h264: increase size of fields
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
Date:   Thu, 25 Jun 2020 11:01:17 -0400
In-Reply-To: <20200623182809.1375-5-ezequiel@collabora.com>
References: <20200623182809.1375-1-ezequiel@collabora.com>
         <20200623182809.1375-5-ezequiel@collabora.com>
Organization: Collabora
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-9RBrC6l+NKPdk3Yh+xmn"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-9RBrC6l+NKPdk3Yh+xmn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 23 juin 2020 =C3=A0 15:28 -0300, Ezequiel Garcia a =C3=A9crit :
> Slice header syntax element 'first_mb_in_slice' can point
> to the last macroblock, currently the field can only reference
> 65536 macroblocks which is insufficient for 8K videos.
>=20
> DPB entry PicNum maximum value is 2*MaxFrameNum for interlaced
> content (field_pic_flag=3D1).
>=20
> Therefore, increase 'first_mb_in_slice' and 'pic_num'.
>=20
> The v4l2_h264_dpb_entry struct needs to be padded to avoid a hole,
> which will be useful to allow future uAPI extensions.
>=20
> Note that v4l2_ctrl_h264_slice_params struct will be modified
> in a follow-up commit, and so we defer its 64-bit padding.

This patch includes two changes, with two distinct rationale. Please
split in two, I would also add reference to the spec in the commit
messages. The explanation is also insufficient. Need to mention that
macro-blocks are 16x16, and the bounds for synthetic value
MaxFrameNum (derived from bitstream value) has not be mention either.

>=20
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-codec.rst          | 7 +++++--
>  drivers/media/v4l2-core/v4l2-ctrls.c                     | 9 +++++++++
>  include/media/h264-ctrls.h                               | 6 ++++--
>  include/media/v4l2-h264.h                                | 2 +-
>  4 files changed, 19 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/=
Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 0808a36777b6..e3b5a28fb965 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1772,7 +1772,7 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type =
-
>      * - __u32
>        - ``header_bit_size``
>        -
> -    * - __u16
> +    * - __u32
>        - ``first_mb_in_slice``
>        -
>      * - __u8
> @@ -2046,7 +2046,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type=
 -
>      * - __u16
>        - ``frame_num``
>        -
> -    * - __u16
> +    * - __u8
> +      - ``reserved[6]``
> +      - Applications and drivers must set this to zero.
> +    * - __u32
>        - ``pic_num``
>        -
>      * - __s32
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-co=
re/v4l2-ctrls.c
> index 6abd023f10c7..a751c14f9c22 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -1734,6 +1734,7 @@ static int std_validate_compound(const struct v4l2_=
ctrl *ctrl, u32 idx,
>  	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
>  	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
>  	struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
> +	struct v4l2_ctrl_h264_decode_params *p_h264_dec_params;
>  	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
>  	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
>  	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
> @@ -1808,6 +1809,14 @@ static int std_validate_compound(const struct v4l2=
_ctrl *ctrl, u32 idx,
>  		}
>  		break;
>  	case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
> +		p_h264_dec_params =3D p;
> +
> +		for (i =3D 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++) {
> +			struct v4l2_h264_dpb_entry *dpb_entry =3D
> +				&p_h264_dec_params->dpb[i];
> +
> +			zero_reserved(*dpb_entry);
> +		}
>  		break;
> =20
>  	case V4L2_CTRL_TYPE_VP8_FRAME_HEADER:
> diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> index c6cbf178c1c9..a938d16b901c 100644
> --- a/include/media/h264-ctrls.h
> +++ b/include/media/h264-ctrls.h
> @@ -161,7 +161,8 @@ struct v4l2_ctrl_h264_slice_params {
>  	/* Offset in bits to slice_data() from the beginning of this slice. */
>  	__u32 header_bit_size;
> =20
> -	__u16 first_mb_in_slice;
> +	__u32 first_mb_in_slice;
> +
>  	__u8 slice_type;
>  	__u8 pic_parameter_set_id;
>  	__u8 colour_plane_id;
> @@ -208,7 +209,8 @@ struct v4l2_ctrl_h264_slice_params {
>  struct v4l2_h264_dpb_entry {
>  	__u64 reference_ts;
>  	__u16 frame_num;
> -	__u16 pic_num;
> +	__u8 reserved[6];
> +	__u32 pic_num;
>  	/* Note that field is indicated by v4l2_buffer.field */
>  	__s32 top_field_order_cnt;
>  	__s32 bottom_field_order_cnt;
> diff --git a/include/media/v4l2-h264.h b/include/media/v4l2-h264.h
> index bc9ebb560ccf..1a5f26fc2a9a 100644
> --- a/include/media/v4l2-h264.h
> +++ b/include/media/v4l2-h264.h
> @@ -33,7 +33,7 @@ struct v4l2_h264_reflist_builder {
>  	struct {
>  		s32 pic_order_count;
>  		int frame_num;
> -		u16 pic_num;
> +		u32 pic_num;
>  		u16 longterm : 1;
>  	} refs[V4L2_H264_NUM_DPB_ENTRIES];
>  	s32 cur_pic_order_count;

--=-9RBrC6l+NKPdk3Yh+xmn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXvS8PQAKCRBxUwItrAao
HFAWAJwJtTQhBZ6Uu12RvpMLRx2LZUXjAgCgweRrhAETGilW6ronzbt8tOxnlMA=
=rhWe
-----END PGP SIGNATURE-----

--=-9RBrC6l+NKPdk3Yh+xmn--

