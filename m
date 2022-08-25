Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED9BE5A17A0
	for <lists+linux-media@lfdr.de>; Thu, 25 Aug 2022 19:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239717AbiHYREG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Aug 2022 13:04:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240457AbiHYREF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Aug 2022 13:04:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54FD2B6D3C
        for <linux-media@vger.kernel.org>; Thu, 25 Aug 2022 10:04:03 -0700 (PDT)
Received: from pyrite.rasen.tech (unknown [IPv6:2604:2d80:ad8a:9000:1bf9:855b:22de:3645])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57D30484;
        Thu, 25 Aug 2022 19:03:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661447039;
        bh=JWudXRfVVvOCoNqm2mJD+hga8/RN9jq4sIzP7McCvF0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=brEhB2TK4Qn5Vds5mZ0laBkRx6RbCl95lcQ2ELWLZcoE9E5c9TchDEzLWQl5lrYRP
         732rC3pjLeiaMl8wuNdo9UPhYPMiM8pMq8MWBG6wnfsC8g9HX2r54JYA353+eJzE1C
         jJhTwqWaRK9Rvq+SD1CKwSDHRP0UE68XK48BsWco=
Date:   Thu, 25 Aug 2022 12:03:52 -0500
From:   paul.elder@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Florian Sylvestre <fsylvestre@baylibre.com>
Subject: Re: [PATCH v2 6/9] media: rkisp1: Don't pass the quantization to
 rkisp1_csm_config()
Message-ID: <20220825170352.GI109174@pyrite.rasen.tech>
References: <20220823171840.8958-1-laurent.pinchart@ideasonboard.com>
 <20220823171840.8958-7-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220823171840.8958-7-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 23, 2022 at 08:18:37PM +0300, Laurent Pinchart wrote:
> The rkisp1_csm_config() function takes a pointer to the rkisp1_params
> structure which contains the quantization value. There's no need to pass
> it separately to the function. Drop it from the function parameters.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index 8b4eea77af0d..163419624370 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -1076,7 +1076,7 @@ static void rkisp1_ie_enable(struct rkisp1_params *params, bool en)
>  	}
>  }
>  
> -static void rkisp1_csm_config(struct rkisp1_params *params, bool full_range)
> +static void rkisp1_csm_config(struct rkisp1_params *params)
>  {
>  	static const u16 full_range_coeff[] = {
>  		0x0026, 0x004b, 0x000f,
> @@ -1090,7 +1090,7 @@ static void rkisp1_csm_config(struct rkisp1_params *params, bool full_range)
>  	};
>  	unsigned int i;
>  
> -	if (full_range) {
> +	if (params->quantization == V4L2_QUANTIZATION_FULL_RANGE) {
>  		for (i = 0; i < ARRAY_SIZE(full_range_coeff); i++)
>  			rkisp1_write(params->rkisp1,
>  				     RKISP1_CIF_ISP_CC_COEFF_0 + i * 4,
> @@ -1562,11 +1562,7 @@ static void rkisp1_params_config_parameter(struct rkisp1_params *params)
>  	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_HIST_PROP_V10,
>  			      rkisp1_hst_params_default_config.mode);
>  
> -	/* set the  range */
> -	if (params->quantization == V4L2_QUANTIZATION_FULL_RANGE)
> -		rkisp1_csm_config(params, true);
> -	else
> -		rkisp1_csm_config(params, false);
> +	rkisp1_csm_config(params);
>  
>  	spin_lock_irq(&params->config_lock);
