Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45DFA5F6BD6
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 18:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbiJFQdz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 12:33:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbiJFQdy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 12:33:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D901B5153
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 09:33:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A69564DD;
        Thu,  6 Oct 2022 18:33:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665074030;
        bh=bsdX2Pr0CxSnTJVpaCzxgg7Erf2WjC+nqi/pCQHSJ7Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n3Lf5j2ouA8GH2a4TWk/2SRu4xywud3lmcRKReAQDEvVoKaXQYd6cC0D6bLNXYog1
         iGBry1D1o4sB/Cl+6f3T0vOQT/i+lGTInmlTZqfr0wlwlpuktwxWEAIM+B6lgwZjlK
         pEwRu8GuaF27BF1GTUbDXdQ8XTUBPLLYbe8fecKM=
Date:   Thu, 6 Oct 2022 19:33:45 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Subject: Re: [PATCH 01/10] media: ar0521: Implement enum_frame_sizes
Message-ID: <Yz8DaZvFAOMKPlCQ@pendragon.ideasonboard.com>
References: <20221005190613.394277-1-jacopo@jmondi.org>
 <20221005190613.394277-2-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221005190613.394277-2-jacopo@jmondi.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Wed, Oct 05, 2022 at 09:06:04PM +0200, Jacopo Mondi wrote:
> Implement the enum_frame_size pad operation.
> 
> The sensor supports a continuous size range of resolutions.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ar0521.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> index c7bdfc69b9be..89f3c01f18ce 100644
> --- a/drivers/media/i2c/ar0521.c
> +++ b/drivers/media/i2c/ar0521.c
> @@ -798,6 +798,24 @@ static int ar0521_enum_mbus_code(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int ar0521_enum_frame_size(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *sd_state,
> +				  struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	if (fse->index)
> +		return -EINVAL;
> +
> +	if (fse->code != MEDIA_BUS_FMT_SGRBG8_1X8)
> +		return -EINVAL;
> +
> +	fse->min_width = AR0521_WIDTH_MIN;
> +	fse->max_width = AR0521_WIDTH_MAX;
> +	fse->min_height = AR0521_HEIGHT_MIN;
> +	fse->max_height = AR0521_HEIGHT_MAX;

This matches the driver implementation of .set_fmt(), but that's because
the driver is *really* wrong :-( It uses the format to configure the
crop rectangle, which is not right. This needs to be fixed.

> +
> +	return 0;
> +}
> +
>  static int ar0521_pre_streamon(struct v4l2_subdev *sd, u32 flags)
>  {
>  	struct ar0521_dev *sensor = to_ar0521_dev(sd);
> @@ -864,6 +882,7 @@ static const struct v4l2_subdev_video_ops ar0521_video_ops = {
>  
>  static const struct v4l2_subdev_pad_ops ar0521_pad_ops = {
>  	.enum_mbus_code = ar0521_enum_mbus_code,
> +	.enum_frame_size = ar0521_enum_frame_size,
>  	.get_fmt = ar0521_get_fmt,
>  	.set_fmt = ar0521_set_fmt,
>  };

-- 
Regards,

Laurent Pinchart
