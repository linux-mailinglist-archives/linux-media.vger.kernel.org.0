Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33F911DA6C8
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 02:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgETAud (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 20:50:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbgETAud (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 20:50:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE72C061A0E;
        Tue, 19 May 2020 17:50:33 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7184330C;
        Wed, 20 May 2020 02:50:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589935831;
        bh=TOmzP22SIGV/a8c3Jvf3dFaO83IOFowTmTJZLReFhFc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ornY/va4NB6Alqny2AnXzUSQj53n90/F/oNX3ROukai8yj9ltbmcNxVk12TKqEhSM
         dgnTBYoCi4aDQiJuDn1warrD2UOVRzPguNWU9Oa4le25dvjMcprK04vGjNzx3NlQFN
         /5i1oBNvMRGHQWvPYoxo5DV3tQaXq50QW5qg1kus=
Date:   Wed, 20 May 2020 03:50:20 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
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
Message-ID: <20200520005020.GQ3820@pendragon.ideasonboard.com>
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

Hi Sakari,

On Mon, May 18, 2020 at 12:45:18PM +0100, Kieran Bingham wrote:
> Hi Sakari,
> 
> There are only fairly minor comments here, fix ups will be included in a
> v10.
> 
> Is there anything major blocking integration?
> 
> On 16/05/2020 22:51, Sakari Ailus wrote:
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

This is a bit of a tricky one. On the camera size, for the RDACM20, the
O10635 sensor outputs UYVY8_2X8. This if fed to the MAX9271 serializer,
which doesn't care about the data type. The MAX9271 has a 16-bit input
bus, with 10 bits reserved for data, 2 bits dynamically configurable
to carry H/V sync or extra data, and 4 bits dynamically configurable to
carry GPIOs or extra data. The 16-bit words are then serialized (it's a
bit more complicated, when using the H/V sync signals they are
transmitted in a different way, and the MAX9271 also supports a DDR mode
that makes the "serial link word" carry up to 30 bits). Effectively, the
two samples of UYVY8_2X8 are serialized in a 16-bit word each.

Sakari, with this information in mind, what would you recommend ?

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

-- 
Regards,

Laurent Pinchart
