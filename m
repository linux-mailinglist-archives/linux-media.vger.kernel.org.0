Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBF0220E79
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 20:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbfEPSLS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 14:11:18 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:46587 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbfEPSLR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 14:11:17 -0400
Received: by mail-qt1-f195.google.com with SMTP id z19so4965888qtz.13
        for <linux-media@vger.kernel.org>; Thu, 16 May 2019 11:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=JqI2A93XsRJFkHv8+rxxMDinrWcs5xJttxXThXkVhm0=;
        b=vVFyyIUGjDxkQA7LtYJHQv5bDdVVnq7IBRyWut5m3Eo5u/JuOnjre+XuiOG1feQBLO
         ogQVfcDfo0L0qHCq7B70ihIZGu+u5Zuf0d4CUea4itCEqDKp3jkBwqiWF+y4E6dieppn
         t0ZoTvgWU1EJmG+ola2hNFZa6umUrugd9f8d+RPwxgS5eIfXbdxtn/ydyucm7IXsFuEz
         Cdwr340Xs9QluZohwYAJjxiYlMYTYCgBc3LFAfpvyhYPVMO/LT4yuQ8ddqGA81ArlqxH
         LPfa4XAudCNQgtKrMbG1vkTUsnqf8xwxM39MD64Cl6CkFI5FoKVEMVH7h8GV//iIfyWI
         I8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=JqI2A93XsRJFkHv8+rxxMDinrWcs5xJttxXThXkVhm0=;
        b=ZicRUjeRe/wEZ9WVMWG14Layyc9yNSZgFiIfXnQSNTBo6ypA2fa9+WUJSVVtepdq3p
         UX2bDS27cvdbKJNdN9+HyAgGfnjqNImRS90lWM+SRSg3k9YW7VzhjXquTnzvMbDPNpyh
         gpj8y5mPuffsyzTded1BZdbUF68ueEkVbBvBwnYAUhHYhi4zyM11gYJ3Gfr7lpwZfYpF
         EyzB+nF+ARZWR9DF9HEDj348/lavF01hkbXai4iHHg8VxatsWeRO9F8BdAnDf8RVo1B8
         R/md5rXcbqfFzYoJ4yIa9pULOHPrd5pbSS24l8wW/gmpaPh9Dfwp4yIe26BL/UE/MRwX
         BN4g==
X-Gm-Message-State: APjAAAV4htA0JhdNQGp5LFW7qTqcjQB3Deg6Q/q4PbOf0Z1Gv7Witfq9
        OCcrv1F2DmsrkBqsZc2wTaJCtQ==
X-Google-Smtp-Source: APXvYqxcFzjixLZ65EX1N3swxpyFSMiBV5eLzQv9H8RO5IWLanVH9ad9ayInCTILVLEGuiANKw/pDQ==
X-Received: by 2002:ac8:ff6:: with SMTP id f51mr42247629qtk.116.1558030275669;
        Thu, 16 May 2019 11:11:15 -0700 (PDT)
