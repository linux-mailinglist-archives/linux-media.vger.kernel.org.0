Return-Path: <linux-media+bounces-48595-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE72CB3FCB
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 21:45:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B1E3730168E4
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 20:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4398030F7F0;
	Wed, 10 Dec 2025 20:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gRtkGn/y"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F203828DF13;
	Wed, 10 Dec 2025 20:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765399521; cv=none; b=N3lV4NU8BeeRrafxfv/gQpN+G4041z9m2nJ6Ez+EbYOhVrGqvM0LztjiM4GYr30MZVGZUPoFkKuQYKFVFirlHm9CMSaGfbURI5YDYZSLgYzeytQH9EfTVMNAEAxdaq5qZhZy3zbh4XsTG2GI2vCN2rTXQVRpNVFjw6MXHGsmk0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765399521; c=relaxed/simple;
	bh=KAZbABDaQCdUeFOcdFJ6761BDJHdEzzy5nwdHN++bKo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n+zFfHWljrC5sx/vHxgz2eVylvbm03/lH+U6p9+aSVOuw2MQ9QDnLqZh/AxIHTo5DjkzxSw2+ZHfUrJ69dqr+tEz0HEy7BCudOITt5/K90fcCVTKHPtrGXGFNJIeB0jrRtlpUZQDonG1rqyJsabmj8g2kuzUcWvpzAiHm7jDRPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gRtkGn/y; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765399516;
	bh=KAZbABDaQCdUeFOcdFJ6761BDJHdEzzy5nwdHN++bKo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gRtkGn/yPhHZpMd67IKMrvMl7V/KpBIhHsDUP5A9nbopIPRk7A6AIa9jFKFXdRJY7
	 N7HKBm5exfsGVX8YwzS/oCh27/hEWDhQr7NpYoRjX+zUNApNoVKTsVKw9VyS3JlZIP
	 ID4ISgysU+gxmU65EpMehrG/KGtbWa/1CjM1jFKGWAnZV0OyFSaLtPwmLqsLiyidlf
	 FctGhLG9V3zjTLjesR22gwa3ZySgBn1gL5vbkqYyOl1vVl98IwPVsnC2Jc/PtPtWM7
	 9vuefaQHSD7DUwE9DmlrC/eG+rI+MhtBo5qK4lSKSxGpkVwQtGvX9wnzliPSqnzVfC
	 jT3ESc9DxbR3g==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 13E9D17E04D6;
	Wed, 10 Dec 2025 21:45:13 +0100 (CET)
Message-ID: <1b4c87416fc2d7f18fb5a179c48c6cffeb1a7c7d.camel@collabora.com>
Subject: Re: [PATCH v4 13/15] media: rkvdec: Add H264 support for the
 VDPU383 variant
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
 kernel@collabora.com
Date: Wed, 10 Dec 2025 15:45:12 -0500
In-Reply-To: <20251022174508.284929-14-detlev.casanova@collabora.com>
References: <20251022174508.284929-1-detlev.casanova@collabora.com>
	 <20251022174508.284929-14-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-ibF1Tqtlwr5sGnH3ZWWo"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-ibF1Tqtlwr5sGnH3ZWWo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 22 octobre 2025 =C3=A0 13:45 -0400, Detlev Casanova a =C3=A9cri=
t=C2=A0:
> This variant is used on the RK3576 SoC.
>=20
> The moving vectors size requirements are slightly different so support
> for a colmv_size function per variant is added.
>=20
> Also, the link registers are used to start the decoder and read IRQ statu=
s.
> Per variant support for named register sections is added.
>=20
> The fluster score is 128/135 for JVT-AVC_V1, with MPS_MW_A failing in
> addition to the usual ones.
> The other test suites are not supported yet.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
> =C2=A0.../media/platform/rockchip/rkvdec/Makefile=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
> =C2=A0.../rockchip/rkvdec/rkvdec-vdpu383-h264.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
 582 ++++++++++++++++++
> =C2=A0.../rockchip/rkvdec/rkvdec-vdpu383-regs.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
 284 +++++++++
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.c=C2=A0=C2=A0 | 118 +++-
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.h=C2=A0=C2=A0 |=C2=A0=C2=
=A0 8 +
> =C2=A05 files changed, 987 insertions(+), 6 deletions(-)
> =C2=A0create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vd=
pu383-h264.c
> =C2=A0create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vd=
pu383-regs.h
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/Makefile b/drivers/me=
dia/platform/rockchip/rkvdec/Makefile
> index 7bfd95151e40..a58d4aede2fe 100644
> --- a/drivers/media/platform/rockchip/rkvdec/Makefile
> +++ b/drivers/media/platform/rockchip/rkvdec/Makefile
> @@ -9,4 +9,5 @@ rockchip-vdec-y +=3D \
> =C2=A0		=C2=A0=C2=A0 rkvdec-hevc-common.o \
> =C2=A0		=C2=A0=C2=A0 rkvdec-rcb.o \
> =C2=A0		=C2=A0=C2=A0 rkvdec-vdpu381-h264.o \
> +		=C2=A0=C2=A0 rkvdec-vdpu383-h264.o \
> =C2=A0		=C2=A0=C2=A0 rkvdec-vp9.o
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c=
 b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
