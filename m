Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 142465EA9E
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 19:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727013AbfGCRjS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 13:39:18 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41536 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726915AbfGCRjS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 13:39:18 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nicolas)
        with ESMTPSA id DEB0428AAD2
Message-ID: <4206efe071473daee60cc330ae7934697110516f.camel@collabora.com>
Subject: Re: [PATCH v2 1/2] media: uapi: Add VP8 stateless decoder API
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reply-To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com, Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org,
        Pawel Osciak <posciak@chromium.org>
Date:   Wed, 03 Jul 2019 13:39:09 -0400
In-Reply-To: <20190702170016.5210-2-ezequiel@collabora.com>
References: <20190702170016.5210-1-ezequiel@collabora.com>
         <20190702170016.5210-2-ezequiel@collabora.com>
Organization: Collabora Ltd.
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-mgHLFmVfLA+6/IZNWqyn"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-mgHLFmVfLA+6/IZNWqyn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 02 juillet 2019 =C3=A0 14:00 -0300, Ezequiel Garcia a =C3=A9crit :
> From: Pawel Osciak <posciak@chromium.org>
>=20
> Add the parsed VP8 frame pixel format and controls, to be used
> with the new stateless decoder API for VP8 to provide parameters
> for accelerator (aka stateless) codecs.
>=20
> Signed-off-by: Pawel Osciak <posciak@chromium.org>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> --
> Changes from v1:
> * Move 1-bit fields to flags in the respective structures.
> * Add padding fields to make all structures 8-byte aligned.
> * Reorder fields where needed to avoid padding as much as possible.
> * Fix documentation as needed.
>=20
> Changes from RFC:
> * Make sure the uAPI has the same size on x86, x86_64, arm and arm64.
> * Move entropy coder state fields to a struct.
> * Move key_frame field to the flags.
> * Remove unneeded first_part_offset field.
> * Add documentation.
> ---
>  Documentation/media/uapi/v4l/biblio.rst       |  10 +
>  .../media/uapi/v4l/ext-ctrls-codec.rst        | 323 ++++++++++++++++++
>  .../media/uapi/v4l/pixfmt-compressed.rst      |  20 ++
>  drivers/media/v4l2-core/v4l2-ctrls.c          |   8 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
>  include/media/v4l2-ctrls.h                    |   3 +
>  include/media/vp8-ctrls.h                     | 110 ++++++
>  7 files changed, 475 insertions(+)
>  create mode 100644 include/media/vp8-ctrls.h
>=20
> diff --git a/Documentation/media/uapi/v4l/biblio.rst b/Documentation/medi=
a/uapi/v4l/biblio.rst
> index 8f4eb8823d82..ad2ff258afa8 100644
> --- a/Documentation/media/uapi/v4l/biblio.rst
> +++ b/Documentation/media/uapi/v4l/biblio.rst
> @@ -395,3 +395,13 @@ colimg
>  :title:     Color Imaging: Fundamentals and Applications
> =20
>  :author:    Erik Reinhard et al.
> +
> +.. _vp8:
> +
> +VP8
> +=3D=3D=3D
> +
> +
> +:title:     RFC 6386: "VP8 Data Format and Decoding Guide"
> +
> +:author:    J. Bankoski et al.
> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documenta=
tion/media/uapi/v4l/ext-ctrls-codec.rst
> index d6ea2ffd65c5..aef335f175cd 100644
> --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> @@ -2234,6 +2234,329 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_typ=
e -
>      Quantization parameter for a P frame for FWHT. Valid range: from 1
>      to 31.
> =20
> +.. _v4l2-mpeg-vp8:
> +
> +``V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER (struct)``
> +    Specifies the frame parameters for the associated VP8 parsed frame d=
ata.
> +    This includes the necessary parameters for
> +    configuring a stateless hardware decoding pipeline for VP8.
> +    The bitstream parameters are defined according to :ref:`vp8`.
> +
> +    .. note::
> +
> +       This compound control is not yet part of the public kernel API an=
d
> +       it is expected to change.

nit: I'd remove the "it"

