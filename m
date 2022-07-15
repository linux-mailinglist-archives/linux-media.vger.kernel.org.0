Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCB93575CD7
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 09:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232576AbiGOH4p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 03:56:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbiGOH4o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 03:56:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB7C47D7B3
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 00:56:43 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240121080.bbtec.net [36.240.121.80])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4730B9DA;
        Fri, 15 Jul 2022 09:56:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657871802;
        bh=OFAwvcCQ+xnrg0sobPK445OypitvJbUT52dT575p/6I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=viNBOLgtFLcEiCQ+KQYCIv3nXHmhihq1qKqCH4Nwz4w3CgH7Nw60cOfXE/mkGRE2h
         Mpo2+7qn61Ro6fMC3XwSEWgdmvDjns4+6SBppt+dWEjThnFxcCBeYeW217XWP09F+R
         bWwz0TzTK+st/DnH+9SxFRbN24/DikciKQ42hZCQ=
Date:   Fri, 15 Jul 2022 16:56:35 +0900
From:   paul.elder@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Florian Sylvestre <fsylvestre@baylibre.com>
Subject: Re: [PATCH 2/3] media: rockchip: rkisp1: Mask invalid bits in DPCC
 parameters
Message-ID: <20220715075635.GG3411283@pyrite.rasen.tech>
References: <20220616160456.21549-1-laurent.pinchart@ideasonboard.com>
 <20220616160456.21549-3-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616160456.21549-3-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Jun 16, 2022 at 07:04:55PM +0300, Laurent Pinchart wrote:
