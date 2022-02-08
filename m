Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A491E4ADB00
	for <lists+linux-media@lfdr.de>; Tue,  8 Feb 2022 15:17:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346731AbiBHORx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Feb 2022 09:17:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377951AbiBHORu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Feb 2022 09:17:50 -0500
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37EF6C03FED4
        for <linux-media@vger.kernel.org>; Tue,  8 Feb 2022 06:17:48 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id B33AF100015;
        Tue,  8 Feb 2022 14:17:40 +0000 (UTC)
Date:   Tue, 8 Feb 2022 15:18:48 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     slongerbeam@gmail.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        eugen.hristev@microchip.com, jbrunet@baylibre.com,
        mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 14/21] media: ov5640: Implement get_selection
Message-ID: <20220208141848.jumm2fisjy7ukbah@uno.localdomain>
References: <20220131143245.128089-1-jacopo@jmondi.org>
 <20220131144444.129036-1-jacopo@jmondi.org>
 <20220131144444.129036-3-jacopo@jmondi.org>
 <YfsF247w8mPNH5e4@pendragon.ideasonboard.com>
 <20220207154735.sqbqe4gpovvpybod@uno.localdomain>
 <YgFcqb3Cgl1BLTzP@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YgFcqb3Cgl1BLTzP@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent
  sorry, I missed the last question in your comment

