Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A35A54AB272
	for <lists+linux-media@lfdr.de>; Sun,  6 Feb 2022 22:42:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237144AbiBFVmG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Feb 2022 16:42:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230392AbiBFVmF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Feb 2022 16:42:05 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B0DBC06173B
        for <linux-media@vger.kernel.org>; Sun,  6 Feb 2022 13:42:02 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6198E739;
        Sun,  6 Feb 2022 22:42:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644183720;
        bh=weYoa3sarYSU8w5+VUZbogFE/e6WfaY6b3dUakU8Wc4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=te98AaM8p3YtwJAnai05tLS1g7WhJqcbOkHpuEjdWOTkCbWb1NO1Zmx8cR7EoQI1E
         RwLmAv1qi7kvoPhusIXJk8RCj78bBht3p0D/GJyxjL6Gaq9Cu4FzpdDIcvPB3U2BKq
         y+K15Ix5V8ByEtIheN2D5u7LOqfEfqYpE1cllfqA=
Date:   Sun, 6 Feb 2022 23:41:58 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: Add driver for On Semiconductor MT9M114
 camera sensor
Message-ID: <YgBAppgFJmIHeYxS@pendragon.ideasonboard.com>
References: <20200511233456.9722-1-laurent.pinchart@ideasonboard.com>
 <20200511233456.9722-2-laurent.pinchart@ideasonboard.com>
 <20200512225529.GB867@valkosipuli.retiisi.org.uk>
 <20200513000027.GL28527@pendragon.ideasonboard.com>
 <20200513115356.GC867@valkosipuli.retiisi.org.uk>
 <20200513123640.GE5945@pendragon.ideasonboard.com>
 <20200513151219.GE867@valkosipuli.retiisi.org.uk>
 <20200516223808.GD17970@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200516223808.GD17970@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Reviving this old mail thread, as there are a few open questions. I
don't think they're blocking though, so I'll post a new version of the
driver for review soon

