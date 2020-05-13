Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6440B1D0360
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2020 02:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731690AbgEMAAh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 20:00:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726031AbgEMAAh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 20:00:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FFE2C061A0C
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 17:00:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC15851F;
        Wed, 13 May 2020 02:00:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589328033;
        bh=ixr/eQePy7hRfKJYi9VzSNWnuSyeeEcUTGb6ma1xHsE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WidUIJEaqp0ta9Otrvh8CVfaeFE0cRacuaU3+KUcd5IyM2soYOc0N9VQbc5wyHDoO
         cGiDMyrjdlVQRD6LZbJpeRbACMBtBLriYSwjCjK8nFz5o1owwyX1fdrS4bJ29QaM9S
         WMEd5N/1sLrM85RqYezIzWE75dP47T+bQDhok9oc=
Date:   Wed, 13 May 2020 03:00:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: Add driver for On Semiconductor MT9M114
 camera sensor
Message-ID: <20200513000027.GL28527@pendragon.ideasonboard.com>
References: <20200511233456.9722-1-laurent.pinchart@ideasonboard.com>
 <20200511233456.9722-2-laurent.pinchart@ideasonboard.com>
 <20200512225529.GB867@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200512225529.GB867@valkosipuli.retiisi.org.uk>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wed, May 13, 2020 at 01:55:29AM +0300, Sakari Ailus wrote:
> On Tue, May 12, 2020 at 02:34:56AM +0300, Laurent Pinchart wrote:
> > The MT9M114 is a CMOS camera sensor that combines a 1296x976 pixel array
> > with a 10-bit dynamic range together with an internal ISP. The driver
> > exposes two subdevs, one for the pixel array and one for the ISP (named
> > IFP for Image Flow Processor). Major supported features are
> > 
> > - Full configuration of analog crop and binning in the pixel array
> > - Full configuration of scaling in the ISP
> > - Automatic exposure and white balance
> > - Manual exposure and analog gain
> > - Horizontal and vertical flip
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  MAINTAINERS                 |    1 +
> >  drivers/media/i2c/Kconfig   |   10 +
> >  drivers/media/i2c/Makefile  |    1 +
> >  drivers/media/i2c/mt9m114.c | 2161 +++++++++++++++++++++++++++++++++++
> >  4 files changed, 2173 insertions(+)
> >  create mode 100644 drivers/media/i2c/mt9m114.c

[snip]

> > diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> > new file mode 100644
> > index 000000000000..7f70ae2865b8
> > --- /dev/null
> > +++ b/drivers/media/i2c/mt9m114.c

[snip]

> > +static int mt9m114_pa_s_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +	struct mt9m114 *sensor = pa_ctrl_to_mt9m114(ctrl);
> > +	int ret = 0;
> > +
> > +	switch (ctrl->id) {
> > +	case V4L2_CID_EXPOSURE_ABSOLUTE:
> > +		mt9m114_write(sensor,
> > +			      MT9M114_CAM_SENSOR_CONTROL_COARSE_INTEGRATION_TIME,
> > +			      ctrl->val / MT9M114_LINE_LENGTH, &ret);
> 
> Hmm. I'd introduce a separate control for the fine exposure time. We'll
> need it in any case, and this would also allow setting just the coarse
> exposure time.
> 
> What do you think?

I've re-read the documentation of the V4L2_CID_EXPOSURE_ABSOLUTE
control, and it's documented as being expressed in multiples of 100µs.
Clearly not a good fit here :-S The ov9650 driver suffers from the same
problem. All the other sensor drievrs use V4L2_CID_EXPOSURE, whose unit
is not defined. Do we need to introduce V4L2_CID_EXPOSURE_COARSE and
V4L2_CID_EXPOSURE_FINE ? It would get messy with so many ways to control
the exposure time :-S Or should we document V4L2_CID_EXPOSURE as being
expressed in lines for new drivers, and add V4L2_CID_EXPOSURE_FINE to be
expressed in pixels ? What would two separate control for coarse and
fine exposures bring us, compared to expressing the exposure time in
pixels ?

> > +		mt9m114_write(sensor,
> > +			      MT9M114_CAM_SENSOR_CONTROL_FINE_INTEGRATION_TIME,
> > +			      ctrl->val % MT9M114_LINE_LENGTH, &ret);
> > +		break;
> > +
> > +	case V4L2_CID_ANALOGUE_GAIN:
> > +		/*
> > +		 * The CAM_SENSOR_CONTROL_ANALOG_GAIN contains linear analog
> > +		 * gain values that are mapped to the GLOBAL_GAIN register
> > +		 * values by the sensor firmware.
> > +		 */
> > +		mt9m114_write(sensor, MT9M114_CAM_SENSOR_CONTROL_ANALOG_GAIN,
> > +			      ctrl->val, &ret);
> > +		break;
> > +
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	return ret;
> > +}