> Restrict the DPCC configuration that can be set by userspace to valid
> register bits. To do so, reorganize the related register macros to
> define valid bitmasks, as well as bits of the DPCC mode register.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  .../platform/rockchip/rkisp1/rkisp1-params.c  | 44 ++++++++++++-------
>  .../platform/rockchip/rkisp1/rkisp1-regs.h    | 26 +++++------
>  2 files changed, 41 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index 140012fa18f0..94e834cd2a21 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -58,35 +58,47 @@ static void rkisp1_dpcc_config(struct rkisp1_params *params,
>  	unsigned int i;
>  	u32 mode;
>  
> -	/* avoid to override the old enable value */
> +	/*
> +	 * The enable bit is controlled in rkisp1_isp_isr_other_config() and
> +	 * must be preserved. The grayscale mode should be configured
> +	 * automatically based on the media bus code on the ISP sink pad, so
> +	 * only the STAGE1_ENABLE bit can be set by userspace.
> +	 */
>  	mode = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_DPCC_MODE);
> -	mode &= RKISP1_CIF_ISP_DPCC_ENA;
> -	mode |= arg->mode & ~RKISP1_CIF_ISP_DPCC_ENA;
> +	mode &= RKISP1_CIF_ISP_DPCC_MODE_DPCC_ENABLE;
> +	mode |= arg->mode & RKISP1_CIF_ISP_DPCC_MODE_STAGE1_ENABLE;
>  	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPCC_MODE, mode);
> +
>  	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPCC_OUTPUT_MODE,
> -		     arg->output_mode);
> +		     arg->output_mode & RKISP1_CIF_ISP_DPCC_OUTPUT_MODE_MASK);
>  	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPCC_SET_USE,
> -		     arg->set_use);
> +		     arg->set_use & RKISP1_CIF_ISP_DPCC_SET_USE_MASK);
>  
>  	for (i = 0; i < RKISP1_CIF_ISP_DPCC_METHODS_MAX; i++) {
>  		rkisp1_write(params->rkisp1, RKISP1_ISP_DPCC_METHODS_SET(i),
> -			     arg->methods[i].method);
> +			     arg->methods[i].method &
> +			     RKISP1_CIF_ISP_DPCC_METHODS_SET_MASK);
>  		rkisp1_write(params->rkisp1, RKISP1_ISP_DPCC_LINE_THRESH(i),
> -			     arg->methods[i].line_thresh);
> +			     arg->methods[i].line_thresh &
> +			     RKISP1_CIF_ISP_DPCC_LINE_THRESH_MASK);
>  		rkisp1_write(params->rkisp1, RKISP1_ISP_DPCC_LINE_MAD_FAC(i),
> -			     arg->methods[i].line_mad_fac);
> +			     arg->methods[i].line_mad_fac &
> +			     RKISP1_CIF_ISP_DPCC_LINE_MAD_FAC_MASK);
>  		rkisp1_write(params->rkisp1, RKISP1_ISP_DPCC_PG_FAC(i),
> -			     arg->methods[i].pg_fac);
> +			     arg->methods[i].pg_fac &
> +			     RKISP1_CIF_ISP_DPCC_PG_FAC_MASK);
>  		rkisp1_write(params->rkisp1, RKISP1_ISP_DPCC_RND_THRESH(i),
> -			     arg->methods[i].rnd_thresh);
> +			     arg->methods[i].rnd_thresh &
> +			     RKISP1_CIF_ISP_DPCC_RND_THRESH_MASK);
>  		rkisp1_write(params->rkisp1, RKISP1_ISP_DPCC_RG_FAC(i),
> -			     arg->methods[i].rg_fac);
> +			     arg->methods[i].rg_fac &
> +			     RKISP1_CIF_ISP_DPCC_RG_FAC_MASK);
>  	}
>  
>  	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPCC_RND_OFFS,
> -		     arg->rnd_offs);
> +		     arg->rnd_offs & RKISP1_CIF_ISP_DPCC_RND_OFFS_MASK);
>  	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPCC_RO_LIMITS,
> -		     arg->ro_limits);
> +		     arg->ro_limits & RKISP1_CIF_ISP_DPCC_RO_LIMIT_MASK);
>  }
>  
>  /* ISP black level subtraction interface function */
> @@ -1214,11 +1226,11 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
>  		if (module_ens & RKISP1_CIF_ISP_MODULE_DPCC)
>  			rkisp1_param_set_bits(params,
>  					      RKISP1_CIF_ISP_DPCC_MODE,
> -					      RKISP1_CIF_ISP_DPCC_ENA);
> +					      RKISP1_CIF_ISP_DPCC_MODE_DPCC_ENABLE);
>  		else
>  			rkisp1_param_clear_bits(params,
>  						RKISP1_CIF_ISP_DPCC_MODE,
> -						RKISP1_CIF_ISP_DPCC_ENA);
> +						RKISP1_CIF_ISP_DPCC_MODE_DPCC_ENABLE);
>  	}
>  
>  	/* update bls config */
> @@ -1580,7 +1592,7 @@ void rkisp1_params_configure(struct rkisp1_params *params,
>  void rkisp1_params_disable(struct rkisp1_params *params)
>  {
>  	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DPCC_MODE,
> -				RKISP1_CIF_ISP_DPCC_ENA);
> +				RKISP1_CIF_ISP_DPCC_MODE_DPCC_ENABLE);
>  	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_LSC_CTRL,
>  				RKISP1_CIF_ISP_LSC_CTRL_ENA);
>  	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_BLS_CTRL,
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> index dd3e6c38be67..dc01f968c19d 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> @@ -618,19 +618,19 @@
>  #define RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA_READ(x)	(((x) >> 11) & 1)
>  
>  /* DPCC */
> -/* ISP_DPCC_MODE */
> -#define RKISP1_CIF_ISP_DPCC_ENA				BIT(0)
> -#define RKISP1_CIF_ISP_DPCC_MODE_MAX			0x07
> -#define RKISP1_CIF_ISP_DPCC_OUTPUTMODE_MAX		0x0F
> -#define RKISP1_CIF_ISP_DPCC_SETUSE_MAX			0x0F
> -#define RKISP1_CIF_ISP_DPCC_METHODS_SET_RESERVED	0xFFFFE000
> -#define RKISP1_CIF_ISP_DPCC_LINE_THRESH_RESERVED	0xFFFF0000
> -#define RKISP1_CIF_ISP_DPCC_LINE_MAD_FAC_RESERVED	0xFFFFC0C0
> -#define RKISP1_CIF_ISP_DPCC_PG_FAC_RESERVED		0xFFFFC0C0
> -#define RKISP1_CIF_ISP_DPCC_RND_THRESH_RESERVED		0xFFFF0000
> -#define RKISP1_CIF_ISP_DPCC_RG_FAC_RESERVED		0xFFFFC0C0
> -#define RKISP1_CIF_ISP_DPCC_RO_LIMIT_RESERVED		0xFFFFF000
> -#define RKISP1_CIF_ISP_DPCC_RND_OFFS_RESERVED		0xFFFFF000
> +#define RKISP1_CIF_ISP_DPCC_MODE_DPCC_ENABLE		BIT(0)
> +#define RKISP1_CIF_ISP_DPCC_MODE_GRAYSCALE_MODE		BIT(1)
> +#define RKISP1_CIF_ISP_DPCC_MODE_STAGE1_ENABLE		BIT(2)
> +#define RKISP1_CIF_ISP_DPCC_OUTPUT_MODE_MASK		GENMASK(3, 0)
> +#define RKISP1_CIF_ISP_DPCC_SET_USE_MASK		GENMASK(3, 0)
> +#define RKISP1_CIF_ISP_DPCC_METHODS_SET_MASK		0x00001f1f
> +#define RKISP1_CIF_ISP_DPCC_LINE_THRESH_MASK		0x0000ffff
> +#define RKISP1_CIF_ISP_DPCC_LINE_MAD_FAC_MASK		0x00003f3f
> +#define RKISP1_CIF_ISP_DPCC_PG_FAC_MASK			0x00003f3f
> +#define RKISP1_CIF_ISP_DPCC_RND_THRESH_MASK		0x0000ffff
> +#define RKISP1_CIF_ISP_DPCC_RG_FAC_MASK			0x00003f3f
> +#define RKISP1_CIF_ISP_DPCC_RO_LIMIT_MASK		0x00000fff
> +#define RKISP1_CIF_ISP_DPCC_RND_OFFS_MASK		0x00000fff
>  
>  /* BLS */
>  /* ISP_BLS_CTRL */
