Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7495A48151E
	for <lists+linux-media@lfdr.de>; Wed, 29 Dec 2021 17:37:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240795AbhL2Qhc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Dec 2021 11:37:32 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:34658 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240794AbhL2Qhb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Dec 2021 11:37:31 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 75850464;
        Wed, 29 Dec 2021 17:37:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1640795850;
        bh=gFylRxfG7J7G1h+jHQHPkz26zFUxJHgdlzsOV328hVM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oY19D5Nhkgq7XPhmtwQ0Jp/xSiFhI76niDhmOtT2RGP/V0zEjP4k6vwTXqsRmqSqW
         aGjJW7Ul8S4/iw3QWrD9x+ITpxw2FfHn7AvCkhqjNvbx+2ojkjykeFujUJ1DTzTx9G
         /EdjjcT6yj6L4Sbx5gixdqkfIA8xpnHqYFrA0ZDo=
Date:   Wed, 29 Dec 2021 18:37:28 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v2 2/2] media: i2c: IMX296 camera sensor driver
Message-ID: <YcyOyGcj9MYZaix6@pendragon.ideasonboard.com>
References: <20211219220948.28953-1-laurent.pinchart@ideasonboard.com>
 <20211219220948.28953-3-laurent.pinchart@ideasonboard.com>
 <YcHOmEVxvcDwx+M4@paasikivi.fi.intel.com>
 <YcH5RufWI398s232@pendragon.ideasonboard.com>
 <YcJYBKB+Z4XYANgi@paasikivi.fi.intel.com>
 <YcJa53KRgdcEVX2/@pendragon.ideasonboard.com>
 <YcLwWiBL2fU8Zwui@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YcLwWiBL2fU8Zwui@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wed, Dec 22, 2021 at 11:31:06AM +0200, Sakari Ailus wrote:
