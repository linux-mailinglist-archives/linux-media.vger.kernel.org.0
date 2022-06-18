Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC4255076C
	for <lists+linux-media@lfdr.de>; Sun, 19 Jun 2022 01:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233969AbiFRXPf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jun 2022 19:15:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229837AbiFRXPe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jun 2022 19:15:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E339CDFE8
        for <linux-media@vger.kernel.org>; Sat, 18 Jun 2022 16:15:33 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3E617993;
        Sun, 19 Jun 2022 01:15:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655594132;
        bh=kgzLPXKQ9OKPH5y0oh+P1NBO9Z63HJpRybLXd8n1+x0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OnXXiGBiJJPWTHF2Fw8/77kcgOh+bf0gIcCtNvBtztW4vZvpgVwfANRUTVDr/+Inu
         YNrjOd4NryNKMCRI4S1ouTc+uWtEdWWBKPYgSSowWEyKnxpwFP35QhXFvCbePc2K8b
         wDjQa8C1zo3xubHEBM7TodZEDswAMprNYVW3S6g0=
Date:   Sun, 19 Jun 2022 02:15:18 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: Re: [PATCH] media: mt9p031: Implement crop bounds get selection
Message-ID: <Yq5chmhukcvv2rGd@pendragon.ideasonboard.com>
References: <20220618222108.478082-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220618222108.478082-1-marex@denx.de>
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek,

Thank you for the patch.

On Sun, Jun 19, 2022 at 12:21:08AM +0200, Marek Vasut wrote:
> Implement V4L2_SEL_TGT_CROP_BOUNDS query in get_selection subdev op
> for this sensor. This is required e.g. to bind it to STM32MP15x DCMI.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Stefan Riedmueller <s.riedmueller@phytec.de>
> ---
>  drivers/media/i2c/mt9p031.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index cbce8b88dbcf5..e73e814c60207 100644
> --- a/drivers/media/i2c/mt9p031.c
> +++ b/drivers/media/i2c/mt9p031.c
> @@ -623,12 +623,20 @@ static int mt9p031_get_selection(struct v4l2_subdev *subdev,
>  {
>  	struct mt9p031 *mt9p031 = to_mt9p031(subdev);
>  
> -	if (sel->target != V4L2_SEL_TGT_CROP)
> +	switch (sel->target) {
> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> +		sel->r.left = MT9P031_COLUMN_START_DEF;
> +		sel->r.top = MT9P031_ROW_START_DEF;

Shouldn't this be MT9P031_COLUMN_START_MIN and MT9P031_ROW_START_MIN ?

> +		sel->r.width = MT9P031_WINDOW_WIDTH_DEF;
> +		sel->r.height = MT9P031_WINDOW_HEIGHT_DEF;

And here MT9P031_WINDOW_WIDTH_MAX and MT9P031_WINDOW_HEIGHT_MAX ?

> +		return 0;
> +	case V4L2_SEL_TGT_CROP:
> +		sel->r = *__mt9p031_get_pad_crop(mt9p031, sd_state,
> +						 sel->pad, sel->which);
> +		return 0;
> +	default:
>  		return -EINVAL;
> -
> -	sel->r = *__mt9p031_get_pad_crop(mt9p031, sd_state, sel->pad,
> -					 sel->which);
> -	return 0;
> +	}
>  }
>  
>  static int mt9p031_set_selection(struct v4l2_subdev *subdev,

-- 
Regards,

Laurent Pinchart
