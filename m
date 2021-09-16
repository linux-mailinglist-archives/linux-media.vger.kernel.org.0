Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C468C40EAE5
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 21:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233508AbhIPThG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 15:37:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232543AbhIPThF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 15:37:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89CF2C061574
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 12:35:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A8962A5;
        Thu, 16 Sep 2021 21:35:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1631820941;
        bh=79BDfgzMUEkrxthR6pAqeEdX/OfqS1iOQxUjKPqm120=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hrGnb5CQMVqgTM++RNOHt3MtmGEVg1Q05SMcNlii5AaqXATwIhOPbkaJCOR34OTkV
         RAeOcckvbgm7+JdQ83DD51AE09RQ+zr481QHTU/QLJIQpMy8d5cT9Vc6AW0s4hNNCC
         RlO+JpXaGcNE5T80BbGuMZRhRuT7UTMGQlFkw0Ao=
Date:   Thu, 16 Sep 2021 22:35:13 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tfiga@google.com, tian.shu.qiu@intel.com
Subject: Re: [PATCH] media: staging: ipu3-imgu: Initialise height_per_slice
 in the stripes
Message-ID: <YUOccaeWLIXzK3Ky@pendragon.ideasonboard.com>
References: <20210916172504.677919-1-jeanmichel.hautbois@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210916172504.677919-1-jeanmichel.hautbois@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jean-Michel,

Thank you for the patch.

On Thu, Sep 16, 2021 at 07:25:04PM +0200, Jean-Michel Hautbois wrote:
> While playing with low resolutions for the grid, it appeared that
> height_per_slice is not initialised if we are not using both stripes for
> the calculations. This pattern occurs three times:
> - for the awb_fr processing block
> - for the af processing block
> - for the awb processing block
> 
> The idea of this small portion of code is to reduce complexity in
> loading the statistics, it could be done also when only one stripe is
> used. Fix it by getting this initialisation code outside of the else()
> test case.
> 
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> ---
>  drivers/staging/media/ipu3/ipu3-css-params.c | 44 ++++++++++----------
>  1 file changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
> index e9d6bd9e9332..05da7dbdca78 100644
> --- a/drivers/staging/media/ipu3/ipu3-css-params.c
> +++ b/drivers/staging/media/ipu3/ipu3-css-params.c
> @@ -2428,16 +2428,16 @@ int imgu_css_cfg_acc(struct imgu_css *css, unsigned int pipe,
>  					acc->awb_fr.stripes[1].grid_cfg.width,
>  					b_w_log2);
>  		acc->awb_fr.stripes[1].grid_cfg.x_end = end;
> -
> -		/*
> -		 * To reduce complexity of debubbling and loading
> -		 * statistics fix grid_height_per_slice to 1 for both
> -		 * stripes.
> -		 */
> -		for (i = 0; i < stripes; i++)
> -			acc->awb_fr.stripes[i].grid_cfg.height_per_slice = 1;
>  	}
>  
> +	/*
> +	 * To reduce complexity of debubbling and loading
> +	 * statistics fix grid_height_per_slice to 1 for both
> +	 * stripes.
> +	 */

You could rewrap this and the comments below at 80 columns.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	for (i = 0; i < stripes; i++)
> +		acc->awb_fr.stripes[i].grid_cfg.height_per_slice = 1;
> +
>  	if (imgu_css_awb_fr_ops_calc(css, pipe, &acc->awb_fr))
>  		return -EINVAL;
>  
> @@ -2591,15 +2591,15 @@ int imgu_css_cfg_acc(struct imgu_css *css, unsigned int pipe,
>  			imgu_css_grid_end(acc->af.stripes[1].grid_cfg.x_start,
>  					  acc->af.stripes[1].grid_cfg.width,
>  					  b_w_log2);
> -
> -		/*
> -		 * To reduce complexity of debubbling and loading statistics
> -		 * fix grid_height_per_slice to 1 for both stripes
> -		 */
> -		for (i = 0; i < stripes; i++)
> -			acc->af.stripes[i].grid_cfg.height_per_slice = 1;
>  	}
>  
> +	/*
> +	 * To reduce complexity of debubbling and loading statistics
> +	 * fix grid_height_per_slice to 1 for both stripes
> +	 */
> +	for (i = 0; i < stripes; i++)
> +		acc->af.stripes[i].grid_cfg.height_per_slice = 1;
> +
>  	if (imgu_css_af_ops_calc(css, pipe, &acc->af))
>  		return -EINVAL;
>  
> @@ -2660,15 +2660,15 @@ int imgu_css_cfg_acc(struct imgu_css *css, unsigned int pipe,
>  			imgu_css_grid_end(acc->awb.stripes[1].grid.x_start,
>  					  acc->awb.stripes[1].grid.width,
>  					  b_w_log2);
> -
> -		/*
> -		 * To reduce complexity of debubbling and loading statistics
> -		 * fix grid_height_per_slice to 1 for both stripes
> -		 */
> -		for (i = 0; i < stripes; i++)
> -			acc->awb.stripes[i].grid.height_per_slice = 1;
>  	}
>  
> +	/*
> +	 * To reduce complexity of debubbling and loading statistics
> +	 * fix grid_height_per_slice to 1 for both stripes
> +	 */
> +	for (i = 0; i < stripes; i++)
> +		acc->awb.stripes[i].grid.height_per_slice = 1;
> +
>  	if (imgu_css_awb_ops_calc(css, pipe, &acc->awb))
>  		return -EINVAL;
>  

-- 
Regards,

Laurent Pinchart
