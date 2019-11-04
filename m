Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BEF9EEB39
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 22:34:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729670AbfKDVe2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 16:34:28 -0500
Received: from mga06.intel.com ([134.134.136.31]:34054 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729636AbfKDVe2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 Nov 2019 16:34:28 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Nov 2019 13:34:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,268,1569308400"; 
   d="scan'208";a="195593176"
Received: from cshanno1-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.252.41.86])
  by orsmga008.jf.intel.com with ESMTP; 04 Nov 2019 13:34:25 -0800
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
        id A3F4321FAF; Mon,  4 Nov 2019 23:30:56 +0200 (EET)
Date:   Mon, 4 Nov 2019 23:30:56 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] media: i2c: IMX296 camera sensor driver
Message-ID: <20191104213056.GA13879@kekkonen.localdomain>
References: <20191031132309.10965-1-laurent.pinchart@ideasonboard.com>
 <20191031142522.GK10211@paasikivi.fi.intel.com>
 <20191104133351.GB4913@pendragon.ideasonboard.com>
 <20191104185903.GE4913@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191104185903.GE4913@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, Nov 04, 2019 at 08:59:03PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Mon, Nov 04, 2019 at 03:33:51PM +0200, Laurent Pinchart wrote:
> > On Thu, Oct 31, 2019 at 04:25:22PM +0200, Sakari Ailus wrote:
> > > On Thu, Oct 31, 2019 at 03:23:09PM +0200, Laurent Pinchart wrote:
> > > > The IMX296LLR is a monochrome 1.60MP CMOS sensor from Sony. The driver
> > > > supports cropping and binning (but not both at the same time due to
> > > > hardware limitations) and exposure, gain, vertical blanking and test
> > > > pattern controls.
> > > > 
> > > > Preliminary support is also included for the color IMX296LQR sensor.
> > > > 
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > ---
> > > > This driver is a parallel implementation of IMX296 support, compatible
> > > > with the DT bindings submitted by Mani in
> > > > https://lore.kernel.org/linux-media/20191030094902.32582-1-manivannan.sadhasivam@linaro.org/.
> > > > 
> > > >  drivers/media/i2c/Kconfig  |   12 +
> > > >  drivers/media/i2c/Makefile |    1 +
> > > >  drivers/media/i2c/imx296.c | 1026 ++++++++++++++++++++++++++++++++++++
> > > >  3 files changed, 1039 insertions(+)
> > > >  create mode 100644 drivers/media/i2c/imx296.c
> 
> [snip]
> 
> > > > diff --git a/drivers/media/i2c/imx296.c b/drivers/media/i2c/imx296.c
> > > > new file mode 100644
> > > > index 000000000000..4140637983fd
> > > > --- /dev/null
> > > > +++ b/drivers/media/i2c/imx296.c
> 
> [snip]
> 
> > > > +static int imx296_power_on(struct imx296 *imx)
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +	ret = regulator_enable(imx->supply);
> > > > +	if (ret < 0)
> > > > +		return ret;
> > > > +
> > > > +	udelay(1);
> > > > +
> > > > +	ret = gpiod_direction_output(imx->reset, 0);
> > > > +	if (ret < 0)
> > > > +		goto err_supply;
> > > > +
> > > > +	udelay(1);
> > > > +
> > > > +	ret = clk_prepare_enable(imx->clk);
> > > > +	if (ret < 0)
> > > > +		goto err_reset;
> > > > +
> > > > +	/*
> > > > +	 * The documentation doesn't explicitly say how much time is required
> > > > +	 * after providing a clock and before starting I2C communication. It
> > > > +	 * mentions a delay of 20µs in 4-wire mode, but tests showed that a
> > > > +	 * delay of 100µs resulted in I2C communication failures, while 500µs
> > > > +	 * seems to be enough. Be conservative.
> > > > +	 */
> > > > +	usleep_range(1000, 2000);
> > > > +
> > > > +	return 0;
> > > > +
> > > > +err_reset:
> > > > +	gpiod_direction_output(imx->reset, 1);
> > > > +err_supply:
> > > > +	regulator_disable(imx->supply);
> > > > +	return ret;
> > > 
> > > Could you switch to runtime PM? It's not hard. See e.g.
> > > drivers/media/i2c/ov5670.c for an example. Or, for a more complete example,
> > > the smiapp driver. :-)
> > 
> > I'll give it a try.
> 
> I was expecting the MC and V4L2 core to deal with PM but they don't seem
> to. Do I thus understand correctly that switching to runtime PM will
> cause the full power on sequence to happen at stream on time ? This can
> lead to a significant delay when starting the stream.
> 
> Furthermore, if nothing else than the driver deals with runtime PM,
> what's the advantage of using the runtime PM API over calling the power
> on/off at stream on/off time manually ?

Runtime PM abstracts power management for drivers, so drivers don't need,
for instance, to know the system firmware type for its own sake. (On DT the
driver still needs to implement runtime PM callbacks for device resume and
suspend, for instance.)

But on ACPI you effectively need runtime PM if you want some kind of
dynamic power management to take place. Runtime PM also takes into account
managing power for device's parents and other things there are no
alternatives for.

So there's really little excuse of not supporting runtime PM if the device
isn't going to be always powered on.

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
