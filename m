Return-Path: <linux-media+bounces-48594-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 00074CB3FB9
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 21:42:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 842CD3063C2A
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 20:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C5D32BF55;
	Wed, 10 Dec 2025 20:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="i9osXQI4"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737F74D8CE;
	Wed, 10 Dec 2025 20:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765399290; cv=none; b=r6NLdLHALip0pBKjMNioC5uxjgznsF9ld6R9Hr8LmlryLTgOxN3n5+rJgTykeD2dza+thzAIr4apuUrlwbzJhBxjQgOd1rpme18g/rVYPCdpUz1UHBsv9w+BqrC6hRU++lqzJeBQwjrTxkMWpkaP8FUYQB7U4uNRDdFXSBc4OjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765399290; c=relaxed/simple;
	bh=xxg+eVsRRNgcuQAmbD/VQAZ4wvJP4j1ClUipKjDK0lM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L+RRbLMCZKBMrz8MB7epST56+1RiHdUkA2aJbG4fuCaM8GsXBW3K28pAnYLmK3Ncb+k1poXE9Vbkwi8Aek11YJW1iUan+MYn+BMmurUPkzz8KeLdosg+4xPd3FRYhBDCdjJ99gMAno+ewUnUWF9tkr82J9nSOY5mO2dE0TsRS04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=i9osXQI4; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765399285;
	bh=xxg+eVsRRNgcuQAmbD/VQAZ4wvJP4j1ClUipKjDK0lM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=i9osXQI4dyfcP+QIcA3LsX7ypiRWDsh678Cx1uP5U6MzDoBv8juF+ugL8Gfb+Tetn
	 7hXaIDnZCQdYkjITxJ6EEet2VRuhtbY+1eAw70D7TBQ14XDXPauso+QqsB7CDXsxFA
	 hF03bnh7rl8KB8A3eOH520Ulk28yyEfEhOaIMbflTLIiY8yRRvMzhTCh6X+LS8pYwR
	 KYciAiFEQI52pUY81ZnY6mPQ6QKlCBdl3qdIOIwrTExCaE13sUXg6w0xX/FCbmzArP
	 weYJ1wVizaSYWcq6jvIk7Y+gCZWqO2P/+p3EkElE6cIyIRFeA+PenLQXfv39GYJc/O
	 p20Ab7ZxM5+VA==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CF3E317E1104;
	Wed, 10 Dec 2025 21:41:23 +0100 (CET)
Message-ID: <70f7b80702ab5ec36f17f3bbee05a4246804b593.camel@collabora.com>
Subject: Re: [PATCH v4 12/15] media: rkvdec: Add H264 support for the
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
Date: Wed, 10 Dec 2025 15:41:22 -0500
In-Reply-To: <20251022174508.284929-13-detlev.casanova@collabora.com>
References: <20251022174508.284929-1-detlev.casanova@collabora.com>
	 <20251022174508.284929-13-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-WGf6PPDPEH2Qx8IWVtuU"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-WGf6PPDPEH2Qx8IWVtuU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 22 octobre 2025 =C3=A0 13:45 -0400, Detlev Casanova a =C3=A9cri=
t=C2=A0:
> This decoder variant is found in Rockchip RK3588 SoC family.
>=20
> Like for rkvdec on rk3399, it supports the NV12, NV15, NV16 and NV20
> output formats and level up to 5.1.
>=20
> The maximum width and height have been significantly increased
> supporting up to 65520 pixels for both.

Did you test the new maximums to make sure it does not explodes somewhere e=
lse ?

Nicolas

>=20
> Also make sure to only expose the first core and ignore the other
> until mutli-core is supported.
>=20
> Fluster score for JVT-AVC_V1 is 129/135.
>=20
> Tested-by: Diederik de Haas <didi.debian@cknow.org>=C2=A0 # Rock 5B
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
> =C2=A0.../media/platform/rockchip/rkvdec/Makefile=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
> =C2=A0.../rockchip/rkvdec/rkvdec-h264-common.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 2 +
> =C2=A0.../rockchip/rkvdec/rkvdec-vdpu381-h264.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
 469 ++++++++++++++++++
