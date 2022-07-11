Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2369C570A40
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 21:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbiGKTBf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 15:01:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbiGKTBe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 15:01:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D622627169
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 12:01:33 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B49DF326;
        Mon, 11 Jul 2022 21:01:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657566091;
        bh=r9cvpt0RoZS5VNGeYD9aoz0Yb+hVIkBIf62pX0tcbPg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TZjUrnHq/TKryE7o9ZTBv8ycHbHvjHs0XkK54GH96uk1V2NSu/7l09yZnAhAHqAiH
         gYSF+bq2VLkfuz7Ya0OGAbVUS642+Vc9EpiownFUsOvrWVKHHI8zdlNRYxZl5nILLp
         3THEigMhWgBSQF7asPEHCRoF7JLiYqqjxehpl8OU=
Date:   Mon, 11 Jul 2022 22:01:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: Re: [PATCH v2] media: mt9p031: Implement crop bounds get selection
Message-ID: <Ysxzb10TydUEUbVa@pendragon.ideasonboard.com>
References: <20220619003158.720050-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220619003158.720050-1-marex@denx.de>
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

On Sun, Jun 19, 2022 at 02:31:58AM +0200, Marek Vasut wrote:
> Implement V4L2_SEL_TGT_CROP_BOUNDS query in get_selection subdev op
> for this sensor. This is required e.g. to bind it to STM32MP15x DCMI.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Stefan Riedmueller <s.riedmueller@phytec.de>
> ---
> V2: Use min/max sizes for crop bounds
> ---
>  drivers/media/i2c/mt9p031.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index cbce8b88dbcf5..69a3165b8fb91 100644
> --- a/drivers/media/i2c/mt9p031.c
> +++ b/drivers/media/i2c/mt9p031.c
> @@ -623,12 +623,20 @@ static int mt9p031_get_selection(struct v4l2_subdev *subdev,
>  {
>  	struct mt9p031 *mt9p031 = to_mt9p031(subdev);
>  
> -	if (sel->target != V4L2_SEL_TGT_CROP)
> +	switch (sel->target) {
> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> +		sel->r.left = MT9P031_COLUMN_START_MIN;
> +		sel->r.top = MT9P031_ROW_START_MIN;
> +		sel->r.width = MT9P031_WINDOW_WIDTH_MAX;
> +		sel->r.height = MT9P031_WINDOW_HEIGHT_MAX;
> +		return 0;

A blank line would be nice.

> +	case V4L2_SEL_TGT_CROP:
> +		sel->r = *__mt9p031_get_pad_crop(mt9p031, sd_state,
> +						 sel->pad, sel->which);
> +		return 0;

Ditto.

This can be changed when applying the patch.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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
