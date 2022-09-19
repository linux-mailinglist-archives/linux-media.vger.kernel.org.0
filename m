Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87FEE5BCE82
	for <lists+linux-media@lfdr.de>; Mon, 19 Sep 2022 16:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbiISOXt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Sep 2022 10:23:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbiISOXj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Sep 2022 10:23:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B39FB286CD
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 07:23:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38B019BA;
        Mon, 19 Sep 2022 16:23:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1663597417;
        bh=b+3lbNH40esEUooSYxoo6f7u+/YV+QicAzyIeEh2v4c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N+PZvH70UP/usNRSWO9Xo1iSZA2l/HarQx0+PwOXV7I69nOeoiA/KNrxiaNwehmiJ
         TbozQAfx7JDFXCHfIzAmaZ9Tmo1otneJ9MfTWhXYgRuwU34tJtsnuj1ic405Pmzrr0
         M43dalFtM2Xk0NtS/0RDEJUibuun4WZHVBo95t1I=
Date:   Mon, 19 Sep 2022 17:23:24 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, pavel@ucw.cz,
        sakari.ailus@linux.intel.com, sean@mess.org
Subject: Re: [PATCH -next 07/13] media: stm32-dcmi: Switch to use
 dev_err_probe() helper
Message-ID: <Yyh7XAncWvcy+8MD@pendragon.ideasonboard.com>
References: <20220915150324.688062-1-yangyingliang@huawei.com>
 <20220915150324.688062-8-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220915150324.688062-8-yangyingliang@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi yang,

Thank you for the patch.

On Thu, Sep 15, 2022 at 11:03:18PM +0800, Yang Yingliang wrote:
> In the probe path, dev_err() can be replace with dev_err_probe()
> which will check if error code is -EPROBE_DEFER.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/st/stm32/stm32-dcmi.c | 27 +++++++-------------
>  1 file changed, 9 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
> index 2ca95ab2b0fe..ec138843d090 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
> @@ -1946,12 +1946,9 @@ static int dcmi_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	dcmi->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> -	if (IS_ERR(dcmi->rstc)) {
> -		if (PTR_ERR(dcmi->rstc) != -EPROBE_DEFER)
> -			dev_err(&pdev->dev, "Could not get reset control\n");
> -
> -		return PTR_ERR(dcmi->rstc);
> -	}
> +	if (IS_ERR(dcmi->rstc))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(dcmi->rstc),
> +				     "Could not get reset control\n");
>  
>  	/* Get bus characteristics from devicetree */
>  	np = of_graph_get_next_endpoint(np, NULL);
> @@ -2003,20 +2000,14 @@ static int dcmi_probe(struct platform_device *pdev)
>  	}
>  
>  	mclk = devm_clk_get(&pdev->dev, "mclk");
> -	if (IS_ERR(mclk)) {
> -		if (PTR_ERR(mclk) != -EPROBE_DEFER)
> -			dev_err(&pdev->dev, "Unable to get mclk\n");
> -		return PTR_ERR(mclk);
> -	}
> +	if (IS_ERR(mclk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(mclk),
> +				     "Unable to get mclk\n");
>  
>  	chan = dma_request_chan(&pdev->dev, "tx");
> -	if (IS_ERR(chan)) {
> -		ret = PTR_ERR(chan);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(&pdev->dev,
> -				"Failed to request DMA channel: %d\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(chan))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(chan),
> +				     "Failed to request DMA channel\n");
>  
>  	dcmi->dma_max_burst = UINT_MAX;
>  	ret = dma_get_slave_caps(chan, &caps);

-- 
Regards,

Laurent Pinchart
