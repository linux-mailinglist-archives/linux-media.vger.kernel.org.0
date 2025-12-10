Return-Path: <linux-media+bounces-48596-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8969ACB3FD4
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 21:46:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74C11301EFA8
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 20:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 938D93019B2;
	Wed, 10 Dec 2025 20:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UC1ZIyGy"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3306C15624B;
	Wed, 10 Dec 2025 20:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765399603; cv=none; b=F0o4rnt4UL29EhbTK52mbFV1H+B0XduIsm1T7qo5XguG74TQ1w1ps3FrjbYxp6pngT+Plyp+7pHv8Zmj84kQglJx2FM/srGPIfsNsSJ2O2OugCG85noV4tU1ARQTgS+dWgonovzvGZ8ONvldq0itJDwqBoxTQ2Shbw9HJCtf23c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765399603; c=relaxed/simple;
	bh=l6o6/rk2w8L5uGiDbCGaPqgo6qGUIWU+NUH5/q+mMB8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F6YnXvtpojB41cGjFB248cjUC21W4e9eBtzl4vkfyfkctAE1l4eY0B7ujik6/ZMIwxHBkugBSFhyPUorrhdC/qI3Xt+mc4RStivQBT2RXM3ZYXH7inMW9V/dvXemqfuDZa1P8W7509BAyQUbdV96LLALGSsCwuV9cl6oAkYjGmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UC1ZIyGy; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765399597;
	bh=l6o6/rk2w8L5uGiDbCGaPqgo6qGUIWU+NUH5/q+mMB8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=UC1ZIyGybbtAcQaET5h3+epuKyCYVwIT4GW3kt+SOxO7pC+vWlBAbKYBUFbw7UL34
	 uqtOfO4V6je707dyfprSC+oQUMv4foqY6qAlyP4S7gKtce7Y+VBQDGVP9W7huA/wo3
	 ToTncp1udjWwsjfV7QpgeqKYJdVVbPhyCAh3Y8QXIGBUJcZkq0sM1UP7mNSG/axMyc
	 vCmjSjCRhzBumiRWm+4YPOJrkaijeRn+mWB3uN34OeP421iV5TsJHLiM7jI81Mrq6K
	 H44HltE8knqTSSctHSDBbuwUlYgRzq+iPwvL8ie3F19tg3RqUiGEJccV/HJObW/9tU
	 eNy61lO+1Lu1Q==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7238417E04D6;
	Wed, 10 Dec 2025 21:46:35 +0100 (CET)
Message-ID: <46649ae5ec356e4e5198755fc28ef0d12cba606a.camel@collabora.com>
Subject: Re: [PATCH v4 14/15] media: rkvdec: Add HEVC support for the
 VDPU381 variant
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
Date: Wed, 10 Dec 2025 15:46:33 -0500
In-Reply-To: <20251022174508.284929-15-detlev.casanova@collabora.com>
References: <20251022174508.284929-1-detlev.casanova@collabora.com>
	 <20251022174508.284929-15-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-gpF3wnr519YG90KNf/xy"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-gpF3wnr519YG90KNf/xy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 22 octobre 2025 =C3=A0 13:45 -0400, Detlev Casanova a =C3=A9cri=
t=C2=A0:
> The VDPU381 supports HEVC decoding up to 7680x4320@30fps.
> It could double that when using both decoder cores.
>=20
> It support YUV420 (8 and 10 bits) as well as AFBC (not implemented
> here)
>=20
> The fluster score is 146/147 for JCT-VC-HEVC_V1, tested on ROCK 5B.
> None of the other test suites works.
>=20
> Tested-by: Diederik de Haas <didi.debian@cknow.org>=C2=A0 # Rock 5B
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>


