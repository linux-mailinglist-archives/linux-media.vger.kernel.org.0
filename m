Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E30E93FD869
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 13:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237050AbhIALGw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 07:06:52 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45408 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232095AbhIALGv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Sep 2021 07:06:51 -0400
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 894C63D7;
        Wed,  1 Sep 2021 13:05:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630494353;
        bh=vBL3hgmAfgvTySdTKjIKgHFeX3apchXm9QXRGcsZJeU=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=OfQ6dMjJ4ur72ixmAwxAta9gxWEdrPpnDcndVQkpYuzs1hI4RkqR2qJRdmHsQ+G0e
         I0Ec+z9w92ZPxvYAF+nJi239VOS0JGpjutl0km+kxPDXckpTeiWzjpL2O2/5ZR4juw
         yk/Nf9arv4YxgduSgU2e9Y5RIySOXkeks0hZAClg=
Subject: Re: [PATCH] media: renesas-ceu: Make use of the helper function
 devm_platform_ioremap_resource()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210901055540.7479-1-caihuoqing@baidu.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <d9304b83-faeb-248e-ac7e-942a53054a1a@ideasonboard.com>
Date:   Wed, 1 Sep 2021 12:05:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901055540.7479-1-caihuoqing@baidu.com>
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
>  drivers/media/platform/renesas-ceu.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas-ceu.c b/drivers/media/platform/renesas-ceu.c
> index 9376eb363748..2e8dbacc414e 100644
> --- a/drivers/media/platform/renesas-ceu.c
> +++ b/drivers/media/platform/renesas-ceu.c
> @@ -1628,7 +1628,6 @@ static int ceu_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	const struct ceu_data *ceu_data;
>  	struct ceu_device *ceudev;
> -	struct resource *res;
>  	unsigned int irq;
>  	int num_subdevs;
>  	int ret;
> @@ -1644,8 +1643,7 @@ static int ceu_probe(struct platform_device *pdev)
>  	spin_lock_init(&ceudev->lock);
>  	mutex_init(&ceudev->mlock);
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	ceudev->base = devm_ioremap_resource(dev, res);
> +	ceudev->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(ceudev->base)) {
>  		ret = PTR_ERR(ceudev->base);
>  		goto error_free_ceudev;
> 

