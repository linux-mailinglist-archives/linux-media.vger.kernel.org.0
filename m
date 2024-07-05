Return-Path: <linux-media+bounces-14683-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0029287F2
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2024 13:29:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD4571F24979
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2024 11:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49131149C53;
	Fri,  5 Jul 2024 11:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B/tLPQYp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66FA149C50
	for <linux-media@vger.kernel.org>; Fri,  5 Jul 2024 11:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720178946; cv=none; b=syTu1v4ftzV5IOfvb7ol8fJ3GqBnch+USpSXmwzzPGmJI2rR3QcTGWKNitEfUJAyDfJqdM1RNobNyZsAS8XKp9WHokaf4fQkO4qj7QZnJZ4EJt4QmrTyNU1p/SWuzfn4M/Pqhtfun7jKsMuN5KO8c/5KMX64jHnybtiKgWzZQ5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720178946; c=relaxed/simple;
	bh=rvJu0YPpOjGG4oYRrulYFmVbjRCG1xHH8upqpyVOac0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKYq7TVgQ5cmIlRlUVfspRvzDYhZM+MhdTypa4vEoeFFbSsxW5otmlretf5wYDPxEnc4VK75ApD7Sg+9ZKyetKPQZ9EGjBqa1crGH821Fhay+vK/ukmXHsKl3bQUp+/0Z4DIjUyy3FVpSberToeGQ7O0ggJTZsMx8sgnvyl0U9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B/tLPQYp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pyrite.rasen.tech (h175-177-049-156.catv02.itscom.jp [175.177.49.156])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31235541;
	Fri,  5 Jul 2024 13:28:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720178913;
	bh=rvJu0YPpOjGG4oYRrulYFmVbjRCG1xHH8upqpyVOac0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B/tLPQYpTwumtlTu9hfUrXD3eY1uNr4eDEb/pkS5nhWc1LDY4b/zlHSG/Jr9OZG6s
	 jpSYyy20O7Wlf4bhK8o0ygMPxHJ0kucpC7NRcQ3DRoa25HatL570Arj5wVGokgXWsq
	 u6RxT6PnT9tqoepcY3EeX7ikYquVNy39hCK2pcb4=
Date: Fri, 5 Jul 2024 20:28:55 +0900
From: Paul Elder <paul.elder@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 1/5] media: rkisp1: Add helper function to swap colour
 channels
Message-ID: <ZofY9wVDgT0mYUIO@pyrite.rasen.tech>
References: <20240704154932.6686-1-laurent.pinchart@ideasonboard.com>
 <20240704154932.6686-2-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704154932.6686-2-laurent.pinchart@ideasonboard.com>

