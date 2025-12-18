Return-Path: <linux-media+bounces-49034-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6262CC9DFF
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 01:18:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 01B76300E823
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 00:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DD4D1F3FEC;
	Thu, 18 Dec 2025 00:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="Q77kEUus"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8865C1E3762
	for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 00:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766017105; cv=none; b=O/v9gSxvxdcpvlXBX0ntZnmNx4Ef6qHy0WplEOhirqU791OHu/gdHgL9hPowDzEIsVcwpwsfpipIJpGkJdkuz4VD8Ot1DCksANtpU/dGTmemWugQdr7X6N40qQoSTnNTRzC69UHTKA9iiIvJtoRfYCvkNhN5Zr20BL0cEqYXl5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766017105; c=relaxed/simple;
	bh=TKGlU58dS6woIlvsKTk0VsP7dlAlg3IRwQ4WxfnIIxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E+p1ah+5Z/v6rsNDGy9RdT7q+t7w2Z7VxsA5SQLuZGdePs9r5GGvRMAc/Fv8noew7M/sMUNnbyz1xYvU8MOyYTTyuY1dNc6GnRcw/foJwxWjbEsQeayFkx/7KiCzehfgNmt1fKkzcGZ17MSw/t+EneX0kHAswx94zoqoi0Q7ZHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=Q77kEUus; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1766017097;
 bh=QiMwXChedDb71gFAtQwPRK3ltp8U+EHX3B25esajw0k=;
 b=Q77kEUusTVui1FQkVAzeg2NR18C/U6t2AeMqFQKv3fl3Vxm83Tv7nM3qRWZgwpmAqt1vpdDC6
 jLloy/Jdcq89kutp1PBUbxKeEHlmiFwIpJ64fy8XfB2jvJfPzbCntXU3ZvP5mXzLBG0QxsUKoZd
 LPC4iRk3Ne0gLy02famMRiKIT5DZrhsvsXhyxW3XTvUsnJvAAoP85yS1yr9bzHqG3FZFjHoxOxp
 45WdTYP+YZa743cPeDpS0cDvElJKBrIa6b8xzamc24MkJkYZ/8hCTyb9Tm7hUDmz7gwrLnT1FBV
 4cfGTU9G/SErgD8PTh8VfWNa0CG0isxnmxDndDod0hqg==
X-Forward-Email-ID: 69434844a17553c9d9bfc2ac
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.0.6
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <3b8cce03-5f70-4462-89fe-4a54dd7f5bca@kwiboo.se>
Date: Thu, 18 Dec 2025 01:18:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 15/17] media: rkvdec: Add H264 support for the VDPU383
 variant
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>, Ricardo Ribalda <ribalda@chromium.org>,
 Hans Verkuil <hverkuil@kernel.org>, Yunke Cao <yunkec@google.com>,
 Hans de Goede <hansg@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Pavan Bobba <opensource206@gmail.com>,
 James Cowgill <james.cowgill@blaize.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, linux-kernel@vger.kernel.org
References: <20251217174059.1341784-1-detlev.casanova@collabora.com>
 <20251217174059.1341784-16-detlev.casanova@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20251217174059.1341784-16-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Detlev,

On 12/17/2025 6:40 PM, Detlev Casanova wrote:
> This variant is used on the RK3576 SoC.
> 
> The moving vectors size requirements are slightly different so support
> for a colmv_size function per variant is added.
> 
> Also, the link registers are used to start the decoder and read IRQ status.
> Per variant support for named register sections is added.
> 
> The fluster score is 128/135 for JVT-AVC_V1, with MPS_MW_A failing in
> addition to the usual ones.
> The other test suites are not supported yet.
> 
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../media/platform/rockchip/rkvdec/Makefile   |   1 +
>  .../rockchip/rkvdec/rkvdec-vdpu383-h264.c     | 582 ++++++++++++++++++
>  .../rockchip/rkvdec/rkvdec-vdpu383-regs.h     | 281 +++++++++
>  .../media/platform/rockchip/rkvdec/rkvdec.c   | 118 +++-
>  .../media/platform/rockchip/rkvdec/rkvdec.h   |   8 +
>  5 files changed, 984 insertions(+), 6 deletions(-)
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h
> 
> diff --git a/drivers/media/platform/rockchip/rkvdec/Makefile b/drivers/media/platform/rockchip/rkvdec/Makefile
> index 7bfd95151e40..a58d4aede2fe 100644
> --- a/drivers/media/platform/rockchip/rkvdec/Makefile
> +++ b/drivers/media/platform/rockchip/rkvdec/Makefile
> @@ -9,4 +9,5 @@ rockchip-vdec-y += \
>  		   rkvdec-hevc-common.o \
>  		   rkvdec-rcb.o \
>  		   rkvdec-vdpu381-h264.o \
> +		   rkvdec-vdpu383-h264.o \
>  		   rkvdec-vp9.o
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
> new file mode 100644
> index 000000000000..d8419085bdd8
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c

