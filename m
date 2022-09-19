Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A0125BCEEF
	for <lists+linux-media@lfdr.de>; Mon, 19 Sep 2022 16:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbiISOcw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Sep 2022 10:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbiISOcb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Sep 2022 10:32:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75D3B33405
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 07:32:22 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 498FC9BA;
        Mon, 19 Sep 2022 16:32:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1663597940;
        bh=Y8GY8W7wgN/A9dXtyTo6rpp0rkLZmoNsjEiFiXfawfE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vq+zyrOJJY0VabozwwV45S39tqdxkcNgaIAPJPfitFnMClX9aSOQNIipV5ebImzN8
         E2s9Sc+EevFvNHZ6s98FBX2pp+XXEz7EV37wQlGIsA7pSyxi0DKul9OZUCHv6Ex4u2
         u4nb3H4GVxhI7KVX4MlSjXyDyZVjHaeAYq6yxfVg=
Date:   Mon, 19 Sep 2022 17:32:06 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, pavel@ucw.cz,
        sakari.ailus@linux.intel.com, sean@mess.org
Subject: Re: [PATCH -next 01/13] media: platform: stm32-cec: Switch to use
 dev_err_probe() helper
Message-ID: <Yyh9ZnpxZSKRTa2O@pendragon.ideasonboard.com>
References: <20220915150324.688062-1-yangyingliang@huawei.com>
 <20220915150324.688062-2-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220915150324.688062-2-yangyingliang@huawei.com>
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

On Thu, Sep 15, 2022 at 11:03:12PM +0800, Yang Yingliang wrote:
> In the probe path, dev_err() can be replace with dev_err_probe()
> which will check if error code is -EPROBE_DEFER.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/cec/platform/stm32/stm32-cec.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/cec/platform/stm32/stm32-cec.c b/drivers/media/cec/platform/stm32/stm32-cec.c
> index 40db7911b437..7b2db46a5722 100644
> --- a/drivers/media/cec/platform/stm32/stm32-cec.c
> +++ b/drivers/media/cec/platform/stm32/stm32-cec.c
> @@ -288,12 +288,9 @@ static int stm32_cec_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	cec->clk_cec = devm_clk_get(&pdev->dev, "cec");
> -	if (IS_ERR(cec->clk_cec)) {
> -		if (PTR_ERR(cec->clk_cec) != -EPROBE_DEFER)
> -			dev_err(&pdev->dev, "Cannot get cec clock\n");
> -
> -		return PTR_ERR(cec->clk_cec);
> -	}
> +	if (IS_ERR(cec->clk_cec))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(cec->clk_cec),
> +				     "Cannot get cec clock\n");
>  
>  	ret = clk_prepare(cec->clk_cec);
>  	if (ret) {

-- 
Regards,

Laurent Pinchart
