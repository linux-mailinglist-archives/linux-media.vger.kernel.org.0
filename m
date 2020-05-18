Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64AF61D779C
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2020 13:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbgERLp1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 07:45:27 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33444 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbgERLp0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 07:45:26 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9DF74258;
        Mon, 18 May 2020 13:45:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589802323;
        bh=1kluJnAc7GtmqSdWsc8UnPl9ntkFPKBdNDqtTvR3daM=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=g5cU7Peoxd6PV/66YuoMKvY/50rRaE6PJEmy4JdNJe41q3iwxUAh+10n6+T3K7mNe
         Pxx7OovFpk8qOY+Kp1ytH4vVVNbj6XmKcZmGvtr0vITJF9QuInaf7Io/5iG4FfvSAv
         qwqguj8W47sZ98ZE+EQG3wuOAP23J9phr0jnnx1c=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v9 2/4] media: i2c: Add MAX9286 driver
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
References: <20200512155105.1068064-1-kieran.bingham+renesas@ideasonboard.com>
 <20200512155105.1068064-3-kieran.bingham+renesas@ideasonboard.com>
 <20200516215103.GA857@valkosipuli.retiisi.org.uk>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <930009cd-d887-752a-4f1f-567c795101ee@ideasonboard.com>
Date:   Mon, 18 May 2020 12:45:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200516215103.GA857@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

There are only fairly minor comments here, fix ups will be included in a
v10.

Is there anything major blocking integration?

Regards

Kieran



