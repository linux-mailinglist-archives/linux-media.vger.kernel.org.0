Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AECA26315B9
	for <lists+linux-media@lfdr.de>; Sun, 20 Nov 2022 19:52:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbiKTSw0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Nov 2022 13:52:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbiKTSwZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Nov 2022 13:52:25 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA0E4DED0
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 10:52:24 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A258030A;
        Sun, 20 Nov 2022 19:52:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1668970342;
        bh=r1UE/leIRf9bUUECrpJEecq9LOrFyefnoUxbvgFjlxU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D5pbbhPCIiSJV70w0oEztvKdIyswMmrL3pw7Z+qnIUxiKf7wUmHD6ZI8pRr2heX92
         sFA9OIYtYqt/b/3LrtCXIVDuSMMSzVT1eZpwHML8XQuB6P7j/aLIgERAmJ+gfaonCt
         Tt/7meLqDHa3qiBRSy5QqTHdyjRPAJFukcZassTI=
Date:   Sun, 20 Nov 2022 20:52:07 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: Re: [PATCH] media: mt9p031: Drop bogus v4l2_subdev_get_try_crop()
 call from mt9p031_init_cfg()
Message-ID: <Y3p3V2aqQoMrWFTV@pendragon.ideasonboard.com>
References: <20221120141304.80832-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221120141304.80832-1-marex@denx.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek,

Thank you for the patch.

On Sun, Nov 20, 2022 at 03:13:04PM +0100, Marek Vasut wrote:
> The mt9p031_init_cfg() already calls __mt9p031_get_pad_crop(), which
> correctly calls v4l2_subdev_get_try_crop() on V4L2_SUBDEV_FORMAT_TRY
> or returns &mt9p031->crop on V4L2_SUBDEV_FORMAT_ACTIVE. No need to
> call v4l2_subdev_get_try_crop() in mt9p031_init_cfg() again in case
> of both V4L2_SUBDEV_FORMAT_TRY and V4L2_SUBDEV_FORMAT_ACTIVE.
> 
> This also fixes a splat generated by this call since commit
> 2ba3e38517f5a ("media: v4l: subdev: Fail graciously when getting try data for NULL state")
> because v4l2_subdev_get_try_crop() is called with sd_state = NULL
> in mt9p031_init_cfg().
> 
> Fixes: 69681cd041648 ("media: mt9p031: Move open subdev op init code into init_cfg")
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Stefan Riedmueller <s.riedmueller@phytec.de>
> ---
>  drivers/media/i2c/mt9p031.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index 5f5caafe56887..4ffc2f6e7db47 100644
> --- a/drivers/media/i2c/mt9p031.c
> +++ b/drivers/media/i2c/mt9p031.c
> @@ -708,7 +708,6 @@ static int mt9p031_init_cfg(struct v4l2_subdev *subdev,
>  					     V4L2_SUBDEV_FORMAT_TRY;
>  
>  	crop = __mt9p031_get_pad_crop(mt9p031, sd_state, 0, which);
> -	v4l2_subdev_get_try_crop(subdev, sd_state, 0);
>  	crop->left = MT9P031_COLUMN_START_DEF;
>  	crop->top = MT9P031_ROW_START_DEF;
>  	crop->width = MT9P031_WINDOW_WIDTH_DEF;

-- 
Regards,

Laurent Pinchart