[snip]

> > +static int mt9m114_pa_get_fmt(struct v4l2_subdev *sd,
> > +			      struct v4l2_subdev_pad_config *cfg,
> > +			      struct v4l2_subdev_format *fmt)
> > +{
> > +	struct mt9m114 *sensor = pa_to_mt9m114(sd);
> > +
> > +	fmt->format = *__mt9m114_pa_get_pad_format(sensor, cfg, fmt->pad,
> > +						   fmt->which);
> 
> I believe these need to be serialised with e.g. a mutex. Same for set
> below.

You're right, I'll fix that. All this is a bit inefficient though, as
the ioctl are already serialized in subdev_do_ioctl_lock(), so there
would be double-locking, but that's required when the subdev operations
are called within the kernel. Oh well... :-(

> > +	return 0;
> > +}
> > +
> > +static int mt9m114_pa_set_fmt(struct v4l2_subdev *sd,
> > +			      struct v4l2_subdev_pad_config *cfg,
> > +			      struct v4l2_subdev_format *fmt)
> > +{
> > +	struct mt9m114 *sensor = pa_to_mt9m114(sd);
> > +	struct v4l2_mbus_framefmt *format;
> > +	struct v4l2_rect *crop;
> > +	unsigned int hscale;
> > +	unsigned int vscale;
> > +
> > +	crop = __mt9m114_pa_get_pad_crop(sensor, cfg, fmt->pad, fmt->which);
> > +	format = __mt9m114_pa_get_pad_format(sensor, cfg, fmt->pad, fmt->which);
> > +
> > +	/* The sensor can bin horizontally and vertically. */
> > +	hscale = DIV_ROUND_CLOSEST(crop->width, fmt->format.width ? : 1);
> > +	vscale = DIV_ROUND_CLOSEST(crop->height, fmt->format.height ? : 1);
> > +	format->width = crop->width / clamp(hscale, 1U, 2U);
> > +	format->height = crop->height / clamp(vscale, 1U, 2U);
> > +
> > +	fmt->format = *format;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mt9m114_pa_get_selection(struct v4l2_subdev *sd,
> > +				    struct v4l2_subdev_pad_config *cfg,
> > +				    struct v4l2_subdev_selection *sel)
> > +{
> > +	struct mt9m114 *sensor = pa_to_mt9m114(sd);
> > +
> > +	switch (sel->target) {
> > +	case V4L2_SEL_TGT_CROP:
> > +		sel->r = *__mt9m114_pa_get_pad_crop(sensor, cfg, sel->pad,
> > +						    sel->which);
> > +		return 0;
> > +
> > +	case V4L2_SEL_TGT_CROP_DEFAULT:
> > +	case V4L2_SEL_TGT_CROP_BOUNDS:
> > +		sel->r.left = 0;
> > +		sel->r.top = 0;
> > +		sel->r.width = MT9M114_PIXEL_ARRAY_WIDTH;
> > +		sel->r.height = MT9M114_PIXEL_ARRAY_HEIGHT;
> > +		return 0;
> > +
> 
> Could you add NATIVE_SIZE target?

Sure. The sensor has optical dark pixels, but I don't see a way in the
datasheet to read the dark lines out (they're used by the internal ISP).
I will thus set the native size as equal to the crop bounds.

The V4L2 documentation could really benefit from clarifying the native
size and crop bounds targets by the way, it's awfully underspecified
(and as a result I would guess that 99% of the drivers get it wrong).

> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> > +static int mt9m114_pa_set_selection(struct v4l2_subdev *sd,
> > +				    struct v4l2_subdev_pad_config *cfg,
> > +				    struct v4l2_subdev_selection *sel)
> > +{
> > +	struct mt9m114 *sensor = pa_to_mt9m114(sd);
> > +	struct v4l2_mbus_framefmt *format;
> > +	struct v4l2_rect *crop;
> > +
> > +	if (sel->target != V4L2_SEL_TGT_CROP)
> > +		return -EINVAL;
> > +
> > +	crop = __mt9m114_pa_get_pad_crop(sensor, cfg, sel->pad, sel->which);
> > +	format = __mt9m114_pa_get_pad_format(sensor, cfg, sel->pad, sel->which);
> > +
> > +	/*
> > +	 * Clamp the crop rectangle. The vertical coordinates must be even, and
> > +	 * the horizontal coordinates must be a multiple of 4.
> > +	 *
> > +	 * FIXME: The horizontal coordinates must be a multiple of 8 when
> > +	 * binning, but binning is configured after setting the selection, so
> > +	 * we can't know tell here if it will be used.
> > +	 */
> > +	crop->left = ALIGN(sel->r.left, 4);
> > +	crop->top = ALIGN(sel->r.top, 2);
> > +	crop->width = clamp_t(unsigned int, ALIGN(sel->r.width, 4),
> > +			      MT9M114_PIXEL_ARRAY_MIN_OUTPUT_WIDTH,
> > +			      MT9M114_PIXEL_ARRAY_WIDTH - crop->left);
> > +	crop->height = clamp_t(unsigned int, ALIGN(sel->r.height, 2),
> > +			      MT9M114_PIXEL_ARRAY_MIN_OUTPUT_HEIGHT,
> 
> Alignment.

Oops.

> > +			       MT9M114_PIXEL_ARRAY_HEIGHT - crop->top);
> > +
> > +	sel->r = *crop;
> > +
> > +	/* Reset the format. */
> > +	format->width = crop->width;
> > +	format->height = crop->height;
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct v4l2_subdev_pad_ops mt9m114_pa_pad_ops = {
> > +	.init_cfg = mt9m114_pa_init_cfg,
> > +	.enum_mbus_code = mt9m114_pa_enum_mbus_code,
> > +	.enum_frame_size = mt9m114_pa_enum_framesizes,
> > +	.get_fmt = mt9m114_pa_get_fmt,
> > +	.set_fmt = mt9m114_pa_set_fmt,
> > +	.get_selection = mt9m114_pa_get_selection,
> > +	.set_selection = mt9m114_pa_set_selection,
> > +};
> > +
> > +static const struct v4l2_subdev_ops mt9m114_pa_ops = {
> > +	.pad = &mt9m114_pa_pad_ops,
> > +};
> > +
> > +static int mt9m114_pa_init(struct mt9m114 *sensor)
> > +{
> > +	struct v4l2_ctrl_handler *hdl = &sensor->pa.hdl;
> > +	struct v4l2_subdev *sd = &sensor->pa.sd;
> > +	struct media_pad *pads = &sensor->pa.pad;
> > +	uint32_t max_exposure;
> > +	int ret;
> > +
> > +	/* Initialize the subdev. */
> > +	v4l2_subdev_init(sd, &mt9m114_pa_ops);
> > +	v4l2_i2c_subdev_set_name(sd, sensor->client, "mt9m114", " pixel array");
> > +
> > +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +	sd->owner = THIS_MODULE;
> > +	sd->dev = &sensor->client->dev;
> > +	v4l2_set_subdevdata(sd, sensor->client);
> > +
> > +	/* Initialize the media entity. */
> > +	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > +	sd->entity.ops = &mt9m114_entity_ops;
> > +	pads[0].flags = MEDIA_PAD_FL_SOURCE;
> > +	ret = media_entity_pads_init(&sd->entity, 1, pads);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/* Initialize the control handler. */
> > +	v4l2_ctrl_handler_init(hdl, 2);
> > +
> > +	/*
> > +	 * The maximum corse integratime is MT9M114_FRAME_LENGTH - 2 lines, and
> > +	 * the maximum fine integration time MT9M114_LINE_LENGTH - 1 pixels. The
> > +	 * default is taken directly from the datasheet, but makes little sense
> > +	 * as auto-exposure is enabled by default.
> > +	 */
> > +	max_exposure = (MT9M114_FRAME_LENGTH - 2) * MT9M114_LINE_LENGTH
> > +		     + MT9M114_LINE_LENGTH - 1;
> > +	sensor->pa.exposure =
> > +		v4l2_ctrl_new_std(hdl, &mt9m114_pa_ctrl_ops,
> > +				  V4L2_CID_EXPOSURE_ABSOLUTE,
> > +				  1, max_exposure, 1, 25661);
> 
> sensor->pa.exposure may be NULL here.
> 
> > +	sensor->pa.exposure->flags |= V4L2_CTRL_FLAG_VOLATILE;
> > +	sensor->pa.gain =
> > +		v4l2_ctrl_new_std(hdl, &mt9m114_pa_ctrl_ops,
> > +				  V4L2_CID_ANALOGUE_GAIN,
> > +				  1, 511, 1, 32);
> 
> Same for sensor->pa.gain.

Will fix both.

> > +	sensor->pa.gain->flags |= V4L2_CTRL_FLAG_VOLATILE;
> > +	if (hdl->error)
> > +		return hdl->error;
> > +
> > +	ret = v4l2_ctrl_handler_setup(hdl);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	sd->ctrl_handler = hdl;
> > +
> > +	/* Initialize the pads formats and selection rectangles. */
> > +	mt9m114_pa_init_cfg(sd, NULL);
> > +
> > +	return 0;
> > +}

[snip]

> > +static int mt9m114_ifp_enum_frameintervals(struct v4l2_subdev *sd,
> > +					   struct v4l2_subdev_pad_config *cfg,
> > +					   struct v4l2_subdev_frame_interval_enum *fie)
> > +{
> > +	if (fie->index > 0)
> > +		return -EINVAL;
> > +
> > +	if (!mt9m114_ifp_mbus_code(fie->pad, fie->code))
> > +		return -EINVAL;
> > +
> > +	fie->interval.numerator = 1;
> > +	fie->interval.denominator = 30;
> 
> Could this be MAX_FRAME_RATE?

Yes it should be.

> > +
> > +	return 0;
> > +}

[snip]

> > +static int mt9m114_ifp_init(struct mt9m114 *sensor)
> > +{
> > +	struct v4l2_subdev *sd = &sensor->ifp.sd;
> > +	struct media_pad *pads = sensor->ifp.pads;
> > +	struct v4l2_ctrl_handler *hdl = &sensor->ifp.hdl;
> > +	int ret;
> > +
> > +	/* Initialize the subdev. */
> > +	v4l2_i2c_subdev_init(sd, sensor->client, &mt9m114_ifp_ops);
> > +	v4l2_i2c_subdev_set_name(sd, sensor->client, "mt9m114", " ifp");
> > +
> > +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +	sd->internal_ops = &mt9m114_ifp_internal_ops;
> > +
> > +	/* Initialize the media entity. */
> > +	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_SCALER;
> > +	sd->entity.ops = &mt9m114_entity_ops;
> > +	pads[0].flags = MEDIA_PAD_FL_SINK;
> > +	pads[1].flags = MEDIA_PAD_FL_SOURCE;
> > +	ret = media_entity_pads_init(&sd->entity, 2, pads);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/* Initialize the control handler. */
> > +	v4l2_ctrl_handler_init(hdl, 4);
> > +	v4l2_ctrl_new_std(hdl, &mt9m114_ifp_ctrl_ops,
> > +			  V4L2_CID_AUTO_WHITE_BALANCE,
> > +			  0, 1, 1, 1);
> > +	v4l2_ctrl_new_std(hdl, &mt9m114_ifp_ctrl_ops,
> > +			  V4L2_CID_HFLIP,
> > +			  0, 1, 1, 0);
> > +	v4l2_ctrl_new_std(hdl, &mt9m114_ifp_ctrl_ops,
> > +			  V4L2_CID_VFLIP,
> > +			  0, 1, 1, 0);
> > +	v4l2_ctrl_new_std_menu(hdl, &mt9m114_ifp_ctrl_ops,
> > +			       V4L2_CID_EXPOSURE_AUTO,
> > +			       V4L2_EXPOSURE_MANUAL, 0,
> > +			       V4L2_EXPOSURE_AUTO);
> > +	if (hdl->error)
> > +		return hdl->error;
> > +
> > +	ret = v4l2_ctrl_handler_setup(hdl);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	sd->ctrl_handler = hdl;
> > +
> > +	/* Initialize the pads formats and selection rectangles. */
> > +	mt9m114_ifp_init_cfg(sd, NULL);
> > +
> > +	sensor->ifp.frame_rate = 30;
> 
> MAX_FRAME_RATE?

Yes. I'll also rename it to MT9M114_MAX_FRAME_RATE.

> > +
> > +	return 0;
> > +}
> > +
> > +static void mt9m114_ifp_cleanup(struct mt9m114 *sensor)
> > +{
> > +	v4l2_ctrl_handler_free(&sensor->ifp.hdl);
> > +	media_entity_cleanup(&sensor->ifp.sd.entity);
> > +}
> > +
> > +/* -----------------------------------------------------------------------------
> > + * Probe & Remove
> > + */
> > +
> > +static int mt9m114_identify(struct mt9m114 *sensor)
> > +{
> > +	u32 value;
> > +	int ret;
> > +
> > +	ret = mt9m114_read(sensor, MT9M114_CHIP_ID, &value);
> > +	if (ret < 0) {
> > +		dev_err(&sensor->client->dev, "Failed to read chip ID\n");
> > +		return -ENXIO;
> > +	}
> > +
> > +	if (value != 0x2481) {
> > +		dev_err(&sensor->client->dev, "Invalid chip ID 0x%04x\n",
> > +			value);
> > +		return -ENXIO;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int mt9m114_parse_dt(struct mt9m114 *sensor)
> > +{
> > +	struct fwnode_handle *fwnode = dev_fwnode(&sensor->client->dev);
> > +	struct fwnode_handle *ep;
> > +	int ret;
> > +
> > +	if (!fwnode)
> > +		return -ENXIO;
> > +
> > +	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> > +	if (!ep) {
> > +		dev_err(&sensor->client->dev, "No endpoint found\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &sensor->bus_cfg);
> 
> Please initialise the bus type.

Are you fine initializing it to V4L2_MBUS_UNKNOWN ? I don't want to loop
over v4l2_fwnode_endpoint_alloc_parse() for all supported bus types.

> > +	fwnode_handle_put(ep);
> > +	if (ret < 0) {
> > +		dev_err(&sensor->client->dev, "Failed to parse endpoint\n");
> > +		goto error;
> > +	}
> > +
> > +	switch (sensor->bus_cfg.bus_type) {
> > +	case V4L2_MBUS_CSI2_DPHY:
> > +	case V4L2_MBUS_PARALLEL:
> > +		break;
> > +
> > +	default:
> > +		dev_err(&sensor->client->dev, "unsupported bus type %u\n",
> > +			sensor->bus_cfg.bus_type);
> > +		ret = -EINVAL;
> > +		goto error;
> > +	}
> > +
> > +	return 0;
> > +
> > +error:
> > +	v4l2_fwnode_endpoint_free(&sensor->bus_cfg);
> > +	return ret;
> > +}

[snip]

> > +static const struct i2c_device_id mt9m114_id[] = {
> > +	{ "mt9m114", 0 },
> > +	{ },
> > +};
> > +
> > +MODULE_DEVICE_TABLE(i2c, mt9m114_id);
> > +
> > +static struct i2c_driver mt9m114_driver = {
> > +	.driver = {
> > +		.owner	= THIS_MODULE,
> > +		.name	= "mt9m114",
> > +	},
> > +	.probe		= mt9m114_probe,
> > +	.remove		= mt9m114_remove,
> > +	.id_table	= mt9m114_id,
> 
> No OF or ACPI ID table? Really?

I have no idea what ACPI IDs this device would have, and OF isn't
required, the I2C subsystem strips the vendor prefix from the compatible
string and matches against i2c_driver.id_table.

> > +};
> > +
> > +module_i2c_driver(mt9m114_driver);
> > +
> > +MODULE_DESCRIPTION("Aptina MT9M114 Sensor Driver");
> > +MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");
> > +MODULE_LICENSE("GPL v2");

-- 
Regards,

Laurent Pinchart
