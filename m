Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A81C827533E
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 10:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726405AbgIWIbu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Sep 2020 04:31:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbgIWIbt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Sep 2020 04:31:49 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81BE7C061755;
        Wed, 23 Sep 2020 01:31:49 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 663A9634C87;
        Wed, 23 Sep 2020 11:30:36 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kL0Ae-0002pE-Iu; Wed, 23 Sep 2020 11:30:36 +0300
Date:   Wed, 23 Sep 2020 11:30:36 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>, jonathanh@nvidia.com,
        hverkuil@xs4all.nl, jacopo+renesas@jmondi.org,
        luca@lucaceresoli.net, leonl@leopardimaging.com,
        robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] media: i2c: imx274: Add IMX274 power on and off
 sequence
Message-ID: <20200923083036.GF8644@valkosipuli.retiisi.org.uk>
References: <1600724379-7324-1-git-send-email-skomatineni@nvidia.com>
 <1600724379-7324-4-git-send-email-skomatineni@nvidia.com>
 <20200922075501.GB3994831@ulmo>
 <c79b6253-8476-c51b-ba32-10d464cfa4cb@nvidia.com>
 <20200922162025.GB8644@valkosipuli.retiisi.org.uk>
 <20200923080705.GA1110498@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923080705.GA1110498@ulmo>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 23, 2020 at 10:07:05AM +0200, Thierry Reding wrote:
