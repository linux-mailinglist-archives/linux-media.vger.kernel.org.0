Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD3E98D2F8
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 14:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727304AbfHNMX2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 08:23:28 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:40499 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbfHNMX2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 08:23:28 -0400
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 676D4100006;
        Wed, 14 Aug 2019 12:23:23 +0000 (UTC)
Date:   Wed, 14 Aug 2019 14:23:23 +0200
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
Subject: Re: [PATCH v5 03/11] media: uapi: h264: Add the concept of decoding
 mode
Message-ID: <20190814122323.GC4687@aptenodytes>
References: <20190812193522.10911-1-ezequiel@collabora.com>
 <20190812193522.10911-4-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sXc4Kmr5FA7axrvy"
Content-Disposition: inline
In-Reply-To: <20190812193522.10911-4-ezequiel@collabora.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--sXc4Kmr5FA7axrvy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon 12 Aug 19, 16:35, Ezequiel Garcia wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
>=20
> Some stateless decoders don't support per-slice decoding granularity
> (or at least not in a way that would make them efficient or easy to use).
>=20
> Expose a menu to control the supported decoding modes. Drivers are
> allowed to support only one decoding but they can support both too.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Tested-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> Changes in v5:
> * Improve specification as suggested by Hans.
> Changes in v4:
> * Typos/rewording fixes
> Changes in v3:
> * s/per-{slice,frame} decoding/{slice,frame}-based decoding/
> * Add Paul's R-b
> Changes in v2:
> * Allow decoding multiple slices in per-slice decoding mode
> * Minor doc improvement/fixes
> ---
>  .../media/uapi/v4l/ext-ctrls-codec.rst        | 47 ++++++++++++++++++-
>  .../media/uapi/v4l/pixfmt-compressed.rst      |  3 +-
>  drivers/media/v4l2-core/v4l2-ctrls.c          |  9 ++++
>  include/media/h264-ctrls.h                    | 11 +++++
>  4 files changed, 68 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documenta=
tion/media/uapi/v4l/ext-ctrls-codec.rst
> index c5f39dd50043..568390273fde 100644
> --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> @@ -1747,6 +1747,11 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type=
 -
>      * - __u32
>        - ``size``
>        -
> +    * - __u32
> +      - ``start_byte_offset``
> +      - Where the slice payload starts in the output buffer. Useful when=
 the
> +        OUTPUT buffer contains more than one slice (some codecs need to =
know
> +        where each slice starts in this buffer).

I think there is a possibility for misunderstanding here: does the
"slice payload" include the start code when it (annex-b) is selected?

I'd suspect that the hardware needs to know where the start code begings ra=
ther
than where the NAL unit starts when there is a start code. So I'd suggest
specifying it as the offset to the beginning of the start code (if present)=
 or
to the slice NAL unit start otherwise.

The clarification should probably also concern header_bit_size, to make it =
clear
where it is counted from. I think it makes sense to count it starting from
the start_byte_offset position.

>      * - __u32
>        - ``header_bit_size``
>        -
> @@ -1930,7 +1935,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type=
 -
>        -
>      * - __u16
>        - ``num_slices``
> -      - Number of slices needed to decode the current frame
> +      - Number of slices needed to decode the current frame/field. When
> +        operating in slice-based decoding mode (see
> +        :c:type:`v4l2_mpeg_video_h264_decoding_mode`), this field
> +        should always be set to one.

I am fine with the current proposal for now, but I believe that we should k=
eep
discussing whether we want per-slice mode to strictly enforce having a
single-slice, outside of this series.

One reason for that would be to gather multiple slices (up to what amounts =
to
a frame) for efficient use of OUTPUT buffers and to avoid allocating a huge
number of small ones (which is certainly quite inefficient due to CMA
alignment).

Apparently, passing multiple slice_params controls is an issue so per-frame=
 mode
currently has to rely on the hardware being able to parse the slice header =
on
its own. The issue exists in the V4L2 API, where we need to know in advance
the maximum number of slices we want to use to make the control an array and
copy all the controls with each request, even if only a single-one is used.

