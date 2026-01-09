Return-Path: <linux-media+bounces-50326-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DA7D0C31A
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 21:38:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0CB543037384
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 20:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB18366DD0;
	Fri,  9 Jan 2026 20:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="VH5p0gp8"
X-Original-To: linux-media@vger.kernel.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC40D365A19
	for <linux-media@vger.kernel.org>; Fri,  9 Jan 2026 20:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767991081; cv=none; b=h7BqIWVyI2DTG4rtkKUPCz0GaHo5A3B9otPSY03CEFVgfQLijvoD6hVeUXhHxKBWhUdrX3McPplSCmvwVQ0zGcbNGKZwOQoLuNU/bVF4CnBXkTDq6rVADX6HB2qvb036NMGkg3UHf8PJme3DDGphxrObEc6JEQ6ZtJENL0XFxR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767991081; c=relaxed/simple;
	bh=QqVn77Uixd48OuDvxC6I8QFUUw4jfcDqeISvWovKn3k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=KyqA0PVJL6Z+PY5VKHUl8oyuSf6FI5CWUALIiNUpAeQp78fnRI7ptXe3fbR90sVWO0zZaEQ53/jpWUhySjjzgR9urrJ0rgrQ9PT2TtiFK4VVyb4XAdAf5scqj+agJ7s4ZqTOzv6f7sW3NN9rVuq3admSImjSVmdFKcfEXxrqNSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=VH5p0gp8; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1767991065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JuK1rrYl2Op8Nmaz3wpfGui+A2USILkZpqGCjBikD0s=;
	b=VH5p0gp8S1ByGhEZ5/MGxJVgjH8/ewB5RNNmZGI4y1MICAhM7oJvtguW+dUIXM98sn8V0l
	OZIe2sn5dD8UdEtbrt2vF8EsXO6g6Zlhy5kexQLWoOTXp9+WSuuiXeMPuMQ4KS2yO/5dRu
	XZ/TGNgxuoKdrXT+AMt+DBsuCAqu1tD8vcIzEL5EtZj/FGUj5mDS+xEcSkDF6bJ7Rbfjv1
	j5+lb3rYfBD38a0GBY5sDRDHo3zXjlZDwYeNDcgF4bD/+f4V/HdoNxdlvJZ3upo4hj5TXa
	velgQ119f9nkkt7DZl3TPkk3zoO/PkNc9GvM/BlbwpwVsuZX1fKg/hT+dkB2ig==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 21:37:38 +0100
Message-Id: <DFKCIVP878NJ.TR38SBWQVCWY@cknow-tech.com>
Cc: "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Ezequiel Garcia"
 <ezequiel@vanguardiasur.com.ar>, "Heiko Stuebner" <heiko@sntech.de>,
 "Ricardo Ribalda" <ribalda@chromium.org>, "Hans Verkuil"
 <hverkuil@kernel.org>, "Hans de Goede" <hansg@kernel.org>, "Yunke Cao"
 <yunkec@google.com>, "Jonathan Corbet" <corbet@lwn.net>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Sakari Ailus"
 <sakari.ailus@linux.intel.com>, "James Cowgill" <james.cowgill@blaize.com>,
 <linux-media@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <kernel@collabora.com>, "Nicolas
 Dufresne" <nicolas.dufresne@collabora.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Diederik de Haas" <diederik@cknow-tech.com>
Subject: Re: [PATCH v8 14/17] media: rkvdec: Add H264 support for the
 VDPU381 variant
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Detlev Casanova" <detlev.casanova@collabora.com>,
 <linux-kernel@vger.kernel.org>
References: <20260109161538.1294449-1-detlev.casanova@collabora.com>
 <20260109161538.1294449-15-detlev.casanova@collabora.com>
In-Reply-To: <20260109161538.1294449-15-detlev.casanova@collabora.com>
X-Migadu-Flow: FLOW_OUT