> +
> +.. c:type:: v4l2_ctrl_vp8_frame_header
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{5.8cm}|p{4.8cm}|p{6.6cm}|
> +
> +.. flat-table:: struct v4l2_ctrl_vp8_frame_header
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - struct :c:type:`v4l2_vp8_segment_header`
> +      - ``segment_header``
> +      - Structure with segment-based adjustments metadata.
> +    * - struct :c:type:`v4l2_vp8_loopfilter_header`
> +      - ``loopfilter_header``
> +      - Structure with loop filter level adjustments metadata.
> +    * - struct :c:type:`v4l2_vp8_quantization_header`
> +      - ``quant_header``
> +      - Structure with VP8 dequantization indices metadata.
> +    * - struct :c:type:`v4l2_vp8_entropy_header`
> +      - ``entropy_header``
> +      - Structure with VP8 entropy coder probabilities metadata.
> +    * - struct :c:type:`v4l2_vp8_entropy_coder_state`
> +      - ``coder_state``
> +      - Structure with VP8 entropy coder state.
> +    * - __u16
> +      - ``width``
> +      - The width of the frame. Must be set for all frames.
> +    * - __u16
> +      - ``height``
> +      - The height of the frame. Must be set for all frames.
> +    * - __u8
> +      - ``horizontal_scale``
> +      - Horizontal scaling factor.
> +    * - __u8
> +      - ``vertical_scaling factor``
> +      - Vertical scale.
> +    * - __u8
> +      - ``version``
> +      - Bitstream version.
> +    * - __u8
> +      - ``prob_skip_false``
> +      - Indicates the probability that the macroblock is not skipped.
> +    * - __u8
> +      - ``prob_intra``
> +      - Indicates the probability that a macroblock is intra-predicted.
> +    * - __u8
> +      - ``prob_last``
> +      - Indicates the probability that the last reference frame is used
> +        for inter-prediction
> +    * - __u8
> +      - ``prob_gf``
> +      - Indicates the probability that the golden reference frame is use=
d
> +        for inter-prediction
> +    * - __u8
> +      - ``num_dct_parts``
> +      - Number of DCT coefficients partitions.
> +    * - __u32
> +      - ``first_part_size``
> +      - Size of the first partition, i.e. the control partition.
> +    * - __u32
> +      - ``macroblock_bit_offset``
> +      - Offset in bits of macroblock data in the first partition. NOT IN=
 THE SPEC!

nit: "NOT IN THE SPEC" -> "This value is not explicit in the frame
header."

I am right to think that this is basically the size in bits of the
frame header ? Maybe it could be another way to formulate it ? I'm just
trying to think of formulation that will better guide the developers
implementing the parser feeding this. You basically need to parse the
header to get this size (as everything is dynamically sized).

