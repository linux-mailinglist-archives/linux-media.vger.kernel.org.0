Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 229F23BB797
	for <lists+linux-media@lfdr.de>; Mon,  5 Jul 2021 09:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbhGEHQ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Jul 2021 03:16:29 -0400
Received: from mga17.intel.com ([192.55.52.151]:47704 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229941AbhGEHQ2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 5 Jul 2021 03:16:28 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10035"; a="189314758"
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; 
   d="scan'208";a="189314758"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2021 00:13:49 -0700
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; 
   d="scan'208";a="422279299"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2021 00:13:46 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id BBB5420188;
        Mon,  5 Jul 2021 10:13:43 +0300 (EEST)
Date:   Mon, 5 Jul 2021 10:13:43 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Stefan Riedmueller <s.riedmueller@phytec.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH v3 1/6] media: mt9p031: Read back the real clock rate
Message-ID: <20210705071343.GR3@paasikivi.fi.intel.com>
References: <20210702095922.118614-1-s.riedmueller@phytec.de>
 <20210702095922.118614-2-s.riedmueller@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210702095922.118614-2-s.riedmueller@phytec.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Enrico,

On Fri, Jul 02, 2021 at 11:59:17AM +0200, Stefan Riedmueller wrote:
> From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> 
> The real and requested clock can differ and because it is used to
> calculate PLL values, the real clock rate should be read.

Do you have a system where this happens? That suggests there's a wrong
value in DT.

The preference nowadays is to rely on assigned-clock-rates, even though
it's inherently somewhat unreliable, just as clk_set_rate(). This is an
existing driver though. The old ones could be kept for compatibility with
older DT binaries.

> 
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/mt9p031.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index 77567341ec98..3eaaa8d44523 100644
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
Kind regards,

Sakari Ailus
