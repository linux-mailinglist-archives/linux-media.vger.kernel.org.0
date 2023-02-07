Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5F6E68CC43
	for <lists+linux-media@lfdr.de>; Tue,  7 Feb 2023 02:47:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbjBGBrQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Feb 2023 20:47:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjBGBrM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Feb 2023 20:47:12 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C44CB44F
        for <linux-media@vger.kernel.org>; Mon,  6 Feb 2023 17:46:56 -0800 (PST)
Received: from pendragon.ideasonboard.com (unknown [109.136.43.56])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 304504AF;
        Tue,  7 Feb 2023 02:46:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675734379;
        bh=KZRGWf12vuNXbG/Onkyl/ZKS25SM+huRqNhjS7UZ/7s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EV/VxsTxPXvL/ra7MbEd3A2eFqzfrRLEAKi7vxUanywU0qz/hrI1xe7GGuaCAEMnh
         AofvaCuO/PlCx3zihhngDrNlQ78wsGVOoTAtrI+HdoIsqFlXaL9ZyNJ0Cn6SKu7KTc
         gSgVWhlLYSlPRH9TUf2I5QE4Vk+2qZh8fKjp354o=
Date:   Tue, 7 Feb 2023 03:46:17 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v2 09/13] media: i2c: imx290: VMAX is mode dependent
Message-ID: <Y+Gtad8YVf730qjR@pendragon.ideasonboard.com>
References: <20230203191811.947697-1-dave.stevenson@raspberrypi.com>
 <20230203191811.947697-10-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230203191811.947697-10-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

Thank you for the patch.

On Fri, Feb 03, 2023 at 07:18:07PM +0000, Dave Stevenson wrote:
> The default VMAX for 60fps in 720p mode is 750 according to
> the datasheet, however the driver always left it at 1125
> thereby stopping 60fps being achieved.
> 
> Make VMAX (and therefore V4L2_CID_VBLANK) mode dependent so
> that 720p60 can be achieved.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx290.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 403bd7de875e..6235021a8d24 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -110,8 +110,6 @@
>  /* Number of lines by which exposure must be less than VMAX) */
>  #define IMX290_EXPOSURE_OFFSET				2
>  
> -#define IMX290_VMAX_DEFAULT				1125
> -
>  #define IMX290_PIXEL_RATE				148500000
>  
>  /*
> @@ -189,6 +187,7 @@ struct imx290_mode {
>  	u32 width;
>  	u32 height;
>  	u32 hmax_min;
> +	u32 vmax_min;
>  	u8 link_freq_index;
>  
>  	const struct imx290_regval *data;
> @@ -432,6 +431,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
>  		.width = 1920,
>  		.height = 1080,
>  		.hmax_min = 2200,
> +		.vmax_min = 1125,
>  		.link_freq_index = FREQ_INDEX_1080P,
>  		.data = imx290_1080p_settings,
>  		.data_size = ARRAY_SIZE(imx290_1080p_settings),
> @@ -440,6 +440,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
>  		.width = 1280,
>  		.height = 720,
>  		.hmax_min = 3300,
> +		.vmax_min = 750,
>  		.link_freq_index = FREQ_INDEX_720P,
>  		.data = imx290_720p_settings,
>  		.data_size = ARRAY_SIZE(imx290_720p_settings),
> @@ -451,6 +452,7 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
>  		.width = 1920,
>  		.height = 1080,
>  		.hmax_min = 2200,
> +		.vmax_min = 1125,
>  		.link_freq_index = FREQ_INDEX_1080P,
>  		.data = imx290_1080p_settings,
>  		.data_size = ARRAY_SIZE(imx290_1080p_settings),
> @@ -459,6 +461,7 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
>  		.width = 1280,
>  		.height = 720,
>  		.hmax_min = 3300,
> +		.vmax_min = 750,
>  		.link_freq_index = FREQ_INDEX_720P,
>  		.data = imx290_720p_settings,
>  		.data_size = ARRAY_SIZE(imx290_720p_settings),
> @@ -779,7 +782,7 @@ static void imx290_ctrl_update(struct imx290 *imx290,
>  {
>  	unsigned int hblank_min = mode->hmax_min - mode->width;
>  	unsigned int hblank_max = IMX290_HMAX_MAX - mode->width;
> -	unsigned int vblank_min = IMX290_VMAX_DEFAULT - mode->height;
> +	unsigned int vblank_min = mode->vmax_min - mode->height;
>  	unsigned int vblank_max = IMX290_VMAX_MAX - mode->height;
>  
>  	__v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);

-- 
Regards,

Laurent Pinchart
