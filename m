Return-Path: <linux-media+bounces-14625-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1789C92722E
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 10:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 963F31F21B85
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 08:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D04C11A4F3E;
	Thu,  4 Jul 2024 08:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QQZQAyFy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A121A4F22
	for <linux-media@vger.kernel.org>; Thu,  4 Jul 2024 08:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720083250; cv=none; b=WFQh95GKhtzfPXUQL22aoQLXkIogwviMJZ9NiJTN5//P7ZI7wGmDjhQLUGXqmIjtYo6+I6tIGw94B4ljKq0yAMFMNPVSRnRfp9BrUO+MaJvYfY2ax7XUafiJ0fjHfZqy4bwFDsmbn/BSuABqq7Ko+ZqFnsIbLQiqav91GFoJagI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720083250; c=relaxed/simple;
	bh=uM36jnZ5i2gA6kqIzbVIH7H9AxNU9vs34jUuEw26Ro0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ofbn7Nv85KWD6zNDZtv8+ucrOZyw4sS6D1cor/ymaGcNEEPwZA8ZjTO4J7XXjtrIR8xAS96m7pg4JcdaJ7XMMknUHCclGPsEJa4EsCGAdio1c2kpibMtZjG+md3OSG9wRulKJAS/v+ouKdCvcfJFaQXA2XZqJYb20Tq1cqxf8ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QQZQAyFy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D0EB541;
	Thu,  4 Jul 2024 10:53:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720083218;
	bh=uM36jnZ5i2gA6kqIzbVIH7H9AxNU9vs34jUuEw26Ro0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QQZQAyFyHCQN7KfAAyT7GvGQ58NPvroIjt37LPcvV6nAYc9Qry4/aq0+ensgkKJkv
	 CwF7m0f6OL6EoBH+g/cv7DZ1+ej8s7Sj77Vwpim1RDc93daIxlAU4/wuEu26p6zd9x
	 20UiSSZ+3Xm4bKARLILhBIJ4Jq7vUBAYN/h+IeAk=
Date: Thu, 4 Jul 2024 11:53:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v1 1/5] media: rkisp1: Add helper function to swap colour
 channels
Message-ID: <20240704085345.GA1546@pendragon.ideasonboard.com>
References: <20240703222533.1662-1-laurent.pinchart@ideasonboard.com>
 <20240703222533.1662-2-laurent.pinchart@ideasonboard.com>
 <fx77b55a5wuung5yjeduuzjofwaweovcglvujjlc3l5xbgewsk@bmd5wrkoxsbr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fx77b55a5wuung5yjeduuzjofwaweovcglvujjlc3l5xbgewsk@bmd5wrkoxsbr>