Received: from tpx230-nicolas.collaboramtl (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id d127sm2859581qkg.69.2019.05.16.11.11.13
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 16 May 2019 11:11:14 -0700 (PDT)
Message-ID: <6001c071ef37674442cf991760b222b19e2e3459.camel@ndufresne.ca>
Subject: Re: [RFC] media: uapi: Add VP8 low-level decoder API compound
 controls.
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hans.verkuil@cisco.com>, kernel@collabora.com,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Pawel Osciak <posciak@chromium.org>
Date:   Thu, 16 May 2019 14:11:12 -0400
In-Reply-To: <20190213211557.17696-1-ezequiel@collabora.com>
References: <20190213211557.17696-1-ezequiel@collabora.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-gElc6MrFEV4+A7HTmJD0"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-gElc6MrFEV4+A7HTmJD0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 13 f=C3=A9vrier 2019 =C3=A0 18:15 -0300, Ezequiel Garcia a =C3=
=A9crit :
> From: Pawel Osciak <posciak@chromium.org>
>=20
> These controls are to be used with the new low-level decoder API for VP8
> to provide additional parameters for the hardware that cannot parse the
> input stream.
>=20
> Signed-off-by: Pawel Osciak <posciak@chromium.org>
> [ezequiel: rebased]
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
> As the H.264 interface is hopefully close to be merged,
> I'm sending the VP8 interface to start this discussion.
>=20
>  drivers/media/v4l2-core/v4l2-ctrls.c |   7 ++
>  drivers/media/v4l2-core/v4l2-ioctl.c |   1 +
>  include/media/v4l2-ctrls.h           |   3 +
>  include/media/vp8-ctrls.h            | 104 +++++++++++++++++++++++++++
>  include/uapi/linux/videodev2.h       |   1 +
>  5 files changed, 116 insertions(+)
>  create mode 100644 include/media/vp8-ctrls.h
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-co=
re/v4l2-ctrls.c
> index 366200d31bc0..c77a56c3e2aa 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -869,6 +869,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_VPX_P_FRAME_QP:		return "VPX P-Frame QP Value"=
;
>  	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:			return "VP8 Profile";
>  	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:			return "VP9 Profile";
> +	case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HDR:			return "VP8 Frame Header";
> =20
>  	/* HEVC controls */
>  	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP:		return "HEVC I-Frame QP Valu=
e";
> @@ -1323,6 +1324,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum=
 v4l2_ctrl_type *type,
>  	case V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS:
>  		*type =3D V4L2_CTRL_TYPE_H264_DECODE_PARAMS;
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HDR:
> +		*type =3D V4L2_CTRL_TYPE_VP8_FRAME_HDR;
> +		break;
>  	default:
>  		*type =3D V4L2_CTRL_TYPE_INTEGER;
>  		break;
> @@ -1694,6 +1698,7 @@ static int std_validate(const struct v4l2_ctrl *ctr=
l, u32 idx,
>  	case V4L2_CTRL_TYPE_H264_SCALING_MATRIX:
>  	case V4L2_CTRL_TYPE_H264_SLICE_PARAMS:
>  	case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
> +	case V4L2_CTRL_TYPE_VP8_FRAME_HDR:
>  		return 0;
> =20
>  	default:
> @@ -2290,6 +2295,8 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_=
ctrl_handler *hdl,
>  		break;
>  	case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
>  		elem_size =3D sizeof(struct v4l2_ctrl_h264_decode_param);
> +	case V4L2_CTRL_TYPE_VP8_FRAME_HDR:
> +		elem_size =3D sizeof(struct v4l2_ctrl_vp8_frame_header);
>  		break;
>  	default:
>  		if (type < V4L2_CTRL_COMPOUND_TYPES)
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
> index c765c7c7c562..ea295aa9d0b6 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1324,6 +1324,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *f=
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
> index 22b6d09c4764..183c7fc5d18d 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -28,6 +28,7 @@
>   */
>  #include <media/mpeg2-ctrls.h>
>  #include <media/h264-ctrls.h>
> +#include <media/vp8-ctrls.h>
> =20
>  /* forward references */
>  struct file;
> @@ -55,6 +56,7 @@ struct poll_table_struct;
>   * @p_h264_scaling_matrix:	Pointer to a struct v4l2_ctrl_h264_scaling_ma=
trix.
>   * @p_h264_slice_param:		Pointer to a struct v4l2_ctrl_h264_slice_param.
>   * @p_h264_decode_param:	Pointer to a struct v4l2_ctrl_h264_decode_param=
.
> + * @p_vp8_frame_header:		Pointer to a VP8 frame header structure.
>   * @p:				Pointer to a compound value.
>   */
>  union v4l2_ctrl_ptr {
> @@ -71,6 +73,7 @@ union v4l2_ctrl_ptr {
>  	struct v4l2_ctrl_h264_scaling_matrix *p_h264_scaling_matrix;
>  	struct v4l2_ctrl_h264_slice_param *p_h264_slice_param;
>  	struct v4l2_ctrl_h264_decode_param *p_h264_decode_param;
> +	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
>  	void *p;
>  };
> =20
> diff --git a/include/media/vp8-ctrls.h b/include/media/vp8-ctrls.h
> new file mode 100644
> index 000000000000..95b63a0cb239
> --- /dev/null
> +++ b/include/media/vp8-ctrls.h
> @@ -0,0 +1,104 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * TODO: Make sure structs have no holes and are 4-byte aligned.
> + */
> +
> +#ifndef _VP8_CTRLS_H_
> +#define _VP8_CTRLS_H_
> +
> +#include <linux/v4l2-controls.h>
> +
> +#define V4L2_CID_MPEG_VIDEO_VP8_FRAME_HDR (V4L2_CID_MPEG_BASE + 260)
> +
> +#define V4L2_CTRL_TYPE_VP8_FRAME_HDR		0x220
> +
> +#define V4L2_VP8_SEGMNT_HDR_FLAG_ENABLED              0x01
> +#define V4L2_VP8_SEGMNT_HDR_FLAG_UPDATE_MAP           0x02
> +#define V4L2_VP8_SEGMNT_HDR_FLAG_UPDATE_FEATURE_DATA  0x04
> +
> +struct v4l2_vp8_segment_header {
> +	__u8 segment_feature_mode;
> +	__s8 quant_update[4];
> +	__s8 lf_update[4];
> +	__u8 segment_probs[3];
> +	__u32 flags;
> +};
> +
> +#define V4L2_VP8_LF_HDR_ADJ_ENABLE	0x01
> +#define V4L2_VP8_LF_HDR_DELTA_UPDATE	0x02
> +struct v4l2_vp8_loopfilter_header {
> +	__u16 type;
> +	__u8 level;
> +	__u8 sharpness_level;
> +	__s8 ref_frm_delta_magnitude[4];
> +	__s8 mb_mode_delta_magnitude[4];
> +	__u16 flags;
> +};
> +
> +struct v4l2_vp8_quantization_header {
> +	__u8 y_ac_qi;
> +	__s8 y_dc_delta;
> +	__s8 y2_dc_delta;
> +	__s8 y2_ac_delta;
> +	__s8 uv_dc_delta;
> +	__s8 uv_ac_delta;
> +	__u16 dequant_factors[4][3][2];
> +};
> +
> +struct v4l2_vp8_entropy_header {
> +	__u8 coeff_probs[4][8][3][11];
> +	__u8 y_mode_probs[4];
> +	__u8 uv_mode_probs[3];
> +	__u8 mv_probs[2][19];
> +};
> +
> +#define V4L2_VP8_FRAME_HDR_FLAG_EXPERIMENTAL		0x01
> +#define V4L2_VP8_FRAME_HDR_FLAG_SHOW_FRAME		0x02
> +#define V4L2_VP8_FRAME_HDR_FLAG_MB_NO_SKIP_COEFF	0x04
> +struct v4l2_ctrl_vp8_frame_header {
> +	/* 0: keyframe, 1: not a keyframe */
> +	__u8 key_frame; // could be a flag?

Yes, I think it would be more consistent to make this a flag.

> +	__u8 version;
> +
> +	/* Populated also if not a key frame */
> +	__u16 width;
> +	__u16 height;
> +	__u8 horizontal_scale;
> +	__u8 vertical_scale;
> +
> +	struct v4l2_vp8_segment_header segment_header;
> +	struct v4l2_vp8_loopfilter_header lf_header;
> +	struct v4l2_vp8_quantization_header quant_header;
> +	struct v4l2_vp8_entropy_header entropy_header;
> +
> +	__u8 sign_bias_golden;
> +	__u8 sign_bias_alternate;
> +
> +	__u8 prob_skip_false;
> +	__u8 prob_intra;
> +	__u8 prob_last;
> +	__u8 prob_gf;
> +
> +	__u32 first_part_size;
> +	__u32 first_part_offset; // this needed? it's always 3 + 7 * s->keyfram=
e;
> +	/*
> +	 * Offset in bits of MB data in first partition,
> +	 * i.e. bit offset starting from first_part_offset.
> +	 */
> +	__u32 macroblock_bit_offset;
> +
> +	__u8 num_dct_parts;
> +	__u32 dct_part_sizes[8];
> +
> +	__u8 bool_dec_range;
> +	__u8 bool_dec_value;
> +	__u8 bool_dec_count;

I don't know if we care about packing in general, but you have 3 bytes
in between a __u32 and a __u64.

> +
> +	__u64 last_frame_ts;
> +	__u64 golden_frame_ts;
> +	__u64 alt_frame_ts;
> +
> +	__u8 flags;
> +};
> +
> +#endif
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index f6a484017208..a906bfc0c8f0 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -664,6 +664,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_VC1_ANNEX_G v4l2_fourcc('V', 'C', '1', 'G') /* SMPT=
E 421M Annex G compliant stream */
>  #define V4L2_PIX_FMT_VC1_ANNEX_L v4l2_fourcc('V', 'C', '1', 'L') /* SMPT=
E 421M Annex L compliant stream */
>  #define V4L2_PIX_FMT_VP8      v4l2_fourcc('V', 'P', '8', '0') /* VP8 */
> +#define V4L2_PIX_FMT_VP8_FRAME v4l2_fourcc('V', 'P', '8', 'F') /* VP8 pa=
rsed frames */
>  #define V4L2_PIX_FMT_VP9      v4l2_fourcc('V', 'P', '9', '0') /* VP9 */
>  #define V4L2_PIX_FMT_HEVC     v4l2_fourcc('H', 'E', 'V', 'C') /* HEVC ak=
a H.265 */
>  #define V4L2_PIX_FMT_FWHT     v4l2_fourcc('F', 'W', 'H', 'T') /* Fast Wa=
lsh Hadamard Transform (vicodec) */

--=-gElc6MrFEV4+A7HTmJD0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXN2nwAAKCRBxUwItrAao
HK1WAJ0c932xXMp6phSuoMBVMG659hmnoACfZ7VYfIMYScVm0n8g9k3hMbG2UXA=
=FBNi
-----END PGP SIGNATURE-----

--=-gElc6MrFEV4+A7HTmJD0--

