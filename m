Return-Path: <linux-media+bounces-60644-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uE+VCH9d+2n2aAMAu9opvQ
	(envelope-from <linux-media+bounces-60644-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 17:25:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C944DD2AD
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 17:25:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7095301A915
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 15:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F29CA44DB76;
	Wed,  6 May 2026 15:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wa280qAs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778733EF65C;
	Wed,  6 May 2026 15:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081107; cv=none; b=FJllu3D3bCwTERFWfmnfMNaLz+fH67KpsrxOQBbeFsyNQ/dI/X6rHR6jSpF1YkO938+MXn1x+vP1tWkI00E6YiVYXVB0oFZGkDT2Eqm86IwHTgI/ydQ8kUm8crDt++xWdJBfbiF59PnDEegLptI9KZ9QHB/FD195tMBhy4/TDCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081107; c=relaxed/simple;
	bh=MW8z3Zat+Rl0//dJmrdX/xOYu7Hx2bc+NoF5TMIBbKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rg/hxq2/VYebAQf5asKep6oZkgcF+6WFSCe0XV4iH+KJb4pxZ/3EJ12zhYsw2DZz8eD9kODq81+uyy2Y3iHCKHroPISDs8LIJX+4HdDl2MPxCOJoJnrUQMdVavoGVgS7JfQSLo36652nt2PuV4XFn6YOobVZhrg2ChrPrAUS9cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wa280qAs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C108DA;
	Wed,  6 May 2026 17:25:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778081100;
	bh=MW8z3Zat+Rl0//dJmrdX/xOYu7Hx2bc+NoF5TMIBbKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wa280qAsWd6S3vg69LZk0Me9cnQ486CkHbot7/u33H5r8Oxl3B+EQR6rbfEEGp3gm
	 kI5OpzgFv3VZyEUpOhbRDheXM5K3Uo87yxmAAzjCatYCwFKDzVUSAQ46C9mGlJNWh+
	 rv66gIHeX/T84rpzqal5WqzRF3piD0mifzvQ7mHI=
Date: Wed, 6 May 2026 17:25:00 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jai Luthra <jai.luthra+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [v8 08/14] media: rppx1: bls: Add support for black level
 compensation
Message-ID: <aftb9KDum80Efwh7@zed>
References: <20260504010556.2796398-1-niklas.soderlund+renesas@ragnatech.se>
 <20260504010556.2796398-9-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260504010556.2796398-9-niklas.soderlund+renesas@ragnatech.se>
X-Rspamd-Queue-Id: 70C944DD2AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60644-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ragnatech.se:email]

Hi Niklas

