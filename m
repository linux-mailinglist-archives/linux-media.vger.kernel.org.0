Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFA69413244
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 13:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232173AbhIULIi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 07:08:38 -0400
Received: from mga18.intel.com ([134.134.136.126]:13197 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231956AbhIULIh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 07:08:37 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="210409896"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; 
   d="scan'208";a="210409896"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2021 04:07:08 -0700
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; 
   d="scan'208";a="435837152"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2021 04:07:07 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 121CA201E4; Tue, 21 Sep 2021 14:07:05 +0300 (EEST)
Date:   Tue, 21 Sep 2021 14:07:05 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        tfiga@google.com
Subject: Re: [PATCH] media: staging: ipu3-imgu: Initialise height_per_slice
 in the stripes
Message-ID: <YUm82RNBbu9VbQj9@paasikivi.fi.intel.com>
References: <20210916172504.677919-1-jeanmichel.hautbois@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916172504.677919-1-jeanmichel.hautbois@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jean-Michel --- and Bingbu and Tianshu,

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

While it seems like a sensible idea to initialise arguments to firmware, does this have an
effect on the statistics format? If so, can the existing user space cope
with that?

Bingbu, Tianshu, any insights on this?

-- 
Kind regards,

Sakari Ailus
