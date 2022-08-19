Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6E17599979
	for <lists+linux-media@lfdr.de>; Fri, 19 Aug 2022 12:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348322AbiHSKG3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Aug 2022 06:06:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345562AbiHSKG2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Aug 2022 06:06:28 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0DCEEEF03
        for <linux-media@vger.kernel.org>; Fri, 19 Aug 2022 03:06:26 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1oOytN-0003b6-Nm; Fri, 19 Aug 2022 12:06:17 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1oOytM-0007Hx-PP; Fri, 19 Aug 2022 12:06:16 +0200
Date:   Fri, 19 Aug 2022 12:06:16 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org, akinobu.mita@gmail.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 1/4] media: mt9m111: add V4L2_CID_PIXEL_RATE support
Message-ID: <20220819100616.askwm5e675ov6y3p@pengutronix.de>
References: <20220818144712.997477-1-m.felsch@pengutronix.de>
 <20220818161108.dlmi77o6j7wcyayc@uno.localdomain>
 <20220819075615.a3nuakrac54kn7t3@pengutronix.de>
 <20220819081548.q6c5pwio2z2ambqq@uno.localdomain>
 <20220819090438.72vlat6by3ag6pvd@pengutronix.de>
 <20220819094659.tgngnhr5taup2lhl@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220819094659.tgngnhr5taup2lhl@uno.localdomain>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22-08-19, Jacopo Mondi wrote:
