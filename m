Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5E3E1AA3F3
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 15:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506195AbgDONOw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 09:14:52 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:50823 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2506191AbgDONOs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 09:14:48 -0400
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 64C4324000C;
        Wed, 15 Apr 2020 13:14:34 +0000 (UTC)
Date:   Wed, 15 Apr 2020 15:17:39 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Luis Oliveira <lolivei@synopsys.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Michael Rodin <mrodin@de.adit-jv.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Maxime Ripard <mripard@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Todor Tomov <todor.tomov@linaro.org>,
        Suresh Udipi <sudipi@jp.adit-jv.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: Re: [PATCH 3/4] media: ov5647: Add support for non-continuous clock
 mode
Message-ID: <20200415131739.pfc2g5siakpagsim@uno.localdomain>
References: <cover.1586759968.git.roman.kovalivskyi@globallogic.com>
 <c3189c80ac27d67e814509d44a864f8164971efb.1586759968.git.roman.kovalivskyi@globallogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c3189c80ac27d67e814509d44a864f8164971efb.1586759968.git.roman.kovalivskyi@globallogic.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Roman,

On Mon, Apr 13, 2020 at 12:17:46PM +0300, Roman Kovalivskyi wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.org>
>
> The driver was only supporting continuous clock mode
> although this was not stated anywhere.
> Non-continuous clock saves a small amount of power and
> on some SoCs is easier to interface with.

As per the previous patch, you should update bindings reporting this
property is now optionally supported

>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
> Signed-off-by: Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
> ---
>  drivers/media/i2c/ov5647.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index c39e3d20e3ef..8a1a515388e0 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -44,6 +44,7 @@
>  #define PWDN_ACTIVE_DELAY_MS	20
>
>  #define MIPI_CTRL00_CLOCK_LANE_GATE		BIT(5)
> +#define MIPI_CTRL00_LINE_SYNC_ENABLE		BIT(4)
>  #define MIPI_CTRL00_BUS_IDLE			BIT(2)
>  #define MIPI_CTRL00_CLOCK_LANE_DISABLE		BIT(0)
>
> @@ -95,6 +96,7 @@ struct ov5647 {
>  	int				power_count;
>  	struct clk			*xclk;
>  	struct gpio_desc		*pwdn;
> +	unsigned int			flags;
>  };
>
>  static inline struct ov5647 *to_state(struct v4l2_subdev *sd)
> @@ -269,9 +271,15 @@ static int ov5647_set_virtual_channel(struct v4l2_subdev *sd, int channel)
>
>  static int ov5647_stream_on(struct v4l2_subdev *sd)
>  {
> +	struct ov5647 *ov5647 = to_state(sd);
> +	u8 val = MIPI_CTRL00_BUS_IDLE;
>  	int ret;
>
> -	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00, MIPI_CTRL00_BUS_IDLE);
> +	if (ov5647->flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK)
> +		val |= MIPI_CTRL00_CLOCK_LANE_GATE |
> +		       MIPI_CTRL00_LINE_SYNC_ENABLE;
> +
> +	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00, val);
>  	if (ret < 0)
>  		return ret;
>
> @@ -568,7 +576,7 @@ static const struct v4l2_subdev_internal_ops ov5647_subdev_internal_ops = {
>  	.open = ov5647_open,
>  };
>
> -static int ov5647_parse_dt(struct device_node *np)
> +static int ov5647_parse_dt(struct device_node *np, struct ov5647 *sensor)

nit: I would provide the driver structure first

>  {
>  	struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
>  	struct device_node *ep;
> @@ -581,6 +589,9 @@ static int ov5647_parse_dt(struct device_node *np)
>
>  	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &bus_cfg);
>
> +	if (!ret)
> +		sensor->flags = bus_cfg.bus.mipi_csi2.flags;
> +

There is a huge space for improvements here, this function didn't do
anything before this.

I would:
        check the v4l2_fwnode_endpoint_parse() return value, and
        put(np) and fail loudly

        make sure the detected bus type is CSI-2

        cache the flags as you're doing here. As you're only
        interested in clock continuous you could store only that
        information in your driver structure.

>  	of_node_put(ep);
>  	return ret;
>  }
> @@ -599,7 +610,7 @@ static int ov5647_probe(struct i2c_client *client)
>  		return -ENOMEM;
>
>  	if (IS_ENABLED(CONFIG_OF) && np) {
> -		ret = ov5647_parse_dt(np);
> +		ret = ov5647_parse_dt(np, sensor);
>  		if (ret) {
>  			dev_err(dev, "DT parsing error: %d\n", ret);
>  			return ret;
> --
> 2.17.1
>