> ---
> =C2=A0.../media/platform/rockchip/rkvdec/Kconfig=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 1 +
> =C2=A0.../media/platform/rockchip/rkvdec/Makefile=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
> =C2=A0.../rockchip/rkvdec/rkvdec-hevc-common.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 392 +++++++++++-
> =C2=A0.../rockchip/rkvdec/rkvdec-hevc-common.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 74 ++-
> =C2=A0.../rockchip/rkvdec/rkvdec-vdpu381-hevc.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
 596 ++++++++++++++++++
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.c=C2=A0=C2=A0 |=C2=A0 86 =
++-
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.h=C2=A0=C2=A0 |=C2=A0=C2=
=A0 3 +
> =C2=A07 files changed, 1114 insertions(+), 39 deletions(-)
> =C2=A0create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vd=
pu381-hevc.c
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/Kconfig b/drivers/med=
ia/platform/rockchip/rkvdec/Kconfig
> index 5f3bdd848a2c..3303b0ce3280 100644
> --- a/drivers/media/platform/rockchip/rkvdec/Kconfig
> +++ b/drivers/media/platform/rockchip/rkvdec/Kconfig
> @@ -8,6 +8,7 @@ config VIDEO_ROCKCHIP_VDEC
> =C2=A0	select VIDEOBUF2_VMALLOC
> =C2=A0	select V4L2_MEM2MEM_DEV
> =C2=A0	select V4L2_H264
> +	select V4L2_HEVC
> =C2=A0	select V4L2_VP9
> =C2=A0	help
> =C2=A0	=C2=A0 Support for the Rockchip Video Decoder IP present on Rockch=
ip SoCs,
> diff --git a/drivers/media/platform/rockchip/rkvdec/Makefile b/drivers/me=
dia/platform/rockchip/rkvdec/Makefile
> index a58d4aede2fe..e30fdd7d51c3 100644
> --- a/drivers/media/platform/rockchip/rkvdec/Makefile
> +++ b/drivers/media/platform/rockchip/rkvdec/Makefile
> @@ -9,5 +9,6 @@ rockchip-vdec-y +=3D \
> =C2=A0		=C2=A0=C2=A0 rkvdec-hevc-common.o \
> =C2=A0		=C2=A0=C2=A0 rkvdec-rcb.o \
> =C2=A0		=C2=A0=C2=A0 rkvdec-vdpu381-h264.o \
> +		=C2=A0=C2=A0 rkvdec-vdpu381-hevc.o \
> =C2=A0		=C2=A0=C2=A0 rkvdec-vdpu383-h264.o \
> =C2=A0		=C2=A0=C2=A0 rkvdec-vp9.o
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c =
b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> index d571107f2242..4b21b3ea67fd 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> @@ -21,6 +21,143 @@
> =C2=A0#include "rkvdec.h"
> =C2=A0#include "rkvdec-hevc-common.h"
> =C2=A0
> +#define RKVDEC_HEVC_MAX_DEPTH_IN_BYTES		2
> +
> +/* Store the Short term ref pic set calculated values */
> +struct calculated_rps_st_set {
> +	u8 num_delta_pocs;
> +	u8 num_negative_pics;
> +	u8 num_positive_pics;
> +	u8 used_by_curr_pic_s0[16];
> +	u8 used_by_curr_pic_s1[16];
> +	s32 delta_poc_s0[16];
> +	s32 delta_poc_s1[16];
> +};
> +
> +enum rkvdec_image_fmt rkvdec_hevc_get_image_fmt(struct rkvdec_ctx *ctx,
> +						struct v4l2_ctrl *ctrl)
> +{
> +	const struct v4l2_ctrl_hevc_sps *sps =3D ctrl->p_new.p_hevc_sps;
> +
> +	if (ctrl->id !=3D V4L2_CID_STATELESS_HEVC_SPS)
> +		return RKVDEC_IMG_FMT_ANY;
> +
> +	if (sps->bit_depth_luma_minus8 =3D=3D 0)
> +		return RKVDEC_IMG_FMT_420_8BIT;
> +	else if (sps->bit_depth_luma_minus8 =3D=3D 2)
> +		return RKVDEC_IMG_FMT_420_10BIT;
> +
> +	return RKVDEC_IMG_FMT_ANY;
> +}
> +
> +void compute_tiles_uniform(struct rkvdec_hevc_run *run, u16 log2_min_cb_=
size,
> +			=C2=A0=C2=A0 u16 width, u16 height, s32 pic_in_cts_width,
> +			=C2=A0=C2=A0 s32 pic_in_cts_height, u16 *column_width, u16 *row_heigh=
t)
> +{
> +	const struct v4l2_ctrl_hevc_pps *pps =3D run->pps;
> +	int i;
> +
> +	for (i =3D 0; i < pps->num_tile_columns_minus1 + 1; i++)
> +		column_width[i] =3D ((i + 1) * pic_in_cts_width) /
> +				=C2=A0 (pps->num_tile_columns_minus1 + 1) -
> +				=C2=A0 (i * pic_in_cts_width) /
> +				=C2=A0 (pps->num_tile_columns_minus1 + 1);
> +
> +	for (i =3D 0; i < pps->num_tile_rows_minus1 + 1; i++)
> +		row_height[i] =3D ((i + 1) * pic_in_cts_height) /
> +				(pps->num_tile_rows_minus1 + 1) -
> +				(i * pic_in_cts_height) /
> +				(pps->num_tile_rows_minus1 + 1);
> +}
> +
> +void compute_tiles_non_uniform(struct rkvdec_hevc_run *run, u16 log2_min=
_cb_size,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u16 width, u16 height, s32 pic_i=
n_cts_width,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s32 pic_in_cts_height, u16 *colu=
mn_width, u16 *row_height)
> +{
> +	const struct v4l2_ctrl_hevc_pps *pps =3D run->pps;
> +	s32 sum =3D 0;
> +	int i;
> +
> +	for (i =3D 0; i < pps->num_tile_columns_minus1; i++) {
> +		column_width[i] =3D pps->column_width_minus1[i] + 1;
> +		sum +=3D column_width[i];
> +	}
> +	column_width[i] =3D pic_in_cts_width - sum;
> +
> +	sum =3D 0;
> +	for (i =3D 0; i < pps->num_tile_rows_minus1; i++) {
> +		row_height[i] =3D pps->row_height_minus1[i] + 1;
> +		sum +=3D row_height[i];
> +	}
> +	row_height[i] =3D pic_in_cts_height - sum;
> +}
> +
> +static void set_ref_poc(struct rkvdec_rps_short_term_ref_set *set, int p=
oc, int value, int flag)
> +{
> +	switch (poc) {
> +	case 0:
> +		set->delta_poc0 =3D value;
> +		set->used_flag0 =3D flag;
> +		break;
> +	case 1:
> +		set->delta_poc1 =3D value;
> +		set->used_flag1 =3D flag;
> +		break;
> +	case 2:
> +		set->delta_poc2 =3D value;
> +		set->used_flag2 =3D flag;
> +		break;
> +	case 3:
> +		set->delta_poc3 =3D value;
> +		set->used_flag3 =3D flag;
> +		break;
> +	case 4:
> +		set->delta_poc4 =3D value;
> +		set->used_flag4 =3D flag;
> +		break;
> +	case 5:
> +		set->delta_poc5 =3D value;
> +		set->used_flag5 =3D flag;
> +		break;
> +	case 6:
> +		set->delta_poc6 =3D value;
> +		set->used_flag6 =3D flag;
> +		break;
> +	case 7:
> +		set->delta_poc7 =3D value;
> +		set->used_flag7 =3D flag;
> +		break;
> +	case 8:
> +		set->delta_poc8 =3D value;
> +		set->used_flag8 =3D flag;
> +		break;
> +	case 9:
> +		set->delta_poc9 =3D value;
> +		set->used_flag9 =3D flag;
> +		break;
> +	case 10:
> +		set->delta_poc10 =3D value;
> +		set->used_flag10 =3D flag;
> +		break;
> +	case 11:
> +		set->delta_poc11 =3D value;
> +		set->used_flag11 =3D flag;
> +		break;
> +	case 12:
> +		set->delta_poc12 =3D value;
> +		set->used_flag12 =3D flag;
> +		break;
> +	case 13:
> +		set->delta_poc13 =3D value;
> +		set->used_flag13 =3D flag;
> +		break;
> +	case 14:
> +		set->delta_poc14 =3D value;
> +		set->used_flag14 =3D flag;
> +		break;
> +	}
> +}
> +
> =C2=A0/*
> =C2=A0 * Flip one or more matrices along their main diagonal and flatten =
them
> =C2=A0 * before writing it to the memory.
> @@ -105,7 +242,7 @@ static void translate_scaling_list(struct scaling_fac=
tor *output,
> =C2=A0}
> =C2=A0
> =C2=A0void rkvdec_hevc_assemble_hw_scaling_list(struct rkvdec_hevc_run *r=
un,
> -					=C2=A0 struct scaling_factor *scaling_factor,
> +					=C2=A0 struct scaling_factor *scaling_list,
> =C2=A0					=C2=A0 struct v4l2_ctrl_hevc_scaling_matrix *cache)
> =C2=A0{
> =C2=A0	const struct v4l2_ctrl_hevc_scaling_matrix *scaling =3D run->scali=
ng_matrix;
> @@ -114,15 +251,220 @@ void rkvdec_hevc_assemble_hw_scaling_list(struct r=
kvdec_hevc_run *run,
> =C2=A0		=C2=A0=C2=A0=C2=A0 sizeof(struct v4l2_ctrl_hevc_scaling_matrix)))
> =C2=A0		return;
> =C2=A0
> -	translate_scaling_list(scaling_factor, scaling);
> +	translate_scaling_list(scaling_list, scaling);
> =C2=A0
> =C2=A0	memcpy(cache, scaling,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(struct v4l2_ctrl_hevc_=
scaling_matrix));
> =C2=A0}
> =C2=A0
> -struct vb2_buffer *
> -get_ref_buf(struct rkvdec_ctx *ctx, struct rkvdec_hevc_run *run,
> -	=C2=A0=C2=A0=C2=A0 unsigned int dpb_idx)
> +static void rkvdec_hevc_assemble_hw_lt_rps(struct rkvdec_hevc_run *run, =
struct rkvdec_rps *rps)
> +{
> +	const struct v4l2_ctrl_hevc_sps *sps =3D run->sps;
> +
> +	if (!run->ext_sps_lt_rps)
> +		return;
> +
> +	for (int i =3D 0; i < sps->num_long_term_ref_pics_sps; i++) {
> +		rps->refs[i].lt_ref_pic_poc_lsb =3D
> +			run->ext_sps_lt_rps[i].lt_ref_pic_poc_lsb_sps;
> +		rps->refs[i].used_by_curr_pic_lt_flag =3D
> +			!!(run->ext_sps_lt_rps[i].flags & V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_=
LT);
> +	}
> +}
> +
> +static void rkvdec_hevc_assemble_hw_st_rps(struct rkvdec_hevc_run *run, =
struct rkvdec_rps *rps,
> +					=C2=A0=C2=A0 struct calculated_rps_st_set *calculated_rps_st_sets)
> +{
> +	const struct v4l2_ctrl_hevc_sps *sps =3D run->sps;
> +
> +	for (int i =3D 0; i < sps->num_short_term_ref_pic_sets; i++) {
> +		int poc =3D 0;
> +		int j =3D 0;
> +		const struct calculated_rps_st_set *set =3D &calculated_rps_st_sets[i]=
;
> +
> +		rps->short_term_ref_sets[i].num_negative =3D set->num_negative_pics;
> +		rps->short_term_ref_sets[i].num_positive =3D set->num_positive_pics;
> +
> +		for (; j < set->num_negative_pics; j++) {
> +			set_ref_poc(&rps->short_term_ref_sets[i], j,
> +				=C2=A0=C2=A0=C2=A0 set->delta_poc_s0[j], set->used_by_curr_pic_s0[j]=
);
> +		}
> +		poc =3D j;
> +
> +		for (j =3D 0; j < set->num_positive_pics; j++) {
> +			set_ref_poc(&rps->short_term_ref_sets[i], poc + j,
> +				=C2=A0=C2=A0=C2=A0 set->delta_poc_s1[j], set->used_by_curr_pic_s1[j]=
);
> +		}
> +	}
> +}
> +
> +/*
> + * Compute the short term ref pic set parameters based on its reference =
short term ref pic
> + */
> +static void st_ref_pic_set_prediction(struct rkvdec_hevc_run *run, int i=
dx,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct calculated_rps_st_set *calcula=
ted_rps_st_sets)
> +{
> +	const struct v4l2_ctrl_hevc_ext_sps_st_rps *rps_data =3D &run->ext_sps_=
st_rps[idx];
> +	struct calculated_rps_st_set *st_rps =3D &calculated_rps_st_sets[idx];
> +	struct calculated_rps_st_set *ref_rps;
> +	u8 st_rps_idx =3D idx;
> +	u8 ref_rps_idx =3D 0;
> +	s16 delta_rps =3D 0;
> +	u8 use_delta_flag[16] =3D { 0 };
> +	u8 used_by_curr_pic_flag[16] =3D { 0 };
> +	int i, j;
> +	int dPoc;
> +
> +	ref_rps_idx =3D st_rps_idx - (rps_data->delta_idx_minus1 + 1); /* 7-59 =
*/
> +	delta_rps =3D (1 - 2 * rps_data->delta_rps_sign) *
> +		=C2=A0=C2=A0 (rps_data->abs_delta_rps_minus1 + 1); /* 7-60 */
> +
> +	ref_rps =3D &calculated_rps_st_sets[ref_rps_idx];
> +
> +	for (j =3D 0; j <=3D ref_rps->num_delta_pocs; j++) {
> +		used_by_curr_pic_flag[j] =3D !!(rps_data->used_by_curr_pic & (1 << j))=
;
> +		use_delta_flag[j] =3D !!(rps_data->use_delta_flag & (1 << j));
> +	}
> +
> +	/* 7-61: calculate num_negative_pics, delta_poc_s0 and used_by_curr_pic=
_s0 */
> +	i =3D 0;
> +	for (j =3D (ref_rps->num_positive_pics - 1); j >=3D 0; j--) {
> +		dPoc =3D ref_rps->delta_poc_s1[j] + delta_rps;
> +		if (dPoc < 0 && use_delta_flag[ref_rps->num_negative_pics + j]) {
> +			st_rps->delta_poc_s0[i] =3D dPoc;
> +			st_rps->used_by_curr_pic_s0[i++] =3D
> +				used_by_curr_pic_flag[ref_rps->num_negative_pics + j];
> +		}
> +	}
> +	if (delta_rps < 0 && use_delta_flag[ref_rps->num_delta_pocs]) {
> +		st_rps->delta_poc_s0[i] =3D delta_rps;
> +		st_rps->used_by_curr_pic_s0[i++] =3D used_by_curr_pic_flag[ref_rps->nu=
m_delta_pocs];
> +	}
> +	for (j =3D 0; j < ref_rps->num_negative_pics; j++) {
> +		dPoc =3D ref_rps->delta_poc_s0[j] + delta_rps;
> +		if (dPoc < 0 && use_delta_flag[j]) {
> +			st_rps->delta_poc_s0[i] =3D dPoc;
> +			st_rps->used_by_curr_pic_s0[i++] =3D used_by_curr_pic_flag[j];
> +		}
> +	}
> +	st_rps->num_negative_pics =3D i;
> +
> +	/* 7-62: calculate num_positive_pics, delta_poc_s1 and used_by_curr_pic=
_s1 */
> +	i =3D 0;
> +	for (j =3D (ref_rps->num_negative_pics - 1); j >=3D 0; j--) {
> +		dPoc =3D ref_rps->delta_poc_s0[j] + delta_rps;
> +		if (dPoc > 0 && use_delta_flag[j]) {
> +			st_rps->delta_poc_s1[i] =3D dPoc;
> +			st_rps->used_by_curr_pic_s1[i++] =3D used_by_curr_pic_flag[j];
> +		}
> +	}
> +	if (delta_rps > 0 && use_delta_flag[ref_rps->num_delta_pocs]) {
> +		st_rps->delta_poc_s1[i] =3D delta_rps;
> +		st_rps->used_by_curr_pic_s1[i++] =3D used_by_curr_pic_flag[ref_rps->nu=
m_delta_pocs];
> +	}
> +	for (j =3D 0; j < ref_rps->num_positive_pics; j++) {
> +		dPoc =3D ref_rps->delta_poc_s1[j] + delta_rps;
> +		if (dPoc > 0 && use_delta_flag[ref_rps->num_negative_pics + j]) {
> +			st_rps->delta_poc_s1[i] =3D dPoc;
> +			st_rps->used_by_curr_pic_s1[i++] =3D
> +				used_by_curr_pic_flag[ref_rps->num_negative_pics + j];
> +		}
> +	}
> +	st_rps->num_positive_pics =3D i;
> +
> +	st_rps->num_delta_pocs =3D st_rps->num_positive_pics + st_rps->num_nega=
tive_pics;
> +}
> +
> +/*
> + * Compute the short term ref pic set parameters based on the control's =
data.
> + */
> +static void st_ref_pic_set_calculate(struct rkvdec_hevc_run *run, int id=
x,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 struct calculated_rps_st_set *calculated_rp=
s_st_sets)
> +{
> +	const struct v4l2_ctrl_hevc_ext_sps_st_rps *rps_data =3D &run->ext_sps_=
st_rps[idx];
> +	struct calculated_rps_st_set *st_rps =3D &calculated_rps_st_sets[idx];
> +	int j, i =3D 0;
> +
> +	/* 7-63 */
> +	st_rps->num_negative_pics =3D rps_data->num_negative_pics;
> +	/* 7-64 */
> +	st_rps->num_positive_pics =3D rps_data->num_positive_pics;
> +
> +	for (i =3D 0; i < st_rps->num_negative_pics; i++) {
> +		/* 7-65 */
> +		st_rps->used_by_curr_pic_s0[i] =3D !!(rps_data->used_by_curr_pic & (1 =
<< i));
> +
> +		if (i =3D=3D 0) {
> +			/* 7-67 */
> +			st_rps->delta_poc_s0[i] =3D -(rps_data->delta_poc_s0_minus1[i] + 1);
> +		} else {
> +			/* 7-69 */
> +			st_rps->delta_poc_s0[i] =3D
> +				st_rps->delta_poc_s0[i - 1] -
> +				(rps_data->delta_poc_s0_minus1[i] + 1);
> +		}
> +	}
> +
> +	for (j =3D 0; j < st_rps->num_positive_pics; j++) {
> +		/* 7-66 */
> +		st_rps->used_by_curr_pic_s1[j] =3D !!(rps_data->used_by_curr_pic & (1 =
<< (i + j)));
> +
> +		if (j =3D=3D 0) {
> +			/* 7-68 */
> +			st_rps->delta_poc_s1[j] =3D rps_data->delta_poc_s1_minus1[j] + 1;
> +		} else {
> +			/* 7-70 */
> +			st_rps->delta_poc_s1[j] =3D
> +				st_rps->delta_poc_s1[j - 1] +
> +				(rps_data->delta_poc_s1_minus1[j] + 1);
> +		}
> +	}
> +
> +	/* 7-71 */
> +	st_rps->num_delta_pocs =3D st_rps->num_positive_pics + st_rps->num_nega=
tive_pics;
> +}
> +
> +static void rkvdec_hevc_prepare_hw_st_rps(struct rkvdec_hevc_run *run, s=
truct rkvdec_rps *rps,
> +					=C2=A0 struct v4l2_ctrl_hevc_ext_sps_st_rps *cache)
> +{
> +	int idx;
> +
> +	if (!run->ext_sps_st_rps)
> +		return;
> +
> +	if (!memcmp(cache, run->ext_sps_st_rps, sizeof(struct v4l2_ctrl_hevc_ex=
t_sps_st_rps)))
> +		return;
> +
> +	struct calculated_rps_st_set *calculated_rps_st_sets =3D
> +		kzalloc(sizeof(struct calculated_rps_st_set) *
> +			run->sps->num_short_term_ref_pic_sets, GFP_KERNEL);
> +
> +	for (idx =3D 0; idx < run->sps->num_short_term_ref_pic_sets; idx++) {
> +		const struct v4l2_ctrl_hevc_ext_sps_st_rps *rps_data =3D &run->ext_sps=
_st_rps[idx];
> +
> +		if (rps_data->flags & V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC_SET_=
PRED)
> +			st_ref_pic_set_prediction(run, idx, calculated_rps_st_sets);
> +		else
> +			st_ref_pic_set_calculate(run, idx, calculated_rps_st_sets);
> +	}
> +
> +	rkvdec_hevc_assemble_hw_st_rps(run, rps, calculated_rps_st_sets);
> +
> +	kfree(calculated_rps_st_sets);
> +
> +	memcpy(cache, run->ext_sps_st_rps, sizeof(struct v4l2_ctrl_hevc_ext_sps=
_st_rps));
> +}
> +
> +void rkvdec_hevc_assemble_hw_rps(struct rkvdec_hevc_run *run, struct rkv=
dec_rps *rps,
> +				 struct v4l2_ctrl_hevc_ext_sps_st_rps *st_cache)
> +{
> +	rkvdec_hevc_prepare_hw_st_rps(run, rps, st_cache);
> +	rkvdec_hevc_assemble_hw_lt_rps(run, rps);
> +}
> +
> +struct vb2_buffer *get_ref_buf(struct rkvdec_ctx *ctx,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct rkvdec_hevc_run *run,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int dpb_idx)
> =C2=A0{
> =C2=A0	struct v4l2_m2m_ctx *m2m_ctx =3D ctx->fh.m2m_ctx;
> =C2=A0	const struct v4l2_ctrl_hevc_decode_params *decode_params =3D run->=
decode_params;
> @@ -143,8 +485,6 @@ get_ref_buf(struct rkvdec_ctx *ctx, struct rkvdec_hev=
c_run *run,
> =C2=A0	return buf;
> =C2=A0}
> =C2=A0
> -#define RKVDEC_HEVC_MAX_DEPTH_IN_BYTES		2
> -
> =C2=A0int rkvdec_hevc_adjust_fmt(struct rkvdec_ctx *ctx, struct v4l2_form=
at *f)
> =C2=A0{
> =C2=A0	struct v4l2_pix_format_mplane *fmt =3D &f->fmt.pix_mp;
> @@ -156,38 +496,17 @@ int rkvdec_hevc_adjust_fmt(struct rkvdec_ctx *ctx, =
struct v4l2_format *f)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -enum rkvdec_image_fmt rkvdec_hevc_get_image_fmt(struct rkvdec_ctx *ctx,
> -						struct v4l2_ctrl *ctrl)
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
> +int rkvdec_hevc_validate_sps(struct rkvdec_ctx *ctx,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 const struct v4l2_ctrl_hevc_sps *sps)
> =C2=A0{
> =C2=A0	if (sps->chroma_format_idc > 1)
> =C2=A0		/* Only 4:0:0 and 4:2:0 are supported */
> =C2=A0		return -EINVAL;
> +
> =C2=A0	if (sps->bit_depth_luma_minus8 !=3D sps->bit_depth_chroma_minus8)
> =C2=A0		/* Luma and chroma bit depth mismatch */
> =C2=A0		return -EINVAL;
> +
> =C2=A0	if (sps->bit_depth_luma_minus8 !=3D 0 && sps->bit_depth_luma_minus=
8 !=3D 2)
> =C2=A0		/* Only 8-bit and 10-bit are supported */
> =C2=A0		return -EINVAL;
> @@ -221,6 +540,17 @@ void rkvdec_hevc_run_preamble(struct rkvdec_ctx *ctx=
,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_HEVC_SCALING_M=
ATRIX);
> =C2=A0	run->scaling_matrix =3D ctrl ? ctrl->p_cur.p : NULL;
> =C2=A0
> +	if (ctx->has_sps_st_rps) {
> +		ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RP=
S);
> +		run->ext_sps_st_rps =3D ctrl ? ctrl->p_cur.p : NULL;
> +	}
> +	if (ctx->has_sps_lt_rps) {
> +		ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RP=
S);
> +		run->ext_sps_lt_rps =3D ctrl ? ctrl->p_cur.p : NULL;
> +	}
> +
> =C2=A0	rkvdec_run_preamble(ctx, &run->base);
> =C2=A0}
> =C2=A0
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h =
b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
> index 746b1bd73c08..0005b80bad79 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
> @@ -16,19 +16,70 @@
> =C2=A0 */
> =C2=A0
> =C2=A0#include <media/v4l2-mem2mem.h>
> +#include <linux/types.h>
> =C2=A0#include "rkvdec.h"
> =C2=A0
> =C2=A0#define RKV_HEVC_CABAC_TABLE_SIZE		27456
> =C2=A0extern const u8 rkvdec_hevc_cabac_table[RKV_HEVC_CABAC_TABLE_SIZE];
> =C2=A0
> +struct rkvdec_rps_refs {
> +	u16 lt_ref_pic_poc_lsb;
> +	u16 used_by_curr_pic_lt_flag	: 1;
> +	u16 reserved			: 15;
> +} __packed;
> +
> +struct rkvdec_rps_short_term_ref_set {
> +	u32 num_negative	: 4;
> +	u32 num_positive	: 4;
> +	u32 delta_poc0		: 16;
> +	u32 used_flag0		: 1;
> +	u32 delta_poc1		: 16;
> +	u32 used_flag1		: 1;
> +	u32 delta_poc2		: 16;
> +	u32 used_flag2		: 1;
> +	u32 delta_poc3		: 16;
> +	u32 used_flag3		: 1;
> +	u32 delta_poc4		: 16;
> +	u32 used_flag4		: 1;
> +	u32 delta_poc5		: 16;
> +	u32 used_flag5		: 1;
> +	u32 delta_poc6		: 16;
> +	u32 used_flag6		: 1;
> +	u32 delta_poc7		: 16;
> +	u32 used_flag7		: 1;
> +	u32 delta_poc8		: 16;
> +	u32 used_flag8		: 1;
> +	u32 delta_poc9		: 16;
> +	u32 used_flag9		: 1;
> +	u32 delta_poc10		: 16;
> +	u32 used_flag10		: 1;
> +	u32 delta_poc11		: 16;
> +	u32 used_flag11		: 1;
> +	u32 delta_poc12		: 16;
> +	u32 used_flag12		: 1;
> +	u32 delta_poc13		: 16;
> +	u32 used_flag13		: 1;
> +	u32 delta_poc14		: 16;
> +	u32 used_flag14		: 1;
> +	u32 reserved_bits	: 25;
> +	u32 reserved[3];
> +} __packed;
> +
> +struct rkvdec_rps {
> +	struct rkvdec_rps_refs refs[32];
> +	struct rkvdec_rps_short_term_ref_set short_term_ref_sets[64];
> +} __packed;
> +
> =C2=A0struct rkvdec_hevc_run {
> -	struct rkvdec_run base;
> -	const struct v4l2_ctrl_hevc_slice_params *slices_params;
> -	const struct v4l2_ctrl_hevc_decode_params *decode_params;
> -	const struct v4l2_ctrl_hevc_sps *sps;
> -	const struct v4l2_ctrl_hevc_pps *pps;
> -	const struct v4l2_ctrl_hevc_scaling_matrix *scaling_matrix;
> -	int num_slices;
> +	struct rkvdec_run				base;
> +	const struct v4l2_ctrl_hevc_decode_params	*decode_params;
> +	const struct v4l2_ctrl_hevc_slice_params	*slices_params;
> +	const struct v4l2_ctrl_hevc_sps			*sps;
> +	const struct v4l2_ctrl_hevc_pps			*pps;
> +	const struct v4l2_ctrl_hevc_scaling_matrix	*scaling_matrix;
> +	const struct v4l2_ctrl_hevc_ext_sps_st_rps	*ext_sps_st_rps;
> +	const struct v4l2_ctrl_hevc_ext_sps_lt_rps	*ext_sps_lt_rps;
> +	int						num_slices;
> =C2=A0};
> =C2=A0
> =C2=A0struct scaling_factor {
> @@ -40,6 +91,14 @@ struct scaling_factor {
> =C2=A0
> =C2=A0enum rkvdec_image_fmt rkvdec_hevc_get_image_fmt(struct rkvdec_ctx *=
ctx,
> =C2=A0						struct v4l2_ctrl *ctrl);
> +void compute_tiles_uniform(struct rkvdec_hevc_run *run, u16 log2_min_cb_=
size,
> +			=C2=A0=C2=A0 u16 width, u16 height, s32 pic_in_cts_width,
> +			=C2=A0=C2=A0 s32 pic_in_cts_height, u16 *column_width, u16 *row_heigh=
t);
> +void compute_tiles_non_uniform(struct rkvdec_hevc_run *run, u16 log2_min=
_cb_size,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u16 width, u16 height, s32 pic_i=
n_cts_width,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s32 pic_in_cts_height, u16 *colu=
mn_width, u16 *row_height);
> +void rkvdec_hevc_assemble_hw_rps(struct rkvdec_hevc_run *run, struct rkv=
dec_rps *rps,
> +				 struct v4l2_ctrl_hevc_ext_sps_st_rps *st_cache);
> =C2=A0void rkvdec_hevc_assemble_hw_scaling_list(struct rkvdec_hevc_run *r=
un,
> =C2=A0					=C2=A0 struct scaling_factor *scaling_factor,
> =C2=A0					=C2=A0 struct v4l2_ctrl_hevc_scaling_matrix *cache);
> @@ -47,5 +106,6 @@ struct vb2_buffer *get_ref_buf(struct rkvdec_ctx *ctx,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct rkvdec_hevc_run *run=
,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int dpb_idx);
> =C2=A0int rkvdec_hevc_adjust_fmt(struct rkvdec_ctx *ctx, struct v4l2_form=
at *f);
> +int rkvdec_hevc_validate_sps(struct rkvdec_ctx *ctx, const struct v4l2_c=
trl_hevc_sps *sps);
> =C2=A0int rkvdec_hevc_try_ctrl(struct rkvdec_ctx *ctx, struct v4l2_ctrl *=
ctrl);
> =C2=A0void rkvdec_hevc_run_preamble(struct rkvdec_ctx *ctx, struct rkvdec=
_hevc_run *run);
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c=
 b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
> new file mode 100644
> index 000000000000..278f1dbf0910
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
> @@ -0,0 +1,596 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip VDPU381 HEVC backend
> + *
> + * Copyright (C) 2025 Collabora, Ltd.
> + *=C2=A0 Detlev Casanova <detlev.casanova@collabora.com>
> + */
> +
> +#include <media/v4l2-mem2mem.h>
> +
> +#include "rkvdec.h"
> +#include "rkvdec-rcb.h"
> +#include "rkvdec-hevc-common.h"
> +#include "rkvdec-vdpu381-regs.h"
> +
> +// SPS
> +struct rkvdec_hevc_sps {
> +	u16 video_parameters_set_id			: 4;
> +	u16 seq_parameters_set_id_sps			: 4;
> +	u16 chroma_format_idc				: 2;
> +	u16 width					: 16;
> +	u16 height					: 16;
> +	u16 bit_depth_luma				: 4;
> +	u16 bit_depth_chroma				: 4;
> +	u16 max_pic_order_count_lsb			: 5;
> +	u16 diff_max_min_luma_coding_block_size		: 2;
> +	u16 min_luma_coding_block_size			: 3;
> +	u16 min_transform_block_size			: 3;
> +	u16 diff_max_min_transform_block_size		: 2;
> +	u16 max_transform_hierarchy_depth_inter		: 3;
> +	u16 max_transform_hierarchy_depth_intra		: 3;
> +	u16 scaling_list_enabled_flag			: 1;
> +	u16 amp_enabled_flag				: 1;
> +	u16 sample_adaptive_offset_enabled_flag		: 1;
> +	u16 pcm_enabled_flag				: 1;
> +	u16 pcm_sample_bit_depth_luma			: 4;
> +	u16 pcm_sample_bit_depth_chroma			: 4;
> +	u16 pcm_loop_filter_disabled_flag		: 1;
> +	u16 diff_max_min_pcm_luma_coding_block_size	: 3;
> +	u16 min_pcm_luma_coding_block_size		: 3;
> +	u16 num_short_term_ref_pic_sets			: 7;
> +	u16 long_term_ref_pics_present_flag		: 1;
> +	u16 num_long_term_ref_pics_sps			: 6;
> +	u16 sps_temporal_mvp_enabled_flag		: 1;
> +	u16 strong_intra_smoothing_enabled_flag		: 1;
> +	u16 reserved_0					: 7;
> +	u16 sps_max_dec_pic_buffering_minus1		: 4;
> +	u16 reserved_0_2				: 3;
> +	u16 reserved_f					: 8;
> +} __packed;
> +
> +//PPS
> +struct rkvdec_hevc_pps {
> +	u16 picture_parameters_set_id			: 6;
> +	u16 seq_parameters_set_id_pps			: 4;
> +	u16 dependent_slice_segments_enabled_flag	: 1;
> +	u16 output_flag_present_flag			: 1;
> +	u16 num_extra_slice_header_bits			: 13;
> +	u16 sign_data_hiding_enabled_flag		: 1;
> +	u16 cabac_init_present_flag			: 1;
> +	u16 num_ref_idx_l0_default_active		: 4;
> +	u16 num_ref_idx_l1_default_active		: 4;
> +	u16 init_qp_minus26				: 7;
> +	u16 constrained_intra_pred_flag			: 1;
> +	u16 transform_skip_enabled_flag			: 1;
> +	u16 cu_qp_delta_enabled_flag			: 1;
> +	u16 log2_min_cb_size				: 3;
> +	u16 pps_cb_qp_offset				: 5;
> +	u16 pps_cr_qp_offset				: 5;
> +	u16 pps_slice_chroma_qp_offsets_present_flag	: 1;
> +	u16 weighted_pred_flag				: 1;
> +	u16 weighted_bipred_flag			: 1;
> +	u16 transquant_bypass_enabled_flag		: 1;
> +	u16 tiles_enabled_flag				: 1;
> +	u16 entropy_coding_sync_enabled_flag		: 1;
> +	u16 pps_loop_filter_across_slices_enabled_flag	: 1;
> +	u16 loop_filter_across_tiles_enabled_flag	: 1;
> +	u16 deblocking_filter_override_enabled_flag	: 1;
> +	u16 pps_deblocking_filter_disabled_flag		: 1;
> +	u16 pps_beta_offset_div2			: 4;
> +	u16 pps_tc_offset_div2				: 4;
> +	u16 lists_modification_present_flag		: 1;
> +	u16 log2_parallel_merge_level			: 3;
> +	u16 slice_segment_header_extension_present_flag	: 1;
> +	u16 zeroes					: 3;
> +	u16 num_tile_columns				: 5;
> +	u16 num_tile_rows				: 5;
> +	u16 sps_pps_mode				: 4;
> +	u16 reserved_bits				: 14;
> +	u16 reserved;
> +} __packed;
> +
> +struct rkvdec_hevc_tile {
> +	u16 value0	: 12;
> +	u16 value1	: 12;
> +} __packed;
> +
> +struct rkvdec_sps_pps_packet {
> +	struct rkvdec_hevc_sps sps;
> +	struct rkvdec_hevc_pps pps;
> +	struct rkvdec_hevc_tile column_width[10];
> +	struct rkvdec_hevc_tile row_height[11];
> +	u32 zeroes[3];
> +	u32 zeroes_bits		: 6;
> +	u32 padding_bits	: 2;
> +	u32 padding;
> +} __packed;
> +
> +struct rkvdec_hevc_priv_tbl {
> +	struct rkvdec_sps_pps_packet param_set[64];
> +	struct rkvdec_rps rps;
> +	struct scaling_factor scaling_list;
> +	u8 cabac_table[27456];
> +};
> +
> +struct rkvdec_hevc_ctx {
> +	struct rkvdec_aux_buf			priv_tbl;
> +	struct v4l2_ctrl_hevc_scaling_matrix	scaling_matrix_cache;
> +	struct v4l2_ctrl_hevc_ext_sps_st_rps	st_cache;
> +	struct rkvdec_vdpu381_regs_hevc		regs;
> +};
> +
> +static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> +			=C2=A0=C2=A0=C2=A0 struct rkvdec_hevc_run *run)
> +{
> +	struct rkvdec_hevc_ctx *h264_ctx =3D ctx->priv;
> +	const struct v4l2_ctrl_hevc_sps *sps =3D run->sps;
> +	const struct v4l2_ctrl_hevc_pps *pps =3D run->pps;
> +	struct rkvdec_hevc_priv_tbl *priv_tbl =3D h264_ctx->priv_tbl.cpu;
> +	struct rkvdec_sps_pps_packet *hw_ps;
> +	bool tiles_enabled;
> +	s32 max_cu_width;
> +	s32 pic_in_cts_width;
> +	s32 pic_in_cts_height;
> +	u16 log2_min_cb_size, width, height;
> +	u16 column_width[20];
> +	u16 row_height[22];
> +	u8 pcm_enabled;
> +	u32 i;
> +
> +	/*
> +	 * HW read the SPS/PPS information from PPS packet index by PPS id.
> +	 * offset from the base can be calculated by PPS_id * 32 (size per PPS
> +	 * packet unit). so the driver copy SPS/PPS information to the exact PP=
S
> +	 * packet unit for HW accessing.
> +	 */
> +	hw_ps =3D &priv_tbl->param_set[pps->pic_parameter_set_id];
> +	memset(hw_ps, 0, sizeof(*hw_ps));
> +
> +	/* write sps */
> +	hw_ps->sps.video_parameters_set_id =3D sps->video_parameter_set_id;
> +	hw_ps->sps.seq_parameters_set_id_sps =3D sps->seq_parameter_set_id;
> +	hw_ps->sps.chroma_format_idc =3D sps->chroma_format_idc;
> +
> +	log2_min_cb_size =3D sps->log2_min_luma_coding_block_size_minus3 + 3;
> +	width =3D sps->pic_width_in_luma_samples;
> +	height =3D sps->pic_height_in_luma_samples;
> +	hw_ps->sps.width =3D width;
> +	hw_ps->sps.height =3D height;
> +	hw_ps->sps.bit_depth_luma =3D sps->bit_depth_luma_minus8 + 8;
> +	hw_ps->sps.bit_depth_chroma =3D sps->bit_depth_chroma_minus8 + 8;
> +	hw_ps->sps.max_pic_order_count_lsb =3D sps->log2_max_pic_order_cnt_lsb_=
minus4 + 4;
> +	hw_ps->sps.diff_max_min_luma_coding_block_size =3D
> +		sps->log2_diff_max_min_luma_coding_block_size;
> +	hw_ps->sps.min_luma_coding_block_size =3D sps->log2_min_luma_coding_blo=
ck_size_minus3 + 3;
> +	hw_ps->sps.min_transform_block_size =3D sps->log2_min_luma_transform_bl=
ock_size_minus2 + 2;
> +	hw_ps->sps.diff_max_min_transform_block_size =3D
> +		sps->log2_diff_max_min_luma_transform_block_size;
> +	hw_ps->sps.max_transform_hierarchy_depth_inter =3D sps->max_transform_h=
ierarchy_depth_inter;
> +	hw_ps->sps.max_transform_hierarchy_depth_intra =3D sps->max_transform_h=
ierarchy_depth_intra;
> +	hw_ps->sps.scaling_list_enabled_flag =3D
> +		!!(sps->flags & V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED);
> +	hw_ps->sps.amp_enabled_flag =3D !!(sps->flags & V4L2_HEVC_SPS_FLAG_AMP_=
ENABLED);
> +	hw_ps->sps.sample_adaptive_offset_enabled_flag =3D
> +		!!(sps->flags & V4L2_HEVC_SPS_FLAG_SAMPLE_ADAPTIVE_OFFSET);
> +
> +	pcm_enabled =3D !!(sps->flags & V4L2_HEVC_SPS_FLAG_PCM_ENABLED);
> +	hw_ps->sps.pcm_enabled_flag =3D pcm_enabled;
> +	hw_ps->sps.pcm_sample_bit_depth_luma =3D
> +		pcm_enabled ? sps->pcm_sample_bit_depth_luma_minus1 + 1 : 0;
> +	hw_ps->sps.pcm_sample_bit_depth_chroma =3D
> +		pcm_enabled ? sps->pcm_sample_bit_depth_chroma_minus1 + 1 : 0;
> +	hw_ps->sps.pcm_loop_filter_disabled_flag =3D
> +		!!(sps->flags & V4L2_HEVC_SPS_FLAG_PCM_LOOP_FILTER_DISABLED);
> +	hw_ps->sps.diff_max_min_pcm_luma_coding_block_size =3D
> +		sps->log2_diff_max_min_pcm_luma_coding_block_size;
> +	hw_ps->sps.min_pcm_luma_coding_block_size =3D
> +		pcm_enabled ? sps->log2_min_pcm_luma_coding_block_size_minus3 + 3 : 0;
> +	hw_ps->sps.num_short_term_ref_pic_sets =3D sps->num_short_term_ref_pic_=
sets;
> +	hw_ps->sps.long_term_ref_pics_present_flag =3D
> +		!!(sps->flags & V4L2_HEVC_SPS_FLAG_LONG_TERM_REF_PICS_PRESENT);
> +	hw_ps->sps.num_long_term_ref_pics_sps =3D sps->num_long_term_ref_pics_s=
ps;
> +	hw_ps->sps.sps_temporal_mvp_enabled_flag =3D
> +		!!(sps->flags & V4L2_HEVC_SPS_FLAG_SPS_TEMPORAL_MVP_ENABLED);
> +	hw_ps->sps.strong_intra_smoothing_enabled_flag =3D
> +		!!(sps->flags & V4L2_HEVC_SPS_FLAG_STRONG_INTRA_SMOOTHING_ENABLED);
> +	hw_ps->sps.sps_max_dec_pic_buffering_minus1 =3D sps->sps_max_dec_pic_bu=
ffering_minus1;
> +	hw_ps->sps.reserved_f =3D 0xff;
> +
> +	/* write pps */
> +	hw_ps->pps.picture_parameters_set_id =3D pps->pic_parameter_set_id;
> +	hw_ps->pps.seq_parameters_set_id_pps =3D sps->seq_parameter_set_id;
> +	hw_ps->pps.dependent_slice_segments_enabled_flag =3D
> +		!!(pps->flags & V4L2_HEVC_PPS_FLAG_DEPENDENT_SLICE_SEGMENT_ENABLED);
> +	hw_ps->pps.output_flag_present_flag =3D
> +		!!(pps->flags & V4L2_HEVC_PPS_FLAG_OUTPUT_FLAG_PRESENT);
> +	hw_ps->pps.num_extra_slice_header_bits =3D pps->num_extra_slice_header_=
bits;
> +	hw_ps->pps.sign_data_hiding_enabled_flag =3D
> +		!!(pps->flags & V4L2_HEVC_PPS_FLAG_SIGN_DATA_HIDING_ENABLED);
> +	hw_ps->pps.cabac_init_present_flag =3D
> +		!!(pps->flags & V4L2_HEVC_PPS_FLAG_CABAC_INIT_PRESENT);
> +	hw_ps->pps.num_ref_idx_l0_default_active =3D pps->num_ref_idx_l0_defaul=
t_active_minus1 + 1;
> +	hw_ps->pps.num_ref_idx_l1_default_active =3D pps->num_ref_idx_l1_defaul=
t_active_minus1 + 1;
> +	hw_ps->pps.init_qp_minus26 =3D pps->init_qp_minus26;
> +	hw_ps->pps.constrained_intra_pred_flag =3D
> +		!!(pps->flags & V4L2_HEVC_PPS_FLAG_CONSTRAINED_INTRA_PRED);
> +	hw_ps->pps.transform_skip_enabled_flag =3D
> +		!!(pps->flags & V4L2_HEVC_PPS_FLAG_TRANSFORM_SKIP_ENABLED);
> +	hw_ps->pps.cu_qp_delta_enabled_flag =3D
> +		!!(pps->flags & V4L2_HEVC_PPS_FLAG_CU_QP_DELTA_ENABLED);
> +	hw_ps->pps.log2_min_cb_size =3D log2_min_cb_size +
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sps->log2_diff_max_min_luma_coding_bl=
ock_size -
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pps->diff_cu_qp_delta_depth;
> +	hw_ps->pps.pps_cb_qp_offset =3D pps->pps_cb_qp_offset;
> +	hw_ps->pps.pps_cr_qp_offset =3D pps->pps_cr_qp_offset;
> +	hw_ps->pps.pps_slice_chroma_qp_offsets_present_flag =3D
> +		!!(pps->flags & V4L2_HEVC_PPS_FLAG_PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT=
);
> +	hw_ps->pps.weighted_pred_flag =3D !!(pps->flags & V4L2_HEVC_PPS_FLAG_WE=
IGHTED_PRED);
> +	hw_ps->pps.weighted_bipred_flag =3D !!(pps->flags & V4L2_HEVC_PPS_FLAG_=
WEIGHTED_BIPRED);
> +	hw_ps->pps.transquant_bypass_enabled_flag =3D
> +		!!(pps->flags & V4L2_HEVC_PPS_FLAG_TRANSQUANT_BYPASS_ENABLED);
> +
> +	tiles_enabled =3D !!(pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED);
> +	hw_ps->pps.tiles_enabled_flag =3D tiles_enabled;
> +	hw_ps->pps.entropy_coding_sync_enabled_flag =3D
> +		!!(pps->flags & V4L2_HEVC_PPS_FLAG_ENTROPY_CODING_SYNC_ENABLED);
> +	hw_ps->pps.pps_loop_filter_across_slices_enabled_flag =3D
> +		!!(pps->flags & V4L2_HEVC_PPS_FLAG_PPS_LOOP_FILTER_ACROSS_SLICES_ENABL=
ED);
> +	hw_ps->pps.loop_filter_across_tiles_enabled_flag =3D
> +		!!(pps->flags & V4L2_HEVC_PPS_FLAG_LOOP_FILTER_ACROSS_TILES_ENABLED);
> +	hw_ps->pps.deblocking_filter_override_enabled_flag =3D
> +		!!(pps->flags & V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_OVERRIDE_ENABLED)=
;
> +	hw_ps->pps.pps_deblocking_filter_disabled_flag =3D
> +		!!(pps->flags & V4L2_HEVC_PPS_FLAG_PPS_DISABLE_DEBLOCKING_FILTER);
> +	hw_ps->pps.pps_beta_offset_div2 =3D pps->pps_beta_offset_div2;
> +	hw_ps->pps.pps_tc_offset_div2 =3D pps->pps_tc_offset_div2;
> +	hw_ps->pps.lists_modification_present_flag =3D
> +		!!(pps->flags & V4L2_HEVC_PPS_FLAG_LISTS_MODIFICATION_PRESENT);
> +	hw_ps->pps.log2_parallel_merge_level =3D pps->log2_parallel_merge_level=
_minus2 + 2;
> +	hw_ps->pps.slice_segment_header_extension_present_flag =3D
> +		!!(pps->flags & V4L2_HEVC_PPS_FLAG_SLICE_SEGMENT_HEADER_EXTENSION_PRES=
ENT);
> +	hw_ps->pps.num_tile_columns =3D tiles_enabled ? pps->num_tile_columns_m=
inus1 + 1 : 0;
> +	hw_ps->pps.num_tile_rows =3D tiles_enabled ? pps->num_tile_rows_minus1 =
+ 1 : 0;
> +	hw_ps->pps.sps_pps_mode =3D 0;
> +	hw_ps->pps.reserved_bits =3D 0x3fff;
> +	hw_ps->pps.reserved =3D 0xffff;
> +
> +	// Setup tiles information
> +	memset(column_width, 0, sizeof(column_width));
> +	memset(row_height, 0, sizeof(row_height));
> +
> +	max_cu_width =3D 1 << (sps->log2_diff_max_min_luma_coding_block_size + =
log2_min_cb_size);
> +	pic_in_cts_width =3D (width + max_cu_width - 1) / max_cu_width;
> +	pic_in_cts_height =3D (height + max_cu_width - 1) / max_cu_width;
> +
> +	if (pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED) {
> +		if (pps->flags & V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING) {
> +			compute_tiles_uniform(run, log2_min_cb_size, width, height,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pic_in_cts_width, pic_in_cts_height,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 column_width, row_height);
> +		} else {
> +			compute_tiles_non_uniform(run, log2_min_cb_size, width, height,
> +						=C2=A0 pic_in_cts_width, pic_in_cts_height,
> +						=C2=A0 column_width, row_height);
> +		}
> +	} else {
> +		column_width[0] =3D (width + max_cu_width - 1) / max_cu_width;
> +		row_height[0] =3D (height + max_cu_width - 1) / max_cu_width;
> +	}
> +
> +	for (i =3D 0; i < 20; i++) {
> +		if (column_width[i] > 0)
> +			column_width[i]--;
> +
> +		if (i & 1)
> +			hw_ps->column_width[i / 2].value1 =3D column_width[i];
> +		else
> +			hw_ps->column_width[i / 2].value0 =3D column_width[i];
> +	}
> +
> +	for (i =3D 0; i < 22; i++) {
> +		if (row_height[i] > 0)
> +			row_height[i]--;
> +
> +		if (i & 1)
> +			hw_ps->row_height[i / 2].value1 =3D row_height[i];
> +		else
> +			hw_ps->row_height[i / 2].value0 =3D row_height[i];
> +	}
> +
> +	hw_ps->padding =3D 0xffffffff;
> +	hw_ps->padding_bits =3D 0x3;
> +}
> +
> +static void set_ref_valid(struct rkvdec_vdpu381_regs_hevc *regs, int id,=
 u32 valid)
> +{
> +	switch (id) {
> +	case 0:
> +		regs->hevc_param.reg099.hevc_ref_valid_0 =3D valid;
> +		break;
> +	case 1:
> +		regs->hevc_param.reg099.hevc_ref_valid_1 =3D valid;
> +		break;
> +	case 2:
> +		regs->hevc_param.reg099.hevc_ref_valid_2 =3D valid;
> +		break;
> +	case 3:
> +		regs->hevc_param.reg099.hevc_ref_valid_3 =3D valid;
> +		break;
> +	case 4:
> +		regs->hevc_param.reg099.hevc_ref_valid_4 =3D valid;
> +		break;
> +	case 5:
> +		regs->hevc_param.reg099.hevc_ref_valid_5 =3D valid;
> +		break;
> +	case 6:
> +		regs->hevc_param.reg099.hevc_ref_valid_6 =3D valid;
> +		break;
> +	case 7:
> +		regs->hevc_param.reg099.hevc_ref_valid_7 =3D valid;
> +		break;
> +	case 8:
> +		regs->hevc_param.reg099.hevc_ref_valid_8 =3D valid;
> +		break;
> +	case 9:
> +		regs->hevc_param.reg099.hevc_ref_valid_9 =3D valid;
> +		break;
> +	case 10:
> +		regs->hevc_param.reg099.hevc_ref_valid_10 =3D valid;
> +		break;
> +	case 11:
> +		regs->hevc_param.reg099.hevc_ref_valid_11 =3D valid;
> +		break;
> +	case 12:
> +		regs->hevc_param.reg099.hevc_ref_valid_12 =3D valid;
> +		break;
> +	case 13:
> +		regs->hevc_param.reg099.hevc_ref_valid_13 =3D valid;
> +		break;
> +	case 14:
> +		regs->hevc_param.reg099.hevc_ref_valid_14 =3D valid;
> +		break;
> +	}
> +}
> +
> +static void rkvdec_write_regs(struct rkvdec_ctx *ctx)
> +{
> +	struct rkvdec_dev *rkvdec =3D ctx->dev;
> +	struct rkvdec_hevc_ctx *hevc_ctx =3D ctx->priv;
> +
> +	rkvdec_memcpy_toio(rkvdec->regs + OFFSET_COMMON_REGS,
> +			=C2=A0=C2=A0 &hevc_ctx->regs.common,
> +			=C2=A0=C2=A0 sizeof(hevc_ctx->regs.common));
> +	rkvdec_memcpy_toio(rkvdec->regs + OFFSET_CODEC_PARAMS_REGS,
> +			=C2=A0=C2=A0 &hevc_ctx->regs.hevc_param,
> +			=C2=A0=C2=A0 sizeof(hevc_ctx->regs.hevc_param));
> +	rkvdec_memcpy_toio(rkvdec->regs + OFFSET_COMMON_ADDR_REGS,
> +			=C2=A0=C2=A0 &hevc_ctx->regs.common_addr,
> +			=C2=A0=C2=A0 sizeof(hevc_ctx->regs.common_addr));
> +	rkvdec_memcpy_toio(rkvdec->regs + OFFSET_CODEC_ADDR_REGS,
> +			=C2=A0=C2=A0 &hevc_ctx->regs.hevc_addr,
> +			=C2=A0=C2=A0 sizeof(hevc_ctx->regs.hevc_addr));
> +	rkvdec_memcpy_toio(rkvdec->regs + OFFSET_POC_HIGHBIT_REGS,
> +			=C2=A0=C2=A0 &hevc_ctx->regs.hevc_highpoc,
> +			=C2=A0=C2=A0 sizeof(hevc_ctx->regs.hevc_highpoc));
> +}
> +
> +static void config_registers(struct rkvdec_ctx *ctx,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct rkvdec_hevc_run *run)
> +{
> +	const struct v4l2_ctrl_hevc_decode_params *dec_params =3D run->decode_p=
arams;
> +	const struct v4l2_hevc_dpb_entry *dpb =3D dec_params->dpb;
> +	struct rkvdec_hevc_ctx *hevc_ctx =3D ctx->priv;
> +	struct rkvdec_vdpu381_regs_hevc *regs =3D &hevc_ctx->regs;
> +	dma_addr_t priv_start_addr =3D hevc_ctx->priv_tbl.dma;
> +	const struct v4l2_pix_format_mplane *dst_fmt;
> +	struct vb2_v4l2_buffer *src_buf =3D run->base.bufs.src;
> +	struct vb2_v4l2_buffer *dst_buf =3D run->base.bufs.dst;
> +	const struct v4l2_format *f;
> +	dma_addr_t rlc_addr;
> +	u32 hor_virstride =3D 0;
> +	u32 ver_virstride =3D 0;
> +	u32 y_virstride =3D 0;
> +	u32 offset;
> +	u32 pixels;
> +	dma_addr_t dst_addr;
> +	u32 i;
> +
> +	memset(regs, 0, sizeof(*regs));
> +
> +	/* Set HEVC mode */
> +	regs->common.reg009.dec_mode =3D VDPU381_MODE_HEVC;
> +
> +	/* Set config */
> +	regs->common.reg011.buf_empty_en =3D 1;
> +	regs->common.reg011.dec_clkgate_e =3D 1;
> +	regs->common.reg011.dec_timeout_e =3D 1;
> +	regs->common.reg011.pix_range_detection_e =3D 1;
> +
> +	/* Set IDR flag */
> +	regs->common.reg013.cur_pic_is_idr =3D
> +		!!(dec_params->flags & V4L2_HEVC_DECODE_PARAM_FLAG_IDR_PIC);
> +
> +	/* Set input stream length */
> +	regs->common.stream_len =3D vb2_get_plane_payload(&src_buf->vb2_buf, 0)=
;
> +
> +	/* Set max slice number */
> +	regs->common.reg017.slice_num =3D 1;
> +
> +	/* Set strides */
> +	f =3D &ctx->decoded_fmt;
> +	dst_fmt =3D &f->fmt.pix_mp;
> +	hor_virstride =3D dst_fmt->plane_fmt[0].bytesperline;
> +	ver_virstride =3D dst_fmt->height;
> +	y_virstride =3D hor_virstride * ver_virstride;
> +	pixels =3D dst_fmt->height * dst_fmt->width;
> +
> +	regs->common.reg018.y_hor_virstride =3D hor_virstride / 16;
> +	regs->common.reg019.uv_hor_virstride =3D hor_virstride / 16;
> +	regs->common.reg020.y_virstride =3D y_virstride / 16;
> +
> +	/* Activate block gating */
> +	regs->common.reg026.swreg_block_gating_e =3D 0xfffef;
> +	regs->common.reg026.reg_cfg_gating_en =3D 1;
> +
> +	/* Set timeout threshold */
> +	if (pixels < RKVDEC_1080P_PIXELS)
> +		regs->common.timeout_threshold =3D RKVDEC_TIMEOUT_1080p;
> +	else if (pixels < RKVDEC_4K_PIXELS)
> +		regs->common.timeout_threshold =3D RKVDEC_TIMEOUT_4K;
> +	else if (pixels < RKVDEC_8K_PIXELS)
> +		regs->common.timeout_threshold =3D RKVDEC_TIMEOUT_8K;
> +
> +	/* Set POC val */
> +	regs->hevc_param.cur_top_poc =3D dec_params->pic_order_cnt_val;
> +
> +	/* Set ref pic address & poc */
> +	for (i =3D 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
> +		struct vb2_buffer *vb_buf =3D get_ref_buf(ctx, run, i);
> +		dma_addr_t buf_dma =3D vb2_dma_contig_plane_dma_addr(vb_buf, 0);
> +		u32 valid =3D !!(dec_params->num_active_dpb_entries > i);
> +
> +		/* Set reference addresses */
> +		regs->hevc_addr.ref_base[i] =3D buf_dma;
> +
> +		/* Set COLMV addresses */
> +		regs->hevc_addr.colmv_base[i] =3D buf_dma + ctx->colmv_offset;
> +
> +		regs->hevc_param.reg067_082_ref_poc[i] =3D
> +			dpb[i].pic_order_cnt_val;
> +
> +		set_ref_valid(regs, i, valid);
> +		regs->hevc_param.reg103.ref_pic_layer_same_with_cur |=3D 1 << i;
> +	}
> +
> +	/* Set rlc base address (input stream) */
> +	rlc_addr =3D vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
> +	regs->common_addr.rlc_base =3D rlc_addr;
> +	regs->common_addr.rlcwrite_base =3D rlc_addr;
> +
> +	/* Set output base address */
> +	dst_addr =3D vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
> +	regs->common_addr.decout_base =3D dst_addr;
> +	regs->common_addr.error_ref_base =3D dst_addr;
> +
> +	/* Set colmv address */
> +	regs->common_addr.colmv_cur_base =3D dst_addr + ctx->colmv_offset;
> +
> +	/* Set RCB addresses */
> +	for (i =3D 0; i < rkvdec_rcb_buf_count(ctx); i++)
> +		regs->common_addr.rcb_base[i] =3D rkvdec_rcb_buf_dma_addr(ctx, i);
> +
> +	/* Set hw pps address */
> +	offset =3D offsetof(struct rkvdec_hevc_priv_tbl, param_set);
> +	regs->hevc_addr.pps_base =3D priv_start_addr + offset;
> +
> +	/* Set hw rps address */
> +	offset =3D offsetof(struct rkvdec_hevc_priv_tbl, rps);
> +	regs->hevc_addr.rps_base =3D priv_start_addr + offset;
> +
> +	/* Set cabac table */
> +	offset =3D offsetof(struct rkvdec_hevc_priv_tbl, cabac_table);
> +	regs->hevc_addr.cabactbl_base =3D priv_start_addr + offset;
> +
> +	/* Set scaling matrix */
> +	offset =3D offsetof(struct rkvdec_hevc_priv_tbl, scaling_list);
> +	regs->hevc_addr.scanlist_addr =3D priv_start_addr + offset;
> +
> +	rkvdec_write_regs(ctx);
> +}
> +
> +static int rkvdec_hevc_start(struct rkvdec_ctx *ctx)
> +{
> +	struct rkvdec_dev *rkvdec =3D ctx->dev;
> +	struct rkvdec_hevc_priv_tbl *priv_tbl;
> +	struct rkvdec_hevc_ctx *hevc_ctx;
> +	struct v4l2_ctrl *ctrl;
> +	int ret;
> +
> +	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_HEVC_SPS);
> +	if (!ctrl)
> +		return -EINVAL;
> +
> +	ret =3D rkvdec_hevc_validate_sps(ctx, ctrl->p_new.p_hevc_sps);
> +	if (ret)
> +		return ret;
> +
> +	hevc_ctx =3D kzalloc(sizeof(*hevc_ctx), GFP_KERNEL);
> +	if (!hevc_ctx)
> +		return -ENOMEM;
> +
> +	priv_tbl =3D dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &hevc_ctx->priv_tbl.dma, GFP_KERNEL);
> +	if (!priv_tbl) {
> +		ret =3D -ENOMEM;
> +		goto err_free_ctx;
> +	}
> +
> +	hevc_ctx->priv_tbl.size =3D sizeof(*priv_tbl);
> +	hevc_ctx->priv_tbl.cpu =3D priv_tbl;
> +	memcpy(priv_tbl->cabac_table, rkvdec_hevc_cabac_table,
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(rkvdec_hevc_cabac_table));
> +
> +	ctx->priv =3D hevc_ctx;
> +	return 0;
> +
> +err_free_ctx:
> +	kfree(hevc_ctx);
> +	return ret;
> +}
> +
> +static void rkvdec_hevc_stop(struct rkvdec_ctx *ctx)
> +{
> +	struct rkvdec_hevc_ctx *hevc_ctx =3D ctx->priv;
> +	struct rkvdec_dev *rkvdec =3D ctx->dev;
> +
> +	dma_free_coherent(rkvdec->dev, hevc_ctx->priv_tbl.size,
> +			=C2=A0 hevc_ctx->priv_tbl.cpu, hevc_ctx->priv_tbl.dma);
> +	kfree(hevc_ctx);
> +}
> +
> +static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
> +{
> +	struct rkvdec_dev *rkvdec =3D ctx->dev;
> +	struct rkvdec_hevc_run run;
> +	struct rkvdec_hevc_ctx *hevc_ctx =3D ctx->priv;
> +	struct rkvdec_hevc_priv_tbl *tbl =3D hevc_ctx->priv_tbl.cpu;
> +
> +	rkvdec_hevc_run_preamble(ctx, &run);
> +
> +	/*
> +	 * On vdpu381, not setting the long and short term ref sets will just o=
utput wrong frames.
> +	 * Let's just warn about it and let the decoder run anyway.
> +	 */
> +	if ((!ctx->has_sps_lt_rps && run.sps->num_long_term_ref_pics_sps) ||
> +		(!ctx->has_sps_st_rps && run.sps->num_short_term_ref_pic_sets)) {
> +		dev_warn_ratelimited(rkvdec->dev, "Long and short term RPS not set\n")=
;
> +	}
> +
> +	rkvdec_hevc_assemble_hw_scaling_list(&run,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 &tbl->scaling_list,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 &hevc_ctx->scaling_matrix_cache);
> +	assemble_hw_pps(ctx, &run);
> +	rkvdec_hevc_assemble_hw_rps(&run, &tbl->rps, &hevc_ctx->st_cache);
> +
> +	config_registers(ctx, &run);
> +
> +	rkvdec_run_postamble(ctx, &run.base);
> +
> +	schedule_delayed_work(&rkvdec->watchdog_work, msecs_to_jiffies(2000));
> +
> +	/* Start decoding! */
> +	writel(VDPU381_DEC_E_BIT, rkvdec->regs + VDPU381_REG_DEC_E);
> +
> +	return 0;
> +}
> +
> +const struct rkvdec_coded_fmt_ops rkvdec_vdpu381_hevc_fmt_ops =3D {
> +	.adjust_fmt =3D rkvdec_hevc_adjust_fmt,
> +	.start =3D rkvdec_hevc_start,
> +	.stop =3D rkvdec_hevc_stop,
> +	.run =3D rkvdec_hevc_run,
> +	.try_ctrl =3D rkvdec_hevc_try_ctrl,
> +	.get_image_fmt =3D rkvdec_hevc_get_image_fmt,
> +};
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index 1837f12f1aa1..b72cb07de70e 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -154,6 +154,16 @@ static int rkvdec_s_ctrl(struct v4l2_ctrl *ctrl)
> =C2=A0	enum rkvdec_image_fmt image_fmt;
> =C2=A0	struct vb2_queue *vq;
> =C2=A0
> +	if (ctrl->id =3D=3D V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS) {
> +		ctx->has_sps_st_rps |=3D !!(ctrl->has_changed);
> +		return 0;
> +	}
> +
> +	if (ctrl->id =3D=3D V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS) {
> +		ctx->has_sps_lt_rps |=3D !!(ctrl->has_changed);
> +		return 0;
> +	}
> +
> =C2=A0	/* Check if this change requires a capture format reset */
> =C2=A0	if (!desc->ops->get_image_fmt)
> =C2=A0		return 0;
> @@ -285,6 +295,62 @@ static const struct rkvdec_ctrls rkvdec_h264_ctrls =
=3D {
> =C2=A0	.num_ctrls =3D ARRAY_SIZE(rkvdec_h264_ctrl_descs),
> =C2=A0};
> =C2=A0
> +static const struct rkvdec_ctrl_desc vdpu38x_hevc_ctrl_descs[] =3D {
> +	{
> +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
> +	},
> +	{
> +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_SPS,
> +		.cfg.ops =3D &rkvdec_ctrl_ops,
> +	},
> +	{
> +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_PPS,
> +	},
> +	{
> +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_SCALING_MATRIX,
> +	},
> +	{
> +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_DECODE_MODE,
> +		.cfg.min =3D V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
> +		.cfg.max =3D V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
> +		.cfg.def =3D V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
> +	},
> +	{
> +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_START_CODE,
> +		.cfg.min =3D V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
> +		.cfg.def =3D V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
> +		.cfg.max =3D V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
> +	},
> +	{
> +		.cfg.id =3D V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
> +		.cfg.min =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> +		.cfg.max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> +		.cfg.menu_skip_mask =3D
> +			BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
> +		.cfg.def =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> +	},
> +	{
> +		.cfg.id =3D V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
> +		.cfg.min =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
> +		.cfg.max =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1,
> +	},
> +	{
> +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS,
> +		.cfg.ops =3D &rkvdec_ctrl_ops,
> +		.cfg.dims =3D { 65 },
> +	},
> +	{
> +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS,
> +		.cfg.ops =3D &rkvdec_ctrl_ops,
> +		.cfg.dims =3D { 65 },
> +	},
> +};
> +
> +static const struct rkvdec_ctrls vdpu38x_hevc_ctrls =3D {
> +	.ctrls =3D vdpu38x_hevc_ctrl_descs,
> +	.num_ctrls =3D ARRAY_SIZE(vdpu38x_hevc_ctrl_descs),
> +};
> +
> =C2=A0static const struct rkvdec_decoded_fmt_desc rkvdec_h264_decoded_fmt=
s[] =3D {
> =C2=A0	{
> =C2=A0		.fourcc =3D V4L2_PIX_FMT_NV12,
> @@ -401,6 +467,23 @@ static const struct rkvdec_coded_fmt_desc vdpu381_co=
ded_fmts[] =3D {
> =C2=A0		.subsystem_flags =3D VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
> =C2=A0		.capability =3D RKVDEC_CAPABILITY_H264,
> =C2=A0	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_HEVC_SLICE,
> +		.frmsize =3D {
> +			.min_width =3D 64,
> +			.max_width =3D 65472,
> +			.step_width =3D 64,
> +			.min_height =3D 64,
> +			.max_height =3D 65472,
> +			.step_height =3D 16,
> +		},
> +		.ctrls =3D &vdpu38x_hevc_ctrls,
> +		.ops =3D &rkvdec_vdpu381_hevc_fmt_ops,
> +		.num_decoded_fmts =3D ARRAY_SIZE(rkvdec_hevc_decoded_fmts),
> +		.decoded_fmts =3D rkvdec_hevc_decoded_fmts,
> +		.subsystem_flags =3D VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
> +		.capability =3D RKVDEC_CAPABILITY_HEVC,
> +	},
> =C2=A0};
> =C2=A0
> =C2=A0static const struct rkvdec_coded_fmt_desc vdpu383_coded_fmts[] =3D =
{
> @@ -1500,7 +1583,8 @@ static const struct rkvdec_variant rk3399_rkvdec_va=
riant =3D {
> =C2=A0
> =C2=A0static const struct rkvdec_variant rk3588_vdpu381_variant =3D {
> =C2=A0	.config =3D &config_vdpu381,
> -	.capabilities =3D RKVDEC_CAPABILITY_H264,
> +	.capabilities =3D RKVDEC_CAPABILITY_H264 |
> +			RKVDEC_CAPABILITY_HEVC,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct rkvdec_variant rk3576_vdpu383_variant =3D {
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.h
> index e752706e9f5c..94e2e6429992 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -156,6 +156,8 @@ struct rkvdec_ctx {
> =C2=A0	struct rkvdec_rcb_config *rcb_config;
> =C2=A0	u32 colmv_offset;
> =C2=A0	void *priv;
> +	u8 has_sps_st_rps: 1;
> +	u8 has_sps_lt_rps: 1;
> =C2=A0};
> =C2=A0
> =C2=A0static inline struct rkvdec_ctx *file_to_rkvdec_ctx(struct file *fi=
lp)
> @@ -188,6 +190,7 @@ extern const struct rkvdec_coded_fmt_ops rkvdec_vp9_f=
mt_ops;
> =C2=A0
> =C2=A0/* VDPU381 ops */
> =C2=A0extern const struct rkvdec_coded_fmt_ops rkvdec_vdpu381_h264_fmt_op=
s;
> +extern const struct rkvdec_coded_fmt_ops rkvdec_vdpu381_hevc_fmt_ops;
> =C2=A0
> =C2=A0/* VDPU383 ops */
> =C2=A0extern const struct rkvdec_coded_fmt_ops rkvdec_vdpu383_h264_fmt_op=
s;

--=-gpF3wnr519YG90KNf/xy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTncKQAKCRDZQZRRKWBy
9Jh/AP4som0JYD3fRrVnYwDfBgBDfzY2jTNVL7FX65onOgMgBQD+Jp8qvEhMMNyj
4LuJgYC+V5rI3TcxQfuPnYat/9z3qQQ=
=pAvV
-----END PGP SIGNATURE-----

--=-gpF3wnr519YG90KNf/xy--

