Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3B373FD871
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 13:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242088AbhIALKw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 07:10:52 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45438 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232095AbhIALIx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Sep 2021 07:08:53 -0400
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1671B3D7;
        Wed,  1 Sep 2021 13:07:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630494475;
        bh=t3+akF/1OktgGWbEpyZiTnFe8I2naccDbiRpGqMi/+Y=;
        h=Subject:To:Cc:References:From:Reply-To:Date:In-Reply-To:From;
        b=mo2PGXkTOFQUc7xDNbYcoxvuQPp88vr0E+OXPddDYxL4eFsmlBDw46DwnpfspJJfz
         qv3Jsi0CwOZAGeNum/zs2c5jdu7yLl1q0kyVNb/MU0ywIf+APLq1tylfXmMT1ZTGdu
         zrIV5wCeQmX/SNs1fafKg5D7n/DS6SuVH4K9efos=
Subject: Re: [PATCH] media: rcar-csi2: Make use of the helper function
 devm_platform_ioremap_resource()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210901055510.7279-1-caihuoqing@baidu.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
Organization: Ideas on Board
Message-ID: <91a4539d-0ebb-c24c-583f-e356d42c3ea8@ideasonboard.com>
Date:   Wed, 1 Sep 2021 12:07:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901055510.7279-1-caihuoqing@baidu.com>
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
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index 711b52ba42b5..a4952711b7b1 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -1238,11 +1238,9 @@ static const struct media_entity_operations rcar_csi2_entity_ops = {
>  static int rcsi2_probe_resources(struct rcar_csi2 *priv,
>  				 struct platform_device *pdev)
>  {
> -	struct resource *res;
>  	int irq, ret;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	priv->base = devm_ioremap_resource(&pdev->dev, res);
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(priv->base))
>  		return PTR_ERR(priv->base);
>  
> 

