Return-Path: <linux-media+bounces-13900-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94413911E6F
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 10:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B1CD1F21C6F
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 08:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC72F16D310;
	Fri, 21 Jun 2024 08:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="fhsMUPUf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D403156255
	for <linux-media@vger.kernel.org>; Fri, 21 Jun 2024 08:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718958050; cv=none; b=tOj7dB02T7y+TTD5hOIyRhVSFS4wlR58b917fZoSByK78NR/wA0/p69xn9T8UtzWolVwJ3hZPM0lhJ/evS97nZAKYStnV7PR3ac6Wtmzki2olsBmp+97N5LSpMe44IXlrQ5GMmCNEj70aUeOY1PSD84Xrj+/bOjzGRoWkyc0CQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718958050; c=relaxed/simple;
	bh=r5unbKzemW/SwSd460Tx3At0m1vMLsf4N1UdMPSvAIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sDvDoRcO9rncdxTaYjCetlFosRHtK1bCl9C+fS6quNGclkBu0TUSbAsx8EpGWlxVKbLbcwB9TtTa7dzTlHugiHMZEhMgF5OqGOSNYsrQt7yLL36xRuc+/EkzynSRPw5mu0yjl3YDLu6dd/useEOMLrvVTIb/h2j1bdjCWiqjVb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=fhsMUPUf; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1718958031;
 bh=eNdJb7my5BtnnrX5VH5NSt0AEWv3DwlxbmD224SiqeQ=;
 b=fhsMUPUf/p9koMZX6zXxWEezngmRD5Q1g7SoKsB/pe241VW3g7xbAjP4JXa35HXZTpB4O5ovx
 cSe29ZeuBN66XjlMr2GK8jx/slFG680bZWlk0A9cvCYCxemY7cry/lR6tUmHj6IYW/nIHtOGC2V
 ev4orMbnH/tiLNGc+1CM7yd9FPmIEJ7B0xQSamXkTQ2JqUZtOUh5RjhyP92JMOi0RT5kB6Zy8zQ
 lprcba09grUVMyAgz9ePbZJ/6USc3U58IqjsoD7apebbUZpuL2TM9wuxvZfWpaara+8cS7IS8IA
 3yT2DkKHUeDT6Jsz0z0QgLshDIaYbgAquk4aIOYMV9oA==
Message-ID: <32b94845-d51a-4b97-a820-10d27dc97f7e@kwiboo.se>
Date: Fri, 21 Jun 2024 10:20:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] media: rockchip: Introduce the rkvdec2 driver
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, Dragan Simic
 <dsimic@manjaro.org>, Diederik de Haas <didi.debian@cknow.org>, Andy Yan
 <andy.yan@rock-chips.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Almeida <daniel.almeida@collabora.com>, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Alex Bee <knaerzche@gmail.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev
References: <20240620142532.406564-1-detlev.casanova@collabora.com>
 <20240620142532.406564-3-detlev.casanova@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20240620142532.406564-3-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 667537cebb5b23e1ff4b323e

Hi Datlev,

Some small and quick feedback below.

