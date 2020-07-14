Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE8121F1B4
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 14:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728187AbgGNMlv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 08:41:51 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:47087 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbgGNMlv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 08:41:51 -0400
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 5E71B100006;
        Tue, 14 Jul 2020 12:41:42 +0000 (UTC)
Date:   Tue, 14 Jul 2020 14:45:15 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dave.stevenson@raspberrypi.org,
        naush@raspberrypi.com, mrodin@de.adit-jv.com,
        hugues.fruchet@st.com, mripard@kernel.org, aford173@gmail.com,
        sudipi@jp.adit-jv.com, andrew_gabbasov@mentor.com,
        erosca@de.adit-jv.com, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Subject: Re: [libcamera-devel] [PATCH 03/25] media: ov5647: Add support for
 PWDN GPIO.
Message-ID: <20200714124515.ptliaxjrscieqsdi@uno.localdomain>
References: <20200623100815.10674-1-jacopo@jmondi.org>
 <20200623100815.10674-4-jacopo@jmondi.org>
 <5dbb468e-db42-6ac2-db40-196dc0f8a09f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5dbb468e-db42-6ac2-db40-196dc0f8a09f@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Thu, Jul 09, 2020 at 10:04:14PM +0200, Dafna Hirschfeld wrote:
>
>
> On 23.06.20 12:07, Jacopo Mondi wrote:
> > From: Dave Stevenson <dave.stevenson@raspberrypi.org>
> >
> > Add support for an optional GPIO connected to PWDN on the sensor. This
> > allows the use of hardware standby mode where internal device clock
> > and circuit activities are halted.
> >
> > Please note that power is off when PWDN is high.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
> > Signed-off-by: Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >   drivers/media/i2c/ov5647.c | 28 ++++++++++++++++++++++++++++
> >   1 file changed, 28 insertions(+)
> >
> > diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> > index e7d2e5b4ad4b9..105ff7f899b34 100644
> > --- a/drivers/media/i2c/ov5647.c
> > +++ b/drivers/media/i2c/ov5647.c
> > @@ -21,6 +21,7 @@
> >   #include <linux/clk.h>
> >   #include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> >   #include <linux/i2c.h>
> >   #include <linux/init.h>
> >   #include <linux/io.h>
> > @@ -35,6 +36,13 @@
> >   #define SENSOR_NAME "ov5647"
> > +/*
> > + * From the datasheet, "20ms after PWDN goes low or 20ms after RESETB goes
> > + * high if reset is inserted after PWDN goes high, host can access sensor's
> > + * SCCB to initialize sensor."
> > + */
> > +#define PWDN_ACTIVE_DELAY_MS	20
> > +
> >   #define MIPI_CTRL00_CLOCK_LANE_GATE		BIT(5)
> >   #define MIPI_CTRL00_BUS_IDLE			BIT(2)
> >   #define MIPI_CTRL00_CLOCK_LANE_DISABLE		BIT(0)
> > @@ -86,6 +94,7 @@ struct ov5647 {
> >   	unsigned int			height;
> >   	int				power_count;
> >   	struct clk			*xclk;
> > +	struct gpio_desc		*pwdn;
> >   };
> >   static inline struct ov5647 *to_state(struct v4l2_subdev *sd)
> > @@ -355,6 +364,11 @@ static int ov5647_sensor_power(struct v4l2_subdev *sd, int on)
> >   	if (on && !ov5647->power_count)	{
> >   		dev_dbg(&client->dev, "OV5647 power on\n");
> > +		if (ov5647->pwdn) {
> > +			gpiod_set_value_cansleep(ov5647->pwdn, 0);
> > +			msleep(PWDN_ACTIVE_DELAY_MS);
> > +		}
> > +
> >   		ret = clk_prepare_enable(ov5647->xclk);
> >   		if (ret < 0) {
> >   			dev_err(&client->dev, "clk prepare enable failed\n");
> > @@ -392,6 +406,8 @@ static int ov5647_sensor_power(struct v4l2_subdev *sd, int on)
> >   			dev_dbg(&client->dev, "soft stby failed\n");
> >   		clk_disable_unprepare(ov5647->xclk);
> > +
> > +		gpiod_set_value_cansleep(ov5647->pwdn, 1);
> >   	}
> >   	/* Update the power count. */
> > @@ -581,6 +597,10 @@ static int ov5647_probe(struct i2c_client *client)
> >   		return -EINVAL;
> >   	}
> > +	/* Request the power down GPIO asserted */
> > +	sensor->pwdn = devm_gpiod_get_optional(&client->dev, "pwdn",
> > +					       GPIOD_OUT_HIGH);
>
> Hi,
> I see that other drivers check for error from 'devm_gpiod_get_optional'
> using 'IS_ERR'

Thanks for noticing. It's probably worth adding a check for this.
I'll fix in v2.

Thanks
  j

>
> Thanks,
> Dafna
>
> > +
> >   	mutex_init(&sensor->lock);
> >   	sd = &sensor->sd;
> > @@ -594,7 +614,15 @@ static int ov5647_probe(struct i2c_client *client)
> >   	if (ret < 0)
> >   		goto mutex_remove;
> > +	if (sensor->pwdn) {
> > +		gpiod_set_value_cansleep(sensor->pwdn, 0);
> > +		msleep(PWDN_ACTIVE_DELAY_MS);
> > +	}
> > +
> >   	ret = ov5647_detect(sd);
> > +
> > +	gpiod_set_value_cansleep(sensor->pwdn, 1);
> > +
> >   	if (ret < 0)
> >   		goto error;
> >