Maybe one way to solve that would be to use multiple requests with the same
OUTPUT buffer, one per slice, so that we only have to pass a single slice_p=
arams
control per-request. And the first slice of the frame would get the other
controls too, while the others wouldn't (assuming we can trust that controls
won't change in-between and I'm not sure how true that is). Worst case, all
the controls have to be attached with each request, which is maybe still be=
tter
than passing a big number of unused slice_params controls each time.

Again, I believe the current proposal is good to go for now as it allows the
hantro driver to get-in staging, which is the priority.

But the issue I'm discussing should certainly be fixed before unstaging the=
 API.

>      * - __u16
>        - ``nal_ref_idc``
>        - NAL reference ID value coming from the NAL Unit header
> @@ -2021,6 +2029,43 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type=
 -
>        - 0x00000004
>        - The DPB entry is a long term reference frame
> =20
> +``V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE (enum)``
> +    Specifies the decoding mode to use. Currently exposes slice-based and
> +    frame-based decoding but new modes might be added later on.
> +    This control is used to complement V4L2_PIX_FMT_H264_SLICE
> +    pixel format. Applications that support V4L2_PIX_FMT_H264_SLICE
> +    are required to set this control in order to specify the decoding mo=
de
> +    that is expected for the buffer.
> +    Drivers may expose a single or multiple decoding modes, depending
> +    on what they can support.
> +
> +    .. note::
> +
> +       This menu control is not yet part of the public kernel API and
> +       it is expected to change.
> +
> +.. c:type:: v4l2_mpeg_video_h264_decoding_mode
> +
> +.. cssclass:: longtable
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - ``V4L2_MPEG_VIDEO_H264_SLICE_BASED_DECODING``
> +      - 0
> +      - The decoding is done at the slice granularity.
> +        v4l2_ctrl_h264_decode_params->num_slices should be set to 1.
> +        The OUTPUT buffer must contain a single slice.
> +    * - ``V4L2_MPEG_VIDEO_H264_FRAME_BASED_DECODING``
> +      - 1
> +      - The decoding is done at the frame granularity.
> +        v4l2_ctrl_h264_decode_params->num_slices should be set to the nu=
mber of
> +        slices forming a frame.
> +        The OUTPUT buffer must contain all slices needed to decode the
> +        frame. The OUTPUT buffer must also contain both fields.
> +

Nitpick/suggestion here: could we use the name of the enum as a prefix for =
the
modes, like:
- V4L2_MPEG_VIDEO_H264_DECODING_MODE_PER_SLICE
- V4L2_MPEG_VIDEO_H264_DECODING_MODE_PER_FRAME

or
- V4L2_MPEG_VIDEO_H264_DECODING_MODE_SLICE_BASED
- V4L2_MPEG_VIDEO_H264_DECODING_MODE_FRAME_BASED

I personally find it more readable this way, since the same prefix is kept.

Cheers,

Paul