On Thu, Jul 04, 2024 at 09:53:02AM +0200, Jacopo Mondi wrote:
> On Thu, Jul 04, 2024 at 01:25:29AM GMT, Laurent Pinchart wrote:
> > The BLS parameters passed by userspace are specified for named colour
> > channels (R, Gr, Gb and B), while the hardware registers reference
> > positions in the 2x2 CFA pattern (A, B, C and D).
> >
> > The BLS values are swapped based on the CFA pattern when writing to or
> > reading from registers, using hand-roled switch statements. The logic is
> > duplicated already, and new code will require similar processing. Move
> > the swap logic to a shared function, using static data to control the
> > channels order.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../platform/rockchip/rkisp1/rkisp1-common.c  | 15 +++++
> >  .../platform/rockchip/rkisp1/rkisp1-common.h  |  3 +
> >  .../platform/rockchip/rkisp1/rkisp1-params.c  | 58 ++++---------------
> >  .../platform/rockchip/rkisp1/rkisp1-stats.c   | 51 +++++-----------
> >  4 files changed, 44 insertions(+), 83 deletions(-)
> >
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.c
> > index f956b90a407a..90513d15e7a7 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.c
> > @@ -178,3 +178,18 @@ void rkisp1_sd_adjust_crop(struct v4l2_rect *crop,
> >
> >  	rkisp1_sd_adjust_crop_rect(crop, &crop_bounds);
> >  }
> > +
> > +void rkisp1_bls_swap_regs(enum rkisp1_fmt_raw_pat_type pattern,
> > +			  const u32 input[4], u32 output[4])
> > +{
> > +	static const unsigned int swap[][4] = {
> 
> Should you declare this as a [4][4] array ?

Ack.

> > +		[RKISP1_RAW_RGGB] = { 0, 1, 2, 3 },
> > +		[RKISP1_RAW_GRBG] = { 1, 0, 3, 2 },
> > +		[RKISP1_RAW_GBRG] = { 2, 3, 0, 1 },
> > +		[RKISP1_RAW_BGGR] = { 3, 2, 1, 0 },
> > +	};
> > +	unsigned int i;
> 
> 'i' can be declared inside the for() statement

Backporting could get a bit more annoying, but it's mainline first :-)
I'll switch.

> > +
> > +	for (i = 0; i < 4; ++i)
> > +		output[i] = input[swap[pattern][i]];
> > +}
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > index c1689c0fa05a..cdf2d30e2bb1 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > @@ -645,6 +645,9 @@ void rkisp1_params_post_configure(struct rkisp1_params *params);
> >   */
> >  void rkisp1_params_disable(struct rkisp1_params *params);
> >
> > +void rkisp1_bls_swap_regs(enum rkisp1_fmt_raw_pat_type pattern,
> > +			  const u32 input[4], u32 output[4]);
> > +
> 
> Should this be declared after rkisp1_sd_adjust_crop() to maintain the
> same definition ordering as in the C file ?

OK.

> >  /* irq handlers */
> >  irqreturn_t rkisp1_isp_isr(int irq, void *ctx);
> >  irqreturn_t rkisp1_csi_isr(int irq, void *ctx);
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > index 39a32e98807f..b10cc2701244 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > @@ -165,54 +165,20 @@ static void rkisp1_bls_config(struct rkisp1_params *params,
> >  	new_control &= RKISP1_CIF_ISP_BLS_ENA;
> >  	/* fixed subtraction values */
> >  	if (!arg->enable_auto) {
> > -		const struct rkisp1_cif_isp_bls_fixed_val *pval =
> > -								&arg->fixed_val;
> > +		static const u32 regs[] = {
> > +			RKISP1_CIF_ISP_BLS_A_FIXED,
> > +			RKISP1_CIF_ISP_BLS_B_FIXED,
> > +			RKISP1_CIF_ISP_BLS_C_FIXED,
> > +			RKISP1_CIF_ISP_BLS_D_FIXED,
> > +		};
> > +		u32 swapped[4];
> >
> > -		switch (params->raw_type) {
> > -		case RKISP1_RAW_BGGR:
> > -			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_D_FIXED,
> > -				     pval->r);
> > -			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_C_FIXED,
> > -				     pval->gr);
> > -			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_B_FIXED,
> > -				     pval->gb);
> > -			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_A_FIXED,
> > -				     pval->b);
> > -			break;
> > -		case RKISP1_RAW_GBRG:
> > -			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_C_FIXED,
> > -				     pval->r);
> > -			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_D_FIXED,
> > -				     pval->gr);
> > -			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_A_FIXED,
> > -				     pval->gb);
> > -			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_B_FIXED,
> > -				     pval->b);
> > -			break;
> > -		case RKISP1_RAW_GRBG:
> > -			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_B_FIXED,
> > -				     pval->r);
> > -			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_A_FIXED,
> > -				     pval->gr);
> > -			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_D_FIXED,
> > -				     pval->gb);
> > -			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_C_FIXED,
> > -				     pval->b);
> > -			break;
> > -		case RKISP1_RAW_RGGB:
> > -			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_A_FIXED,
> > -				     pval->r);
> > -			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_B_FIXED,
> > -				     pval->gr);
> > -			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_C_FIXED,
> > -				     pval->gb);
> > -			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_D_FIXED,
> > -				     pval->b);
> > -			break;
> > -		default:
> > -			break;
> > -		}
> > +		rkisp1_bls_swap_regs(params->raw_type, regs, swapped);
> 
> Have you considered making rkisp1_bls_swap_regs() shuffle 'regs'
> in-place ? Not strictly necessary, just wondering

