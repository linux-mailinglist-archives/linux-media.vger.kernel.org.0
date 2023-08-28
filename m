Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DCFE78B21C
	for <lists+linux-media@lfdr.de>; Mon, 28 Aug 2023 15:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbjH1Nj5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Aug 2023 09:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230108AbjH1Nj2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Aug 2023 09:39:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D607791
        for <linux-media@vger.kernel.org>; Mon, 28 Aug 2023 06:39:25 -0700 (PDT)
Received: from ideasonboard.com (mob-5-91-19-240.net.vodafone.it [5.91.19.240])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8477D741;
        Mon, 28 Aug 2023 15:38:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693229883;
        bh=BlL5e0bnSrIdIKGnEgjfjgA5FVA5gxd+ZUs1fNCI7f8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F8NJmjty7PAF8zGit/xkZPa4qC+U/P9p1qNUoVgMhDiqzqH7/HVhMCVAC23ppxXMu
         P/804IqewHmGAJ6E5jRpqjl+ESbma7zJpWfkQzpp/d61QDhw64Cu4ES1b7iCEP8QEW
         bmD0rtC0Xf/aON+fKvvRL+W232Z6zU16U4zlJWlw=
Date:   Mon, 28 Aug 2023 15:39:20 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 09/18] media: i2c: imx219: Infer binning settings from
 format and crop
Message-ID: <frrnq7cx5akhsdwzcpzhim7lm5tbz3mtz6brvw7hezukimckhn@jkclrz5es623>
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com>
 <20230821223001.28480-10-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230821223001.28480-10-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Tue, Aug 22, 2023 at 01:29:52AM +0300, Laurent Pinchart wrote:
> Compare the format and crop rectangle dimensions to infer binning
> settings, instead of storing the binning mode in the imx219_mode
> structure. This removes duplicate information from the mode.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  drivers/media/i2c/imx219.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 1205986ce47e..0c26cbfe58f3 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -161,9 +161,6 @@ struct imx219_mode {
>
>  	/* V-timing */
>  	unsigned int vts_def;
> -
> -	/* 2x2 binning is used */
> -	bool binning;
>  };
>
>  static const struct cci_reg_sequence imx219_common_regs[] = {
> @@ -306,7 +303,6 @@ static const struct imx219_mode supported_modes[] = {
>  			.height = 2464
>  		},
>  		.vts_def = IMX219_VTS_15FPS,
> -		.binning = false,
>  	},
>  	{
>  		/* 1080P 30fps cropped */
> @@ -319,7 +315,6 @@ static const struct imx219_mode supported_modes[] = {
>  			.height = 1080
>  		},
>  		.vts_def = IMX219_VTS_30FPS_1080P,
> -		.binning = false,
>  	},
>  	{
>  		/* 2x2 binned 30fps mode */
> @@ -332,7 +327,6 @@ static const struct imx219_mode supported_modes[] = {
>  			.height = 2464
>  		},
>  		.vts_def = IMX219_VTS_30FPS_BINNED,
> -		.binning = true,
>  	},
>  	{
>  		/* 640x480 30fps mode */
> @@ -345,7 +339,6 @@ static const struct imx219_mode supported_modes[] = {
>  			.height = 960
>  		},
>  		.vts_def = IMX219_VTS_30FPS_640x480,
> -		.binning = true,
>  	},
>  };
>
> @@ -648,7 +641,7 @@ static int imx219_set_framefmt(struct imx219 *imx219,
>  	cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
>  		  crop->top - IMX219_PIXEL_ARRAY_TOP + crop->height - 1, &ret);
>
> -	if (!imx219->mode->binning)
> +	if (format->width == crop->width && format->height == crop->height)
>  		bin_mode = IMX219_BINNING_NONE;
>  	else if (bpp == 8)
>  		bin_mode = IMX219_BINNING_2X2_ANALOG;
> --
> Regards,
>
> Laurent Pinchart
>