On 2024-06-20 16:19, Detlev Casanova wrote:
> This driver supports the second generation of the Rockchip Video
> decoder, also known as vdpu34x.
> It is currently only used on the RK3588(s) SoC.
> 
> There are 2 decoders on the RK3588 SoC that can work in pair to decode
> 8K video at 30 FPS but currently, only using one core at a time is
> supported.
> 
> Scheduling requests between the two cores will be implemented later.
> 
> The core supports H264, HEVC, VP9 and AVS2 decoding but this driver
> currently only supports H264.
> 
> The driver is based on rkvdec and they may share some code in the
> future.
> The decision to make a different driver is mainly because rkvdec2 has
> more features and can work with multiple cores.
> 
> The registers are mapped in a struct in RAM using bitfields. It is IO
> copied to the HW when all values are configured.
> The decision to use such a struct instead of writing buffers one by one
> is based on the following reasons:
>  - Rockchip cores are known to misbehave when registers are not written
>    in address order,
>  - Those cores also need the software to write all registers, even if
>    they are written their default values or are not related to the task
>    (this core will not start decoding some H264 frames if some VP9
>    registers are not written to 0)
>  - In the future, to support multiple cores, the scheduler could be
>    optimized by storing the precomputed registers values and copy them
>    to the HW as soos as a core becomes available.
> 
> This makes the code more readable and may bring performance improvements
> in future features.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  drivers/staging/media/Kconfig                |    1 +
>  drivers/staging/media/Makefile               |    1 +
>  drivers/staging/media/rkvdec2/Kconfig        |   15 +
>  drivers/staging/media/rkvdec2/Makefile       |    3 +
>  drivers/staging/media/rkvdec2/TODO           |    9 +
>  drivers/staging/media/rkvdec2/rkvdec2-h264.c |  739 +++++++++++
>  drivers/staging/media/rkvdec2/rkvdec2-regs.h |  345 +++++
>  drivers/staging/media/rkvdec2/rkvdec2.c      | 1253 ++++++++++++++++++
>  drivers/staging/media/rkvdec2/rkvdec2.h      |  130 ++
>  9 files changed, 2496 insertions(+)
>  create mode 100644 drivers/staging/media/rkvdec2/Kconfig
>  create mode 100644 drivers/staging/media/rkvdec2/Makefile
>  create mode 100644 drivers/staging/media/rkvdec2/TODO
>  create mode 100644 drivers/staging/media/rkvdec2/rkvdec2-h264.c
>  create mode 100644 drivers/staging/media/rkvdec2/rkvdec2-regs.h
>  create mode 100644 drivers/staging/media/rkvdec2/rkvdec2.c
>  create mode 100644 drivers/staging/media/rkvdec2/rkvdec2.h
> 
> diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
> index 554c2e475ce3..7f377d37e670 100644
> --- a/drivers/staging/media/Kconfig
> +++ b/drivers/staging/media/Kconfig
> @@ -35,6 +35,7 @@ source "drivers/staging/media/meson/vdec/Kconfig"
>  source "drivers/staging/media/omap4iss/Kconfig"
>  
>  source "drivers/staging/media/rkvdec/Kconfig"
> +source "drivers/staging/media/rkvdec2/Kconfig"
>  
>  source "drivers/staging/media/starfive/Kconfig"
>  
> diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
> index dcaeeca0ee6d..0a2d89db32b2 100644
> --- a/drivers/staging/media/Makefile
> +++ b/drivers/staging/media/Makefile
> @@ -6,6 +6,7 @@ obj-$(CONFIG_VIDEO_MAX96712)	+= max96712/
>  obj-$(CONFIG_VIDEO_MESON_VDEC)	+= meson/vdec/
>  obj-$(CONFIG_VIDEO_OMAP4)	+= omap4iss/
>  obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC)	+= rkvdec/
> +obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC2)	+= rkvdec2/
>  obj-$(CONFIG_VIDEO_STARFIVE_CAMSS)	+= starfive/
>  obj-$(CONFIG_VIDEO_SUNXI)	+= sunxi/
>  obj-$(CONFIG_VIDEO_TEGRA)	+= tegra-video/
> diff --git a/drivers/staging/media/rkvdec2/Kconfig b/drivers/staging/media/rkvdec2/Kconfig
> new file mode 100644
> index 000000000000..fd505cb7aff9
> --- /dev/null
> +++ b/drivers/staging/media/rkvdec2/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0
> +config VIDEO_ROCKCHIP_VDEC2
> +	tristate "Rockchip Video Decoder driver 2"
> +	depends on ARCH_ROCKCHIP || COMPILE_TEST
> +	depends on VIDEO_DEV
> +	select MEDIA_CONTROLLER
> +	select VIDEOBUF2_DMA_CONTIG
> +	select VIDEOBUF2_VMALLOC
> +	select V4L2_MEM2MEM_DEV
> +	select V4L2_H264
> +	help
> +	  Support for the Rockchip Video Decoder 2 IP present on Rockchip SoCs,
> +	  which accelerates video decoding.
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called rockchip-vdec2.
> diff --git a/drivers/staging/media/rkvdec2/Makefile b/drivers/staging/media/rkvdec2/Makefile
> new file mode 100644
> index 000000000000..b5a6ac701970
> --- /dev/null
> +++ b/drivers/staging/media/rkvdec2/Makefile
> @@ -0,0 +1,3 @@
> +obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC2) += rockchip-vdec2.o
> +
> +rockchip-vdec2-y += rkvdec2.o rkvdec2-h264.o
> diff --git a/drivers/staging/media/rkvdec2/TODO b/drivers/staging/media/rkvdec2/TODO
> new file mode 100644
> index 000000000000..9f64270e789e
> --- /dev/null
> +++ b/drivers/staging/media/rkvdec2/TODO
> @@ -0,0 +1,9 @@
> +* Support for 4:2:2 and 10 bits
> +* Support for rockchip IOMMU
> +* Support for HEVC and VP9 are planned for this driver.
> +
> +  First, the h264 backend needs to be stabilized.
> +
> +* Evaluate sharing code with rkvdec
> +
> +  As rkvdec is still in staging, this driver stays there as well.
> diff --git a/drivers/staging/media/rkvdec2/rkvdec2-h264.c b/drivers/staging/media/rkvdec2/rkvdec2-h264.c
> new file mode 100644
> index 000000000000..37606f6833a1
> --- /dev/null
> +++ b/drivers/staging/media/rkvdec2/rkvdec2-h264.c
> @@ -0,0 +1,739 @@