> On Tue, Sep 22, 2020 at 07:20:25PM +0300, Sakari Ailus wrote:
> > Hi Sowjanya,
> > 
> > On Tue, Sep 22, 2020 at 09:13:57AM -0700, Sowjanya Komatineni wrote:
> > > 
> > > On 9/22/20 12:55 AM, Thierry Reding wrote:
> > > > On Mon, Sep 21, 2020 at 02:39:39PM -0700, Sowjanya Komatineni wrote:
> > > > > IMX274 has analog 2.8V supply, digital core 1.8V supply, and vddl digital
> > > > > io 1.2V supply which are optional based on camera module design.
> > > > > 
> > > > > IMX274 also need external 24Mhz clock and is optional based on
> > > > > camera module design.
> > > > > 
> > > > > This patch adds support for IMX274 power on and off to enable and
> > > > > disable these supplies and external clock.
> > > > > 
> > > > > Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> > > > > Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> > > > > ---
> > > > >   drivers/media/i2c/imx274.c | 184 +++++++++++++++++++++++++++++++++------------
> > > > >   1 file changed, 134 insertions(+), 50 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
> > > > > index 5e515f0..b3057a5 100644
> > > > > --- a/drivers/media/i2c/imx274.c
> > > > > +++ b/drivers/media/i2c/imx274.c
> > > > > @@ -18,7 +18,9 @@
> > > > >   #include <linux/kernel.h>
> > > > >   #include <linux/module.h>
> > > > >   #include <linux/of_gpio.h>
> > > > > +#include <linux/pm_runtime.h>
> > > > >   #include <linux/regmap.h>
> > > > > +#include <linux/regulator/consumer.h>
> > > > >   #include <linux/slab.h>
> > > > >   #include <linux/v4l2-mediabus.h>
> > > > >   #include <linux/videodev2.h>
> > > > > @@ -131,6 +133,15 @@
> > > > >   #define IMX274_TABLE_WAIT_MS			0
> > > > >   #define IMX274_TABLE_END			1
> > > > > +/* regulator supplies */
> > > > > +static const char * const imx274_supply_names[] = {
> > > > > +	"vddl",  /* IF (1.2V) supply */
> > > > > +	"vdig",  /* Digital Core (1.8V) supply */
> > > > > +	"vana",  /* Analog (2.8V) supply */
> > > > According to the device tree bindings these should be uppercase. Did I
> > > > miss a patch that updates the bindings?
> > > > 
> > > > I think the preference is for supply names to be lowercase and given
> > > > that there are no users of this binding yet we could update it without
> > > > breaking any existing device trees.
> > > > 
> > > > > +};
> > > > > +
> > > > > +#define IMX274_NUM_SUPPLIES ARRAY_SIZE(imx274_supply_names)
> > > > > +
> > > > >   /*
> > > > >    * imx274 I2C operation related structure
> > > > >    */
> > > > > @@ -501,6 +512,8 @@ struct imx274_ctrls {
> > > > >    * @frame_rate: V4L2 frame rate structure
> > > > >    * @regmap: Pointer to regmap structure
> > > > >    * @reset_gpio: Pointer to reset gpio
> > > > > + * @supplies: List of analog and digital supply regulators
> > > > > + * @inck: Pointer to sensor input clock
> > > > >    * @lock: Mutex structure
> > > > >    * @mode: Parameters for the selected readout mode
> > > > >    */
> > > > > @@ -514,6 +527,8 @@ struct stimx274 {
> > > > >   	struct v4l2_fract frame_interval;
> > > > >   	struct regmap *regmap;
> > > > >   	struct gpio_desc *reset_gpio;
> > > > > +	struct regulator_bulk_data supplies[IMX274_NUM_SUPPLIES];
> > > > > +	struct clk *inck;
> > > > >   	struct mutex lock; /* mutex lock for operations */
> > > > >   	const struct imx274_mode *mode;
> > > > >   };
> > > > > @@ -726,6 +741,12 @@ static int imx274_start_stream(struct stimx274 *priv)
> > > > >   {
> > > > >   	int err = 0;
> > > > > +	err = __v4l2_ctrl_handler_setup(&priv->ctrls.handler);
> > > > > +	if (err) {
> > > > > +		dev_err(&priv->client->dev, "Error %d setup controls\n", err);
> > > > > +		return err;
> > > > > +	}
> > > > > +
> > > > >   	/*
> > > > >   	 * Refer to "Standby Cancel Sequence when using CSI-2" in
> > > > >   	 * imx274 datasheet, it should wait 10ms or more here.
> > > > > @@ -767,6 +788,66 @@ static void imx274_reset(struct stimx274 *priv, int rst)
> > > > >   	usleep_range(IMX274_RESET_DELAY1, IMX274_RESET_DELAY2);
> > > > >   }
> > > > > +static int imx274_power_on(struct device *dev)
> > > > > +{
> > > > > +	struct i2c_client *client = to_i2c_client(dev);
> > > > > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > > > +	struct stimx274 *imx274 = to_imx274(sd);
> > > > > +	int ret;
> > > > > +
> > > > > +	/* keep sensor in reset before power on */
> > > > > +	imx274_reset(imx274, 0);
> > > > > +
> > > > > +	ret = clk_prepare_enable(imx274->inck);
> > > > > +	if (ret) {
> > > > > +		dev_err(&imx274->client->dev,
> > > > > +			"Failed to enable input clock: %d\n", ret);
> > > > > +		return ret;
> > > > > +	}
> > > > > +
> > > > > +	ret = regulator_bulk_enable(IMX274_NUM_SUPPLIES, imx274->supplies);
> > > > > +	if (ret) {
> > > > > +		dev_err(&imx274->client->dev,
> > > > > +			"Failed to enable regulators: %d\n", ret);
> > > > > +		goto fail_reg;
> > > > > +	}
> > > > > +
> > > > > +	udelay(2);
> > > > This looks like some sort of extra delay to make sure all the supply
> > > > voltages have settled. Should this perhaps be encoded as part of the
> > > > regulator ramp-up times? Or is this really an IC-specific delay that
> > > > is needed for some internal timing?
> > > This is IC-specific delay after power on regulators before releasing reset.
> > > > 
> > > > > +	imx274_reset(imx274, 1);
> > > > > +
> > > > > +	return 0;
> > > > > +
> > > > > +fail_reg:
> > > > > +	clk_disable_unprepare(imx274->inck);
> > > > > +	return ret;
> > > > > +}
> > > > > +
> > > > > +static int imx274_power_off(struct device *dev)
> > > > > +{
> > > > > +	struct i2c_client *client = to_i2c_client(dev);
> > > > > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > > > +	struct stimx274 *imx274 = to_imx274(sd);
> > > > > +
> > > > > +	imx274_reset(imx274, 0);
> > > > > +
> > > > > +	regulator_bulk_disable(IMX274_NUM_SUPPLIES, imx274->supplies);
> > > > > +
> > > > > +	clk_disable_unprepare(imx274->inck);
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +static int imx274_regulators_get(struct device *dev, struct stimx274 *imx274)
> > > > > +{
> > > > > +	unsigned int i;
> > > > > +
> > > > > +	for (i = 0; i < IMX274_NUM_SUPPLIES; i++)
> > > > > +		imx274->supplies[i].supply = imx274_supply_names[i];
> > > > > +
> > > > > +	return devm_regulator_bulk_get(dev, IMX274_NUM_SUPPLIES,
> > > > > +					imx274->supplies);
> > > > > +}
> > > > > +
> > > > >   /**
> > > > >    * imx274_s_ctrl - This is used to set the imx274 V4L2 controls
> > > > >    * @ctrl: V4L2 control to be set
> > > > > @@ -781,6 +862,9 @@ static int imx274_s_ctrl(struct v4l2_ctrl *ctrl)
> > > > >   	struct stimx274 *imx274 = to_imx274(sd);
> > > > >   	int ret = -EINVAL;
> > > > > +	if (!pm_runtime_get_if_in_use(&imx274->client->dev))
> > > > > +		return 0;
> > > > I'm not sure I understand this, and sorry if this has been discussed
> > > > earlier. Aren't there any other mechanisms in place to ensure that a
> > > > control can only be configured when in use? If so, then is this even
> > > > necessary?
> > > > 
> > > > If not, silently ignoring at this point seems like it could cause subtle
> > > > failures by ignoring some control settings and applying others if the
> > > > timing is right.
> > > 
> > > With this patch, v4l2_ctrl setup is moved to start stream so all the control
> > > values selected gets programmed during stream start. So s_ctrl callback
> > > execution happens during that time after sensor rpm resume and I don't think
> > > we need here either but I see all sensor drivers with RPM enabled checking
> > > for this. So added just to make sure sensor programming don't happen when
> > > power is off.
> > > 
> > > Sakari/Jacob,
> > > 
> > > Can you please clarify if we can remove check pm_runtime_get_if_in_use() in
> > > s_ctrl callback as v4l2_ctrl handler setup happens during stream start where
> > > power is already on by then?
> > 
> > The controls are accessible also when streaming is disabled. So you may end
> > up here without the device being powered on. Therefore the check is needed.
> 
> In that case shouldn't this return an error rather than silently
> ignoring the request? From my reading of the code this current
> implementation would allow someone to configure a control while
> streaming is disabled, and that configuration will then succeed
> without doing anything.
> 
> Or am I missing something and all controls will be reapplied when
> streaming resumes and this is actually safe to ignore?

The value of V4L2 controls is not tied to the power state of the device.
The driver is responsible for ensuring the value set by the user is applied
to the hardware when needed. That does not happen immediately if the device
is powered off but it's not an issue.

-- 
Sakari Ailus
