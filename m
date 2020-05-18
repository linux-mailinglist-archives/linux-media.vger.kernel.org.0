Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CC331D78B9
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2020 14:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727827AbgERMe7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 08:34:59 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:57519 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726797AbgERMe6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 08:34:58 -0400
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 7AED1240017;
        Mon, 18 May 2020 12:34:51 +0000 (UTC)
Date:   Mon, 18 May 2020 14:38:10 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v9 2/4] media: i2c: Add MAX9286 driver
Message-ID: <20200518123810.wsqg2a3lbbme36e7@uno.localdomain>
References: <20200512155105.1068064-1-kieran.bingham+renesas@ideasonboard.com>
 <20200512155105.1068064-3-kieran.bingham+renesas@ideasonboard.com>
 <20200516215103.GA857@valkosipuli.retiisi.org.uk>
 <930009cd-d887-752a-4f1f-567c795101ee@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <930009cd-d887-752a-4f1f-567c795101ee@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran, Sakari

On Mon, May 18, 2020 at 12:45:18PM +0100, Kieran Bingham wrote:
> Hi Sakari,
>
> There are only fairly minor comments here, fix ups will be included in a
> v10.
>
> Is there anything major blocking integration?
>
> Regards
>
> Kieran
>
>
>
> On 16/05/2020 22:51, Sakari Ailus wrote:
> > Hi Kieran,
> >
> > Thanks for the update.
> >
> > On Tue, May 12, 2020 at 04:51:03PM +0100, Kieran Bingham wrote:
> >
> > ...
> >
> >> +static int max9286_enum_mbus_code(struct v4l2_subdev *sd,
> >> +				  struct v4l2_subdev_pad_config *cfg,
> >> +				  struct v4l2_subdev_mbus_code_enum *code)
> >> +{
> >> +	if (code->pad || code->index > 0)
> >> +		return -EINVAL;
> >> +
> >> +	code->code = MEDIA_BUS_FMT_UYVY8_2X8;
> >
> > Why UYVY8_2X8 and not UYVY8_1X16? In general, the single sample / pixel
> > variant of the format is generally used on the serial busses. This choice
> > was made when serial busses were introduced.
>
> Ok - I presume this doesn't really have much effect anyway, they just
> have to match for the transmitter/receiver?
>
> But it makes sense to me, so I'll update to the 1x16 variant.
>
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static struct v4l2_mbus_framefmt *
> >> +max9286_get_pad_format(struct max9286_priv *priv,
> >> +		       struct v4l2_subdev_pad_config *cfg,
> >> +		       unsigned int pad, u32 which)
> >> +{
> >> +	switch (which) {
> >> +	case V4L2_SUBDEV_FORMAT_TRY:
> >> +		return v4l2_subdev_get_try_format(&priv->sd, cfg, pad);
> >> +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> >> +		return &priv->fmt[pad];
> >> +	default:
> >> +		return NULL;
> >> +	}
> >> +}
> >> +
> >> +static int max9286_set_fmt(struct v4l2_subdev *sd,
> >> +			   struct v4l2_subdev_pad_config *cfg,
> >> +			   struct v4l2_subdev_format *format)
> >> +{
> >> +	struct max9286_priv *priv = sd_to_max9286(sd);
> >> +	struct v4l2_mbus_framefmt *cfg_fmt;
> >> +
> >> +	if (format->pad >= MAX9286_SRC_PAD)
> >> +		return -EINVAL;
> >
> > You can remove these checks; it's been already done by the caller.
> >
>
> Ok.
>

I think this shold be kept. The core validates that the pad number is
valid, but we're here checking that set_fmt has been called on a sink
pad [0-3], returning -EINVAL if set_fmt (and get_ftm as well) are
called on the source one.

My question now is how does link validation work, if get_fmt() is not
allowed on the source pad :/ ? Anyway, I would keep this check for
set_fmt (maybe make it an == to address Sakari's comment).

Thanks
  j

>
> > ...
> >
> >> +static int max9286_parse_dt(struct max9286_priv *priv)
> >> +{
> >> +	struct device *dev = &priv->client->dev;
> >> +	struct device_node *i2c_mux;
> >> +	struct device_node *node = NULL;
> >> +	unsigned int i2c_mux_mask = 0;
> >> +
> >> +	of_node_get(dev->of_node);
> >> +	i2c_mux = of_find_node_by_name(dev->of_node, "i2c-mux");
> >> +	if (!i2c_mux) {
> >> +		dev_err(dev, "Failed to find i2c-mux node\n");
> >> +		of_node_put(dev->of_node);
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	/* Identify which i2c-mux channels are enabled */
> >> +	for_each_child_of_node(i2c_mux, node) {
> >> +		u32 id = 0;
> >> +
> >> +		of_property_read_u32(node, "reg", &id);
> >> +		if (id >= MAX9286_NUM_GMSL)
> >> +			continue;
> >> +
> >> +		if (!of_device_is_available(node)) {
> >> +			dev_dbg(dev, "Skipping disabled I2C bus port %u\n", id);
> >> +			continue;
> >> +		}
> >> +
> >> +		i2c_mux_mask |= BIT(id);
> >> +	}
> >> +	of_node_put(node);
> >> +	of_node_put(i2c_mux);
> >> +
> >> +	/* Parse the endpoints */
> >> +	for_each_endpoint_of_node(dev->of_node, node) {
> >> +		struct max9286_source *source;
> >> +		struct of_endpoint ep;
> >> +
> >> +		of_graph_parse_endpoint(node, &ep);
> >> +		dev_dbg(dev, "Endpoint %pOF on port %d",
> >> +			ep.local_node, ep.port);
> >> +
> >> +		if (ep.port > MAX9286_NUM_GMSL) {
> >> +			dev_err(dev, "Invalid endpoint %s on port %d",
> >> +				of_node_full_name(ep.local_node), ep.port);
> >> +			continue;
> >> +		}
> >> +
> >> +		/* For the source endpoint just parse the bus configuration. */
> >> +		if (ep.port == MAX9286_SRC_PAD) {
> >> +			struct v4l2_fwnode_endpoint vep = {
> >> +				.bus_type = V4L2_MBUS_CSI2_DPHY
> >> +			};
> >> +			int ret;
> >> +
> >> +			ret = v4l2_fwnode_endpoint_parse(
> >> +					of_fwnode_handle(node), &vep);
> >> +			if (ret) {
> >> +				of_node_put(node);
> >> +				of_node_put(dev->of_node);
> >> +				return ret;
> >> +			}
> >> +
> >> +			if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
> >
> > This won't happen, the bus type will stay if you set it to a non-zero
> > value.
>
>
> Ok - I'll remove this check.
>
>
> >
> >> +				dev_err(dev,
> >> +					"Media bus %u type not supported\n",
> >> +					vep.bus_type);
> >> +				v4l2_fwnode_endpoint_free(&vep);
> >> +				of_node_put(node);
> >> +				of_node_put(dev->of_node);
> >> +				return -EINVAL;
> >> +			}
> >> +
> >> +			priv->csi2_data_lanes =
> >> +				vep.bus.mipi_csi2.num_data_lanes;
> >> +			v4l2_fwnode_endpoint_free(&vep);
> >
> > No need to call this unless you use v4l2_fwnode_endpoint_alloc_parse().
> >
> > And as you don't, you also won't know which frequencies are known to be
> > safe to use. That said, perhaps where this device is used having a random
> > frequency on that bus could not be an issue. Perhaps.
>
> Does this generate a range? or a list of static supported frequencies?
>
> We configure the pixel clock based upon the number of cameras connected,
> and their pixel rates etc ...
>
> Are you saying that the frequency of this clock should be validated to
> be a specific range? or are you talking about a different frequency?
>
>
> For now I'll remove the v4l2_fwnode_endpoint_alloc_parse().
>
>
>
> >> +
> >> +			continue;
> >> +		}
> >> +
> >> +		/* Skip if the corresponding GMSL link is unavailable. */
> >> +		if (!(i2c_mux_mask & BIT(ep.port)))
> >> +			continue;
> >> +
> >> +		if (priv->sources[ep.port].fwnode) {
> >> +			dev_err(dev,
> >> +				"Multiple port endpoints are not supported: %d",
> >> +				ep.port);
> >> +
> >> +			continue;
> >> +		}
> >> +
> >> +		source = &priv->sources[ep.port];
> >> +		source->fwnode = fwnode_graph_get_remote_endpoint(
> >> +						of_fwnode_handle(node));
> >> +		if (!source->fwnode) {
> >> +			dev_err(dev,
> >> +				"Endpoint %pOF has no remote endpoint connection\n",
> >> +				ep.local_node);
> >> +
> >> +			continue;
> >> +		}
> >> +
> >> +		priv->source_mask |= BIT(ep.port);
> >> +		priv->nsources++;
> >> +	}
> >> +	of_node_put(node);
> >> +	of_node_put(dev->of_node);
> >> +
> >> +	priv->route_mask = priv->source_mask;
> >> +
> >> +	return 0;
> >> +}
> >
>