[snip]

> +
> +/* Data structure describing auxiliary buffer format. */
> +struct rkvdec2_h264_priv_tbl {
> +	u32 cabac_table[928];

This should probably now match rkvdec, i.e. s8 cabac_table[4][464][2];

> +	struct rkvdec2_h264_scaling_list scaling_list;
> +	struct rkvdec2_sps_pps param_set[256];
> +	struct rkvdec2_rps rps;
> +};
> +
> +struct rkvdec2_h264_reflists {
> +	struct v4l2_h264_reference p[V4L2_H264_REF_LIST_LEN];
> +	struct v4l2_h264_reference b0[V4L2_H264_REF_LIST_LEN];
> +	struct v4l2_h264_reference b1[V4L2_H264_REF_LIST_LEN];
> +};
> +
> +struct rkvdec2_h264_run {
> +	struct rkvdec2_run					base;
> +	const struct v4l2_ctrl_h264_decode_params		*decode_params;
> +	const struct v4l2_ctrl_h264_sps				*sps;
> +	const struct v4l2_ctrl_h264_pps				*pps;
> +	const struct v4l2_ctrl_h264_scaling_matrix		*scaling_matrix;

These are aligned, others are not, please be consistent.

> +	struct vb2_buffer *ref_buf[V4L2_H264_NUM_DPB_ENTRIES];
> +};
> +
> +struct rkvdec2_h264_ctx {
> +	struct rkvdec2_aux_buf		priv_tbl;
> +	struct rkvdec2_h264_reflists	reflists;
> +	struct rkvdec2_regs_h264	regs;

Same as above, please be consistent for all structs.

> +};
> +
> +static void assemble_hw_pps(struct rkvdec2_ctx *ctx,
> +			    struct rkvdec2_h264_run *run)
> +{
> +	struct rkvdec2_h264_ctx *h264_ctx = ctx->priv;
> +	const struct v4l2_ctrl_h264_sps *sps = run->sps;
> +	const struct v4l2_ctrl_h264_pps *pps = run->pps;
> +	const struct v4l2_ctrl_h264_decode_params *dec_params = run->decode_params;
> +	const struct v4l2_h264_dpb_entry *dpb = dec_params->dpb;
> +	struct rkvdec2_h264_priv_tbl *priv_tbl = h264_ctx->priv_tbl.cpu;
> +	struct rkvdec2_sps_pps *hw_ps;
> +	dma_addr_t scaling_list_address;
> +	u32 scaling_distance;
> +	u32 i;
> +
> +	/*
> +	 * HW read the SPS/PPS information from PPS packet index by PPS id.
> +	 * offset from the base can be calculated by PPS_id * 32 (size per PPS
> +	 * packet unit). so the driver copy SPS/PPS information to the exact PPS
> +	 * packet unit for HW accessing.
> +	 */
> +	hw_ps = &priv_tbl->param_set[pps->pic_parameter_set_id];
> +	memset(hw_ps, 0, sizeof(*hw_ps));
> +
> +	/* write sps */
> +	hw_ps->sps.seq_parameter_set_id = 0xf;

This should use sps->seq_parameter_set_id

> +	hw_ps->sps.profile_idc = 0xff;

This shold use sps->profile_idc

> +	hw_ps->sps.constraint_set3_flag = 1;

This should use !!(sps->constraint_set_flags & (1 << 3))

> +	hw_ps->sps.chroma_format_idc = sps->chroma_format_idc;
> +	hw_ps->sps.bit_depth_luma = sps->bit_depth_luma_minus8;
> +	hw_ps->sps.bit_depth_chroma = sps->bit_depth_chroma_minus8;
> +	hw_ps->sps.qpprime_y_zero_transform_bypass_flag = 0;

This should use

  !!(sps->flags & V4L2_H264_SPS_FLAG_QPPRIME_Y_ZERO_TRANSFORM_BYPASS)

> +	hw_ps->sps.log2_max_frame_num_minus4 = sps->log2_max_frame_num_minus4;
> +	hw_ps->sps.max_num_ref_frames = sps->max_num_ref_frames;
> +	hw_ps->sps.pic_order_cnt_type = sps->pic_order_cnt_type;
> +	hw_ps->sps.log2_max_pic_order_cnt_lsb_minus4 =
> +		sps->log2_max_pic_order_cnt_lsb_minus4;
> +	hw_ps->sps.delta_pic_order_always_zero_flag =
> +		!!(sps->flags & V4L2_H264_SPS_FLAG_DELTA_PIC_ORDER_ALWAYS_ZERO);
> +	hw_ps->sps.mvc_extension_enable = 1;
> +	hw_ps->sps.num_views = 1;
> +
> +	/*
> +	 * Use the SPS values since they are already in macroblocks
> +	 * dimensions, height can be field height (halved) if
> +	 * V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY is not set and also it allows
> +	 * decoding smaller images into larger allocation which can be used
> +	 * to implementing SVC spatial layer support.
> +	 */
> +	hw_ps->sps.pic_width_in_mbs = sps->pic_width_in_mbs_minus1 + 1;
> +	hw_ps->sps.pic_height_in_mbs = sps->pic_height_in_map_units_minus1 + 1;
> +	hw_ps->sps.frame_mbs_only_flag =
> +		!!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY);
> +	hw_ps->sps.mb_adaptive_frame_field_flag =
> +		!!(sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD);
> +	hw_ps->sps.direct_8x8_inference_flag =
> +		!!(sps->flags & V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE);
> +
> +	/* write pps */
> +	hw_ps->pps.pic_parameter_set_id = 0xff;