On Mon, May 04, 2026 at 03:05:50AM +0200, Niklas Söderlund wrote:
> Extend the RPPX1 driver to allow setting the black level measurement
> and gain configuration and consuming the resulting statistics. It uses
> the RPPX1 framework for parameters and its writer abstraction to allow
> the user to control how, and when, configuration is applied to the
> RPPX1.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Co-developed-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
> ---
>  .../platform/dreamchip/rppx1/rpp_module.h     |   2 +
>  .../platform/dreamchip/rppx1/rpp_params.c     |   5 +
>  .../platform/dreamchip/rppx1/rpp_stats.c      |   8 ++
>  .../platform/dreamchip/rppx1/rppx1_bls.c      | 121 ++++++++++++++++
>  .../uapi/linux/media/dreamchip/rppx1-config.h | 131 +++++++++++++++++-
>  5 files changed, 265 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> index 5725243d0119..9c761448717b 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> +++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> @@ -85,6 +85,7 @@ void rpp_module_clrset(struct rpp_module *mod, u32 offset, u32 mask, u32 value);
>
>  union rppx1_params_block {
>  	struct v4l2_isp_params_block_header header;
> +	struct rppx1_bls_params bls;
>  	struct rppx1_awbg_params awbg;
>  	struct rppx1_hist_params hist;
>  	struct rppx1_exm_params exm;
> @@ -93,6 +94,7 @@ union rppx1_params_block {
>
>  union rppx1_stats_block {
>  	struct v4l2_isp_params_block_header header;
> +	struct rppx1_bls_stats bls;
>  	struct rppx1_hist_stats hist;
>  	struct rppx1_exm_stats exm;
>  	struct rppx1_wbmeas_stats wbmeas;
> diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> index 6472bec6fba3..7b006c68381b 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> +++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> @@ -16,6 +16,8 @@
>
>  static const struct v4l2_isp_block_type_info
>  rppx1_ext_params_blocks_info[] = {
> +	RPPX1_PARAMS_BLOCK_INFO(BLS_PRE1, bls),
> +	RPPX1_PARAMS_BLOCK_INFO(BLS_PRE2, bls),
>  	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
>  	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE2, awbg),
>  	RPPX1_PARAMS_BLOCK_INFO(HIST_PRE1, hist),
> @@ -58,6 +60,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
>  		block_offset += block->header.size;
>
>  		switch (block->header.type) {
> +		case RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1:
> +			module = &rpp->pre1.bls;
> +			break;
>  		case RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1:
>  			module = &rpp->pre1.awbg;
>  			break;
> diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
> index b265e858cfd1..c2c0fc109e90 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
> +++ b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
> @@ -16,6 +16,7 @@
>
>  static const struct v4l2_isp_block_type_info
>  rppx1_stats_blocks_info[] = {
> +	RPPX1_STATS_BLOCK_INFO(BLS_PRE1, bls),
>  	RPPX1_STATS_BLOCK_INFO(HIST_POST, hist),
>  	RPPX1_STATS_BLOCK_INFO(EXM_PRE1, exm),
>  	RPPX1_STATS_BLOCK_INFO(WBMEAS_POST, wbmeas),
> @@ -51,6 +52,13 @@ void rppx1_stats_fill_isr(struct rppx1 *rpp, u32 isc, void *buf)
>  			return;
>
>  		rpp_module_call(&rpp->pre1.exm, fill_stats, block);
> +
> +		block = rppx1_init_stats_block(rpp, stats,
> +					       RPPX1_STATS_BLOCK_TYPE_BLS_PRE1);
> +		if (!block)
> +			return;
> +
> +		rpp_module_call(&rpp->pre1.bls, fill_stats, block);
>  	}
>
>  	if (isc & RPPX1_IRQ_ID_POST_AWB_MEAS) {
> diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c b/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
> index de7008befd8e..a3cb03fd97d0 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
> +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
> @@ -5,6 +5,7 @@
>   */
>
>  #include "rpp_module.h"
> +#include "rppx1.h"
>
>  #define BLS_VERSION_REG				0x0000
>
> @@ -31,6 +32,8 @@
>  #define BLS_B_MEASURED_REG			0x0040
>  #define BLS_C_MEASURED_REG			0x0044
>  #define BLS_D_MEASURED_REG			0x0048
> +#define BLS_PRE1_FIXED_MASK			GENMASK(24, 0)
> +#define BLS_PRE2_FIXED_MASK			GENMASK(12, 0)
>
>  static int rppx1_bls_probe(struct rpp_module *mod)
>  {
> @@ -54,6 +57,124 @@ static int rppx1_bls_probe(struct rpp_module *mod)
>  	return 0;
>  }
>
> +static void
> +rppx1_bls_swap_regs(struct rpp_module *mod, const u32 input[4], u32 output[4])
> +{
> +	static const unsigned int swap[4][4] = {
> +		[RPP_RGGB] = { 0, 1, 2, 3 },
> +		[RPP_GRBG] = { 1, 0, 3, 2 },
> +		[RPP_GBRG] = { 2, 3, 0, 1 },
> +		[RPP_BGGR] = { 3, 2, 1, 0 },
> +	};
> +
> +	/* Swap to pattern used in our path, PRE1 or PRE2. */
> +	struct rpp_module *acq = mod == &mod->rpp->pre1.bls ?
> +		&mod->rpp->pre1.acq : &mod->rpp->pre2.bls;
> +	enum rpp_raw_pattern pattern = acq->info.acq.raw_pattern;
> +
> +	for (unsigned int i = 0; i < 4; ++i)
> +		output[i] = input[swap[pattern][i]];
> +}
> +
> +static int
> +rppx1_bls_fill_params(struct rpp_module *mod,
> +		      const union rppx1_params_block *block,
> +		      rppx1_reg_write write, void *priv)
> +{
> +	const struct rppx1_bls_params *cfg = &block->bls;
> +
> +	/* If the modules is disabled, simply bypass it. */
> +	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
> +		write(priv, mod->base + BLS_CTRL_REG, 0);
> +		return 0;
> +	}
> +
> +	u32 ctrl = BLS_CTRL_BLS_EN;
> +
> +	if (cfg->mode == RPPX1_BLS_MODE_FIXED) {
> +		static const u32 regs[] = {
> +			BLS_A_FIXED_REG,
> +			BLS_B_FIXED_REG,
> +			BLS_C_FIXED_REG,
> +			BLS_D_FIXED_REG,
> +		};
> +		u32 swapped[4];
> +
> +		rppx1_bls_swap_regs(mod, regs, swapped);
> +
> +		/*
> +		 * The PRE1 pipe fixed values are 24-bits + 1 sign bit, while
> +		 * the PRE2 pipe values are 12-bits + 1 sign bit.
> +		 */
> +		u32 mask;
> +
> +		switch (cfg->header.type) {
> +		case RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1:
> +			mask = BLS_PRE1_FIXED_MASK;
> +			break;
> +		case RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2:
> +			mask = BLS_PRE2_FIXED_MASK;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +
> +		write(priv, mod->base + swapped[0], cfg->fixed.a & mask);
> +		write(priv, mod->base + swapped[1], cfg->fixed.b & mask);
> +		write(priv, mod->base + swapped[2], cfg->fixed.c & mask);
> +		write(priv, mod->base + swapped[3], cfg->fixed.d & mask);
> +	} else {
> +		write(priv, mod->base + BLS_SAMPLES_REG, cfg->samples);
> +
> +		if (cfg->en_windows & RPPX1_BLS_WIN_EN_WIN1) {
> +			write(priv, mod->base + BLS_H1_START_REG, cfg->window1.h_offs);
> +			write(priv, mod->base + BLS_H1_STOP_REG, cfg->window1.h_size);
> +			write(priv, mod->base + BLS_V1_START_REG, cfg->window1.v_offs);
> +			write(priv, mod->base + BLS_V1_STOP_REG, cfg->window1.v_size);
> +			ctrl |= BLS_CTRL_BLS_WIN1;
> +		}
> +
> +		if (cfg->en_windows & RPPX1_BLS_WIN_EN_WIN2) {
> +			write(priv, mod->base + BLS_H2_START_REG, cfg->window2.h_offs);
> +			write(priv, mod->base + BLS_H2_STOP_REG, cfg->window2.h_size);
> +			write(priv, mod->base + BLS_V2_START_REG, cfg->window2.v_offs);
> +			write(priv, mod->base + BLS_V2_STOP_REG, cfg->window2.v_size);
> +			ctrl |= BLS_CTRL_BLS_WIN2;
> +		}
> +
> +		ctrl |= BLS_CTRL_BLS_MODE_MEASURED;
> +	}
> +
> +	write(priv, mod->base + BLS_CTRL_REG, ctrl);
> +
> +	return 0;
> +}
> +
> +static int rppx1_bls_fill_stats(struct rpp_module *mod,
> +				union rppx1_stats_block *block)
> +{

I had left out bls_stats for two reasons:
- they need a properly configured sensor to produce optically black
  pixels
- I don't think they should be reported in stats for each frame, after
  all their measurement should be fixed ?

All in all this seems like a feature to be used for calibration. I'm
not saying we should prevent it from being used, but maybe reporting
it through stats is not the best way ?


> +	struct rppx1_bls_stats *stats = &block->bls;
> +
> +	static const u32 regs[] = {
> +		BLS_A_MEASURED_REG,
> +		BLS_B_MEASURED_REG,
> +		BLS_C_MEASURED_REG,
> +		BLS_D_MEASURED_REG,
> +	};
> +	u32 swapped[4];
> +
> +	rppx1_bls_swap_regs(mod, regs, swapped);
> +
> +	stats->meas_r = rpp_module_read(mod, swapped[0]);
> +	stats->meas_gr = rpp_module_read(mod, swapped[1]);
> +	stats->meas_gb = rpp_module_read(mod, swapped[2]);
> +	stats->meas_b = rpp_module_read(mod, swapped[3]);

For params I used 'a' 'b' 'c' and 'd' to match the registers. True
that with rppx1_bls_swap_regs() the a,b,c and d channels gets mapped
to the color ones. Should we use color channels for params as well ?

> +
> +	return 0;
> +}
> +
>  const struct rpp_module_ops rppx1_bls_ops = {
>  	.probe = rppx1_bls_probe,
> +	.fill_params = rppx1_bls_fill_params,
> +	.fill_stats = rppx1_bls_fill_stats,
>  };
> diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
> index 909a10935772..b181ef08d093 100644
> --- a/include/uapi/linux/media/dreamchip/rppx1-config.h
> +++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
> @@ -84,6 +84,8 @@ enum rppx1_meas_chan {
>   * @RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE1: PRE1 pipe Histogram Measurement
>   * @RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE2: PRE2 pipe Histogram Measurement
>   * @RPPX1_PARAMS_BLOCK_TYPE_HIST_POST: POST pipe Histogram Measurement
> + * @RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1: PRE1 pipe Black Level Subtraction
> + * @RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2: PRE2 pipe Black Level Subtraction
>   */
>  enum rppx1_params_block_type {
>  	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
> @@ -95,6 +97,8 @@ enum rppx1_params_block_type {
>  	RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE1,
>  	RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE2,
>  	RPPX1_PARAMS_BLOCK_TYPE_HIST_POST,
> +	RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1,
> +	RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2,
>  };
>
>  /**
> @@ -319,6 +323,103 @@ struct rppx1_hist_params {
>  	__u8 sample_shift;
>  };
>
> +/**
> + * struct rppx1_bls_fixed - BLS fixed subtraction values
> + *
> + * Fixed black level values subtracted from sensor data per Bayer channel.
> + * Negative values result in addition.
> + *
> + * The PRE1 pipe BLS module operates on a 24-bits input data and fixed black
> + * levels are stored as a signed 2's complement representation ranging from
> + * -2^24 to 2^24-1.
> + *
> + * The PRE2 pipe BLS module operates on a 12-bits input data and fixed black
> + * levels are stored as a signed 2's complement representation ranging from
> + * -2^12 to 2^12-1.
> + *
> + * Userspace is expected to provide fixed black level values with a bit-depth
> + * matching the one of pipe in use.
> + *
> + * These subtraction values are matched with the sensor native Bayer components
> + * ordering according to the cropping configuration on the input port.
> + *
> + * @a: subtraction value for channel A
> + * @b: subtraction value for channel B
> + * @c: subtraction value for channel C
> + * @d: subtraction value for channel D
> + */
> +struct rppx1_bls_fixed {
> +	__u32 a;
> +	__u32 b;
> +	__u32 c;
> +	__u32 d;
> +};
> +
> +/**
> + * enum rppx1_bls_mode - BLS subtraction mode
> + *
> + * Select if subtracted black level come from fixed or measured values.
> + *
> + * @RPPX1_BLS_MODE_FIXED: subtract fixed values
> + * @RPPX1_BLS_MODE_MEAS: subtract measured values
> + */
> +enum rppx1_bls_mode {
> +	RPPX1_BLS_MODE_FIXED,
> +	RPPX1_BLS_MODE_MEAS,
> +};
> +
> +/**
> + * enum rppx1_bls_win_en: BLS measurement configuration
> + *
> + * Select the measurement window to use for measured black level values.
> + *
> + * @RPPX1_BLS_WIN_EN_OFF: disable measurement
> + * @RPPX1_BLS_WIN_EN_WIN1: Enable measurement from window 1
> + * @RPPX1_BLS_WIN_EN_WIN2: enable measurement from window 2
> + * @RPPX1_BLS_WIN_EN_WIN12: enable measurement from window 1 and window 2
> + */
> +enum rppx1_bls_win_en {
> +	RPPX1_BLS_WIN_EN_OFF,
> +	RPPX1_BLS_WIN_EN_WIN1,
> +	RPPX1_BLS_WIN_EN_WIN2,
> +	RPPX1_BLS_WIN_EN_WIN12,
> +};
> +
> +/**
> + * struct rppx1_bls_params - RPP-X1 Black Level Subtraction Module
> + *
> + * The RPP-X1 Black Level Subtraction module is available on the PRE1 and PRE2
> + * pre-fusion pipes. Userspace selects which pipe to operate by setting the
> + * @header.type field to RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1 or
> + * RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2.
> + *
> + * The BLS module operates on fixed or measured data according to the setting of
> + * the @mode field. When RPPX1_BLS_MODE_FIXED is used userspace shall provide
> + * the per-channel black levels in @fixed. When RPPX1_BLS_MODE_MEAS is used
> + * userspace shall configure the measurement windows @window1 and optionally
> + * @window2 to select the optically black pixels region in the input frame. The
> + * @samples fields controls how many measure samples are used for averaging the
> + * measured black levels.
> + *
> + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1 or
> + *	    type == RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2)
> + * @mode: BLS subtraction mode (see enum rppx1_bls_mode)
> + * @en_windows: BLS measurement mode (see rppx1_bls_win_en)
> + * @samples: log2 of the number of measured pixels per Bayer position
> + * @window1: BLS measurement window 1 (14 bits)
> + * @window2: BLS measurement window 2 (14 bits)
> + * @fixed: fixed subtraction values (see enum rppx1_bls_fixed)
> + */
> +struct rppx1_bls_params {
> +	struct v4l2_isp_params_block_header header;
> +	__u8 mode;
> +	__u8 en_windows;
> +	__u8 samples;
> +	struct rppx1_window window1;
> +	struct rppx1_window window2;
> +	struct rppx1_bls_fixed fixed;
> +};
> +
>  /**
>   * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
>   *
> @@ -334,7 +435,9 @@ struct rppx1_hist_params {
>  	sizeof(struct rppx1_exm_params)				+	\
>  	sizeof(struct rppx1_hist_params)			+	\
>  	sizeof(struct rppx1_hist_params)			+	\
> -	sizeof(struct rppx1_hist_params))
> +	sizeof(struct rppx1_hist_params)			+	\
> +	sizeof(struct rppx1_bls_params)				+	\
> +	sizeof(struct rppx1_bls_params))
>
>  /* ---------------------------------------------------------------------------
>   * Statistics Structures
> @@ -354,6 +457,8 @@ struct rppx1_hist_params {
>   * @RPPX1_STATS_BLOCK_TYPE_HIST_PRE1: pre-fusion pipe1 histogram
>   * @RPPX1_STATS_BLOCK_TYPE_HIST_PRE2: pre-fusion pipe2 histogram
>   * @RPPX1_STATS_BLOCK_TYPE_HIST_POST: post-fusion histogram
> + * @RPPX1_STATS_BLOCK_TYPE_BLS_PRE1: pre-fusion pipe1 black level subtraction
> + * @RPPX1_STATS_BLOCK_TYPE_BLS_PRE2: pre-fusion pipe2 black level subtraction
>   */
>  enum rppx1_stats_block_type {
>  	RPPX1_STATS_BLOCK_TYPE_WBMEAS_POST,
> @@ -362,6 +467,8 @@ enum rppx1_stats_block_type {
>  	RPPX1_STATS_BLOCK_TYPE_HIST_PRE1,
>  	RPPX1_STATS_BLOCK_TYPE_HIST_PRE2,
>  	RPPX1_STATS_BLOCK_TYPE_HIST_POST,
> +	RPPX1_STATS_BLOCK_TYPE_BLS_PRE1,
> +	RPPX1_STATS_BLOCK_TYPE_BLS_PRE2,
>  };
>
>  /**
> @@ -412,6 +519,24 @@ struct rppx1_hist_stats {
>  	__u32 hist_bins[RPPX1_HIST_NUM_BINS];
>  };
>
> +/**
> + * struct rppx1_bls_stats - Black level subtraction measurements

If we want to report stats, please add documentation with a similar
level of details as the one of rppx1_bls_params when it comes to the
bit depth of the measured data.

> + *
> + * @header: block header (type = RPPX1_STATS_BLOCK_TYPE_BLS_PRE1 or
> + * RPPX1_STATS_BLOCK_TYPE_BLS_PRE2)
> + * @meas_r: mean measured value for Bayer pattern R
> + * @meas_gr: mean measured value for Bayer pattern Gr
> + * @meas_gb: mean measured value for Bayer pattern Gb
> + * @meas_b: mean measured value for Bayer pattern B
> + */
> +struct rppx1_bls_stats {
> +	struct v4l2_isp_block_header header;
> +	__u32 meas_r;
> +	__u32 meas_gr;
> +	__u32 meas_gb;
> +	__u32 meas_b;
> +};
> +
>  /**
>   * RPPX1_STATS_MAX_SIZE - Maximum size of all RPP-X1 statistics
>   *
> @@ -424,6 +549,8 @@ struct rppx1_hist_stats {
>  	sizeof(struct rppx1_exm_stats)				+	\
>  	sizeof(struct rppx1_hist_stats)				+	\
>  	sizeof(struct rppx1_hist_stats)				+	\
> -	sizeof(struct rppx1_hist_stats))
> +	sizeof(struct rppx1_hist_stats)				+	\
> +	sizeof(struct rppx1_bls_stats)				+	\
> +	sizeof(struct rppx1_bls_stats))
>
>  #endif /* __UAPI_RPP_X1_CONFIG_H */
> --
> 2.54.0
>
>

