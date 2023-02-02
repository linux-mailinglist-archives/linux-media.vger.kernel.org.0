Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11289687250
	for <lists+linux-media@lfdr.de>; Thu,  2 Feb 2023 01:29:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbjBBA3U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 19:29:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjBBA3T (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 19:29:19 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E703070D56
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 16:29:17 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D40C0505;
        Thu,  2 Feb 2023 01:29:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675297756;
        bh=EldTkTcae7uU4LqkOQ6CaAce0BJOl20WlxMR4G/ExOc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gaxWa++EKDQ+XvUFRCPbw9+f84biV7nVuRiiM0BxnvPpwuR3Pwry+j4f3Bn9wVDRD
         fc2qTKIw5+0t/9fQ7u5j7DPuJcd9I621Chzd1fB7Scm94Tnb6d1un8vGR2e+HEAvkR
         TkV5fUcVOFeI3fZsesmYHo+eBBlWB04eHzNUi5lM=
Date:   Thu, 2 Feb 2023 02:29:13 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 02/11] media: i2c: imx290: Set the colorspace fields in
 the format
Message-ID: <Y9sD2cxTDIjA0jrm@pendragon.ideasonboard.com>
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
 <20230131192016.3476937-3-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230131192016.3476937-3-dave.stevenson@raspberrypi.com>
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

On Tue, Jan 31, 2023 at 07:20:07PM +0000, Dave Stevenson wrote:
> The colorspace fields were left untouched in imx290_set_fmt
> which lead to a v4l2-compliance failure.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx290.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 88c7201510a2..bf96fd914303 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -897,6 +897,14 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
>  		fmt->format.code = imx290_formats[0].code[imx290->mono];
>  
>  	fmt->format.field = V4L2_FIELD_NONE;
> +	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
> +	fmt->format.ycbcr_enc =
> +		V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->format.colorspace);
> +	fmt->format.quantization =
> +		V4L2_MAP_QUANTIZATION_DEFAULT(true, fmt->format.colorspace,
> +					      fmt->format.ycbcr_enc);
> +	fmt->format.xfer_func =
> +		V4L2_MAP_XFER_FUNC_DEFAULT(fmt->format.colorspace);

Given that all of these are hardcoded, I think it would be more readable
to write

	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
	fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_601;
	fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;

>  	format = v4l2_subdev_get_pad_format(sd, sd_state, 0);

-- 
Regards,

Laurent Pinchart
