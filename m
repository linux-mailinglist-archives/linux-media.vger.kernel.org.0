Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F402550768
	for <lists+linux-media@lfdr.de>; Sun, 19 Jun 2022 01:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233394AbiFRXDK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jun 2022 19:03:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232678AbiFRXDJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jun 2022 19:03:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B2010566
        for <linux-media@vger.kernel.org>; Sat, 18 Jun 2022 16:03:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF39A993;
        Sun, 19 Jun 2022 01:03:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655593386;
        bh=pz4a/726v+6HwTLulmbg6gMNl7Rh1sHvOES3hbZ7t0M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V91SyrZ20PlptK9Q6+x+/L9tfVkoRWWZJrbYUioxBajYJvCmrd9At/sby0s7atQ61
         KonalqffdKLLqPKXVG18lEPpSG7hv7/rrNYC2fW+pN0TpSwVz9dFIPTslngUfOb1Ga
         pxO7sb+oveqbqIVzRP+qbevvUhv7D+rB2cZYKQok=
Date:   Sun, 19 Jun 2022 02:02:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: Re: [PATCH 2/2] media: mt9p031: Add MT9P006 compatible
Message-ID: <Yq5ZncsWEJ0/x7Gc@pendragon.ideasonboard.com>
References: <20220618222255.478165-1-marex@denx.de>
 <20220618222255.478165-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220618222255.478165-2-marex@denx.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek,

Thank you for the patch.

On Sun, Jun 19, 2022 at 12:22:55AM +0200, Marek Vasut wrote:
> Add compatible for MT9P006 sensor, which is older variant of MT9P031
> and compatible with this driver.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Stefan Riedmueller <s.riedmueller@phytec.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/mt9p031.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index d0706723e493c..a81d1ca058b9c 100644
> --- a/drivers/media/i2c/mt9p031.c
> +++ b/drivers/media/i2c/mt9p031.c
> @@ -1234,6 +1234,7 @@ static int mt9p031_remove(struct i2c_client *client)
>  }
>  
>  static const struct i2c_device_id mt9p031_id[] = {
> +	{ "mt9p006", MT9P031_MODEL_COLOR },
>  	{ "mt9p031", MT9P031_MODEL_COLOR },
>  	{ "mt9p031m", MT9P031_MODEL_MONOCHROME },
>  	{ }
> @@ -1242,6 +1243,7 @@ MODULE_DEVICE_TABLE(i2c, mt9p031_id);
>  
>  #if IS_ENABLED(CONFIG_OF)
>  static const struct of_device_id mt9p031_of_match[] = {
> +	{ .compatible = "aptina,mt9p006", },
>  	{ .compatible = "aptina,mt9p031", },
>  	{ .compatible = "aptina,mt9p031m", },
>  	{ /* sentinel */ },

-- 
Regards,

Laurent Pinchart