On 16/05/2020 22:51, Sakari Ailus wrote:
> Hi Kieran,
> 
> Thanks for the update.
> 
> On Tue, May 12, 2020 at 04:51:03PM +0100, Kieran Bingham wrote:
> 
> ...
> 
>> +static int max9286_enum_mbus_code(struct v4l2_subdev *sd,
>> +				  struct v4l2_subdev_pad_config *cfg,
>> +				  struct v4l2_subdev_mbus_code_enum *code)
>> +{
>> +	if (code->pad || code->index > 0)
>> +		return -EINVAL;
>> +
>> +	code->code = MEDIA_BUS_FMT_UYVY8_2X8;
> 
> Why UYVY8_2X8 and not UYVY8_1X16? In general, the single sample / pixel
> variant of the format is generally used on the serial busses. This choice
> was made when serial busses were introduced.

Ok - I presume this doesn't really have much effect anyway, they just
have to match for the transmitter/receiver?

But it makes sense to me, so I'll update to the 1x16 variant.

>> +
>> +	return 0;
>> +}
>> +
>> +static struct v4l2_mbus_framefmt *
>> +max9286_get_pad_format(struct max9286_priv *priv,
>> +		       struct v4l2_subdev_pad_config *cfg,
>> +		       unsigned int pad, u32 which)
>> +{
>> +	switch (which) {
>> +	case V4L2_SUBDEV_FORMAT_TRY:
>> +		return v4l2_subdev_get_try_format(&priv->sd, cfg, pad);
>> +	case V4L2_SUBDEV_FORMAT_ACTIVE:
>> +		return &priv->fmt[pad];
>> +	default:
>> +		return NULL;
>> +	}
>> +}
>> +
>> +static int max9286_set_fmt(struct v4l2_subdev *sd,
>> +			   struct v4l2_subdev_pad_config *cfg,
>> +			   struct v4l2_subdev_format *format)
>> +{
>> +	struct max9286_priv *priv = sd_to_max9286(sd);
>> +	struct v4l2_mbus_framefmt *cfg_fmt;
>> +
>> +	if (format->pad >= MAX9286_SRC_PAD)
>> +		return -EINVAL;
> 
> You can remove these checks; it's been already done by the caller.
> 

Ok.


> ...
> 
>> +static int max9286_parse_dt(struct max9286_priv *priv)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	struct device_node *i2c_mux;
>> +	struct device_node *node = NULL;
>> +	unsigned int i2c_mux_mask = 0;
>> +
>> +	of_node_get(dev->of_node);
>> +	i2c_mux = of_find_node_by_name(dev->of_node, "i2c-mux");
>> +	if (!i2c_mux) {
>> +		dev_err(dev, "Failed to find i2c-mux node\n");
>> +		of_node_put(dev->of_node);
>> +		return -EINVAL;
>> +	}
>> +
>> +	/* Identify which i2c-mux channels are enabled */
>> +	for_each_child_of_node(i2c_mux, node) {
>> +		u32 id = 0;
>> +
>> +		of_property_read_u32(node, "reg", &id);
>> +		if (id >= MAX9286_NUM_GMSL)
>> +			continue;
>> +
>> +		if (!of_device_is_available(node)) {
>> +			dev_dbg(dev, "Skipping disabled I2C bus port %u\n", id);
>> +			continue;
>> +		}
>> +
>> +		i2c_mux_mask |= BIT(id);
>> +	}
>> +	of_node_put(node);
>> +	of_node_put(i2c_mux);
>> +
>> +	/* Parse the endpoints */
>> +	for_each_endpoint_of_node(dev->of_node, node) {
>> +		struct max9286_source *source;
>> +		struct of_endpoint ep;
>> +
>> +		of_graph_parse_endpoint(node, &ep);
>> +		dev_dbg(dev, "Endpoint %pOF on port %d",
>> +			ep.local_node, ep.port);
>> +
>> +		if (ep.port > MAX9286_NUM_GMSL) {
>> +			dev_err(dev, "Invalid endpoint %s on port %d",
>> +				of_node_full_name(ep.local_node), ep.port);
>> +			continue;
>> +		}
>> +
>> +		/* For the source endpoint just parse the bus configuration. */
>> +		if (ep.port == MAX9286_SRC_PAD) {
>> +			struct v4l2_fwnode_endpoint vep = {
>> +				.bus_type = V4L2_MBUS_CSI2_DPHY
>> +			};
>> +			int ret;
>> +
>> +			ret = v4l2_fwnode_endpoint_parse(
>> +					of_fwnode_handle(node), &vep);
>> +			if (ret) {
>> +				of_node_put(node);
>> +				of_node_put(dev->of_node);
>> +				return ret;
>> +			}
>> +
>> +			if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
> 
> This won't happen, the bus type will stay if you set it to a non-zero
> value.


Ok - I'll remove this check.


> 
>> +				dev_err(dev,
>> +					"Media bus %u type not supported\n",
>> +					vep.bus_type);
>> +				v4l2_fwnode_endpoint_free(&vep);
>> +				of_node_put(node);
>> +				of_node_put(dev->of_node);
>> +				return -EINVAL;
>> +			}
>> +
>> +			priv->csi2_data_lanes =
>> +				vep.bus.mipi_csi2.num_data_lanes;
>> +			v4l2_fwnode_endpoint_free(&vep);
> 
> No need to call this unless you use v4l2_fwnode_endpoint_alloc_parse().
> 
> And as you don't, you also won't know which frequencies are known to be
> safe to use. That said, perhaps where this device is used having a random
> frequency on that bus could not be an issue. Perhaps.

Does this generate a range? or a list of static supported frequencies?

We configure the pixel clock based upon the number of cameras connected,
and their pixel rates etc ...

Are you saying that the frequency of this clock should be validated to
be a specific range? or are you talking about a different frequency?


For now I'll remove the v4l2_fwnode_endpoint_alloc_parse().



>> +
>> +			continue;
>> +		}
>> +
>> +		/* Skip if the corresponding GMSL link is unavailable. */
>> +		if (!(i2c_mux_mask & BIT(ep.port)))
>> +			continue;
>> +
>> +		if (priv->sources[ep.port].fwnode) {
>> +			dev_err(dev,
>> +				"Multiple port endpoints are not supported: %d",
>> +				ep.port);
>> +
>> +			continue;
>> +		}
>> +
>> +		source = &priv->sources[ep.port];
>> +		source->fwnode = fwnode_graph_get_remote_endpoint(
>> +						of_fwnode_handle(node));
>> +		if (!source->fwnode) {
>> +			dev_err(dev,
>> +				"Endpoint %pOF has no remote endpoint connection\n",
>> +				ep.local_node);
>> +
>> +			continue;
>> +		}
>> +
>> +		priv->source_mask |= BIT(ep.port);
>> +		priv->nsources++;
>> +	}
>> +	of_node_put(node);
>> +	of_node_put(dev->of_node);
>> +
>> +	priv->route_mask = priv->source_mask;
>> +
>> +	return 0;
>> +}
> 

