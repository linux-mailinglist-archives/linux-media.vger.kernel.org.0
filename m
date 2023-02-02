Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D22B76883A5
	for <lists+linux-media@lfdr.de>; Thu,  2 Feb 2023 17:05:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232678AbjBBQFK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Feb 2023 11:05:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232411AbjBBQFJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Feb 2023 11:05:09 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8FDC6B036
        for <linux-media@vger.kernel.org>; Thu,  2 Feb 2023 08:04:58 -0800 (PST)
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43C09505;
        Thu,  2 Feb 2023 17:04:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675353897;
        bh=ISnBd/1u2eY+5cNZ1amphe9yOtA9P1HRToKqdJHIIsE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L2CV9v+jvONi26WHna2sRR1D2tiIjczDavbNMTKy5AtuROO7/V7yMgIEgRJ8hpJps
         a++NAzylgmoYRDknS3nss3zXW/+MIQct6PPESprQOJcB1/QsdpBCTOfVavX0g32K40
         7KYxg+vhUPVQmdACqKXnJzre/GtdDhIrY4+u7UEw=
Date:   Thu, 2 Feb 2023 18:04:55 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 09/11] media: i2c: imx290: Remove duplicated write to
 IMX290_CTRL_07
Message-ID: <Y9vfJ+wXwa02CEoc@pendragon.ideasonboard.com>
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
 <20230131192016.3476937-10-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230131192016.3476937-10-dave.stevenson@raspberrypi.com>
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

On Tue, Jan 31, 2023 at 07:20:14PM +0000, Dave Stevenson wrote:
> IMX290_CTRL_07 was written from both imx290_global_init_settings
> and imx290_1080p_settings and imx290_720p_settings.
> 
> Remove it from imx290_global_init_settings as the setting varies
> based on the mode.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx290.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 3413d83369ba..5202ef3cc3e6 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -219,7 +219,6 @@ static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
>   */
>  
>  static const struct imx290_regval imx290_global_init_settings[] = {
> -	{ IMX290_CTRL_07, IMX290_WINMODE_1080P },
>  	{ IMX290_EXTCK_FREQ, 0x2520 },
>  	{ IMX290_WINWV_OB, 12 },
>  	{ IMX290_WINPH, 0 },

-- 
Regards,

Laurent Pinchart