> On Wed, Dec 22, 2021 at 12:53:27AM +0200, Laurent Pinchart wrote:
> > On Wed, Dec 22, 2021 at 12:41:08AM +0200, Sakari Ailus wrote:
> > > On Tue, Dec 21, 2021 at 05:56:54PM +0200, Laurent Pinchart wrote:
> > > 
> > > ,,,
> > > 
> > > > > > +static int imx296_ctrls_init(struct imx296 *sensor)
> > > > > > +{
> > > > > > +	struct v4l2_fwnode_device_properties props;
> > > > > > +	unsigned int hblank;
> > > > > > +	int ret;
> > > > > > +
> > > > > > +	ret = v4l2_fwnode_device_parse(sensor->dev, &props);
> > > > > > +	if (ret < 0)
> > > > > > +		return ret;
> > > > > > +
> > > > > > +	v4l2_ctrl_handler_init(&sensor->ctrls, 9);
> > > > > > +
> > > > > > +	v4l2_ctrl_new_std(&sensor->ctrls, &imx296_ctrl_ops,
> > > > > > +			  V4L2_CID_EXPOSURE, 1, 1048575, 1, 1104);
> > > > > > +	v4l2_ctrl_new_std(&sensor->ctrls, &imx296_ctrl_ops,
> > > > > > +			  V4L2_CID_ANALOGUE_GAIN, IMX296_GAIN_MIN,
> > > > > > +			  IMX296_GAIN_MAX, 1, IMX296_GAIN_MIN);
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * Horizontal blanking is controlled through the HMAX register, which
> > > > > > +	 * contains a line length in INCK clock units. The INCK frequency is
> > > > > > +	 * fixed to 74.25 MHz. The HMAX value is currently fixed to 1100,
> > > > > 
> > > > > It seems the driver supports other values, too. Shouldn't this be the
> > > > > actual frequency?
> > > > 
> > > > That's not clear to me from the documentation I have access to :-( It's
> > > > quite convoluted, there are a few examples from which I tried to infer
> > > > what was going on, but no clear explanation. My board uses a fixed clock
> > > > frequency of 37.125MHz so I can't test other values.
> > > > 
> > > > Can we start with this and update it later if we can figure out more
> > > > (assuming there's an issue, it may actually be correct already) ?
> > > 
> > > Sounds reasonable. I was just wondering.
> > > 
> > > > > > +	 * convert it to a number of pixels based on the nominal pixel rate.
> > > > > > +	 */
> > > > > > +	hblank = 1100 * 1188000000ULL / 10 / 74250000
> > > > > > +	       - IMX296_PIXEL_ARRAY_WIDTH;
> > > > > > +	sensor->hblank = v4l2_ctrl_new_std(&sensor->ctrls, &imx296_ctrl_ops,
> > > > > > +					   V4L2_CID_HBLANK, hblank, hblank, 1,
> > > > > > +					   hblank);
> > > > > > +	if (sensor->hblank)
> > > > > > +		sensor->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > > > > +
> > > > > > +	sensor->vblank = v4l2_ctrl_new_std(&sensor->ctrls, &imx296_ctrl_ops,
> > > > > > +					   V4L2_CID_VBLANK, 30,
> > > > > > +					   1048575 - IMX296_PIXEL_ARRAY_HEIGHT,
> > > > > > +					   1, 30);
> > > > > > +	/*
> > > > > > +	 * The sensor calculates the MIPI timings internally to achieve a bit
> > > > > > +	 * rate between 1122 and 1198 Mbps. The exact value is unfortunately not
> > > > > > +	 * reported, at least according to the documentation. Report a nominal
> > > > > > +	 * rate of 1188 Mbps as that is used by the datasheet in multiple
> > > > > > +	 * examples.
> > > > > > +	 */
> > > > > > +	v4l2_ctrl_new_std(&sensor->ctrls, NULL, V4L2_CID_PIXEL_RATE,
> > > > > > +			  1122000000 / 10, 1198000000 / 10, 1, 1188000000 / 10);
> > > > > 
> > > > > What about the link frequency?
> > > > > 
> > > > > Is this value constant for the sensor? Or should there be a list of
> > > > > hardware supported link frequencies?
> > > > 
> > > > It seems to be constant, but again the documentation is fairly unclear.
> > > 
> > > Ack.
> > > 
> > > ...
> > > 
> > > > > > +static int __maybe_unused imx296_runtime_resume(struct device *dev)
> > > > > > +{
> > > > > > +	struct i2c_client *client = to_i2c_client(dev);
> > > > > > +	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
> > > > > > +	struct imx296 *sensor = to_imx296(subdev);
> > > > > > +
> > > > > > +	return imx296_power_on(sensor);
> > > > > > +}
> > > > > > +
> > > > > > +static int __maybe_unused imx296_runtime_suspend(struct device *dev)
> > > > > > +{
> > > > > > +	struct i2c_client *client = to_i2c_client(dev);
> > > > > > +	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
> > > > > > +	struct imx296 *sensor = to_imx296(subdev);
> > > > > > +
> > > > > > +	imx296_power_off(sensor);
> > > > > > +
> > > > > > +	return 0;
> > > > > 
> > > > > I'd merge these two with imx296_power_o{n,ff}.
> > > > 
> > > > That would require calling imx296_runtime_resume() and
> > > > imx296_runtime_suspend() in probe() and remove(), which I don't really
> > > > like. I'd prefer keeping the functions separate.
> > > 
> > > You could keep calling the functions imx296_power_o{n,ff}. There's really
> > > no need for two pairs of functions doing the same things.
> > 
> > imx296_power_on() is called in probe() before the subdev is initialized,
> > so the i2c_get_clientdata() call in imx296_runtime_resume() would fail.
> > It may be possible to refactor the probe() function to fix this, but I
> > think that explicit power on/off calls in probe() are clearer than
> > calling the pm runtime resume and suspend handlers.
> 
> They're doing exactly the same things, powering the device on and off. The
> fact that it's used as a runtime PM callback as well as called directly
> doesn't change its nature.
> 
> Most other drivers do it this way actually. What it'd take is a call to
> v4l2_i2c_subdev_init() before powering the sensor on.

I still really dislike it, sorry. I thought I could find a middle ground
by using the runtime PM functions to power up the sensor in probe(), but
that won't work if runtime PM is disabled.

It's fairly common for drivers to have internal functions called by
wrappers whose only purpose is to convert the arguments, I don't see why
it would be a problem here. I think it's actually cleaner and conveys
the purpose better.

-- 
Regards,

Laurent Pinchart
