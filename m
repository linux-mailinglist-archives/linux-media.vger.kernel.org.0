Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32DE7687AD4
	for <lists+linux-media@lfdr.de>; Thu,  2 Feb 2023 11:51:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbjBBKvk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Feb 2023 05:51:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232177AbjBBKvf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Feb 2023 05:51:35 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3BA91F5FA
        for <linux-media@vger.kernel.org>; Thu,  2 Feb 2023 02:51:06 -0800 (PST)
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA8CB505;
        Thu,  2 Feb 2023 11:50:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675335003;
        bh=mIajA3yOaMgdFqzp9gGYwbawub59IbjckPZ6ahCKH5M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KyCo3SUT9f++OUK6FqR5b9r3rmI0tb7aF5Xg2vojd1QJze0j4FnnapjF2bPSXE9EX
         sN1cyLLQo2Hx/HGu3PFwkAykokwHLDu7Hxx6dObwF+jHXZWYIV/Kzu9xEM2DMnC+K7
         iTXOr1J+rKCmWZm1shjCMIW+32OROA2Sf9IHYHcw=
Date:   Thu, 2 Feb 2023 12:50:01 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 05/11] media: i2c: imx290: Support 60fps in 2 lane
 operation
Message-ID: <Y9uVWfXh3Bsyjta5@pendragon.ideasonboard.com>
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
 <20230131192016.3476937-6-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230131192016.3476937-6-dave.stevenson@raspberrypi.com>
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

On Tue, Jan 31, 2023 at 07:20:10PM +0000, Dave Stevenson wrote:
> Commit "97589ad61c73 media: i2c: imx290: Add support for 2 data lanes"
> added support for running in two lane mode (instead of 4), but
> without changing the link frequency that resulted in a max of 30fps.
> 
> Commit "98e0500eadb7 media: i2c: imx290: Add configurable link frequency
> and pixel rate" then doubled the link frequency when in 2 lane mode,
> but didn't undo the correction for running at only 30fps, just extending
> horizontal blanking instead.
> 
> Remove the 30fps limit on 2 lane by correcting the register config
> in accordance with the datasheet for 60fps operation over 2 lanes.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Looks reasonable. We lose support for 30fps in 2 data lanes, but we get
a coherent behaviour, and we can implement support for lower frame rates
on top (which I suspect may be in further patches in this series :-)).

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx290.c | 17 +++--------------
>  1 file changed, 3 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index bd8729aed43c..6bcfa535872f 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -366,7 +366,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
>  	{
>  		.width = 1920,
>  		.height = 1080,
> -		.hmax = 4400,
> +		.hmax = 2200,
>  		.link_freq_index = FREQ_INDEX_1080P,
>  		.data = imx290_1080p_settings,
>  		.data_size = ARRAY_SIZE(imx290_1080p_settings),
> @@ -374,7 +374,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
>  	{
>  		.width = 1280,
>  		.height = 720,
> -		.hmax = 6600,
> +		.hmax = 3300,
>  		.link_freq_index = FREQ_INDEX_720P,
>  		.data = imx290_720p_settings,
>  		.data_size = ARRAY_SIZE(imx290_720p_settings),
> @@ -518,21 +518,10 @@ static int imx290_set_register_array(struct imx290 *imx290,
>  static int imx290_set_data_lanes(struct imx290 *imx290)
>  {
>  	int ret = 0;
> -	u32 frsel;
> -
> -	switch (imx290->nlanes) {
> -	case 2:
> -	default:
> -		frsel = 0x02;
> -		break;
> -	case 4:
> -		frsel = 0x01;
> -		break;
> -	}
>  
>  	imx290_write(imx290, IMX290_PHY_LANE_NUM, imx290->nlanes - 1, &ret);
>  	imx290_write(imx290, IMX290_CSI_LANE_MODE, imx290->nlanes - 1, &ret);
> -	imx290_write(imx290, IMX290_FR_FDG_SEL, frsel, &ret);
> +	imx290_write(imx290, IMX290_FR_FDG_SEL, 0x01, &ret);
>  
>  	return ret;
>  }

-- 
Regards,

Laurent Pinchart
