Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 389B45BCEB5
	for <lists+linux-media@lfdr.de>; Mon, 19 Sep 2022 16:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbiISO22 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Sep 2022 10:28:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbiISO2Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Sep 2022 10:28:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F018B2656C
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 07:28:23 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 307EA9BA;
        Mon, 19 Sep 2022 16:28:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1663597702;
        bh=fmHcc+CPAWqmG5o3iUo7sLYZMY/QaQ5lUhNj3gQ+Aec=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C/b4WSW+6joBqqFcFqDKlrKo5dzviJedlb75HQMcd4EuVX0TyeaxhYfMngeuXebyg
         Le6cGakiuMZEhMYQoWLhdT1edjETrzqokpaTplAAZ69lVH/ammYCEPP0EbZx7Oiodh
         fYv4sXnjDWL7TZehNzOxKq4jzvfPanjT71dIOuq4=
Date:   Mon, 19 Sep 2022 17:28:09 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, pavel@ucw.cz,
        sakari.ailus@linux.intel.com, sean@mess.org
Subject: Re: [PATCH -next 06/13] media: platform: exynos4-is: Switch to use
 dev_err_probe() helper
Message-ID: <Yyh8eW2s6lY7XD74@pendragon.ideasonboard.com>
References: <20220915150324.688062-1-yangyingliang@huawei.com>
 <20220915150324.688062-7-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220915150324.688062-7-yangyingliang@huawei.com>
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

On Thu, Sep 15, 2022 at 11:03:17PM +0800, Yang Yingliang wrote:
> In the probe path, dev_err() can be replace with dev_err_probe()
> which will check if error code is -EPROBE_DEFER.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/media/platform/samsung/exynos4-is/media-dev.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.c b/drivers/media/platform/samsung/exynos4-is/media-dev.c
> index 52b43ea04030..b7977d8da8e5 100644
> --- a/drivers/media/platform/samsung/exynos4-is/media-dev.c
> +++ b/drivers/media/platform/samsung/exynos4-is/media-dev.c
> @@ -1473,9 +1473,7 @@ static int fimc_md_probe(struct platform_device *pdev)
>  
>  	pinctrl = devm_pinctrl_get(dev);
>  	if (IS_ERR(pinctrl)) {
> -		ret = PTR_ERR(pinctrl);
> -		if (ret != EPROBE_DEFER)
> -			dev_err(dev, "Failed to get pinctrl: %d\n", ret);
> +		dev_err_probe(dev, PTR_ERR(pinctrl), "Failed to get pinctrl\n");

You need to set ret here.

>  		goto err_clk;
>  	}
>  

-- 
Regards,

Laurent Pinchart