> =C2=A0.../rockchip/rkvdec/rkvdec-vdpu381-regs.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
 427 ++++++++++++++++
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.c=C2=A0=C2=A0 | 131 +++++
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.h=C2=A0=C2=A0 |=C2=A0=C2=
=A0 4 +
> =C2=A06 files changed, 1034 insertions(+)
> =C2=A0create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vd=
pu381-h264.c
> =C2=A0create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vd=
pu381-regs.h
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/Makefile b/drivers/me=
dia/platform/rockchip/rkvdec/Makefile
> index 3d75103e536d..7bfd95151e40 100644
> --- a/drivers/media/platform/rockchip/rkvdec/Makefile
> +++ b/drivers/media/platform/rockchip/rkvdec/Makefile
> @@ -8,4 +8,5 @@ rockchip-vdec-y +=3D \
> =C2=A0		=C2=A0=C2=A0 rkvdec-hevc.o \
> =C2=A0		=C2=A0=C2=A0 rkvdec-hevc-common.o \
> =C2=A0		=C2=A0=C2=A0 rkvdec-rcb.o \
> +		=C2=A0=C2=A0 rkvdec-vdpu381-h264.o \
> =C2=A0		=C2=A0=C2=A0 rkvdec-vp9.o
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.h =
b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.h
> index aea346744e4c..3984740e6f42 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.h
> @@ -68,6 +68,8 @@ struct rkvdec_rps {
> =C2=A0	u32 reserved1[66];
> =C2=A0} __packed;
> =C2=A0
> +extern const s8 rkvdec_h264_cabac_table[4][464][2];
> +
> =C2=A0void lookup_ref_buf_idx(struct rkvdec_ctx *ctx, struct rkvdec_h264_=
run *run);
> =C2=A0void assemble_hw_rps(struct v4l2_h264_reflist_builder *builder,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 struct rkvdec_h264_run *run,
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c=
 b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
> new file mode 100644
> index 000000000000..e65a56bc9c63
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
> @@ -0,0 +1,469 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip VDPU381 Video Decoder H264 backend
> + *
> + * Copyright (C) 2024 Collabora, Ltd.
> + *=C2=A0 Detlev Casanova <detlev.casanova@collabora.com>
> + */
> +
> +#include <media/v4l2-h264.h>
> +#include <media/v4l2-mem2mem.h>
> +
> +#include "rkvdec.h"
> +#include "rkvdec-rcb.h"
> +#include "rkvdec-h264-common.h"
> +#include "rkvdec-vdpu381-regs.h"
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
> +	u16 pic_width_in_mbs:				12;
> +	u16 pic_height_in_mbs:				12;
> +	u16 frame_mbs_only_flag:			1;
> +	u16 mb_adaptive_frame_field_flag:		1;
> +	u16 direct_8x8_inference_flag:			1;
> +	u16 mvc_extension_enable:			1;
> +	u16 num_views:					2;
> +
> +	u16 reserved_bits:				12;
> +	u16 reserved[11];
> +} __packed;
> +
> +struct rkvdec_pps {
> +	u16 pic_parameter_set_id:				8;
> +	u16 pps_seq_parameter_set_id:				5;
> +	u16 entropy_coding_mode_flag:				1;
> +	u16 bottom_field_pic_order_in_frame_present_flag:	1;
> +	u16 num_ref_idx_l0_default_active_minus1:		5;
> +	u16 num_ref_idx_l1_default_active_minus1:		5;
> +	u16 weighted_pred_flag:					1;
> +	u16 weighted_bipred_idc:				2;
> +	u16 pic_init_qp_minus26:				7;
> +	u16 pic_init_qs_minus26:				6;
> +	u16 chroma_qp_index_offset:				5;
> +	u16 deblocking_filter_control_present_flag:		1;
> +	u16 constrained_intra_pred_flag:			1;
> +	u16 redundant_pic_cnt_present:				1;
> +	u16 transform_8x8_mode_flag:				1;
> +	u16 second_chroma_qp_index_offset:			5;
> +	u16 scaling_list_enable_flag:				1;
> +	u32 scaling_list_address;
> +	u16 is_longterm;
> +
> +	u8 reserved[3];
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
> +};
> +
> +struct rkvdec_h264_ctx {
> +	struct rkvdec_aux_buf priv_tbl;
> +	struct rkvdec_h264_reflists reflists;
> +	struct rkvdec_vdpu381_regs_h264 regs;
> +};
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
> +	dma_addr_t scaling_list_address;
> +	u32 scaling_distance;
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
> +	hw_ps->sps.mvc_extension_enable =3D 1;
> +	hw_ps->sps.num_views =3D 1;
> +
> +	/*
> +	 * Use the SPS values since they are already in macroblocks
> +	 * dimensions, height can be field height (halved) if
> +	 * V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY is not set and also it allows
> +	 * decoding smaller images into larger allocation which can be used
> +	 * to implementing SVC spatial layer support.
> +	 */
> +	hw_ps->sps.pic_width_in_mbs =3D sps->pic_width_in_mbs_minus1 + 1;
> +	hw_ps->sps.pic_height_in_mbs =3D sps->pic_height_in_map_units_minus1 + =
1;
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
> +	/*
> +	 * To be on the safe side, program the scaling matrix address
> +	 */
> +	scaling_distance =3D offsetof(struct rkvdec_h264_priv_tbl, scaling_list=
);
> +	scaling_list_address =3D h264_ctx->priv_tbl.dma + scaling_distance;
> +	hw_ps->pps.scaling_list_address =3D scaling_list_address;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
> +		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
> +			hw_ps->pps.is_longterm |=3D (1 << i);
> +	}
> +}
> +
> +static void rkvdec_write_regs(struct rkvdec_ctx *ctx)
> +{
> +	struct rkvdec_dev *rkvdec =3D ctx->dev;
> +	struct rkvdec_h264_ctx *h264_ctx =3D ctx->priv;
> +
> +	rkvdec_memcpy_toio(rkvdec->regs + OFFSET_COMMON_REGS,
> +			=C2=A0=C2=A0 &h264_ctx->regs.common,
> +			=C2=A0=C2=A0 sizeof(h264_ctx->regs.common));
> +	rkvdec_memcpy_toio(rkvdec->regs + OFFSET_CODEC_PARAMS_REGS,
> +			=C2=A0=C2=A0 &h264_ctx->regs.h264_param,
> +			=C2=A0=C2=A0 sizeof(h264_ctx->regs.h264_param));
> +	rkvdec_memcpy_toio(rkvdec->regs + OFFSET_COMMON_ADDR_REGS,
> +			=C2=A0=C2=A0 &h264_ctx->regs.common_addr,
> +			=C2=A0=C2=A0 sizeof(h264_ctx->regs.common_addr));
> +	rkvdec_memcpy_toio(rkvdec->regs + OFFSET_CODEC_ADDR_REGS,
> +			=C2=A0=C2=A0 &h264_ctx->regs.h264_addr,
> +			=C2=A0=C2=A0 sizeof(h264_ctx->regs.h264_addr));
> +	rkvdec_memcpy_toio(rkvdec->regs + OFFSET_POC_HIGHBIT_REGS,
> +			=C2=A0=C2=A0 &h264_ctx->regs.h264_highpoc,
> +			=C2=A0=C2=A0 sizeof(h264_ctx->regs.h264_highpoc));
> +}
> +
> +static void config_registers(struct rkvdec_ctx *ctx,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct rkvdec_h264_run *run)
> +{
> +	const struct v4l2_ctrl_h264_decode_params *dec_params =3D run->decode_p=
arams;
> +	const struct v4l2_h264_dpb_entry *dpb =3D dec_params->dpb;
> +	struct rkvdec_h264_ctx *h264_ctx =3D ctx->priv;
> +	dma_addr_t priv_start_addr =3D h264_ctx->priv_tbl.dma;
> +	const struct v4l2_pix_format_mplane *dst_fmt;
> +	struct vb2_v4l2_buffer *src_buf =3D run->base.bufs.src;
> +	struct vb2_v4l2_buffer *dst_buf =3D run->base.bufs.dst;
> +	struct rkvdec_vdpu381_regs_h264 *regs =3D &h264_ctx->regs;
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
> +	regs->common.reg009.dec_mode =3D VDPU381_MODE_H264;
> +
> +	/* Set config */
> +	regs->common.reg011.buf_empty_en =3D 1;
> +	regs->common.reg011.dec_clkgate_e =3D 1;
> +	regs->common.reg011.dec_timeout_e =3D 1;
> +	regs->common.reg011.pix_range_detection_e =3D 1;
> +
> +	/*
> +	 * Even though the scan list address can be set in RPS,
> +	 * with some frames, it will try to use the address set in the register=
.
> +	 */
> +	regs->common.reg012.scanlist_addr_valid_en =3D 1;
> +
> +	/* Set IDR flag */
> +	regs->common.reg013.cur_pic_is_idr =3D
> +		!!(dec_params->flags & V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC);
> +
> +	/* Set input stream length */
> +	regs->common.stream_len =3D vb2_get_plane_payload(&src_buf->vb2_buf, 0)=
;
> +
> +	/* Set max slice number */
> +	regs->common.reg017.slice_num =3D MAX_SLICE_NUMBER;
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
> +	else
> +		regs->common.timeout_threshold =3D RKVDEC_TIMEOUT_MAX;
> +
> +	/* Set TOP and BOTTOM POCs */
> +	regs->h264_param.cur_top_poc =3D dec_params->top_field_order_cnt;
> +	regs->h264_param.cur_bot_poc =3D dec_params->bottom_field_order_cnt;
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
> +		regs->h264_addr.ref_base[i] =3D buf_dma;
> +
> +		/* Set COLMV addresses */
> +		regs->h264_addr.colmv_base[i] =3D buf_dma + ctx->colmv_offset;
> +
> +		struct rkvdec_vdpu381_h264_ref_info *ref_info =3D
> +			&regs->h264_param.ref_info_regs[i / 4].ref_info[i % 4];
> +
> +		ref_info->ref_field =3D
> +			!!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_FIELD);
> +		ref_info->ref_colmv_use_flag =3D
> +			!!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE);
> +		ref_info->ref_topfield_used =3D
> +			!!(dpb[i].fields & V4L2_H264_TOP_FIELD_REF);
> +		ref_info->ref_botfield_used =3D
> +			!!(dpb[i].fields & V4L2_H264_BOTTOM_FIELD_REF);
> +
> +		regs->h264_param.ref_pocs[i * 2] =3D
> +			dpb[i].top_field_order_cnt;
> +		regs->h264_param.ref_pocs[i * 2 + 1] =3D
> +			dpb[i].bottom_field_order_cnt;
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
> +	offset =3D offsetof(struct rkvdec_h264_priv_tbl, param_set);
> +	regs->h264_addr.pps_base =3D priv_start_addr + offset;
> +
> +	/* Set hw rps address */
> +	offset =3D offsetof(struct rkvdec_h264_priv_tbl, rps);
> +	regs->h264_addr.rps_base =3D priv_start_addr + offset;
> +
> +	/* Set cabac table */
> +	offset =3D offsetof(struct rkvdec_h264_priv_tbl, cabac_table);
> +	regs->h264_addr.cabactbl_base =3D priv_start_addr + offset;
> +
> +	offset =3D offsetof(struct rkvdec_h264_priv_tbl, scaling_list);
> +	regs->h264_addr.scanlist_addr =3D priv_start_addr + offset;
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
> +	struct rkvdec_h264_priv_tbl *tbl =3D h264_ctx->priv_tbl.cpu;
> +	struct rkvdec_h264_run run;
> +	u32 watchdog_time;
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
> +	u64 timeout_threshold =3D h264_ctx->regs.common.timeout_threshold;
> +	unsigned long axi_rate =3D clk_get_rate(rkvdec->axi_clk);
> +
> +	if (axi_rate)
> +		watchdog_time =3D 2 * (1000 * timeout_threshold) / axi_rate;
> +	else
> +		watchdog_time =3D 2000;
> +	schedule_delayed_work(&rkvdec->watchdog_work,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(watchdog_time));
> +
> +	/* Start decoding! */
> +	writel(VDPU381_DEC_E_BIT, rkvdec->regs + VDPU381_REG_DEC_E);
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
> +const struct rkvdec_coded_fmt_ops rkvdec_vdpu381_h264_fmt_ops =3D {
> +	.adjust_fmt =3D rkvdec_h264_adjust_fmt,
> +	.get_image_fmt =3D rkvdec_h264_get_image_fmt,
> +	.start =3D rkvdec_h264_start,
> +	.stop =3D rkvdec_h264_stop,
> +	.run =3D rkvdec_h264_run,
> +	.try_ctrl =3D rkvdec_h264_try_ctrl,
> +};
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h=
 b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h
