Return-Path: <linux-media+bounces-48589-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5BACB3F1A
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 21:22:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E779A3089E58
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 20:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5D732BF23;
	Wed, 10 Dec 2025 20:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OgIpAqHK"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D0632548B;
	Wed, 10 Dec 2025 20:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765398135; cv=none; b=oWby5b850SajM7915MolW8+sp2IG/yYiGstuxekCTNCoc0/UxM5rckznvXHZwgPHf6bkv6Y3pZXeE3O7IhuPdd87gfdbY0eCXm15Xs4OuiWQJ3yoJFZwC8N3CKSyRIiotFutieoePNCsMF18VTNOF71WxgwYyau81YolwElxiZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765398135; c=relaxed/simple;
	bh=Ax+sO0e38kB58xCYiqy7IGeDQTYDWZM08sPoPvzRjEo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ubd7cmK/qrBxRZrCbPWeNvaUHZrSFH1MtEBdMeSMYK9jjOBWl7gIpvBKITz9R90BTgo9fI+swvIYRE0C/Ll36MJa3BI83puJTvzI9B4XvS9oWwN/qn/ZYb4J4m58yyKGwMIRueV5tnh6a1qPlekztR5PGavTB4GdYf1eX2A607M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OgIpAqHK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765398130;
	bh=Ax+sO0e38kB58xCYiqy7IGeDQTYDWZM08sPoPvzRjEo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=OgIpAqHKTExHpkkx7fGJoI9w+R/0Sh7xPyK2OxdjmfXQIZixt8UhsK2+YOPcmSlpR
	 hT+PbcUdJ6EcCp1U/phtLR8prFZItRwDj71upE+RBORMLLL+Ej3W5zXhiLh8Ok72A0
	 58FH3Xok0qOogdqpKBg28+k35pnL4+Hltz2X82L4O2t/bsZAQ50w0vr94TzF5cUe6E
	 9stEGzOg/tiLveTaKq1C3JU02evMp+15WtxDLF0c3l/j6IVj6jZlrswyi0ZVB5douk
	 xgHcHfqvwuHoeB+6rfCTBQ6vxzypGnMiNm3heq7+rjq4gwafaMtduAhfFaLES4wvxm
	 VC486Hg3BQasw==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0801017E12FB;
	Wed, 10 Dec 2025 21:22:07 +0100 (CET)