This should use pps->pic_parameter_set_id

> +	hw_ps->pps.pps_seq_parameter_set_id = 0x1f;

This should use pps->seq_parameter_set_id

Fluster score is not affected by these changes and follow

https://lore.kernel.org/linux-media/20240618194647.742037-5-jonas@kwiboo.se/

> +	hw_ps->pps.entropy_coding_mode_flag =
> +		!!(pps->flags & V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE);
> +	hw_ps->pps.bottom_field_pic_order_in_frame_present_flag =
> +		!!(pps->flags & V4L2_H264_PPS_FLAG_BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT);
> +	hw_ps->pps.num_ref_idx_l0_default_active_minus1 =
> +		pps->num_ref_idx_l0_default_active_minus1;
> +	hw_ps->pps.num_ref_idx_l1_default_active_minus1 =
> +		pps->num_ref_idx_l1_default_active_minus1;
> +	hw_ps->pps.weighted_pred_flag =
> +		!!(pps->flags & V4L2_H264_PPS_FLAG_WEIGHTED_PRED);
> +	hw_ps->pps.weighted_bipred_idc = pps->weighted_bipred_idc;
> +	hw_ps->pps.pic_init_qp_minus26 = pps->pic_init_qp_minus26;
> +	hw_ps->pps.pic_init_qs_minus26 = pps->pic_init_qs_minus26;
> +	hw_ps->pps.chroma_qp_index_offset = pps->chroma_qp_index_offset;
> +	hw_ps->pps.deblocking_filter_control_present_flag =
> +		!!(pps->flags & V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT);
> +	hw_ps->pps.constrained_intra_pred_flag =
> +		!!(pps->flags & V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED);
> +	hw_ps->pps.redundant_pic_cnt_present =
> +		!!(pps->flags & V4L2_H264_PPS_FLAG_REDUNDANT_PIC_CNT_PRESENT);
> +	hw_ps->pps.transform_8x8_mode_flag =
> +		!!(pps->flags & V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE);
> +	hw_ps->pps.second_chroma_qp_index_offset = pps->second_chroma_qp_index_offset;
> +	hw_ps->pps.scaling_list_enable_flag =
> +		!!(pps->flags & V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT);
> +
> +	/*
> +	 * To be on the safe side, program the scaling matrix address
> +	 *
> +	 * With this set here,
> +	 *  RKVDEC_SWREG12_SENCODARY_EN:sw_scanlist_addr_valid_en
> +	 * can stay at 0
> +	 */
> +	scaling_distance = offsetof(struct rkvdec2_h264_priv_tbl, scaling_list);
> +	scaling_list_address = h264_ctx->priv_tbl.dma + scaling_distance;
> +	hw_ps->pps.scaling_list_address = scaling_list_address;
> +
> +	for (i = 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
> +		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
> +			hw_ps->pps.is_longterm |= (1 << i);
> +	}
> +}
> +

