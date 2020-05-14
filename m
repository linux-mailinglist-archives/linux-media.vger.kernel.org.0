Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2CD1D2EA9
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 13:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgENLrL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 07:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgENLrK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 07:47:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 698A6C061A0C;
        Thu, 14 May 2020 04:47:10 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 583929A8;
        Thu, 14 May 2020 13:47:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589456827;
        bh=eLfueJYNU5P8wHTQCo7DsH/fKMPy1pOanOb2qKNl0uc=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=dEhJFvWNlRx419OnhJEdrdcc40eArhU9QJtMDJDglEXYzoZqe6lqbPtnfgq9uuQ4y
         YsIGywPxTwJRXkF+IAH1oBCJ8EQv1tOcsPuC4DPVfqOpAQMvHB+E36SfMTYgmdp5yT
         11Q140fPujKkvZ57vzZkO3ERBhokAg8Q6wJRp9tg=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v9 2/4] media: i2c: Add MAX9286 driver
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        sakari.ailus@iki.fi, Hans Verkuil <hverkuil@xs4all.nl>,
        Hyun Kwon <hyunk@xilinx.com>, Rob Herring <robh+dt@kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
References: <20200512155105.1068064-1-kieran.bingham+renesas@ideasonboard.com>
 <20200512155105.1068064-3-kieran.bingham+renesas@ideasonboard.com>
 <20200512181706.GA21014@Mani-XPS-13-9360>
 <11aca587-9438-4fba-081c-b82631e96989@ideasonboard.com>
 <20200514101356.GF2877@Mani-XPS-13-9360>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <d492cbcb-3b13-82b8-8e5d-0f49320170a2@ideasonboard.com>
Date:   Thu, 14 May 2020 12:47:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200514101356.GF2877@Mani-XPS-13-9360>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mani,

