Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 167DE1BF48F
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 11:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726797AbgD3Jxk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 05:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726378AbgD3Jxj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 05:53:39 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4E3EC035494
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2020 02:53:39 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jU5ss-0005Ec-9R; Thu, 30 Apr 2020 11:53:34 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jU5sq-0006tx-Rv; Thu, 30 Apr 2020 11:53:32 +0200
Date:   Thu, 30 Apr 2020 11:53:32 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Robert Foss <robert.foss@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Maxime Ripard <maxime@cerno.tech>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v6 2/3] media: ov8856: Add devicetree support
Message-ID: <20200430095332.GC2188@pengutronix.de>
References: <20200429162437.2025699-1-robert.foss@linaro.org>
 <20200429162437.2025699-3-robert.foss@linaro.org>
 <20200430093524.GB2188@pengutronix.de>
 <20200430094549.GF867@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430094549.GF867@valkosipuli.retiisi.org.uk>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:50:15 up 68 days, 21:07, 160 users,  load average: 7.64, 3.60,
 2.62
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 20-04-30 12:45, Sakari Ailus wrote:
> Hi Marco,
> 
> On Thu, Apr 30, 2020 at 11:35:24AM +0200, Marco Felsch wrote:
> > Hi Robert,
> > 
> > thnakf for the patch but pls keep in mind to do one thing per patch.
> > IMHO this patch do a lot more. Anyway below are my comment :)
> > 
> > On 20-04-29 18:24, Robert Foss wrote:
> > > Add match table, enable ov8856_probe() to support
> > > both ACPI and DT modes.
> > 
> > You are also adding the support for reset-gpios and regualtors. IMHO the
> > commit message don't belong to the changes you made anymore.
> > 
> > > ACPI and DT modes are primarily distinguished from
> > > each other by relying on devm_XXX_get_optional()
> > > will return NULL instead of a reference for the
> > > desired managed resource.
> > > 
> > > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > > ---
> > > 
> > > - Changes since v5:
> > >   * Maxime & Sakari: Replaced clock tolerance check with warning
> > > 
> > > - Changes since v4:
> > >   * Maxime & Sakari: Switch to clock-frequency
> > > 
> > > - Changes since v3:
> > >   * Remove redundant {}-brackets
> > >   * Compare xvclk_rate to 5% tolerance
> > >   * Andy: Use dev_fwnode()
> > >   * Andy: Use %pe instead of %ld + PTR_ERR()
> > >   * Andy: Invert reset_gpio logic
> > >   * Andy: Remove dev_dbg() from failing reset_gpio setup
> > >   * Andy: Use dev_err for logging for failures
> > >   * Andy: Remove dev_warn from EDEFER/regulator error path
> > >   * Andy & Sakari: Replaced GPIOD_OUT_XXX with 0/1
> > >   * Maxime & Sakari: Verify clock frequency from DT
> > >   * Sakari: Verify the 'xvclk_rate' is set correctly for ACPI/DT devices
> > >   * Sakari: Remove duplicate ov8856->dev assignment
> > > 
> > > - Changes since v2:
> > >   * Added "struct device *dev" member to struct ov8856
> > >   * Andy: Switch to optional version of devm_gpiod_get
> > >   * Andy: Switch to optional version of devm_clk_get
> > >   * Fabio: Add reset sleep period
> > >   * Sakari: Unify defines for 19.2Mhz
> > >   * Sakari: Remove 24Mhz clock, since it isn't needed for supported modes
> > >   * Sakari: Replace dev_info() with dev_dbg()
> > >   * Sakari: Switch induction variable type to unsigned
> > >   * Sakari: Don't wait for reset_gpio when in ACPI mode
> > >   * Sakari: Pull reset GPIO high on power on failure
> > >   * Sakari: Add power on/off to resume/suspend
> > >   * Sakari: Fix indentation
> > >   * Sakari: Power off during ov8856_remove()
> > >   * Sakari: Don't sleep during power-on in ACPI mode
> > >   * Sakari: Switch to getting xvclk from clk_get_rate
> > > 
> > > - Changes since v1:
> > >   * Andy & Sakari: Make XVCLK optional since to not break ACPI
> > >   * Fabio: Change n_shutdown_gpio name to reset_gpio
> > >   * Fabio: Invert reset_gpio due to GPIO_ACTIVE_HIGH -> GPIO_ACTIVE_LOW change
> > >   * Fabio: Remove empty line
> > >   * Fabio: Remove real error from devm_gpiod_get() failures
> > >   * Sakari: ARRAY_SIZE() directly instead of through OV8856_NUM_SUPPLIES
> > >   * Sakari: Use XVCLK rate as provided by DT
> > > 
> > >  drivers/media/i2c/ov8856.c | 137 +++++++++++++++++++++++++++++++++----
> > >  1 file changed, 123 insertions(+), 14 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
> > > index 8655842af275..4749dc74d5ad 100644
> > > --- a/drivers/media/i2c/ov8856.c
> > > +++ b/drivers/media/i2c/ov8856.c
> > > @@ -3,10 +3,13 @@
> > >  
> > >  #include <asm/unaligned.h>
> > >  #include <linux/acpi.h>
> > > +#include <linux/clk.h>
> > >  #include <linux/delay.h>
> > > +#include <linux/gpio/consumer.h>
> > >  #include <linux/i2c.h>
> > >  #include <linux/module.h>
> > >  #include <linux/pm_runtime.h>
> > > +#include <linux/regulator/consumer.h>
> > >  #include <media/v4l2-ctrls.h>
> > >  #include <media/v4l2-device.h>
> > >  #include <media/v4l2-fwnode.h>
> > > @@ -18,7 +21,7 @@
> > >  #define OV8856_LINK_FREQ_360MHZ		360000000ULL
> > >  #define OV8856_LINK_FREQ_180MHZ		180000000ULL
> > >  #define OV8856_SCLK			144000000ULL
> > > -#define OV8856_MCLK			19200000
> > > +#define OV8856_XVCLK_19_2		19200000
> > >  #define OV8856_DATA_LANES		4
> > >  #define OV8856_RGB_DEPTH		10
> > >  
> > > @@ -64,6 +67,12 @@
> > >  
> > >  #define to_ov8856(_sd)			container_of(_sd, struct ov8856, sd)
> > >  
> > > +static const char * const ov8856_supply_names[] = {
> > > +	"dovdd",	/* Digital I/O power */
> > > +	"avdd",		/* Analog power */
> > > +	"dvdd",		/* Digital core power */
> > > +};
> > > +
> > >  enum {
> > >  	OV8856_LINK_FREQ_720MBPS,
> > >  	OV8856_LINK_FREQ_360MBPS,
> > > @@ -566,6 +575,11 @@ struct ov8856 {
> > >  	struct media_pad pad;
> > >  	struct v4l2_ctrl_handler ctrl_handler;
> > >  
> > > +	struct device		*dev;
> > > +	struct clk		*xvclk;
> > > +	struct gpio_desc	*reset_gpio;
> > > +	struct regulator_bulk_data supplies[ARRAY_SIZE(ov8856_supply_names)];
> > > +
> > >  	/* V4L2 Controls */
> > >  	struct v4l2_ctrl *link_freq;
> > >  	struct v4l2_ctrl *pixel_rate;
> > > @@ -908,6 +922,52 @@ static int ov8856_set_stream(struct v4l2_subdev *sd, int enable)
> > >  	return ret;
> > >  }
> > >  
> > > +static int __ov8856_power_on(struct ov8856 *ov8856)
> > > +{
> > > +	struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
> > > +	int ret;
> > > +
> > > +	ret = clk_prepare_enable(ov8856->xvclk);
> > 
> > You're request the clk only in DT case or do I miss something? If so you
> > have to check if the clk is available.
> > 
> > > +	if (ret < 0) {
> > > +		dev_err(&client->dev, "failed to enable xvclk\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	if (is_acpi_node(dev_fwnode(ov8856->dev)))
> > > +		return 0;
> > > +
> > > +	if (ov8856->reset_gpio) {
> > > +		gpiod_set_value_cansleep(ov8856->reset_gpio, 1);
> > > +		usleep_range(1000, 2000);
> > > +	}
> > > +
> > > +	ret = regulator_bulk_enable(ARRAY_SIZE(ov8856_supply_names),
> > > +				    ov8856->supplies);
> > > +	if (ret < 0) {
> > > +		dev_err(&client->dev, "failed to enable regulators\n");
> > > +		goto disable_clk;
> > > +	}
> > > +
> > > +	gpiod_set_value_cansleep(ov8856->reset_gpio, 0);
> > 
> > You need to check the existance of the gpio here too.
> 
> No need to; the GPIO framework can handle this internally.

Ahh, I said nothing :) so all my comments about that can be dropped. 

> > > +	usleep_range(1500, 1800);
> > > +
> > > +	return 0;
> > > +
> > > +disable_clk:
> > > +	gpiod_set_value_cansleep(ov8856->reset_gpio, 1);
> > 
> > And here.. pls check the whole patch.
> > 
> > > +	clk_disable_unprepare(ov8856->xvclk);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static void __ov8856_power_off(struct ov8856 *ov8856)
> > > +{
> > > +	gpiod_set_value_cansleep(ov8856->reset_gpio, 1);
> > > +	regulator_bulk_disable(ARRAY_SIZE(ov8856_supply_names),
> > > +			       ov8856->supplies);
> > > +	clk_disable_unprepare(ov8856->xvclk);
> > 
> > Clk is only availabel in DT use-case.
> > 
> > > +}
> > > +
> > >  static int __maybe_unused ov8856_suspend(struct device *dev)
> > >  {
> > >  	struct i2c_client *client = to_i2c_client(dev);
> > > @@ -918,6 +978,7 @@ static int __maybe_unused ov8856_suspend(struct device *dev)
> > >  	if (ov8856->streaming)
> > >  		ov8856_stop_streaming(ov8856);
> > >  
> > > +	__ov8856_power_off(ov8856);
> > >  	mutex_unlock(&ov8856->mutex);
> > >  
> > >  	return 0;
> > > @@ -931,6 +992,8 @@ static int __maybe_unused ov8856_resume(struct device *dev)
> > >  	int ret;
> > >  
> > >  	mutex_lock(&ov8856->mutex);
> > > +
> > > +	__ov8856_power_on(ov8856);
> > >  	if (ov8856->streaming) {
> > >  		ret = ov8856_start_streaming(ov8856);
> > >  		if (ret) {
> > > @@ -1092,29 +1155,54 @@ static int ov8856_identify_module(struct ov8856 *ov8856)
> > >  	return 0;
> > >  }
> > >  
> > > -static int ov8856_check_hwcfg(struct device *dev)
> > > +static int ov8856_get_hwcfg(struct ov8856 *ov8856)
> > >  {
> > > +	struct device *dev = ov8856->dev;
> > >  	struct fwnode_handle *ep;
> > >  	struct fwnode_handle *fwnode = dev_fwnode(dev);
> > >  	struct v4l2_fwnode_endpoint bus_cfg = {
> > >  		.bus_type = V4L2_MBUS_CSI2_DPHY
> > >  	};
> > > -	u32 mclk;
> > > +	u32 xvclk_rate;
> > >  	int ret;
> > >  	unsigned int i, j;
> > >  
> > >  	if (!fwnode)
> > >  		return -ENXIO;
> > >  
> > > -	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
> > > +	ret = fwnode_property_read_u32(fwnode, "clock-frequency",
> > > +		&xvclk_rate);
> > >  	if (ret)
> > >  		return ret;
> > >  
> > > -	if (mclk != OV8856_MCLK) {
> > > -		dev_err(dev, "external clock %d is not supported", mclk);
> > > -		return -EINVAL;
> > > +	if (!is_acpi_node(fwnode)) {
> > > +		ov8856->xvclk = devm_clk_get(dev, "xvclk");
> > > +		if (IS_ERR(ov8856->xvclk)) {
> > > +			dev_err(dev, "could not get xvclk clock (%pe)\n",
> > > +					ov8856->xvclk);
> > > +			return PTR_ERR(ov8856->xvclk);
> > > +		}
> > > +
> > > +		clk_set_rate(ov8856->xvclk, xvclk_rate);
> > > +		xvclk_rate = clk_get_rate(ov8856->xvclk);
> > >  	}
> > 
> > Why do we handle the clock only in DT case? Is there a problem with the
> > clock handling and ACPI?
> 
> Not really, it's just that ACPI does not provide an interface to the clocks
> as such.

But you will get a clk by devm_clk_get()?

> 
> -- 
> Regards,
> 
> Sakari Ailus
> 
