Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D85B1B90C1
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 15:57:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbgDZN5r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Apr 2020 09:57:47 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:49143 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbgDZN5r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Apr 2020 09:57:47 -0400
X-Originating-IP: 87.3.48.170
Received: from uno.localdomain (host170-48-dynamic.3-87-r.retail.telecomitalia.it [87.3.48.170])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id A9BE160002;
        Sun, 26 Apr 2020 13:57:24 +0000 (UTC)
Date:   Sun, 26 Apr 2020 16:00:26 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH] media: i2c: imx219: Implement get_selection
Message-ID: <20200426140026.pmbuyvlugayfm3jv@uno.localdomain>
References: <20200425170833.276706-1-jacopo@jmondi.org>
 <20200425232455.GJ10975@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200425232455.GJ10975@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sun, Apr 26, 2020 at 02:24:55AM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Sat, Apr 25, 2020 at 07:08:33PM +0200, Jacopo Mondi wrote:
> > Implement the get_selection pad operation for the IMX219 sensor driver.
> > The supported target report the sensor's native size, the crop default
>
> s/target/targets/
>
> > rectangle and the crop rectangle.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  drivers/media/i2c/imx219.c | 97 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 97 insertions(+)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index cb03bdec1f9c..2744669fb419 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -112,6 +112,14 @@
> >  #define IMX219_TESTP_BLUE_DEFAULT	0
> >  #define IMX219_TESTP_GREENB_DEFAULT	0
> >
> > +/* IMX219 native and active pixel array size. */
> > +#define IMX219_NATIVE_WIDTH		3296U
> > +#define IMX219_NATIVE_HEIGHT		2480U
> > +#define IMX219_PIXEL_ARRAY_LEFT		8U
> > +#define IMX219_PIXEL_ARRAY_TOP		8U
> > +#define IMX219_PIXEL_ARRAY_WIDTH	3280U
> > +#define IMX219_PIXEL_ARRAY_HEIGHT	2464U
>
> We should standardize in V4L2 on the vocabulary used to denote all
> these, but it's not an isssue specific to this patch.
>
> > +
> >  struct imx219_reg {
> >  	u16 address;
> >  	u8 val;
> > @@ -129,6 +137,9 @@ struct imx219_mode {
> >  	/* Frame height */
> >  	unsigned int height;
> >
> > +	/* Analog crop rectangle. */
> > +	struct v4l2_rect crop;
> > +
> >  	/* V-timing */
> >  	unsigned int vts_def;
> >
> > @@ -463,6 +474,12 @@ static const struct imx219_mode supported_modes[] = {
> >  		/* 8MPix 15fps mode */
> >  		.width = 3280,
> >  		.height = 2464,
> > +		.crop = {
> > +			.top = 0,
> > +			.left = 0,
>
> Fields are usually specified in the left-top order in v4l2_rect.
>
> > +			.width = 3280,
> > +			.height = 2464
> > +		},
> >  		.vts_def = IMX219_VTS_15FPS,
> >  		.reg_list = {
> >  			.num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
> > @@ -473,6 +490,12 @@ static const struct imx219_mode supported_modes[] = {
> >  		/* 1080P 30fps cropped */
> >  		.width = 1920,
> >  		.height = 1080,
> > +		.crop = {
> > +			.top = 692,
> > +			.left = 680,
> > +			.width = 1920,
> > +			.height = 1080
> > +		},
> >  		.vts_def = IMX219_VTS_30FPS_1080P,
> >  		.reg_list = {
> >  			.num_of_regs = ARRAY_SIZE(mode_1920_1080_regs),
> > @@ -483,6 +506,12 @@ static const struct imx219_mode supported_modes[] = {
> >  		/* 2x2 binned 30fps mode */
> >  		.width = 1640,
> >  		.height = 1232,
> > +		.crop = {
> > +			.top = 0,
> > +			.left = 0,
> > +			.width = 3280,
> > +			.height = 2464
> > +		},
> >  		.vts_def = IMX219_VTS_30FPS_BINNED,
> >  		.reg_list = {
> >  			.num_of_regs = ARRAY_SIZE(mode_1640_1232_regs),
> > @@ -654,6 +683,7 @@ static int imx219_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> >  	struct imx219 *imx219 = to_imx219(sd);
> >  	struct v4l2_mbus_framefmt *try_fmt =
> >  		v4l2_subdev_get_try_format(sd, fh->pad, 0);
> > +	struct v4l2_rect *try_crop;
> >
> >  	mutex_lock(&imx219->mutex);
> >
> > @@ -664,6 +694,13 @@ static int imx219_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> >  					       MEDIA_BUS_FMT_SRGGB10_1X10);
> >  	try_fmt->field = V4L2_FIELD_NONE;
> >
> > +	/* Initialize try_crop rectangle. */
>
> The driver should switch from open to init_cfg for this, but it's a
> separate issue that can be addressed later.
>
> > +	try_crop = v4l2_subdev_get_try_crop(sd, fh->pad, 0);
> > +	try_crop->top = IMX219_PIXEL_ARRAY_TOP;
> > +	try_crop->left = IMX219_PIXEL_ARRAY_LEFT;
> > +	try_crop->width = IMX219_PIXEL_ARRAY_WIDTH;
> > +	try_crop->height = IMX219_PIXEL_ARRAY_HEIGHT;
> > +
> >  	mutex_unlock(&imx219->mutex);
> >
> >  	return 0;
> > @@ -928,6 +965,65 @@ static int imx219_set_framefmt(struct imx219 *imx219)
> >  	return -EINVAL;
> >  }
> >
> > +static const struct v4l2_rect *
> > +__imx219_get_pad_crop(struct imx219 *imx219, struct v4l2_subdev_pad_config *cfg,
> > +		      unsigned int pad, enum v4l2_subdev_format_whence which)
> > +{
> > +	switch (which) {
> > +	case V4L2_SUBDEV_FORMAT_TRY:
> > +		return v4l2_subdev_get_try_crop(&imx219->sd, cfg, pad);
> > +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> > +		return &imx219->mode->crop;
> > +	default:
> > +		return NULL;
> > +	}
> > +}
> > +
> > +static int imx219_get_selection(struct v4l2_subdev *sd,
> > +				struct v4l2_subdev_pad_config *cfg,
> > +				struct v4l2_subdev_selection *sel)
> > +{
> > +	struct imx219 *imx219 = to_imx219(sd);
> > +	const struct v4l2_rect *__crop;
>
> 	int ret = 0;
>
> > +
> > +	if (sel->pad != 0)
> > +		return -EINVAL;
> > +
> > +	mutex_lock(&imx219->mutex);
> > +
> > +	switch (sel->target) {
> > +	case V4L2_SEL_TGT_NATIVE_SIZE:
> > +		sel->r.top = 0;
> > +		sel->r.left = 0;
> > +		sel->r.width = IMX219_NATIVE_WIDTH;
> > +		sel->r.height = IMX219_NATIVE_HEIGHT;
> > +		mutex_unlock(&imx219->mutex);
> > +
> > +		return 0;
>
> Replace those two lines with
>
> 		break;
>
> (same below)
>
> > +
> > +	case V4L2_SEL_TGT_CROP_DEFAULT:
> > +		sel->r.top = IMX219_PIXEL_ARRAY_TOP;
> > +		sel->r.left = IMX219_PIXEL_ARRAY_LEFT;
> > +		sel->r.width = IMX219_PIXEL_ARRAY_WIDTH;
> > +		sel->r.height = IMX219_PIXEL_ARRAY_HEIGHT;
> > +		mutex_unlock(&imx219->mutex);
> > +
> > +		return 0;
> > +
> > +	case V4L2_SEL_TGT_CROP:
> > +		__crop = __imx219_get_pad_crop(imx219, cfg, sel->pad,
> > +					       sel->which);
> > +		sel->r = *__crop;
> > +		mutex_unlock(&imx219->mutex);
> > +
> > +		return 0;
>
> And add
>
> 	default:
> 		ret = -EINVAL;
> 		break;
>
> > +	}
> > +
> > +	mutex_unlock(&imx219->mutex);
> > +
> > +	return -EINVAL;
>
> With
>
> 	return ret;

Actually this was intentional. I don't like 'return ret' as it
requires following the code backwards, and if the function grows
it gets harder to maintain. Although the mutex_unlock() in every case
is fragile, so I could consider switching.

>
> and you will then not have any intermediate mutex_unlock calls.
>
> With these small issues addressed,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks
  j

>
> > +}
> > +
> >  static int imx219_start_streaming(struct imx219 *imx219)
> >  {
> >  	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> > @@ -1152,6 +1248,7 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
> >  	.enum_mbus_code = imx219_enum_mbus_code,
> >  	.get_fmt = imx219_get_pad_format,
> >  	.set_fmt = imx219_set_pad_format,
> > +	.get_selection = imx219_get_selection,
> >  	.enum_frame_size = imx219_enum_frame_size,
> >  };
> >
>
> --
> Regards,
>
> Laurent Pinchart