> new file mode 100644
> index 000000000000..bb2c62d9c3d4
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
> @@ -0,0 +1,582 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip Video Decoder VDPU383 H264 backend
> + *
> + * Copyright (C) 2024 Collabora, Ltd.
> + *=C2=A0 Detlev Casanova <detlev.casanova@collabora.com>
> + */
> +
> +#include <media/v4l2-h264.h>
> +#include <media/v4l2-mem2mem.h>
> +
> +#include <linux/iopoll.h>
> +
> +#include "rkvdec-rcb.h"
> +#include "rkvdec-vdpu383-regs.h"
> +#include "rkvdec-h264-common.h"
> +
> +struct rkvdec_sps {
> +	u16 seq_parameter_set_id:			4;
> +	u16 profile_idc:				8;
> +	u16 constraint_set3_flag:			1;
> +	u16 chroma_format_idc:				2;
> +	u16 bit_depth_luma:				3;
> +	u16 bit_depth_chroma:				3;
> +	u16 qpprime_y_zero_transform_bypass_flag:	1;
> +	u16 log2_max_frame_num_minus4:			4;
> +	u16 max_num_ref_frames:				5;
> +	u16 pic_order_cnt_type:				2;
> +	u16 log2_max_pic_order_cnt_lsb_minus4:		4;
> +	u16 delta_pic_order_always_zero_flag:		1;
> +
> +	u16 pic_width_in_mbs:				16;
> +	u16 pic_height_in_mbs:				16;
> +
> +	u16 frame_mbs_only_flag:			1;
> +	u16 mb_adaptive_frame_field_flag:		1;
> +	u16 direct_8x8_inference_flag:			1;
> +	u16 mvc_extension_enable:			1;
> +	u16 num_views:					2;
> +	u16 view_id0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10=
;
> +	u16 view_id1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10=
;
> +} __packed;
> +
> +struct rkvdec_pps {
> +	u32 pic_parameter_set_id:				8;
> +	u32 pps_seq_parameter_set_id:				5;
> +	u32 entropy_coding_mode_flag:				1;
> +	u32 bottom_field_pic_order_in_frame_present_flag:	1;
> +	u32 num_ref_idx_l0_default_active_minus1:		5;
> +	u32 num_ref_idx_l1_default_active_minus1:		5;
> +	u32 weighted_pred_flag:					1;
> +	u32 weighted_bipred_idc:				2;
> +	u32 pic_init_qp_minus26:				7;
> +	u32 pic_init_qs_minus26:				6;
> +	u32 chroma_qp_index_offset:				5;
> +	u32 deblocking_filter_control_present_flag:		1;
> +	u32 constrained_intra_pred_flag:			1;
> +	u32 redundant_pic_cnt_present:				1;
> +	u32 transform_8x8_mode_flag:				1;
> +	u32 second_chroma_qp_index_offset:			5;
> +	u32 scaling_list_enable_flag:				1;
> +	u32 is_longterm:					16;
> +	u32 voidx:						16;
> +
> +	// dpb
> +	u32 pic_field_flag:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 1;
> +	u32 pic_associated_flag:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> +	u32 cur_top_field:					32;
> +	u32 cur_bot_field:					32;
> +
> +	u32 top_field_order_cnt0:				32;
> +	u32 bot_field_order_cnt0:				32;
> +	u32 top_field_order_cnt1:				32;
> +	u32 bot_field_order_cnt1:				32;
> +	u32 top_field_order_cnt2:				32;
> +	u32 bot_field_order_cnt2:				32;
> +	u32 top_field_order_cnt3:				32;
> +	u32 bot_field_order_cnt3:				32;
> +	u32 top_field_order_cnt4:				32;
> +	u32 bot_field_order_cnt4:				32;
> +	u32 top_field_order_cnt5:				32;
> +	u32 bot_field_order_cnt5:				32;
> +	u32 top_field_order_cnt6:				32;
> +	u32 bot_field_order_cnt6:				32;
> +	u32 top_field_order_cnt7:				32;
> +	u32 bot_field_order_cnt7:				32;
> +	u32 top_field_order_cnt8:				32;
> +	u32 bot_field_order_cnt8:				32;
> +	u32 top_field_order_cnt9:				32;
> +	u32 bot_field_order_cnt9:				32;
> +	u32 top_field_order_cnt10:				32;
> +	u32 bot_field_order_cnt10:				32;
> +	u32 top_field_order_cnt11:				32;
> +	u32 bot_field_order_cnt11:				32;
> +	u32 top_field_order_cnt12:				32;
> +	u32 bot_field_order_cnt12:				32;
> +	u32 top_field_order_cnt13:				32;
> +	u32 bot_field_order_cnt13:				32;
> +	u32 top_field_order_cnt14:				32;
> +	u32 bot_field_order_cnt14:				32;
> +	u32 top_field_order_cnt15:				32;
> +	u32 bot_field_order_cnt15:				32;
> +
> +	u32 ref_field_flags:					16;
> +	u32 ref_topfield_used:					16;
> +	u32 ref_botfield_used:					16;
> +	u32 ref_colmv_use_flag:					16;
> +
> +	u32 reserved0:						30;
> +	u32 reserved[3];
> +} __packed;
> +
> +struct rkvdec_sps_pps {
> +	struct rkvdec_sps sps;
> +	struct rkvdec_pps pps;
> +} __packed;
> +
> +/* Data structure describing auxiliary buffer format. */
> +struct rkvdec_h264_priv_tbl {
> +	s8 cabac_table[4][464][2];
> +	struct rkvdec_h264_scaling_list scaling_list;
> +	struct rkvdec_sps_pps param_set[256];
> +	struct rkvdec_rps rps;
> +} __packed;
> +
> +struct rkvdec_h264_ctx {
> +	struct rkvdec_aux_buf priv_tbl;
> +	struct rkvdec_h264_reflists reflists;
> +	struct vdpu383_regs_h26x regs;
> +};
> +
> +static void set_field_order_cnt(struct rkvdec_sps_pps *hw_ps, int id, u3=
2 top, u32 bottom)
> +{
> +	switch (id) {
> +	case 0:
> +		hw_ps->pps.top_field_order_cnt0 =3D top;
> +		hw_ps->pps.bot_field_order_cnt0 =3D bottom;
> +		break;
> +	case 1:
> +		hw_ps->pps.top_field_order_cnt1 =3D top;
> +		hw_ps->pps.bot_field_order_cnt1 =3D bottom;
> +		break;
> +	case 2:
> +		hw_ps->pps.top_field_order_cnt2 =3D top;
> +		hw_ps->pps.bot_field_order_cnt2 =3D bottom;
> +		break;
> +	case 3:
> +		hw_ps->pps.top_field_order_cnt3 =3D top;
> +		hw_ps->pps.bot_field_order_cnt3 =3D bottom;
> +		break;
> +	case 4:
> +		hw_ps->pps.top_field_order_cnt4 =3D top;
> +		hw_ps->pps.bot_field_order_cnt4 =3D bottom;
> +		break;
> +	case 5:
> +		hw_ps->pps.top_field_order_cnt5 =3D top;
> +		hw_ps->pps.bot_field_order_cnt5 =3D bottom;
> +		break;
> +	case 6:
> +		hw_ps->pps.top_field_order_cnt6 =3D top;
> +		hw_ps->pps.bot_field_order_cnt6 =3D bottom;
> +		break;
> +	case 7:
> +		hw_ps->pps.top_field_order_cnt7 =3D top;
> +		hw_ps->pps.bot_field_order_cnt7 =3D bottom;
> +		break;
> +	case 8:
> +		hw_ps->pps.top_field_order_cnt8 =3D top;
> +		hw_ps->pps.bot_field_order_cnt8 =3D bottom;
> +		break;
> +	case 9:
> +		hw_ps->pps.top_field_order_cnt9 =3D top;
> +		hw_ps->pps.bot_field_order_cnt9 =3D bottom;
> +		break;
> +	case 10:
> +		hw_ps->pps.top_field_order_cnt10 =3D top;
> +		hw_ps->pps.bot_field_order_cnt10 =3D bottom;
> +		break;
> +	case 11:
> +		hw_ps->pps.top_field_order_cnt11 =3D top;
> +		hw_ps->pps.bot_field_order_cnt11 =3D bottom;
> +		break;
> +	case 12:
> +		hw_ps->pps.top_field_order_cnt12 =3D top;
> +		hw_ps->pps.bot_field_order_cnt12 =3D bottom;
> +		break;
> +	case 13:
> +		hw_ps->pps.top_field_order_cnt13 =3D top;
> +		hw_ps->pps.bot_field_order_cnt13 =3D bottom;
> +		break;
> +	case 14:
> +		hw_ps->pps.top_field_order_cnt14 =3D top;
> +		hw_ps->pps.bot_field_order_cnt14 =3D bottom;
> +		break;
> +	case 15:
> +		hw_ps->pps.top_field_order_cnt15 =3D top;
> +		hw_ps->pps.bot_field_order_cnt15 =3D bottom;
> +		break;
> +	}
> +}
> +
> +static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> +			=C2=A0=C2=A0=C2=A0 struct rkvdec_h264_run *run)
> +{
> +	struct rkvdec_h264_ctx *h264_ctx =3D ctx->priv;
> +	const struct v4l2_ctrl_h264_sps *sps =3D run->sps;
> +	const struct v4l2_ctrl_h264_pps *pps =3D run->pps;
> +	const struct v4l2_ctrl_h264_decode_params *dec_params =3D run->decode_p=
arams;
> +	const struct v4l2_h264_dpb_entry *dpb =3D dec_params->dpb;
> +	struct rkvdec_h264_priv_tbl *priv_tbl =3D h264_ctx->priv_tbl.cpu;
> +	struct rkvdec_sps_pps *hw_ps;
> +	u32 pic_width, pic_height;
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
> +	hw_ps->sps.seq_parameter_set_id =3D sps->seq_parameter_set_id;
> +	hw_ps->sps.profile_idc =3D sps->profile_idc;
> +	hw_ps->sps.constraint_set3_flag =3D !!(sps->constraint_set_flags & (1 <=
< 3));
> +	hw_ps->sps.chroma_format_idc =3D sps->chroma_format_idc;
> +	hw_ps->sps.bit_depth_luma =3D sps->bit_depth_luma_minus8;
> +	hw_ps->sps.bit_depth_chroma =3D sps->bit_depth_chroma_minus8;
> +	hw_ps->sps.qpprime_y_zero_transform_bypass_flag =3D
> +		!!(sps->flags & V4L2_H264_SPS_FLAG_QPPRIME_Y_ZERO_TRANSFORM_BYPASS);
> +	hw_ps->sps.log2_max_frame_num_minus4 =3D sps->log2_max_frame_num_minus4=
;
> +	hw_ps->sps.max_num_ref_frames =3D sps->max_num_ref_frames;
> +	hw_ps->sps.pic_order_cnt_type =3D sps->pic_order_cnt_type;
> +	hw_ps->sps.log2_max_pic_order_cnt_lsb_minus4 =3D
> +		sps->log2_max_pic_order_cnt_lsb_minus4;
> +	hw_ps->sps.delta_pic_order_always_zero_flag =3D
> +		!!(sps->flags & V4L2_H264_SPS_FLAG_DELTA_PIC_ORDER_ALWAYS_ZERO);
> +	hw_ps->sps.mvc_extension_enable =3D 0;
> +	hw_ps->sps.num_views =3D 0;
> +
> +	/*
> +	 * Use the SPS values since they are already in macroblocks
> +	 * dimensions, height can be field height (halved) if
> +	 * V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY is not set and also it allows
> +	 * decoding smaller images into larger allocation which can be used
> +	 * to implementing SVC spatial layer support.
> +	 */
> +	pic_width =3D 16 * (sps->pic_width_in_mbs_minus1 + 1);
> +	pic_height =3D 16 * (sps->pic_height_in_map_units_minus1 + 1);
> +	if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
> +		pic_height *=3D 2;
> +	if (!!(dec_params->flags & V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC))
> +		pic_height /=3D 2;
> +
> +	hw_ps->sps.pic_width_in_mbs =3D pic_width;
> +	hw_ps->sps.pic_height_in_mbs =3D pic_height;
> +
> +	hw_ps->sps.frame_mbs_only_flag =3D
> +		!!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY);
> +	hw_ps->sps.mb_adaptive_frame_field_flag =3D
> +		!!(sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD);
> +	hw_ps->sps.direct_8x8_inference_flag =3D
> +		!!(sps->flags & V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE);
> +
> +	/* write pps */
> +	hw_ps->pps.pic_parameter_set_id =3D pps->pic_parameter_set_id;
> +	hw_ps->pps.pps_seq_parameter_set_id =3D pps->seq_parameter_set_id;
> +	hw_ps->pps.entropy_coding_mode_flag =3D
> +		!!(pps->flags & V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE);
> +	hw_ps->pps.bottom_field_pic_order_in_frame_present_flag =3D
> +		!!(pps->flags & V4L2_H264_PPS_FLAG_BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRE=
SENT);
> +	hw_ps->pps.num_ref_idx_l0_default_active_minus1 =3D
> +		pps->num_ref_idx_l0_default_active_minus1;
> +	hw_ps->pps.num_ref_idx_l1_default_active_minus1 =3D
> +		pps->num_ref_idx_l1_default_active_minus1;
> +	hw_ps->pps.weighted_pred_flag =3D
> +		!!(pps->flags & V4L2_H264_PPS_FLAG_WEIGHTED_PRED);
> +	hw_ps->pps.weighted_bipred_idc =3D pps->weighted_bipred_idc;
> +	hw_ps->pps.pic_init_qp_minus26 =3D pps->pic_init_qp_minus26;
> +	hw_ps->pps.pic_init_qs_minus26 =3D pps->pic_init_qs_minus26;
> +	hw_ps->pps.chroma_qp_index_offset =3D pps->chroma_qp_index_offset;
> +	hw_ps->pps.deblocking_filter_control_present_flag =3D
> +		!!(pps->flags & V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT);
> +	hw_ps->pps.constrained_intra_pred_flag =3D
> +		!!(pps->flags & V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED);
> +	hw_ps->pps.redundant_pic_cnt_present =3D
> +		!!(pps->flags & V4L2_H264_PPS_FLAG_REDUNDANT_PIC_CNT_PRESENT);
> +	hw_ps->pps.transform_8x8_mode_flag =3D
> +		!!(pps->flags & V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE);
> +	hw_ps->pps.second_chroma_qp_index_offset =3D pps->second_chroma_qp_inde=
x_offset;
> +	hw_ps->pps.scaling_list_enable_flag =3D
> +		!!(pps->flags & V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT);
> +
> +	for (i =3D 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
> +		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
> +			hw_ps->pps.is_longterm |=3D (1 << i);
> +
> +		set_field_order_cnt(hw_ps, i, dpb[i].top_field_order_cnt,
> +				=C2=A0=C2=A0=C2=A0 dpb[i].bottom_field_order_cnt);
> +
> +		hw_ps->pps.ref_field_flags |=3D
> +			(!!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_FIELD)) << i;
> +		hw_ps->pps.ref_colmv_use_flag |=3D
> +			(!!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)) << i;
> +		hw_ps->pps.ref_topfield_used |=3D
> +			(!!(dpb[i].fields & V4L2_H264_TOP_FIELD_REF)) << i;
> +		hw_ps->pps.ref_botfield_used |=3D
> +			(!!(dpb[i].fields & V4L2_H264_BOTTOM_FIELD_REF)) << i;
> +	}
> +
> +	hw_ps->pps.pic_field_flag =3D
> +		!!(dec_params->flags & V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC);
> +	hw_ps->pps.pic_associated_flag =3D
> +		!!(dec_params->flags & V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD);
> +
> +	hw_ps->pps.cur_top_field =3D dec_params->top_field_order_cnt;
> +	hw_ps->pps.cur_bot_field =3D dec_params->bottom_field_order_cnt;
> +}
> +
> +static void rkvdec_write_regs(struct rkvdec_ctx *ctx)
> +{
> +	struct rkvdec_dev *rkvdec =3D ctx->dev;
> +	struct rkvdec_h264_ctx *h264_ctx =3D ctx->priv;
> +
> +	rkvdec_memcpy_toio(rkvdec->regs + VDPU383_OFFSET_COMMON_REGS,
> +			=C2=A0=C2=A0 &h264_ctx->regs.common,
> +			=C2=A0=C2=A0 sizeof(h264_ctx->regs.common));
> +	rkvdec_memcpy_toio(rkvdec->regs + VDPU383_OFFSET_COMMON_ADDR_REGS,
> +			=C2=A0=C2=A0 &h264_ctx->regs.common_addr,
> +			=C2=A0=C2=A0 sizeof(h264_ctx->regs.common_addr));
> +	rkvdec_memcpy_toio(rkvdec->regs + VDPU383_OFFSET_CODEC_PARAMS_REGS,
> +			=C2=A0=C2=A0 &h264_ctx->regs.h26x_params,
> +			=C2=A0=C2=A0 sizeof(h264_ctx->regs.h26x_params));
> +	rkvdec_memcpy_toio(rkvdec->regs + VDPU383_OFFSET_CODEC_ADDR_REGS,
> +			=C2=A0=C2=A0 &h264_ctx->regs.h26x_addr,
> +			=C2=A0=C2=A0 sizeof(h264_ctx->regs.h26x_addr));
> +}
> +
> +static void config_registers(struct rkvdec_ctx *ctx,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct rkvdec_h264_run *run)
> +{
> +	const struct v4l2_ctrl_h264_decode_params *dec_params =3D run->decode_p=
arams;
> +	struct rkvdec_h264_ctx *h264_ctx =3D ctx->priv;
> +	dma_addr_t priv_start_addr =3D h264_ctx->priv_tbl.dma;
> +	const struct v4l2_pix_format_mplane *dst_fmt;
> +	struct vb2_v4l2_buffer *src_buf =3D run->base.bufs.src;
> +	struct vb2_v4l2_buffer *dst_buf =3D run->base.bufs.dst;
> +	struct vdpu383_regs_h26x *regs =3D &h264_ctx->regs;
> +	const struct v4l2_format *f;
> +	dma_addr_t rlc_addr;
> +	dma_addr_t dst_addr;
> +	u32 hor_virstride;
> +	u32 ver_virstride;
> +	u32 y_virstride;
> +	u32 offset;
> +	u32 pixels;
> +	u32 i;
> +
> +	memset(regs, 0, sizeof(*regs));
> +
> +	/* Set H264 mode */
> +	regs->common.reg008_dec_mode =3D VDPU383_MODE_H264;
> +
> +	/* Set input stream length */
> +	regs->h26x_params.reg066_stream_len =3D vb2_get_plane_payload(&src_buf-=
>vb2_buf, 0);
> +
> +	/* Set strides */
> +	f =3D &ctx->decoded_fmt;
> +	dst_fmt =3D &f->fmt.pix_mp;
> +	hor_virstride =3D dst_fmt->plane_fmt[0].bytesperline;
> +	ver_virstride =3D dst_fmt->height;
> +	y_virstride =3D hor_virstride * ver_virstride;
> +
> +	pixels =3D dst_fmt->height * dst_fmt->width;
> +
> +	regs->h26x_params.reg068_hor_virstride =3D hor_virstride / 16;
> +	regs->h26x_params.reg069_raster_uv_hor_virstride =3D hor_virstride / 16=
;
> +	regs->h26x_params.reg070_y_virstride =3D y_virstride / 16;
> +
> +	/* Activate block gating */
> +	regs->common.reg010.strmd_auto_gating_e=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D 1;
> +	regs->common.reg010.inter_auto_gating_e=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D 1;
> +	regs->common.reg010.intra_auto_gating_e=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D 1;
> +	regs->common.reg010.transd_auto_gating_e=C2=A0=C2=A0=C2=A0=C2=A0 =3D 1;
> +	regs->common.reg010.recon_auto_gating_e=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D 1;
> +	regs->common.reg010.filterd_auto_gating_e=C2=A0=C2=A0=C2=A0 =3D 1;
> +	regs->common.reg010.bus_auto_gating_e=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D 1;
> +	regs->common.reg010.ctrl_auto_gating_e=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D 1;
> +	regs->common.reg010.rcb_auto_gating_e=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D 1;
> +	regs->common.reg010.err_prc_auto_gating_e=C2=A0=C2=A0=C2=A0 =3D 1;
> +
> +	/* Set timeout threshold */
> +	if (pixels < VDPU383_1080P_PIXELS)
> +		regs->common.reg013_core_timeout_threshold =3D VDPU383_TIMEOUT_1080p;
> +	else if (pixels < VDPU383_4K_PIXELS)
> +		regs->common.reg013_core_timeout_threshold =3D VDPU383_TIMEOUT_4K;
> +	else if (pixels < VDPU383_8K_PIXELS)
> +		regs->common.reg013_core_timeout_threshold =3D VDPU383_TIMEOUT_8K;
> +	else
> +		regs->common.reg013_core_timeout_threshold =3D VDPU383_TIMEOUT_MAX;
> +
> +	regs->common.reg016.error_proc_disable =3D 1;
> +
> +	/* Set ref pic address & poc */
> +	for (i =3D 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
> +		struct vb2_buffer *vb_buf =3D run->ref_buf[i];
> +		dma_addr_t buf_dma;
> +
> +		/*
> +		 * If a DPB entry is unused or invalid, address of current destination
> +		 * buffer is returned.
> +		 */
> +		if (!vb_buf)
> +			vb_buf =3D &dst_buf->vb2_buf;
> +
> +		buf_dma =3D vb2_dma_contig_plane_dma_addr(vb_buf, 0);
> +
> +		/* Set reference addresses */
> +		regs->h26x_addr.reg170_185_ref_base[i] =3D buf_dma;
> +		regs->h26x_addr.reg195_210_payload_st_ref_base[i] =3D buf_dma;
> +
> +		/* Set COLMV addresses */
> +		regs->h26x_addr.reg217_232_colmv_ref_base[i] =3D buf_dma + ctx->colmv_=
offset;
> +	}
> +
> +	/* Set rlc base address (input stream) */
> +	rlc_addr =3D vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
> +	regs->common_addr.reg128_strm_base =3D rlc_addr;
> +
> +	/* Set output base address */
> +	dst_addr =3D vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
> +	regs->h26x_addr.reg168_decout_base =3D dst_addr;
> +	regs->h26x_addr.reg169_error_ref_base =3D dst_addr;
> +	regs->h26x_addr.reg192_payload_st_cur_base =3D dst_addr;
> +
> +	/* Set colmv address */
> +	regs->h26x_addr.reg216_colmv_cur_base =3D dst_addr + ctx->colmv_offset;
> +
> +	/* Set RCB addresses */
> +	for (i =3D 0; i < rkvdec_rcb_buf_count(ctx); i++) {
> +		regs->common_addr.reg140_162_rcb_info[i].offset =3D rkvdec_rcb_buf_dma=
_addr(ctx, i);
> +		regs->common_addr.reg140_162_rcb_info[i].size =3D rkvdec_rcb_buf_size(=
ctx, i);
> +	}
> +
> +	/* Set hw pps address */
> +	offset =3D offsetof(struct rkvdec_h264_priv_tbl, param_set);
> +	regs->common_addr.reg131_gbl_base =3D priv_start_addr + offset;
> +	regs->h26x_params.reg067_global_len =3D sizeof(struct rkvdec_sps_pps) /=
 16;
> +
> +	/* Set hw rps address */
> +	offset =3D offsetof(struct rkvdec_h264_priv_tbl, rps);
> +	regs->common_addr.reg129_rps_base =3D priv_start_addr + offset;
> +
> +	/* Set cabac table */
> +	offset =3D offsetof(struct rkvdec_h264_priv_tbl, cabac_table);
> +	regs->common_addr.reg130_cabactbl_base =3D priv_start_addr + offset;
> +
> +	/* Set scaling list address */
> +	offset =3D offsetof(struct rkvdec_h264_priv_tbl, scaling_list);
> +	regs->common_addr.reg132_scanlist_addr =3D priv_start_addr + offset;
> +
> +	rkvdec_write_regs(ctx);
> +}
> +
> +static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
> +{
> +	struct rkvdec_dev *rkvdec =3D ctx->dev;
> +	struct rkvdec_h264_priv_tbl *priv_tbl;
> +	struct rkvdec_h264_ctx *h264_ctx;
> +	struct v4l2_ctrl *ctrl;
> +	int ret;
> +
> +	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_H264_SPS);
> +	if (!ctrl)
> +		return -EINVAL;
> +
> +	ret =3D rkvdec_h264_validate_sps(ctx, ctrl->p_new.p_h264_sps);
> +	if (ret)
> +		return ret;
> +
> +	h264_ctx =3D kzalloc(sizeof(*h264_ctx), GFP_KERNEL);
> +	if (!h264_ctx)
> +		return -ENOMEM;
> +
> +	priv_tbl =3D dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &h264_ctx->priv_tbl.dma, GFP_KERNEL);
> +	if (!priv_tbl) {
> +		ret =3D -ENOMEM;
> +		goto err_free_ctx;
> +	}
> +
> +	h264_ctx->priv_tbl.size =3D sizeof(*priv_tbl);
> +	h264_ctx->priv_tbl.cpu =3D priv_tbl;
> +	memcpy(priv_tbl->cabac_table, rkvdec_h264_cabac_table,
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(rkvdec_h264_cabac_table));
> +
> +	ctx->priv =3D h264_ctx;
> +
> +	return 0;
> +
> +err_free_ctx:
> +	kfree(h264_ctx);
> +	return ret;
> +}
> +
> +static void rkvdec_h264_stop(struct rkvdec_ctx *ctx)
> +{
> +	struct rkvdec_h264_ctx *h264_ctx =3D ctx->priv;
> +	struct rkvdec_dev *rkvdec =3D ctx->dev;
> +
> +	dma_free_coherent(rkvdec->dev, h264_ctx->priv_tbl.size,
> +			=C2=A0 h264_ctx->priv_tbl.cpu, h264_ctx->priv_tbl.dma);
> +	kfree(h264_ctx);
> +}
> +
> +static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
> +{
> +	struct v4l2_h264_reflist_builder reflist_builder;
> +	struct rkvdec_dev *rkvdec =3D ctx->dev;
> +	struct rkvdec_h264_ctx *h264_ctx =3D ctx->priv;
> +	struct rkvdec_h264_run run;
> +	struct rkvdec_h264_priv_tbl *tbl =3D h264_ctx->priv_tbl.cpu;
> +	u32 watchdog_time;
> +	u64 timeout_threshold;
> +	unsigned long axi_rate;
> +
> +	rkvdec_h264_run_preamble(ctx, &run);
> +
> +	/* Build the P/B{0,1} ref lists. */
> +	v4l2_h264_init_reflist_builder(&reflist_builder, run.decode_params,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 run.sps, run.decode_params->dpb=
);
> +	v4l2_h264_build_p_ref_list(&reflist_builder, h264_ctx->reflists.p);
> +	v4l2_h264_build_b_ref_lists(&reflist_builder, h264_ctx->reflists.b0,
> +				=C2=A0=C2=A0=C2=A0 h264_ctx->reflists.b1);
> +
> +	assemble_hw_scaling_list(&run, &tbl->scaling_list);
> +	assemble_hw_pps(ctx, &run);
> +	lookup_ref_buf_idx(ctx, &run);
> +	assemble_hw_rps(&reflist_builder, &run, &h264_ctx->reflists, &tbl->rps)=
;
> +
> +	config_registers(ctx, &run);
> +
> +	rkvdec_run_postamble(ctx, &run.base);
> +
> +	/* Set watchdog at 2 times the hardware timeout threshold */
> +	timeout_threshold =3D h264_ctx->regs.common.reg013_core_timeout_thresho=
ld;
> +	axi_rate =3D clk_get_rate(rkvdec->axi_clk);
> +
> +	if (axi_rate)
> +		watchdog_time =3D 2 * (1000 * timeout_threshold) / axi_rate;
> +	else
> +		watchdog_time =3D 2000;
> +	schedule_delayed_work(&rkvdec->watchdog_work,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(watchdog_time));
> +
> +	/* Start decoding! */
> +	writel(timeout_threshold, rkvdec->link + VDPU383_LINK_TIMEOUT_THRESHOLD=
);
> +	writel(0, rkvdec->link + VDPU383_LINK_IP_ENABLE);
> +	writel(VDPU383_DEC_E_BIT, rkvdec->link + VDPU383_LINK_DEC_ENABLE);
> +
> +	return 0;
> +}
> +
> +static int rkvdec_h264_try_ctrl(struct rkvdec_ctx *ctx, struct v4l2_ctrl=
 *ctrl)
