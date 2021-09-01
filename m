Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81C883FDDFD
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 16:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231893AbhIAOue (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 10:50:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47826 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbhIAOue (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Sep 2021 10:50:34 -0400
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9CD32559;
        Wed,  1 Sep 2021 16:49:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630507775;
        bh=SzJdlaBw2o7qjms5gbWvAmffcgZIJGKBfa2wvQ36ybo=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=GguQUHRQF3m6G/R2aRSuo5pWJdzg7h85XeSNFzMO4vv722B3f1LfuB8b0uzuRPWLd
         6Zsgl+AOXAU4lBAJj1Vxykgz/R5ioEk4Y87AbiIKhQ+YDecPCXzxfXODQe6dh6hD4G
         +DY1EqJcl8BcMkSIuq+Qfz4pLNGEYs9+eqkY6q0M=
Subject: Re: [PATCH v4] media: rcar_drif: Make use of the helper function
 devm_platform_get_and_ioremap_resource()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210901114459.31493-1-caihuoqing@baidu.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <7c75aa3a-8b1f-2d63-4c30-2c638d60e2c6@ideasonboard.com>
Date:   Wed, 1 Sep 2021 15:49:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901114459.31493-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/09/2021 12:44, Cai Huoqing wrote:
> Use the devm_platform_get_and_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately.
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
> v1->v2:
> Use devm_platform_get_and_ioremap_resource() instead of
> devm_platform_ioremap_resource().
> v2->v3:
> Update commit message.
> v3->v4:
> Remove the change - "struct resource *res"
>  
>  drivers/media/platform/rcar_drif.c | 3 +--
>  1 file changed, 1 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar_drif.c b/drivers/media/platform/rcar_drif.c
> index a505d991548b..e50673276d93 100644
> --- a/drivers/media/platform/rcar_drif.c
> +++ b/drivers/media/platform/rcar_drif.c
> @@ -1395,8 +1395,7 @@ static int rcar_drif_probe(struct platform_device *pdev)
>  	}
>  
>  	/* Register map */
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	ch->base = devm_ioremap_resource(&pdev->dev, res);
> +	ch->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>  	if (IS_ERR(ch->base))
>  		return PTR_ERR(ch->base);
>  
> 