[snip]

> diff --git a/drivers/staging/media/rkvdec2/rkvdec2.c b/drivers/staging/media/rkvdec2/rkvdec2.c
> new file mode 100644
> index 000000000000..464eec67521b
> --- /dev/null
> +++ b/drivers/staging/media/rkvdec2/rkvdec2.c
> @@ -0,0 +1,1253 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip Video Decoder 2 driver
> + *
> + * Copyright (C) 2024 Collabora, Ltd.
> + *  Detlev Casanova <detlev.casanova@collabora.com>
> + *
> + * Based on rkvdec driver by Boris Brezillon <boris.brezillon@collabora.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/genalloc.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +#include <linux/videodev2.h>
> +#include <linux/workqueue.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/videobuf2-core.h>
> +#include <media/videobuf2-vmalloc.h>
> +
> +#include "rkvdec2.h"
> +
> +static int rkvdec2_try_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct rkvdec2_ctx *ctx = container_of(ctrl->handler, struct rkvdec2_ctx, ctrl_hdl);
> +	const struct rkvdec2_coded_fmt_desc *desc = ctx->coded_fmt_desc;
> +
> +	if (desc->ops->try_ctrl)
> +		return desc->ops->try_ctrl(ctx, ctrl);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops rkvdec2_ctrl_ops = {
> +	.try_ctrl = rkvdec2_try_ctrl,
> +};
> +
> +static const struct rkvdec2_ctrl_desc rkvdec2_h264_ctrl_descs[] = {
> +	{
> +		.cfg.id = V4L2_CID_STATELESS_H264_DECODE_PARAMS,
> +	},
> +	{
> +		.cfg.id = V4L2_CID_STATELESS_H264_SPS,
> +		.cfg.ops = &rkvdec2_ctrl_ops,
> +	},
> +	{
> +		.cfg.id = V4L2_CID_STATELESS_H264_PPS,
> +	},
> +	{
> +		.cfg.id = V4L2_CID_STATELESS_H264_SCALING_MATRIX,
> +	},
> +	{
> +		.cfg.id = V4L2_CID_STATELESS_H264_DECODE_MODE,
> +		.cfg.min = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
> +		.cfg.max = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
> +		.cfg.def = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
> +	},
> +	{
> +		.cfg.id = V4L2_CID_STATELESS_H264_START_CODE,
> +		.cfg.min = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
> +		.cfg.def = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
> +		.cfg.max = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
> +	},
> +	{
> +		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
> +		.cfg.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,

Should be V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE

> +		.cfg.max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +		.cfg.menu_skip_mask =
> +			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
> +		.cfg.def = V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
> +	},
> +	{
> +		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_LEVEL,
> +		.cfg.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
> +		.cfg.max = V4L2_MPEG_VIDEO_H264_LEVEL_6_1,
> +	},
> +};
> +
> +static const struct rkvdec2_ctrls rkvdec2_h264_ctrls = {
> +	.ctrls = rkvdec2_h264_ctrl_descs,
> +	.num_ctrls = ARRAY_SIZE(rkvdec2_h264_ctrl_descs),
> +};
> +
> +static const u32 rkvdec2_h264_decoded_fmts[] = {
> +	V4L2_PIX_FMT_NV12
> +};
> +
> +static const struct rkvdec2_coded_fmt_desc rkvdec2_coded_fmts[] = {
> +	{
> +		.fourcc = V4L2_PIX_FMT_H264_SLICE,
> +		.frmsize = {
> +			.min_width = 16,
> +			.max_width =  65520,
> +			.step_width = 16,
> +			.min_height = 16,
> +			.max_height =  65520,
> +			.step_height = 16,
> +		},
> +		.ctrls = &rkvdec2_h264_ctrls,
> +		.ops = &rkvdec2_h264_fmt_ops,
> +		.num_decoded_fmts = ARRAY_SIZE(rkvdec2_h264_decoded_fmts),
> +		.decoded_fmts = rkvdec2_h264_decoded_fmts,
> +		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
> +	},
> +};
> +
> +enum rcb_axis {
> +	PIC_WIDTH = 0,
> +	PIC_HEIGHT = 1
> +};
> +
> +struct rcb_size_info {
> +	u8 multiplier;
> +	enum rcb_axis axis;
> +};
> +
> +static struct rcb_size_info rcb_sizes[] = {
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
> +#define RCB_SIZE(n) (rcb_sizes[(n)].multiplier * (rcb_sizes[(n)].axis ? height : width))

This should probably take width and height, e.g.:

  RCB_SIZE(n,w,h) (rcb_sizes[(n)].multiplier * (rcb_sizes[(n)].axis ? (h) : (w)))

> +
> +static const struct rkvdec2_coded_fmt_desc *
> +rkvdec2_find_coded_fmt_desc(u32 fourcc)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(rkvdec2_coded_fmts); i++) {
> +		if (rkvdec2_coded_fmts[i].fourcc == fourcc)
> +			return &rkvdec2_coded_fmts[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +static void rkvdec2_reset_fmt(struct rkvdec2_ctx *ctx, struct v4l2_format *f,
> +			      u32 fourcc)
> +{
> +	memset(f, 0, sizeof(*f));
> +	f->fmt.pix_mp.pixelformat = fourcc;
> +	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
> +	f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_REC709;
> +	f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> +	f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
> +	f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
> +}
> +
> +static void rkvdec2_reset_coded_fmt(struct rkvdec2_ctx *ctx)
> +{
> +	struct v4l2_format *f = &ctx->coded_fmt;
> +
> +	ctx->coded_fmt_desc = &rkvdec2_coded_fmts[0];
> +	rkvdec2_reset_fmt(ctx, f, ctx->coded_fmt_desc->fourcc);
> +
> +	f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +	f->fmt.pix_mp.width = ctx->coded_fmt_desc->frmsize.min_width;
> +	f->fmt.pix_mp.height = ctx->coded_fmt_desc->frmsize.min_height;
> +
> +	if (ctx->coded_fmt_desc->ops->adjust_fmt)
> +		ctx->coded_fmt_desc->ops->adjust_fmt(ctx, f);
> +}
> +
> +static void rkvdec2_reset_decoded_fmt(struct rkvdec2_ctx *ctx)
> +{
> +	struct v4l2_format *f = &ctx->decoded_fmt;
> +
> +	rkvdec2_reset_fmt(ctx, f, ctx->coded_fmt_desc->decoded_fmts[0]);
> +	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +	v4l2_fill_pixfmt_mp(&f->fmt.pix_mp,
> +			    ctx->coded_fmt_desc->decoded_fmts[0],
> +			    ctx->coded_fmt.fmt.pix_mp.width,
> +			    ctx->coded_fmt.fmt.pix_mp.height);
> +
> +	ctx->colmv_offset = f->fmt.pix_mp.plane_fmt[0].sizeimage;
> +
> +	f->fmt.pix_mp.plane_fmt[0].sizeimage += 128 *
> +		DIV_ROUND_UP(f->fmt.pix_mp.width, 16) *
> +		DIV_ROUND_UP(f->fmt.pix_mp.height, 16);
> +}
> +
> +static int rkvdec2_enum_framesizes(struct file *file, void *priv,
> +				   struct v4l2_frmsizeenum *fsize)
> +{
> +	const struct rkvdec2_coded_fmt_desc *fmt;

This should probably be named desc to match other uses.

Regards,
Jonas

> +
> +	if (fsize->index != 0)
> +		return -EINVAL;
> +
> +	fmt = rkvdec2_find_coded_fmt_desc(fsize->pixel_format);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
> +	fsize->stepwise = fmt->frmsize;
> +	return 0;
> +}
> +

[snip]

