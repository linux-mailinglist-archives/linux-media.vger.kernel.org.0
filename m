Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85EA35BCE12
	for <lists+linux-media@lfdr.de>; Mon, 19 Sep 2022 16:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbiISOH5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Sep 2022 10:07:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbiISOHy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Sep 2022 10:07:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B3031EF9
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 07:07:51 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DDDDF9BA;
        Mon, 19 Sep 2022 16:07:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1663596470;
        bh=dMBcyy5pF3uwA8Rg9et0wJNP8LIlENkLPPynp9Cng7g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y/RPZmgnepRQm0Cj2N+FXcIxHOlXFOMJJc/2esVnBiDHU8Vp/BP6iqvZeN2qgGsn2
         yGKSpq/zz9P3xkachmXIc8m54m/aecKTw3Im5CgmBBl/htcq5LHmnr4KO6q7QbYi4R
         xwcp1ruyCdTAeNn4LhBp/dFR9ux+V5rll0dzqPkY=
Date:   Mon, 19 Sep 2022 17:07:36 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, pavel@ucw.cz,
        sakari.ailus@linux.intel.com, sean@mess.org
Subject: Re: [PATCH -next 03/13] media: i2c: imx274: Switch to use
 dev_err_probe() helper
Message-ID: <Yyh3qJahu8W722SE@pendragon.ideasonboard.com>
References: <20220915150324.688062-1-yangyingliang@huawei.com>
 <20220915150324.688062-4-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220915150324.688062-4-yangyingliang@huawei.com>
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

On Thu, Sep 15, 2022 at 11:03:14PM +0800, Yang Yingliang wrote:
> In the probe path, dev_err() can be replace with dev_err_probe()
> which will check if error code is -EPROBE_DEFER.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/media/i2c/imx274.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
> index a00761b1e18c..0df515ab2cbf 100644
> --- a/drivers/media/i2c/imx274.c
> +++ b/drivers/media/i2c/imx274.c
> @@ -2060,9 +2060,8 @@ static int imx274_probe(struct i2c_client *client)
>  	imx274->reset_gpio = devm_gpiod_get_optional(dev, "reset",
>  						     GPIOD_OUT_HIGH);
>  	if (IS_ERR(imx274->reset_gpio)) {
> -		if (PTR_ERR(imx274->reset_gpio) != -EPROBE_DEFER)
> -			dev_err(dev, "Reset GPIO not setup in DT");
> -		ret = PTR_ERR(imx274->reset_gpio);
> +		ret = dev_err_probe(dev, PTR_ERR(imx274->reset_gpio),
> +				    "Reset GPIO not setup in DT");

While at it, could you add the missing \n at the end of the message ?
With this fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  		goto err_me;
>  	}
>  

-- 
Regards,

Laurent Pinchart