On Fri Jan 9, 2026 at 5:15 PM CET, Detlev Casanova wrote:
> This decoder variant is found in Rockchip RK3588 SoC family.
>
> Like for rkvdec on rk3399, it supports the NV12, NV15, NV16 and NV20
> output formats and level up to 6.0.
>
> The maximum width and height have been significantly increased
> supporting up to 65520 pixels for both.
>
> Support for named register sections is added for this variant and future
> ones.
>
> Fluster score for JVT-AVC_V1 is 129/135.
>
> Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock 5B
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../media/platform/rockchip/rkvdec/Makefile   |   1 +
>  .../rockchip/rkvdec/rkvdec-h264-common.h      |   2 +
>  .../rockchip/rkvdec/rkvdec-vdpu381-h264.c     | 468 ++++++++++++++++++
>  .../rockchip/rkvdec/rkvdec-vdpu381-regs.h     | 430 ++++++++++++++++
>  .../media/platform/rockchip/rkvdec/rkvdec.c   | 111 ++++-
>  .../media/platform/rockchip/rkvdec/rkvdec.h   |  12 +
>  6 files changed, 1021 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381=
-h264.c
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381=
-regs.h
>
> diff --git a/drivers/media/platform/rockchip/rkvdec/Makefile b/drivers/me=
dia/platform/rockchip/rkvdec/Makefile
> index 3d75103e536d..7bfd95151e40 100644
> --- a/drivers/media/platform/rockchip/rkvdec/Makefile
> +++ b/drivers/media/platform/rockchip/rkvdec/Makefile
> @@ -8,4 +8,5 @@ rockchip-vdec-y +=3D \
>  		   rkvdec-hevc.o \
>  		   rkvdec-hevc-common.o \
>  		   rkvdec-rcb.o \
> +		   rkvdec-vdpu381-h264.o \
>  		   rkvdec-vp9.o
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.h =
b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.h
> index bd0c0081365b..3be6cea3a758 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.h
> @@ -74,6 +74,8 @@ struct rkvdec_rps {
>  	u32 reserved1[66];
>  } __packed;
> =20
> +extern const s8 rkvdec_h264_cabac_table[4][464][2];
> +
>  void lookup_ref_buf_idx(struct rkvdec_ctx *ctx, struct rkvdec_h264_run *=
run);
>  void assemble_hw_rps(struct v4l2_h264_reflist_builder *builder,
>  		     struct rkvdec_h264_run *run,
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c=
 b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
> new file mode 100644
> index 000000000000..0a89ebcab7ab
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
> @@ -0,0 +1,468 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip VDPU381 Video Decoder H264 backend
> + *
> + * Copyright (C) 2024 Collabora, Ltd.
> + *  Detlev Casanova <detlev.casanova@collabora.com>
> + */
> +
> + <snip>
> +};
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h=
 b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h
> new file mode 100644
> index 000000000000..6da36031df2d
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h
> @@ -0,0 +1,430 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip VDPU381 Video Decoder driver registers description
> + *
> + * Copyright (C) 2024 Collabora, Ltd.
> + *  Detlev Casanova <detlev.casanova@collabora.com>
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

FWIW, I've checked the reg definition from here ...

