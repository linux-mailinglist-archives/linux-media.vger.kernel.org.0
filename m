Return-Path: <linux-media+bounces-15592-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A3C942257
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 23:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2524C1F23F11
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 21:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A4B818E02D;
	Tue, 30 Jul 2024 21:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="R8E0VYA8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5B41AA3EF;
	Tue, 30 Jul 2024 21:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722376001; cv=none; b=Imr8AcCHCdZ6OeBe8U4rum779B8T+Pz8RS8FEJ022nNo8gRzLsnDgDd56fQj9IMBI5O9Cdimt3+fowIn1f3ibiJrfoOtid98D/IXnKgZrb7HrHGIB6m8KXU3AhF4mXlrdF4KEEI8HhhXu+5tRqlxo4/UjUXM+4jgJXpYL+T4P8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722376001; c=relaxed/simple;
	bh=qUYdf+gZuTds5PhuUyLPNnIDV699yL2kJ6XlyDPmW5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dc+cWH8HV+97QwtRZUpoIf2xV0d2fisFUUs7C0kS4FRRf1n3KVff8O7u3s6EX85YXeTGCXkFMz05at0lsF//ZqmxjX4vk7ZaHjZfz7wiJqidBb38+lAy0T8sALlVd6kS7Fbmq/d+9QVpQjNL5cn1kOLpaXw7HYxV+qHUS+EWb+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=R8E0VYA8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8DAB4C9;
	Tue, 30 Jul 2024 23:45:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722375950;
	bh=qUYdf+gZuTds5PhuUyLPNnIDV699yL2kJ6XlyDPmW5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R8E0VYA8fbLbAN6gzvmG6Y3CjL8MvZQ22+A5nzqO6zst1zZstVrrC4z5GsRfHYmad
	 uJGl0aFoYLVscyMbDmCmHs4hOMctRZ7FOR/b5L+uVIayy/cQocX8wLZiLcC6XG6FAb
	 mYs5e2W6/U9wfY+JE4S8pCzs/fzSkOvefu9x8szs=
Date: Wed, 31 Jul 2024 00:46:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	sakari.ailus@iki.fi
Subject: Re: [PATCH v6 13/18] media: platform: Fill stats buffer on ISP_START
Message-ID: <20240730214616.GF8146@pendragon.ideasonboard.com>
References: <20240709132906.3198927-1-dan.scally@ideasonboard.com>
 <20240709132906.3198927-14-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240709132906.3198927-14-dan.scally@ideasonboard.com>

Hi Dan,

Thank you for the patch.

On Tue, Jul 09, 2024 at 02:29:01PM +0100, Daniel Scally wrote:
> On ISP_START, fill the stats buffer by reading out the metering space
> in the ISP's memory. This is done for the non-active config just as
> the dma transfer of the registers is. To acheive that, move the

s/acheive/achieve/

> checking of the current config outside of mali_c55_swap_next_config()
> so we can use it for both functions.
> 
> Acked-by: Nayden Kanchev  <nayden.kanchev@arm.com>
> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v6:
> 
> 	- None
> 
> Changes in v5:
> 
> 	- New patch
> 
>  .../platform/arm/mali-c55/mali-c55-core.c     | 34 ++++++++++++++-----
>  1 file changed, 26 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> index eedc8f450184..ed0db34767a4 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> @@ -567,15 +567,9 @@ static int mali_c55_check_hwcfg(struct mali_c55 *mali_c55)
>  	return 0;
>  }
>  
> -static void mali_c55_swap_next_config(struct mali_c55 *mali_c55)
> +static void mali_c55_swap_next_config(struct mali_c55 *mali_c55, u32 next_config)
>  {
>  	struct mali_c55_context *ctx = mali_c55_get_active_context(mali_c55);
> -	u32 curr_config, next_config;
> -
> -	curr_config = mali_c55_read(mali_c55, MALI_C55_REG_PING_PONG_READ);
> -	curr_config = (curr_config & MALI_C55_REG_PING_PONG_READ_MASK)
> -		      >> (ffs(MALI_C55_REG_PING_PONG_READ_MASK) - 1);
> -	next_config = curr_config ^ 1;
>  
>  	mali_c55_update_bits(mali_c55, MALI_C55_REG_MCU_CONFIG,
>  			     MALI_C55_REG_MCU_CONFIG_WRITE_MASK,
> @@ -588,6 +582,7 @@ static irqreturn_t mali_c55_isr(int irq, void *context)
>  {
>  	struct device *dev = context;
>  	struct mali_c55 *mali_c55 = dev_get_drvdata(dev);
> +	u32 curr_config, next_config;
>  	u32 interrupt_status;
>  	unsigned int i, j;
>  
> @@ -612,7 +607,30 @@ static irqreturn_t mali_c55_isr(int irq, void *context)
>  			for (j = i; j < MALI_C55_NUM_CAP_DEVS; j++)
>  				mali_c55_set_next_buffer(&mali_c55->cap_devs[j]);
>  
> -			mali_c55_swap_next_config(mali_c55);
> +			/*
> +			 * When the ISP starts a frame we have some work to do:
> +			 *
> +			 * 1. Copy over the config for the **next** frame
> +			 * 2. Read out the metering stats for the **last** frame
> +			 */
> +
> +			curr_config = mali_c55_read(mali_c55,
> +						    MALI_C55_REG_PING_PONG_READ);
> +			curr_config &= MALI_C55_REG_PING_PONG_READ_MASK;
> +			curr_config >>= ffs(MALI_C55_REG_PING_PONG_READ_MASK) - 1;
> +			next_config = curr_config ^ 1;
> +
> +			/*
> +			 * The ordering of these two is currently important as
> +			 * mali_c55_stats_fill_buffer() is asynchronous whereas
> +			 * mali_c55_swap_next_config() is not.
> +			 *
> +			 * TODO: Should mali_c55_swap_next_config() be async?

Isn't it in this version of the series, at least when using DMA ?

As I wrote in the review of 07/18, I think the reconfiguration probably
needs more careful consideration.

> +			 */
> +			mali_c55_stats_fill_buffer(mali_c55,
> +				next_config ? MALI_C55_CONFIG_PING :
> +				MALI_C55_CONFIG_PONG);
> +			mali_c55_swap_next_config(mali_c55, next_config);
>  
>  			break;
>  		case MALI_C55_IRQ_ISP_DONE:

-- 
Regards,

Laurent Pinchart