Message-ID: <faaf8950ae8d71d45345bc3534fa26188ccef7d9.camel@collabora.com>
Subject: Re: [PATCH v4 07/15] media: rkvdec: Move hevc functions to common
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
Date: Wed, 10 Dec 2025 15:22:06 -0500
In-Reply-To: <20251022174508.284929-8-detlev.casanova@collabora.com>
References: <20251022174508.284929-1-detlev.casanova@collabora.com>
	 <20251022174508.284929-8-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-XMb4S5S5gAM4ceeCNe2n"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-XMb4S5S5gAM4ceeCNe2n
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
> =C2=A0.../rockchip/rkvdec/rkvdec-hevc-common.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 233 +++++++++++++++++
> =C2=A0.../rockchip/rkvdec/rkvdec-hevc-common.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 51 ++++
> =C2=A0.../platform/rockchip/rkvdec/rkvdec-hevc.c=C2=A0=C2=A0=C2=A0 | 243 =
+-----------------
> =C2=A04 files changed, 291 insertions(+), 237 deletions(-)
> =C2=A0create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-he=
vc-common.c
> =C2=A0create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-he=
vc-common.h
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/Makefile b/drivers/me=
dia/platform/rockchip/rkvdec/Makefile
> index d2ba7a7c15e5..1b4bc44be23e 100644
> --- a/drivers/media/platform/rockchip/rkvdec/Makefile
> +++ b/drivers/media/platform/rockchip/rkvdec/Makefile
> @@ -6,4 +6,5 @@ rockchip-vdec-y +=3D \
> =C2=A0		=C2=A0=C2=A0 rkvdec-h264.o \
> =C2=A0		=C2=A0=C2=A0 rkvdec-h264-common.o \
> =C2=A0		=C2=A0=C2=A0 rkvdec-hevc.o \
> +		=C2=A0=C2=A0 rkvdec-hevc-common.o \
> =C2=A0		=C2=A0=C2=A0 rkvdec-vp9.o
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c =
b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> new file mode 100644
> index 000000000000..d571107f2242
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> @@ -0,0 +1,233 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip video decoder hevc common functions
> + *
> + * Copyright (C) 2025 Collabora, Ltd.
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Detlev Casanova <detlev.casanova@collab=
ora.com>
> + *
> + * Copyright (C) 2023 Collabora, Ltd.
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Sebastian Fricke <sebastian.fricke@coll=
abora.com>
> + *
> + * Copyright (C) 2019 Collabora, Ltd.
> + *	Boris Brezillon <boris.brezillon@collabora.com>
> + *
> + * Copyright (C) 2016 Rockchip Electronics Co., Ltd.
> + *	Jeffy Chen <jeffy.chen@rock-chips.com>
> + */
> +
> +#include <linux/v4l2-common.h>
> +#include <media/v4l2-mem2mem.h>
> +
> +#include "rkvdec.h"
> +#include "rkvdec-hevc-common.h"
> +
> +/*
> + * Flip one or more matrices along their main diagonal and flatten them
> + * before writing it to the memory.
> + * Convert:
> + * ABCD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AEIM
> + * EFGH=C2=A0=C2=A0=C2=A0=C2=A0 =3D>=C2=A0 BFJN=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D>=C2=A0=C2=A0=C2=A0=C2=A0 AEIMBFJNCGKODHLP
> + * IJKL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CGKO
> + * MNOP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DHLP
> + */
> +static void transpose_and_flatten_matrices(u8 *output, const u8 *input,
> +					=C2=A0=C2=A0 int matrices, int row_length)
> +{
> +	int i, j, row, x_offset, matrix_offset, rot_index, y_offset, matrix_siz=
e, new_value;
> +
> +	matrix_size =3D row_length * row_length;
> +	for (i =3D 0; i < matrices; i++) {
> +		row =3D 0;
> +		x_offset =3D 0;
> +		matrix_offset =3D i * matrix_size;
> +		for (j =3D 0; j < matrix_size; j++) {
> +			y_offset =3D j - (row * row_length);
> +			rot_index =3D y_offset * row_length + x_offset;
> +			new_value =3D *(input + i * matrix_size + j);
> +			output[matrix_offset + rot_index] =3D new_value;
> +			if ((j + 1) % row_length =3D=3D 0) {
> +				row +=3D 1;
> +				x_offset +=3D 1;
> +			}
> +		}
> +	}
> +}
> +
> +static void assemble_scalingfactor0(u8 *output, const struct v4l2_ctrl_h=
evc_scaling_matrix *input)
> +{
> +	int offset =3D 0;
> +
> +	transpose_and_flatten_matrices(output, (const u8 *)input->scaling_list_=
4x4, 6, 4);
> +	offset =3D 6 * 16 * sizeof(u8);
> +	transpose_and_flatten_matrices(output + offset, (const u8 *)input->scal=
ing_list_8x8, 6, 8);
> +	offset +=3D 6 * 64 * sizeof(u8);
> +	transpose_and_flatten_matrices(output + offset,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (const u8 *)input->scaling_list=
_16x16, 6, 8);
> +	offset +=3D 6 * 64 * sizeof(u8);
> +	/* Add a 128 byte padding with 0s between the two 32x32 matrices */
> +	transpose_and_flatten_matrices(output + offset,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (const u8 *)input->scaling_list=
_32x32, 1, 8);
> +	offset +=3D 64 * sizeof(u8);
> +	memset(output + offset, 0, 128);
> +	offset +=3D 128 * sizeof(u8);
> +	transpose_and_flatten_matrices(output + offset,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (const u8 *)input->scaling_list=
_32x32 + (64 * sizeof(u8)),
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1, 8);
> +	offset +=3D 64 * sizeof(u8);
> +	memset(output + offset, 0, 128);
> +}
> +
> +/*
> + * Required layout:
> + * A =3D scaling_list_dc_coef_16x16
> + * B =3D scaling_list_dc_coef_32x32
> + * 0 =3D Padding
> + *
> + * A, A, A, A, A, A, B, 0, 0, B, 0, 0
> + */
> +static void assemble_scalingdc(u8 *output, const struct v4l2_ctrl_hevc_s=
caling_matrix *input)
> +{
> +	u8 list_32x32[6] =3D {0};
> +
> +	memcpy(output, input->scaling_list_dc_coef_16x16, 6 * sizeof(u8));
> +	list_32x32[0] =3D input->scaling_list_dc_coef_32x32[0];
> +	list_32x32[3] =3D input->scaling_list_dc_coef_32x32[1];
> +	memcpy(output + 6 * sizeof(u8), list_32x32, 6 * sizeof(u8));
> +}
> +
> +static void translate_scaling_list(struct scaling_factor *output,
> +				=C2=A0=C2=A0 const struct v4l2_ctrl_hevc_scaling_matrix *input)
> +{
> +	assemble_scalingfactor0(output->scalingfactor0, input);
> +	memcpy(output->scalingfactor1, (const u8 *)input->scaling_list_4x4, 96)=
;
> +	assemble_scalingdc(output->scalingdc, input);
> +	memset(output->reserved, 0, 4 * sizeof(u8));
> +}
> +
> +void rkvdec_hevc_assemble_hw_scaling_list(struct rkvdec_hevc_run *run,
> +					=C2=A0 struct scaling_factor *scaling_factor,
> +					=C2=A0 struct v4l2_ctrl_hevc_scaling_matrix *cache)
> +{
> +	const struct v4l2_ctrl_hevc_scaling_matrix *scaling =3D run->scaling_ma=
trix;
> +
> +	if (!memcmp(cache, scaling,
> +		=C2=A0=C2=A0=C2=A0 sizeof(struct v4l2_ctrl_hevc_scaling_matrix)))
> +		return;
> +
> +	translate_scaling_list(scaling_factor, scaling);
> +
> +	memcpy(cache, scaling,
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(struct v4l2_ctrl_hevc_scali=
ng_matrix));
> +}
> +
> +struct vb2_buffer *
> +get_ref_buf(struct rkvdec_ctx *ctx, struct rkvdec_hevc_run *run,
> +	=C2=A0=C2=A0=C2=A0 unsigned int dpb_idx)
> +{
> +	struct v4l2_m2m_ctx *m2m_ctx =3D ctx->fh.m2m_ctx;
> +	const struct v4l2_ctrl_hevc_decode_params *decode_params =3D run->decod=
e_params;
> +	const struct v4l2_hevc_dpb_entry *dpb =3D decode_params->dpb;
> +	struct vb2_queue *cap_q =3D &m2m_ctx->cap_q_ctx.q;
> +	struct vb2_buffer *buf =3D NULL;
> +
> +	if (dpb_idx < decode_params->num_active_dpb_entries)
> +		buf =3D vb2_find_buffer(cap_q, dpb[dpb_idx].timestamp);
> +
> +	/*
> +	 * If a DPB entry is unused or invalid, the address of current destinat=
ion
> +	 * buffer is returned.
> +	 */
> +	if (!buf)
> +		return &run->base.bufs.dst->vb2_buf;
> +
> +	return buf;
> +}
> +
> +#define RKVDEC_HEVC_MAX_DEPTH_IN_BYTES		2
> +
> +int rkvdec_hevc_adjust_fmt(struct rkvdec_ctx *ctx, struct v4l2_format *f=
)
> +{
> +	struct v4l2_pix_format_mplane *fmt =3D &f->fmt.pix_mp;
> +
> +	fmt->num_planes =3D 1;
> +	if (!fmt->plane_fmt[0].sizeimage)
> +		fmt->plane_fmt[0].sizeimage =3D fmt->width * fmt->height *
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RKVDEC_HEVC_MAX_DEPTH_IN_BYTES;
> +	return 0;
> +}
> +
> +enum rkvdec_image_fmt rkvdec_hevc_get_image_fmt(struct rkvdec_ctx *ctx,
> +						struct v4l2_ctrl *ctrl)
> +{
> +	const struct v4l2_ctrl_hevc_sps *sps =3D ctrl->p_new.p_hevc_sps;
> +
> +	if (ctrl->id !=3D V4L2_CID_STATELESS_HEVC_SPS)
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
> +static int rkvdec_hevc_validate_sps(struct rkvdec_ctx *ctx,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 const struct v4l2_ctrl_hevc_sps *sps)
> +{
> +	if (sps->chroma_format_idc > 1)
> +		/* Only 4:0:0 and 4:2:0 are supported */
> +		return -EINVAL;
> +	if (sps->bit_depth_luma_minus8 !=3D sps->bit_depth_chroma_minus8)
> +		/* Luma and chroma bit depth mismatch */
> +		return -EINVAL;
> +	if (sps->bit_depth_luma_minus8 !=3D 0 && sps->bit_depth_luma_minus8 !=
=3D 2)
> +		/* Only 8-bit and 10-bit are supported */
> +		return -EINVAL;
> +
> +	if (sps->pic_width_in_luma_samples > ctx->coded_fmt.fmt.pix_mp.width ||
> +	=C2=A0=C2=A0=C2=A0 sps->pic_height_in_luma_samples > ctx->coded_fmt.fmt=
.pix_mp.height)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +void rkvdec_hevc_run_preamble(struct rkvdec_ctx *ctx,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct rkvdec_hevc_run *run)
> +{
> +	struct v4l2_ctrl *ctrl;
> +
> +	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_HEVC_DECODE_PARAMS)=
;
> +	run->decode_params =3D ctrl ? ctrl->p_cur.p : NULL;
> +	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_HEVC_SLICE_PARAMS);
> +	run->slices_params =3D ctrl ? ctrl->p_cur.p : NULL;
> +	run->num_slices =3D ctrl ? ctrl->new_elems : 0;
> +	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_HEVC_SPS);
> +	run->sps =3D ctrl ? ctrl->p_cur.p : NULL;
> +	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_HEVC_PPS);
> +	run->pps =3D ctrl ? ctrl->p_cur.p : NULL;
> +	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_HEVC_SCALING_MATRIX=
);
> +	run->scaling_matrix =3D ctrl ? ctrl->p_cur.p : NULL;
> +
> +	rkvdec_run_preamble(ctx, &run->base);
> +}
> +
> +int rkvdec_hevc_try_ctrl(struct rkvdec_ctx *ctx, struct v4l2_ctrl *ctrl)
> +{
> +	if (ctrl->id =3D=3D V4L2_CID_STATELESS_HEVC_SPS)
> +		return rkvdec_hevc_validate_sps(ctx, ctrl->p_new.p_hevc_sps);
> +
> +	return 0;
> +}
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h =
b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
> new file mode 100644
> index 000000000000..746b1bd73c08
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip video decoder hevc common functions
> + *
> + * Copyright (C) 2025 Collabora, Ltd.
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Detlev Casanova <detlev.casanova@collab=
ora.com>
> + *
> + * Copyright (C) 2023 Collabora, Ltd.
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Sebastian Fricke <sebastian.fricke@coll=
abora.com>
> + *
> + * Copyright (C) 2019 Collabora, Ltd.
> + *	Boris Brezillon <boris.brezillon@collabora.com>
> + *
> + * Copyright (C) 2016 Rockchip Electronics Co., Ltd.
> + *	Jeffy Chen <jeffy.chen@rock-chips.com>
> + */
> +
> +#include <media/v4l2-mem2mem.h>
> +#include "rkvdec.h"
> +
> +#define RKV_HEVC_CABAC_TABLE_SIZE		27456
> +extern const u8 rkvdec_hevc_cabac_table[RKV_HEVC_CABAC_TABLE_SIZE];
> +
> +struct rkvdec_hevc_run {
> +	struct rkvdec_run base;
> +	const struct v4l2_ctrl_hevc_slice_params *slices_params;
> +	const struct v4l2_ctrl_hevc_decode_params *decode_params;
> +	const struct v4l2_ctrl_hevc_sps *sps;
> +	const struct v4l2_ctrl_hevc_pps *pps;
> +	const struct v4l2_ctrl_hevc_scaling_matrix *scaling_matrix;
> +	int num_slices;
> +};
> +
> +struct scaling_factor {
> +	u8 scalingfactor0[1248];
> +	u8 scalingfactor1[96];	/*4X4 TU Rotate, total 16X4*/
> +	u8 scalingdc[12];	/*N1005 Vienna Meeting*/
> +	u8 reserved[4];		/*16Bytes align*/
> +};
> +
> +enum rkvdec_image_fmt rkvdec_hevc_get_image_fmt(struct rkvdec_ctx *ctx,
> +						struct v4l2_ctrl *ctrl);
> +void rkvdec_hevc_assemble_hw_scaling_list(struct rkvdec_hevc_run *run,
> +					=C2=A0 struct scaling_factor *scaling_factor,
> +					=C2=A0 struct v4l2_ctrl_hevc_scaling_matrix *cache);
> +struct vb2_buffer *get_ref_buf(struct rkvdec_ctx *ctx,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct rkvdec_hevc_run *run,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int dpb_idx);
> +int rkvdec_hevc_adjust_fmt(struct rkvdec_ctx *ctx, struct v4l2_format *f=
);
> +int rkvdec_hevc_try_ctrl(struct rkvdec_ctx *ctx, struct v4l2_ctrl *ctrl)=
;
> +void rkvdec_hevc_run_preamble(struct rkvdec_ctx *ctx, struct rkvdec_hevc=
_run *run);
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c b/drive=
rs/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> index b01c1bb52a04..31a979698578 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> @@ -16,6 +16,7 @@
> =C2=A0
> =C2=A0#include "rkvdec.h"
> =C2=A0#include "rkvdec-regs.h"
> +#include "rkvdec-hevc-common.h"
> =C2=A0
> =C2=A0/* Size in u8/u32 units. */
> =C2=A0#define RKV_SCALING_LIST_SIZE		1360
> @@ -24,9 +25,6 @@
> =C2=A0#define RKV_RPS_SIZE			(32 / 4)
> =C2=A0#define RKV_RPS_LEN			600
> =C2=A0
> -#define RKV_HEVC_CABAC_TABLE_SIZE		27456
> -extern const u8 rkvdec_hevc_cabac_table[RKV_HEVC_CABAC_TABLE_SIZE];
> -
> =C2=A0struct rkvdec_sps_pps_packet {
> =C2=A0	u32 info[RKV_PPS_SIZE];
> =C2=A0};
> @@ -113,34 +111,17 @@ struct rkvdec_ps_field {
> =C2=A0/* Data structure describing auxiliary buffer format. */
> =C2=A0struct rkvdec_hevc_priv_tbl {
> =C2=A0	u8 cabac_table[RKV_HEVC_CABAC_TABLE_SIZE];
> -	u8 scaling_list[RKV_SCALING_LIST_SIZE];
> +	struct scaling_factor scaling_list;
> =C2=A0	struct rkvdec_sps_pps_packet param_set[RKV_PPS_LEN];
> =C2=A0	struct rkvdec_rps_packet rps[RKV_RPS_LEN];
> =C2=A0};
> =C2=A0
> -struct rkvdec_hevc_run {
> -	struct rkvdec_run base;
> -	const struct v4l2_ctrl_hevc_slice_params *slices_params;
> -	const struct v4l2_ctrl_hevc_decode_params *decode_params;
> -	const struct v4l2_ctrl_hevc_sps *sps;
> -	const struct v4l2_ctrl_hevc_pps *pps;
> -	const struct v4l2_ctrl_hevc_scaling_matrix *scaling_matrix;
> -	int num_slices;
> -};
> -
> =C2=A0struct rkvdec_hevc_ctx {
> =C2=A0	struct rkvdec_aux_buf priv_tbl;
> =C2=A0	struct v4l2_ctrl_hevc_scaling_matrix scaling_matrix_cache;
> =C2=A0	struct rkvdec_regs regs;
> =C2=A0};
> =C2=A0
> -struct scaling_factor {
> -	u8 scalingfactor0[1248];
> -	u8 scalingfactor1[96];		/*4X4 TU Rotate, total 16X4*/
> -	u8 scalingdc[12];		/*N1005 Vienna Meeting*/
> -	u8 reserved[4];		/*16Bytes align*/
> -};
> -
> =C2=A0static void set_ps_field(u32 *buf, struct rkvdec_ps_field field, u3=
2 value)
> =C2=A0{
> =C2=A0	u8 bit =3D field.offset % 32, word =3D field.offset / 32;
> @@ -417,131 +398,6 @@ static void assemble_sw_rps(struct rkvdec_ctx *ctx,
> =C2=A0	}
> =C2=A0}
> =C2=A0
> -/*
> - * Flip one or more matrices along their main diagonal and flatten them
> - * before writing it to the memory.
> - * Convert:
> - * ABCD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AEIM
> - * EFGH=C2=A0=C2=A0=C2=A0=C2=A0 =3D>=C2=A0 BFJN=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D>=C2=A0=C2=A0=C2=A0=C2=A0 AEIMBFJNCGKODHLP
> - * IJKL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CGKO
> - * MNOP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DHLP
> - */
> -static void transpose_and_flatten_matrices(u8 *output, const u8 *input,
> -					=C2=A0=C2=A0 int matrices, int row_length)
> -{
> -	int i, j, row, x_offset, matrix_offset, rot_index, y_offset, matrix_siz=
e, new_value;
> -
> -	matrix_size =3D row_length * row_length;
> -	for (i =3D 0; i < matrices; i++) {
> -		row =3D 0;
> -		x_offset =3D 0;
> -		matrix_offset =3D i * matrix_size;
> -		for (j =3D 0; j < matrix_size; j++) {
> -			y_offset =3D j - (row * row_length);
> -			rot_index =3D y_offset * row_length + x_offset;
> -			new_value =3D *(input + i * matrix_size + j);
> -			output[matrix_offset + rot_index] =3D new_value;
> -			if ((j + 1) % row_length =3D=3D 0) {
> -				row +=3D 1;
> -				x_offset +=3D 1;
> -			}
> -		}
> -	}
> -}
> -
> -static void assemble_scalingfactor0(u8 *output, const struct v4l2_ctrl_h=
evc_scaling_matrix *input)
> -{
> -	int offset =3D 0;
> -
> -	transpose_and_flatten_matrices(output, (const u8 *)input->scaling_list_=
4x4, 6, 4);
> -	offset =3D 6 * 16 * sizeof(u8);
> -	transpose_and_flatten_matrices(output + offset, (const u8 *)input->scal=
ing_list_8x8, 6, 8);
> -	offset +=3D 6 * 64 * sizeof(u8);
> -	transpose_and_flatten_matrices(output + offset,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (const u8 *)input->scaling_list=
_16x16, 6, 8);
> -	offset +=3D 6 * 64 * sizeof(u8);
> -	/* Add a 128 byte padding with 0s between the two 32x32 matrices */
> -	transpose_and_flatten_matrices(output + offset,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (const u8 *)input->scaling_list=
_32x32, 1, 8);
> -	offset +=3D 64 * sizeof(u8);
> -	memset(output + offset, 0, 128);
> -	offset +=3D 128 * sizeof(u8);
> -	transpose_and_flatten_matrices(output + offset,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (const u8 *)input->scaling_list=
_32x32 + (64 * sizeof(u8)),
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1, 8);
> -	offset +=3D 64 * sizeof(u8);
> -	memset(output + offset, 0, 128);
> -}
> -
> -/*
> - * Required layout:
> - * A =3D scaling_list_dc_coef_16x16
> - * B =3D scaling_list_dc_coef_32x32
> - * 0 =3D Padding
> - *
> - * A, A, A, A, A, A, B, 0, 0, B, 0, 0
> - */
> -static void assemble_scalingdc(u8 *output, const struct v4l2_ctrl_hevc_s=
caling_matrix *input)
> -{
> -	u8 list_32x32[6] =3D {0};
> -
> -	memcpy(output, input->scaling_list_dc_coef_16x16, 6 * sizeof(u8));
> -	list_32x32[0] =3D input->scaling_list_dc_coef_32x32[0];
> -	list_32x32[3] =3D input->scaling_list_dc_coef_32x32[1];
> -	memcpy(output + 6 * sizeof(u8), list_32x32, 6 * sizeof(u8));
> -}
> -
> -static void translate_scaling_list(struct scaling_factor *output,
> -				=C2=A0=C2=A0 const struct v4l2_ctrl_hevc_scaling_matrix *input)
> -{
> -	assemble_scalingfactor0(output->scalingfactor0, input);
> -	memcpy(output->scalingfactor1, (const u8 *)input->scaling_list_4x4, 96)=
;
> -	assemble_scalingdc(output->scalingdc, input);
> -	memset(output->reserved, 0, 4 * sizeof(u8));
> -}
> -
> -static void assemble_hw_scaling_list(struct rkvdec_ctx *ctx,
> -				=C2=A0=C2=A0=C2=A0=C2=A0 struct rkvdec_hevc_run *run)
> -{
> -	const struct v4l2_ctrl_hevc_scaling_matrix *scaling =3D run->scaling_ma=
trix;
> -	struct rkvdec_hevc_ctx *hevc_ctx =3D ctx->priv;
> -	struct rkvdec_hevc_priv_tbl *tbl =3D hevc_ctx->priv_tbl.cpu;
> -	u8 *dst;
> -
> -	if (!memcmp((void *)&hevc_ctx->scaling_matrix_cache, scaling,
> -		=C2=A0=C2=A0=C2=A0 sizeof(struct v4l2_ctrl_hevc_scaling_matrix)))
> -		return;
> -
> -	dst =3D tbl->scaling_list;
> -	translate_scaling_list((struct scaling_factor *)dst, scaling);
> -
> -	memcpy((void *)&hevc_ctx->scaling_matrix_cache, scaling,
> -	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(struct v4l2_ctrl_hevc_scali=
ng_matrix));
> -}
> -
> -static struct vb2_buffer *
> -get_ref_buf(struct rkvdec_ctx *ctx, struct rkvdec_hevc_run *run,
> -	=C2=A0=C2=A0=C2=A0 unsigned int dpb_idx)
> -{
> -	struct v4l2_m2m_ctx *m2m_ctx =3D ctx->fh.m2m_ctx;
> -	const struct v4l2_ctrl_hevc_decode_params *decode_params =3D run->decod=
e_params;
> -	const struct v4l2_hevc_dpb_entry *dpb =3D decode_params->dpb;
> -	struct vb2_queue *cap_q =3D &m2m_ctx->cap_q_ctx.q;
> -	struct vb2_buffer *buf =3D NULL;
> -
> -	if (dpb_idx < decode_params->num_active_dpb_entries)
> -		buf =3D vb2_find_buffer(cap_q, dpb[dpb_idx].timestamp);
> -
> -	/*
> -	 * If a DPB entry is unused or invalid, the address of current destinat=
ion
> -	 * buffer is returned.
> -	 */
> -	if (!buf)
> -		return &run->base.bufs.dst->vb2_buf;
> -
> -	return buf;
> -}
> -
> =C2=A0static void config_registers(struct rkvdec_ctx *ctx,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct rkvdec_hevc_run *run)
> =C2=A0{
> @@ -644,63 +500,6 @@ static void config_registers(struct rkvdec_ctx *ctx,
> =C2=A0	rkvdec_memcpy_toio(rkvdec->regs, regs, MIN(sizeof(*regs), 4 * rkvd=
ec->variant->num_regs));
> =C2=A0}
> =C2=A0
> -#define RKVDEC_HEVC_MAX_DEPTH_IN_BYTES		2
> -
> -static int rkvdec_hevc_adjust_fmt(struct rkvdec_ctx *ctx,
> -				=C2=A0 struct v4l2_format *f)
> -{
> -	struct v4l2_pix_format_mplane *fmt =3D &f->fmt.pix_mp;
> -
> -	fmt->num_planes =3D 1;
> -	if (!fmt->plane_fmt[0].sizeimage)
> -		fmt->plane_fmt[0].sizeimage =3D fmt->width * fmt->height *
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RKVDEC_HEVC_MAX_DEPTH_IN_BYTES;
> -	return 0;
> -}
> -
> -static enum rkvdec_image_fmt rkvdec_hevc_get_image_fmt(struct rkvdec_ctx=
 *ctx,
> -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_ctrl *ctrl)
> -{
> -	const struct v4l2_ctrl_hevc_sps *sps =3D ctrl->p_new.p_hevc_sps;
> -
> -	if (ctrl->id !=3D V4L2_CID_STATELESS_HEVC_SPS)
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
> -static int rkvdec_hevc_validate_sps(struct rkvdec_ctx *ctx,
> -				=C2=A0=C2=A0=C2=A0 const struct v4l2_ctrl_hevc_sps *sps)
> -{
> -	if (sps->chroma_format_idc > 1)
> -		/* Only 4:0:0 and 4:2:0 are supported */
> -		return -EINVAL;
> -	if (sps->bit_depth_luma_minus8 !=3D sps->bit_depth_chroma_minus8)
> -		/* Luma and chroma bit depth mismatch */
> -		return -EINVAL;
> -	if (sps->bit_depth_luma_minus8 !=3D 0 && sps->bit_depth_luma_minus8 !=
=3D 2)
> -		/* Only 8-bit and 10-bit is supported */
> -		return -EINVAL;
> -
> -	if (sps->pic_width_in_luma_samples > ctx->coded_fmt.fmt.pix_mp.width ||
> -	=C2=A0=C2=A0=C2=A0 sps->pic_height_in_luma_samples > ctx->coded_fmt.fmt=
.pix_mp.height)
> -		return -EINVAL;
> -
> -	return 0;
> -}
> -
> =C2=A0static int rkvdec_hevc_start(struct rkvdec_ctx *ctx)
> =C2=A0{
> =C2=A0	struct rkvdec_dev *rkvdec =3D ctx->dev;
> @@ -737,40 +536,18 @@ static void rkvdec_hevc_stop(struct rkvdec_ctx *ctx=
)
> =C2=A0	kfree(hevc_ctx);
> =C2=A0}
> =C2=A0
> -static void rkvdec_hevc_run_preamble(struct rkvdec_ctx *ctx,
> -				=C2=A0=C2=A0=C2=A0=C2=A0 struct rkvdec_hevc_run *run)
> -{
> -	struct v4l2_ctrl *ctrl;
> -
> -	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_HEVC_DECODE_PARAMS)=
;
> -	run->decode_params =3D ctrl ? ctrl->p_cur.p : NULL;
> -	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_HEVC_SLICE_PARAMS);
> -	run->slices_params =3D ctrl ? ctrl->p_cur.p : NULL;
> -	run->num_slices =3D ctrl ? ctrl->new_elems : 0;
> -	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_HEVC_SPS);
> -	run->sps =3D ctrl ? ctrl->p_cur.p : NULL;
> -	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_HEVC_PPS);
> -	run->pps =3D ctrl ? ctrl->p_cur.p : NULL;
> -	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_HEVC_SCALING_MATRIX=
);
> -	run->scaling_matrix =3D ctrl ? ctrl->p_cur.p : NULL;
> -
> -	rkvdec_run_preamble(ctx, &run->base);
> -}
> -
> =C2=A0static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
> =C2=A0{
> =C2=A0	struct rkvdec_dev *rkvdec =3D ctx->dev;
> =C2=A0	struct rkvdec_hevc_run run;
> +	struct rkvdec_hevc_ctx *hevc_ctx =3D ctx->priv;
> +	struct rkvdec_hevc_priv_tbl *tbl =3D hevc_ctx->priv_tbl.cpu;
> =C2=A0	u32 reg;
> =C2=A0
> =C2=A0	rkvdec_hevc_run_preamble(ctx, &run);
> =C2=A0
> -	assemble_hw_scaling_list(ctx, &run);
> +	rkvdec_hevc_assemble_hw_scaling_list(&run, &tbl->scaling_list,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 &hevc_ctx->scaling_matrix_cache);
> =C2=A0	assemble_hw_pps(ctx, &run);
> =C2=A0	assemble_sw_rps(ctx, &run);
> =C2=A0	config_registers(ctx, &run);
> @@ -795,14 +572,6 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -static int rkvdec_hevc_try_ctrl(struct rkvdec_ctx *ctx, struct v4l2_ctrl=
 *ctrl)
> -{
> -	if (ctrl->id =3D=3D V4L2_CID_STATELESS_HEVC_SPS)
> -		return rkvdec_hevc_validate_sps(ctx, ctrl->p_new.p_hevc_sps);
> -
> -	return 0;
> -}
> -
> =C2=A0const struct rkvdec_coded_fmt_ops rkvdec_hevc_fmt_ops =3D {
> =C2=A0	.adjust_fmt =3D rkvdec_hevc_adjust_fmt,
> =C2=A0	.start =3D rkvdec_hevc_start,

--=-XMb4S5S5gAM4ceeCNe2n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTnWbgAKCRDZQZRRKWBy
9AtWAQC/ABKelmYPx/YB9QaEURuVNrAIxVpEWT9/AK09CRNOiQEA2l8gAXPnMiwn
iA2qDx+bLSeMfkaVID+QRa5iveuVgQg=
=W0aT
-----END PGP SIGNATURE-----

--=-XMb4S5S5gAM4ceeCNe2n--

