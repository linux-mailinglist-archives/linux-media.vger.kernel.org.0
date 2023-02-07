Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E57F368CBF5
	for <lists+linux-media@lfdr.de>; Tue,  7 Feb 2023 02:34:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbjBGBeS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Feb 2023 20:34:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbjBGBeR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Feb 2023 20:34:17 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B6932F7AC
        for <linux-media@vger.kernel.org>; Mon,  6 Feb 2023 17:34:16 -0800 (PST)
Received: from pendragon.ideasonboard.com (unknown [109.136.43.56])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9E0A4AF;
        Tue,  7 Feb 2023 02:34:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675733654;
        bh=JOBhm2cLS3dfBmrcwo6+L2zF0PODLAiGMzuwA2Q0whw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d7SLK/rxKRbKQJpdAof6I/p2Kd+c4oDqCiG4XCfR6+RE+m3tjqMBTBs4Tui95Wb4X
         vSJGOVjDFAkV6f57pExZ+EybItUKBws7fwAOO8nJD70XwuKMzpl8UnI8z1+O5Yyk8x
         aGbG7KG1Muay8R2U5CRS2Sjr7ELrvX9hXeLVmLZE=
Date:   Tue, 7 Feb 2023 03:34:12 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v2 02/13] media: i2c: imx290: Set the colorspace fields
 in the format
Message-ID: <Y+GqlKxTj/egEolY@pendragon.ideasonboard.com>
References: <20230203191811.947697-1-dave.stevenson@raspberrypi.com>
 <20230203191811.947697-3-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230203191811.947697-3-dave.stevenson@raspberrypi.com>
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

On Fri, Feb 03, 2023 at 07:18:00PM +0000, Dave Stevenson wrote:
> The colorspace fields were left untouched in imx290_set_fmt
> which lead to a v4l2-compliance failure.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx290.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 22d6194678bc..827c0804792f 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -917,6 +917,10 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
>  		fmt->format.code = imx290_formats[0].code[imx290->model->colour_variant];
>  
>  	fmt->format.field = V4L2_FIELD_NONE;
> +	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
> +	fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_601;
> +	fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
>  
>  	format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
>  

-- 
Regards,

Laurent Pinchart
