Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37E185F6B44
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 18:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231567AbiJFQMD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 12:12:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231458AbiJFQMA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 12:12:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFFA2ACA2F
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 09:11:58 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0AFCF4DD;
        Thu,  6 Oct 2022 18:11:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665072716;
        bh=TvxXfoOLsyyeoBt12rce2mOXn3oe/pnaPx78scEShSs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gdOAh8zg2hEVQoPWuK5k9QrD27w0QIvL+C27UYzGLV/voMeBO4XNPXPHAvtXiHR2D
         s1JcORxryujzEtUF6uOmsuk7tgJJY7FtthOi0yq9q2TfZehWGByFYQRY+dENuMYlG1
         r5sixeojAAOwAmzjt3UZr66OTtC2NWgFLK/Z4Z5Q=
Date:   Thu, 6 Oct 2022 19:11:51 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Subject: Re: [PATCH 10/10] media: ar0521: Tab-align definitions
Message-ID: <Yz7+R7f7JBQSCwIh@pendragon.ideasonboard.com>
References: <20221005190613.394277-1-jacopo@jmondi.org>
 <20221005190613.394277-11-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221005190613.394277-11-jacopo@jmondi.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Wed, Oct 05, 2022 at 09:06:13PM +0200, Jacopo Mondi wrote:
> Align some register and constant definitions using tab in place of
> mixed tab+spaces.
> 
> Cosmetic change only.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

That's an easy one.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/ar0521.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> index 670fa33acc6f..4373693fa3e9 100644
> --- a/drivers/media/i2c/ar0521.c
> +++ b/drivers/media/i2c/ar0521.c
> @@ -16,17 +16,17 @@
>  #include <media/v4l2-subdev.h>
>  
>  /* External clock (extclk) frequencies */
> -#define AR0521_EXTCLK_MIN	  (10 * 1000 * 1000)
> -#define AR0521_EXTCLK_MAX	  (48 * 1000 * 1000)
> +#define AR0521_EXTCLK_MIN		(10 * 1000 * 1000)
> +#define AR0521_EXTCLK_MAX		(48 * 1000 * 1000)
>  
>  /* PLL and PLL2 */
> -#define AR0521_PLL_MIN		 (320 * 1000 * 1000)
> -#define AR0521_PLL_MAX		(1280 * 1000 * 1000)
> +#define AR0521_PLL_MIN			(320 * 1000 * 1000)
> +#define AR0521_PLL_MAX			(1280 * 1000 * 1000)
>  
>  /* Effective pixel sample rate on the pixel array. */
> -#define AR0521_PIXEL_CLOCK_RATE	 (207 * 1000 * 1000)
> -#define AR0521_PIXEL_CLOCK_MIN	 (168 * 1000 * 1000)
> -#define AR0521_PIXEL_CLOCK_MAX	 (414 * 1000 * 1000)
> +#define AR0521_PIXEL_CLOCK_RATE		(207 * 1000 * 1000)
> +#define AR0521_PIXEL_CLOCK_MIN		(168 * 1000 * 1000)
> +#define AR0521_PIXEL_CLOCK_MAX		(414 * 1000 * 1000)
>  
>  #define AR0521_NATIVE_WIDTH		2604u
>  #define AR0521_NATIVE_HEIGHT		1964u
> @@ -35,15 +35,15 @@
>  #define AR0521_MAX_X_ADDR_END		2603u
>  #define AR0521_MAX_Y_ADDR_END		1963u
>  
> -#define AR0521_WIDTH_MIN	       8u
> -#define AR0521_WIDTH_MAX	    2592u
> -#define AR0521_HEIGHT_MIN	       8u
> -#define AR0521_HEIGHT_MAX	    1944u
> +#define AR0521_WIDTH_MIN		8u
> +#define AR0521_WIDTH_MAX		2592u
> +#define AR0521_HEIGHT_MIN		8u
> +#define AR0521_HEIGHT_MAX		1944u
>  
> -#define AR0521_WIDTH_BLANKING_MIN     572u
> -#define AR0521_HEIGHT_BLANKING_MIN     38u /* must be even */
> -#define AR0521_TOTAL_HEIGHT_MAX      2464u /* max value of y_addr_end reg */
> -#define AR0521_TOTAL_WIDTH_MAX       3280u /* max value of x_addr_end reg */
> +#define AR0521_WIDTH_BLANKING_MIN	572u
> +#define AR0521_HEIGHT_BLANKING_MIN	38u /* must be even */
> +#define AR0521_TOTAL_HEIGHT_MAX		2464u /* max value of y_addr_end reg */
> +#define AR0521_TOTAL_WIDTH_MAX		3280u /* max value of x_addr_end reg */
>  
>  #define AR0521_ANA_GAIN_MIN		0x00
>  #define AR0521_ANA_GAIN_MAX		0x3f

-- 
Regards,

Laurent Pinchart
