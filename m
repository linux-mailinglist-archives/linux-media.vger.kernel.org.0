Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B18DF1AA3
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 17:00:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728292AbfKFQAG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 11:00:06 -0500
Received: from mailoutvs18.siol.net ([185.57.226.209]:49403 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731973AbfKFQAG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Nov 2019 11:00:06 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 44D93521596;
        Wed,  6 Nov 2019 17:00:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id obZsmNfd8f1h; Wed,  6 Nov 2019 17:00:01 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 844B05212D8;
        Wed,  6 Nov 2019 17:00:01 +0100 (CET)
Received: from jernej-laptop.localnet (cpe-86-58-102-7.static.triera.net [86.58.102.7])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id D8C49520498;
        Wed,  6 Nov 2019 16:59:57 +0100 (CET)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] media: sun8i: Remove redundant dev_err call in deinterlace_probe()
Date:   Wed, 06 Nov 2019 16:59:57 +0100
Message-ID: <33629436.gII23uOffu@jernej-laptop>
In-Reply-To: <20191106153213.13752-1-weiyongjun1@huawei.com>
References: <20191106153213.13752-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

Dne sreda, 06. november 2019 ob 16:32:12 CET je Wei Yongjun napisal(a):
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Jernej Skrabec <jernej.skrabec@siol.net>

Best regards,
Jernej

> ---
>  drivers/media/platform/sunxi/sun8i-di/sun8i-di.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
> b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c index
> aaa1dc159ac2..b61f3dea7c93 100644
> --- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
> +++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
> @@ -834,11 +834,8 @@ static int deinterlace_probe(struct platform_device
> *pdev)
> 
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	dev->base = devm_ioremap_resource(&pdev->dev, res);
> -	if (IS_ERR(dev->base)) {
> -		dev_err(dev->dev, "Failed to map registers\n");
> -
> +	if (IS_ERR(dev->base))
>  		return PTR_ERR(dev->base);
> -	}
> 
>  	dev->bus_clk = devm_clk_get(dev->dev, "bus");
>  	if (IS_ERR(dev->bus_clk)) {




