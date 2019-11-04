Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E086DEE7CE
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 19:59:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728392AbfKDS7O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 13:59:14 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:57944 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727998AbfKDS7O (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 13:59:14 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2755131D;
        Mon,  4 Nov 2019 19:59:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1572893951;
        bh=qzMxj/ZL+i3t0ZQTgBAPz3GTcCzf3W/q3F0fMNfjJo8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IDrFHB+hEr3Lktqn2kz0UarqZLnKfbKObkbQ64uwflNLCD0OdjgGjVxoACBWX2tLP
         OmJN201DO3V70Q97sCU2Tg/bChtYAhZ+Dom8uc3rRfm9fY+qDldgSKfYCSMQVY5gpR
         VgdND2XVVZbz2rK/f6ZYrmCCQ355jAn19oj+m52o=
Date:   Mon, 4 Nov 2019 20:59:03 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] media: i2c: IMX296 camera sensor driver
Message-ID: <20191104185903.GE4913@pendragon.ideasonboard.com>
References: <20191031132309.10965-1-laurent.pinchart@ideasonboard.com>
 <20191031142522.GK10211@paasikivi.fi.intel.com>
 <20191104133351.GB4913@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191104133351.GB4913@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Mon, Nov 04, 2019 at 03:33:51PM +0200, Laurent Pinchart wrote:
> On Thu, Oct 31, 2019 at 04:25:22PM +0200, Sakari Ailus wrote:
> > On Thu, Oct 31, 2019 at 03:23:09PM +0200, Laurent Pinchart wrote:
> > > The IMX296LLR is a monochrome 1.60MP CMOS sensor from Sony. The driver
> > > supports cropping and binning (but not both at the same time due to
> > > hardware limitations) and exposure, gain, vertical blanking and test
> > > pattern controls.
> > > 
> > > Preliminary support is also included for the color IMX296LQR sensor.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > This driver is a parallel implementation of IMX296 support, compatible
> > > with the DT bindings submitted by Mani in
> > > https://lore.kernel.org/linux-media/20191030094902.32582-1-manivannan.sadhasivam@linaro.org/.
> > > 
> > >  drivers/media/i2c/Kconfig  |   12 +
> > >  drivers/media/i2c/Makefile |    1 +
> > >  drivers/media/i2c/imx296.c | 1026 ++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 1039 insertions(+)
> > >  create mode 100644 drivers/media/i2c/imx296.c

[snip]

> > > diff --git a/drivers/media/i2c/imx296.c b/drivers/media/i2c/imx296.c
> > > new file mode 100644
> > > index 000000000000..4140637983fd
> > > --- /dev/null
> > > +++ b/drivers/media/i2c/imx296.c

[snip]

> > > +static int imx296_power_on(struct imx296 *imx)
> > > +{
> > > +	int ret;
> > > +
> > > +	ret = regulator_enable(imx->supply);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	udelay(1);
> > > +
> > > +	ret = gpiod_direction_output(imx->reset, 0);
> > > +	if (ret < 0)
> > > +		goto err_supply;
> > > +
> > > +	udelay(1);
> > > +
> > > +	ret = clk_prepare_enable(imx->clk);
> > > +	if (ret < 0)
> > > +		goto err_reset;
> > > +
> > > +	/*
> > > +	 * The documentation doesn't explicitly say how much time is required
> > > +	 * after providing a clock and before starting I2C communication. It
> > > +	 * mentions a delay of 20µs in 4-wire mode, but tests showed that a
> > > +	 * delay of 100µs resulted in I2C communication failures, while 500µs
> > > +	 * seems to be enough. Be conservative.
> > > +	 */
> > > +	usleep_range(1000, 2000);
> > > +
> > > +	return 0;
> > > +
> > > +err_reset:
> > > +	gpiod_direction_output(imx->reset, 1);
> > > +err_supply:
> > > +	regulator_disable(imx->supply);
> > > +	return ret;
> > 
> > Could you switch to runtime PM? It's not hard. See e.g.
> > drivers/media/i2c/ov5670.c for an example. Or, for a more complete example,
> > the smiapp driver. :-)
> 
> I'll give it a try.

I was expecting the MC and V4L2 core to deal with PM but they don't seem
to. Do I thus understand correctly that switching to runtime PM will
cause the full power on sequence to happen at stream on time ? This can
lead to a significant delay when starting the stream.

Furthermore, if nothing else than the driver deals with runtime PM,
what's the advantage of using the runtime PM API over calling the power
on/off at stream on/off time manually ?

> > > +}
> > > +
> > > +static void imx296_power_off(struct imx296 *imx)
> > > +{
> > > +	clk_disable_unprepare(imx->clk);
> > > +	gpiod_direction_output(imx->reset, 1);
> > > +	regulator_disable(imx->supply);
> > > +}
> > > +
> > > +static int imx296_s_power(struct v4l2_subdev *sd, int on)
> > > +{
> > > +	struct imx296 *imx = to_imx296(sd);
> > > +	int ret = 0;
> > > +
> > > +	mutex_lock(imx->ctrls.lock);
> > > +
> > > +	if (imx->power_count == !on) {
> > > +		if (on) {
> > > +			ret = imx296_power_on(imx);
> > > +			if (ret < 0)
> > > +				goto done;
> > > +			ret = imx296_setup(imx);
> > > +			if (ret < 0) {
> > > +				imx296_power_off(imx);
> > > +				goto done;
> > > +			}
> > > +		} else {
> > > +			imx296_power_off(imx);
> > > +		}
> > > +	}
> > > +
> > > +	/* Update the power count. */
> > > +	imx->power_count += on ? 1 : -1;
> > > +	WARN_ON(imx->power_count < 0);
> > > +
> > > +done:
> > > +	mutex_unlock(imx->ctrls.lock);
> > > +	return ret;
> > 
> > And then you can remove this function.
> > 
> > > +}

[snip]

-- 
Regards,

Laurent Pinchart
