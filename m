Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF1CC175868
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 11:33:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727363AbgCBKd0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 05:33:26 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:52244 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727097AbgCBKd0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Mar 2020 05:33:26 -0500
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D32C654A;
        Mon,  2 Mar 2020 11:33:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1583145203;
        bh=/5vYR9IfAKapSaJQTyYraSDyD0DtbsnsWgQF5G17V0I=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=T1lOFrdfxi174okp5uSj4ETUrPUZ6l72DcgqXsw9MaU5RJ5uN97Yz9YP6RfTEtSaZ
         nodVXne535ANdvqROwFwcEXDmVqjnQyCkd+9eHnk32zyJQMWcLkqjaZafLJu/3FypJ
         kfcFKKeIcX3ukulPEhBdVc2/sNjROzIMi3CmxPNc=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v7 2/2] media: i2c: Add MAX9286 driver
To:     Hyun Kwon <hyun.kwon@xilinx.com>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hyun Kwon <hyunk@xilinx.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "sakari.ailus@iki.fi" <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
References: <20200214103136.12526-1-kieran.bingham+renesas@ideasonboard.com>
 <20200214103136.12526-3-kieran.bingham+renesas@ideasonboard.com>
 <68a0cc3d-083b-8907-5b66-5f576f4be464@ideasonboard.com>
 <20200228181303.GA21745@smtp.xilinx.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <295da145-040c-b792-6536-5ba38e5f8aca@ideasonboard.com>
Date:   Mon, 2 Mar 2020 10:33:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200228181303.GA21745@smtp.xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hyun,

On 28/02/2020 18:13, Hyun Kwon wrote:
> Hi Kieran,
> 
> Thanks for sharing a patch.
> 
> Sorry for late response. I'm trying this driver along with Xilinx MIPI
> pipeline and GMSL sensors with max96705. I wanted to confirm a few things
> before replying. It's still on going, but replying before it gets too late.
> Mostly it's questions and looking for some input.

Not too late at all.

We're very pleased to get input from other users and system configurations!