On Thu, Jul 04, 2024 at 06:49:28PM +0300, Laurent Pinchart wrote:
> The BLS parameters passed by userspace are specified for named colour
> channels (R, Gr, Gb and B), while the hardware registers reference
> positions in the 2x2 CFA pattern (A, B, C and D).
> 
> The BLS values are swapped based on the CFA pattern when writing to or
> reading from registers, using hand-roled switch statements. The logic is
> duplicated already, and new code will require similar processing. Move
> the swap logic to a shared function, using static data to control the
> channels order.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
> Changes since v1:
> 
> - Declare swap array with explicit dimensions
> - Move i variable declaration to the loop
> - Move rkisp1_bls_swap_regs() declaration
> ---
>  .../platform/rockchip/rkisp1/rkisp1-common.c  | 14 +++++
>  .../platform/rockchip/rkisp1/rkisp1-common.h  |  3 +
>  .../platform/rockchip/rkisp1/rkisp1-params.c  | 58 ++++---------------
>  .../platform/rockchip/rkisp1/rkisp1-stats.c   | 51 +++++-----------
>  4 files changed, 43 insertions(+), 83 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.c
> index f956b90a407a..60c97bb7b18b 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.c
> @@ -178,3 +178,17 @@ void rkisp1_sd_adjust_crop(struct v4l2_rect *crop,
>  
>  	rkisp1_sd_adjust_crop_rect(crop, &crop_bounds);
>  }
> +
> +void rkisp1_bls_swap_regs(enum rkisp1_fmt_raw_pat_type pattern,
> +			  const u32 input[4], u32 output[4])
> +{
> +	static const unsigned int swap[4][4] = {
> +		[RKISP1_RAW_RGGB] = { 0, 1, 2, 3 },
> +		[RKISP1_RAW_GRBG] = { 1, 0, 3, 2 },
> +		[RKISP1_RAW_GBRG] = { 2, 3, 0, 1 },
> +		[RKISP1_RAW_BGGR] = { 3, 2, 1, 0 },
> +	};
> +
> +	for (unsigned int i = 0; i < 4; ++i)
> +		output[i] = input[swap[pattern][i]];
> +}
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index c1689c0fa05a..a52079261579 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -603,6 +603,9 @@ void rkisp1_sd_adjust_crop_rect(struct v4l2_rect *crop,
>  void rkisp1_sd_adjust_crop(struct v4l2_rect *crop,
>  			   const struct v4l2_mbus_framefmt *bounds);
>  
> +void rkisp1_bls_swap_regs(enum rkisp1_fmt_raw_pat_type pattern,
> +			  const u32 input[4], u32 output[4]);
> +
>  /*
>   * rkisp1_mbus_info_get_by_code - get the isp info of the media bus code
>   *
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index 25aede5e1af5..c56365c7c51f 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -165,54 +165,20 @@ static void rkisp1_bls_config(struct rkisp1_params *params,
>  	new_control &= RKISP1_CIF_ISP_BLS_ENA;
>  	/* fixed subtraction values */
>  	if (!arg->enable_auto) {
> -		const struct rkisp1_cif_isp_bls_fixed_val *pval =
> -								&arg->fixed_val;
> +		static const u32 regs[] = {
> +			RKISP1_CIF_ISP_BLS_A_FIXED,
> +			RKISP1_CIF_ISP_BLS_B_FIXED,
> +			RKISP1_CIF_ISP_BLS_C_FIXED,
> +			RKISP1_CIF_ISP_BLS_D_FIXED,
> +		};
> +		u32 swapped[4];
>  
> -		switch (params->raw_type) {
> -		case RKISP1_RAW_BGGR:
> -			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_D_FIXED,
> -				     pval->r);
> -			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_C_FIXED,
> -				     pval->gr);
> -			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_B_FIXED,
> -				     pval->gb);
> -			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_A_FIXED,
> -				     pval->b);
> -			break;
> -		case RKISP1_RAW_GBRG:
> -			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_C_FIXED,
> -				     pval->r);
> -			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_D_FIXED,
> -				     pval->gr);
> -			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_A_FIXED,
> -				     pval->gb);
> -			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_B_FIXED,
> -				     pval->b);
> -			break;
> -		case RKISP1_RAW_GRBG:
> -			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_B_FIXED,
> -				     pval->r);
> -			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_A_FIXED,
> -				     pval->gr);
> -			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_D_FIXED,
> -				     pval->gb);
> -			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_C_FIXED,
> -				     pval->b);
> -			break;
> -		case RKISP1_RAW_RGGB:
> -			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_A_FIXED,
> -				     pval->r);
> -			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_B_FIXED,
> -				     pval->gr);
> -			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_C_FIXED,
> -				     pval->gb);
> -			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_D_FIXED,
> -				     pval->b);
> -			break;
> -		default:
> -			break;
> -		}
> +		rkisp1_bls_swap_regs(params->raw_type, regs, swapped);
>  
> +		rkisp1_write(params->rkisp1, swapped[0], arg->fixed_val.r);
> +		rkisp1_write(params->rkisp1, swapped[1], arg->fixed_val.gr);
> +		rkisp1_write(params->rkisp1, swapped[2], arg->fixed_val.gb);
> +		rkisp1_write(params->rkisp1, swapped[3], arg->fixed_val.b);
>  	} else {
>  		if (arg->en_windows & BIT(1)) {
>  			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_H2_START,
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> index 2795eef91bdd..a502719e916a 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> @@ -304,48 +304,25 @@ static void rkisp1_stats_get_hst_meas_v12(struct rkisp1_stats *stats,
>  static void rkisp1_stats_get_bls_meas(struct rkisp1_stats *stats,
>  				      struct rkisp1_stat_buffer *pbuf)
>  {
> +	static const u32 regs[] = {
> +		RKISP1_CIF_ISP_BLS_A_MEASURED,
> +		RKISP1_CIF_ISP_BLS_B_MEASURED,
> +		RKISP1_CIF_ISP_BLS_C_MEASURED,
> +		RKISP1_CIF_ISP_BLS_D_MEASURED,
> +	};
>  	struct rkisp1_device *rkisp1 = stats->rkisp1;
>  	const struct rkisp1_mbus_info *in_fmt = rkisp1->isp.sink_fmt;
>  	struct rkisp1_cif_isp_bls_meas_val *bls_val;
> +	u32 swapped[4];
> +
> +	rkisp1_bls_swap_regs(in_fmt->bayer_pat, regs, swapped);
>  
>  	bls_val = &pbuf->params.ae.bls_val;
> -	if (in_fmt->bayer_pat == RKISP1_RAW_BGGR) {
> -		bls_val->meas_b =
> -			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_A_MEASURED);
> -		bls_val->meas_gb =
> -			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_B_MEASURED);
> -		bls_val->meas_gr =
> -			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_C_MEASURED);
> -		bls_val->meas_r =
> -			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_D_MEASURED);
> -	} else if (in_fmt->bayer_pat == RKISP1_RAW_GBRG) {
> -		bls_val->meas_gb =
> -			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_A_MEASURED);
> -		bls_val->meas_b =
> -			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_B_MEASURED);
> -		bls_val->meas_r =
> -			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_C_MEASURED);
> -		bls_val->meas_gr =
> -			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_D_MEASURED);
> -	} else if (in_fmt->bayer_pat == RKISP1_RAW_GRBG) {
> -		bls_val->meas_gr =
> -			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_A_MEASURED);
> -		bls_val->meas_r =
> -			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_B_MEASURED);
> -		bls_val->meas_b =
> -			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_C_MEASURED);
> -		bls_val->meas_gb =
> -			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_D_MEASURED);
> -	} else if (in_fmt->bayer_pat == RKISP1_RAW_RGGB) {
> -		bls_val->meas_r =
> -			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_A_MEASURED);
> -		bls_val->meas_gr =
> -			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_B_MEASURED);
> -		bls_val->meas_gb =
> -			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_C_MEASURED);
> -		bls_val->meas_b =
> -			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_D_MEASURED);
> -	}
> +
> +	bls_val->meas_r = rkisp1_read(rkisp1, swapped[0]);
> +	bls_val->meas_gr = rkisp1_read(rkisp1, swapped[1]);
> +	bls_val->meas_gb = rkisp1_read(rkisp1, swapped[2]);
> +	bls_val->meas_b = rkisp1_read(rkisp1, swapped[3]);
>  }
>  
>  static const struct rkisp1_stats_ops rkisp1_v10_stats_ops = {
> -- 
> Regards,
> 
> Laurent Pinchart
> 

