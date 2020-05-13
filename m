Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D092F1D11E1
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2020 13:55:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731771AbgEMLy7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 May 2020 07:54:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729758AbgEMLy7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 May 2020 07:54:59 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E4CDC061A0C
        for <linux-media@vger.kernel.org>; Wed, 13 May 2020 04:54:59 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id AA304634C25;
        Wed, 13 May 2020 14:53:56 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jYpxU-0001wD-IK; Wed, 13 May 2020 14:53:56 +0300
Date:   Wed, 13 May 2020 14:53:56 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: Add driver for On Semiconductor MT9M114
 camera sensor
Message-ID: <20200513115356.GC867@valkosipuli.retiisi.org.uk>
References: <20200511233456.9722-1-laurent.pinchart@ideasonboard.com>
 <20200511233456.9722-2-laurent.pinchart@ideasonboard.com>
 <20200512225529.GB867@valkosipuli.retiisi.org.uk>
 <20200513000027.GL28527@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200513000027.GL28527@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, May 13, 2020 at 03:00:27AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Wed, May 13, 2020 at 01:55:29AM +0300, Sakari Ailus wrote:
> > On Tue, May 12, 2020 at 02:34:56AM +0300, Laurent Pinchart wrote:
> > > The MT9M114 is a CMOS camera sensor that combines a 1296x976 pixel array
> > > with a 10-bit dynamic range together with an internal ISP. The driver
> > > exposes two subdevs, one for the pixel array and one for the ISP (named
> > > IFP for Image Flow Processor). Major supported features are
> > > 
> > > - Full configuration of analog crop and binning in the pixel array
> > > - Full configuration of scaling in the ISP
> > > - Automatic exposure and white balance
> > > - Manual exposure and analog gain
> > > - Horizontal and vertical flip
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  MAINTAINERS                 |    1 +
> > >  drivers/media/i2c/Kconfig   |   10 +
> > >  drivers/media/i2c/Makefile  |    1 +
> > >  drivers/media/i2c/mt9m114.c | 2161 +++++++++++++++++++++++++++++++++++
> > >  4 files changed, 2173 insertions(+)
> > >  create mode 100644 drivers/media/i2c/mt9m114.c
> 
> [snip]
> 
> > > diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> > > new file mode 100644
> > > index 000000000000..7f70ae2865b8
> > > --- /dev/null
> > > +++ b/drivers/media/i2c/mt9m114.c
> 
> [snip]
> 
> > > +static int mt9m114_pa_s_ctrl(struct v4l2_ctrl *ctrl)
> > > +{
> > > +	struct mt9m114 *sensor = pa_ctrl_to_mt9m114(ctrl);
> > > +	int ret = 0;
> > > +
> > > +	switch (ctrl->id) {
> > > +	case V4L2_CID_EXPOSURE_ABSOLUTE:
> > > +		mt9m114_write(sensor,
> > > +			      MT9M114_CAM_SENSOR_CONTROL_COARSE_INTEGRATION_TIME,
> > > +			      ctrl->val / MT9M114_LINE_LENGTH, &ret);
> > 
> > Hmm. I'd introduce a separate control for the fine exposure time. We'll
> > need it in any case, and this would also allow setting just the coarse
> > exposure time.
> > 
> > What do you think?
> 
> I've re-read the documentation of the V4L2_CID_EXPOSURE_ABSOLUTE
> control, and it's documented as being expressed in multiples of 100µs.

It says "should". Indeed this is not the case for raw sensors. We could
update the documentation, I think.

> Clearly not a good fit here :-S The ov9650 driver suffers from the same
> problem. All the other sensor drievrs use V4L2_CID_EXPOSURE, whose unit
> is not defined. Do we need to introduce V4L2_CID_EXPOSURE_COARSE and
> V4L2_CID_EXPOSURE_FINE ? It would get messy with so many ways to control

I'm not opposed to that in principle. But what do we do with all the
current drivers in that case? They use V4L2_CID_EXPOSURE_ABSOLUTE.

> the exposure time :-S Or should we document V4L2_CID_EXPOSURE as being
> expressed in lines for new drivers, and add V4L2_CID_EXPOSURE_FINE to be
> expressed in pixels ? What would two separate control for coarse and
> fine exposures bring us, compared to expressing the exposure time in
> pixels ?

It takes time to do the writes over the I²C bus. At higher frame rates it
become increasingly risky, and the least risk is indeed often preferred.

> 
> > > +		mt9m114_write(sensor,
> > > +			      MT9M114_CAM_SENSOR_CONTROL_FINE_INTEGRATION_TIME,
> > > +			      ctrl->val % MT9M114_LINE_LENGTH, &ret);
> > > +		break;
> > > +
> > > +	case V4L2_CID_ANALOGUE_GAIN:
> > > +		/*
> > > +		 * The CAM_SENSOR_CONTROL_ANALOG_GAIN contains linear analog
> > > +		 * gain values that are mapped to the GLOBAL_GAIN register
> > > +		 * values by the sensor firmware.
> > > +		 */
> > > +		mt9m114_write(sensor, MT9M114_CAM_SENSOR_CONTROL_ANALOG_GAIN,
> > > +			      ctrl->val, &ret);
> > > +		break;
> > > +
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> 
> [snip]
> 
> > > +static int mt9m114_pa_get_fmt(struct v4l2_subdev *sd,
> > > +			      struct v4l2_subdev_pad_config *cfg,
> > > +			      struct v4l2_subdev_format *fmt)
> > > +{
> > > +	struct mt9m114 *sensor = pa_to_mt9m114(sd);
> > > +
> > > +	fmt->format = *__mt9m114_pa_get_pad_format(sensor, cfg, fmt->pad,
> > > +						   fmt->which);
> > 
> > I believe these need to be serialised with e.g. a mutex. Same for set
> > below.
> 
> You're right, I'll fix that. All this is a bit inefficient though, as
> the ioctl are already serialized in subdev_do_ioctl_lock(), so there

They are not, as lock is always NULL. Drivers are still responsible for
doing this. This would seem to need some kind of a rework; acquiring a
mutex should be done to the calls independently of whether they are done
through IOCTLs or from other drivers.

> would be double-locking, but that's required when the subdev operations
> are called within the kernel. Oh well... :-(
> 
> > > +	return 0;
> > > +}
> > > +
> > > +static int mt9m114_pa_set_fmt(struct v4l2_subdev *sd,
> > > +			      struct v4l2_subdev_pad_config *cfg,
> > > +			      struct v4l2_subdev_format *fmt)
> > > +{
> > > +	struct mt9m114 *sensor = pa_to_mt9m114(sd);
> > > +	struct v4l2_mbus_framefmt *format;
> > > +	struct v4l2_rect *crop;
> > > +	unsigned int hscale;
> > > +	unsigned int vscale;
> > > +
> > > +	crop = __mt9m114_pa_get_pad_crop(sensor, cfg, fmt->pad, fmt->which);
> > > +	format = __mt9m114_pa_get_pad_format(sensor, cfg, fmt->pad, fmt->which);
> > > +
> > > +	/* The sensor can bin horizontally and vertically. */
> > > +	hscale = DIV_ROUND_CLOSEST(crop->width, fmt->format.width ? : 1);
> > > +	vscale = DIV_ROUND_CLOSEST(crop->height, fmt->format.height ? : 1);
> > > +	format->width = crop->width / clamp(hscale, 1U, 2U);
> > > +	format->height = crop->height / clamp(vscale, 1U, 2U);
> > > +
> > > +	fmt->format = *format;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int mt9m114_pa_get_selection(struct v4l2_subdev *sd,
> > > +				    struct v4l2_subdev_pad_config *cfg,
> > > +				    struct v4l2_subdev_selection *sel)
> > > +{
> > > +	struct mt9m114 *sensor = pa_to_mt9m114(sd);
> > > +
> > > +	switch (sel->target) {
> > > +	case V4L2_SEL_TGT_CROP:
> > > +		sel->r = *__mt9m114_pa_get_pad_crop(sensor, cfg, sel->pad,
> > > +						    sel->which);
> > > +		return 0;
> > > +
> > > +	case V4L2_SEL_TGT_CROP_DEFAULT:
> > > +	case V4L2_SEL_TGT_CROP_BOUNDS:
> > > +		sel->r.left = 0;
> > > +		sel->r.top = 0;
> > > +		sel->r.width = MT9M114_PIXEL_ARRAY_WIDTH;
> > > +		sel->r.height = MT9M114_PIXEL_ARRAY_HEIGHT;
> > > +		return 0;
> > > +
> > 
> > Could you add NATIVE_SIZE target?
> 
> Sure. The sensor has optical dark pixels, but I don't see a way in the
> datasheet to read the dark lines out (they're used by the internal ISP).
> I will thus set the native size as equal to the crop bounds.
> 
> The V4L2 documentation could really benefit from clarifying the native
> size and crop bounds targets by the way, it's awfully underspecified
> (and as a result I would guess that 99% of the drivers get it wrong).

The crop bounds are effectively the same in this case. But the crop bounds
(and crop) targets are used in a lot of different cases, too.

This is indeed a little grey area as sensor implementations differ. Those
black pixels may still affect timing, but some devices probably don't even
document them.

...

> > > +static int mt9m114_parse_dt(struct mt9m114 *sensor)
> > > +{
> > > +	struct fwnode_handle *fwnode = dev_fwnode(&sensor->client->dev);
> > > +	struct fwnode_handle *ep;
> > > +	int ret;
> > > +
> > > +	if (!fwnode)
> > > +		return -ENXIO;
> > > +
> > > +	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> > > +	if (!ep) {
> > > +		dev_err(&sensor->client->dev, "No endpoint found\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &sensor->bus_cfg);
> > 
> > Please initialise the bus type.
> 
> Are you fine initializing it to V4L2_MBUS_UNKNOWN ? I don't want to loop
> over v4l2_fwnode_endpoint_alloc_parse() for all supported bus types.

Feel free to propose alternatives. Either way, that is probably the most
simple thing you can do in a driver.

We don't want to add DT properties just to cover deficiencies in driver
implementation.

> 
> > > +	fwnode_handle_put(ep);
> > > +	if (ret < 0) {
> > > +		dev_err(&sensor->client->dev, "Failed to parse endpoint\n");
> > > +		goto error;
> > > +	}
> > > +
> > > +	switch (sensor->bus_cfg.bus_type) {
> > > +	case V4L2_MBUS_CSI2_DPHY:
> > > +	case V4L2_MBUS_PARALLEL:
> > > +		break;
> > > +
> > > +	default:
> > > +		dev_err(&sensor->client->dev, "unsupported bus type %u\n",
> > > +			sensor->bus_cfg.bus_type);
> > > +		ret = -EINVAL;
> > > +		goto error;
> > > +	}
> > > +
> > > +	return 0;
> > > +
> > > +error:
> > > +	v4l2_fwnode_endpoint_free(&sensor->bus_cfg);
> > > +	return ret;
> > > +}
> 
> [snip]
> 
> > > +static const struct i2c_device_id mt9m114_id[] = {
> > > +	{ "mt9m114", 0 },
> > > +	{ },
> > > +};
> > > +
> > > +MODULE_DEVICE_TABLE(i2c, mt9m114_id);
> > > +
> > > +static struct i2c_driver mt9m114_driver = {
> > > +	.driver = {
> > > +		.owner	= THIS_MODULE,
> > > +		.name	= "mt9m114",
> > > +	},
> > > +	.probe		= mt9m114_probe,
> > > +	.remove		= mt9m114_remove,
> > > +	.id_table	= mt9m114_id,
> > 
> > No OF or ACPI ID table? Really?
> 
> I have no idea what ACPI IDs this device would have, and OF isn't
> required, the I2C subsystem strips the vendor prefix from the compatible
> string and matches against i2c_driver.id_table.

If this driver is intended to work on a DT based system, it needs to have a
compatible string associated with it. The I²C ID table is meant to be used
with e.g. platform data.

-- 
Kind regards,

Sakari Ailus
