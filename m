Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBD0A5B9FBB
	for <lists+linux-media@lfdr.de>; Thu, 15 Sep 2022 18:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbiIOQi6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Sep 2022 12:38:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiIOQi5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Sep 2022 12:38:57 -0400
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 878255757A
        for <linux-media@vger.kernel.org>; Thu, 15 Sep 2022 09:38:56 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id DF38B100056; Thu, 15 Sep 2022 17:38:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1663259931; bh=nDubwgpPjOmvP9OVYTIJs9KSvnZl1Rhuo1bYU+y4Uwk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PfSoLuJsNzL2kE71UtgGvcHTfaHq3TZQJuwkfBO8eW68wG4yGbKX4TC5xKKOUUAGa
         rmnGvoiR/j/E49l2UgnrZybbu07UnqN1uqNduXmkuGr4/Acp1JPUbBJfVv2d/Zvbeq
         InzRE7xgYR8bhWo7T8BicxOUUTgeoLscLiPIum+/SaYvaNK1W1d92pIUmrX8uGBMQp
         41FRL99FbnLcfQyU+IRk9LozeqSlbSjja5Uaw72rMGiup+pvp1Xt5WpC/S8o7RHq9L
         B15UtXugorCTK1iibq7A/anu4pSqvHZlxgEvx91MJKlacrw7zmetssDt7kkWv1cIUC
         /aIc/syCKHZTw==
Date:   Thu, 15 Sep 2022 17:38:51 +0100
From:   Sean Young <sean@mess.org>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, pavel@ucw.cz,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH -next 10/13] media: rc: gpio-ir-recv: Switch to use
 dev_err_probe() helper
Message-ID: <YyNVG1EZ0anbDf0R@gofer.mess.org>
References: <20220915150324.688062-1-yangyingliang@huawei.com>
 <20220915150324.688062-11-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220915150324.688062-11-yangyingliang@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 15, 2022 at 11:03:21PM +0800, Yang Yingliang wrote:
> In the probe path, dev_err() can be replace with dev_err_probe()
> which will check if error code is -EPROBE_DEFER.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/media/rc/gpio-ir-recv.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/rc/gpio-ir-recv.c b/drivers/media/rc/gpio-ir-recv.c
> index 22e524b69806..8f1fff7af6c9 100644
> --- a/drivers/media/rc/gpio-ir-recv.c
> +++ b/drivers/media/rc/gpio-ir-recv.c
> @@ -74,13 +74,9 @@ static int gpio_ir_recv_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	gpio_dev->gpiod = devm_gpiod_get(dev, NULL, GPIOD_IN);
> -	if (IS_ERR(gpio_dev->gpiod)) {
> -		rc = PTR_ERR(gpio_dev->gpiod);
> -		/* Just try again if this happens */
> -		if (rc != -EPROBE_DEFER)
> -			dev_err(dev, "error getting gpio (%d)\n", rc);
> -		return rc;
> -	}
> +	if (IS_ERR(gpio_dev->gpiod))
> +		return dev_err_probe(dev, PTR_ERR(gpio_dev->gpiod),
> +				     "error getting gpio\n");

Now the error number is no longer logged. That can't be good?


Sean

>  	gpio_dev->irq = gpiod_to_irq(gpio_dev->gpiod);
>  	if (gpio_dev->irq < 0)
>  		return gpio_dev->irq;
> -- 
> 2.25.1
