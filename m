Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26A5E4AC80D
	for <lists+linux-media@lfdr.de>; Mon,  7 Feb 2022 18:59:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233637AbiBGR7G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Feb 2022 12:59:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345987AbiBGRxu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Feb 2022 12:53:50 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 314BDC0401D9
        for <linux-media@vger.kernel.org>; Mon,  7 Feb 2022 09:53:50 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AEC8E340;
        Mon,  7 Feb 2022 18:53:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644256427;
        bh=5/SSeqgijoOlECSYunA19Xeg3Y+j9wSY5ClCHXzwn8c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C8m5ZvkQbsFch91AwYq1VCijnFomhVLzlMex+7Me+Rybfu3F7dfQRtSMeyHErtVY8
         KwE0SFQDgVxcblYyZftvP5ZKhhnwOZRXADyMyHQNoYDuYux63Ejjgz5vA1uxjcdR5e
         yc3y0KEF5ncfOYNLumSBuwqVx1L7qUfUP6qByAyE=
Date:   Mon, 7 Feb 2022 19:53:45 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     slongerbeam@gmail.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        eugen.hristev@microchip.com, jbrunet@baylibre.com,
        mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 14/21] media: ov5640: Implement get_selection
Message-ID: <YgFcqb3Cgl1BLTzP@pendragon.ideasonboard.com>
References: <20220131143245.128089-1-jacopo@jmondi.org>
 <20220131144444.129036-1-jacopo@jmondi.org>
 <20220131144444.129036-3-jacopo@jmondi.org>
 <YfsF247w8mPNH5e4@pendragon.ideasonboard.com>
 <20220207154735.sqbqe4gpovvpybod@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220207154735.sqbqe4gpovvpybod@uno.localdomain>
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Feb 07, 2022 at 04:47:35PM +0100, Jacopo Mondi wrote:
> On Thu, Feb 03, 2022 at 12:29:47AM +0200, Laurent Pinchart wrote:
> > On Mon, Jan 31, 2022 at 03:44:42PM +0100, Jacopo Mondi wrote:
> > > Implement the get_selection pad operation for the OV5640 sensor driver.
> > >
> > > The supported targets report the sensor's native size, the active pixel
> > > array size and the analog crop rectangle from which the image is
> > > produced.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > >  drivers/media/i2c/ov5640.c | 61 ++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 61 insertions(+)
> > >
> > > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > > index 762bdca83aec..ae22300b9655 100644
> > > --- a/drivers/media/i2c/ov5640.c
> > > +++ b/drivers/media/i2c/ov5640.c
> > > @@ -35,6 +35,13 @@
> > >  #define OV5640_MIN_VBLANK	24
> > >  #define OV5640_MAX_VTS		1968
> > >
> > > +#define OV5640_NATIVE_WIDTH		2624
> > > +#define OV5640_NATIVE_HEIGHT		1964
> > > +#define OV5640_PIXEL_ARRAY_TOP		8
> > > +#define OV5640_PIXEL_ARRAY_LEFT		16
> > > +#define OV5640_PIXEL_ARRAY_WIDTH	2592
> > > +#define OV5640_PIXEL_ARRAY_HEIGHT	1944
> >
> > According to the datasheet, the sensor has 8 black lines, 6 dummy lines,
> > 1944 active lines and 6 dummy lines. Horizontally, it has 16 dummy
> > columns, 2592 active columns, and 16 dummy columns. If "pixel array" is
> > meant to refer to the active area (I dislike the "active" name here, as
> > the dummy lines and columns are typically "active" too, but that's a
> > digression), then top should be 14.
> 
> Corret, I have only considered the 8 black lines, but dummy too are
> 'active but not valid' ones.
> 
> I'll change to 14
> 
> > > +
> > >  #define OV5640_DEFAULT_SLAVE_ID 0x3c
> > >
> > >  #define OV5640_REG_SYS_RESET02		0x3002
> > > @@ -2667,6 +2674,52 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
> > >  	return ret;
> > >  }
> > >
> > > +static int ov5640_get_selection(struct v4l2_subdev *sd,
> > > +				struct v4l2_subdev_state *sd_state,
> > > +				struct v4l2_subdev_selection *sel)
> > > +{
> > > +	struct ov5640_dev *sensor = to_ov5640_dev(sd);
> > > +	const struct ov5640_mode_info *mode = sensor->current_mode;
> > > +	const struct v4l2_rect *analog_crop = &mode->analog_crop;
> > > +	const struct v4l2_rect *crop = &mode->crop;
> > > +
> > > +	switch (sel->target) {
> > > +	case V4L2_SEL_TGT_CROP: {
> > > +		mutex_lock(&sensor->lock);
> > > +
> > > +		sel->r.top = analog_crop->top + OV5640_PIXEL_ARRAY_TOP;
> > > +		sel->r.left = analog_crop->left + OV5640_PIXEL_ARRAY_LEFT;
> > > +		sel->r.width = analog_crop->width
> > > +			     - analog_crop->left - crop->left;
> >
> > Why do you subtract the left coordinates here ?
> 
> As the analog_crop->width is defined from the full pixel array size
> (black + dummy + active). The TGT_CROP rectangle width and height
> should instead report the dimensions of the portion of the pixel array
> size which is processed to obtain the final image, and thus the
> vertical and horizontal offsets should be subtracted
> 
> 
>     full                            analog_crop.width
>      |                              (0x3804, 0x3805) = 2624
>      |                                   |
>      V                                   V
>   -> +-----------------------------------+
>      |                                   |
>      x-----------------------------------|
>      |  x----  TGT_CROP width  ----------|
>      |  |                                |
>      |  |                                |
>      |  |                                |
>      |  |                                |
>      |  |                                |
>      |  |                                |
>      |  |                                |
>      +--|--------------------------------+
>      |  |
>      |  |-> crop.left = 16
>      |
>      |-> analog_crop.left = 0

With analog_crop.left == 0 that's fine, but if it had a different value,
shouldn't the above use

		sel->r.width = analog_crop->width - crop->left;

?

> > > +		sel->r.height = analog_crop->height
> > > +			      - analog_crop->top - crop->top;
> > > +
> > > +		mutex_unlock(&sensor->lock);
> > > +
> > > +		return 0;
> > > +	}
> > > +
> > > +	case V4L2_SEL_TGT_NATIVE_SIZE:
> > > +		sel->r.top = 0;
> > > +		sel->r.left = 0;
> > > +		sel->r.width = OV5640_NATIVE_WIDTH;
> > > +		sel->r.height = OV5640_NATIVE_HEIGHT;
> > > +
> > > +		return 0;
> > > +
> > > +	case V4L2_SEL_TGT_CROP_DEFAULT:
> > > +	case V4L2_SEL_TGT_CROP_BOUNDS:
> > > +		sel->r.top = OV5640_PIXEL_ARRAY_TOP;
> > > +		sel->r.left = OV5640_PIXEL_ARRAY_LEFT;
> > > +		sel->r.width = OV5640_PIXEL_ARRAY_WIDTH;
> > > +		sel->r.height = OV5640_PIXEL_ARRAY_HEIGHT;
> >
> > In libcamera we use V4L2_SEL_TGT_CROP_BOUNDS to set PixelArraySize,
> > ignoring the left and top coordinates, and V4L2_SEL_TGT_CROP_DEFAULT to
> > to set the PixelArrayActiveAreas property relative to PixelArraySize.
> > This means that non-zero values for the left and top coordinates of
> > V4L2_SEL_TGT_CROP_BOUNDS will cause issues. Is this an issue in
> > libcamera, or should V4L2_SEL_TGT_CROP_BOUNDS be changed here ?
> >
> > The related question is, can we read the optical black lines and the
> > dummy lines and columns ?
> >
> > > +
> > > +		return 0;
> > > +	}
> > > +
> > > +	return -EINVAL;
> > > +}
> > > +
> > >  static int ov5640_set_framefmt(struct ov5640_dev *sensor,
> > >  			       struct v4l2_mbus_framefmt *format)
> > >  {
> > > @@ -3369,6 +3422,7 @@ static const struct v4l2_subdev_pad_ops ov5640_pad_ops = {
> > >  	.enum_mbus_code = ov5640_enum_mbus_code,
> > >  	.get_fmt = ov5640_get_fmt,
> > >  	.set_fmt = ov5640_set_fmt,
> > > +	.get_selection = ov5640_get_selection,
> > >  	.enum_frame_size = ov5640_enum_frame_size,
> > >  	.enum_frame_interval = ov5640_enum_frame_interval,
> > >  };
> > > @@ -3383,9 +3437,16 @@ static int ov5640_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> > >  {
> > >  	struct v4l2_mbus_framefmt *try_fmt =
> > >  		v4l2_subdev_get_try_format(sd, fh->state, 0);
> > > +	struct v4l2_rect *try_crop =
> > > +		v4l2_subdev_get_try_crop(sd, fh->state, 0);
> > >
> > >  	*try_fmt = ov5640_default_fmt;
> > >
> > > +	try_crop->left = OV5640_PIXEL_ARRAY_LEFT;
> > > +	try_crop->top = OV5640_PIXEL_ARRAY_TOP;
> > > +	try_crop->width = OV5640_PIXEL_ARRAY_WIDTH;
> > > +	try_crop->height = OV5640_PIXEL_ARRAY_HEIGHT;
> > > +
> > >  	return 0;
> > >  }
> > >

-- 
Regards,

Laurent Pinchart