> new file mode 100644
> index 000000000000..11b545e9ee7e
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h
> @@ -0,0 +1,427 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip VDPU381 Video Decoder driver registers description
> + *
> + * Copyright (C) 2024 Collabora, Ltd.
> + *=C2=A0 Detlev Casanova <detlev.casanova@collabora.com>
> + */
> +
> +#include <linux/types.h>
> +
> +#ifndef _RKVDEC_REGS_H_
> +#define _RKVDEC_REGS_H_
> +
> +#define OFFSET_COMMON_REGS		(8 * sizeof(u32))
> +#define OFFSET_CODEC_PARAMS_REGS	(64 * sizeof(u32))
> +#define OFFSET_COMMON_ADDR_REGS		(128 * sizeof(u32))
> +#define OFFSET_CODEC_ADDR_REGS		(160 * sizeof(u32))
> +#define OFFSET_POC_HIGHBIT_REGS		(200 * sizeof(u32))
> +
> +#define VDPU381_MODE_HEVC	0
> +#define VDPU381_MODE_H264	1
> +#define VDPU381_MODE_VP9	2
> +#define VDPU381_MODE_AVS2	3
> +
> +#define MAX_SLICE_NUMBER	0x3fff
> +
> +#define RKVDEC_1080P_PIXELS		(1920 * 1080)
> +#define RKVDEC_4K_PIXELS		(4096 * 2304)
> +#define RKVDEC_8K_PIXELS		(7680 * 4320)
> +#define RKVDEC_TIMEOUT_1080p		(0xefffff)
> +#define RKVDEC_TIMEOUT_4K		(0x2cfffff)
> +#define RKVDEC_TIMEOUT_8K		(0x4ffffff)
> +#define RKVDEC_TIMEOUT_MAX		(0xffffffff)
> +
> +#define VDPU381_REG_DEC_E		0x028
> +#define VDPU381_DEC_E_BIT		1
> +
> +#define VDPU381_REG_IMPORTANT_EN	0x02c
> +#define VDPU381_DEC_IRQ_DISABLE	BIT(4)
> +
> +#define VDPU381_REG_STA_INT		0x380
> +#define VDPU381_STA_INT_DEC_RDY_STA	BIT(2)
> +#define VDPU381_STA_INT_ERROR		BIT(4)
> +#define VDPU381_STA_INT_TIMEOUT		BIT(5)
> +#define VDPU381_STA_INT_SOFTRESET_RDY	BIT(9)
> +
> +/* base: OFFSET_COMMON_REGS */
> +struct rkvdec_vdpu381_regs_common {
> +	struct rkvdec_vdpu381_in_out {
> +		u32 in_endian		: 1;
> +		u32 in_swap32_e		: 1;
> +		u32 in_swap64_e		: 1;
> +		u32 str_endian		: 1;
> +		u32 str_swap32_e	: 1;
> +		u32 str_swap64_e	: 1;
> +		u32 out_endian		: 1;
> +		u32 out_swap32_e	: 1;
> +		u32 out_cbcr_swap	: 1;
> +		u32 out_swap64_e	: 1;
> +		u32 reserved		: 22;
> +	} reg008;
> +
> +	struct rkvdec_vdpu381_dec_mode {
> +		u32 dec_mode	: 10;
> +		u32 reserved	: 22;
> +	} reg009;
> +
> +	struct rkvdec_vdpu381_dec_e {
> +		u32 dec_e	: 1;
> +		u32 reserved	: 31;
> +	} reg010;
> +
> +	struct rkvdec_vdpu381_important_en {
> +		u32 reserved			: 1;
> +		u32 dec_clkgate_e		: 1;
> +		u32 dec_e_strmd_clkgate_dis	: 1;
> +		u32 reserved0			: 1;
> +
> +		u32 dec_irq_dis			: 1;
> +		u32 dec_timeout_e		: 1;
> +		u32 buf_empty_en		: 1;
> +		u32 reserved1			: 3;
> +
> +		u32 dec_e_rewrite_valid		: 1;
> +		u32 reserved2			: 9;
> +		u32 softrst_en_p		: 1;
> +		u32 force_softreset_valid	: 1;
> +		u32 reserved3			: 2;
> +		u32 pix_range_detection_e	: 1;
> +		u32 reserved4			: 7;
> +	} reg011;
> +
> +	struct rkvdec_vdpu381_sencodary_en {
> +		u32 wr_ddr_align_en		: 1;
> +		u32 colmv_compress_en		: 1;
> +		u32 fbc_e			: 1;
> +		u32 reserved0			: 1;
> +
> +		u32 buspr_slot_disable		: 1;
> +		u32 error_info_en		: 1;
> +		u32 info_collect_en		: 1;
> +		u32 wait_reset_en		: 1;
> +
> +		u32 scanlist_addr_valid_en	: 1;
> +		u32 scale_down_en		: 1;
> +		u32 error_cfg_wr_disable	: 1;
> +		u32 reserved1			: 21;
> +	} reg012;
> +
> +	struct rkvdec_vdpu381_en_mode_set {
> +		u32 timeout_mode		: 1;
> +		u32 req_timeout_rst_sel		: 1;
> +		u32 reserved0			: 1;
> +		u32 dec_commonirq_mode		: 1;
> +		u32 reserved1			: 2;
> +		u32 stmerror_waitdecfifo_empty	: 1;
> +		u32 reserved2			: 2;
> +		u32 h26x_streamd_error_mode	: 1;
> +		u32 reserved3			: 2;
> +		u32 allow_not_wr_unref_bframe	: 1;
> +		u32 fbc_output_wr_disable	: 1;
> +		u32 reserved4			: 1;
> +		u32 colmv_error_mode		: 1;
> +
> +		u32 reserved5			: 2;
> +		u32 h26x_error_mode		: 1;
> +		u32 reserved6			: 2;
> +		u32 ycacherd_prior		: 1;
> +		u32 reserved7			: 2;
> +		u32 cur_pic_is_idr		: 1;
> +		u32 reserved8			: 1;
> +		u32 right_auto_rst_disable	: 1;
> +		u32 frame_end_err_rst_flag	: 1;
> +		u32 rd_prior_mode		: 1;
> +		u32 rd_ctrl_prior_mode		: 1;
> +		u32 reserved9			: 1;
> +		u32 filter_outbuf_mode		: 1;
> +	} reg013;
> +
> +	struct rkvdec_vdpu381_fbc_param_set {
> +		u32 fbc_force_uncompress	: 1;
> +
> +		u32 reserved0			: 2;
> +		u32 allow_16x8_cp_flag		: 1;
> +		u32 reserved1			: 2;
> +
> +		u32 fbc_h264_exten_4or8_flag	: 1;
> +		u32 reserved2			: 25;
> +	} reg014;
> +
> +	struct rkvdec_vdpu381_stream_param_set {
> +		u32 rlc_mode_direct_write	: 1;
> +		u32 rlc_mode			: 1;
> +		u32 reserved0			: 3;
> +
> +		u32 strm_start_bit		: 7;
> +		u32 reserved1			: 20;
> +	} reg015;
> +
> +	u32 stream_len;
> +
> +	struct rkvdec_vdpu381_slice_number {
> +		u32 slice_num	: 25;
> +		u32 reserved	: 7;
> +	} reg017;
> +
> +	struct rkvdec_vdpu381_y_hor_stride {
> +		u32 y_hor_virstride	: 16;
> +		u32 reserved		: 16;
> +	} reg018;
> +
> +	struct rkvdec_vdpu381_uv_hor_stride {
> +		u32 uv_hor_virstride	: 16;
> +		u32 reserved		: 16;
> +	} reg019;
> +
> +	struct rkvdec_vdpu381_y_stride {
> +		u32 y_virstride		: 28;
> +		u32 reserved		: 4;
> +	} reg020;
> +
> +	struct rkvdec_vdpu381_error_ctrl_set {
> +		u32 inter_error_prc_mode		: 1;
> +		u32 error_intra_mode			: 1;
> +		u32 error_deb_en			: 1;
> +		u32 picidx_replace			: 5;
> +		u32 error_spread_e			: 1;
> +		u32 reserved0				: 3;
> +		u32 error_inter_pred_cross_slice	: 1;
> +		u32 reserved1				: 11;
> +		u32 roi_error_ctu_cal_en		: 1;
> +		u32 reserved2				: 7;
> +	} reg021;
> +
> +	struct rkvdec_vdpu381_err_roi_ctu_offset_start {
> +		u32 roi_x_ctu_offset_st	: 12;
> +		u32 reserved0		: 4;
> +		u32 roi_y_ctu_offset_st	: 12;
> +		u32 reserved1		: 4;
> +	} reg022;
> +
> +	struct rkvdec_vdpu381_err_roi_ctu_offset_end {
> +		u32 roi_x_ctu_offset_end	: 12;
> +		u32 reserved0			: 4;
> +		u32 roi_y_ctu_offset_end	: 12;
> +		u32 reserved1			: 4;
> +	} reg023;
> +
> +	struct rkvdec_vdpu381_cabac_error_en_lowbits {
> +		u32 cabac_err_en_lowbits	: 32;
> +	} reg024;
> +
> +	struct rkvdec_vdpu381_cabac_error_en_highbits {
> +		u32 cabac_err_en_highbits	: 30;
> +		u32 reserved			: 2;
> +	} reg025;
> +
> +	struct rkvdec_vdpu381_block_gating_en {
> +		u32 swreg_block_gating_e	: 20;
> +		u32 reserved			: 11;
> +		u32 reg_cfg_gating_en		: 1;
> +	} reg026;
> +
> +	struct SW027_CORE_SAFE_PIXELS {
> +		u32 core_safe_x_pixels	: 16;
> +		u32 core_safe_y_pixels	: 16;
> +	} reg027;
> +
> +	struct rkvdec_vdpu381_multiply_core_ctrl {
> +		u32 swreg_vp9_wr_prob_idx	: 3;
> +		u32 reserved0			: 1;
> +		u32 swreg_vp9_rd_prob_idx	: 3;
> +		u32 reserved1			: 1;
> +
> +		u32 swreg_ref_req_advance_flag	: 1;
> +		u32 sw_colmv_req_advance_flag	: 1;
> +		u32 sw_poc_only_highbit_flag	: 1;
> +		u32 sw_poc_arb_flag		: 1;
> +
> +		u32 reserved2			: 4;
> +		u32 sw_film_idx			: 10;
> +		u32 reserved3			: 2;
> +		u32 sw_pu_req_mismatch_dis	: 1;
> +		u32 sw_colmv_req_mismatch_dis	: 1;
> +		u32 reserved4			: 2;
> +	} reg028;
> +
> +	struct SW029_SCALE_DOWN_CTRL {
> +		u32 scale_down_hor_ratio	: 2;
> +		u32 reserved0			: 6;
> +		u32 scale_down_vrz_ratio	: 2;
> +		u32 reserved1			: 22;
> +	} reg029;
> +
> +	struct SW032_Y_SCALE_DOWN_TILE8x8_HOR_STRIDE {
> +		u32 y_scale_down_hor_stride	: 20;
> +		u32 reserved0			: 12;
> +	} reg030;
> +
> +	struct SW031_UV_SCALE_DOWN_TILE8x8_HOR_STRIDE {
> +		u32 uv_scale_down_hor_stride	: 20;
> +		u32 reserved0			: 12;
> +	} reg031;
> +
> +	u32 timeout_threshold;
> +} __packed;
> +
> +/* base: OFFSET_COMMON_ADDR_REGS */
> +struct rkvdec_vdpu381_regs_common_addr {
> +	u32 rlc_base;
> +	u32 rlcwrite_base;
> +	u32 decout_base;
> +	u32 colmv_cur_base;
> +	u32 error_ref_base;
> +	u32 rcb_base[10];
> +} __packed;
> +
> +struct rkvdec_vdpu381_h26x_set {
> +	u32 h26x_frame_orslice		: 1;
> +	u32 h26x_rps_mode		: 1;
> +	u32 h26x_stream_mode		: 1;
> +	u32 h26x_stream_lastpacket	: 1;
> +	u32 h264_firstslice_flag	: 1;
> +	u32 reserved			: 27;
> +} __packed;
> +
> +/* base: OFFSET_CODEC_PARAMS_REGS */
> +struct rkvdec_vdpu381_regs_h264_params {
> +	struct rkvdec_vdpu381_h26x_set reg064;
> +
> +	u32 cur_top_poc;
> +	u32 cur_bot_poc;
> +	u32 ref_pocs[32];
> +
> +	struct rkvdec_vdpu381_h264_info {
> +		struct rkvdec_vdpu381_h264_ref_info {
> +			u32 ref_field		: 1;
> +			u32 ref_topfield_used	: 1;
> +			u32 ref_botfield_used	: 1;
> +			u32 ref_colmv_use_flag	: 1;
> +			u32 ref_reserved	: 4;
> +		} __packed ref_info[4];
> +	} __packed ref_info_regs[4];
> +
> +	u32 reserved_103_111[9];
> +
> +	struct rkvdec_vdpu381_error_ref_info {
> +		u32 avs2_ref_error_field	: 1;
> +		u32 avs2_ref_error_topfield	: 1;
> +		u32 ref_error_topfield_used	: 1;
> +		u32 ref_error_botfield_used	: 1;
> +		u32 reserved			: 28;
> +	} reg112;
> +} __packed;
> +
> +struct rkvdec_vdpu381_regs_hevc_params {
> +	struct rkvdec_vdpu381_h26x_set reg064;
> +
> +	u32 cur_top_poc;
> +	u32 cur_bot_poc;
> +
> +	u32 reg067_082_ref_poc[16];
> +
> +	u32 reserved_083_098[16];
> +
> +	struct rkvdec_vdpu381_hevc_ref_valid {
> +		u32 hevc_ref_valid_0=C2=A0=C2=A0=C2=A0 : 1;
> +		u32 hevc_ref_valid_1=C2=A0=C2=A0=C2=A0 : 1;
> +		u32 hevc_ref_valid_2=C2=A0=C2=A0=C2=A0 : 1;
> +		u32 hevc_ref_valid_3=C2=A0=C2=A0=C2=A0 : 1;
> +		u32 reserve0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 : 4;
> +		u32 hevc_ref_valid_4=C2=A0=C2=A0=C2=A0 : 1;
> +		u32 hevc_ref_valid_5=C2=A0=C2=A0=C2=A0 : 1;
> +		u32 hevc_ref_valid_6=C2=A0=C2=A0=C2=A0 : 1;
> +		u32 hevc_ref_valid_7=C2=A0=C2=A0=C2=A0 : 1;
> +		u32 reserve1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 : 4;
> +		u32 hevc_ref_valid_8=C2=A0=C2=A0=C2=A0 : 1;
> +		u32 hevc_ref_valid_9=C2=A0=C2=A0=C2=A0 : 1;
> +		u32 hevc_ref_valid_10=C2=A0=C2=A0 : 1;
> +		u32 hevc_ref_valid_11=C2=A0=C2=A0 : 1;
> +		u32 reserve2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 : 4;
> +		u32 hevc_ref_valid_12=C2=A0=C2=A0 : 1;
> +		u32 hevc_ref_valid_13=C2=A0=C2=A0 : 1;
> +		u32 hevc_ref_valid_14=C2=A0=C2=A0 : 1;
> +		u32 reserve3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 : 5;
> +	} reg099;
> +
> +	u32 reserved_100_102[3];
> +
> +	struct rkvdec_vdpu381_hevc_mvc0 {
> +		u32 ref_pic_layer_same_with_cur : 16;
> +		u32 reserve=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 16;
> +	} reg103;
> +
> +	struct rkvdec_vdpu381_hevc_mvc1 {
> +		u32 poc_lsb_not_present_flag=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 : 1;
> +		u32 num_direct_ref_layers=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 : 6;
> +		u32 reserve0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 : 1;
> +
> +		u32 num_reflayer_pics=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 6;
> +		u32 default_ref_layers_active_flag=C2=A0 : 1;
> +		u32 max_one_active_ref_layer_flag=C2=A0=C2=A0 : 1;
> +
> +		u32 poc_reset_info_present_flag=C2=A0=C2=A0=C2=A0=C2=A0 : 1;
> +		u32 vps_poc_lsb_aligned_flag=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 : 1;
> +		u32 mvc_poc15_valid_flag=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 : 1;
> +		u32 reserve1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 : 13;
> +	} reg104;
> +
> +	u32 reserved_105_111[7];
> +
> +	struct rkvdec_vdpu381_hevc_ref_info {
> +		u32 avs2_ref_error_field=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 1=
;
> +		u32 avs2_ref_error_topfield=C2=A0=C2=A0=C2=A0=C2=A0 : 1;
> +		u32 ref_error_topfield_used=C2=A0=C2=A0=C2=A0=C2=A0 : 1;
> +		u32 ref_error_botfield_used=C2=A0=C2=A0=C2=A0=C2=A0 : 1;
> +		u32 reserve=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 28;
> +	} reg112;
> +
> +} __packed;
> +
> +/* base: OFFSET_CODEC_ADDR_REGS */
> +struct rkvdec_vdpu381_regs_h26x_addr {
> +	u32 reserved_160;
> +	u32 pps_base;
> +	u32 reserved_162;
> +	u32 rps_base;
> +	u32 ref_base[16];
> +	u32 scanlist_addr;
> +	u32 colmv_base[16];
> +	u32 cabactbl_base;
> +} __packed;
> +
> +struct rkvdec_vdpu381_regs_h26x_highpoc {
> +	struct rkvdec_vdpu381_ref_poc_highbit {
> +		u32 ref0_poc_highbit	: 4;
> +		u32 ref1_poc_highbit	: 4;
> +		u32 ref2_poc_highbit	: 4;
> +		u32 ref3_poc_highbit	: 4;
> +		u32 ref4_poc_highbit	: 4;
> +		u32 ref5_poc_highbit	: 4;
> +		u32 ref6_poc_highbit	: 4;
> +		u32 ref7_poc_highbit	: 4;
> +	} reg200[4];
> +	struct rkvdec_vdpu381_cur_poc_highbit {
> +		u32 cur_poc_highbit	: 4;
> +		u32 reserved		: 28;
> +	} reg204;
> +} __packed;
> +
> +struct rkvdec_vdpu381_regs_h264 {
> +	struct rkvdec_vdpu381_regs_common		common;
> +	struct rkvdec_vdpu381_regs_h264_params		h264_param;
> +	struct rkvdec_vdpu381_regs_common_addr		common_addr;
> +	struct rkvdec_vdpu381_regs_h26x_addr		h264_addr;
> +	struct rkvdec_vdpu381_regs_h26x_highpoc		h264_highpoc;
> +} __packed;
> +
> +struct rkvdec_vdpu381_regs_hevc {
> +	struct rkvdec_vdpu381_regs_common		common;
> +	struct rkvdec_vdpu381_regs_hevc_params		hevc_param;
> +	struct rkvdec_vdpu381_regs_common_addr		common_addr;
> +	struct rkvdec_vdpu381_regs_h26x_addr		hevc_addr;
> +	struct rkvdec_vdpu381_regs_h26x_highpoc		hevc_highpoc;
> +} __packed;
> +
> +#endif /* __RKVDEC_REGS_H__ */
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index aa92b586429e..ecf6b9051543 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -29,6 +29,7 @@
> =C2=A0
> =C2=A0#include "rkvdec.h"
> =C2=A0#include "rkvdec-regs.h"
> +#include "rkvdec-vdpu381-regs.h"
> =C2=A0#include "rkvdec-rcb.h"
> =C2=A0
> =C2=A0static bool rkvdec_image_fmt_match(enum rkvdec_image_fmt fmt1,
> @@ -90,6 +91,9 @@ static void rkvdec_fill_decoded_pixfmt(struct rkvdec_ct=
x *ctx,
> =C2=A0{
> =C2=A0	v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat,
> =C2=A0			=C2=A0=C2=A0=C2=A0 pix_mp->width, pix_mp->height);
> +
> +	ctx->colmv_offset =3D pix_mp->plane_fmt[0].sizeimage;
> +
> =C2=A0	pix_mp->plane_fmt[0].sizeimage +=3D 128 *
> =C2=A0		DIV_ROUND_UP(pix_mp->width, 16) *
> =C2=A0		DIV_ROUND_UP(pix_mp->height, 16);
> @@ -367,6 +371,26 @@ static const struct rkvdec_coded_fmt_desc rkvdec_cod=
ed_fmts[] =3D {
> =C2=A0	}
> =C2=A0};
> =C2=A0
> +static const struct rkvdec_coded_fmt_desc vdpu381_coded_fmts[] =3D {
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_H264_SLICE,
> +		.frmsize =3D {
> +			.min_width =3D 64,
> +			.max_width =3D=C2=A0 65520,
> +			.step_width =3D 64,
> +			.min_height =3D 64,
> +			.max_height =3D=C2=A0 65520,
> +			.step_height =3D 16,
> +		},
> +		.ctrls =3D &rkvdec_h264_ctrls,
> +		.ops =3D &rkvdec_vdpu381_h264_fmt_ops,
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
> @@ -1241,6 +1265,35 @@ static irqreturn_t rk3399_irq_handler(struct rkvde=
c_ctx *ctx)
> =C2=A0	return IRQ_HANDLED;
> =C2=A0}
> =C2=A0
> +static irqreturn_t vdpu381_irq_handler(struct rkvdec_ctx *ctx)
> +{
> +	struct rkvdec_dev *rkvdec =3D ctx->dev;
> +	enum vb2_buffer_state state;
> +	bool need_reset =3D 0;
> +	u32 status;
> +
> +	status =3D readl(rkvdec->regs + VDPU381_REG_STA_INT);
> +	writel(0, rkvdec->regs + VDPU381_REG_STA_INT);
> +
> +	if (status & VDPU381_STA_INT_DEC_RDY_STA) {
> +		state =3D VB2_BUF_STATE_DONE;
> +	} else {
> +		state =3D VB2_BUF_STATE_ERROR;
> +		if (status & (VDPU381_STA_INT_SOFTRESET_RDY |
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VDPU381_STA_INT_TIMEOUT |
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VDPU381_STA_INT_ERROR))
> +			rkvdec_iommu_restore(rkvdec);
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
> @@ -1265,12 +1318,76 @@ static void rkvdec_watchdog_func(struct work_stru=
ct *work)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +/*
> + * Some SoCs, like RK3588 have multiple identical VDPU cores, but the
> + * kernel is currently missing support for multi-core handling. Exposing
> + * separate devices for each core to userspace is bad, since that does
> + * not allow scheduling tasks properly (and creates ABI). With this work=
around
> + * the driver will only probe for the first core and early exit for the =
other
> + * cores. Once the driver gains multi-core support, the same technique
> + * for detecting the first core can be used to cluster all cores togethe=
r.
> + */
> +static int rkvdec_disable_multicore(struct rkvdec_dev *rkvdec)
> +{
> +	struct device_node *node =3D NULL;
> +	const char *compatible;
> +	bool is_first_core;
> +	int ret;
> +
> +	/* Intentionally ignores the fallback strings */
> +	ret =3D of_property_read_string(rkvdec->dev->of_node, "compatible", &co=
mpatible);
> +	if (ret)
> +		return ret;
> +
> +	/* The first compatible and available node found is considered the main=
 core */
> +	do {
> +		node =3D of_find_compatible_node(node, NULL, compatible);
> +		if (of_device_is_available(node))
> +			break;
> +	} while (node);
> +
> +	if (!node)
> +		return -EINVAL;
> +
> +	is_first_core =3D (rkvdec->dev->of_node =3D=3D node);
> +
> +	of_node_put(node);
> +
> +	if (!is_first_core) {
> +		dev_info(rkvdec->dev, "missing multi-core support, ignoring this insta=
nce\n");
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
> =C2=A0static const struct rkvdec_config config_rkvdec =3D {
> =C2=A0	.coded_fmts =3D rkvdec_coded_fmts,
> =C2=A0	.coded_fmts_num =3D ARRAY_SIZE(rkvdec_coded_fmts),
> =C2=A0	.irq_handler =3D rk3399_irq_handler,
> =C2=A0};
> =C2=A0
> +static const struct rcb_size_info vdpu381_rcb_sizes[] =3D {
> +	{6,	PIC_WIDTH},	// intrar
> +	{1,	PIC_WIDTH},	// transdr (Is actually 0.4*pic_width)
> +	{1,	PIC_HEIGHT},	// transdc (Is actually 0.1*pic_height)
> +	{3,	PIC_WIDTH},	// streamdr
> +	{6,	PIC_WIDTH},	// interr
> +	{3,	PIC_HEIGHT},	// interc
> +	{22,	PIC_WIDTH},	// dblkr
> +	{6,	PIC_WIDTH},	// saor
> +	{11,	PIC_WIDTH},	// fbcr
> +	{67,	PIC_HEIGHT},	// filtc col
> +};
> +
> +static const struct rkvdec_config config_vdpu381 =3D {
> +	.coded_fmts =3D vdpu381_coded_fmts,
> +	.coded_fmts_num =3D ARRAY_SIZE(vdpu381_coded_fmts),
> +	.rcb_size_info =3D vdpu381_rcb_sizes,
> +	.rcb_num =3D ARRAY_SIZE(vdpu381_rcb_sizes),
> +	.irq_handler =3D vdpu381_irq_handler,
> +};
> +
> =C2=A0static const struct rkvdec_variant rk3288_rkvdec_variant =3D {
> =C2=A0	.num_regs =3D 68,
> =C2=A0	.config =3D &config_rkvdec,
> @@ -1294,6 +1411,11 @@ static const struct rkvdec_variant rk3399_rkvdec_v=
ariant =3D {
> =C2=A0			RKVDEC_CAPABILITY_VP9,
> =C2=A0};
> =C2=A0
> +static const struct rkvdec_variant rk3588_vdpu381_variant =3D {
> +	.config =3D &config_vdpu381,
> +	.capabilities =3D RKVDEC_CAPABILITY_H264,
> +};
> +
> =C2=A0static const struct of_device_id of_rkvdec_match[] =3D {
> =C2=A0	{
> =C2=A0		.compatible =3D "rockchip,rk3288-vdec",
> @@ -1307,6 +1429,10 @@ static const struct of_device_id of_rkvdec_match[]=
 =3D {
> =C2=A0		.compatible =3D "rockchip,rk3399-vdec",
> =C2=A0		.data =3D &rk3399_rkvdec_variant,
> =C2=A0	},
> +	{
> +		.compatible =3D "rockchip,rk3588-vdec",
> +		.data =3D &rk3588_vdpu381_variant,
> +	},
> =C2=A0	{ /* sentinel */ }
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(of, of_rkvdec_match);
> @@ -1331,11 +1457,16 @@ static int rkvdec_probe(struct platform_device *p=
dev)
> =C2=A0	mutex_init(&rkvdec->vdev_lock);
> =C2=A0	INIT_DELAYED_WORK(&rkvdec->watchdog_work, rkvdec_watchdog_func);
> =C2=A0
> +	ret =3D rkvdec_disable_multicore(rkvdec);
> +	if (ret)
> +		return ret;
> +
> =C2=A0	ret =3D devm_clk_bulk_get_all_enabled(&pdev->dev, &rkvdec->clocks)=
;
> =C2=A0	if (ret < 0)
> =C2=A0		return ret;
> =C2=A0
> =C2=A0	rkvdec->clk_count =3D ret;
> +	rkvdec->axi_clk =3D devm_clk_get(&pdev->dev, "axi");
> =C2=A0
> =C2=A0	rkvdec->regs =3D devm_platform_ioremap_resource(pdev, 0);
> =C2=A0	if (IS_ERR(rkvdec->regs))
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.h
> index 4094f92f8a44..5b86f5b85d20 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -132,6 +132,7 @@ struct rkvdec_dev {
> =C2=A0	struct device *dev;
> =C2=A0	struct clk_bulk_data *clocks;
> =C2=A0	unsigned int clk_count;
> +	struct clk *axi_clk;
> =C2=A0	void __iomem *regs;
> =C2=A0	struct mutex vdev_lock; /* serializes ioctls */
> =C2=A0	struct delayed_work watchdog_work;
> @@ -150,6 +151,7 @@ struct rkvdec_ctx {
> =C2=A0	struct rkvdec_dev *dev;
> =C2=A0	enum rkvdec_image_fmt image_fmt;
> =C2=A0	struct rkvdec_rcb_config *rcb_config;
> +	u32 colmv_offset;
> =C2=A0	void *priv;
> =C2=A0};
> =C2=A0
> @@ -180,4 +182,6 @@ extern const struct rkvdec_coded_fmt_ops rkvdec_h264_=
fmt_ops;
> =C2=A0extern const struct rkvdec_coded_fmt_ops rkvdec_hevc_fmt_ops;
> =C2=A0extern const struct rkvdec_coded_fmt_ops rkvdec_vp9_fmt_ops;
> =C2=A0
> +extern const struct rkvdec_coded_fmt_ops rkvdec_vdpu381_h264_fmt_ops;
> +
> =C2=A0#endif /* RKVDEC_H_ */

--=-WGf6PPDPEH2Qx8IWVtuU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTna8gAKCRDZQZRRKWBy
9EKNAP4py98QbgA6L2tiDUcdWsSmT1RMAEyfdsQy9qpXR2USOwD/TimZgY58h3sO
T1YqqdAQzpiO2kUQnVaQ+HTrwtkdlgw=
=Zvlo
-----END PGP SIGNATURE-----

--=-WGf6PPDPEH2Qx8IWVtuU--