> Hi Marco,
> 
> On Fri, Aug 19, 2022 at 11:04:38AM +0200, Marco Felsch wrote:
> > On 22-08-19, Jacopo Mondi wrote:
> > > Hi Marco
> > >
> > > On Fri, Aug 19, 2022 at 09:56:15AM +0200, Marco Felsch wrote:
> > > > Hi Jacopo,
> > > >
> > > > On 22-08-18, Jacopo Mondi wrote:
> > > > > Hi Marco
> > > > >
> > > > > On Thu, Aug 18, 2022 at 04:47:09PM +0200, Marco Felsch wrote:
> > > > > > Add support to report the PIXEL_RATE so a host or bridge device can ask
> > > > > > the sensor.
> > > > > >
> > > > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > > > ---
> > > > > >  drivers/media/i2c/mt9m111.c | 15 ++++++++++++++-
> > > > > >  1 file changed, 14 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
> > > > > > index afc86efa9e3e..cdaf283e1309 100644
> > > > > > --- a/drivers/media/i2c/mt9m111.c
> > > > > > +++ b/drivers/media/i2c/mt9m111.c
> > > > > > @@ -908,6 +908,8 @@ static int mt9m111_s_ctrl(struct v4l2_ctrl *ctrl)
> > > > > >  		return mt9m111_set_test_pattern(mt9m111, ctrl->val);
> > > > > >  	case V4L2_CID_COLORFX:
> > > > > >  		return mt9m111_set_colorfx(mt9m111, ctrl->val);
> > > > > > +	case V4L2_CID_PIXEL_RATE:
> > > > > > +		return 0;
> > > > >
> > > > > By default PIXEL_RATE is read-only.
> > > > > Do you get a call to s_ctrl for it ?
> > > >
> > > > You're absolutly right, we don't need to do this.
> > > >
> > > > > >  	}
> > > > > >
> > > > > >  	return -EINVAL;
> > > > > > @@ -1249,6 +1251,7 @@ static int mt9m111_probe(struct i2c_client *client)
> > > > > >  {
> > > > > >  	struct mt9m111 *mt9m111;
> > > > > >  	struct i2c_adapter *adapter = client->adapter;
> > > > > > +	unsigned long mclk_rate;
> > > > > >  	int ret;
> > > > > >
> > > > > >  	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA)) {
> > > > > > @@ -1271,6 +1274,13 @@ static int mt9m111_probe(struct i2c_client *client)
> > > > > >  	if (IS_ERR(mt9m111->clk))
> > > > > >  		return PTR_ERR(mt9m111->clk);
> > > > > >
> > > > > > +	ret = clk_prepare_enable(mt9m111->clk);
> > > > > > +	if (ret < 0)
> > > > > > +		return ret;
> > > > > > +
> > > > >
> > > > > Do you need to enable clock to read its rate ?
> > > >
> > > > Yes, accroding the API [1].
> > > >
> > > > [1] https://elixir.bootlin.com/linux/v6.0-rc1/source/include/linux/clk.h#L682
> > >
> > > So weird! none of the drivers I checked do that. The most common
> > > pattern is
> > >
> > >         clk = devm_clk_get();
> > >         rate = clk_get_rate(clk)
> > >         if (rate != RATE)
> > >                 ...
> >
> > Yep, I know. There are a lot of drivers not respecting this.
> >
> 
> I wonder if it's really necessary then :)

I would rather keep in sync with the official API ^^

> > > >
> > > > > > +	mclk_rate = clk_get_rate(mt9m111->clk);
> > > > > > +	clk_disable_unprepare(mt9m111->clk);
> > > > > > +
> > > > > >  	mt9m111->regulator = devm_regulator_get(&client->dev, "vdd");
> > > > > >  	if (IS_ERR(mt9m111->regulator)) {
> > > > > >  		dev_err(&client->dev, "regulator not found: %ld\n",
> > > > > > @@ -1285,7 +1295,7 @@ static int mt9m111_probe(struct i2c_client *client)
> > > > > >  	mt9m111->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> > > > > >  				 V4L2_SUBDEV_FL_HAS_EVENTS;
> > > > > >
> > > > > > -	v4l2_ctrl_handler_init(&mt9m111->hdl, 7);
> > > > > > +	v4l2_ctrl_handler_init(&mt9m111->hdl, 8);
> > > > > >  	v4l2_ctrl_new_std(&mt9m111->hdl, &mt9m111_ctrl_ops,
> > > > > >  			V4L2_CID_VFLIP, 0, 1, 1, 0);
> > > > > >  	v4l2_ctrl_new_std(&mt9m111->hdl, &mt9m111_ctrl_ops,
> > > > > > @@ -1309,6 +1319,9 @@ static int mt9m111_probe(struct i2c_client *client)
> > > > > >  				BIT(V4L2_COLORFX_NEGATIVE) |
> > > > > >  				BIT(V4L2_COLORFX_SOLARIZATION)),
> > > > > >  			V4L2_COLORFX_NONE);
> > > > > > +	v4l2_ctrl_new_std(&mt9m111->hdl, &mt9m111_ctrl_ops, V4L2_CID_PIXEL_RATE,
> > > > > > +			  mclk_rate, mclk_rate, 1, mclk_rate);
> > > > > > +
> > > > >
> > > > > I don't have a datasheet but it seems a little weird that the mclk
> > > > > frequency is the same as the pixel clock rate ?
> > > >
> > > > I see your confusion here. I can only speak for the MT9M131 device which
> > > > is covered by this driver as well. This device is composed of a
> > > > internal-sensor and a internal-isp. The internal-sensor is clocked by
> > > > mclk/2 but the final image device/sensor output-fifo is clocked by mclk.
> > >
> > > No PLL, no rate multiplier/divider ? Does this sensor only work with
> > > one pixel rate that is defined by the input clock rate ?
> > >
> > > > There are options to devide the output clock as well, but these options
> > > > are not enabled yet. So yes, the pixel clock rate == mclk rate. To avoid
> > >
> > > Ah ok
> > >
> > > Could you share your setup mclk, resolution and frame rate to show how
> > > the pixel rate and the mclk rate are related ?
> >
> >
> > mclk:      54 MHz (input)
> > pixelclk:  54 MHz (output)
> > res:       1280x1024
> 
> You should take blankings into account as well, even if I havent'
> found where they are programmed in the driver

Yes, thats right. This is only the actice pixel array.

> > fps:       15
> > bus-width: 8
> > bpp:       16
> >
> > After re-reading the PIXEL_RATE, maybe I missunderstood the control. As
> > of now I thought it is the amount of bytes per second send on the bus.
> 
> Not bytes but pixels :)
> 
> And the above gives me a 19.660.800 Hz pixel rate

Yep, I re-calced this on my side as well and got the same.

> > But the documentation says pixels per second... Is there a control to
> > expose the current pixelclk on the mbus? What I wanna do in the end is
> > to calculate the througput on the (parallel-)bus.
> 
> Not for parallel busses as far as I'm aware as my understanding is
> that CID_LINK_FREQ applies to CSI-2 setups only.

Yes, while I was working on this topic (4 years back) this was the case.
After your good thoughts I re-checked the control and now it is within
[1] and there the parallel bus is mentioned as well. So this is the
correct control :)

[1] ext-ctrls-image-process.rst

> To get the byte rate on the bus I would simply multiply the pixel
> clock by the number of bytes per pixel, in this case 2.

Please see above. My goal is to request the bus-frequency from the
sensor. With that and the knowledge about the bus-width, we can
calculate the bus throughput.

Regards,
  Marco

> >
> > > > confusion I could rename the mclk_rate to extclk_rate but then clock
> > > > request is not 100% correct since we are requesting a "mclk", this
> > > > should be "extclk".
> > >
> > > Doesn't really make a difference!
> > >
> > > A comment in the code to explain what happens would help though!
> >
> > I did that right now, after your confusion :)
> >
> > Regards,
> >   Marco
> >
> > >
> > > >
> > > > Regards,
> > > >   Marco
> > > >
> > > > > >  	mt9m111->subdev.ctrl_handler = &mt9m111->hdl;
> > > > > >  	if (mt9m111->hdl.error) {
> > > > > >  		ret = mt9m111->hdl.error;
> > > > > > --
> > > > > > 2.30.2
> > > > > >
> > > > >
> > >
> 
