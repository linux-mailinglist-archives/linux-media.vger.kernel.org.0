Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D658B244108
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 00:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726499AbgHMWCd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Aug 2020 18:02:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbgHMWCd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Aug 2020 18:02:33 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BD3EC061757;
        Thu, 13 Aug 2020 15:02:33 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id DA3A9634C87;
        Fri, 14 Aug 2020 01:01:47 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1k6LIB-0001jd-Hd; Fri, 14 Aug 2020 01:01:47 +0300
Date:   Fri, 14 Aug 2020 01:01:47 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, luca@lucaceresoli.net,
        leonl@leopardimaging.com, robh+dt@kernel.org, lgirdwood@gmail.com,
        broonie@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] media: i2c: imx274: Add IMX274 power on and off
 sequence
Message-ID: <20200813220147.GJ840@valkosipuli.retiisi.org.uk>
References: <1595264494-2400-1-git-send-email-skomatineni@nvidia.com>
 <1595264494-2400-3-git-send-email-skomatineni@nvidia.com>
 <20200731162611.GB6401@valkosipuli.retiisi.org.uk>
 <b8819080-6585-c953-e7ad-9b0a10f1d821@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8819080-6585-c953-e7ad-9b0a10f1d821@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sowjanya,

On Fri, Jul 31, 2020 at 09:34:15AM -0700, Sowjanya Komatineni wrote:
> 
> On 7/31/20 9:26 AM, Sakari Ailus wrote:
> > Hi Sowjanya,
> > 
> > Thanks for the patch.
> > 
> > On Mon, Jul 20, 2020 at 10:01:34AM -0700, Sowjanya Komatineni wrote:
> > > IMX274 has VANA analog 2.8V supply, VDIG digital core 1.8V supply,
> > > and VDDL digital io 1.2V supply which are optional based on camera
> > > module design.
> > > 
> > > IMX274 also need external 24Mhz clock and is optional based on
> > > camera module design.
> > The sensor appears to be able to use other frequencies, too. Could you
> > check in the driver the frequency is correct? This should be found in DT
> > bindings, too.
> 
> External input clock is not in DT. So added it as part of this series.
> 
> We are mostly using 24Mhz I/P with IMX274 on designs we have and also on
> leopard module which has onboard XTAL for 24Mhz

Yes. This information still should be found in DT as the xtal isn't part of
the sensor.

> 
> > > This patch adds support for IMX274 power on and off to enable and
> > > disable these supplies and external clock.
> > > 
> > > Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> > > ---
> > >   drivers/media/i2c/imx274.c | 132 +++++++++++++++++++++++++++++++++++++++++++--
> > >   1 file changed, 129 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
> > > index 55869ff..7157b1d 100644
> > > --- a/drivers/media/i2c/imx274.c
> > > +++ b/drivers/media/i2c/imx274.c
> > > @@ -19,6 +19,7 @@
> > >   #include <linux/module.h>
> > >   #include <linux/of_gpio.h>
> > >   #include <linux/regmap.h>
> > > +#include <linux/regulator/consumer.h>
> > >   #include <linux/slab.h>
> > >   #include <linux/v4l2-mediabus.h>
> > >   #include <linux/videodev2.h>
> > > @@ -131,6 +132,15 @@
> > >   #define IMX274_TABLE_WAIT_MS			0
> > >   #define IMX274_TABLE_END			1
> > > +/* regulator supplies */
> > > +static const char * const imx274_supply_names[] = {
> > > +	"VDDL",  /* IF (1.2V) supply */
> > > +	"VDIG",  /* Digital Core (1.8V) supply */
> > > +	"VANA",  /* Analog (2.8V) supply */
> > > +};
> > > +
> > > +#define IMX274_NUM_SUPPLIES ARRAY_SIZE(imx274_supply_names)
> > Please use ARRAY_SIZE() directly.
> > 
> > > +
> > >   /*
> > >    * imx274 I2C operation related structure
> > >    */
> > > @@ -501,6 +511,8 @@ struct imx274_ctrls {
> > >    * @frame_rate: V4L2 frame rate structure
> > >    * @regmap: Pointer to regmap structure
> > >    * @reset_gpio: Pointer to reset gpio
> > > + * @supplies: imx274 analog and digital supplies
> > > + * @inck: input clock to imx274
> > >    * @lock: Mutex structure
> > >    * @mode: Parameters for the selected readout mode
> > >    */
> > > @@ -514,6 +526,8 @@ struct stimx274 {
> > >   	struct v4l2_fract frame_interval;
> > >   	struct regmap *regmap;
> > >   	struct gpio_desc *reset_gpio;
> > > +	struct regulator *supplies[IMX274_NUM_SUPPLIES];
> > > +	struct clk *inck;
> > >   	struct mutex lock; /* mutex lock for operations */
> > >   	const struct imx274_mode *mode;
> > >   };
> > > @@ -767,6 +781,99 @@ static void imx274_reset(struct stimx274 *priv, int rst)
> > >   	usleep_range(IMX274_RESET_DELAY1, IMX274_RESET_DELAY2);
> > >   }
> > > +/*
> > > + * imx274_power_on - Function called to power on the sensor
> > > + * @imx274: Pointer to device structure
> > > + */
> > > +static int imx274_power_on(struct device *dev)
> > > +{
> > > +	struct i2c_client *client = to_i2c_client(dev);
> > > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > +	struct stimx274 *imx274 = to_imx274(sd);
> > > +	int i, ret;
> > > +
> > > +	ret = clk_prepare_enable(imx274->inck);
> > > +	if (ret) {
> > > +		dev_err(&imx274->client->dev,
> > > +			"Failed to enable input clock: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > Could you use regulator_bulk_enable() instead? Same for disable.
> 
> Using regulator_bulk_enable() makes these regulators mandatory.

How? regulator_bulk_enable() simply does call regulator_enable() on all the
regulators.

-- 
Sakari Ailus
