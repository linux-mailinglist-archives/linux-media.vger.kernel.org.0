Return-Path: <linux-media+bounces-48588-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D77ECB3F0B
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 21:21:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46251308A942
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 20:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3E3832B997;
	Wed, 10 Dec 2025 20:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="A2tGrVjy"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36BF21E0AF;
	Wed, 10 Dec 2025 20:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765398043; cv=none; b=TovFWO12ZGnq2PZq7pPSFtrV3DNu7jwbw5lsxfGFTbyOPYQNA4pnez5VFQrFe4sEhODYtSxB4AW3CqN1cAF4pugrHPUCI89Ew7ru3sjvhLDdtxPinJu+GwgeUg1dNUuqPc+glr4/Iq++bGBOilmUb3YYAgt096jEpG8IRX1gUoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765398043; c=relaxed/simple;
	bh=cpN1qm0nK1VnAVuvBlgKIZb8R3/RCv2SG/Jp2mE7NKw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ULflvkSyCfW4A624TbHkS2BiRsslfPmvmQPvK7PIIkytYbXdYqy0iuRmz/IP+g2/cKkq4ub2/urmxfnVM6HrpfSqVa9hTsBJXkHKaxbhiU1tcKlbZehOwaJPnPatpnHIwO1OXr/fh8HcSN3G9DKEENZb6gEZ3fP73KaLvAdhP3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=A2tGrVjy; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765398038;
	bh=cpN1qm0nK1VnAVuvBlgKIZb8R3/RCv2SG/Jp2mE7NKw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=A2tGrVjyhFJBgQXHpSWBeU44TR+5i0NcXxQqIP87yFiZaly8i6vQuCZsGez5ISAXC
	 YY3M4Qr72BDxo7URH302EKrIL5mvprSLL7KJCuXFxrcG6+UCDezyYS+pHxTZ7KCclS
	 R49pppe8EKjgR4/aiSgDc8raWeLK1ciWJUEo0/5yYRU8lRe2M+InT1AEB+E+1rdFOO
	 KqVsOwx8OIoZHVESKmEGbGorijgTwXpyJQNfPqjP65yDf7yFahRN9EzB3/7ptVCDUi
	 yMF5+Haq2nRJ6XoBeYJVDObtukNxwhV8MiMh5pKVT0g8oTxnHX90gqKOfW1HHygQ/5
	 Ezbog0Apz9Gfw==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D518D17E0360;
	Wed, 10 Dec 2025 21:20:36 +0100 (CET)
Message-ID: <f5167f640540007ceb4dc6adef851d05bb0190cd.camel@collabora.com>
Subject: Re: [PATCH v4 06/15] media: rkvdec: Move h264 functions to common
 file
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, Heiko Stuebner <heiko@sntech.de>, Ricardo
 Ribalda <ribalda@chromium.org>, Hans Verkuil <hverkuil@kernel.org>, Hans de
 Goede <hansg@kernel.org>,  Yunke Cao <yunkec@google.com>, Jonathan Corbet
 <corbet@lwn.net>, Laurent Pinchart	 <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,  James Cowgill
 <james.cowgill@blaize.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, Diederik de Haas	 <didi.debian@cknow.org>
Date: Wed, 10 Dec 2025 15:20:35 -0500
In-Reply-To: <20251022174508.284929-7-detlev.casanova@collabora.com>
References: <20251022174508.284929-1-detlev.casanova@collabora.com>
	 <20251022174508.284929-7-detlev.casanova@collabora.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-7cWpuYv/CS60HWwkFqk+"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-7cWpuYv/CS60HWwkFqk+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 22 octobre 2025 =C3=A0 13:44 -0400, Detlev Casanova a =C3=A9cri=