> On Fri, 2020-02-14 at 03:54:19 -0800, Kieran Bingham wrote:
>> Small update,
>>
>> On 14/02/2020 10:31, Kieran Bingham wrote:
>>> The MAX9286 is a 4-channel GMSL deserializer with coax or STP input and
>>> CSI-2 output. The device supports multicamera streaming applications,
>>> and features the ability to synchronise the attached cameras.
>>>
>>> CSI-2 output can be configured with 1 to 4 lanes, and a control channel
>>> is supported over I2C, which implements an I2C mux to facilitate
>>> communications with connected cameras across the reverse control
>>> channel.
>>
>> This is missing the Co-developed-by: tags ...
>>
>> Co-developed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>>
>>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>>
>> Co-developed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>
>>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>
>> Co-developed-by: Laurent Pinchart
>> <laurent.pinchart+renesas@ideasonboard.com>
>>
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>
>> Co-developed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>>
>>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>>
>> --
>> Kieran
>>
>>
>>
>>>
>>> --
>>> v2:
>>>  - Fix MAINTAINERS entry
>>>
>>> This posting is released with the following modifications to work
>>> without Sakari's VC developments:
>>>  - max9286_g_mbus_config() re-instated
>>>  - max9286_get_frame_desc() is not bus/csi aware
>>>  - max9286_{get,set}_routing() removed
>>>
>>> v3:
>>>  - Initialise notifier with v4l2_async_notifier_init
>>>  - Update for new mbus csi2 format V4L2_MBUS_CSI2_DPHY
>>>
>>> v4: - Re-introduce required code to function with the VC series.
>>>
>>>  - Implement max9286_get_routing, max9286_set_routing
>>>  - Remove max9286_g_mbus_config
>>>
>>> v5: (internal release)
>>>  - Fix printk formatting for hex value
>>>  - max9286->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE (add |)
>>>  - MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER -> MEDIA_ENT_F_VID_IF_BRIDGE
>>>  - Remove 'device is bound' workaround
>>>
>>> v6:
>>>  - v4l2_subdev_krouting instead of v4l2_subdev_routing separated
>>>    to allow integration without the VC/V4L2-Mux series.
>>>  - convert sd_to_max9286 to inline function
>>>  - rename max9286_device to max9286_priv
>>>  - Cleanup the v4l2_async_notifier
>>>  - Extend MODULE_AUTHOR
>>>  - Replace of_graph_get_endpoint_by_regs with fwnode_graph_get_endpoint_by_id
>>>  - Pass default bus type when parsing fwnode endpoint (Manivannan Sadhasivam)
>>>  - Use new YAML file reference in MAINTAINERS
>>>  - Parse new i2c-mux node in max9286_get_i2c_by_id
>>>    (This could/should be refactored to parse these separately first)
>>>  - Spelling and calculation fixes in the FSYNC_LOCKED check comments
>>>  - Identify each enabled i2c-mux channel in a single pass
>>>  - max9286: Improve mux-state readbility [v2]
>>>  - Fix frame sync lock durations
>>>  - Add comment to describe /why/ we must open the mux in s_stream
>>>  - use -EXDEV as return code for failed link synchronisation.
>>>  - Fix reference counting of the dt nodeS
>>>  - Convert to probe_new for I2C
>>>  - Remove redundant max9286_i2c_mux_state
>>>  - Provide optional enable-gpio (max9286-pwdn)
>>>
>>> v7:
>>>  [Kieran]
>>>  - Ensure powerdown lines are optional
>>>  - Add a 4ms power-up delay
>>>  - Add max9286_check_config_link() to core
>>>  - Add GPIO chip controller for GPIO0OUT and GPIO1OUT
>>>  - Fix GPIO registration
>>>  - max9286: Split out async registration
>>>    (fixes regulator -EPROBE_DEFERs failures)
>>>  - Collect all V4L2 registrations
>>>  - balance v4l2_async refcnting
>>>  - Rename max9286_v4l2_async_ => max9286_v4l2_notifier_
>>>
>>>  [Jacopo]
>>>  - Remove redundanct MAXIM_I2C_SPEED macros
>>>  - Move notifiers operations
>>>  - Add delay after reverse channel reconfiguration
>>>  - Move link setup to completion
>>>  - Fix up max9286_check_config_link() implementation
>>>  - Remove redundant dual configuration of reverse channel
>>>
>>>  MAINTAINERS                 |   10 +
>>>  drivers/media/i2c/Kconfig   |   11 +
>>>  drivers/media/i2c/Makefile  |    1 +
>>>  drivers/media/i2c/max9286.c | 1278 +++++++++++++++++++++++++++++++++++
>>>  4 files changed, 1300 insertions(+)
>>>  create mode 100644 drivers/media/i2c/max9286.c
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 983d3c97edd1..148706353d25 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -10033,6 +10033,16 @@ F:	Documentation/devicetree/bindings/hwmon/max6697.txt
>>>  F:	drivers/hwmon/max6697.c
>>>  F:	include/linux/platform_data/max6697.h
>>>  
>>> +MAX9286 QUAD GMSL DESERIALIZER DRIVER
>>> +M:	Jacopo Mondi <jacopo+renesas@jmondi.org>
>>> +M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>> +M:	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>> +M:	Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>>> +L:	linux-media@vger.kernel.org
>>> +S:	Maintained
>>> +F:	Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
>>> +F:	drivers/media/i2c/max9286.c
>>> +
>>>  MAX9860 MONO AUDIO VOICE CODEC DRIVER
>>>  M:	Peter Rosin <peda@axentia.se>
>>>  L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
>>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>>> index c68e002d26ea..32a4deb90617 100644
>>> --- a/drivers/media/i2c/Kconfig
>>> +++ b/drivers/media/i2c/Kconfig
>>> @@ -442,6 +442,17 @@ config VIDEO_VPX3220
>>>  	  To compile this driver as a module, choose M here: the
>>>  	  module will be called vpx3220.
>>>  
>>> +config VIDEO_MAX9286
>>> +	tristate "Maxim MAX9286 GMSL deserializer support"
>>> +	depends on I2C && I2C_MUX
>>> +	depends on VIDEO_V4L2_SUBDEV_API && MEDIA_CONTROLLER
>>> +	select V4L2_FWNODE
>>> +	help
>>> +	  This driver supports the Maxim MAX9286 GMSL deserializer.
>>> +
>>> +	  To compile this driver as a module, choose M here: the
>>> +	  module will be called max9286.
>>> +
>>>  comment "Video and audio decoders"
>>>  
>>>  config VIDEO_SAA717X
>>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
>>> index c147bb9d28db..8896cf8bfc4f 100644
>>> --- a/drivers/media/i2c/Makefile
>>> +++ b/drivers/media/i2c/Makefile
>>> @@ -117,5 +117,6 @@ obj-$(CONFIG_VIDEO_IMX290)	+= imx290.o
>>>  obj-$(CONFIG_VIDEO_IMX319)	+= imx319.o
>>>  obj-$(CONFIG_VIDEO_IMX355)	+= imx355.o
>>>  obj-$(CONFIG_VIDEO_ST_MIPID02) += st-mipid02.o
>>> +obj-$(CONFIG_VIDEO_MAX9286)	+= max9286.o
>>>  
>>>  obj-$(CONFIG_SDR_MAX2175) += max2175.o
>>> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
>>> new file mode 100644
>>> index 000000000000..a20829297ef6
>>> --- /dev/null
>>> +++ b/drivers/media/i2c/max9286.c
>>> @@ -0,0 +1,1278 @@
>>> +// SPDX-License-Identifier: GPL-2.0+
>>> +/*
>>> + * Maxim MAX9286 GMSL Deserializer Driver
>>> + *
> 
> [snip]
> 
>>> +
>>> +static const struct v4l2_async_notifier_operations max9286_notify_ops = {
>>> +	.bound = max9286_notify_bound,
>>> +	.unbind = max9286_notify_unbind,
>>> +};
>>> +
>>> +static int max9286_v4l2_notifier_register(struct max9286_priv *priv)
>>> +{
>>> +	struct device *dev = &priv->client->dev;
>>> +	struct max9286_source *source = NULL;
>>> +	int ret;
>>> +
>>> +	if (!priv->nsources)
>>> +		return 0;
>>> +
>>> +	v4l2_async_notifier_init(&priv->notifier);
>>> +
>>> +	for_each_source(priv, source) {
>>> +		unsigned int i = to_index(priv, source);
>>> +
>>> +		source->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
>>> +		source->asd.match.fwnode = source->fwnode;
>>> +
>>> +		ret = v4l2_async_notifier_add_subdev(&priv->notifier,
>>> +						     &source->asd);
>>> +		if (ret) {
>>> +			dev_err(dev, "Failed to add subdev for source %d", i);
>>> +			v4l2_async_notifier_cleanup(&priv->notifier);
>>> +			return ret;
>>> +		}
>>> +
>>> +		/*
>>> +		 * Balance the reference counting handled through
>>> +		 * v4l2_async_notifier_cleanup()
>>> +		 */
>>> +		fwnode_handle_get(source->fwnode);
>>> +	}
>>> +
>>> +	priv->notifier.ops = &max9286_notify_ops;
>>> +
>>> +	ret = v4l2_async_subdev_notifier_register(&priv->sd, &priv->notifier);
>>> +	if (ret) {
>>> +		dev_err(dev, "Failed to register subdev_notifier");
>>> +		v4l2_async_notifier_cleanup(&priv->notifier);
>>> +		return ret;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
> 
> This was giving me some touble because this subdev notifier chain is a part
> of a bigger graph (Xilinx Video pipeline graph). Those are defined using
> same graph bindings, hence conflicting each other. For now, in order to 
> work around, I'm calling bound of subdev notifier if there's any match 
> already in parent's done list [1]. Do you have any input how this should be
> handled properly?

I suspect that it is likely your existing framework is matching at the
device level instead of the endpoint level, as it sounds like a topic we
hit on both this GMSL implementation and the ADV748x, but I'll have to
take a deeper look to be sure.

Matching should be done on endpoints, not devices as there could now be
multiple 'endpoints' connected to a single device.


The RCar-VIN platform now solely uses endpoint matching, and I believe
we may have to work through other platforms to update to the same approach.


A 'temporary' solution may be in the form of this patch:

https://git.linuxtv.org/sailus/media_tree.git/commit/?h=fwnode-const&id=35c32d99b2c3f5086b911ec817926de9b7bc3b41

Which I had mistakenly thought was already accepted for upstream but
appears to have stalled.

I'll follow this up separately to see what we need to do here.


>>> +
>>> +static void max9286_v4l2_notifier_unregister(struct max9286_priv *priv)
>>> +{
>>> +	if (!priv->nsources)
>>> +		return;
>>> +
>>> +	v4l2_async_notifier_unregister(&priv->notifier);
>>> +	v4l2_async_notifier_cleanup(&priv->notifier);
>>> +}
>>> +
> 
> [snip]
> 
>>> +};
>>> +
>>> +static int max9286_v4l2_register(struct max9286_priv *priv)
>>> +{
>>> +	struct device *dev = &priv->client->dev;
>>> +	struct fwnode_handle *ep;
>>> +	int ret;
>>> +	int i;
>>> +
>>> +	/* Register v4l2 async notifiers for connected Camera subdevices */
>>> +	ret = max9286_v4l2_notifier_register(priv);
>>> +	if (ret) {
>>> +		dev_err(dev, "Unable to register V4L2 async notifiers\n");
>>> +		return ret;
>>> +	}
>>> +
>>> +	/* Configure V4L2 for the MAX9286 itself */
>>> +
>>> +	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max9286_subdev_ops);
>>> +	priv->sd.internal_ops = &max9286_subdev_internal_ops;
>>> +	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>>> +
>>> +	v4l2_ctrl_handler_init(&priv->ctrls, 1);
>>> +	/*
>>> +	 * FIXME: Compute the real pixel rate. The 50 MP/s value comes from the
>>> +	 * hardcoded frequency in the BSP CSI-2 receiver driver.
>>> +	 */
>>> +	v4l2_ctrl_new_std(&priv->ctrls, NULL, V4L2_CID_PIXEL_RATE,
>>> +			  50000000, 50000000, 1, 50000000);
>>> +	priv->sd.ctrl_handler = &priv->ctrls;
>>> +	ret = priv->ctrls.error;
>>> +	if (ret)
>>> +		goto err_async;
>>> +
>>> +	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
>>> +
>>> +	priv->pads[MAX9286_SRC_PAD].flags = MEDIA_PAD_FL_SOURCE;
>>> +	for (i = 0; i < MAX9286_SRC_PAD; i++)
>>> +		priv->pads[i].flags = MEDIA_PAD_FL_SINK;
>>> +	ret = media_entity_pads_init(&priv->sd.entity, MAX9286_N_PADS,
>>> +				     priv->pads);
>>> +	if (ret)
>>> +		goto err_async;
>>> +
>>> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), MAX9286_SRC_PAD,
>>> +					     0, 0);
>>> +	if (!ep) {
>>> +		dev_err(dev, "Unable to retrieve endpoint on \"port@4\"\n");
>>> +		ret = -ENOENT;
>>> +		goto err_async;
>>> +	}
>>> +	priv->sd.fwnode = ep;
> 
> I learned that an endpoint node is used for match in some drivers, including
> this one [2], while a device node is used in others including Xilinx one. :-)
> Hence they don't work with each other. I feel like this better be unified for
> interoperability. I understand it's not a problem of this patch, but maybe good
> to discuss?

