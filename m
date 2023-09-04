Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7863D7911DA
	for <lists+linux-media@lfdr.de>; Mon,  4 Sep 2023 09:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238500AbjIDHOn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Sep 2023 03:14:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231152AbjIDHOm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Sep 2023 03:14:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 992B8131
        for <linux-media@vger.kernel.org>; Mon,  4 Sep 2023 00:14:39 -0700 (PDT)
Received: from ideasonboard.com (mob-5-90-56-168.net.vodafone.it [5.90.56.168])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69359124F;
        Mon,  4 Sep 2023 09:13:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693811592;
        bh=6Gsmm0Cmmm/pfuT1jEPDot9qfntnfwDpF6x9bWmXOd8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=loAM4Y2SahcHCdPKdbLr7mYY8QJa++rxTa1fk0iHX+/4CJJ+PM3+eKq2eaW66gklZ
         ZPps/DGGaW0vaI6jVvjiearUBhwE7+VLFlQBhq9MdpJ9tl/JdHj9Aix45culF5H4yb
         usdGjRkTHIUEsbrhQzSV3Ywp24QzlTEtbzxsNmBs=
Date:   Mon, 4 Sep 2023 09:14:35 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 3/3] media: i2c: imx219: Perform a full mode set
 unconditionally
Message-ID: <ogwercvwyazxsbegeudiem7ouz5xkwhb56t433ebss7qyqfcz7@6l72uxr3zjkz>
References: <20230831135747.23148-1-laurent.pinchart@ideasonboard.com>
 <20230831135747.23148-4-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230831135747.23148-4-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Thu, Aug 31, 2023 at 04:57:47PM +0300, Laurent Pinchart wrote:
> The .set_fmt() handler tries to avoid updating the sensor configuration
> when the mode hasn't changed. It does so by comparing both the mode and
> the media bus code. While the latter correctly uses the media bus code
> stored in the subdev state, the former compares the mode being set with
> the active mode, regardless of whether .set_fmt() is called for the
> ACTIVE or TRY format. This can lead to .set_fmt() returning early when
> operating on TRY formats.

Ah yes indeed! My bad as I introduced this in the latest series

>
> This could be fixed by replacing the mode comparison with width and
> height comparisons, using the frame size stored in the subdev state.
> However, the optimization that avoids updates to the sensor
> configuration is not very useful, and is not commonly found in sensor
> drivers. To improve consistency across sensor drivers, it is better, in
> addition to being easier, to simply drop it. Do so.

Agreed this is better dropped !

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

>
> Fixes: e8a5b1df000e ("media: i2c: imx219: Use subdev active state")

Can we make sure this is collected together with my previous series
in v6.6 ?

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx219.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index f19c828b6943..ec53abe2e84e 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -762,9 +762,6 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  	format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
>  	crop = v4l2_subdev_get_pad_crop(sd, sd_state, 0);
>
> -	if (imx219->mode == mode && format->code == fmt->format.code)
> -		return 0;
> -
>  	*format = fmt->format;
>  	*crop = mode->crop;
>
> --
> Regards,
>
> Laurent Pinchart
>