> +	struct {
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
> +	} reg008_in_out;
> +
> +	struct {
> +		u32 dec_mode	: 10;
> +		u32 reserved	: 22;
> +	} reg009_dec_mode;
> +
> +	struct {
> +		u32 dec_e	: 1;
> +		u32 reserved	: 31;
> +	} reg010_dec_e;
> +
> +	struct {
> +		u32 reserved0			: 1;
> +		u32 dec_clkgate_e		: 1;
> +		u32 dec_e_strmd_clkgate_dis	: 1;
> +		u32 reserved1			: 1;
> +
> +		u32 dec_irq_dis			: 1;
> +		u32 dec_timeout_e		: 1;
> +		u32 buf_empty_en		: 1;
> +		u32 reserved2			: 3;
> +
> +		u32 dec_e_rewrite_valid		: 1;
> +		u32 reserved3			: 9;
> +		u32 softrst_en_p		: 1;
> +		u32 force_softreset_valid	: 1;
> +		u32 reserved4			: 2;
> +		u32 pix_range_det_e		: 1;
> +		u32 reserved5			: 7;
> +	} reg011_important_en;
> +
> +	struct {
> +		u32 reserved0			: 1;
> +		u32 colmv_compress_en		: 1;
> +		u32 fbc_e			: 1;
> +		u32 reserved1			: 1;
> +
> +		u32 buspr_slot_disable		: 1;
> +		u32 error_info_en		: 1;
> +		u32 collect_info_en		: 1;
> +		u32 error_auto_rst_disable	: 1;
> +
> +		u32 scanlist_addr_valid_en	: 1;
> +		u32 scale_down_en		: 1;
> +		u32 error_cfg_wr_disable	: 1;
> +		u32 reserved2			: 21;
> +	} reg012_secondary_en;
> +
> +	struct {
> +		u32 reserved0			: 1;
> +		u32 req_timeout_rst_sel		: 1;
> +		u32 reserved1			: 1;
> +		u32 dec_commonirq_mode		: 1;
> +		u32 reserved2			: 2;
> +		u32 stmerror_waitdecfifo_empty	: 1;
> +		u32 reserved3			: 5;
> +		u32 allow_not_wr_unref_bframe	: 1;
> +		u32 fbc_output_wr_disable	: 1;
> +		u32 reserved4			: 4;
> +		u32 error_mode			: 1;
> +		u32 reserved5			: 2;
> +		u32 ycacherd_prior		: 1;
> +		u32 reserved6			: 2;
> +		u32 cur_pic_is_idr		: 1;
> +		u32 reserved7			: 1;
> +		u32 right_auto_rst_disable	: 1;
> +		u32 frame_end_err_rst_flag	: 1;
> +		u32 rd_prior_mode		: 1;
> +		u32 rd_ctrl_prior_mode		: 1;
> +		u32 reserved8			: 1;
> +		u32 filter_outbuf_mode		: 1;
> +	} reg013_en_mode_set;
> +
> +	struct {
> +		u32 fbc_force_uncompress	: 1;
> +
> +		u32 reserved0			: 2;
> +		u32 allow_16x8_cp_flag		: 1;
> +		u32 reserved1			: 2;
> +
> +		u32 fbc_h264_exten_4or8_flag	: 1;
> +		u32 reserved2			: 25;
> +	} reg014_fbc_param_set;
> +
> +	struct {
> +		u32 rlc_mode_direct_write	: 1;
> +		u32 rlc_mode			: 1;
> +		u32 reserved0			: 3;
> +
> +		u32 strm_start_bit		: 7;
> +		u32 reserved1			: 20;
> +	} reg015_stream_param_set;
> +
> +	u32 reg016_stream_len;
> +
> +	struct {
> +		u32 slice_num	: 25;
> +		u32 reserved	: 7;
> +	} reg017_slice_number;
> +
> +	struct {
> +		u32 y_hor_virstride	: 16;
> +		u32 reserved		: 16;
> +	} reg018_y_hor_stride;
> +
> +	struct {
> +		u32 uv_hor_virstride	: 16;
> +		u32 reserved		: 16;
> +	} reg019_uv_hor_stride;
> +
> +	struct {
> +		u32 y_virstride		: 28;
> +		u32 reserved		: 4;
> +	} reg020_y_stride;
> +
> +	struct {
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
> +	} reg021_error_ctrl_set;
> +
> +	struct {
> +		u32 roi_x_ctu_offset_st	: 12;
> +		u32 reserved0		: 4;
> +		u32 roi_y_ctu_offset_st	: 12;
> +		u32 reserved1		: 4;
> +	} reg022_err_roi_ctu_offset_start;
> +
> +	struct {
> +		u32 roi_x_ctu_offset_end	: 12;
> +		u32 reserved0			: 4;
> +		u32 roi_y_ctu_offset_end	: 12;
> +		u32 reserved1			: 4;
> +	} reg023_err_roi_ctu_offset_end;
> +
> +	struct {
> +		u32 cabac_err_en_lowbits	: 32;
> +	} reg024_cabac_error_en_lowbits;
> +
> +	struct {
> +		u32 cabac_err_en_highbits	: 30;
> +		u32 reserved			: 2;
> +	} reg025_cabac_error_en_highbits;
> +
> +	struct {
> +		u32 inter_auto_gating_e		: 1;
> +		u32 filterd_auto_gating_e	: 1;
> +		u32 strmd_auto_gating_e		: 1;
> +		u32 mcp_auto_gating_e		: 1;
> +		u32 busifd_auto_gating_e	: 1;
> +		u32 reserved0			: 3;
> +		u32 dec_ctrl_auto_gating_e	: 1;
> +		u32 intra_auto_gating_e		: 1;
> +		u32 mc_auto_gating_e		: 1;
> +		u32 transd_auto_gating_e	: 1;
> +		u32 reserved1			: 4;
> +		u32 sram_auto_gating_e		: 1;
> +		u32 cru_auto_gating_e		: 1;
> +		u32 reserved2			: 13;
> +		u32 reg_cfg_gating_en		: 1;
> +	} reg026_block_gating_en;
> +
> +	struct {
> +		u32 core_safe_x_pixels	: 16;
> +		u32 core_safe_y_pixels	: 16;
> +	} reg027_core_safe_pixels;
> +
> +	struct {
> +		u32 vp9_wr_prob_idx		: 3;
> +		u32 reserved0			: 1;
> +		u32 vp9_rd_prob_idx		: 3;
> +		u32 reserved1			: 1;
> +
> +		u32 ref_req_advance_flag	: 1;
> +		u32 colmv_req_advance_flag	: 1;
> +		u32 poc_only_highbit_flag	: 1;
> +		u32 poc_arb_flag		: 1;
> +
> +		u32 reserved2			: 4;
> +		u32 film_idx			: 10;
> +		u32 reserved3			: 2;
> +		u32 pu_req_mismatch_dis		: 1;
> +		u32 colmv_req_mismatch_dis	: 1;
> +		u32 reserved4			: 2;
> +	} reg028_multiply_core_ctrl;
> +
> +	struct {
> +		u32 scale_down_hor_ratio	: 2;
> +		u32 reserved0			: 6;
> +		u32 scale_down_vrz_ratio	: 2;
> +		u32 reserved1			: 22;
> +	} reg029_scale_down_ctrl;
> +
> +	struct {
> +		u32 y_scale_down_tile8x8_hor_stride	: 20;
> +		u32 reserved0				: 12;
> +	} reg030_y_scale_down_tile8x8_hor_stride;
> +
> +	struct {
> +		u32 uv_scale_down8x8_tile_hor_stride	: 20;
> +		u32 reserved0				: 12;
> +	} reg031_uv_scale_down_tile8x8_hor_stride;
> +
> +	u32 reg032_timeout_threshold;

