Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84E71550762
	for <lists+linux-media@lfdr.de>; Sun, 19 Jun 2022 00:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbiFRW7j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jun 2022 18:59:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiFRW7i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jun 2022 18:59:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AAE1FD2A
        for <linux-media@vger.kernel.org>; Sat, 18 Jun 2022 15:59:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA6B4993;
        Sun, 19 Jun 2022 00:59:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655593175;
        bh=KnxiP6PtYkcAKHZWLzaRhF+h843C8dZdHVebblOmi3M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Yq4uJvsbaDYVyyu2FU9JhDg/uHtI4I0WzyxU2uihNi/e69qzKeNtLVcNfGo1mi/l6
         NdEZgFuMOIbRQBezSM+IA1GdEoEraHcwJV+eL6rlj/AMTn/yAJKCAFAPbv4txzcmnH
         l3MchuCrW1UdqLYdgYiK6ne5wxg8qta6s16jdGeo=
Date:   Sun, 19 Jun 2022 01:59:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH] media: mt9p031: Check for non-null I2C ID match
Message-ID: <Yq5YyYxGqc0S8rfe@pendragon.ideasonboard.com>
References: <20220618222232.478138-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220618222232.478138-1-marex@denx.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek,

(CC'ing Wolfram)

Thank you for the patch.

On Sun, Jun 19, 2022 at 12:22:32AM +0200, Marek Vasut wrote:
> The const struct i2c_device_id *did passed to probe may be NULL e.g.
> in case DT contains the following compatible string:
> compatible = "aptina,mt9p006", "aptina,mt9p031";
> 
> Check the variable for non-NULL and fail gracefully instead of crashing
> the kernel outright with NULL pointer dereference splat.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Stefan Riedmueller <s.riedmueller@phytec.de>
> ---
>  drivers/media/i2c/mt9p031.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index e0f0d87d4cfe9..d0706723e493c 100644
> --- a/drivers/media/i2c/mt9p031.c
> +++ b/drivers/media/i2c/mt9p031.c
> @@ -1106,6 +1106,11 @@ static int mt9p031_probe(struct i2c_client *client,
>  		return -EINVAL;
>  	}
>  
> +	if (did == NULL) {
> +		dev_err(&client->dev, "Invalid I2C device ID\n");
> +		return -EINVAL;
> +	}
> +

Is there a way we could fix this in the I2C core ? See
https://lore.kernel.org/all/20210723183114.26017-1-laurent.pinchart@ideasonboard.com/

>  	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA)) {
>  		dev_warn(&client->dev,
>  			"I2C-Adapter doesn't support I2C_FUNC_SMBUS_WORD\n");

-- 
Regards,

Laurent Pinchart
