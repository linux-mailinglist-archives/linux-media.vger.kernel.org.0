Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBC4B6DA70A
	for <lists+linux-media@lfdr.de>; Fri,  7 Apr 2023 03:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbjDGBoD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Apr 2023 21:44:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbjDGBoD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Apr 2023 21:44:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCDCB658B
        for <linux-media@vger.kernel.org>; Thu,  6 Apr 2023 18:44:01 -0700 (PDT)
Received: from pendragon.ideasonboard.com (fp76f193f3.tkyc206.ap.nuro.jp [118.241.147.243])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6BE768A4;
        Fri,  7 Apr 2023 03:43:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1680831839;
        bh=Wr9wEeOzOa6i1Tqga6rd6LoymutSxiJ8k0W3MgNGGV4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TjRDCRiEo7S/AX0lJe74qTTuoNdMNj3SWpBj2X88KUawdNXpeMQga+Ea98oGloj85
         noYsgb2Y180sJ7ZFvi5chGMglf4wlOtUkamXmS2v29qNnfmLDP7JeNaCN6ZfZ/Q3fI
         NIO3FKv8BOqd+VGbqoojPis5rsrX2avYWX54dC7Y=
Date:   Fri, 7 Apr 2023 04:44:07 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] media: i2c: imx290: Add missing \n on
 dev_err_probe() message
Message-ID: <20230407014407.GC31272@pendragon.ideasonboard.com>
References: <20230406095551.952091-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230406095551.952091-1-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

Thank you for the patch.

On Thu, Apr 06, 2023 at 11:55:51AM +0200, Alexander Stein wrote:
> Also dev_err_probe message require a trailing \n.

There should be a blank line here.

> Fixes: 63127235bebd ("media: i2c: imx290: Use dev_err_probe()")
> 

And none here.

But the bug wasn't introduced in the above commit, the \n was missing
before that, right from the start when the driver was merged in commit
828dbc299278 ("media: i2c: Add IMX290 CMOS image sensor driver"). I
would use that commit in the Fixes tag, or drop the Fixes tag
altogether.

> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx290.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 94bba482af38..5ea25b7acc55 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -1602,7 +1602,7 @@ static int imx290_probe(struct i2c_client *client)
>  	imx290->xclk = devm_clk_get(dev, "xclk");
>  	if (IS_ERR(imx290->xclk))
>  		return dev_err_probe(dev, PTR_ERR(imx290->xclk),
> -				     "Could not get xclk");
> +				     "Could not get xclk\n");
>  
>  	ret = imx290_get_regulators(dev, imx290);
>  	if (ret < 0)

-- 
Regards,

Laurent Pinchart