On 14/05/2020 11:13, Manivannan Sadhasivam wrote:
> Hi Kieran,
> 
> On Thu, May 14, 2020 at 11:02:53AM +0100, Kieran Bingham wrote:
>> Hi Mani,
>>
>> On 12/05/2020 19:17, Manivannan Sadhasivam wrote:
>>> On Tue, May 12, 2020 at 04:51:03PM +0100, Kieran Bingham wrote:
>>>> The MAX9286 is a 4-channel GMSL deserializer with coax or STP input and
>>>> CSI-2 output. The device supports multicamera streaming applications,
>>>> and features the ability to synchronise the attached cameras.
>>>>
>>>> CSI-2 output can be configured with 1 to 4 lanes, and a control channel
>>>> is supported over I2C, which implements an I2C mux to facilitate
>>>> communications with connected cameras across the reverse control
>>>> channel.
>>>>
>>>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>>>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>>>>
>>>> --
>>>> v2:
>>>>  - Fix MAINTAINERS entry
>>>>
>>>> This posting is released with the following modifications to work
>>>> without Sakari's VC developments:
>>>>  - max9286_g_mbus_config() re-instated
>>>>  - max9286_get_frame_desc() is not bus/csi aware
>>>>  - max9286_{get,set}_routing() removed
>>>>
>>>> v3:
>>>>  - Initialise notifier with v4l2_async_notifier_init
>>>>  - Update for new mbus csi2 format V4L2_MBUS_CSI2_DPHY
>>>>
>>>> v4: - Re-introduce required code to function with the VC series.
>>>>
>>>>  - Implement max9286_get_routing, max9286_set_routing
>>>>  - Remove max9286_g_mbus_config
>>>>
>>>> v5: (internal release)
>>>>  - Fix printk formatting for hex value
>>>>  - max9286->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE (add |)
>>>>  - MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER -> MEDIA_ENT_F_VID_IF_BRIDGE
>>>>  - Remove 'device is bound' workaround
>>>>
>>>> v6:
>>>>  - v4l2_subdev_krouting instead of v4l2_subdev_routing separated
>>>>    to allow integration without the VC/V4L2-Mux series.
>>>>  - convert sd_to_max9286 to inline function
>>>>  - rename max9286_device to max9286_priv
>>>>  - Cleanup the v4l2_async_notifier
>>>>  - Extend MODULE_AUTHOR
>>>>  - Replace of_graph_get_endpoint_by_regs with fwnode_graph_get_endpoint_by_id
>>>>  - Pass default bus type when parsing fwnode endpoint (Manivannan Sadhasivam)
>>>>  - Use new YAML file reference in MAINTAINERS
>>>>  - Parse new i2c-mux node in max9286_get_i2c_by_id
>>>>    (This could/should be refactored to parse these separately first)
>>>>  - Spelling and calculation fixes in the FSYNC_LOCKED check comments
>>>>  - Identify each enabled i2c-mux channel in a single pass
>>>>  - max9286: Improve mux-state readbility [v2]
>>>>  - Fix frame sync lock durations
>>>>  - Add comment to describe /why/ we must open the mux in s_stream
>>>>  - use -EXDEV as return code for failed link synchronisation.
>>>>  - Fix reference counting of the dt nodeS
>>>>  - Convert to probe_new for I2C
>>>>  - Remove redundant max9286_i2c_mux_state
>>>>  - Provide optional enable-gpio (max9286-pwdn)
>>>>
>>>> v7:
>>>>  [Kieran]
>>>>  - Ensure powerdown lines are optional
>>>>  - Add a 4ms power-up delay
>>>>  - Add max9286_check_config_link() to core
>>>>  - Add GPIO chip controller for GPIO0OUT and GPIO1OUT
>>>>  - Fix GPIO registration
>>>>  - max9286: Split out async registration
>>>>    (fixes regulator -EPROBE_DEFERs failures)
>>>>  - Collect all V4L2 registrations
>>>>  - balance v4l2_async refcnting
>>>>  - Rename max9286_v4l2_async_ => max9286_v4l2_notifier_
>>>>
>>>>  [Jacopo]
>>>>  - Remove redundanct MAXIM_I2C_SPEED macros
>>>>  - Move notifiers operations
>>>>  - Add delay after reverse channel reconfiguration
>>>>  - Move link setup to completion
>>>>  - Fix up max9286_check_config_link() implementation
>>>>  - Remove redundant dual configuration of reverse channel
>>>>
>>>> v8:
>>>>
>>>> [Kieran]
>>>>  - Update the bound_sources mask on unbind
>>>>  - Convert probe kzalloc usage to devm_ variant
>>>>  - Fix up cleanup path from GPIO PowerDown registration
>>>>  - cleanup GPIO device registration fail path
>>>>  - Convert to use devm_regulator_get()
>>>>  - Fit max9286_parse_dt print on one line
>>>>  - Move multi-device workarounds out of upstream driver
>>>>  - Remove I2C mod-table
>>>>  - Lock format changes
>>>>  - Describe pad index usage
>>>>  - Remove poc_enabled workaround
>>>>  - Rename the max9286_gpio to be more explicit on it's actions.
>>>>  - Move max9286_init_format call
>>>>  - Rework probe sequence and simplify error paths.
>>>>  - Simplify i2c comments
>>>>  - Implement Pixelrate control
>>>>  - Disable overlap window
>>>>
>>>> [Jacopo]
>>>>  - Adapt Kconfig to latest upstream changes
>>>>  - Put of node on error
>>>>  - Calculate pixel rate
>>>>  - Simplify overlap window disablement
>>>>
>>>> v9:
>>>>
>>>> [Kieran]
>>>>  - Kconfig: Depend on OF
>>>>  - Re-sort addition to Makefile
>>>> ---
>>>>  MAINTAINERS                 |   10 +
>>>>  drivers/media/i2c/Kconfig   |   13 +
>>>>  drivers/media/i2c/Makefile  |    1 +
>>>>  drivers/media/i2c/max9286.c | 1332 +++++++++++++++++++++++++++++++++++
>>>>  4 files changed, 1356 insertions(+)
>>>>  create mode 100644 drivers/media/i2c/max9286.c
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index a7bb6e22d5da..99e3bf7760fd 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -10274,6 +10274,16 @@ F:	Documentation/hwmon/max6697.rst
>>>>  F:	drivers/hwmon/max6697.c
>>>>  F:	include/linux/platform_data/max6697.h
>>>>  
>>>> +MAX9286 QUAD GMSL DESERIALIZER DRIVER
>>>> +M:	Jacopo Mondi <jacopo+renesas@jmondi.org>
>>>> +M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>>> +M:	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>>> +M:	Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>>>> +L:	linux-media@vger.kernel.org
>>>> +S:	Maintained
>>>> +F:	Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
>>>> +F:	drivers/media/i2c/max9286.c
>>>> +
>>>>  MAX9860 MONO AUDIO VOICE CODEC DRIVER
>>>>  M:	Peter Rosin <peda@axentia.se>
>>>>  L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
>>>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>>>> index 3abc80373ec0..2e390f41f6da 100644
>>>> --- a/drivers/media/i2c/Kconfig
>>>> +++ b/drivers/media/i2c/Kconfig
>>>> @@ -464,6 +464,19 @@ config VIDEO_VPX3220
>>>>  	  To compile this driver as a module, choose M here: the
>>>>  	  module will be called vpx3220.
>>>>  
>>>> +config VIDEO_MAX9286
>>>> +	tristate "Maxim MAX9286 GMSL deserializer support"
>>>> +	depends on I2C && I2C_MUX
>>>> +	depends on OF
>>>> +	select V4L2_FWNODE
>>>> +	select VIDEO_V4L2_SUBDEV_API
>>>> +	select MEDIA_CONTROLLER
>>>> +	help
>>>> +	  This driver supports the Maxim MAX9286 GMSL deserializer.
>>>> +
>>>> +	  To compile this driver as a module, choose M here: the
>>>> +	  module will be called max9286.
>>>> +
>>>>  comment "Video and audio decoders"
>>>>  
>>>>  config VIDEO_SAA717X
>>>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
>>>> index 77bf7d0b691f..f0b001ee4b05 100644
>>>> --- a/drivers/media/i2c/Makefile
>>>> +++ b/drivers/media/i2c/Makefile
>>>> @@ -117,6 +117,7 @@ obj-$(CONFIG_VIDEO_IMX274)	+= imx274.o
>>>>  obj-$(CONFIG_VIDEO_IMX290)	+= imx290.o
>>>>  obj-$(CONFIG_VIDEO_IMX319)	+= imx319.o
>>>>  obj-$(CONFIG_VIDEO_IMX355)	+= imx355.o
>>>> +obj-$(CONFIG_VIDEO_MAX9286)	+= max9286.o
>>>>  obj-$(CONFIG_VIDEO_ST_MIPID02) += st-mipid02.o
>>>>  
>>>>  obj-$(CONFIG_SDR_MAX2175) += max2175.o
>>>> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
>>>> new file mode 100644
>>>> index 000000000000..481d65f2b51d
>>>> --- /dev/null
>>>> +++ b/drivers/media/i2c/max9286.c
>>>> @@ -0,0 +1,1332 @@
>>>> +// SPDX-License-Identifier: GPL-2.0+
>>>> +/*
>>>> + * Maxim MAX9286 GMSL Deserializer Driver
>>>> + *
>>>> + * Copyright (C) 2017-2019 Jacopo Mondi
>>>> + * Copyright (C) 2017-2019 Kieran Bingham
>>>> + * Copyright (C) 2017-2019 Laurent Pinchart
>>>> + * Copyright (C) 2017-2019 Niklas Söderlund
>>>> + * Copyright (C) 2016 Renesas Electronics Corporation
>>>> + * Copyright (C) 2015 Cogent Embedded, Inc.
>>>> + */
>>>> +
>>>> +#include <linux/delay.h>
>>>> +#include <linux/device.h>
>>>> +#include <linux/fwnode.h>
>>>> +#include <linux/gpio/consumer.h>
>>>> +#include <linux/gpio/driver.h>
>>>> +#include <linux/i2c.h>
>>>> +#include <linux/i2c-mux.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/mutex.h>
>>>> +#include <linux/of_graph.h>
>>>> +#include <linux/regulator/consumer.h>
>>>> +#include <linux/slab.h>
>>>> +
>>>> +#include <media/v4l2-async.h>
>>>> +#include <media/v4l2-ctrls.h>
>>>> +#include <media/v4l2-device.h>
>>>> +#include <media/v4l2-fwnode.h>
>>>> +#include <media/v4l2-subdev.h>
>>>> +
>>>> +/* Register 0x00 */
>>>> +#define MAX9286_MSTLINKSEL_AUTO		(7 << 5)
>>>> +#define MAX9286_MSTLINKSEL(n)		((n) << 5)
>>>> +#define MAX9286_EN_VS_GEN		BIT(4)
>>>> +#define MAX9286_LINKEN(n)		(1 << (n))
>>>> +/* Register 0x01 */
>>>> +#define MAX9286_FSYNCMODE_ECU		(3 << 6)
>>>> +#define MAX9286_FSYNCMODE_EXT		(2 << 6)
>>>> +#define MAX9286_FSYNCMODE_INT_OUT	(1 << 6)
>>>> +#define MAX9286_FSYNCMODE_INT_HIZ	(0 << 6)
>>>> +#define MAX9286_GPIEN			BIT(5)
>>>> +#define MAX9286_ENLMO_RSTFSYNC		BIT(2)
>>>> +#define MAX9286_FSYNCMETH_AUTO		(2 << 0)
>>>> +#define MAX9286_FSYNCMETH_SEMI_AUTO	(1 << 0)
>>>> +#define MAX9286_FSYNCMETH_MANUAL	(0 << 0)
>>>> +#define MAX9286_REG_FSYNC_PERIOD_L	0x06
>>>> +#define MAX9286_REG_FSYNC_PERIOD_M	0x07
>>>> +#define MAX9286_REG_FSYNC_PERIOD_H	0x08
>>>> +/* Register 0x0a */
>>>> +#define MAX9286_FWDCCEN(n)		(1 << ((n) + 4))
>>>> +#define MAX9286_REVCCEN(n)		(1 << (n))
>>>> +/* Register 0x0c */
>>>> +#define MAX9286_HVEN			BIT(7)
>>>> +#define MAX9286_EDC_6BIT_HAMMING	(2 << 5)
>>>> +#define MAX9286_EDC_6BIT_CRC		(1 << 5)
>>>> +#define MAX9286_EDC_1BIT_PARITY		(0 << 5)
>>>> +#define MAX9286_DESEL			BIT(4)
>>>> +#define MAX9286_INVVS			BIT(3)
>>>> +#define MAX9286_INVHS			BIT(2)
>>>> +#define MAX9286_HVSRC_D0		(2 << 0)
>>>> +#define MAX9286_HVSRC_D14		(1 << 0)
>>>> +#define MAX9286_HVSRC_D18		(0 << 0)
>>>> +/* Register 0x0f */
>>>> +#define MAX9286_0X0F_RESERVED		BIT(3)
>>>> +/* Register 0x12 */
>>>> +#define MAX9286_CSILANECNT(n)		(((n) - 1) << 6)
>>>> +#define MAX9286_CSIDBL			BIT(5)
>>>> +#define MAX9286_DBL			BIT(4)
>>>> +#define MAX9286_DATATYPE_USER_8BIT	(11 << 0)
>>>> +#define MAX9286_DATATYPE_USER_YUV_12BIT	(10 << 0)
>>>> +#define MAX9286_DATATYPE_USER_24BIT	(9 << 0)
>>>> +#define MAX9286_DATATYPE_RAW14		(8 << 0)
>>>> +#define MAX9286_DATATYPE_RAW11		(7 << 0)
>>>> +#define MAX9286_DATATYPE_RAW10		(6 << 0)
>>>> +#define MAX9286_DATATYPE_RAW8		(5 << 0)
>>>> +#define MAX9286_DATATYPE_YUV422_10BIT	(4 << 0)
>>>> +#define MAX9286_DATATYPE_YUV422_8BIT	(3 << 0)
>>>> +#define MAX9286_DATATYPE_RGB555		(2 << 0)
>>>> +#define MAX9286_DATATYPE_RGB565		(1 << 0)
>>>> +#define MAX9286_DATATYPE_RGB888		(0 << 0)
>>>> +/* Register 0x15 */
>>>> +#define MAX9286_VC(n)			((n) << 5)
>>>> +#define MAX9286_VCTYPE			BIT(4)
>>>> +#define MAX9286_CSIOUTEN		BIT(3)
>>>> +#define MAX9286_0X15_RESV		(3 << 0)
>>>> +/* Register 0x1b */
>>>> +#define MAX9286_SWITCHIN(n)		(1 << ((n) + 4))
>>>> +#define MAX9286_ENEQ(n)			(1 << (n))
>>>> +/* Register 0x27 */
>>>> +#define MAX9286_LOCKED			BIT(7)
>>>> +/* Register 0x31 */
>>>> +#define MAX9286_FSYNC_LOCKED		BIT(6)
>>>> +/* Register 0x34 */
>>>> +#define MAX9286_I2CLOCACK		BIT(7)
>>>> +#define MAX9286_I2CSLVSH_1046NS_469NS	(3 << 5)
>>>> +#define MAX9286_I2CSLVSH_938NS_352NS	(2 << 5)
>>>> +#define MAX9286_I2CSLVSH_469NS_234NS	(1 << 5)
>>>> +#define MAX9286_I2CSLVSH_352NS_117NS	(0 << 5)
>>>> +#define MAX9286_I2CMSTBT_837KBPS	(7 << 2)
>>>> +#define MAX9286_I2CMSTBT_533KBPS	(6 << 2)
>>>> +#define MAX9286_I2CMSTBT_339KBPS	(5 << 2)
>>>> +#define MAX9286_I2CMSTBT_173KBPS	(4 << 2)
>>>> +#define MAX9286_I2CMSTBT_105KBPS	(3 << 2)
>>>> +#define MAX9286_I2CMSTBT_84KBPS		(2 << 2)
>>>> +#define MAX9286_I2CMSTBT_28KBPS		(1 << 2)
>>>> +#define MAX9286_I2CMSTBT_8KBPS		(0 << 2)
>>>> +#define MAX9286_I2CSLVTO_NONE		(3 << 0)
>>>> +#define MAX9286_I2CSLVTO_1024US		(2 << 0)
>>>> +#define MAX9286_I2CSLVTO_256US		(1 << 0)
>>>> +#define MAX9286_I2CSLVTO_64US		(0 << 0)
>>>> +/* Register 0x3b */
>>>> +#define MAX9286_REV_TRF(n)		((n) << 4)
>>>> +#define MAX9286_REV_AMP(n)		((((n) - 30) / 10) << 1) /* in mV */
>>>> +#define MAX9286_REV_AMP_X		BIT(0)
>>>> +/* Register 0x3f */
>>>> +#define MAX9286_EN_REV_CFG		BIT(6)
>>>> +#define MAX9286_REV_FLEN(n)		((n) - 20)
>>>> +/* Register 0x49 */
>>>> +#define MAX9286_VIDEO_DETECT_MASK	0x0f
>>>> +/* Register 0x69 */
>>>> +#define MAX9286_LFLTBMONMASKED		BIT(7)
>>>> +#define MAX9286_LOCKMONMASKED		BIT(6)
>>>> +#define MAX9286_AUTOCOMBACKEN		BIT(5)
>>>> +#define MAX9286_AUTOMASKEN		BIT(4)
>>>> +#define MAX9286_MASKLINK(n)		((n) << 0)
>>>> +
>>>> +/*
>>>> + * The sink and source pads are created to match the OF graph port numbers so
>>>> + * that their indexes can be used interchangeably.
>>>> + */
>>>> +#define MAX9286_NUM_GMSL		4
>>>> +#define MAX9286_N_SINKS			4
>>>> +#define MAX9286_N_PADS			5
>>>> +#define MAX9286_SRC_PAD			4
>>>> +
>>>> +struct max9286_source {
>>>> +	struct v4l2_async_subdev asd;
>>>> +	struct v4l2_subdev *sd;
>>>> +	struct fwnode_handle *fwnode;
>>>> +};
>>>> +
>>>> +#define asd_to_max9286_source(_asd) \
>>>> +	container_of(_asd, struct max9286_source, asd)
>>>> +
>>>> +struct max9286_priv {
>>>> +	struct i2c_client *client;
>>>> +	struct gpio_desc *gpiod_pwdn;
>>>> +	struct v4l2_subdev sd;
>>>> +	struct media_pad pads[MAX9286_N_PADS];
>>>> +	struct regulator *regulator;
>>>> +
>>>> +	struct gpio_chip gpio;
>>>> +	u8 gpio_state;
>>>> +
>>>> +	struct i2c_mux_core *mux;
>>>> +	unsigned int mux_channel;
>>>> +	bool mux_open;
>>>> +
>>>> +	struct v4l2_ctrl_handler ctrls;
>>>> +	struct v4l2_ctrl *pixelrate;
>>>> +
>>>> +	struct v4l2_mbus_framefmt fmt[MAX9286_N_SINKS];
>>>> +
>>>> +	/* Protects controls and fmt structures */
>>>> +	struct mutex mutex;
>>>> +
>>>> +	unsigned int nsources;
>>>> +	unsigned int source_mask;
>>>> +	unsigned int route_mask;
>>>> +	unsigned int bound_sources;
>>>> +	unsigned int csi2_data_lanes;
>>>> +	struct max9286_source sources[MAX9286_NUM_GMSL];
>>>> +	struct v4l2_async_notifier notifier;
>>>> +};
>>>> +
>>>
>>> [...]
>>>
>>>> +static int max9286_register_gpio(struct max9286_priv *priv)
>>>> +{
>>>> +	struct device *dev = &priv->client->dev;
>>>> +	struct gpio_chip *gpio = &priv->gpio;
>>>> +	int ret;
>>>> +
>>>> +	static const char * const names[] = {
>>>> +		"GPIO0OUT",
>>>> +		"GPIO1OUT",
>>>> +	};
>>>> +
>>>> +	/* Configure the GPIO */
>>>> +	gpio->label = dev_name(dev);
>>>
>>> So if you have more than one MAX9286 in a system, all gpiochips will appear
>>> with the same name. I'd recommend to append the index to distinguish properly.
>>
>> Ah yes, that's a good point, and I think I've even seen that.
>>
>> I'll fix it now.

Oh, in fact actually this doesn't.

gpiodetect prints:

gpiochip10 [4-004c] (2 lines)
gpiochip11 [4-006c] (2 lines)

and mostly references them as gpiochip10 and gpiochip11.

However,

> [    2.318533] gpio gpiochip11: Detected name collision for GPIO name 'GPIO0OUT'
> [    2.325739] gpio gpiochip11: Detected name collision for GPIO name 'GPIO1OUT'

That seems to be more of a problem for the gpio library, so I think I'll
just drop the const names. I don't think they add much value.


>>>> +	gpio->parent = dev;
>>>> +	gpio->owner = THIS_MODULE;
>>>> +	gpio->of_node = dev->of_node;
>>>> +	gpio->ngpio = 2;
>>>> +	gpio->base = -1;
>>>> +	gpio->set = max9286_gpio_set;
>>>> +	gpio->get = max9286_gpio_get;
>>>> +	gpio->can_sleep = true;
>>>> +	gpio->names = names;
>>>> +
>>>> +	/* GPIO values default to high */
>>>> +	priv->gpio_state = BIT(0) | BIT(1);
>>>> +
>>>> +	ret = devm_gpiochip_add_data(dev, gpio, priv);
>>>> +	if (ret)
>>>> +		dev_err(dev, "Unable to create gpio_chip\n");
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>
>>> [...]
>>>
>>>> +static int max9286_parse_dt(struct max9286_priv *priv)
>>>> +{
>>>> +	struct device *dev = &priv->client->dev;
>>>> +	struct device_node *i2c_mux;
>>>> +	struct device_node *node = NULL;
>>>> +	unsigned int i2c_mux_mask = 0;
>>>> +
>>>> +	of_node_get(dev->of_node);
>>>
>>> Why this is needed?
>>
>> Hrm .. I recall adding it to solve dt reference balancing.
>>
>> I wish I'd added a comment at the time ... as I can't recall the details
>> now.
>>
> 
> I understand that it is for the refcount balancing but I certainly don't see
> a need for it.
>  
>>>> +	i2c_mux = of_find_node_by_name(dev->of_node, "i2c-mux");
>>>> +	if (!i2c_mux) {
>>>> +		dev_err(dev, "Failed to find i2c-mux node\n");
>>>> +		of_node_put(dev->of_node);
>>>> +		return -EINVAL;
>>>> +	}
>>>> +
> [...]
>>>
>>> [...]
>>>
>>>> +static int max9286_remove(struct i2c_client *client)
>>>> +{
>>>> +	struct max9286_priv *priv = i2c_get_clientdata(client);
>>>> +
>>>> +	i2c_mux_del_adapters(priv->mux);
>>>> +
>>>> +	max9286_v4l2_unregister(priv);
>>>> +
>>>> +	regulator_disable(priv->regulator);
>>>> +
>>>> +	gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
>>>
>>> Usual power down sequence is to pull the power down gpio low and then turn off
>>> the regulators. This helps in clearing up the internal state machine properly.
>>
>> Do you mean usual, among drivers using regulators? or usual for the max9286?
>>
> 
> Usual for devices exposing shutdown gpios and powered by an external regulator.
> 
>> I have a platform which controls the regulators for the cameras
>> (priv->regulator) through one of the GPIOs provided by the MAX9286.
>>
>> If we powerdown the max9286 first, then we will not be able to change
>> the GPIO value on the gpio controlled regulator.
>>
> 
> Hmm, I didn't think of this usecase. Let's keep it as it is.
> 
> Thanks,
> Mani
> 
>> (Currently it doesn't expose as a gpio regulator, but just a gpio-hog -
>> but thats a different matter)
>>
>> --
>> Kieran
>>
>>
>>>
>>> Thanks,
>>> Mani
>>>
>>>> +
>>>> +	max9286_cleanup_dt(priv);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static const struct of_device_id max9286_dt_ids[] = {
>>>> +	{ .compatible = "maxim,max9286" },
>>>> +	{},
>>>> +};
>>>> +MODULE_DEVICE_TABLE(of, max9286_dt_ids);
>>>> +
>>>> +static struct i2c_driver max9286_i2c_driver = {
>>>> +	.driver	= {
>>>> +		.name		= "max9286",
>>>> +		.of_match_table	= of_match_ptr(max9286_dt_ids),
>>>> +	},
>>>> +	.probe_new	= max9286_probe,
>>>> +	.remove		= max9286_remove,
>>>> +};
>>>> +
>>>> +module_i2c_driver(max9286_i2c_driver);
>>>> +
>>>> +MODULE_DESCRIPTION("Maxim MAX9286 GMSL Deserializer Driver");
>>>> +MODULE_AUTHOR("Jacopo Mondi, Kieran Bingham, Laurent Pinchart, Niklas Söderlund, Vladimir Barinov");
>>>> +MODULE_LICENSE("GPL");
>>>> -- 
>>>> 2.25.1
>>>>
>>