On Sun, May 17, 2020 at 01:38:08AM +0300, Laurent Pinchart wrote:
> On Wed, May 13, 2020 at 06:12:19PM +0300, Sakari Ailus wrote:
> > On Wed, May 13, 2020 at 03:36:40PM +0300, Laurent Pinchart wrote:
> > > On Wed, May 13, 2020 at 02:53:56PM +0300, Sakari Ailus wrote:
> > > > On Wed, May 13, 2020 at 03:00:27AM +0300, Laurent Pinchart wrote:
> > > > > On Wed, May 13, 2020 at 01:55:29AM +0300, Sakari Ailus wrote:
> > > > > > On Tue, May 12, 2020 at 02:34:56AM +0300, Laurent Pinchart wrote:
> > > > > > > The MT9M114 is a CMOS camera sensor that combines a 1296x976 pixel array
> > > > > > > with a 10-bit dynamic range together with an internal ISP. The driver
> > > > > > > exposes two subdevs, one for the pixel array and one for the ISP (named
> > > > > > > IFP for Image Flow Processor). Major supported features are
> > > > > > > 
> > > > > > > - Full configuration of analog crop and binning in the pixel array
> > > > > > > - Full configuration of scaling in the ISP
> > > > > > > - Automatic exposure and white balance
> > > > > > > - Manual exposure and analog gain
> > > > > > > - Horizontal and vertical flip
> > > > > > > 
> > > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > > > ---
> > > > > > >  MAINTAINERS                 |    1 +
> > > > > > >  drivers/media/i2c/Kconfig   |   10 +
> > > > > > >  drivers/media/i2c/Makefile  |    1 +
> > > > > > >  drivers/media/i2c/mt9m114.c | 2161 +++++++++++++++++++++++++++++++++++
> > > > > > >  4 files changed, 2173 insertions(+)
> > > > > > >  create mode 100644 drivers/media/i2c/mt9m114.c
> > > > > 
> > > > > [snip]
> > > > > 
> > > > > > > diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..7f70ae2865b8
> > > > > > > --- /dev/null
> > > > > > > +++ b/drivers/media/i2c/mt9m114.c
> > > > > 
> > > > > [snip]
> > > > > 
> > > > > > > +static int mt9m114_pa_s_ctrl(struct v4l2_ctrl *ctrl)
> > > > > > > +{
> > > > > > > +	struct mt9m114 *sensor = pa_ctrl_to_mt9m114(ctrl);
> > > > > > > +	int ret = 0;
> > > > > > > +
> > > > > > > +	switch (ctrl->id) {
> > > > > > > +	case V4L2_CID_EXPOSURE_ABSOLUTE:
> > > > > > > +		mt9m114_write(sensor,
> > > > > > > +			      MT9M114_CAM_SENSOR_CONTROL_COARSE_INTEGRATION_TIME,
> > > > > > > +			      ctrl->val / MT9M114_LINE_LENGTH, &ret);
> > > > > > 
> > > > > > Hmm. I'd introduce a separate control for the fine exposure time. We'll
> > > > > > need it in any case, and this would also allow setting just the coarse
> > > > > > exposure time.
> > > > > > 
> > > > > > What do you think?
> > > > > 
> > > > > I've re-read the documentation of the V4L2_CID_EXPOSURE_ABSOLUTE
> > > > > control, and it's documented as being expressed in multiples of 100µs.
> > > > 
> > > > It says "should". Indeed this is not the case for raw sensors. We could
> > > > update the documentation, I think.
> > > > 
> > > > > Clearly not a good fit here :-S The ov9650 driver suffers from the same
> > > > > problem. All the other sensor drievrs use V4L2_CID_EXPOSURE, whose unit
> > > > > is not defined. Do we need to introduce V4L2_CID_EXPOSURE_COARSE and
> > > > > V4L2_CID_EXPOSURE_FINE ? It would get messy with so many ways to control
> > > > 
> > > > I'm not opposed to that in principle. But what do we do with all the
> > > > current drivers in that case? They use V4L2_CID_EXPOSURE_ABSOLUTE.
> > > 
> > > No, all sensor drivers except one use V4L2_CID_EXPOSURE, not
> > > V4L2_CID_EXPOSURE_ABSOLUTE. It's thus V4L2_CID_EXPOSURE that we would
> > > need to document as being expressed in lines for sensors (but in that
> > > case we'll likely have a large number of drivers that misuse it).
> > 
> > Right, we had two controls for exposure indeed. I think there could be
> > drivers that use V4L2_CID_EXPOSURE with another unit. Worth checking
> > perhaps. Either way, we could add that unit to the documentation of the
> > V4L2_CID_EXPOSURE as a recommendation or a requirement.
> 
> A quick check showed the following units:
> 
> - mt9m032, mt9p031, mt9t001, mt9v011, mt9v032, smiapp: lines
> - ov7670: not documented, seems to be lines
> - m5mols: not documented
> - sk56aa, sk5kbaf: µs
> - sr030pc30: ms
> 
> In the soc-camera drivers, we have
> 
> - mt9m001, mt9t031, mt9v022: 1/256 * total number of lines
> - ov6650: not documented
> 
> I wouldn't care too much about those though.
> 
> The control is also used in the pwc and gspca drivers, with unspecified
> units.
> 
> I think we could thus document the recommended units as a number of
> lines if desired.
> 
> > > > > the exposure time :-S Or should we document V4L2_CID_EXPOSURE as being
> > > > > expressed in lines for new drivers, and add V4L2_CID_EXPOSURE_FINE to be
> > > > > expressed in pixels ? What would two separate control for coarse and
> > > > > fine exposures bring us, compared to expressing the exposure time in
> > > > > pixels ?
> > > > 
> > > > It takes time to do the writes over the I²C bus. At higher frame rates it
> > > > become increasingly risky, and the least risk is indeed often preferred.
> 
> By the way, the driver could still handle a single V4L2_CID_EXPOSURE
> control expresses in pixels efficiently, by only writing the registers
> that change.
> 
> > > What do you propose then ? Adding V4L2_CID_EXPOSURE_FINE ? In addition
> > > to V4L2_CID_EXPOSURE ? How should V4L2_CID_EXPOSURE be documented ? And
> > > how should V4L2_CID_EXPOSURE_FINE be documented for that matter ?
> > 
> > The unit of the new control would need to be pixels.
> 
> Do you thus recommend updating the documentation of V4L2_CID_EXPOSURE to
> state the unit is lines, and creating a new V4L2_CID_EXPOSURE_FINE
> expressed in pixels ?

This is one of the open questions. In v2 I'll switch to the
V4L2_CID_EXPOSURE control and map it to the coarse integration time.

> > > > > > > +		mt9m114_write(sensor,
> > > > > > > +			      MT9M114_CAM_SENSOR_CONTROL_FINE_INTEGRATION_TIME,
> > > > > > > +			      ctrl->val % MT9M114_LINE_LENGTH, &ret);
> > > > > > > +		break;
> > > > > > > +
> > > > > > > +	case V4L2_CID_ANALOGUE_GAIN:
> > > > > > > +		/*
> > > > > > > +		 * The CAM_SENSOR_CONTROL_ANALOG_GAIN contains linear analog
> > > > > > > +		 * gain values that are mapped to the GLOBAL_GAIN register
> > > > > > > +		 * values by the sensor firmware.
> > > > > > > +		 */
> > > > > > > +		mt9m114_write(sensor, MT9M114_CAM_SENSOR_CONTROL_ANALOG_GAIN,
> > > > > > > +			      ctrl->val, &ret);
> > > > > > > +		break;
> > > > > > > +
> > > > > > > +	default:
> > > > > > > +		return -EINVAL;
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	return ret;
> > > > > > > +}
> > > > > 
> > > > > [snip]
> > > > > 
> > > > > > > +static int mt9m114_pa_get_fmt(struct v4l2_subdev *sd,
> > > > > > > +			      struct v4l2_subdev_pad_config *cfg,
> > > > > > > +			      struct v4l2_subdev_format *fmt)
> > > > > > > +{
> > > > > > > +	struct mt9m114 *sensor = pa_to_mt9m114(sd);
> > > > > > > +
> > > > > > > +	fmt->format = *__mt9m114_pa_get_pad_format(sensor, cfg, fmt->pad,
> > > > > > > +						   fmt->which);
> > > > > > 
> > > > > > I believe these need to be serialised with e.g. a mutex. Same for set
> > > > > > below.
> > > > > 
> > > > > You're right, I'll fix that. All this is a bit inefficient though, as
> > > > > the ioctl are already serialized in subdev_do_ioctl_lock(), so there
> > > > 
> > > > They are not, as lock is always NULL. Drivers are still responsible for
> > > > doing this. This would seem to need some kind of a rework; acquiring a
> > > > mutex should be done to the calls independently of whether they are done
> > > > through IOCTLs or from other drivers.
> > > 
> > > My point is that there are two layers of locking, which isn't a nice
> > > implementation. Locking in subdev drivers is too complicated in general.
> > > Out of scope for this patch series of course.
> > 
> > Agreed. The locking could be moved from drivers to the framework, but it
> > wouldn't be a trivial task. As of now, the framework does not provide
> > locking for sub-device nodes.
> 
> Clearly not a task I want to tackle now :-)
> 
> > > > > would be double-locking, but that's required when the subdev operations
> > > > > are called within the kernel. Oh well... :-(
> > > > > 
> > > > > > > +	return 0;
> > > > > > > +}
> > > > > > > +
> > > > > > > +static int mt9m114_pa_set_fmt(struct v4l2_subdev *sd,
> > > > > > > +			      struct v4l2_subdev_pad_config *cfg,
> > > > > > > +			      struct v4l2_subdev_format *fmt)
> > > > > > > +{
> > > > > > > +	struct mt9m114 *sensor = pa_to_mt9m114(sd);
> > > > > > > +	struct v4l2_mbus_framefmt *format;
> > > > > > > +	struct v4l2_rect *crop;
> > > > > > > +	unsigned int hscale;
> > > > > > > +	unsigned int vscale;
> > > > > > > +
> > > > > > > +	crop = __mt9m114_pa_get_pad_crop(sensor, cfg, fmt->pad, fmt->which);
> > > > > > > +	format = __mt9m114_pa_get_pad_format(sensor, cfg, fmt->pad, fmt->which);
> > > > > > > +
> > > > > > > +	/* The sensor can bin horizontally and vertically. */
> > > > > > > +	hscale = DIV_ROUND_CLOSEST(crop->width, fmt->format.width ? : 1);
> > > > > > > +	vscale = DIV_ROUND_CLOSEST(crop->height, fmt->format.height ? : 1);
> > > > > > > +	format->width = crop->width / clamp(hscale, 1U, 2U);
> > > > > > > +	format->height = crop->height / clamp(vscale, 1U, 2U);
> > > > > > > +
> > > > > > > +	fmt->format = *format;
> > > > > > > +
> > > > > > > +	return 0;
> > > > > > > +}
> > > > > > > +
> > > > > > > +static int mt9m114_pa_get_selection(struct v4l2_subdev *sd,
> > > > > > > +				    struct v4l2_subdev_pad_config *cfg,
> > > > > > > +				    struct v4l2_subdev_selection *sel)
> > > > > > > +{
> > > > > > > +	struct mt9m114 *sensor = pa_to_mt9m114(sd);
> > > > > > > +
> > > > > > > +	switch (sel->target) {
> > > > > > > +	case V4L2_SEL_TGT_CROP:
> > > > > > > +		sel->r = *__mt9m114_pa_get_pad_crop(sensor, cfg, sel->pad,
> > > > > > > +						    sel->which);
> > > > > > > +		return 0;
> > > > > > > +
> > > > > > > +	case V4L2_SEL_TGT_CROP_DEFAULT:
> > > > > > > +	case V4L2_SEL_TGT_CROP_BOUNDS:
> > > > > > > +		sel->r.left = 0;
> > > > > > > +		sel->r.top = 0;
> > > > > > > +		sel->r.width = MT9M114_PIXEL_ARRAY_WIDTH;
> > > > > > > +		sel->r.height = MT9M114_PIXEL_ARRAY_HEIGHT;
> > > > > > > +		return 0;
> > > > > > > +
> > > > > > 
> > > > > > Could you add NATIVE_SIZE target?
> > > > > 
> > > > > Sure. The sensor has optical dark pixels, but I don't see a way in the
> > > > > datasheet to read the dark lines out (they're used by the internal ISP).
> > > > > I will thus set the native size as equal to the crop bounds.
> > > > > 
> > > > > The V4L2 documentation could really benefit from clarifying the native
> > > > > size and crop bounds targets by the way, it's awfully underspecified
> > > > > (and as a result I would guess that 99% of the drivers get it wrong).
> > > > 
> > > > The crop bounds are effectively the same in this case. But the crop bounds
> > > > (and crop) targets are used in a lot of different cases, too.
> > > > 
> > > > This is indeed a little grey area as sensor implementations differ. Those
> > > > black pixels may still affect timing, but some devices probably don't even
> > > > document them.
> > > 
> > > That doesn't tell me how you think the crop bounds and native size
> > > should be defined when there are dark pixels :-) We can discuss it
> > > separately, but I think it requires a discussion.
> > 
> > Right now, I guess I'd just use what the sensor transmits on the bus, and
> > ignore what's inside. We don't have a way to report the rest to the user
> > space anyway, and that generally would only have a very slight impact on
> > timing.
> 
> It still leaves open questions though. It's quite common to have dummy
> lines between the optical dark region and the active region, as the
> transition between optical dark and active may span a few lines. Some
> sensors will read out and transmit those lines, some won't. If we
> include the optical dark lines in the native size, we could have a weird
> rectangle that contains lines that can't be transmitted. If we don't
> include the optical dark lines, we'll need a new API to describe them.
> 
> I think we need to revisit these crop targets, taking into account
> optical dark lines as well as other line types, and clearly specify what
> sensor drivers shall implement. It doesn't have to be done now.

This is also an open question.

> > > > ...
> > > > 
> > > > > > > +static int mt9m114_parse_dt(struct mt9m114 *sensor)
> > > > > > > +{
> > > > > > > +	struct fwnode_handle *fwnode = dev_fwnode(&sensor->client->dev);
> > > > > > > +	struct fwnode_handle *ep;
> > > > > > > +	int ret;
> > > > > > > +
> > > > > > > +	if (!fwnode)
> > > > > > > +		return -ENXIO;
> > > > > > > +
> > > > > > > +	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> > > > > > > +	if (!ep) {
> > > > > > > +		dev_err(&sensor->client->dev, "No endpoint found\n");
> > > > > > > +		return -EINVAL;
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &sensor->bus_cfg);
> > > > > > 
> > > > > > Please initialise the bus type.
> > > > > 
> > > > > Are you fine initializing it to V4L2_MBUS_UNKNOWN ? I don't want to loop
> > > > > over v4l2_fwnode_endpoint_alloc_parse() for all supported bus types.
> > > > 
> > > > Feel free to propose alternatives. Either way, that is probably the most
> > > > simple thing you can do in a driver.
> > > > 
> > > > We don't want to add DT properties just to cover deficiencies in driver
> > > > implementation.
> > > 
> > > The implementation here doesn't depend on additional DT properties as
> > > far as I can tell. I thus don't see the problem with the current code.
> > 
> > Feel free to keep it as-is if it works with the redundant DT properties
> > removed.
> 
> I've tested it again without the DT properties, and everything works fine.
> 
> > ...
> > 
> > > > > > > +static struct i2c_driver mt9m114_driver = {
> > > > > > > +	.driver = {
> > > > > > > +		.owner	= THIS_MODULE,
> > > > > > > +		.name	= "mt9m114",
> > > > > > > +	},
> > > > > > > +	.probe		= mt9m114_probe,
> > > > > > > +	.remove		= mt9m114_remove,
> > > > > > > +	.id_table	= mt9m114_id,
> > > > > > 
> > > > > > No OF or ACPI ID table? Really?
> > > > > 
> > > > > I have no idea what ACPI IDs this device would have, and OF isn't
> > > > > required, the I2C subsystem strips the vendor prefix from the compatible
> > > > > string and matches against i2c_driver.id_table.
> > > > 
> > > > If this driver is intended to work on a DT based system, it needs to have a
> > > > compatible string associated with it. The I²C ID table is meant to be used
> > > > with e.g. platform data.
> > > 
> > > The driver works as-is on DT-based systems, that's what I have tested it
> > > with :-)
> > 
> > Please switch to use of_device_id table and the compatible string.
> 
> I'll add an OF device table, but the I2C id_table has to be kept in
> i2c_driver (there's no OF device table there). Is there any other
> benefit than module auto-loading ?

I'll drop the I2C device ID table and use the OF device ID table in v2.

-- 
Regards,

Laurent Pinchart
