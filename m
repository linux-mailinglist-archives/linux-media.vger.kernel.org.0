Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5715B78AFEF
	for <lists+linux-media@lfdr.de>; Mon, 28 Aug 2023 14:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232405AbjH1MTF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Aug 2023 08:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232380AbjH1MSe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Aug 2023 08:18:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1C3DEA
        for <linux-media@vger.kernel.org>; Mon, 28 Aug 2023 05:18:31 -0700 (PDT)
Received: from ideasonboard.com (mob-5-91-19-240.net.vodafone.it [5.91.19.240])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF618814;
        Mon, 28 Aug 2023 14:17:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693225029;
        bh=dT9jU3LSgYXM9c4AYR7jOFSIgCpD5aSF2ZbTv5piveM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mhFV/PIfHA0Z2weMQKXQc36JGEk+bIlzs8TKQz4fBzuTA1OrDLkZU3x78ZSb2QXEK
         l6knpVflJRBoI6q6gRaIfy1cH1U0iSv2J7Yh9SxrCiJpSZqlNFU5y/NIJO1A90jmL1
         t+mgLh2az5rLpmKYlDf/uyeqjbSwclrYrjLRZUwQ=
Date:   Mon, 28 Aug 2023 14:18:26 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v1 1/2] media: i2c: imx219: Fix a typo referring to a
 wrong variable
Message-ID: <mhztj2oip3qp6pzyu4uhfs5vnahenwmwnm7ctbwmh56qyd5hlp@kc7puplvt6qa>
References: <20230814193435.24158-1-laurent.pinchart@ideasonboard.com>
 <20230814193435.24158-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230814193435.24158-2-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Mon, Aug 14, 2023 at 10:34:34PM +0300, Laurent Pinchart wrote:
> The imx219_init_cfg() function has stopped operating on the try format
> since commit 7e700847b1fe ("media: i2c: imx219: Switch from open to
> init_cfg"), but a comment in the function wasn't updated. Fix it.
>
> While at it, improve spelling in a second comment in the function.
>
> Fixes: 7e700847b1fe ("media: i2c: imx219: Switch from open to init_cfg")
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>


> ---
>  drivers/media/i2c/imx219.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index a1136fdfbed2..6f88e002c8d8 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -691,12 +691,12 @@ static int imx219_init_cfg(struct v4l2_subdev *sd,
>  	struct v4l2_mbus_framefmt *format;
>  	struct v4l2_rect *crop;
>
> -	/* Initialize try_fmt */
> +	/* Initialize the format. */
>  	format = v4l2_subdev_get_pad_format(sd, state, 0);
>  	imx219_update_pad_format(imx219, &supported_modes[0], format,
>  				 MEDIA_BUS_FMT_SRGGB10_1X10);
>
> -	/* Initialize crop rectangle. */
> +	/* Initialize the crop rectangle. */
>  	crop = v4l2_subdev_get_pad_crop(sd, state, 0);
>  	crop->top = IMX219_PIXEL_ARRAY_TOP;
>  	crop->left = IMX219_PIXEL_ARRAY_LEFT;
> --
> Regards,
>
> Laurent Pinchart
>
