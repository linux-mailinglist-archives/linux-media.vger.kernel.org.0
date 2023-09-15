Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 462C47A1A3C
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 11:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233179AbjIOJTJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 05:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232435AbjIOJTI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 05:19:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4071098
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 02:19:03 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9A392C6;
        Fri, 15 Sep 2023 11:17:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694769449;
        bh=bkZHuUIE8g6ATJFnF724vZt8p22R77lfl8PkpTbAfaQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kXXMHfjH424EFg0T/SW2Jqb9XFyeP+hQyGddxtypQNQq48/ICTU/C14BLn7o9HvaJ
         /eGpomFCHL/EpGJW6TZ1y79R1jU2wTGJv9gvksfQcHa8XY+KXMpDBVGrsYzjas+Aki
         1Nok2zUukVPXwh6Z5Mj2RQqh5PefYsNzrkdiADdE=
Date:   Fri, 15 Sep 2023 12:19:16 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 3/7] media: ccs: Correctly initialise try compose
 rectangle
Message-ID: <20230915091916.GD14641@pendragon.ideasonboard.com>
References: <20230915072809.37886-1-sakari.ailus@linux.intel.com>
 <20230915072809.37886-4-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230915072809.37886-4-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Fri, Sep 15, 2023 at 10:28:05AM +0300, Sakari Ailus wrote:
> Initialise the try sink compose rectangle size to the sink compose
> rectangle for binner and scaler sub-devices. This was missed due to the
> faulty condition that lead to the compose rectangles to be initialised for
> the pixel array sub-device where it is not relevant.
> 
> Fixes: ccfc97bdb5ae ("[media] smiapp: Add driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

But you should instead use .init_cfg() and the subdev active state API.
That can be done in a separate patch series.

> ---
>  drivers/media/i2c/ccs/ccs-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 49e0d9a09530..6f8fbd82e21c 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -3097,7 +3097,7 @@ static int ccs_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>  		try_fmt->code = sensor->internal_csi_format->code;
>  		try_fmt->field = V4L2_FIELD_NONE;
>  
> -		if (ssd != sensor->pixel_array)
> +		if (ssd == sensor->pixel_array)
>  			continue;
>  
>  		try_comp = v4l2_subdev_get_try_compose(sd, fh->state, i);

-- 
Regards,

Laurent Pinchart