t=C2=A0:
> This is a preparation commit to add support for new variants of the
> decoder.
>=20
> The functions will later be shared with vdpu381 (rk3588) and vdpu383
> (rk3576).
>=20
> Tested-by: Diederik de Haas <didi.debian@cknow.org>=C2=A0 # Rock 5B
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../media/platform/rockchip/rkvdec/Makefile=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
> =C2=A0.../rockchip/rkvdec/rkvdec-h264-common.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 252 ++++++++++++++
> =C2=A0.../rockchip/rkvdec/rkvdec-h264-common.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 81 +++++
> =C2=A0.../platform/rockchip/rkvdec/rkvdec-h264.c=C2=A0=C2=A0=C2=A0 | 310 =
+-----------------
> =C2=A04 files changed, 338 insertions(+), 306 deletions(-)
> =C2=A0create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-h2=
64-common.c
> =C2=A0create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-h2=
64-common.h
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/Makefile b/drivers/me=
dia/platform/rockchip/rkvdec/Makefile
> index a8ff5e3d7bec..d2ba7a7c15e5 100644
> --- a/drivers/media/platform/rockchip/rkvdec/Makefile
> +++ b/drivers/media/platform/rockchip/rkvdec/Makefile
> @@ -4,5 +4,6 @@ rockchip-vdec-y +=3D \
> =C2=A0		=C2=A0=C2=A0 rkvdec.o \
> =C2=A0		=C2=A0=C2=A0 rkvdec-cabac.o \
> =C2=A0		=C2=A0=C2=A0 rkvdec-h264.o \
> +		=C2=A0=C2=A0 rkvdec-h264-common.o \
> =C2=A0		=C2=A0=C2=A0 rkvdec-hevc.o \
> =C2=A0		=C2=A0=C2=A0 rkvdec-vp9.o
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.c =
b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.c
> new file mode 100644
> index 000000000000..d660dd81ca6e
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.c
> @@ -0,0 +1,252 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip video decoder h264 common functions
> + *
> + * Copyright (C) 2025 Collabora, Ltd.
> + *=C2=A0 Detlev Casanova <detlev.casanova@collabora.com>
> + */
> +
> +#include <linux/v4l2-common.h>
> +#include <media/v4l2-h264.h>
> +#include <media/v4l2-mem2mem.h>
> +
> +#include "rkvdec.h"
> +#include "rkvdec-h264-common.h"
> +
> +#define RKVDEC_NUM_REFLIST		3
> +
> +static void set_dpb_info(struct rkvdec_rps_entry *entries,
> +			 u8 reflist,
> +			 u8 refnum,
> +			 u8 info,
> +			 bool bottom)
> +{
> +	struct rkvdec_rps_entry *entry =3D &entries[(reflist * 4) + refnum / 8]=
;
> +	u8 idx =3D refnum % 8;
> +
> +	switch (idx) {
> +	case 0:
> +		entry->dpb_info0 =3D info;
> +		entry->bottom_flag0 =3D bottom;
> +		break;
> +	case 1:
> +		entry->dpb_info1 =3D info;
> +		entry->bottom_flag1 =3D bottom;
> +		break;
> +	case 2:
> +		entry->dpb_info2 =3D info;
> +		entry->bottom_flag2 =3D bottom;
> +		break;
> +	case 3:
> +		entry->dpb_info3 =3D info;
> +		entry->bottom_flag3 =3D bottom;
> +		break;
> +	case 4:
> +		entry->dpb_info4 =3D info;
> +		entry->bottom_flag4 =3D bottom;
> +		break;
> +	case 5:
> +		entry->dpb_info5 =3D info;
> +		entry->bottom_flag5 =3D bottom;
> +		break;
> +	case 6:
> +		entry->dpb_info6 =3D info;
> +		entry->bottom_flag6 =3D bottom;
> +		break;
> +	case 7:
> +		entry->dpb_info7 =3D info;
> +		entry->bottom_flag7 =3D bottom;
> +		break;
> +	}
> +}
> +
> +void lookup_ref_buf_idx(struct rkvdec_ctx *ctx,
> +			struct rkvdec_h264_run *run)
> +{
> +	const struct v4l2_ctrl_h264_decode_params *dec_params =3D run->decode_p=
arams;
> +	u32 i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
> +		struct v4l2_m2m_ctx *m2m_ctx =3D ctx->fh.m2m_ctx;
> +		const struct v4l2_h264_dpb_entry *dpb =3D run->decode_params->dpb;
> +		struct vb2_queue *cap_q =3D &m2m_ctx->cap_q_ctx.q;
> +		struct vb2_buffer *buf =3D NULL;
> +
> +		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE) {
> +			buf =3D vb2_find_buffer(cap_q, dpb[i].reference_ts);
> +			if (!buf)
> +				pr_debug("No buffer for reference_ts %llu",
> +					 dpb[i].reference_ts);
> +		}
> +
> +		run->ref_buf[i] =3D buf;
> +	}
> +}
> +
> +void assemble_hw_rps(struct v4l2_h264_reflist_builder *builder,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 struct rkvdec_h264_run *run,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 struct rkvdec_h264_reflists *reflists,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 struct rkvdec_rps *hw_rps)
> +{
> +	const struct v4l2_ctrl_h264_decode_params *dec_params =3D run->decode_p=
arams;
> +	const struct v4l2_h264_dpb_entry *dpb =3D dec_params->dpb;
> +
> +	u32 i, j;
> +
> +	memset(hw_rps, 0, sizeof(*hw_rps));
> +
> +	/*
> +	 * Assign an invalid pic_num if DPB entry at that position is inactive.
> +	 * If we assign 0 in that position hardware will treat that as a real
> +	 * reference picture with pic_num 0, triggering output picture
> +	 * corruption.
> +	 */
> +	for (i =3D 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
> +		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
> +			continue;
> +
> +		hw_rps->frame_num[i] =3D builder->refs[i].frame_num;
> +	}
> +
> +	for (j =3D 0; j < RKVDEC_NUM_REFLIST; j++) {
> +		for (i =3D 0; i < builder->num_valid; i++) {
> +			struct v4l2_h264_reference *ref;
> +			bool dpb_valid;
> +			bool bottom;
> +
> +			switch (j) {
> +			case 0:
> +				ref =3D &reflists->p[i];
> +				break;
> +			case 1:
> +				ref =3D &reflists->b0[i];
> +				break;
> +			case 2:
> +				ref =3D &reflists->b1[i];
> +				break;
> +			}
> +
> +			if (WARN_ON(ref->index >=3D ARRAY_SIZE(dec_params->dpb)))
> +				continue;
> +
> +			dpb_valid =3D !!(run->ref_buf[ref->index]);
> +			bottom =3D ref->fields =3D=3D V4L2_H264_BOTTOM_FIELD_REF;
> +
> +			set_dpb_info(hw_rps->entries, j, i, ref->index | (dpb_valid << 4), bo=
ttom);
> +		}
> +	}
> +}
> +
> +void assemble_hw_scaling_list(struct rkvdec_h264_run *run,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct rkvdec_h264_scaling_list *scali=
ng_list)
> +{
> +	const struct v4l2_ctrl_h264_scaling_matrix *scaling =3D run->scaling_ma=
trix;
> +	const struct v4l2_ctrl_h264_pps *pps =3D run->pps;
> +
> +	if (!(pps->flags & V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT))
> +		return;
> +
> +	BUILD_BUG_ON(sizeof(scaling_list->scaling_list_4x4) !=3D
> +		=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(scaling->scaling_list_4x4));
> +	BUILD_BUG_ON(sizeof(scaling_list->scaling_list_8x8) !=3D
> +		=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(scaling->scaling_list_8x8));
> +
> +	memcpy(scaling_list->scaling_list_4x4,
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scaling->scaling_list_4x4,
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(scaling->scaling_list_4x4))=
;
> +
> +	memcpy(scaling_list->scaling_list_8x8,
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scaling->scaling_list_8x8,
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(scaling->scaling_list_8x8))=
;
> +}
> +
> +#define RKVDEC_H264_MAX_DEPTH_IN_BYTES		2
> +
> +int rkvdec_h264_adjust_fmt(struct rkvdec_ctx *ctx,
> +			=C2=A0=C2=A0 struct v4l2_format *f)
> +{
> +	struct v4l2_pix_format_mplane *fmt =3D &f->fmt.pix_mp;
> +
> +	fmt->num_planes =3D 1;
> +	if (!fmt->plane_fmt[0].sizeimage)
> +		fmt->plane_fmt[0].sizeimage =3D fmt->width * fmt->height *
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RKVDEC_H264_MAX_DEPTH_IN_BYTES;
> +	return 0;
> +}
> +
> +enum rkvdec_image_fmt rkvdec_h264_get_image_fmt(struct rkvdec_ctx *ctx,
> +						struct v4l2_ctrl *ctrl)
> +{
> +	const struct v4l2_ctrl_h264_sps *sps =3D ctrl->p_new.p_h264_sps;
> +
> +	if (ctrl->id !=3D V4L2_CID_STATELESS_H264_SPS)
> +		return RKVDEC_IMG_FMT_ANY;
> +
> +	if (sps->bit_depth_luma_minus8 =3D=3D 0) {
> +		if (sps->chroma_format_idc =3D=3D 2)
> +			return RKVDEC_IMG_FMT_422_8BIT;
> +		else
> +			return RKVDEC_IMG_FMT_420_8BIT;
> +	} else if (sps->bit_depth_luma_minus8 =3D=3D 2) {
> +		if (sps->chroma_format_idc =3D=3D 2)
> +			return RKVDEC_IMG_FMT_422_10BIT;
> +		else
> +			return RKVDEC_IMG_FMT_420_10BIT;
> +	}
> +
> +	return RKVDEC_IMG_FMT_ANY;
> +}
> +
> +int rkvdec_h264_validate_sps(struct rkvdec_ctx *ctx,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 const struct v4l2_ctrl_h264_sps *sps)
> +{
> +	unsigned int width, height;
> +
> +	if (sps->chroma_format_idc > 2)
> +		/* Only 4:0:0, 4:2:0 and 4:2:2 are supported */
> +		return -EINVAL;
> +	if (sps->bit_depth_luma_minus8 !=3D sps->bit_depth_chroma_minus8)
> +		/* Luma and chroma bit depth mismatch */
> +		return -EINVAL;
> +	if (sps->bit_depth_luma_minus8 !=3D 0 && sps->bit_depth_luma_minus8 !=
=3D 2)
> +		/* Only 8-bit and 10-bit is supported */
> +		return -EINVAL;
> +
> +	width =3D (sps->pic_width_in_mbs_minus1 + 1) * 16;
> +	height =3D (sps->pic_height_in_map_units_minus1 + 1) * 16;
> +
> +	/*
> +	 * When frame_mbs_only_flag is not set, this is field height,
> +	 * which is half the final height (see (7-18) in the
> +	 * specification)
> +	 */
> +	if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
> +		height *=3D 2;
> +
> +	if (width > ctx->coded_fmt.fmt.pix_mp.width ||
> +	=C2=A0=C2=A0=C2=A0 height > ctx->coded_fmt.fmt.pix_mp.height)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +void rkvdec_h264_run_preamble(struct rkvdec_ctx *ctx,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct rkvdec_h264_run *run)
> +{
> +	struct v4l2_ctrl *ctrl;
> +
> +	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_H264_DECODE_PARAMS)=
;
> +	run->decode_params =3D ctrl ? ctrl->p_cur.p : NULL;
> +	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_H264_SPS);
> +	run->sps =3D ctrl ? ctrl->p_cur.p : NULL;
> +	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_H264_PPS);
> +	run->pps =3D ctrl ? ctrl->p_cur.p : NULL;
> +	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_H264_SCALING_MATRIX=
);
> +	run->scaling_matrix =3D ctrl ? ctrl->p_cur.p : NULL;
> +
> +	rkvdec_run_preamble(ctx, &run->base);
> +}
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.h =
b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.h
> new file mode 100644
> index 000000000000..aea346744e4c
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.h
> @@ -0,0 +1,81 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip video decoder h264 common functions
> + *
> + * Copyright (C) 2025 Collabora, Ltd.
> + *=C2=A0 Detlev Casanova <detlev.casanova@collabora.com>
> + */
> +
> +#include <media/v4l2-h264.h>
> +#include <media/v4l2-mem2mem.h>
> +
> +#include "rkvdec.h"
> +
> +extern const s8 rkvdec_h264_cabac_table[4][464][2];
> +
> +struct rkvdec_h264_scaling_list {
> +	u8 scaling_list_4x4[6][16];
> +	u8 scaling_list_8x8[6][64];
> +	u8 padding[128];
> +};
> +
> +struct rkvdec_h264_reflists {
> +	struct v4l2_h264_reference p[V4L2_H264_REF_LIST_LEN];
> +	struct v4l2_h264_reference b0[V4L2_H264_REF_LIST_LEN];
> +	struct v4l2_h264_reference b1[V4L2_H264_REF_LIST_LEN];
> +};
> +
> +struct rkvdec_h264_run {
> +	struct rkvdec_run base;
> +	const struct v4l2_ctrl_h264_decode_params *decode_params;
> +	const struct v4l2_ctrl_h264_sps *sps;
> +	const struct v4l2_ctrl_h264_pps *pps;
> +	const struct v4l2_ctrl_h264_scaling_matrix *scaling_matrix;
> +	struct vb2_buffer *ref_buf[V4L2_H264_NUM_DPB_ENTRIES];
> +};
> +
> +struct rkvdec_rps_entry {
> +	u32 dpb_info0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5;
> +	u32 bottom_flag0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> +	u32 view_index_off0:=C2=A0=C2=A0=C2=A0 1;
> +	u32 dpb_info1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5;
> +	u32 bottom_flag1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> +	u32 view_index_off1:=C2=A0=C2=A0=C2=A0 1;
> +	u32 dpb_info2:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5;
> +	u32 bottom_flag2:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> +	u32 view_index_off2:=C2=A0=C2=A0=C2=A0 1;
> +	u32 dpb_info3:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5;
> +	u32 bottom_flag3:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> +	u32 view_index_off3:=C2=A0=C2=A0=C2=A0 1;
> +	u32 dpb_info4:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5;
> +	u32 bottom_flag4:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> +	u32 view_index_off4:=C2=A0=C2=A0=C2=A0 1;
> +	u32 dpb_info5:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5;
> +	u32 bottom_flag5:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> +	u32 view_index_off5:=C2=A0=C2=A0=C2=A0 1;
> +	u32 dpb_info6:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5;
> +	u32 bottom_flag6:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> +	u32 view_index_off6:=C2=A0=C2=A0=C2=A0 1;
> +	u32 dpb_info7:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5;
> +	u32 bottom_flag7:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> +	u32 view_index_off7:=C2=A0=C2=A0=C2=A0 1;
> +} __packed;
> +
> +struct rkvdec_rps {
> +	u16 frame_num[16];
> +	u32 reserved0;
> +	struct rkvdec_rps_entry entries[12];
> +	u32 reserved1[66];
> +} __packed;
> +
> +void lookup_ref_buf_idx(struct rkvdec_ctx *ctx, struct rkvdec_h264_run *=
run);
> +void assemble_hw_rps(struct v4l2_h264_reflist_builder *builder,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 struct rkvdec_h264_run *run,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 struct rkvdec_h264_reflists *reflists,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 struct rkvdec_rps *hw_rps);
> +void assemble_hw_scaling_list(struct rkvdec_h264_run *run,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct rkvdec_h264_scaling_list *scali=
ng_list);
> +int rkvdec_h264_adjust_fmt(struct rkvdec_ctx *ctx, struct v4l2_format *f=
);
> +enum rkvdec_image_fmt rkvdec_h264_get_image_fmt(struct rkvdec_ctx *ctx, =
struct v4l2_ctrl *ctrl);
> +int rkvdec_h264_validate_sps(struct rkvdec_ctx *ctx, const struct v4l2_c=
trl_h264_sps *sps);
> +void rkvdec_h264_run_preamble(struct rkvdec_ctx *ctx, struct rkvdec_h264=
_run *run);
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c b/drive=
rs/media/platform/rockchip/rkvdec/rkvdec-h264.c
> index cb17dfcae5ca..e98bb69ff7f9 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
> @@ -14,59 +14,16 @@
> =C2=A0
> =C2=A0#include "rkvdec.h"
> =C2=A0#include "rkvdec-regs.h"
> -
> -extern const s8 rkvdec_h264_cabac_table[4][464][2];
> +#include "rkvdec-h264-common.h"
> =C2=A0
> =C2=A0/* Size with u32 units. */
> =C2=A0#define RKV_CABAC_INIT_BUFFER_SIZE	(3680 + 128)
> =C2=A0#define RKV_ERROR_INFO_SIZE		(256 * 144 * 4)
> =C2=A0
> -#define RKVDEC_NUM_REFLIST		3
> -
> -struct rkvdec_h264_scaling_list {
> -	u8 scaling_list_4x4[6][16];
> -	u8 scaling_list_8x8[6][64];
> -	u8 padding[128];
> -};
> -
> =C2=A0struct rkvdec_sps_pps_packet {
> =C2=A0	u32 info[8];
> =C2=A0};
> =C2=A0
> -struct rkvdec_rps_entry {
> -	u32 dpb_info0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5;
> -	u32 bottom_flag0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> -	u32 view_index_off0:=C2=A0=C2=A0=C2=A0 1;
> -	u32 dpb_info1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5;
> -	u32 bottom_flag1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> -	u32 view_index_off1:=C2=A0=C2=A0=C2=A0 1;
> -	u32 dpb_info2:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5;
> -	u32 bottom_flag2:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> -	u32 view_index_off2:=C2=A0=C2=A0=C2=A0 1;
> -	u32 dpb_info3:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5;
> -	u32 bottom_flag3:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> -	u32 view_index_off3:=C2=A0=C2=A0=C2=A0 1;
> -	u32 dpb_info4:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5;
> -	u32 bottom_flag4:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> -	u32 view_index_off4:=C2=A0=C2=A0=C2=A0 1;
> -	u32 dpb_info5:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5;
> -	u32 bottom_flag5:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> -	u32 view_index_off5:=C2=A0=C2=A0=C2=A0 1;
> -	u32 dpb_info6:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5;
> -	u32 bottom_flag6:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> -	u32 view_index_off6:=C2=A0=C2=A0=C2=A0 1;
> -	u32 dpb_info7:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5;
> -	u32 bottom_flag7:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> -	u32 view_index_off7:=C2=A0=C2=A0=C2=A0 1;
> -} __packed;
> -
> -struct rkvdec_rps {
> -	u16 frame_num[16];
> -	u32 reserved0;
> -	struct rkvdec_rps_entry entries[12];
> -	u32 reserved1[66];
> -} __packed;
> -
> =C2=A0struct rkvdec_ps_field {
> =C2=A0	u16 offset;
> =C2=A0	u8 len;
> @@ -118,11 +75,6 @@ struct rkvdec_ps_field {
> =C2=A0#define SCALING_LIST_ADDRESS				PS_FIELD(184, 32)
> =C2=A0#define IS_LONG_TERM(i)				PS_FIELD(216 + (i), 1)
> =C2=A0
> -#define DPB_OFFS(i, j)					(288 + ((j) * 32 * 7) + ((i) * 7))
> -#define DPB_INFO(i, j)					PS_FIELD(DPB_OFFS(i, j), 5)
> -#define BOTTOM_FLAG(i, j)				PS_FIELD(DPB_OFFS(i, j) + 5, 1)
> -#define VIEW_INDEX_OFF(i, j)				PS_FIELD(DPB_OFFS(i, j) + 6, 1)
> -
> =C2=A0/* Data structure describing auxiliary buffer format. */
> =C2=A0struct rkvdec_h264_priv_tbl {
> =C2=A0	s8 cabac_table[4][464][2];
> @@ -132,21 +84,6 @@ struct rkvdec_h264_priv_tbl {
> =C2=A0	u8 err_info[RKV_ERROR_INFO_SIZE];
> =C2=A0};
> =C2=A0
> -struct rkvdec_h264_reflists {
> -	struct v4l2_h264_reference p[V4L2_H264_REF_LIST_LEN];
> -	struct v4l2_h264_reference b0[V4L2_H264_REF_LIST_LEN];
> -	struct v4l2_h264_reference b1[V4L2_H264_REF_LIST_LEN];
> -};
> -
> -struct rkvdec_h264_run {
> -	struct rkvdec_run base;
> -	const struct v4l2_ctrl_h264_decode_params *decode_params;
> -	const struct v4l2_ctrl_h264_sps *sps;
> -	const struct v4l2_ctrl_h264_pps *pps;
> -	const struct v4l2_ctrl_h264_scaling_matrix *scaling_matrix;
> -	struct vb2_buffer *ref_buf[V4L2_H264_NUM_DPB_ENTRIES];
> -};
> -
> =C2=A0struct rkvdec_h264_ctx {
> =C2=A0	struct rkvdec_aux_buf priv_tbl;
> =C2=A0	struct rkvdec_h264_reflists reflists;
> @@ -270,155 +207,6 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> =C2=A0	}
> =C2=A0}
> =C2=A0
> -static void lookup_ref_buf_idx(struct rkvdec_ctx *ctx,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct rkvdec_h264_run *run)
> -{
> -	const struct v4l2_ctrl_h264_decode_params *dec_params =3D run->decode_p=
arams;
> -	u32 i;
> -
> -	for (i =3D 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
> -		struct v4l2_m2m_ctx *m2m_ctx =3D ctx->fh.m2m_ctx;
> -		const struct v4l2_h264_dpb_entry *dpb =3D run->decode_params->dpb;
> -		struct vb2_queue *cap_q =3D &m2m_ctx->cap_q_ctx.q;
> -		struct vb2_buffer *buf =3D NULL;
> -
> -		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE) {
> -			buf =3D vb2_find_buffer(cap_q, dpb[i].reference_ts);
> -			if (!buf)
> -				pr_debug("No buffer for reference_ts %llu",
> -					 dpb[i].reference_ts);
> -		}
> -
> -		run->ref_buf[i] =3D buf;
> -	}
> -}
> -
> -static void set_dpb_info(struct rkvdec_rps_entry *entries,
> -			 u8 reflist,
> -			 u8 refnum,
> -			 u8 info,
> -			 bool bottom)
> -{
> -	struct rkvdec_rps_entry *entry =3D &entries[(reflist * 4) + refnum / 8]=
;
> -	u8 idx =3D refnum % 8;
> -
> -	switch (idx) {
> -	case 0:
> -		entry->dpb_info0 =3D info;
> -		entry->bottom_flag0 =3D bottom;
> -		break;
> -	case 1:
> -		entry->dpb_info1 =3D info;
> -		entry->bottom_flag1 =3D bottom;
> -		break;
> -	case 2:
> -		entry->dpb_info2 =3D info;
> -		entry->bottom_flag2 =3D bottom;
> -		break;
> -	case 3:
> -		entry->dpb_info3 =3D info;
> -		entry->bottom_flag3 =3D bottom;
> -		break;
> -	case 4:
> -		entry->dpb_info4 =3D info;
> -		entry->bottom_flag4 =3D bottom;
> -		break;
> -	case 5:
> -		entry->dpb_info5 =3D info;
> -		entry->bottom_flag5 =3D bottom;
> -		break;
> -	case 6:
> -		entry->dpb_info6 =3D info;
> -		entry->bottom_flag6 =3D bottom;
> -		break;
> -	case 7:
> -		entry->dpb_info7 =3D info;
> -		entry->bottom_flag7 =3D bottom;
> -		break;
> -	}
> -}
> -
> -static void assemble_hw_rps(struct rkvdec_ctx *ctx,
> -			=C2=A0=C2=A0=C2=A0 struct v4l2_h264_reflist_builder *builder,
> -			=C2=A0=C2=A0=C2=A0 struct rkvdec_h264_run *run)
> -{
> -	const struct v4l2_ctrl_h264_decode_params *dec_params =3D run->decode_p=
arams;
> -	const struct v4l2_h264_dpb_entry *dpb =3D dec_params->dpb;
> -	struct rkvdec_h264_ctx *h264_ctx =3D ctx->priv;
> -	struct rkvdec_h264_priv_tbl *priv_tbl =3D h264_ctx->priv_tbl.cpu;
> -
> -	struct rkvdec_rps *hw_rps =3D &priv_tbl->rps;
> -	u32 i, j;
> -
> -	memset(hw_rps, 0, sizeof(*hw_rps));
> -
> -	/*
> -	 * Assign an invalid pic_num if DPB entry at that position is inactive.
> -	 * If we assign 0 in that position hardware will treat that as a real
> -	 * reference picture with pic_num 0, triggering output picture
> -	 * corruption.
> -	 */
> -	for (i =3D 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
> -		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
> -			continue;
> -
> -		hw_rps->frame_num[i] =3D builder->refs[i].frame_num;
> -	}
> -
> -	for (j =3D 0; j < RKVDEC_NUM_REFLIST; j++) {
> -		for (i =3D 0; i < builder->num_valid; i++) {
> -			struct v4l2_h264_reference *ref;
> -			bool dpb_valid;
> -			bool bottom;
> -
> -			switch (j) {
> -			case 0:
> -				ref =3D &h264_ctx->reflists.p[i];
> -				break;
> -			case 1:
> -				ref =3D &h264_ctx->reflists.b0[i];
> -				break;
> -			case 2:
> -				ref =3D &h264_ctx->reflists.b1[i];
> -				break;
> -			}
> -
> -			if (WARN_ON(ref->index >=3D ARRAY_SIZE(dec_params->dpb)))
> -				continue;
> -
> -			dpb_valid =3D run->ref_buf[ref->index] !=3D NULL;
> -			bottom =3D ref->fields =3D=3D V4L2_H264_BOTTOM_FIELD_REF;
> -
> -			set_dpb_info(hw_rps->entries, j, i, ref->index | (dpb_valid << 4), bo=
ttom);
> -		}
> -	}
> -}
> -
> -static void assemble_hw_scaling_list(struct rkvdec_ctx *ctx,
> -				=C2=A0=C2=A0=C2=A0=C2=A0 struct rkvdec_h264_run *run)
> -{
> -	const struct v4l2_ctrl_h264_scaling_matrix *scaling =3D run->scaling_ma=
trix;
> -	const struct v4l2_ctrl_h264_pps *pps =3D run->pps;
> -	struct rkvdec_h264_ctx *h264_ctx =3D ctx->priv;
> -	struct rkvdec_h264_priv_tbl *tbl =3D h264_ctx->priv_tbl.cpu;
> -
> -	if (!(pps->flags & V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT))
> -		return;
> -
> -	BUILD_BUG_ON(sizeof(tbl->scaling_list.scaling_list_4x4) !=3D
> -		=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(scaling->scaling_list_4x4));
> -	BUILD_BUG_ON(sizeof(tbl->scaling_list.scaling_list_8x8) !=3D
> -		=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(scaling->scaling_list_8x8));
> -
> -	memcpy(tbl->scaling_list.scaling_list_4x4,
> -	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scaling->scaling_list_4x4,
> -	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(scaling->scaling_list_4x4))=
;
> -
> -	memcpy(tbl->scaling_list.scaling_list_8x8,
> -	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scaling->scaling_list_8x8,
> -	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(scaling->scaling_list_8x8))=
;
> -}
> -
> =C2=A0/*
> =C2=A0 * Set the ref POC in the correct register.
> =C2=A0 *
> @@ -568,76 +356,6 @@ static void config_registers(struct rkvdec_ctx *ctx,
> =C2=A0	rkvdec_memcpy_toio(rkvdec->regs, regs, MIN(sizeof(*regs), 4 * rkvd=
ec->variant->num_regs));
> =C2=A0}
> =C2=A0
> -#define RKVDEC_H264_MAX_DEPTH_IN_BYTES		2
> -
> -static int rkvdec_h264_adjust_fmt(struct rkvdec_ctx *ctx,
> -				=C2=A0 struct v4l2_format *f)
> -{
> -	struct v4l2_pix_format_mplane *fmt =3D &f->fmt.pix_mp;
> -
> -	fmt->num_planes =3D 1;
> -	if (!fmt->plane_fmt[0].sizeimage)
> -		fmt->plane_fmt[0].sizeimage =3D fmt->width * fmt->height *
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RKVDEC_H264_MAX_DEPTH_IN_BYTES;
> -	return 0;
> -}
> -
> -static enum rkvdec_image_fmt rkvdec_h264_get_image_fmt(struct rkvdec_ctx=
 *ctx,
> -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_ctrl *ctrl)
> -{
> -	const struct v4l2_ctrl_h264_sps *sps =3D ctrl->p_new.p_h264_sps;
> -
> -	if (ctrl->id !=3D V4L2_CID_STATELESS_H264_SPS)
> -		return RKVDEC_IMG_FMT_ANY;
> -
> -	if (sps->bit_depth_luma_minus8 =3D=3D 0) {
> -		if (sps->chroma_format_idc =3D=3D 2)
> -			return RKVDEC_IMG_FMT_422_8BIT;
> -		else
> -			return RKVDEC_IMG_FMT_420_8BIT;
> -	} else if (sps->bit_depth_luma_minus8 =3D=3D 2) {
> -		if (sps->chroma_format_idc =3D=3D 2)
> -			return RKVDEC_IMG_FMT_422_10BIT;
> -		else
> -			return RKVDEC_IMG_FMT_420_10BIT;
> -	}
> -
> -	return RKVDEC_IMG_FMT_ANY;
> -}
> -
> -static int rkvdec_h264_validate_sps(struct rkvdec_ctx *ctx,
> -				=C2=A0=C2=A0=C2=A0 const struct v4l2_ctrl_h264_sps *sps)
> -{
> -	unsigned int width, height;
> -
> -	if (sps->chroma_format_idc > 2)
> -		/* Only 4:0:0, 4:2:0 and 4:2:2 are supported */
> -		return -EINVAL;
> -	if (sps->bit_depth_luma_minus8 !=3D sps->bit_depth_chroma_minus8)
> -		/* Luma and chroma bit depth mismatch */
> -		return -EINVAL;
> -	if (sps->bit_depth_luma_minus8 !=3D 0 && sps->bit_depth_luma_minus8 !=
=3D 2)
> -		/* Only 8-bit and 10-bit is supported */
> -		return -EINVAL;
> -
> -	width =3D (sps->pic_width_in_mbs_minus1 + 1) * 16;
> -	height =3D (sps->pic_height_in_map_units_minus1 + 1) * 16;
> -
> -	/*
> -	 * When frame_mbs_only_flag is not set, this is field height,
> -	 * which is half the final height (see (7-18) in the
> -	 * specification)
> -	 */
> -	if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
> -		height *=3D 2;
> -
> -	if (width > ctx->coded_fmt.fmt.pix_mp.width ||
> -	=C2=A0=C2=A0=C2=A0 height > ctx->coded_fmt.fmt.pix_mp.height)
> -		return -EINVAL;
> -
> -	return 0;
> -}
> -
> =C2=A0static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
> =C2=A0{
> =C2=A0	struct rkvdec_dev *rkvdec =3D ctx->dev;
> @@ -689,33 +407,13 @@ static void rkvdec_h264_stop(struct rkvdec_ctx *ctx=
)
> =C2=A0	kfree(h264_ctx);
> =C2=A0}
> =C2=A0
> -static void rkvdec_h264_run_preamble(struct rkvdec_ctx *ctx,
> -				=C2=A0=C2=A0=C2=A0=C2=A0 struct rkvdec_h264_run *run)
> -{
> -	struct v4l2_ctrl *ctrl;
> -
> -	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_H264_DECODE_PARAMS)=
;
> -	run->decode_params =3D ctrl ? ctrl->p_cur.p : NULL;
> -	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_H264_SPS);
> -	run->sps =3D ctrl ? ctrl->p_cur.p : NULL;
> -	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_H264_PPS);
> -	run->pps =3D ctrl ? ctrl->p_cur.p : NULL;
> -	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_H264_SCALING_MATRIX=
);
> -	run->scaling_matrix =3D ctrl ? ctrl->p_cur.p : NULL;
> -
> -	rkvdec_run_preamble(ctx, &run->base);
> -}
> -
> =C2=A0static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
> =C2=A0{
> =C2=A0	struct v4l2_h264_reflist_builder reflist_builder;
> =C2=A0	struct rkvdec_dev *rkvdec =3D ctx->dev;
> =C2=A0	struct rkvdec_h264_ctx *h264_ctx =3D ctx->priv;
> =C2=A0	struct rkvdec_h264_run run;
> +	struct rkvdec_h264_priv_tbl *tbl =3D h264_ctx->priv_tbl.cpu;
> =C2=A0
> =C2=A0	rkvdec_h264_run_preamble(ctx, &run);
> =C2=A0
> @@ -726,10 +424,10 @@ static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
> =C2=A0	v4l2_h264_build_b_ref_lists(&reflist_builder, h264_ctx->reflists.b=
0,
> =C2=A0				=C2=A0=C2=A0=C2=A0 h264_ctx->reflists.b1);
> =C2=A0
> -	assemble_hw_scaling_list(ctx, &run);
> +	assemble_hw_scaling_list(&run, &tbl->scaling_list);
> =C2=A0	assemble_hw_pps(ctx, &run);
> =C2=A0	lookup_ref_buf_idx(ctx, &run);
> -	assemble_hw_rps(ctx, &reflist_builder, &run);
> +	assemble_hw_rps(&reflist_builder, &run, &h264_ctx->reflists, &tbl->rps)=
;
> =C2=A0	config_registers(ctx, &run);
> =C2=A0
> =C2=A0	rkvdec_run_postamble(ctx, &run.base);

--=-7cWpuYv/CS60HWwkFqk+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTnWFAAKCRDZQZRRKWBy
9PonAP9qrD7muTlFKuj16TXKfPS9NFwsx1AypmO6tefLPDjYAQD8DAAaxa7sqCzc
VpOfpnys4RRpc6g/Wk8BGVdiOfj/PwE=
=epB0
-----END PGP SIGNATURE-----

--=-7cWpuYv/CS60HWwkFqk+--

