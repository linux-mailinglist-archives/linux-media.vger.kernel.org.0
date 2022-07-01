Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F81A5636FC
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 17:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230413AbiGAPej (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Jul 2022 11:34:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbiGAPei (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Jul 2022 11:34:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8D1839680
        for <linux-media@vger.kernel.org>; Fri,  1 Jul 2022 08:34:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D6F8D25C;
        Fri,  1 Jul 2022 17:34:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656689676;
        bh=mPIqF6gu9mPasjaWE//4N4ta6bfRNDjy/PYjAQBh/Cc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jkqMYNHJRZTgsJlJ7BhkjzlGXC8Io/1FueW87GhcmR4kWpWQ7n7ZUFL9AAMh8jkq1
         KrvO79YCy2u9NKgjyr/PxRb5rhzithjfck4peWMqy3WxzhfcbWYJnALivebyxJesxU
         7RMadIqYFj+XH0iRiMHg0xjzWLju6apsrlNIywuM=
Date:   Fri, 1 Jul 2022 18:34:14 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Marek Vasut <marex@denx.de>, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH 2/2] media: stm32: dcmi: Fix subdev op call with
 uninitialized state
Message-ID: <Yr8T9vdBKxP+HHfn@pendragon.ideasonboard.com>
References: <20220701131559.66715-1-tomi.valkeinen@ideasonboard.com>
 <20220701131559.66715-2-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220701131559.66715-2-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Fri, Jul 01, 2022 at 04:15:59PM +0300, Tomi Valkeinen wrote:
> stm32-dcmi calls its source subdev with v4l2_subdev_call() using a
> v4l2_subdev_state constructed on stack. This means that init_cfg is
> never called for that state, and a source subdev that depends on the
> init_cfg call may break.
> 
> A new macro has been added for this particular purpose, which properly
> initializes the state, so let's use v4l2_subdev_call_state_try() here.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/st/stm32/stm32-dcmi.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
> index 09a743cd7004..eb831b5932e7 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
> @@ -999,10 +999,6 @@ static int dcmi_try_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f,
>  	const struct dcmi_format *sd_fmt;
>  	struct dcmi_framesize sd_fsize;
>  	struct v4l2_pix_format *pix = &f->fmt.pix;
> -	struct v4l2_subdev_pad_config pad_cfg;
> -	struct v4l2_subdev_state pad_state = {
> -		.pads = &pad_cfg
> -		};
>  	struct v4l2_subdev_format format = {
>  		.which = V4L2_SUBDEV_FORMAT_TRY,
>  	};
> @@ -1037,8 +1033,7 @@ static int dcmi_try_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f,
>  	}
>  
>  	v4l2_fill_mbus_format(&format.format, pix, sd_fmt->mbus_code);
> -	ret = v4l2_subdev_call(dcmi->source, pad, set_fmt,
> -			       &pad_state, &format);
> +	ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -1187,10 +1182,6 @@ static int dcmi_set_sensor_format(struct stm32_dcmi *dcmi,
>  	struct v4l2_subdev_format format = {
>  		.which = V4L2_SUBDEV_FORMAT_TRY,
>  	};
> -	struct v4l2_subdev_pad_config pad_cfg;
> -	struct v4l2_subdev_state pad_state = {
> -		.pads = &pad_cfg
> -		};
>  	int ret;
>  
>  	sd_fmt = find_format_by_fourcc(dcmi, pix->pixelformat);
> @@ -1203,8 +1194,7 @@ static int dcmi_set_sensor_format(struct stm32_dcmi *dcmi,
>  	}
>  
>  	v4l2_fill_mbus_format(&format.format, pix, sd_fmt->mbus_code);
> -	ret = v4l2_subdev_call(dcmi->source, pad, set_fmt,
> -			       &pad_state, &format);
> +	ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
>  	if (ret < 0)
>  		return ret;
>  

-- 
Regards,

Laurent Pinchart