Not really. It could work too, but I'd need to go through a temporary
array in rkisp1_bls_swap_regs(), and the caller would need to initialize
the regs array. In the end I think it would just be more costly.

> > +		rkisp1_write(params->rkisp1, swapped[0], arg->fixed_val.r);
> > +		rkisp1_write(params->rkisp1, swapped[1], arg->fixed_val.gr);
> > +		rkisp1_write(params->rkisp1, swapped[2], arg->fixed_val.gb);
> > +		rkisp1_write(params->rkisp1, swapped[3], arg->fixed_val.b);
> >  	} else {
> >  		if (arg->en_windows & BIT(1)) {
> >  			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_H2_START,
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> > index 2795eef91bdd..a502719e916a 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> > @@ -304,48 +304,25 @@ static void rkisp1_stats_get_hst_meas_v12(struct rkisp1_stats *stats,
> >  static void rkisp1_stats_get_bls_meas(struct rkisp1_stats *stats,
> >  				      struct rkisp1_stat_buffer *pbuf)
> >  {
> > +	static const u32 regs[] = {
> > +		RKISP1_CIF_ISP_BLS_A_MEASURED,
> > +		RKISP1_CIF_ISP_BLS_B_MEASURED,
> > +		RKISP1_CIF_ISP_BLS_C_MEASURED,
> > +		RKISP1_CIF_ISP_BLS_D_MEASURED,
> > +	};
> >  	struct rkisp1_device *rkisp1 = stats->rkisp1;
> >  	const struct rkisp1_mbus_info *in_fmt = rkisp1->isp.sink_fmt;
> >  	struct rkisp1_cif_isp_bls_meas_val *bls_val;
> > +	u32 swapped[4];
> > +
> > +	rkisp1_bls_swap_regs(in_fmt->bayer_pat, regs, swapped);
> >
> >  	bls_val = &pbuf->params.ae.bls_val;
> > -	if (in_fmt->bayer_pat == RKISP1_RAW_BGGR) {
> > -		bls_val->meas_b =
> > -			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_A_MEASURED);
> > -		bls_val->meas_gb =
> > -			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_B_MEASURED);
> > -		bls_val->meas_gr =
> > -			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_C_MEASURED);
> > -		bls_val->meas_r =
> > -			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_D_MEASURED);
> > -	} else if (in_fmt->bayer_pat == RKISP1_RAW_GBRG) {
> > -		bls_val->meas_gb =
> > -			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_A_MEASURED);
> > -		bls_val->meas_b =
> > -			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_B_MEASURED);
> > -		bls_val->meas_r =
> > -			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_C_MEASURED);
> > -		bls_val->meas_gr =
> > -			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_D_MEASURED);
> > -	} else if (in_fmt->bayer_pat == RKISP1_RAW_GRBG) {
> > -		bls_val->meas_gr =
> > -			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_A_MEASURED);
> > -		bls_val->meas_r =
> > -			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_B_MEASURED);
> > -		bls_val->meas_b =
> > -			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_C_MEASURED);
> > -		bls_val->meas_gb =
> > -			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_D_MEASURED);
> > -	} else if (in_fmt->bayer_pat == RKISP1_RAW_RGGB) {
> > -		bls_val->meas_r =
> > -			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_A_MEASURED);
> > -		bls_val->meas_gr =
> > -			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_B_MEASURED);
> > -		bls_val->meas_gb =
> > -			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_C_MEASURED);
> > -		bls_val->meas_b =
> > -			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_D_MEASURED);
> > -	}
> > +
> > +	bls_val->meas_r = rkisp1_read(rkisp1, swapped[0]);
> > +	bls_val->meas_gr = rkisp1_read(rkisp1, swapped[1]);
> > +	bls_val->meas_gb = rkisp1_read(rkisp1, swapped[2]);
> > +	bls_val->meas_b = rkisp1_read(rkisp1, swapped[3]);
> >  }
> >
> >  static const struct rkisp1_stats_ops rkisp1_v10_stats_ops = {

-- 
Regards,

Laurent Pinchart

