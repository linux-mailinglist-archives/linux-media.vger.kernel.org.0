Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3114D5BCE7C
	for <lists+linux-media@lfdr.de>; Mon, 19 Sep 2022 16:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbiISOWW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Sep 2022 10:22:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiISOWT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Sep 2022 10:22:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE8AA1AF1A
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 07:22:16 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD3689BA;
        Mon, 19 Sep 2022 16:22:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1663597334;
        bh=51vWlqozUa+GhCbwmgZt1wdIXX8BsObtZP6wVEGEPuE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KYxcIkmXCLI/nnmCgFYOdND6zPnnBZ0BaLWo7e9QgnhGtsDx+f/4e0qzhxXggg/FI
         /u+SpqIx9/JA0ZuxhUyz5nQHG7u6ZQH9RT2P+vkrUmIC4/rk5aKuO5iX2isweveZxx
         Cwx2zaxqM9LVa9SSzzGYIwKIEtiGUIS9qF+k6OZs=
Date:   Mon, 19 Sep 2022 17:22:01 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, pavel@ucw.cz,
        sakari.ailus@linux.intel.com, sean@mess.org
Subject: Re: [PATCH -next 11/13] media: rc: gpio-ir-tx: Switch to use
 dev_err_probe() helper
Message-ID: <Yyh7CdhYTDt12UV4@pendragon.ideasonboard.com>
References: <20220915150324.688062-1-yangyingliang@huawei.com>
 <20220915150324.688062-12-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220915150324.688062-12-yangyingliang@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yang,

Thank you for the patch.

On Thu, Sep 15, 2022 at 11:03:22PM +0800, Yang Yingliang wrote:
> In the probe path, dev_err() can be replace with dev_err_probe()
> which will check if error code is -EPROBE_DEFER.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/rc/gpio-ir-tx.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/rc/gpio-ir-tx.c b/drivers/media/rc/gpio-ir-tx.c
> index d3063ddb472e..2b829c146db1 100644
> --- a/drivers/media/rc/gpio-ir-tx.c
> +++ b/drivers/media/rc/gpio-ir-tx.c
> @@ -174,12 +174,9 @@ static int gpio_ir_tx_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	gpio_ir->gpio = devm_gpiod_get(&pdev->dev, NULL, GPIOD_OUT_LOW);
> -	if (IS_ERR(gpio_ir->gpio)) {
> -		if (PTR_ERR(gpio_ir->gpio) != -EPROBE_DEFER)
> -			dev_err(&pdev->dev, "Failed to get gpio (%ld)\n",
> -				PTR_ERR(gpio_ir->gpio));
> -		return PTR_ERR(gpio_ir->gpio);
> -	}
> +	if (IS_ERR(gpio_ir->gpio))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(gpio_ir->gpio),
> +				     "Failed to get gpio\n");
>  
>  	rcdev->priv = gpio_ir;
>  	rcdev->driver_name = DRIVER_NAME;

-- 
Regards,

Laurent Pinchart
