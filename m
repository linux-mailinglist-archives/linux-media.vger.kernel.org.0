Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5D411FEF62
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 12:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728948AbgFRKKY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 06:10:24 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:52943 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728823AbgFRKKK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 06:10:10 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 7EAEEFF80B;
        Thu, 18 Jun 2020 10:10:01 +0000 (UTC)
Date:   Thu, 18 Jun 2020 12:13:26 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Luis Oliveira <lolivei@synopsys.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Michael Rodin <mrodin@de.adit-jv.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Maxime Ripard <mripard@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Todor Tomov <todor.tomov@linaro.org>,
        Suresh Udipi <sudipi@jp.adit-jv.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: Re: [PATCH v2 3/6] media: ov5647: Add support for non-continuous
 clock mode
Message-ID: <20200618101326.zpcdcb3zdrtgz45t@uno.localdomain>
References: <cover.1589850165.git.roman.kovalivskyi@globallogic.com>
 <cd04fe908fc1a747949ee83044f4d2abc1885cee.1589850165.git.roman.kovalivskyi@globallogic.com>
 <20200519115707.GK20066@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200519115707.GK20066@paasikivi.fi.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Roman, Sakari

On Tue, May 19, 2020 at 02:57:07PM +0300, Sakari Ailus wrote:
> Hi Roman,
>
> On Tue, May 19, 2020 at 04:16:18AM +0300, Roman Kovalivskyi wrote:
> > From: Dave Stevenson <dave.stevenson@raspberrypi.org>
> >
> > The driver was only supporting continuous clock mode
> > although this was not stated anywhere.
> > Non-continuous clock saves a small amount of power and
> > on some SoCs is easier to interface with.
> >

not much to add to what Sakari said, apart for

> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
> > Signed-off-by: Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
> > ---
> >  drivers/media/i2c/ov5647.c | 25 ++++++++++++++++++++++---
> >  1 file changed, 22 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> > index 796cc80f8ee1..10f35c637f91 100644
> > --- a/drivers/media/i2c/ov5647.c
> > +++ b/drivers/media/i2c/ov5647.c
> > @@ -44,6 +44,7 @@
> >  #define PWDN_ACTIVE_DELAY_MS	20
> >
> >  #define MIPI_CTRL00_CLOCK_LANE_GATE		BIT(5)
> > +#define MIPI_CTRL00_LINE_SYNC_ENABLE		BIT(4)
> >  #define MIPI_CTRL00_BUS_IDLE			BIT(2)
> >  #define MIPI_CTRL00_CLOCK_LANE_DISABLE		BIT(0)
> >
> > @@ -95,6 +96,7 @@ struct ov5647 {
> >  	int				power_count;
> >  	struct clk			*xclk;
> >  	struct gpio_desc		*pwdn;
> > +	bool				is_clock_contiguous;

the clock is 'continuous' not contigous :)

I plan to upport more ov5647 patches soon, Roman are you planning a
resend of this series or should I do so (keeping your signoffs of
course)

Thanks
  j

> >  };
> >
> >  static inline struct ov5647 *to_state(struct v4l2_subdev *sd)
> > @@ -274,9 +276,15 @@ static int ov5647_set_virtual_channel(struct v4l2_subdev *sd, int channel)
> >
> >  static int ov5647_stream_on(struct v4l2_subdev *sd)
> >  {
> > +	struct ov5647 *ov5647 = to_state(sd);
> > +	u8 val = MIPI_CTRL00_BUS_IDLE;
> >  	int ret;
> >
> > -	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00, MIPI_CTRL00_BUS_IDLE);
> > +	if (ov5647->is_clock_contiguous)
> > +		val |= MIPI_CTRL00_CLOCK_LANE_GATE |
> > +		       MIPI_CTRL00_LINE_SYNC_ENABLE;
> > +
> > +	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00, val);
> >  	if (ret < 0)
> >  		return ret;
> >
> > @@ -573,7 +581,7 @@ static const struct v4l2_subdev_internal_ops ov5647_subdev_internal_ops = {
> >  	.open = ov5647_open,
> >  };
> >
> > -static int ov5647_parse_dt(struct device_node *np)
> > +static int ov5647_parse_dt(struct ov5647 *sensor, struct device_node *np)
> >  {
> >  	struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
> >  	struct device_node *ep;
> > @@ -586,6 +594,17 @@ static int ov5647_parse_dt(struct device_node *np)
> >
> >  	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &bus_cfg);
> >
>
> Extra newline.
>
> > +	if (!ret) {
> > +		of_node_put(ep);
> > +		of_node_put(np);
>
> Why to put np as well?
>
> > +		return ret;
>
> Please add a label at the end; it makes error handling easier.
>
> > +	}
> > +
> > +	if (bus_cfg.bus_type == V4L2_MBUS_CSI2_DPHY
> > +		|| bus_cfg.bus_type == V4L2_MBUS_CSI2_CPHY)
>
> I bet this device is D-PHY only.
>
> > +		sensor->is_clock_contiguous = bus_cfg.bus.mipi_csi2.flags
> > +			& V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
>
> Now that you're making use of bus specific parameters, please set the bus
> type first before calling v4l2_fwnode_endpoint_parse().
>
> > +
> >  	of_node_put(ep);
> >  	return ret;
> >  }
> > @@ -604,7 +623,7 @@ static int ov5647_probe(struct i2c_client *client)
> >  		return -ENOMEM;
> >
> >  	if (IS_ENABLED(CONFIG_OF) && np) {
> > -		ret = ov5647_parse_dt(np);
> > +		ret = ov5647_parse_dt(sensor, np);
> >  		if (ret) {
> >  			dev_err(dev, "DT parsing error: %d\n", ret);
> >  			return ret;
>
> --
> Kind regards,
>
> Sakari Ailus