Indeed, it becomes a requirement to match on endpoints to be able to
correctly identify which subdevice is matched.

Please try:

https://git.linuxtv.org/sailus/media_tree.git/commit/?h=fwnode-const&id=35c32d99b2c3f5086b911ec817926de9b7bc3b41


and let me know if it resolves your matching issues.

That's from 2017, so the patch itself may have bitrotted since and need
a refresh. Let me know if you have any difficulties applying and I'll
see about getting a refreshed patch posted to the mailing lists to
discuss this particular topic again.


>>> +
>>> +	ret = v4l2_async_register_subdev(&priv->sd);
>>> +	if (ret < 0) {
>>> +		dev_err(dev, "Unable to register subdevice\n");
>>> +		goto err_put_node;
>>> +	}
>>> +
>>> +	return 0;
>>> +
>>> +err_put_node:
>>> +	fwnode_handle_put(ep);
>>> +err_async:
>>> +	max9286_v4l2_notifier_unregister(priv);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static void max9286_v4l2_unregister(struct max9286_priv *priv)
>>> +{
>>> +	fwnode_handle_put(priv->sd.fwnode);
>>> +	v4l2_async_unregister_subdev(&priv->sd);
>>> +	max9286_v4l2_notifier_unregister(priv);
>>> +}
>>> +
>>> +/* -----------------------------------------------------------------------------
>>> + * Probe/Remove
>>> + */
>>> +
>>> +static int max9286_setup(struct max9286_priv *priv)
>>> +{
>>> +	/*
>>> +	 * Link ordering values for all enabled links combinations. Orders must
>>> +	 * be assigned sequentially from 0 to the number of enabled links
>>> +	 * without leaving any hole for disabled links. We thus assign orders to
>>> +	 * enabled links first, and use the remaining order values for disabled
>>> +	 * links are all links must have a different order value;
>>> +	 */
>>> +	static const u8 link_order[] = {
>>> +		(3 << 6) | (2 << 4) | (1 << 2) | (0 << 0), /* xxxx */
>>> +		(3 << 6) | (2 << 4) | (1 << 2) | (0 << 0), /* xxx0 */
>>> +		(3 << 6) | (2 << 4) | (0 << 2) | (1 << 0), /* xx0x */
>>> +		(3 << 6) | (2 << 4) | (1 << 2) | (0 << 0), /* xx10 */
>>> +		(3 << 6) | (0 << 4) | (2 << 2) | (1 << 0), /* x0xx */
>>> +		(3 << 6) | (1 << 4) | (2 << 2) | (0 << 0), /* x1x0 */
>>> +		(3 << 6) | (1 << 4) | (0 << 2) | (2 << 0), /* x10x */
>>> +		(3 << 6) | (1 << 4) | (1 << 2) | (0 << 0), /* x210 */
>>> +		(0 << 6) | (3 << 4) | (2 << 2) | (1 << 0), /* 0xxx */
>>> +		(1 << 6) | (3 << 4) | (2 << 2) | (0 << 0), /* 1xx0 */
>>> +		(1 << 6) | (3 << 4) | (0 << 2) | (2 << 0), /* 1x0x */
>>> +		(2 << 6) | (3 << 4) | (1 << 2) | (0 << 0), /* 2x10 */
>>> +		(1 << 6) | (0 << 4) | (3 << 2) | (2 << 0), /* 10xx */
>>> +		(2 << 6) | (1 << 4) | (3 << 2) | (0 << 0), /* 21x0 */
>>> +		(2 << 6) | (1 << 4) | (0 << 2) | (3 << 0), /* 210x */
>>> +		(3 << 6) | (2 << 4) | (1 << 2) | (0 << 0), /* 3210 */
>>> +	};
>>> +
>>> +	/*
>>> +	 * Set the I2C bus speed.
>>> +	 *
>>> +	 * Enable I2C Local Acknowledge during the probe sequences of the camera
>>> +	 * only. This should be disabled after the mux is initialised.
>>> +	 */
>>> +	max9286_configure_i2c(priv, true);
>>> +
>>> +	/*
>>> +	 * Reverse channel setup.
>>> +	 *
>>> +	 * - Enable custom reverse channel configuration (through register 0x3f)
>>> +	 *   and set the first pulse length to 35 clock cycles.
>>> +	 * - Increase the reverse channel amplitude to 170mV to accommodate the
>>> +	 *   high threshold enabled by the serializer driver.
>>> +	 */
>>> +	max9286_write(priv, 0x3f, MAX9286_EN_REV_CFG | MAX9286_REV_FLEN(35));
>>> +	max9286_write(priv, 0x3b, MAX9286_REV_TRF(1) | MAX9286_REV_AMP(70) |
>>> +		      MAX9286_REV_AMP_X);
>>> +	usleep_range(2000, 2500);
>>> +
>>> +	/*
>>> +	 * Enable GMSL links, mask unused ones and autodetect link
>>> +	 * used as CSI clock source.
>>> +	 */
>>> +	max9286_write(priv, 0x00, MAX9286_MSTLINKSEL_AUTO | priv->route_mask);
>>> +	max9286_write(priv, 0x0b, link_order[priv->route_mask]);
>>> +	max9286_write(priv, 0x69, (0xf & ~priv->route_mask));
>>> +
>>> +	/*
>>> +	 * Video format setup:
>>> +	 * Disable CSI output, VC is set according to Link number.
>>> +	 */
>>> +	max9286_write(priv, 0x15, MAX9286_VCTYPE | MAX9286_0X15_RESV);
>>> +
>>> +	/* Enable CSI-2 Lane D0-D3 only, DBL mode, YUV422 8-bit. */
>>> +	max9286_write(priv, 0x12, MAX9286_CSIDBL | MAX9286_DBL |
>>> +		      MAX9286_CSILANECNT(priv->csi2_data_lanes) |
>>> +		      MAX9286_DATATYPE_YUV422_8BIT);
>>> +
>>> +	/* Automatic: FRAMESYNC taken from the slowest Link. */
>>> +	max9286_write(priv, 0x01, MAX9286_FSYNCMODE_INT_HIZ |
>>> +		      MAX9286_FSYNCMETH_AUTO);
>>> +
>>> +	/* Enable HS/VS encoding, use D14/15 for HS/VS, invert VS. */
>>> +	max9286_write(priv, 0x0c, MAX9286_HVEN | MAX9286_INVVS |
>>> +		      MAX9286_HVSRC_D14);
> 
> Some of these configs in fact need some handshake between serializer and
> de-serializer. For example, I had to invert vsync in serializer [3] to make
> it work with this patch.
> 
> In addition to that, I need a couple of additional programmings on max9286
> (registers 0x0 to 0x63/0x64- disable overlap window and 0xf4 to 0x1c which
> oddly change reserved bits) to get frames. The datasheet doesn't explain
> enough for me to understand. I'm talking to Maxim to get more details and
> see if those can be handled by serilizer driver.

It seems Jacopo also had to disable the overlap window for the RDACM21:

https://jmondi.org/cgit/linux/commit/?h=gmsl/jmondi/platform/rdacm21&id=576bbaee7cc707869a0c5e90befd99c9e2cf754e

Please let us know if you hear back from Maxim.


> In a longer term, it'd be nice if such alignment between serializer and
> de-serializer is handled in more scalable way.

I agree, We are currently trying to tackle similar issues between our
two current cameras "RDACM20" and "RDACM21" which have different
requirements for the two configurations so we are trying to look at ways
to handle that too.

In particular we also need to handle:
 - Pixelrate control to determine CSI2 bus speed.
 - Link amplitude and threshold levels
 - Format differences

Are you still using the 'Sensing/Vision' (AR0231?) camera module that
Linaro were working with? (I currently have one, so let me know if you'd
like me to do any testing)


If they are of any use/reference to you, here are our current WIP
drivers for the RDACM20 [0] and RDACM21 [1] which Jacopo has been
developing which show how we currently separate the max9271 and sensor
packaging:


[0]
https://jmondi.org/cgit/linux/commit/?h=gmsl/jmondi/platform/rdacm21&id=d52329c6f2f7c07e5ad833f55f26ec0e329b0baf

[1]
https://jmondi.org/cgit/linux/commit/?h=gmsl/jmondi/platform/rdacm21&id=80dff408a63c22cda7da5f715968de8f2cbcbb35

(on branch
  https://jmondi.org/cgit/linux/log/?h=gmsl/jmondi/platform/rdacm21 )

Cheers

Kieran


> Thanks,
> -hyun
> 
> [1] https://github.com/xlnx-hyunkwon/linux-xlnx/commit/3bd2dded834492f4ee89e370c22877b97c2e106e
> [2] https://github.com/xlnx-hyunkwon/linux-xlnx/commit/fb0ad7fd699d90d6bbc78fc55dd98639389cfc5b
> [3] https://github.com/xlnx-hyunkwon/linux-xlnx/commit/fe0b33b174b2850bf0bb25b3a367319127ae12ee
> 