On Mon, Feb 07, 2022 at 07:53:45PM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> On Mon, Feb 07, 2022 at 04:47:35PM +0100, Jacopo Mondi wrote:
> > On Thu, Feb 03, 2022 at 12:29:47AM +0200, Laurent Pinchart wrote:
> > > On Mon, Jan 31, 2022 at 03:44:42PM +0100, Jacopo Mondi wrote:
> > > > Implement the get_selection pad operation for the OV5640 sensor driver.
> > > >
> > > > The supported targets report the sensor's native size, the active pixel
> > > > array size and the analog crop rectangle from which the image is
> > > > produced.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > > ---
> > > >  drivers/media/i2c/ov5640.c | 61 ++++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 61 insertions(+)
> > > >
> > > > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > > > index 762bdca83aec..ae22300b9655 100644
> > > > --- a/drivers/media/i2c/ov5640.c
> > > > +++ b/drivers/media/i2c/ov5640.c
> > > > @@ -35,6 +35,13 @@
> > > >  #define OV5640_MIN_VBLANK	24
> > > >  #define OV5640_MAX_VTS		1968
> > > >
> > > > +#define OV5640_NATIVE_WIDTH		2624
> > > > +#define OV5640_NATIVE_HEIGHT		1964
> > > > +#define OV5640_PIXEL_ARRAY_TOP		8
> > > > +#define OV5640_PIXEL_ARRAY_LEFT		16
> > > > +#define OV5640_PIXEL_ARRAY_WIDTH	2592
> > > > +#define OV5640_PIXEL_ARRAY_HEIGHT	1944
> > >
> > > According to the datasheet, the sensor has 8 black lines, 6 dummy lines,
> > > 1944 active lines and 6 dummy lines. Horizontally, it has 16 dummy
> > > columns, 2592 active columns, and 16 dummy columns. If "pixel array" is
> > > meant to refer to the active area (I dislike the "active" name here, as
> > > the dummy lines and columns are typically "active" too, but that's a
> > > digression), then top should be 14.
> >
> > Corret, I have only considered the 8 black lines, but dummy too are
> > 'active but not valid' ones.
> >
> > I'll change to 14
> >
> > > > +
> > > >  #define OV5640_DEFAULT_SLAVE_ID 0x3c
> > > >
> > > >  #define OV5640_REG_SYS_RESET02		0x3002
> > > > @@ -2667,6 +2674,52 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
> > > >  	return ret;
> > > >  }
> > > >
> > > > +static int ov5640_get_selection(struct v4l2_subdev *sd,
> > > > +				struct v4l2_subdev_state *sd_state,
> > > > +				struct v4l2_subdev_selection *sel)
> > > > +{
> > > > +	struct ov5640_dev *sensor = to_ov5640_dev(sd);
> > > > +	const struct ov5640_mode_info *mode = sensor->current_mode;
> > > > +	const struct v4l2_rect *analog_crop = &mode->analog_crop;
> > > > +	const struct v4l2_rect *crop = &mode->crop;
> > > > +
> > > > +	switch (sel->target) {
> > > > +	case V4L2_SEL_TGT_CROP: {
> > > > +		mutex_lock(&sensor->lock);
> > > > +
> > > > +		sel->r.top = analog_crop->top + OV5640_PIXEL_ARRAY_TOP;
> > > > +		sel->r.left = analog_crop->left + OV5640_PIXEL_ARRAY_LEFT;
> > > > +		sel->r.width = analog_crop->width
> > > > +			     - analog_crop->left - crop->left;
> > >
> > > Why do you subtract the left coordinates here ?
> >
> > As the analog_crop->width is defined from the full pixel array size
> > (black + dummy + active). The TGT_CROP rectangle width and height
> > should instead report the dimensions of the portion of the pixel array
> > size which is processed to obtain the final image, and thus the
> > vertical and horizontal offsets should be subtracted
> >
> >
> >     full                            analog_crop.width
> >      |                              (0x3804, 0x3805) = 2624
> >      |                                   |
> >      V                                   V
> >   -> +-----------------------------------+
> >      |                                   |
> >      x-----------------------------------|
> >      |  x----  TGT_CROP width  ----------|
> >      |  |                                |
> >      |  |                                |
> >      |  |                                |
> >      |  |                                |
> >      |  |                                |
> >      |  |                                |
> >      |  |                                |
> >      +--|--------------------------------+
> >      |  |
> >      |  |-> crop.left = 16
> >      |
> >      |-> analog_crop.left = 0
>
> With analog_crop.left == 0 that's fine, but if it had a different value,
> shouldn't the above use
>
> 		sel->r.width = analog_crop->width - crop->left;
>
> ?

I don't think so... analog_crop->width counts from 0 (it corresponds
to reg 0x3804 in figure 4.2) and looking at the picture again, it
seems the the actual crop should rather be

                analog_crop->width - analog_crop->left

?


>
> > > > +		sel->r.height = analog_crop->height
> > > > +			      - analog_crop->top - crop->top;
> > > > +
> > > > +		mutex_unlock(&sensor->lock);
> > > > +
> > > > +		return 0;
> > > > +	}
> > > > +
> > > > +	case V4L2_SEL_TGT_NATIVE_SIZE:
> > > > +		sel->r.top = 0;
> > > > +		sel->r.left = 0;
> > > > +		sel->r.width = OV5640_NATIVE_WIDTH;
> > > > +		sel->r.height = OV5640_NATIVE_HEIGHT;
> > > > +
> > > > +		return 0;
> > > > +
> > > > +	case V4L2_SEL_TGT_CROP_DEFAULT:
> > > > +	case V4L2_SEL_TGT_CROP_BOUNDS:
> > > > +		sel->r.top = OV5640_PIXEL_ARRAY_TOP;
> > > > +		sel->r.left = OV5640_PIXEL_ARRAY_LEFT;
> > > > +		sel->r.width = OV5640_PIXEL_ARRAY_WIDTH;
> > > > +		sel->r.height = OV5640_PIXEL_ARRAY_HEIGHT;
> > >
> > > In libcamera we use V4L2_SEL_TGT_CROP_BOUNDS to set PixelArraySize,
> > > ignoring the left and top coordinates, and V4L2_SEL_TGT_CROP_DEFAULT to
> > > to set the PixelArrayActiveAreas property relative to PixelArraySize.
> > > This means that non-zero values for the left and top coordinates of
> > > V4L2_SEL_TGT_CROP_BOUNDS will cause issues. Is this an issue in
> > > libcamera, or should V4L2_SEL_TGT_CROP_BOUNDS be changed here ?
> > >

For reference:
Documentation/sensor_driver_requirements.rst:* `V4L2_SEL_TGT_CROP_BOUNDS`_ to report the readable pixel array area size
Documentation/sensor_driver_requirements.rst:* `V4L2_SEL_TGT_CROP_DEFAULT`_ to report the active pixel array area size
Documentation/sensor_driver_requirements.rst:* `V4L2_SEL_TGT_CROP`_ to report the analogue selection rectangle

What I see in libcamera::camera_sensor.cpp is

        validateSensorDriver()
        {
                /* Readable pixels */
                pixelArraySize = TGT_BOUNDS ( = [2592, 1944])

                /* Active (or better, valid) pixel array) */
                activeArea = TGT_DEFAULT ( = [14, 16, 2592, 1944])
        }

        sensorInfo()
        {
                /* Analog crop */
                analogCrop = TGT_CROP

                /*
                Gets assembled in the driver as:

		sel->r.top = analog_crop->top + OV5640_PIXEL_ARRAY_TOP;
		sel->r.left = analog_crop->left + OV5640_PIXEL_ARRAY_LEFT;
		sel->r.width = analog_crop->width
			     - analog_crop->left - crop->left;
		sel->r.height = analog_crop->height
			      - analog_crop->top - crop->top;

                */

                /*
                 * Adjust the V4L2 TGT_CROP to comply with libcamera
                 * analogueCrop
                 */
                analogCrop.x -= activeArea_.x;
                analogCrop.y -= activeArea_.y;
        }

What is not correct that DEFAULT and BOUND have the same size.

If both BOUND and DEFAULT has a size of 2592x1944, then DEFAULT cannot
have (14, 16) as top-left corner, unless we read the last dummy
columns/lines.

So I would

        readable pixel array = (2624, 1964) = TGT_BOUND
        active pixel array (PIXEL_ARRAY_TOP, PIXEL_ARRAY_LEFT, 2592, 1944) = TGT_DEFAULT

        TGT_CROP = {
                    .top = analog_crop->top + OV5640_PIXEL_ARRAY_TOP,
                    .left = analog_crop->left + OV5640_PIXEL_ARRAY_LEFT;
                    .width = analog_crop->width - analog_crop->left - OV5640_PIXEL_ARRAY_LEFT,
                    .height = analog_crop->height - analog_crop->top - OV5640_PIXEL_ARRAY_TOP,
                   }

       which gets adjusted in libcamera as the V4L2 TGT_CROP is defined from
       BOUND while libcamera::analogueCrop is defined from
       libcamera::activeArea ( == TGT_DEFAULT)

        analog_crop = {
                        .top =  TGT_CROP.top - activeArea.top,
                        .left = TGT_CROP.left - activeArea.left,
                        .width = TGT_CROP.width,
                        .height = TGT_CROP.height
                      }

I do however see a problem caused by the current definition of the
driver's mode sizes

      TGT_CROP.width = analog_crop->width - analog_crop->left - OV5640_PIXEL_ARRAY_LEFT
                     = 2624 - 0 - 16 = 2608

which means the chip is instructed to read dummy columns at the end
(as analog_crop.width gets written to register 0x3804 and counts from 0)

We should probably avoid that by changing analog_crop->width and
in the sensor's modes definition.

My goal would then be to see in libcamera:

        Readable = { 2624, 1964 }
        Active = { 14, 16, 2592, 1944 }

        Crop depends on mode, but for VGA in example, asuming I'll fix
        the width and heigh to skip the last dummy cols/lines:

		.analog_crop = {
			.left	= 0,
			.top	= 4,
			.width	= 2608, /* Skip last 16 dummy cols */
			.height	= 1958, /* Skip last 6 dummy lines */
		},

        it should then resul in libcamera in as {0, 4, 2592, 1940 }

Now I wonder if the 4 lines skipped by analog_crop.top are actually
necessary or it's cruft from the existing register tables definitions.

I'll try to remove them and have the full valid pixel array passed in
to the chip's ISP.

> > > The related question is, can we read the optical black lines and the
> > > dummy lines and columns ?
> > >

Not tested, they're addressable (in theory) so I would make BOUND !=
DEFAULT, as explained above.

Sorry for the long email :/

> > > > +
> > > > +		return 0;
> > > > +	}
> > > > +
> > > > +	return -EINVAL;
> > > > +}
> > > > +
> > > >  static int ov5640_set_framefmt(struct ov5640_dev *sensor,
> > > >  			       struct v4l2_mbus_framefmt *format)
> > > >  {
> > > > @@ -3369,6 +3422,7 @@ static const struct v4l2_subdev_pad_ops ov5640_pad_ops = {
> > > >  	.enum_mbus_code = ov5640_enum_mbus_code,
> > > >  	.get_fmt = ov5640_get_fmt,
> > > >  	.set_fmt = ov5640_set_fmt,
> > > > +	.get_selection = ov5640_get_selection,
> > > >  	.enum_frame_size = ov5640_enum_frame_size,
> > > >  	.enum_frame_interval = ov5640_enum_frame_interval,
> > > >  };
> > > > @@ -3383,9 +3437,16 @@ static int ov5640_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> > > >  {
> > > >  	struct v4l2_mbus_framefmt *try_fmt =
> > > >  		v4l2_subdev_get_try_format(sd, fh->state, 0);
> > > > +	struct v4l2_rect *try_crop =
> > > > +		v4l2_subdev_get_try_crop(sd, fh->state, 0);
> > > >
> > > >  	*try_fmt = ov5640_default_fmt;
> > > >
> > > > +	try_crop->left = OV5640_PIXEL_ARRAY_LEFT;
> > > > +	try_crop->top = OV5640_PIXEL_ARRAY_TOP;
> > > > +	try_crop->width = OV5640_PIXEL_ARRAY_WIDTH;
> > > > +	try_crop->height = OV5640_PIXEL_ARRAY_HEIGHT;
> > > > +
> > > >  	return 0;
> > > >  }
> > > >
>
> --
> Regards,
>
> Laurent Pinchart