[snip]

> +static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
> +{
> +	struct rkvdec_dev *rkvdec = ctx->dev;
> +	struct rkvdec_h264_priv_tbl *priv_tbl;
> +	struct rkvdec_h264_ctx *h264_ctx;
> +	struct v4l2_ctrl *ctrl;
> +	int ret;
> +
> +	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
> +			      V4L2_CID_STATELESS_H264_SPS);
> +	if (!ctrl)
> +		return -EINVAL;
> +
> +	ret = rkvdec_h264_validate_sps(ctx, ctrl->p_new.p_h264_sps);
> +	if (ret)
> +		return ret;

I recall some older mail thread that we should not have to validate sps
in start ops. It is validated in try_ctrl and is expected to always be
in a valid state.

This can most likely be dropped, it was removed from the HEVC start ops.

> +
> +	h264_ctx = kzalloc(sizeof(*h264_ctx), GFP_KERNEL);
> +	if (!h264_ctx)
> +		return -ENOMEM;
> +
> +	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
> +				      &h264_ctx->priv_tbl.dma, GFP_KERNEL);
> +	if (!priv_tbl) {
> +		ret = -ENOMEM;
> +		goto err_free_ctx;
> +	}
> +
> +	h264_ctx->priv_tbl.size = sizeof(*priv_tbl);
> +	h264_ctx->priv_tbl.cpu = priv_tbl;
> +	memcpy(priv_tbl->cabac_table, rkvdec_h264_cabac_table,
> +	       sizeof(rkvdec_h264_cabac_table));
> +
> +	ctx->priv = h264_ctx;
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
> +	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
> +	struct rkvdec_dev *rkvdec = ctx->dev;
> +
> +	dma_free_coherent(rkvdec->dev, h264_ctx->priv_tbl.size,
> +			  h264_ctx->priv_tbl.cpu, h264_ctx->priv_tbl.dma);
> +	kfree(h264_ctx);
> +}
> +
> +static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
> +{
> +	struct v4l2_h264_reflist_builder reflist_builder;
> +	struct rkvdec_dev *rkvdec = ctx->dev;
> +	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
> +	struct rkvdec_h264_run run;
> +	struct rkvdec_h264_priv_tbl *tbl = h264_ctx->priv_tbl.cpu;
> +	u32 watchdog_time;
> +	u64 timeout_threshold;
> +	unsigned long axi_rate;
> +
> +	rkvdec_h264_run_preamble(ctx, &run);
> +
> +	/* Build the P/B{0,1} ref lists. */
> +	v4l2_h264_init_reflist_builder(&reflist_builder, run.decode_params,
> +				       run.sps, run.decode_params->dpb);
> +	v4l2_h264_build_p_ref_list(&reflist_builder, h264_ctx->reflists.p);
> +	v4l2_h264_build_b_ref_lists(&reflist_builder, h264_ctx->reflists.b0,
> +				    h264_ctx->reflists.b1);
> +
> +	assemble_hw_scaling_list(&run, &tbl->scaling_list);
> +	assemble_hw_pps(ctx, &run);
> +	lookup_ref_buf_idx(ctx, &run);
> +	assemble_hw_rps(&reflist_builder, &run, &h264_ctx->reflists, &tbl->rps);
> +
> +	config_registers(ctx, &run);
> +
> +	rkvdec_run_postamble(ctx, &run.base);
> +
> +	/* Set watchdog at 2 times the hardware timeout threshold */
> +	timeout_threshold = h264_ctx->regs.common.reg013_core_timeout_threshold;
> +	axi_rate = clk_get_rate(rkvdec->axi_clk);
> +
> +	if (axi_rate)
> +		watchdog_time = 2 * (1000 * timeout_threshold) / axi_rate;
> +	else
> +		watchdog_time = 2000;
> +	schedule_delayed_work(&rkvdec->watchdog_work,
> +			      msecs_to_jiffies(watchdog_time));
> +
> +	/* Start decoding! */
> +	writel(timeout_threshold, rkvdec->link + VDPU383_LINK_TIMEOUT_THRESHOLD);
> +	writel(0, rkvdec->link + VDPU383_LINK_IP_ENABLE);
> +	writel(VDPU383_DEC_E_BIT, rkvdec->link + VDPU383_LINK_DEC_ENABLE);
> +
> +	return 0;
> +}
> +
> +static int rkvdec_h264_try_ctrl(struct rkvdec_ctx *ctx, struct v4l2_ctrl *ctrl)
> +{
> +	if (ctrl->id == V4L2_CID_STATELESS_H264_SPS)
> +		return rkvdec_h264_validate_sps(ctx, ctrl->p_new.p_h264_sps);
> +
> +	return 0;
> +}
> +
> +const struct rkvdec_coded_fmt_ops rkvdec_vdpu383_h264_fmt_ops = {
> +	.adjust_fmt = rkvdec_h264_adjust_fmt,
> +	.get_image_fmt = rkvdec_h264_get_image_fmt,
> +	.start = rkvdec_h264_start,
> +	.stop = rkvdec_h264_stop,
> +	.run = rkvdec_h264_run,
> +	.try_ctrl = rkvdec_h264_try_ctrl,
> +};

