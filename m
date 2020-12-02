Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47D592CB7C1
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 09:52:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387932AbgLBIva (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 03:51:30 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:39251 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387805AbgLBIva (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 03:51:30 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id kNqXkxf1tkGBYkNqakZTNw; Wed, 02 Dec 2020 09:50:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606899048; bh=LL96E6y/gjy2d0u1ZMCCgJyMX3ZF5Z5y7+BUMxps5JU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=gVtDyd5s1SuVL4LEBmJtkfU4D7RR5dPHP681ktLNP3GZ0Lw4MY3DEIioJ/Nw5+FA9
         khgQFoKWjnmEcG9DxukKWFeRT4pVG1N0TH3jZgY3ItFh0LFE1jlBthBOwXnjvmI7WS
         lVaOoLh+Dgi/9PcR/hxwC2olKMR/DY6/t2SA8p4qYg+kOC7l6VACtAIGxvmghawjnw
         Lg5xMCCMnE1lC6NYguevp/SrQmtDNsFfoX4TOkAol28E7j8t+grtVskb6lJJxQ51M7
         GwVMEy5MpOq7+JMk+e+fA6wL8oSDHgJ3itVpDmxKagpFl2BtkgIyUNgfs0cu2QJTTT
         KvwhDZ+b3k/sA==
Subject: Re: [PATCH] media: coda: Convert the driver to DT-only
To:     Fabio Estevam <festevam@gmail.com>, p.zabel@pengutronix.de
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org
References: <20201124112822.29414-1-festevam@gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <f3820b3d-51c8-e58c-e11c-e8eb105636aa@xs4all.nl>
Date:   Wed, 2 Dec 2020 09:50:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201124112822.29414-1-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFkuBP1DQ3s6B8iKgDCBatoVET2D8Wt364do/1U69VtLeV/BGQitmsYi7192fmqevJw3vLRzxOCXe1EIrZAN9Tju0upLmYnDXHjWcYyalWbx7RgdjTAU
 yxJHDH10r73TmjCVqoSu4JA5wRChfJvfnw5P58wn+BxoOHhxLYji4lNZpB6JN1R52yiCmRJ/8QRdMPnDkGeG3IQIuz/pDqR28bQOqk9xLc9VDm1lSVheBeYa
 f8fdfeS68U4pZsm/19XsoM0NnZynrAbhgb0/btbiNXwfUZZZ5GtI+27tZ9161Lu1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/11/2020 12:28, Fabio Estevam wrote:
> Since 5.10-rc1 i.MX is a devicetree-only platform, so simplify the code
> by removing the unused non-DT support.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/media/platform/coda/coda-common.c | 21 +--------------------
>  1 file changed, 1 insertion(+), 20 deletions(-)
> 
> diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
> index d30eafea701d..b1b29c13dba3 100644
> --- a/drivers/media/platform/coda/coda-common.c
> +++ b/drivers/media/platform/coda/coda-common.c
> @@ -3102,13 +3102,6 @@ static const struct coda_devtype coda_devdata[] = {
>  	},
>  };
>  
> -static const struct platform_device_id coda_platform_ids[] = {
> -	{ .name = "coda-imx27", .driver_data = CODA_IMX27 },
> -	{ /* sentinel */ }
> -};
> -MODULE_DEVICE_TABLE(platform, coda_platform_ids);
> -
> -#ifdef CONFIG_OF
>  static const struct of_device_id coda_dt_ids[] = {
>  	{ .compatible = "fsl,imx27-vpu", .data = &coda_devdata[CODA_IMX27] },
>  	{ .compatible = "fsl,imx51-vpu", .data = &coda_devdata[CODA_IMX51] },
> @@ -3118,13 +3111,9 @@ static const struct of_device_id coda_dt_ids[] = {
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, coda_dt_ids);
> -#endif
>  
>  static int coda_probe(struct platform_device *pdev)
>  {
> -	const struct of_device_id *of_id =
> -			of_match_device(of_match_ptr(coda_dt_ids), &pdev->dev);
> -	const struct platform_device_id *pdev_id;
>  	struct coda_platform_data *pdata = pdev->dev.platform_data;

So this can be dropped as well (and all related code), right?

>  	struct device_node *np = pdev->dev.of_node;
>  	struct gen_pool *pool;
> @@ -3135,14 +3124,7 @@ static int coda_probe(struct platform_device *pdev)
>  	if (!dev)
>  		return -ENOMEM;
>  
> -	pdev_id = of_id ? of_id->data : platform_get_device_id(pdev);
> -
> -	if (of_id)
> -		dev->devtype = of_id->data;
> -	else if (pdev_id)
> -		dev->devtype = &coda_devdata[pdev_id->driver_data];
> -	else
> -		return -EINVAL;
> +	dev->devtype = of_device_get_match_data(&pdev->dev);
>  
>  	dev->dev = &pdev->dev;
>  	dev->clk_per = devm_clk_get(&pdev->dev, "per");
> @@ -3342,7 +3324,6 @@ static struct platform_driver coda_driver = {
>  		.of_match_table = of_match_ptr(coda_dt_ids),
>  		.pm	= &coda_pm_ops,
>  	},
> -	.id_table = coda_platform_ids,
>  };
>  
>  module_platform_driver(coda_driver);
> 

And you can also remove include/linux/platform_data/media/coda.h.

Regards,

	Hans
