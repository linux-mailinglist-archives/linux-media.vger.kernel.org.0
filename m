Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45314F0711
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2019 21:36:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729776AbfKEUgN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Nov 2019 15:36:13 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45424 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729775AbfKEUgN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Nov 2019 15:36:13 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B9D2559;
        Tue,  5 Nov 2019 21:36:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1572986170;
        bh=aguWXpot67mxvIbzoIIPctl1Qlw5pLrkCaC+jvxJxn8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AlMWGbkUhbWWuIHTj2GPw8Vq4LQlw51EmLxdtK+HtOS2AQr3ipsdg7AnBIHJhplgO
         6Na8N12uz+gm9bo8GI1dWnaIoFxFIhosGVCJ94NM6+vlvHsaxOob1cGsogn8LRF2YM
         kgmdzG4vx8BImBr9Yt4XOSaJD02yEtXJcw8pBDBs=
Date:   Tue, 5 Nov 2019 22:36:00 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] media: i2c: IMX296 camera sensor driver
Message-ID: <20191105203600.GD4869@pendragon.ideasonboard.com>
References: <20191031132309.10965-1-laurent.pinchart@ideasonboard.com>
 <20191031142522.GK10211@paasikivi.fi.intel.com>
 <20191104133351.GB4913@pendragon.ideasonboard.com>
 <20191104185903.GE4913@pendragon.ideasonboard.com>
 <20191104213056.GA13879@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191104213056.GA13879@kekkonen.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Mon, Nov 04, 2019 at 11:30:56PM +0200, Sakari Ailus wrote:
> On Mon, Nov 04, 2019 at 08:59:03PM +0200, Laurent Pinchart wrote:
> > On Mon, Nov 04, 2019 at 03:33:51PM +0200, Laurent Pinchart wrote:
> >> On Thu, Oct 31, 2019 at 04:25:22PM +0200, Sakari Ailus wrote:
> >>> On Thu, Oct 31, 2019 at 03:23:09PM +0200, Laurent Pinchart wrote:
> >>>> The IMX296LLR is a monochrome 1.60MP CMOS sensor from Sony. The driver
> >>>> supports cropping and binning (but not both at the same time due to
> >>>> hardware limitations) and exposure, gain, vertical blanking and test
> >>>> pattern controls.
> >>>> 
> >>>> Preliminary support is also included for the color IMX296LQR sensor.
> >>>> 
> >>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>> ---
> >>>> This driver is a parallel implementation of IMX296 support, compatible
> >>>> with the DT bindings submitted by Mani in
> >>>> https://lore.kernel.org/linux-media/20191030094902.32582-1-manivannan.sadhasivam@linaro.org/.
> >>>> 
> >>>>  drivers/media/i2c/Kconfig  |   12 +
> >>>>  drivers/media/i2c/Makefile |    1 +
> >>>>  drivers/media/i2c/imx296.c | 1026 ++++++++++++++++++++++++++++++++++++
> >>>>  3 files changed, 1039 insertions(+)
> >>>>  create mode 100644 drivers/media/i2c/imx296.c
> > 
> > [snip]
> > 
> >>>> diff --git a/drivers/media/i2c/imx296.c b/drivers/media/i2c/imx296.c
> >>>> new file mode 100644
> >>>> index 000000000000..4140637983fd
> >>>> --- /dev/null
> >>>> +++ b/drivers/media/i2c/imx296.c
> > 
> > [snip]
> > 
> >>>> +static int imx296_power_on(struct imx296 *imx)
> >>>> +{
> >>>> +	int ret;
> >>>> +
> >>>> +	ret = regulator_enable(imx->supply);
> >>>> +	if (ret < 0)
> >>>> +		return ret;
> >>>> +
> >>>> +	udelay(1);
> >>>> +
> >>>> +	ret = gpiod_direction_output(imx->reset, 0);
> >>>> +	if (ret < 0)
> >>>> +		goto err_supply;
> >>>> +
> >>>> +	udelay(1);
> >>>> +
> >>>> +	ret = clk_prepare_enable(imx->clk);
> >>>> +	if (ret < 0)
> >>>> +		goto err_reset;
> >>>> +
> >>>> +	/*
> >>>> +	 * The documentation doesn't explicitly say how much time is required
> >>>> +	 * after providing a clock and before starting I2C communication. It
> >>>> +	 * mentions a delay of 20µs in 4-wire mode, but tests showed that a
> >>>> +	 * delay of 100µs resulted in I2C communication failures, while 500µs
> >>>> +	 * seems to be enough. Be conservative.
> >>>> +	 */
> >>>> +	usleep_range(1000, 2000);
> >>>> +
> >>>> +	return 0;
> >>>> +
> >>>> +err_reset:
> >>>> +	gpiod_direction_output(imx->reset, 1);
> >>>> +err_supply:
> >>>> +	regulator_disable(imx->supply);
> >>>> +	return ret;
> >>> 
> >>> Could you switch to runtime PM? It's not hard. See e.g.
> >>> drivers/media/i2c/ov5670.c for an example. Or, for a more complete example,
> >>> the smiapp driver. :-)
> >> 
> >> I'll give it a try.
> > 
> > I was expecting the MC and V4L2 core to deal with PM but they don't seem
> > to. Do I thus understand correctly that switching to runtime PM will
> > cause the full power on sequence to happen at stream on time ? This can
> > lead to a significant delay when starting the stream.
> > 
> > Furthermore, if nothing else than the driver deals with runtime PM,
> > what's the advantage of using the runtime PM API over calling the power
> > on/off at stream on/off time manually ?
> 
> Runtime PM abstracts power management for drivers, so drivers don't need,
> for instance, to know the system firmware type for its own sake. (On DT the
> driver still needs to implement runtime PM callbacks for device resume and
> suspend, for instance.)
> 
> But on ACPI you effectively need runtime PM if you want some kind of
> dynamic power management to take place. Runtime PM also takes into account
> managing power for device's parents and other things there are no
> alternatives for.
> 
> So there's really little excuse of not supporting runtime PM if the device
> isn't going to be always powered on.

You're pushing a requirement of ACPI platforms down to OF platforms,
where it can introduce a regression as driver-centric PM may lead to
larger delays when starting the stream compared to the traditional
.s_power() method.

Granted, .s_power() is ill-defined, and power management rules are not
clear, especially in the application-facing APIs. Switching this driver
to use runtime PM would hardly make a noticeable difference in the big
picture. This being said, we have a broken PM model for V4L2 camera
sensors, and we'll have to address the issue one way or another. I'm
pretty sure the only reason why we managed to get away with is it that
high performance products are not shipped with a mainline kernel.

Another item to add to the wish list for a proper kernel camera API :-)

-- 
Regards,

Laurent Pinchart