[snip]

> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> index 1ddae1b23434..ceb56516bd90 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -9,6 +9,7 @@
>   * Copyright (C) 2011 Samsung Electronics Co., Ltd.
>   */
>  
> +#include <linux/hw_bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/genalloc.h>
>  #include <linux/interrupt.h>
> @@ -30,6 +31,7 @@
>  #include "rkvdec.h"
>  #include "rkvdec-regs.h"
>  #include "rkvdec-vdpu381-regs.h"
> +#include "rkvdec-vdpu383-regs.h"
>  #include "rkvdec-rcb.h"
>  
>  static bool rkvdec_image_fmt_match(enum rkvdec_image_fmt fmt1,
> @@ -86,17 +88,27 @@ static bool rkvdec_is_valid_fmt(struct rkvdec_ctx *ctx, u32 fourcc,
>  	return false;
>  }
>  
> +static u32 rkvdec_colmv_size(u16 width, u16 height)
> +{
> +	return 128 * DIV_ROUND_UP(width, 16) * DIV_ROUND_UP(height, 16);
> +}
> +
> +static u32 vdpu383_colmv_size(u16 width, u16 height)
> +{
> +	return ALIGN(width, 64) * ALIGN(height, 16);
> +}
> +
>  static void rkvdec_fill_decoded_pixfmt(struct rkvdec_ctx *ctx,
>  				       struct v4l2_pix_format_mplane *pix_mp)
>  {
> +	const struct rkvdec_variant *variant = ctx->dev->variant;
> +
>  	v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat,
>  			    pix_mp->width, pix_mp->height);
>  
>  	ctx->colmv_offset = pix_mp->plane_fmt[0].sizeimage;
>  
> -	pix_mp->plane_fmt[0].sizeimage += 128 *
> -		DIV_ROUND_UP(pix_mp->width, 16) *
> -		DIV_ROUND_UP(pix_mp->height, 16);
> +	pix_mp->plane_fmt[0].sizeimage += variant->ops->colmv_size(pix_mp->width, pix_mp->height);

nit: The rest of this function use line breake to keep line lengt below
or around 80 chars, this long line feel out of place.

Maybe:

	pix_mp->plane_fmt[0].sizeimage +=
		variant->ops->colmv_size(pix_mp->width, pix_mp->height);

>  }
>  
>  static void rkvdec_reset_fmt(struct rkvdec_ctx *ctx, struct v4l2_format *f,
> @@ -391,6 +403,26 @@ static const struct rkvdec_coded_fmt_desc vdpu381_coded_fmts[] = {
>  	},
>  };
>  
> +static const struct rkvdec_coded_fmt_desc vdpu383_coded_fmts[] = {
> +	{
> +		.fourcc = V4L2_PIX_FMT_H264_SLICE,
> +		.frmsize = {
> +			.min_width = 64,
> +			.max_width =  65520,
> +			.step_width = 64,
> +			.min_height = 64,
> +			.max_height =  65520,
> +			.step_height = 16,
> +		},
> +		.ctrls = &rkvdec_h264_ctrls,
> +		.ops = &rkvdec_vdpu383_h264_fmt_ops,
> +		.num_decoded_fmts = ARRAY_SIZE(rkvdec_h264_decoded_fmts),
> +		.decoded_fmts = rkvdec_h264_decoded_fmts,
> +		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
> +		.capability = RKVDEC_CAPABILITY_H264,
> +	},
> +};
> +
>  static bool rkvdec_is_capable(struct rkvdec_ctx *ctx, unsigned int capability)
>  {
>  	return (ctx->dev->variant->capabilities & capability) == capability;
> @@ -1294,6 +1326,35 @@ static irqreturn_t vdpu381_irq_handler(struct rkvdec_ctx *ctx)
>  	return IRQ_HANDLED;
>  }
>  
> +static irqreturn_t vdpu383_irq_handler(struct rkvdec_ctx *ctx)
> +{
> +	struct rkvdec_dev *rkvdec = ctx->dev;
> +	enum vb2_buffer_state state;
> +	bool need_reset = 0;
> +	u32 status;
> +
> +	status = readl(rkvdec->link + VDPU383_LINK_STA_INT);
> +	writel(FIELD_PREP_WM16(VDPU383_STA_INT_ALL, 0), rkvdec->link + VDPU383_LINK_STA_INT);
> +	/* On vdpu383, the interrupts must be disabled */
> +	writel(FIELD_PREP_WM16(VDPU383_INT_EN_IRQ | VDPU383_INT_EN_LINE_IRQ, 0),
> +	       rkvdec->link + VDPU383_LINK_INT_EN);
> +
> +	if (status & VDPU383_STA_INT_DEC_RDY_STA) {
> +		state = VB2_BUF_STATE_DONE;
> +	} else {
> +		state = VB2_BUF_STATE_ERROR;
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
>  static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
>  {
>  	struct rkvdec_dev *rkvdec = priv;
> @@ -1374,8 +1435,22 @@ static const struct rcb_size_info vdpu381_rcb_sizes[] = {
>  	{67,	PIC_HEIGHT},	// filtc col
>  };
>  
> +static const struct rcb_size_info vdpu383_rcb_sizes[] = {
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
>  static const struct rkvdec_variant_ops rk3399_variant_ops = {
>  	.irq_handler = rk3399_irq_handler,
> +	.colmv_size = rkvdec_colmv_size,
>  };
>  
>  static const struct rkvdec_variant rk3288_rkvdec_variant = {
> @@ -1409,6 +1484,7 @@ static const struct rkvdec_variant rk3399_rkvdec_variant = {
>  
>  static const struct rkvdec_variant_ops vdpu381_variant_ops = {
>  	.irq_handler = vdpu381_irq_handler,
> +	.colmv_size = rkvdec_colmv_size,
>  };
>  
>  static const struct rkvdec_variant rk3588_vdpu381_variant = {
> @@ -1417,6 +1493,22 @@ static const struct rkvdec_variant rk3588_vdpu381_variant = {
>  	.rcb_sizes = vdpu381_rcb_sizes,
>  	.num_rcb_sizes = ARRAY_SIZE(vdpu381_rcb_sizes),
>  	.ops = &vdpu381_variant_ops,
> +	.named_regs = true,

Why is this added here in this patch ? Should probably be added in prior
patch with the lookup for link regs added in this patch ?

> +	.capabilities = RKVDEC_CAPABILITY_H264,
> +};
> +
> +static const struct rkvdec_variant_ops vdpu383_variant_ops = {
> +	.irq_handler = vdpu383_irq_handler,
> +	.colmv_size = vdpu383_colmv_size,
> +};
> +
> +static const struct rkvdec_variant rk3576_vdpu383_variant = {
> +	.coded_fmts = vdpu383_coded_fmts,
> +	.num_coded_fmts = ARRAY_SIZE(vdpu383_coded_fmts),
> +	.rcb_sizes = vdpu383_rcb_sizes,
> +	.num_rcb_sizes = ARRAY_SIZE(vdpu383_rcb_sizes),
> +	.ops = &vdpu383_variant_ops,
> +	.named_regs = true,
>  	.capabilities = RKVDEC_CAPABILITY_H264,
>  };
>  
> @@ -1437,6 +1529,10 @@ static const struct of_device_id of_rkvdec_match[] = {
>  		.compatible = "rockchip,rk3588-vdec",
>  		.data = &rk3588_vdpu381_variant,
>  	},
> +	{
> +		.compatible = "rockchip,rk3576-vdec",
> +		.data = &rk3576_vdpu383_variant,
> +	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, of_rkvdec_match);
> @@ -1472,9 +1568,19 @@ static int rkvdec_probe(struct platform_device *pdev)
>  	rkvdec->num_clocks = ret;
>  	rkvdec->axi_clk = devm_clk_get(&pdev->dev, "axi");
>  
> -	rkvdec->regs = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(rkvdec->regs))
> -		return PTR_ERR(rkvdec->regs);
> +	if (rkvdec->variant->named_regs) {
> +		rkvdec->regs = devm_platform_ioremap_resource_byname(pdev, "function");
> +		if (IS_ERR(rkvdec->regs))
> +			return PTR_ERR(rkvdec->regs);
> +
> +		rkvdec->link = devm_platform_ioremap_resource_byname(pdev, "link");
> +		if (IS_ERR(rkvdec->link))
> +			return PTR_ERR(rkvdec->link);
> +	} else {
> +		rkvdec->regs = devm_platform_ioremap_resource(pdev, 0);
> +		if (IS_ERR(rkvdec->regs))
> +			return PTR_ERR(rkvdec->regs);
> +	}
>  
>  	ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
>  	if (ret) {
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> index 1ad9a4fc31db..2f924c924828 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -77,6 +77,7 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
>  
>  struct rkvdec_variant_ops {
>  	irqreturn_t (*irq_handler)(struct rkvdec_ctx *ctx);
> +	u32 (*colmv_size)(u16 width, u16 height);
>  };
>  
>  struct rkvdec_variant {
> @@ -86,6 +87,7 @@ struct rkvdec_variant {
>  	const struct rcb_size_info *rcb_sizes;
>  	size_t num_rcb_sizes;
>  	const struct rkvdec_variant_ops *ops;
> +	bool named_regs;

nit: Maybe use_named_regs or similar ?

Maybe this should be inverted as I suspect all new variants are expected
to use named regs ?

>  	unsigned int capabilities;
>  	unsigned int quirks;
>  };
> @@ -138,6 +140,7 @@ struct rkvdec_dev {
>  	unsigned int num_clocks;
>  	struct clk *axi_clk;
>  	void __iomem *regs;
> +	void __iomem *link;
>  	struct mutex vdev_lock; /* serializes ioctls */
>  	struct delayed_work watchdog_work;
>  	struct gen_pool *sram_pool;
> @@ -182,10 +185,15 @@ void rkvdec_memcpy_toio(void __iomem *dst, void *src, size_t len);
>  
>  void rkvdec_quirks_disable_qos(struct rkvdec_ctx *ctx);
>  
> +/* RKVDEC ops */
>  extern const struct rkvdec_coded_fmt_ops rkvdec_h264_fmt_ops;
>  extern const struct rkvdec_coded_fmt_ops rkvdec_hevc_fmt_ops;
>  extern const struct rkvdec_coded_fmt_ops rkvdec_vp9_fmt_ops;
>  
> +/* VDPU381 ops */

nit: This comment and the one above should be added in prior patch.

Regards,
Jonas

>  extern const struct rkvdec_coded_fmt_ops rkvdec_vdpu381_h264_fmt_ops;
>  
> +/* VDPU383 ops */
> +extern const struct rkvdec_coded_fmt_ops rkvdec_vdpu383_h264_fmt_ops;
> +
>  #endif /* RKVDEC_H_ */


