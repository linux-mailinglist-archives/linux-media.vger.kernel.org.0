Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F41B33FD51D
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 10:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243002AbhIAIRW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 04:17:22 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43358 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242852AbhIAIRR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Sep 2021 04:17:17 -0400
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 475123D7;
        Wed,  1 Sep 2021 10:16:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630484179;
        bh=po/RjRZkCCCKGG5SUNfYdNK0dMoC0J9WZyWcdaKWb38=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ZnS6OtjL0TOYuUrM5bD3gTjBbWXriFJ40QyYkOej2RjcRGdudcwLlKCPkmPtZDwfq
         lTgeujGmOEUDcj41XMutay3/2qQDzmLdndG1wjviBPccKBCRagrLpQNRmOX+8Au+R2
         Eh+taPv2Asm03qd02hjLW6+TctZL5TmX6JRu6QGM=
Subject: Re: [PATCH] media: rcar_fdp1: Make use of the helper function
 devm_platform_ioremap_resource()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210901055525.7379-1-caihuoqing@baidu.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <797f3440-1f3e-d68b-0a20-e190dc36ed5d@ideasonboard.com>
Date:   Wed, 1 Sep 2021 09:16:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901055525.7379-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/09/2021 06:55, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/media/platform/rcar_fdp1.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar_fdp1.c b/drivers/media/platform/rcar_fdp1.c
> index 89aac60066d9..19de3c19bcca 100644
> --- a/drivers/media/platform/rcar_fdp1.c
> +++ b/drivers/media/platform/rcar_fdp1.c
> @@ -2256,7 +2256,6 @@ static int fdp1_probe(struct platform_device *pdev)
>  	struct fdp1_dev *fdp1;
>  	struct video_device *vfd;
>  	struct device_node *fcp_node;
> -	struct resource *res;
>  	struct clk *clk;
>  	unsigned int i;
>  
> @@ -2283,8 +2282,7 @@ static int fdp1_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, fdp1);
>  
>  	/* Memory-mapped registers */
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	fdp1->regs = devm_ioremap_resource(&pdev->dev, res);
> +	fdp1->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(fdp1->regs))
>  		return PTR_ERR(fdp1->regs);
>  
> 