> +    * - __u32
> +      - ``dct_part_sizes[8]``
> +      - DCT coefficients sizes.
> +    * - __u64
> +      - ``last_frame_ts``
> +      - Timestamp for the V4L2 capture buffer to use as last reference f=
rame, used
> +        with inter-coded frames. The timestamp refers to the ``timestamp=
`` field in
> +	struct :c:type:`v4l2_buffer`. Use the :c:func:`v4l2_timeval_to_ns()`
> +	function to convert the struct :c:type:`timeval` in struct
> +	:c:type:`v4l2_buffer` to a __u64.
> +    * - __u64
> +      - ``golden_frame_ts``
> +      - Timestamp for the V4L2 capture buffer to use as last reference f=
rame, used
> +        with inter-coded frames. The timestamp refers to the ``timestamp=
`` field in
> +	struct :c:type:`v4l2_buffer`. Use the :c:func:`v4l2_timeval_to_ns()`
> +	function to convert the struct :c:type:`timeval` in struct
> +	:c:type:`v4l2_buffer` to a __u64.
> +    * - __u64
> +      - ``alt_frame_ts``
> +      - Timestamp for the V4L2 capture buffer to use as alternate refere=
nce frame, used
> +        with inter-coded frames. The timestamp refers to the ``timestamp=
`` field in
> +	struct :c:type:`v4l2_buffer`. Use the :c:func:`v4l2_timeval_to_ns()`
> +	function to convert the struct :c:type:`timeval` in struct
> +	:c:type:`v4l2_buffer` to a __u64.
> +    * - __u64
> +      - ``flags``
> +      - See :ref:`Frame Header Flags <vp8_frame_header_flags>`
> +
> +.. _vp8_frame_header_flags:
> +
> +``Frame Header Flags``
> +
> +.. cssclass:: longtable
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - ``V4L2_VP8_FRAME_HEADER_FLAG_KEY_FRAME``
> +      - 0x01
> +      - Inidicates if the frame is a key frame.
> +    * - ``V4L2_VP8_FRAME_HEADER_FLAG_EXPERIMENTAL``
> +      - 0x02
> +      - Experimental bitstream.
> +    * - ``V4L2_VP8_FRAME_HEADER_FLAG_SHOW_FRAME``
> +      - 0x04
> +      - Show frame flag, indicates if the frame is for display.
> +    * - ``V4L2_VP8_FRAME_HEADER_FLAG_MB_NO_SKIP_COEFF``
> +      - 0x08
> +      - Enable/disable skipping of macroblocks with no non-zero coeffici=
ents.
> +    * - ``V4L2_VP8_FRAME_HEADER_FLAG_SIGN_BIAS_GOLDEN``
> +      - 0x10
> +      - Sign of motion vectors when the golden frame is referenced.
> +    * - ``V4L2_VP8_FRAME_HEADER_FLAG_SIGN_BIAS_ALT``
> +      - 0x20
> +      - Sign of motion vectors when the alt frame is referenced.
> +
> +.. c:type:: v4l2_vp8_entropy_coder_state
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: struct v4l2_vp8_entropy_coder_state
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __u8
> +      - ``range``
> +      -
> +    * - __u8
> +      - ``value``
> +      -
> +    * - __u8
> +      - ``bit_count``
> +      -
> +    * - __u8
> +      - ``padding``
> +      -
> +
> +.. c:type:: v4l2_vp8_segment_header
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: struct v4l2_vp8_segment_header
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __s8
> +      - ``quant_update[4]``
> +      - Signed quantizer value update.
> +    * - __s8
> +      - ``lf_update[4]``
> +      - Signed loop filter level value update.
> +    * - __u8
> +      - ``segment_probs[3]``
> +      - Segment probabilities.
> +    * - __u8
> +      - ``padding``
> +      -
> +    * - __u32
> +      - ``flags``
> +      - See :ref:`Segment Header Flags <vp8_segment_header_flags>`
> +
> +.. _vp8_segment_header_flags:
> +
> +``Segment Header Flags``
> +
> +.. cssclass:: longtable
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - ``V4L2_VP8_SEGMENT_HEADER_FLAG_ENABLED``
> +      - 0x01
> +      - Enable/disable segment-based adjustments.
> +    * - ``V4L2_VP8_SEGMENT_HEADER_FLAG_UPDATE_MAP``
> +      - 0x02
> +      - Indicates if the macroblock segmentation map is updated in this =
frame.
> +    * - ``V4L2_VP8_SEGMENT_HEADER_FLAG_UPDATE_FEATURE_DATA``
> +      - 0x04
> +      - Indicates if the segment feature data is updated in this frame.
> +    * - ``V4L2_VP8_SEGMENT_HEADER_FLAG_DELTA_VALUE_MODE``
> +      - 0x08
> +      - If is set, the segment feature data mode is delta-value.
> +        If cleared, it's absolute-value.
> +
> +.. c:type:: v4l2_vp8_loopfilter_header
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: struct v4l2_vp8_loopfilter_header
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __s8
> +      - ``ref_frm_delta[4]``
> +      - Reference adjustment (signed) delta value.
> +    * - __s8
> +      - ``mb_mode_delta[4]``
> +      - Macroblock prediction mode adjustment (signed) delta value.
> +    * - __u8
> +      - ``sharpness_level``
> +      - Sharpness level
> +    * - __u8
> +      - ``level``
> +      - Filter level
> +    * - __u16
> +      - ``padding``
> +      -
> +    * - __u32
> +      - ``flags``
> +      - See :ref:`Loopfilter Header Flags <vp8_loopfilter_header_flags>`
> +
> +.. _vp8_loopfilter_header_flags:
> +
> +``Loopfilter Header Flags``
> +
> +.. cssclass:: longtable
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - ``V4L2_VP8_LF_HEADER_ADJ_ENABLE``
> +      - 0x01
> +      - Enable/disable macroblock-level loop filter adjustment.
> +    * - ``V4L2_VP8_LF_HEADER_DELTA_UPDATE``
> +      - 0x02
> +      - Indicates if the delta values used in an adjustment are updated.
> +    * - ``V4L2_VP8_LF_FILTER_TYPE_SIMPLE``
> +      - 0x04
> +      - If set, indicates the filter type is simple.
> +        If cleared, the filter type is normal.
> +
> +.. c:type:: v4l2_vp8_quantization_header
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: struct v4l2_vp8_quantization_header
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __u8
> +      - ``y_ac_qi``
> +      - Luma AC coefficient table index.
> +    * - __s8
> +      - ``y_dc_delta``
> +      - Luma DC delta vaue.
> +    * - __s8
> +      - ``y2_dc_delta``
> +      - Y2 block DC delta value.
> +    * - __s8
> +      - ``y2_ac_delta``
> +      - Y2 block AC delta value.
> +    * - __s8
> +      - ``uv_dc_delta``
> +      - Chroma DC delta value.
> +    * - __s8
> +      - ``uv_ac_delta``
> +      - Chroma AC delta value.
> +    * - __u16
> +      - ``padding``
> +      -
> +
> +.. c:type:: v4l2_vp8_entropy_header
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: struct v4l2_vp8_entropy_header
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __u8
> +      - ``coeff_probs[4][8][3][11]``
> +      - Coefficient update probabilities.
> +    * - __u8
> +      - ``y_mode_probs[4]``
> +      - Luma mode update probabilities.
> +    * - __u8
> +      - ``uv_mode_probs[3]``
> +      - Chroma mode update probabilities.
> +    * - __u8
> +      - ``mv_probs[2][19]``
> +      - MV decoding update probabilities.
> +    * - __u8
> +      - ``padding[3]``
> +      -
> +
>  .. raw:: latex
> =20
>      \normalsize
> diff --git a/Documentation/media/uapi/v4l/pixfmt-compressed.rst b/Documen=
tation/media/uapi/v4l/pixfmt-compressed.rst
> index 4b701fc7653e..f52a7b67023d 100644
> --- a/Documentation/media/uapi/v4l/pixfmt-compressed.rst
> +++ b/Documentation/media/uapi/v4l/pixfmt-compressed.rst
> @@ -133,6 +133,26 @@ Compressed Formats
>        - ``V4L2_PIX_FMT_VP8``
>        - 'VP80'
>        - VP8 video elementary stream.
> +    * .. _V4L2-PIX-FMT-VP8-FRAME:
> +
> +      - ``V4L2_PIX_FMT_VP8_FRAME``
> +      - 'VP8F'
> +      - VP8 parsed frame, as extracted from the container.
> +	This format is adapted for stateless video decoders that implement a
> +	VP8 pipeline (using the :ref:`mem2mem` and :ref:`media-request-api`).
> +	Metadata associated with the frame to decode is required to be passed
> +	through the ``V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER`` control.
> +	See the :ref:`associated Codec Control IDs <v4l2-mpeg-vp8>`.
> +	Exactly one output and one capture buffer must be provided for use with
> +	this pixel format. The output buffer must contain the appropriate numbe=
r
> +	of macroblocks to decode a full corresponding frame to the matching
> +	capture buffer.
> +
> +	.. note::
> +
> +	   This format is not yet part of the public kernel API and it