... till here against the RK3588 TRM V1.0 Part 1 as described in
paragraph 5.5.10 in page 465 till 477 and they match *exactly*.
Thanks :-)

Cheers,
  Diederik

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
> +	struct rkvdec_vdpu381_h26x_set reg064_h26x_set;
> +
> +	u32 reg065_cur_top_poc;
> +	u32 reg066_cur_bot_poc;
> +	u32 reg067_098_ref_poc[32];
> +
> +	struct rkvdec_vdpu381_h264_info {
> +		struct rkvdec_vdpu381_h264_ref_info {
> +			u32 ref_field		: 1;
> +			u32 ref_topfield_used	: 1;
> +			u32 ref_botfield_used	: 1;
> +			u32 ref_colmv_use_flag	: 1;
> +			u32 reserved		: 4;
> +		} __packed ref_info[4];
> +	} __packed reg099_102_ref_info_regs[4];
> +
> +	u32 reserved_103_111[9];
> +
> +	struct {
> +		u32 avs2_ref_error_field	: 1;
> +		u32 avs2_ref_error_topfield	: 1;
> +		u32 ref_error_topfield_used	: 1;
> +		u32 ref_error_botfield_used	: 1;
> +		u32 reserved			: 28;
> +	} reg112_error_ref_info;
> +} __packed;
> +
> +struct rkvdec_vdpu381_regs_hevc_params {
> +	struct rkvdec_vdpu381_h26x_set reg064_h26x_set;
> +
> +	u32 reg065_cur_top_poc;
> +	u32 reg066_cur_bot_poc;
> +	u32 reg067_082_ref_poc[16];
> +
> +	u32 reserved_083_098[16];
> +
> +	struct {
> +		u32 hevc_ref_valid_0    : 1;
> +		u32 hevc_ref_valid_1    : 1;
> +		u32 hevc_ref_valid_2    : 1;
> +		u32 hevc_ref_valid_3    : 1;
> +		u32 reserve0            : 4;
> +		u32 hevc_ref_valid_4    : 1;
> +		u32 hevc_ref_valid_5    : 1;
> +		u32 hevc_ref_valid_6    : 1;
> +		u32 hevc_ref_valid_7    : 1;
> +		u32 reserve1            : 4;
> +		u32 hevc_ref_valid_8    : 1;
> +		u32 hevc_ref_valid_9    : 1;
> +		u32 hevc_ref_valid_10   : 1;
> +		u32 hevc_ref_valid_11   : 1;
> +		u32 reserve2            : 4;
> +		u32 hevc_ref_valid_12   : 1;
> +		u32 hevc_ref_valid_13   : 1;
> +		u32 hevc_ref_valid_14   : 1;
> +		u32 reserve3            : 5;
> +	} reg099_hevc_ref_valid;
> +
> +	u32 reserved_100_102[3];
> +
> +	struct {
> +		u32 ref_pic_layer_same_with_cur : 16;
> +		u32 reserve                     : 16;
> +	} reg103_hevc_mvc0;
> +
> +	struct {
> +		u32 poc_lsb_not_present_flag        : 1;
> +		u32 num_direct_ref_layers           : 6;
> +		u32 reserve0                        : 1;
> +
> +		u32 num_reflayer_pics               : 6;
> +		u32 default_ref_layers_active_flag  : 1;
> +		u32 max_one_active_ref_layer_flag   : 1;
> +
> +		u32 poc_reset_info_present_flag     : 1;
> +		u32 vps_poc_lsb_aligned_flag        : 1;
> +		u32 mvc_poc15_valid_flag            : 1;
> +		u32 reserve1                        : 13;
> +	} reg104_hevc_mvc1;
> +
> +	u32 reserved_105_111[7];
> +
> +	struct {
> +		u32 avs2_ref_error_field        : 1;
> +		u32 avs2_ref_error_topfield     : 1;
> +		u32 ref_error_topfield_used     : 1;
> +		u32 ref_error_botfield_used     : 1;
> +		u32 reserve                     : 28;
> +	} reg112_hevc_ref_info;
> +
> +} __packed;
> +
> +/* base: OFFSET_CODEC_ADDR_REGS */
> +struct rkvdec_vdpu381_regs_h26x_addr {
> +	u32 reserved_160;
> +	u32 reg161_pps_base;
> +	u32 reserved_162;
> +	u32 reg163_rps_base;
> +	u32 reg164_180_ref_base[16];
> +	u32 reg181_scanlist_addr;
> +	u32 reg182_198_colmv_base[16];
> +	u32 reg199_cabactbl_base;
> +} __packed;
> +
> +struct rkvdec_vdpu381_regs_h26x_highpoc {
> +	struct {
> +		u32 ref0_poc_highbit	: 4;
> +		u32 ref1_poc_highbit	: 4;
> +		u32 ref2_poc_highbit	: 4;
> +		u32 ref3_poc_highbit	: 4;
> +		u32 ref4_poc_highbit	: 4;
> +		u32 ref5_poc_highbit	: 4;
> +		u32 ref6_poc_highbit	: 4;
> +		u32 ref7_poc_highbit	: 4;
> +	} reg200_203_ref_poc_highbit[4];
> +	struct {
> +		u32 cur_poc_highbit	: 4;
> +		u32 reserved		: 28;
> +	} reg204_cur_poc_highbit;
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
> index af2eced90026..c6877dfb0549 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -29,6 +29,7 @@
> =20
>  #include "rkvdec.h"
>  #include "rkvdec-regs.h"
> +#include "rkvdec-vdpu381-regs.h"
>  #include "rkvdec-rcb.h"
> =20
>  static bool rkvdec_image_fmt_match(enum rkvdec_image_fmt fmt1,
> @@ -90,6 +91,9 @@ static void rkvdec_fill_decoded_pixfmt(struct rkvdec_ct=
x *ctx,
>  {
>  	v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat,
>  			    pix_mp->width, pix_mp->height);
> +
> +	ctx->colmv_offset =3D pix_mp->plane_fmt[0].sizeimage;
> +
>  	pix_mp->plane_fmt[0].sizeimage +=3D 128 *
>  		DIV_ROUND_UP(pix_mp->width, 16) *
>  		DIV_ROUND_UP(pix_mp->height, 16);
> @@ -382,6 +386,25 @@ static const struct rkvdec_coded_fmt_desc rk3288_cod=
ed_fmts[] =3D {
>  	}
>  };
> =20
> +static const struct rkvdec_coded_fmt_desc vdpu381_coded_fmts[] =3D {
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_H264_SLICE,
> +		.frmsize =3D {
> +			.min_width =3D 64,
> +			.max_width =3D  65520,
> +			.step_width =3D 64,
> +			.min_height =3D 64,
> +			.max_height =3D  65520,
> +			.step_height =3D 16,
> +		},
> +		.ctrls =3D &rkvdec_h264_ctrls,
> +		.ops =3D &rkvdec_vdpu381_h264_fmt_ops,
> +		.num_decoded_fmts =3D ARRAY_SIZE(rkvdec_h264_decoded_fmts),
> +		.decoded_fmts =3D rkvdec_h264_decoded_fmts,
> +		.subsystem_flags =3D VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
> +	},
> +};
> +
>  static const struct rkvdec_coded_fmt_desc *
>  rkvdec_enum_coded_fmt_desc(struct rkvdec_ctx *ctx, int index)
>  {
> @@ -946,6 +969,20 @@ void rkvdec_memcpy_toio(void __iomem *dst, void *src=
, size_t len)
>  #endif
>  }
> =20
> +void rkvdec_schedule_watchdog(struct rkvdec_dev *rkvdec, u32 timeout_thr=
eshold)
> +{
> +	/* Set watchdog at 2 times the hardware timeout threshold */
> +	u32 watchdog_time;
> +	unsigned long axi_rate =3D clk_get_rate(rkvdec->axi_clk);
> +
> +	if (axi_rate)
> +		watchdog_time =3D 2 * div_u64(1000 * (u64)timeout_threshold, axi_rate)=
;
> +	else
> +		watchdog_time =3D 2000;
> +
> +	schedule_delayed_work(&rkvdec->watchdog_work, msecs_to_jiffies(watchdog=
_time));
> +}
> +
>  static void rkvdec_device_run(void *priv)
>  {
>  	struct rkvdec_ctx *ctx =3D priv;
> @@ -1245,6 +1282,35 @@ static irqreturn_t rk3399_irq_handler(struct rkvde=
c_ctx *ctx)
>  	return IRQ_HANDLED;
>  }
> =20
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
> +			      VDPU381_STA_INT_TIMEOUT |
> +			      VDPU381_STA_INT_ERROR))
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
>  static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
>  {
>  	struct rkvdec_dev *rkvdec =3D priv;
> @@ -1321,6 +1387,7 @@ static const struct rkvdec_variant rk3288_rkvdec_va=
riant =3D {
>  	.coded_fmts =3D rk3288_coded_fmts,
>  	.num_coded_fmts =3D ARRAY_SIZE(rk3288_coded_fmts),
>  	.ops =3D &rk3399_variant_ops,
> +	.has_single_reg_region =3D true,
>  };
> =20
>  static const struct rkvdec_variant rk3328_rkvdec_variant =3D {
> @@ -1328,6 +1395,7 @@ static const struct rkvdec_variant rk3328_rkvdec_va=
riant =3D {
>  	.coded_fmts =3D rkvdec_coded_fmts,
>  	.num_coded_fmts =3D ARRAY_SIZE(rkvdec_coded_fmts),
>  	.ops =3D &rk3399_variant_ops,
> +	.has_single_reg_region =3D true,
>  	.quirks =3D RKVDEC_QUIRK_DISABLE_QOS,
>  };
> =20
> @@ -1336,6 +1404,32 @@ static const struct rkvdec_variant rk3399_rkvdec_v=
ariant =3D {
>  	.coded_fmts =3D rkvdec_coded_fmts,
>  	.num_coded_fmts =3D ARRAY_SIZE(rkvdec_coded_fmts),
>  	.ops =3D &rk3399_variant_ops,
> +	.has_single_reg_region =3D true,
> +};
> +
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
> +static const struct rkvdec_variant_ops vdpu381_variant_ops =3D {
> +	.irq_handler =3D vdpu381_irq_handler,
> +};
> +
> +static const struct rkvdec_variant vdpu381_variant =3D {
> +	.coded_fmts =3D vdpu381_coded_fmts,
> +	.num_coded_fmts =3D ARRAY_SIZE(vdpu381_coded_fmts),
> +	.rcb_sizes =3D vdpu381_rcb_sizes,
> +	.num_rcb_sizes =3D ARRAY_SIZE(vdpu381_rcb_sizes),
> +	.ops =3D &vdpu381_variant_ops,
>  };
> =20
>  static const struct of_device_id of_rkvdec_match[] =3D {
> @@ -1351,6 +1445,10 @@ static const struct of_device_id of_rkvdec_match[]=
 =3D {
>  		.compatible =3D "rockchip,rk3399-vdec",
>  		.data =3D &rk3399_rkvdec_variant,
>  	},
> +	{
> +		.compatible =3D "rockchip,rk3588-vdec",
> +		.data =3D &vdpu381_variant,
> +	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, of_rkvdec_match);
> @@ -1384,10 +1482,17 @@ static int rkvdec_probe(struct platform_device *p=
dev)
>  		return ret;
> =20
>  	rkvdec->num_clocks =3D ret;
> +	rkvdec->axi_clk =3D devm_clk_get(&pdev->dev, "axi");
> =20
> -	rkvdec->regs =3D devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(rkvdec->regs))
> -		return PTR_ERR(rkvdec->regs);
> +	if (rkvdec->variant->has_single_reg_region) {
> +		rkvdec->regs =3D devm_platform_ioremap_resource(pdev, 0);
> +		if (IS_ERR(rkvdec->regs))
> +			return PTR_ERR(rkvdec->regs);
> +	} else {
> +		rkvdec->regs =3D devm_platform_ioremap_resource_byname(pdev, "function=
");
> +		if (IS_ERR(rkvdec->regs))
> +			return PTR_ERR(rkvdec->regs);
> +	}
> =20
>  	ret =3D dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
>  	if (ret) {
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.h
> index 7766a79caf68..4afa9cd690d5 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -25,6 +25,10 @@
> =20
>  #define RKVDEC_QUIRK_DISABLE_QOS	BIT(0)
> =20
> +#define RKVDEC_1080P_PIXELS		(1920 * 1088)
> +#define RKVDEC_4K_PIXELS		(4096 * 2304)
> +#define RKVDEC_8K_PIXELS		(7680 * 4320)
> +
>  struct rkvdec_ctx;
>  struct rkvdec_rcb_config;
> =20
> @@ -78,6 +82,7 @@ struct rkvdec_variant {
>  	const struct rcb_size_info *rcb_sizes;
>  	size_t num_rcb_sizes;
>  	const struct rkvdec_variant_ops *ops;
> +	bool has_single_reg_region;
>  	unsigned int quirks;
>  };
> =20
> @@ -126,6 +131,7 @@ struct rkvdec_dev {
>  	struct device *dev;
>  	struct clk_bulk_data *clocks;
>  	unsigned int num_clocks;
> +	struct clk *axi_clk;
>  	void __iomem *regs;
>  	struct mutex vdev_lock; /* serializes ioctls */
>  	struct delayed_work watchdog_work;
> @@ -144,6 +150,7 @@ struct rkvdec_ctx {
>  	struct rkvdec_dev *dev;
>  	enum rkvdec_image_fmt image_fmt;
>  	struct rkvdec_rcb_config *rcb_config;
> +	u32 colmv_offset;
>  	void *priv;
>  };
> =20
> @@ -167,11 +174,16 @@ struct rkvdec_aux_buf {
>  void rkvdec_run_preamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run)=
;
>  void rkvdec_run_postamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run=
);
>  void rkvdec_memcpy_toio(void __iomem *dst, void *src, size_t len);
> +void rkvdec_schedule_watchdog(struct rkvdec_dev *rkvdec, u32 timeout_thr=
eshold);
> =20
>  void rkvdec_quirks_disable_qos(struct rkvdec_ctx *ctx);
> =20
> +/* RKVDEC ops */
>  extern const struct rkvdec_coded_fmt_ops rkvdec_h264_fmt_ops;
>  extern const struct rkvdec_coded_fmt_ops rkvdec_hevc_fmt_ops;
>  extern const struct rkvdec_coded_fmt_ops rkvdec_vp9_fmt_ops;
> =20
> +/* VDPU381 ops */
> +extern const struct rkvdec_coded_fmt_ops rkvdec_vdpu381_h264_fmt_ops;
> +
>  #endif /* RKVDEC_H_ */