>  .. _v4l2-mpeg-mpeg2:
> =20
>  ``V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS (struct)``
> diff --git a/Documentation/media/uapi/v4l/pixfmt-compressed.rst b/Documen=
tation/media/uapi/v4l/pixfmt-compressed.rst
> index 9b65473a2288..50557c85d99d 100644
> --- a/Documentation/media/uapi/v4l/pixfmt-compressed.rst
> +++ b/Documentation/media/uapi/v4l/pixfmt-compressed.rst
> @@ -61,7 +61,8 @@ Compressed Formats
>  	stateless video decoders that implement an H264 pipeline
>  	(using the :ref:`mem2mem` and :ref:`media-request-api`).
>  	Metadata associated with the frame to decode are required to
> -	be passed through the ``V4L2_CID_MPEG_VIDEO_H264_SPS``,
> +	be passed through the ``V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE``,
> +        ``V4L2_CID_MPEG_VIDEO_H264_SPS``,
>  	``V4L2_CID_MPEG_VIDEO_H264_PPS``,
>  	``V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX``,
>  	``V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS`` and
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-co=
re/v4l2-ctrls.c
> index cd1ae016706f..c3194299bfac 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -402,6 +402,11 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>  		"Explicit",
>  		NULL,
>  	};
> +	static const char * const h264_decoding_mode[] =3D {
> +		"Slice-Based",
> +		"Frame-Based",
> +		NULL,
> +	};
>  	static const char * const mpeg_mpeg2_level[] =3D {
>  		"Low",
>  		"Main",
> @@ -633,6 +638,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>  		return h264_fp_arrangement_type;
>  	case V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE:
>  		return h264_fmo_map_type;
> +	case V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE:
> +		return h264_decoding_mode;
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:
>  		return mpeg_mpeg2_level;
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:
> @@ -852,6 +859,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX:		return "H264 Scaling Mat=
rix";
>  	case V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS:		return "H264 Slice Paramet=
ers";
>  	case V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS:		return "H264 Decode Param=
eters";
> +	case V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE:		return "H264 Decoding Mod=
e";
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:			return "MPEG2 Level";
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:			return "MPEG2 Profile";
>  	case V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP:		return "MPEG4 I-Frame QP Va=
lue";
> @@ -1220,6 +1228,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum=
 v4l2_ctrl_type *type,
>  	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC:
>  	case V4L2_CID_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE:
>  	case V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE:
> +	case V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE:
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:
>  	case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:
> diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> index 6160a69c0143..e6c510877f67 100644
> --- a/include/media/h264-ctrls.h
> +++ b/include/media/h264-ctrls.h
> @@ -26,6 +26,7 @@
>  #define V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX	(V4L2_CID_MPEG_BASE+1002)
>  #define V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS	(V4L2_CID_MPEG_BASE+1003)
>  #define V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS	(V4L2_CID_MPEG_BASE+1004)
> +#define V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE	(V4L2_CID_MPEG_BASE+1005)
> =20
>  /* enum v4l2_ctrl_type type values */
>  #define V4L2_CTRL_TYPE_H264_SPS			0x0110
> @@ -33,6 +34,12 @@
>  #define V4L2_CTRL_TYPE_H264_SCALING_MATRIX	0x0112
>  #define V4L2_CTRL_TYPE_H264_SLICE_PARAMS	0x0113
>  #define V4L2_CTRL_TYPE_H264_DECODE_PARAMS	0x0114
> +#define V4L2_CTRL_TYPE_H264_DECODING_MODE	0x0115
> +
> +enum v4l2_mpeg_video_h264_decoding_mode {
> +	V4L2_MPEG_VIDEO_H264_SLICE_BASED_DECODING,
> +	V4L2_MPEG_VIDEO_H264_FRAME_BASED_DECODING,
> +};
> =20
>  #define V4L2_H264_SPS_CONSTRAINT_SET0_FLAG			0x01
>  #define V4L2_H264_SPS_CONSTRAINT_SET1_FLAG			0x02
> @@ -125,6 +132,10 @@ struct v4l2_h264_pred_weight_table {
>  struct v4l2_ctrl_h264_slice_params {
>  	/* Size in bytes, including header */
>  	__u32 size;
> +
> +	/* Offset in bytes to the start of slice in the OUTPUT buffer. */
> +	__u32 start_byte_offset;
> +
>  	/* Offset in bits to slice_data() from the beginning of this slice. */
>  	__u32 header_bit_size;
> =20
> --=20
> 2.22.0
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--sXc4Kmr5FA7axrvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl1T/ToACgkQ3cLmz3+f
v9FwpQf/efFgvEmYYE37ytEnanXsX1Gb56HouYOe2xo/xdepziqRcNjvoOQNuIgY
Aq1HP979SUSR6n9RM887U5vNUsNKLPKCmb5//ckwhlDW6IpO4NgVlxSkMD+VbGr1
LPfwl0UNjQlh/j/WEC5kfJCjptdH7VH1+eagHYjagswbndRRMp0ZstCUPK02Nbmd
V4QP0Ekc0Fm0cndxYnygjnfJmfk3SxPoFnKo6Zk6RCsg72+NYcPTfXxlT3oKSLTU
/9GPQzT4Mz1947CwtT+jP/1Tn35p5hXhEclsAQrCylr7AmkC8FueUL3EzpfE9cRl
L7xxLQYO1TlJgGcxgrGDTlajjds+ew==
=L92C
-----END PGP SIGNATURE-----

--sXc4Kmr5FA7axrvy--