nit: Same, would drop the "it".

> +	   is expected to change.
> +
>      * .. _V4L2-PIX-FMT-VP9:
> =20
>        - ``V4L2_PIX_FMT_VP9``
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-co=
re/v4l2-ctrls.c
> index 371537dd8cd3..7f94c431d94e 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -885,6 +885,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_VPX_P_FRAME_QP:		return "VPX P-Frame QP Value"=
;
>  	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:			return "VP8 Profile";
>  	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:			return "VP9 Profile";
> +	case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER:		return "VP8 Frame Header";
> =20
>  	/* HEVC controls */
>  	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP:		return "HEVC I-Frame QP Valu=
e";
> @@ -1345,6 +1346,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum=
 v4l2_ctrl_type *type,
>  	case V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS:
>  		*type =3D V4L2_CTRL_TYPE_H264_DECODE_PARAMS;
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER:
> +		*type =3D V4L2_CTRL_TYPE_VP8_FRAME_HEADER;
> +		break;
>  	default:
>  		*type =3D V4L2_CTRL_TYPE_INTEGER;
>  		break;
> @@ -1748,6 +1752,7 @@ static int std_validate(const struct v4l2_ctrl *ctr=
l, u32 idx,
>  	case V4L2_CTRL_TYPE_H264_SCALING_MATRIX:
>  	case V4L2_CTRL_TYPE_H264_SLICE_PARAMS:
>  	case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
> +	case V4L2_CTRL_TYPE_VP8_FRAME_HEADER:
>  		return 0;
> =20
>  	default:
> @@ -2348,6 +2353,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_=
ctrl_handler *hdl,
>  	case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
>  		elem_size =3D sizeof(struct v4l2_ctrl_h264_decode_params);
>  		break;
> +	case V4L2_CTRL_TYPE_VP8_FRAME_HEADER:
> +		elem_size =3D sizeof(struct v4l2_ctrl_vp8_frame_header);
> +		break;
>  	default:
>  		if (type < V4L2_CTRL_COMPOUND_TYPES)
>  			elem_size =3D sizeof(s32);
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
> index b1f4b991dba6..436a13204921 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1331,6 +1331,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *f=
mt)
>  		case V4L2_PIX_FMT_VC1_ANNEX_G:	descr =3D "VC-1 (SMPTE 412M Annex G)"; =
break;
>  		case V4L2_PIX_FMT_VC1_ANNEX_L:	descr =3D "VC-1 (SMPTE 412M Annex L)"; =
break;
>  		case V4L2_PIX_FMT_VP8:		descr =3D "VP8"; break;
> +		case V4L2_PIX_FMT_VP8_FRAME:    descr =3D "VP8 FRAME"; break;
>  		case V4L2_PIX_FMT_VP9:		descr =3D "VP9"; break;
>  		case V4L2_PIX_FMT_HEVC:		descr =3D "HEVC"; break; /* aka H.265 */
>  		case V4L2_PIX_FMT_FWHT:		descr =3D "FWHT"; break; /* used in vicodec *=
/
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index b4433483af23..6e9dc9c44bb1 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -20,6 +20,7 @@
>  #include <media/mpeg2-ctrls.h>
>  #include <media/fwht-ctrls.h>
>  #include <media/h264-ctrls.h>
> +#include <media/vp8-ctrls.h>
> =20
>  /* forward references */
>  struct file;
> @@ -48,6 +49,7 @@ struct poll_table_struct;
>   * @p_h264_scaling_matrix:	Pointer to a struct v4l2_ctrl_h264_scaling_ma=
trix.
>   * @p_h264_slice_params:	Pointer to a struct v4l2_ctrl_h264_slice_params=
.
>   * @p_h264_decode_params:	Pointer to a struct v4l2_ctrl_h264_decode_para=
ms.
> + * @p_vp8_frame_header:		Pointer to a VP8 frame header structure.
>   * @p:				Pointer to a compound value.
>   */
>  union v4l2_ctrl_ptr {
> @@ -65,6 +67,7 @@ union v4l2_ctrl_ptr {
>  	struct v4l2_ctrl_h264_scaling_matrix *p_h264_scaling_matrix;
>  	struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
>  	struct v4l2_ctrl_h264_decode_params *p_h264_decode_params;
> +	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
>  	void *p;
>  };
> =20
> diff --git a/include/media/vp8-ctrls.h b/include/media/vp8-ctrls.h
> new file mode 100644
> index 000000000000..636442dc18aa
> --- /dev/null
> +++ b/include/media/vp8-ctrls.h
> @@ -0,0 +1,110 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * These are the VP8 state controls for use with stateless VP8
> + * codec drivers.
> + *
> + * It turns out that these structs are not stable yet and will undergo
> + * more changes. So keep them private until they are stable and ready to
> + * become part of the official public API.
> + */
> +
> +#ifndef _VP8_CTRLS_H_
> +#define _VP8_CTRLS_H_
> +
> +#define V4L2_PIX_FMT_VP8_FRAME v4l2_fourcc('V', 'P', '8', 'F')
> +
> +#define V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER (V4L2_CID_MPEG_BASE + 2000)
> +#define V4L2_CTRL_TYPE_VP8_FRAME_HEADER 0x301
> +
> +#define V4L2_VP8_SEGMENT_HEADER_FLAG_ENABLED              0x01
> +#define V4L2_VP8_SEGMENT_HEADER_FLAG_UPDATE_MAP           0x02
> +#define V4L2_VP8_SEGMENT_HEADER_FLAG_UPDATE_FEATURE_DATA  0x04
> +#define V4L2_VP8_SEGMENT_HEADER_FLAG_DELTA_VALUE_MODE     0x08
> +
> +struct v4l2_vp8_segment_header {
> +	__s8 quant_update[4];
> +	__s8 lf_update[4];
> +	__u8 segment_probs[3];
> +	__u8 padding;
> +	__u32 flags;
> +};
> +
> +#define V4L2_VP8_LF_HEADER_ADJ_ENABLE	0x01
> +#define V4L2_VP8_LF_HEADER_DELTA_UPDATE	0x02
> +#define V4L2_VP8_LF_FILTER_TYPE_SIMPLE	0x04
> +struct v4l2_vp8_loopfilter_header {
> +	__s8 ref_frm_delta[4];
> +	__s8 mb_mode_delta[4];
> +	__u8 sharpness_level;
> +	__u8 level;
> +	__u16 padding;
> +	__u32 flags;
> +};
> +
> +struct v4l2_vp8_quantization_header {
> +	__u8 y_ac_qi;
> +	__s8 y_dc_delta;
> +	__s8 y2_dc_delta;
> +	__s8 y2_ac_delta;
> +	__s8 uv_dc_delta;
> +	__s8 uv_ac_delta;
> +	__u16 padding;
> +};
> +
> +struct v4l2_vp8_entropy_header {
> +	__u8 coeff_probs[4][8][3][11];
> +	__u8 y_mode_probs[4];
> +	__u8 uv_mode_probs[3];
> +	__u8 mv_probs[2][19];
> +	__u8 padding[3];
> +};
> +
> +struct v4l2_vp8_entropy_coder_state {
> +	__u8 range;
> +	__u8 value;
> +	__u8 bit_count;
> +	__u8 padding;
> +};
> +
> +#define V4L2_VP8_FRAME_HEADER_FLAG_KEY_FRAME		0x01
> +#define V4L2_VP8_FRAME_HEADER_FLAG_EXPERIMENTAL		0x02
> +#define V4L2_VP8_FRAME_HEADER_FLAG_SHOW_FRAME		0x04
> +#define V4L2_VP8_FRAME_HEADER_FLAG_MB_NO_SKIP_COEFF	0x08
> +#define V4L2_VP8_FRAME_HEADER_FLAG_SIGN_BIAS_GOLDEN	0x10
> +#define V4L2_VP8_FRAME_HEADER_FLAG_SIGN_BIAS_ALT	0x20
> +
> +#define VP8_FRAME_IS_KEY_FRAME(hdr) \
> +	(!!((hdr)->flags & V4L2_VP8_FRAME_HEADER_FLAG_KEY_FRAME))
> +
> +struct v4l2_ctrl_vp8_frame_header {
> +	struct v4l2_vp8_segment_header segment_header;
> +	struct v4l2_vp8_loopfilter_header lf_header;
> +	struct v4l2_vp8_quantization_header quant_header;
> +	struct v4l2_vp8_entropy_header entropy_header;
> +	struct v4l2_vp8_entropy_coder_state coder_state;
> +
> +	__u16 width;
> +	__u16 height;
> +
> +	__u8 horizontal_scale;
> +	__u8 vertical_scale;
> +
> +	__u8 version;
> +	__u8 prob_skip_false;
> +	__u8 prob_intra;
> +	__u8 prob_last;
> +	__u8 prob_gf;
> +	__u8 num_dct_parts;
> +
> +	__u32 first_part_size;
> +	__u32 macroblock_bit_offset;
> +	__u32 dct_part_sizes[8];
> +
> +	__u64 last_frame_ts;
> +	__u64 golden_frame_ts;
> +	__u64 alt_frame_ts;
> +
> +	__u64 flags;
> +};
> +
> +#endif

I don't think any of my comments strictly requires a v3, could be later
enhancements. You told me you wrote and ran a test for 32/64
compatibility, so I on did a light visual check.

(even if you already got that from Tomasz)
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

--=-mgHLFmVfLA+6/IZNWqyn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXRzoPgAKCRBxUwItrAao
HKW9AJ97zSqit88AL8mUN+wvYQkFkkxbsQCfXX4DmAZke3H6OKc2G/+90g1XXCs=
=k9Is
-----END PGP SIGNATURE-----

--=-mgHLFmVfLA+6/IZNWqyn--

