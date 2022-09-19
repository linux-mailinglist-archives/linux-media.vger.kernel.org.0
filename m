Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7421F5BCF17
	for <lists+linux-media@lfdr.de>; Mon, 19 Sep 2022 16:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbiISOhq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Sep 2022 10:37:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230167AbiISOha (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Sep 2022 10:37:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0034332EE9
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 07:37:28 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC8F59BA;
        Mon, 19 Sep 2022 16:37:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1663598247;
        bh=gphDmjSN2zWhsEKzAI87rIjg0j0/xvRBcDyiKZtUf/Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ovJxgfa8FVB/fUI1Ug8Q98GRKd9/u1XzqNBzLpeZKGpDykz45WwYaAbe7jJRqzp41
         vBWRHJqHsjeivWdXtFCT8EuJXPNAGIYtQAG6eggjMF+GH4L49q9Ow6Z24Klb3G3Rah
         UMdqKdIqJw1XecBGvy9OSwECHQoc8jx4ChAHKBWI=
Date:   Mon, 19 Sep 2022 17:37:13 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, pavel@ucw.cz,
        sakari.ailus@linux.intel.com, sean@mess.org
Subject: Re: [PATCH -next 02/13] media: i2c: ad5820: Switch to use
 dev_err_probe() helper
Message-ID: <Yyh+mb3xUiBRUolY@pendragon.ideasonboard.com>
References: <20220915150324.688062-1-yangyingliang@huawei.com>
 <20220915150324.688062-3-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220915150324.688062-3-yangyingliang@huawei.com>
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

On Thu, Sep 15, 2022 at 11:03:13PM +0800, Yang Yingliang wrote:
> In the probe path, dev_err() can be replace with dev_err_probe()
> which will check if error code is -EPROBE_DEFER.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/ad5820.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/i2c/ad5820.c b/drivers/media/i2c/ad5820.c
> index 516de278cc49..6a7f8ef9db05 100644
> --- a/drivers/media/i2c/ad5820.c
> +++ b/drivers/media/i2c/ad5820.c
> @@ -301,21 +301,15 @@ static int ad5820_probe(struct i2c_client *client,
>  		return -ENOMEM;
>  
>  	coil->vana = devm_regulator_get(&client->dev, "VANA");
> -	if (IS_ERR(coil->vana)) {
> -		ret = PTR_ERR(coil->vana);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(&client->dev, "could not get regulator for vana\n");
> -		return ret;
> -	}
> +	if (IS_ERR(coil->vana))
> +		return dev_err_probe(&client->dev, PTR_ERR(coil->vana),
> +				     "could not get regulator for vana\n");
>  
>  	coil->enable_gpio = devm_gpiod_get_optional(&client->dev, "enable",
>  						    GPIOD_OUT_LOW);
> -	if (IS_ERR(coil->enable_gpio)) {
> -		ret = PTR_ERR(coil->enable_gpio);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(&client->dev, "could not get enable gpio\n");
> -		return ret;
> -	}
> +	if (IS_ERR(coil->enable_gpio))
> +		return dev_err_probe(&client->dev, PTR_ERR(coil->enable_gpio),
> +				     "could not get enable gpio\n");
>  
>  	mutex_init(&coil->power_lock);
>  

-- 
Regards,

Laurent Pinchart
