Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF81B280B7A
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 01:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733197AbgJAX5E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Oct 2020 19:57:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727017AbgJAX5C (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Oct 2020 19:57:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3D91C0613D0;
        Thu,  1 Oct 2020 16:57:02 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B214F60;
        Fri,  2 Oct 2020 01:56:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1601596619;
        bh=cg6POSpyB3XauavGG9MWUk8qpi3llxD2OkEYEkSK3u4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I5HH7AFHVK5dQ/t8ZwHmkw0ScO7bYX8XvSqH+6eBTiQjkuOcEOo3KaSRvLVU8RWMy
         871okPVmH5VLC1qrvwYj1ppXjs05F3mH552aIQiMKtcdzVN5RKpIdpLD4lELWt591d
         R4SfoDRC8cbtrxAGpoj++AaHy0OvI3cGswgz0Bc0=
Date:   Fri, 2 Oct 2020 02:56:22 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Stefan Riedmueller <s.riedmueller@phytec.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH v2 2/5] media: mt9p031: Read back the real clock rate
Message-ID: <20201001235622.GJ3722@pendragon.ideasonboard.com>
References: <20200930105133.139981-1-s.riedmueller@phytec.de>
 <20200930105133.139981-2-s.riedmueller@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200930105133.139981-2-s.riedmueller@phytec.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stefan,

Thank you for the patch.

On Wed, Sep 30, 2020 at 12:51:30PM +0200, Stefan Riedmueller wrote:
> From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> 
> The real and requested clock can differ and because it is used to
> calculate PLL values, the real clock rate should be read.
> 
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> No changes in v2
> ---
>  drivers/media/i2c/mt9p031.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index 2e6671ef877c..b4c042f418c1 100644
> --- a/drivers/media/i2c/mt9p031.c
> +++ b/drivers/media/i2c/mt9p031.c
> @@ -255,6 +255,7 @@ static int mt9p031_clk_setup(struct mt9p031 *mt9p031)
>  
>  	struct i2c_client *client = v4l2_get_subdevdata(&mt9p031->subdev);
>  	struct mt9p031_platform_data *pdata = mt9p031->pdata;
> +	unsigned long ext_freq;
>  	int ret;
>  
>  	mt9p031->clk = devm_clk_get(&client->dev, NULL);
> @@ -265,13 +266,15 @@ static int mt9p031_clk_setup(struct mt9p031 *mt9p031)
>  	if (ret < 0)
>  		return ret;
>  
> +	ext_freq = clk_get_rate(mt9p031->clk);
> +
>  	/* If the external clock frequency is out of bounds for the PLL use the
>  	 * pixel clock divider only and disable the PLL.
>  	 */
> -	if (pdata->ext_freq > limits.ext_clock_max) {
> +	if (ext_freq > limits.ext_clock_max) {
>  		unsigned int div;
>  
> -		div = DIV_ROUND_UP(pdata->ext_freq, pdata->target_freq);
> +		div = DIV_ROUND_UP(ext_freq, pdata->target_freq);
>  		div = roundup_pow_of_two(div) / 2;
>  
>  		mt9p031->clk_div = min_t(unsigned int, div, 64);
> @@ -280,7 +283,7 @@ static int mt9p031_clk_setup(struct mt9p031 *mt9p031)
>  		return 0;
>  	}
>  
> -	mt9p031->pll.ext_clock = pdata->ext_freq;
> +	mt9p031->pll.ext_clock = ext_freq;
>  	mt9p031->pll.pix_clock = pdata->target_freq;
>  	mt9p031->use_pll = true;
>  

-- 
Regards,

Laurent Pinchart