> +{
> +	if (ctrl->id =3D=3D V4L2_CID_STATELESS_H264_SPS)
> +		return rkvdec_h264_validate_sps(ctx, ctrl->p_new.p_h264_sps);
> +
> +	return 0;
> +}
> +
> +const struct rkvdec_coded_fmt_ops rkvdec_vdpu383_h264_fmt_ops =3D {
> +	.adjust_fmt =3D rkvdec_h264_adjust_fmt,
> +	.get_image_fmt =3D rkvdec_h264_get_image_fmt,
> +	.start =3D rkvdec_h264_start,
> +	.stop =3D rkvdec_h264_stop,
> +	.run =3D rkvdec_h264_run,
> +	.try_ctrl =3D rkvdec_h264_try_ctrl,
> +};
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h=
 b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h
> new file mode 100644
> index 000000000000..2b614393a3af
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h
> @@ -0,0 +1,284 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip Video Decoder VDPU383 driver registers description
> + *
> + * Copyright (C) 2025 Collabora, Ltd.
> + *=C2=A0 Detlev Casanova <detlev.casanova@collabora.com>
> + */
> +
> +#ifndef _RKVDEC_VDPU838_REGS_H_
> +#define _RKVDEC_VDPU838_REGS_H_
> +
> +#include <linux/types.h>
> +
> +#define VDPU383_OFFSET_COMMON_REGS		(8 * sizeof(u32))
> +#define VDPU383_OFFSET_CODEC_PARAMS_REGS	(64 * sizeof(u32))
> +#define VDPU383_OFFSET_COMMON_ADDR_REGS		(128 * sizeof(u32))
> +#define VDPU383_OFFSET_CODEC_ADDR_REGS		(168 * sizeof(u32))
> +#define VDPU383_OFFSET_POC_HIGHBIT_REGS		(200 * sizeof(u32))
> +
> +#define VDPU383_MODE_HEVC	0
> +#define VDPU383_MODE_H264	1
> +
> +#define VDPU383_1080P_PIXELS		(1920 * 1080)
> +#define VDPU383_4K_PIXELS		(4096 * 2304)
> +#define VDPU383_8K_PIXELS		(7680 * 4320)
> +#define VDPU383_TIMEOUT_1080p		(0xffffff)
> +#define VDPU383_TIMEOUT_4K		(0x2cfffff)
> +#define VDPU383_TIMEOUT_8K		(0x4ffffff)
> +#define VDPU383_TIMEOUT_MAX		(0xffffffff)
> +
> +#define VDPU383_LINK_TIMEOUT_THRESHOLD	0x54
> +
> +#define VDPU383_LINK_IP_ENABLE		0x58
> +#define VDPU383_IP_CRU_MODE		BIT(24)
> +
> +#define VDPU383_LINK_DEC_ENABLE		0x40
> +#define VDPU383_DEC_E_BIT		BIT(0)
> +
> +#define VDPU383_LINK_INT_EN		0x048
> +#define VDPU383_INT_EN_IRQ		BIT(0)
> +#define VDPU383_INT_EN_LINE_IRQ		BIT(1)
> +
> +#define VDPU383_LINK_STA_INT		0x04c
> +#define VDPU383_STA_INT_DEC_RDY_STA	BIT(0)
> +#define VDPU383_STA_INT_SOFTRESET_RDY	(BIT(10) | BIT(11))
> +#define VDPU383_STA_INT_ALL		0x3ff
> +
> +struct vdpu383_regs_common {
> +	u32 reg008_dec_mode;
> +
> +	struct swreg9_important_en {
> +		u32 fbc_e			: 1;
> +		u32 tile_e			: 1;
> +		u32 reserve0			: 2;
> +		u32 buf_empty_en		: 1;
> +		u32 scale_down_en		: 1;
> +		u32 reserve1			: 1;
> +		u32 pix_range_det_e		: 1;
> +		u32 av1_fgs_en			: 1;
> +		u32 reserve2			: 7;
> +		u32 line_irq_en			: 1;
> +		u32 out_cbcr_swap		: 1;
> +		u32 fbc_force_uncompress	: 1;
> +		u32 fbc_sparse_mode		: 1;
> +		u32 reserve3			: 12;
> +	} reg009;
> +
> +	struct swreg010_block_gating_en {
> +		u32 strmd_auto_gating_e		: 1;
> +		u32 inter_auto_gating_e		: 1;
> +		u32 intra_auto_gating_e		: 1;
> +		u32 transd_auto_gating_e	: 1;
> +		u32 recon_auto_gating_e		: 1;
> +		u32 filterd_auto_gating_e	: 1;
> +		u32 bus_auto_gating_e		: 1;
> +		u32 ctrl_auto_gating_e		: 1;
> +		u32 rcb_auto_gating_e		: 1;
> +		u32 err_prc_auto_gating_e	: 1;
> +		u32 reserve0			: 22;
> +	} reg010;
> +
> +	struct swreg011_cfg_para {
> +		u32 reserve0			: 9;
> +		u32 dec_timeout_dis		: 1;
> +		u32 reserve1			: 22;
> +	} reg011;
> +
> +	struct swreg012_cache_hash_mask {
> +		u32 reserve0			: 7;
> +		u32 cache_hash_mask		: 25;
> +	} reg012;
> +
> +	u32 reg013_core_timeout_threshold;
> +
> +	struct swreg014_line_irq_ctrl {
> +		u32 dec_line_irq_step		: 16;
> +		u32 dec_line_offset_y_st	: 16;
> +	} reg014;
> +
> +	struct swreg015_irq_sta {
> +		u32 rkvdec_frame_rdy_sta	: 1;
> +		u32 rkvdec_strm_error_sta	: 1;
> +		u32 rkvdec_core_timeout_sta	: 1;
> +		u32 rkvdec_ip_timeout_sta	: 1;
> +		u32 rkvdec_bus_error_sta	: 1;
> +		u32 rkvdec_buffer_empty_sta	: 1;
> +		u32 rkvdec_colmv_ref_error_sta	: 1;
> +		u32 rkvdec_error_spread_sta	: 1;
> +		u32 create_core_timeout_sta	: 1;
> +		u32 wlast_miss_match_sta	: 1;
> +		u32 rkvdec_core_rst_rdy_sta	: 1;
> +		u32 rkvdec_ip_rst_rdy_sta	: 1;
> +		u32 force_busidle_rdy_sta	: 1;
> +		u32 ltb_pause_rdy_sta		: 1;
> +		u32 ltb_end_flag		: 1;
> +		u32 unsupport_decmode_error_sta	: 1;
> +		u32 wmask_bits			: 15;
> +		u32 reserve0			: 1;
> +	} reg015;
> +
> +	struct swreg016_error_ctrl_set {
> +		u32 error_proc_disable		: 1;
> +		u32 reserve0			: 7;
> +		u32 error_spread_disable	: 1;
> +		u32 reserve1			: 15;
> +		u32 roi_error_ctu_cal_en	: 1;
> +		u32 reserve2			: 7;
> +	} reg016;
> +
> +	struct swreg017_err_roi_ctu_offset_start {
> +		u32 roi_x_ctu_offset_st		: 12;
> +		u32 reserve0			: 4;
> +		u32 roi_y_ctu_offset_st		: 12;
> +		u32 reserve1			: 4;
> +	} reg017;
> +
> +	struct swreg018_err_roi_ctu_offset_end {
> +		u32 roi_x_ctu_offset_end	: 12;
> +		u32 reserve0			: 4;
> +		u32 roi_y_ctu_offset_end	: 12;
> +		u32 reserve1			: 4;
> +	} reg018;
> +
> +	struct swreg019_error_ref_info {
> +		u32 avs2_ref_error_field	: 1;
> +		u32 avs2_ref_error_topfield	: 1;
> +		u32 ref_error_topfield_used	: 1;
> +		u32 ref_error_botfield_used	: 1;
> +		u32 reserve0			: 28;
> +	} reg019;
> +
> +	u32 reg020_cabac_error_en_lowbits;
> +	u32 reg021_cabac_error_en_highbits;
> +
> +	u32 reg022_reserved;
> +
> +	struct swreg023_invalid_pixel_fill {
> +		u32 fill_y			: 10;
> +		u32 fill_u			: 10;
> +		u32 fill_v			: 10;
> +		u32 reserve0			: 2;
> +	} reg023;
> +
> +	u32 reg024_026_reserved[3];
> +
> +	struct swreg027_align_en {
> +		u32 reserve0			: 4;
> +		u32 ctu_align_wr_en		: 1;
> +		u32 reserve1			: 27;
> +	} reg027;
> +
> +	struct swreg028_debug_perf_latency_ctrl0 {
> +		u32 axi_perf_work_e		: 1;
> +		u32 reserve0			: 2;
> +		u32 axi_cnt_type		: 1;
> +		u32 rd_latency_id		: 8;
> +		u32 reserve1			: 4;
> +		u32 rd_latency_thr		: 12;
> +		u32 reserve2			: 4;
> +	} reg028;
> +
> +	struct swreg029_debug_perf_latency_ctrl1 {
> +		u32 addr_align_type		: 2;
> +		u32 ar_cnt_id_type		: 1;
> +		u32 aw_cnt_id_type		: 1;
> +		u32 ar_count_id			: 8;
> +		u32 reserve0			: 4;
> +		u32 aw_count_id			: 8;
> +		u32 rd_band_width_mode		: 1;
> +		u32 reserve1			: 7;
> +	} reg029;
> +
> +	struct swreg030_qos_ctrl {
> +		u32 axi_wr_qos_level		: 4;
> +		u32 reserve0			: 4;
> +		u32 axi_wr_qos			: 4;
> +		u32 reserve1			: 4;
> +		u32 axi_rd_qos_level		: 4;
> +		u32 reserve2			: 4;
> +		u32 axi_rd_qos			: 4;
> +		u32 reserve3			: 4;
> +	} reg030;
> +};
> +
> +struct vdpu383_regs_common_addr {
> +	u32 reg128_strm_base;
> +	u32 reg129_rps_base;
> +	u32 reg130_cabactbl_base;
> +	u32 reg131_gbl_base;
> +	u32 reg132_scanlist_addr;
> +	u32 reg133_scale_down_base;
> +	u32 reg134_fgs_base;
> +	u32 reg135_139_reserved[5];
> +
> +	struct rcb_info {
> +	u32 offset;
> +	u32 size;
> +	} reg140_162_rcb_info[11];
> +};
> +
> +struct vdpu383_regs_h26x_addr {
> +	u32 reg168_decout_base;
> +	u32 reg169_error_ref_base;
> +	u32 reg170_185_ref_base[16];
> +	u32 reg186_191_reserved[6];
> +	u32 reg192_payload_st_cur_base;
> +	u32 reg193_fbc_payload_offset;
> +	u32 reg194_payload_st_error_ref_base;
> +	u32 reg195_210_payload_st_ref_base[16];
> +	u32 reg211_215_reserved[5];
> +	u32 reg216_colmv_cur_base;
> +	u32 reg217_232_colmv_ref_base[16];
> +};
> +
> +struct vdpu383_regs_h26x_params {
> +	u32 reg064_start_decoder;
> +	u32 reg065_strm_start_bit;
> +	u32 reg066_stream_len;
> +	u32 reg067_global_len;
> +	u32 reg068_hor_virstride;
> +	u32 reg069_raster_uv_hor_virstride;
> +	u32 reg070_y_virstride;
> +	u32 reg071_scl_ref_hor_virstride;
> +	u32 reg072_scl_ref_raster_uv_hor_virstride;
> +	u32 reg073_scl_ref_virstride;
> +	u32 reg074_fgs_ref_hor_virstride;
> +	u32 reg075_079_reserved[5];
> +	u32 reg080_error_ref_hor_virstride;
> +	u32 reg081_error_ref_raster_uv_hor_virstride;
> +	u32 reg082_error_ref_virstride;
> +	u32 reg083_ref0_hor_virstride;
> +	u32 reg084_ref0_raster_uv_hor_virstride;
> +	u32 reg085_ref0_virstride;
> +	u32 reg086_ref1_hor_virstride;
> +	u32 reg087_ref1_raster_uv_hor_virstride;
> +	u32 reg088_ref1_virstride;
> +	u32 reg089_ref2_hor_virstride;
> +	u32 reg090_ref2_raster_uv_hor_virstride;
> +	u32 reg091_ref2_virstride;
> +	u32 reg092_ref3_hor_virstride;
> +	u32 reg093_ref3_raster_uv_hor_virstride;
> +	u32 reg094_ref3_virstride;
> +	u32 reg095_ref4_hor_virstride;
> +	u32 reg096_ref4_raster_uv_hor_virstride;
> +	u32 reg097_ref4_virstride;
> +	u32 reg098_ref5_hor_virstride;
> +	u32 reg099_ref5_raster_uv_hor_virstride;
> +	u32 reg100_ref5_virstride;
> +	u32 reg101_ref6_hor_virstride;
> +	u32 reg102_ref6_raster_uv_hor_virstride;
> +	u32 reg103_ref6_virstride;
> +	u32 reg104_ref7_hor_virstride;
> +	u32 reg105_ref7_raster_uv_hor_virstride;
> +	u32 reg106_ref7_virstride;
> +};
> +
> +struct vdpu383_regs_h26x {
> +	struct vdpu383_regs_common		common;		/* 8-30 */
> +	struct vdpu383_regs_h26x_params		h26x_params;	/* 64-74, 80-106 */
> +	struct vdpu383_regs_common_addr		common_addr;	/* 128-134, 140-161 */
> +	struct vdpu383_regs_h26x_addr		h26x_addr;	/* 168-185, 192-210, 216-232 =
*/
> +} __packed;
> +
> +#endif /* __RKVDEC_VDPU838_REGS_H__ */
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index ecf6b9051543..1837f12f1aa1 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -9,6 +9,7 @@
> =C2=A0 * Copyright (C) 2011 Samsung Electronics Co., Ltd.
> =C2=A0 */
> =C2=A0
> +#include <linux/hw_bitfield.h>
> =C2=A0#include <linux/clk.h>
> =C2=A0#include <linux/genalloc.h>
> =C2=A0#include <linux/interrupt.h>
> @@ -30,6 +31,7 @@
> =C2=A0#include "rkvdec.h"
> =C2=A0#include "rkvdec-regs.h"
> =C2=A0#include "rkvdec-vdpu381-regs.h"
> +#include "rkvdec-vdpu383-regs.h"
> =C2=A0#include "rkvdec-rcb.h"
> =C2=A0
> =C2=A0static bool rkvdec_image_fmt_match(enum rkvdec_image_fmt fmt1,
> @@ -86,17 +88,27 @@ static bool rkvdec_is_valid_fmt(struct rkvdec_ctx *ct=
x, u32 fourcc,
> =C2=A0	return false;
> =C2=A0}
> =C2=A0
> +static u32 rkvdec_colmv_size(u16 width, u16 height)
> +{
> +	return 128 * DIV_ROUND_UP(width, 16) * DIV_ROUND_UP(height, 16);
> +}
> +
> +static u32 rkvdec_vdpu383_colmv_size(u16 width, u16 height)
> +{
> +	return ALIGN(width, 64) * ALIGN(height, 16);
> +}
> +
> =C2=A0static void rkvdec_fill_decoded_pixfmt(struct rkvdec_ctx *ctx,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_pix_format_mpl=
ane *pix_mp)
> =C2=A0{
> +	const struct rkvdec_config *cfg =3D ctx->dev->variant->config;
> +
> =C2=A0	v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat,
> =C2=A0			=C2=A0=C2=A0=C2=A0 pix_mp->width, pix_mp->height);
> =C2=A0
> =C2=A0	ctx->colmv_offset =3D pix_mp->plane_fmt[0].sizeimage;
> =C2=A0
> -	pix_mp->plane_fmt[0].sizeimage +=3D 128 *
> -		DIV_ROUND_UP(pix_mp->width, 16) *
> -		DIV_ROUND_UP(pix_mp->height, 16);
> +	pix_mp->plane_fmt[0].sizeimage +=3D cfg->colmv_size(pix_mp->width, pix_=
mp->height);
> =C2=A0}
> =C2=A0
> =C2=A0static void rkvdec_reset_fmt(struct rkvdec_ctx *ctx, struct v4l2_fo=
rmat *f,
> @@ -391,6 +403,26 @@ static const struct rkvdec_coded_fmt_desc vdpu381_co=
ded_fmts[] =3D {
> =C2=A0	},
> =C2=A0};
> =C2=A0
> +static const struct rkvdec_coded_fmt_desc vdpu383_coded_fmts[] =3D {
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_H264_SLICE,
> +		.frmsize =3D {
> +			.min_width =3D 64,
> +			.max_width =3D=C2=A0 65520,
> +			.step_width =3D 64,
> +			.min_height =3D 64,
> +			.max_height =3D=C2=A0 65520,
> +			.step_height =3D 16,

Could possibly be initialize with a common macro since it seems shared.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> +		},
> +		.ctrls =3D &rkvdec_h264_ctrls,
> +		.ops =3D &rkvdec_vdpu383_h264_fmt_ops,
> +		.num_decoded_fmts =3D ARRAY_SIZE(rkvdec_h264_decoded_fmts),
> +		.decoded_fmts =3D rkvdec_h264_decoded_fmts,
> +		.subsystem_flags =3D VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
> +		.capability =3D RKVDEC_CAPABILITY_H264,
> +	},
> +};
> +
> =C2=A0static bool rkvdec_is_capable(struct rkvdec_ctx *ctx, unsigned int =
capability)
> =C2=A0{
> =C2=A0	return (ctx->dev->variant->capabilities & capability) =3D=3D capab=
ility;
> @@ -1294,6 +1326,35 @@ static irqreturn_t vdpu381_irq_handler(struct rkvd=
ec_ctx *ctx)
> =C2=A0	return IRQ_HANDLED;
> =C2=A0}
> =C2=A0
> +static irqreturn_t vdpu383_irq_handler(struct rkvdec_ctx *ctx)
> +{
> +	struct rkvdec_dev *rkvdec =3D ctx->dev;
> +	enum vb2_buffer_state state;
> +	bool need_reset =3D 0;
> +	u32 status;
> +
> +	status =3D readl(rkvdec->link + VDPU383_LINK_STA_INT);
> +	writel(FIELD_PREP_WM16(VDPU383_STA_INT_ALL, 0), rkvdec->link + VDPU383_=
LINK_STA_INT);
> +	/* On vdpu383, the interrupts must be disabled */
> +	writel(FIELD_PREP_WM16(VDPU383_INT_EN_IRQ | VDPU383_INT_EN_LINE_IRQ, 0)=
,
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->link + VDPU383_LINK_INT_EN=
);
> +
> +	if (status & VDPU383_STA_INT_DEC_RDY_STA) {
> +		state =3D VB2_BUF_STATE_DONE;
> +	} else {
> +		state =3D VB2_BUF_STATE_ERROR;
> +		rkvdec_iommu_restore(rkvdec);
> +	}
> +
> +	if (need_reset)
> +		rkvdec_iommu_restore(rkvdec);
> +
> +	if (cancel_delayed_work(&rkvdec->watchdog_work))
> +		rkvdec_job_finish(ctx, state);
> +
> +	return IRQ_HANDLED;
> +}
> +
> =C2=A0static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
> =C2=A0{
> =C2=A0	struct rkvdec_dev *rkvdec =3D priv;
> @@ -1365,6 +1426,7 @@ static const struct rkvdec_config config_rkvdec =3D=
 {
> =C2=A0	.coded_fmts =3D rkvdec_coded_fmts,
> =C2=A0	.coded_fmts_num =3D ARRAY_SIZE(rkvdec_coded_fmts),
> =C2=A0	.irq_handler =3D rk3399_irq_handler,
> +	.colmv_size =3D rkvdec_colmv_size,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct rcb_size_info vdpu381_rcb_sizes[] =3D {
> @@ -1386,6 +1448,31 @@ static const struct rkvdec_config config_vdpu381 =
=3D {
> =C2=A0	.rcb_size_info =3D vdpu381_rcb_sizes,
> =C2=A0	.rcb_num =3D ARRAY_SIZE(vdpu381_rcb_sizes),
> =C2=A0	.irq_handler =3D vdpu381_irq_handler,
> +	.colmv_size =3D rkvdec_colmv_size,
> +	.named_regs =3D true,
> +};
> +
> +static const struct rcb_size_info vdpu383_rcb_sizes[] =3D {
> +	{6,	PIC_WIDTH},	// streamd
> +	{6,	PIC_WIDTH},	// streamd_tile
> +	{12,	PIC_WIDTH},	// inter
> +	{12,	PIC_WIDTH},	// inter_tile
> +	{16,	PIC_WIDTH},	// intra
> +	{10,	PIC_WIDTH},	// intra_tile
> +	{120,	PIC_WIDTH},	// filterd
> +	{120,	PIC_WIDTH},	// filterd_protect
> +	{120,	PIC_WIDTH},	// filterd_tile_row
> +	{180,	PIC_HEIGHT},	// filterd_tile_col
> +};
> +
> +static const struct rkvdec_config config_vdpu383 =3D {
> +	.coded_fmts =3D vdpu383_coded_fmts,
> +	.coded_fmts_num =3D ARRAY_SIZE(vdpu383_coded_fmts),
> +	.rcb_size_info =3D vdpu383_rcb_sizes,
> +	.rcb_num =3D ARRAY_SIZE(vdpu383_rcb_sizes),
> +	.irq_handler =3D vdpu383_irq_handler,
> +	.colmv_size =3D rkvdec_vdpu383_colmv_size,
> +	.named_regs =3D true,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct rkvdec_variant rk3288_rkvdec_variant =3D {
> @@ -1416,6 +1503,11 @@ static const struct rkvdec_variant rk3588_vdpu381_=
variant =3D {
> =C2=A0	.capabilities =3D RKVDEC_CAPABILITY_H264,
> =C2=A0};
> =C2=A0
> +static const struct rkvdec_variant rk3576_vdpu383_variant =3D {
> +	.config =3D &config_vdpu383,
> +	.capabilities =3D RKVDEC_CAPABILITY_H264,
> +};
> +
> =C2=A0static const struct of_device_id of_rkvdec_match[] =3D {
> =C2=A0	{
> =C2=A0		.compatible =3D "rockchip,rk3288-vdec",
> @@ -1433,6 +1525,10 @@ static const struct of_device_id of_rkvdec_match[]=
 =3D {
> =C2=A0		.compatible =3D "rockchip,rk3588-vdec",
> =C2=A0		.data =3D &rk3588_vdpu381_variant,
> =C2=A0	},
> +	{
> +		.compatible =3D "rockchip,rk3576-vdec",
> +		.data =3D &rk3576_vdpu383_variant,
> +	},
> =C2=A0	{ /* sentinel */ }
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(of, of_rkvdec_match);
> @@ -1468,9 +1564,19 @@ static int rkvdec_probe(struct platform_device *pd=
ev)
> =C2=A0	rkvdec->clk_count =3D ret;
> =C2=A0	rkvdec->axi_clk =3D devm_clk_get(&pdev->dev, "axi");
> =C2=A0
> -	rkvdec->regs =3D devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(rkvdec->regs))
> -		return PTR_ERR(rkvdec->regs);
> +	if (rkvdec->variant->config->named_regs) {
> +		rkvdec->regs =3D devm_platform_ioremap_resource_byname(pdev, "function=
");
> +		if (IS_ERR(rkvdec->regs))
> +			return PTR_ERR(rkvdec->regs);
> +
> +		rkvdec->link =3D devm_platform_ioremap_resource_byname(pdev, "link");
> +		if (IS_ERR(rkvdec->link))
> +			return PTR_ERR(rkvdec->link);
> +	} else {
> +		rkvdec->regs =3D devm_platform_ioremap_resource(pdev, 0);
> +		if (IS_ERR(rkvdec->regs))
> +			return PTR_ERR(rkvdec->regs);
> +	}
> =C2=A0
> =C2=A0	ret =3D dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
> =C2=A0	if (ret) {
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.h
> index 5b86f5b85d20..e752706e9f5c 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -122,6 +122,8 @@ struct rkvdec_config {
> =C2=A0	const struct rcb_size_info *rcb_size_info;
> =C2=A0	size_t rcb_num;
> =C2=A0	irqreturn_t (*irq_handler)(struct rkvdec_ctx *ctx);
> +	u32 (*colmv_size)(u16 width, u16 height);
> +	bool named_regs;
> =C2=A0};
> =C2=A0
> =C2=A0struct rkvdec_dev {
> @@ -134,6 +136,7 @@ struct rkvdec_dev {
> =C2=A0	unsigned int clk_count;
> =C2=A0	struct clk *axi_clk;
> =C2=A0	void __iomem *regs;
> +	void __iomem *link;
> =C2=A0	struct mutex vdev_lock; /* serializes ioctls */
> =C2=A0	struct delayed_work watchdog_work;
> =C2=A0	struct gen_pool *sram_pool;
> @@ -178,10 +181,15 @@ void rkvdec_memcpy_toio(void __iomem *dst, void *sr=
c, size_t len);
> =C2=A0
> =C2=A0void rkvdec_quirks_disable_qos(struct rkvdec_ctx *ctx);
> =C2=A0
> +/* RKVDEC ops */
> =C2=A0extern const struct rkvdec_coded_fmt_ops rkvdec_h264_fmt_ops;
> =C2=A0extern const struct rkvdec_coded_fmt_ops rkvdec_hevc_fmt_ops;
> =C2=A0extern const struct rkvdec_coded_fmt_ops rkvdec_vp9_fmt_ops;
> =C2=A0
> +/* VDPU381 ops */
> =C2=A0extern const struct rkvdec_coded_fmt_ops rkvdec_vdpu381_h264_fmt_op=
s;
> =C2=A0
> +/* VDPU383 ops */
> +extern const struct rkvdec_coded_fmt_ops rkvdec_vdpu383_h264_fmt_ops;
> +
> =C2=A0#endif /* RKVDEC_H_ */

--=-ibF1Tqtlwr5sGnH3ZWWo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTnb2AAKCRDZQZRRKWBy
9P1nAPsECfV0dOhY/nRUhh7AXNsDQszEAqO1b7ieuZR8jgRgWQD+Kh0YwCDVyUGc
u6VFC07+ZdF74exW21MTUnkVrAlu2Qc=
=mmn6
-----END PGP SIGNATURE-----

--=-ibF1Tqtlwr5sGnH3ZWWo--

