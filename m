Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80C61768EE3
	for <lists+linux-media@lfdr.de>; Mon, 31 Jul 2023 09:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbjGaHdq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Jul 2023 03:33:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231567AbjGaHdZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Jul 2023 03:33:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96338210C
        for <linux-media@vger.kernel.org>; Mon, 31 Jul 2023 00:32:14 -0700 (PDT)
Received: from ideasonboard.com (mob-5-90-53-43.net.vodafone.it [5.90.53.43])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F32F35A4;
        Mon, 31 Jul 2023 09:31:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690788669;
        bh=YYLNmjxGAZTVnZ31Q7RK0Iq/xU+LOMQc5Q0wQ3JZkm8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jPTDMh3/3O8NMnXcsrUp7gqeJTr8fikqjZ74yPzb5w57BQoV6r9Hmg/THQTGziqmq
         yheTcABYmtCOhoEU8lLAxVzp90Xwopw7NxpERTjZNJixZ0kvSx6HmnMj6kvsRjCs7y
         jOcVqLTog4f3Cq8ZSJM3DHs4HLYrho+494wfIgW4=
Date:   Mon, 31 Jul 2023 09:32:08 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Subject: Re: [PATCH v2 4/7] media: i2c: imx219: Fix colorspace info
Message-ID: <f3hrtvxi5z4zyuislnks5zidnhcunqyewrubuvexwstghxh6om@vjw6ofij3dxv>
References: <20230710155203.92366-1-jacopo.mondi@ideasonboard.com>
 <20230710155203.92366-5-jacopo.mondi@ideasonboard.com>
 <20230729171300.GC5094@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230729171300.GC5094@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lauren, Umang

On Sat, Jul 29, 2023 at 08:13:00PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
>
> On Mon, Jul 10, 2023 at 05:52:00PM +0200, Jacopo Mondi wrote:
> > The IMX219 is a RAW sensor. Fix the colorspace configuration by
> > using V4L2_COLORSPACE_RAW and adjust the quantization and transfer
> > function values. Drop ycbcr_enc as it doesn't apply to RAW sensors.
>
> So this addresses part of my comments for 3/7, nice :-)
>
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx219.c | 26 +++++++++-----------------
> >  1 file changed, 9 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index cd43a897391c..6963e24e1bc2 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -597,15 +597,12 @@ static void imx219_set_default_format(struct imx219 *imx219)
> >
> >  	fmt = &imx219->fmt;
> >  	fmt->code = MEDIA_BUS_FMT_SRGGB10_1X10;
> > -	fmt->colorspace = V4L2_COLORSPACE_SRGB;
> > -	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
> > -	fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
> > -							  fmt->colorspace,
> > -							  fmt->ycbcr_enc);
> > -	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
> > +	fmt->colorspace = V4L2_COLORSPACE_RAW;
> > +	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> >  	fmt->width = supported_modes[0].width;
> >  	fmt->height = supported_modes[0].height;
> >  	fmt->field = V4L2_FIELD_NONE;
> > +	fmt->xfer_func = V4L2_XFER_FUNC_NONE;
>
> Any reason to not group xfer_func with colorspace and quantization ?
>
> >  }
> >
> >  static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> > @@ -714,12 +711,10 @@ static int imx219_init_cfg(struct v4l2_subdev *sd,
> >  	format->code = imx219_get_format_code(imx219,
> >  					      MEDIA_BUS_FMT_SRGGB10_1X10);
> >  	format->field = V4L2_FIELD_NONE;
> > -	format->colorspace = V4L2_COLORSPACE_SRGB;
> > +	format->colorspace = V4L2_COLORSPACE_RAW;
> >  	format->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(format->colorspace);
>
> You're keeping ycbcr_enc here while you've dropped it in the two other
> locations. Was that on purpose ?

Umang had the same comment, and I clearly forgot to remove this one

>
> While the encoding doesn't apply to raw formats, I think it should still
> be set explicitly, or it will end up having a random value.
>

Should I use V4L2_YCBCR_ENC_DEFAULT even if for RAW sensors it doesn't
make much sense ?

Thanks
   j

> > -	format->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
> > -							     format->colorspace,
> > -							     format->ycbcr_enc);
> > -	format->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(format->colorspace);
> > +	format->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> > +	format->xfer_func = V4L2_XFER_FUNC_NONE;
> >
> >  	/* Initialize crop rectangle. */
> >  	crop = v4l2_subdev_get_pad_crop(sd, state, 0);
> > @@ -775,12 +770,9 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
> >
> >  static void imx219_reset_colorspace(struct v4l2_mbus_framefmt *fmt)
> >  {
> > -	fmt->colorspace = V4L2_COLORSPACE_SRGB;
> > -	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
> > -	fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
> > -							  fmt->colorspace,
> > -							  fmt->ycbcr_enc);
> > -	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
> > +	fmt->colorspace = V4L2_COLORSPACE_RAW;
> > +	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> > +	fmt->xfer_func = V4L2_XFER_FUNC_NONE;
> >  }
> >
> >  static void imx219_update_pad_format(struct imx219 *imx219,
>
> --
> Regards,
>
> Laurent Pinchart
