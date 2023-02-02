Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 056F568770F
	for <lists+linux-media@lfdr.de>; Thu,  2 Feb 2023 09:13:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbjBBINw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Feb 2023 03:13:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjBBINv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Feb 2023 03:13:51 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA41079C9D
        for <linux-media@vger.kernel.org>; Thu,  2 Feb 2023 00:13:49 -0800 (PST)
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50D2B505;
        Thu,  2 Feb 2023 09:13:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675325628;
        bh=g8PfGIOpPRSeZrhvN9oZOqenLkYKFsUSp6zGoWjhmVE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l/pLMZVeZT3soGbn30QwesqR8RWIneNrvL56tCpvqyz6UCpHd2/hqgdUYlmEOcWj1
         D4x9JEnc/cKTMoav3yz2RFAMXMfbxX4V1793sT4TkoWkCIkjlMJ2fOccqt2uEM1fHI
         upin1PjG1fbmuGASS9rZo5+8/c+DyMSrcFiahs2Q=
Date:   Thu, 2 Feb 2023 10:13:46 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 04/11] media: i2c: imx290: Fix the pixel rate at
 148.5Mpix/s
Message-ID: <Y9twuoDsTOgwSNlN@pendragon.ideasonboard.com>
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
 <20230131192016.3476937-5-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230131192016.3476937-5-dave.stevenson@raspberrypi.com>
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

On Tue, Jan 31, 2023 at 07:20:09PM +0000, Dave Stevenson wrote:
> The datasheet lists the link frequency changes between
> 1080p and 720p modes. This is correct that the link frequency
> changes as measured on an oscilloscope.
> 
> Link frequency is not necessarily the same as pixel rate.

That's right. The model where

	htotal * vtotal * frame rate = pixel rate

applies to the pixel array. Things can be retimed when transmitted over
CSI-2 (or over anything, really), with pixels transmitted at a higher or
lower rate, with smaller or larger blanking, as long as it matches the
total horizontal line length in time units. I suppose this could in
theory be done vertically too, but that would require too much memory.

I hope we'll never have a need, on the receiver side, to know the active
line length in time units as sent over CSI-2 :-)

> The datasheet gives standard configurations for 1080p and 720p
> modes at a number of frame rates.
> Looking at the 1080p mode it gives:
> HMAX = 0x898 = 2200
> VMAX = 0x465 = 1125
> 2200 * 1125 * 60fps = 148.5MPix/s
> 
> Looking at the 720p mode it gives:
> HMAX = 0xce4 = 3300
> VMAX = 0x2ee = 750
> 3300 * 750 * 60fps = 148.5Mpix/s
> 
> This driver currently scales the pixel rate proportionally to the
> link frequency, however the above shows that this is not the
> correct thing to do, and currently all frame rate and exposure
> calculations give incorrect results.
> 
> Correctly report the pixel rate as being 148.5MPix/s under any
> mode.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx290.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 12946ca9d8d2..bd8729aed43c 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -107,6 +107,7 @@
>  
>  #define IMX290_VMAX_DEFAULT				1125
>  
> +#define IMX290_PIXEL_RATE				148500000

A blank line is missing here. With this fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  /*
>   * The IMX290 pixel array is organized as follows:
>   *
> @@ -190,7 +191,6 @@ struct imx290 {
>  
>  	struct v4l2_ctrl_handler ctrls;
>  	struct v4l2_ctrl *link_freq;
> -	struct v4l2_ctrl *pixel_rate;
>  	struct v4l2_ctrl *hblank;
>  	struct v4l2_ctrl *vblank;
>  };
> @@ -649,15 +649,8 @@ static void imx290_ctrl_update(struct imx290 *imx290,
>  {
>  	unsigned int hblank = mode->hmax - mode->width;
>  	unsigned int vblank = IMX290_VMAX_DEFAULT - mode->height;
> -	s64 link_freq = imx290_link_freqs_ptr(imx290)[mode->link_freq_index];
> -	u64 pixel_rate;
> -
> -	/* pixel rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
> -	pixel_rate = link_freq * 2 * imx290->nlanes;
> -	do_div(pixel_rate, imx290_format_info(format->code)->bpp);
>  
>  	__v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
> -	__v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate, pixel_rate);
>  
>  	__v4l2_ctrl_modify_range(imx290->hblank, hblank, hblank, 1, hblank);
>  	__v4l2_ctrl_modify_range(imx290->vblank, vblank, vblank, 1, vblank);
> @@ -707,9 +700,9 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>  	if (imx290->link_freq)
>  		imx290->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  
> -	imx290->pixel_rate = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> -					       V4L2_CID_PIXEL_RATE,
> -					       1, INT_MAX, 1, 1);
> +	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops, V4L2_CID_PIXEL_RATE,
> +			  IMX290_PIXEL_RATE, IMX290_PIXEL_RATE, 1,
> +			  IMX290_PIXEL_RATE);
>  
>  	v4l2_ctrl_new_std_menu_items(&imx290->ctrls, &imx290_ctrl_ops,
>  				     V4L2_CID_TEST_PATTERN,

-- 
Regards,

Laurent Pinchart
