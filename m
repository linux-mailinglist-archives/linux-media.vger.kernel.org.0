Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65FE1297152
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 16:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750604AbgJWObC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 10:31:02 -0400
Received: from mga06.intel.com ([134.134.136.31]:45521 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S374727AbgJWObC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 10:31:02 -0400
IronPort-SDR: oC6mmcDSb5lpsvuHSgkCHh//v4fpVjPSeMb1Vd2Td35SfjswTrK1ns8FB118noLf2CqkKjAcgK
 0pNdFCtALYUQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="229317322"
X-IronPort-AV: E=Sophos;i="5.77,408,1596524400"; 
   d="scan'208";a="229317322"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2020 07:30:58 -0700
IronPort-SDR: strZ7qZQpzKzpW+H9q1kQAGAQ2o4KKVxcx2BObcjmBmCxf0w5J4zy48ak1cHbj/rIJ9J49uzSh
 S2ndozz2CtvA==
X-IronPort-AV: E=Sophos;i="5.77,408,1596524400"; 
   d="scan'208";a="523514927"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2020 07:30:54 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kVy6m-00E8jW-Fi; Fri, 23 Oct 2020 17:31:56 +0300
Date:   Fri, 23 Oct 2020 17:31:56 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        sakari.ailus@linux.intel.com, drinkcat@chromium.org,
        tfiga@chromium.org, matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [PATCH v15 2/2] media: i2c: Add OV02A10 image sensor driver
Message-ID: <20201023143156.GX4077@smile.fi.intel.com>
References: <20201013130503.2412-1-dongchun.zhu@mediatek.com>
 <20201013130503.2412-3-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013130503.2412-3-dongchun.zhu@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 13, 2020 at 09:05:03PM +0800, Dongchun Zhu wrote:
> Add a V4L2 sub-device driver for OmniVision OV02A10 image sensor.

...

> +#define OV02A10_ID_MASK					0xffff

GENMASK()

(And include bits.h for that)

...

> +static int __ov02a10_start_stream(struct ov02a10 *ov02a10)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> +	const struct ov02a10_reg_list *reg_list;
> +	int ret;
> +
> +	/* Apply default values of current mode */
> +	reg_list = &ov02a10->cur_mode->reg_list;
> +	ret = ov02a10_write_array(ov02a10, reg_list);
> +	if (ret)
> +		return ret;
> +
> +	/* Apply customized values from user */
> +	ret = __v4l2_ctrl_handler_setup(ov02a10->subdev.ctrl_handler);
> +	if (ret)
> +		return ret;
> +
> +	/* Set orientation to 180 degree */
> +	if (ov02a10->upside_down) {
> +		ret = i2c_smbus_write_byte_data(client, REG_MIRROR_FLIP_CONTROL,
> +						REG_MIRROR_FLIP_ENABLE);
> +		if (ret) {

Shouldn't you use 'ret < 0' here as well?

> +			dev_err(&client->dev, "failed to set orientation\n");
> +			return ret;
> +		}
> +		ret = i2c_smbus_write_byte_data(client, REG_GLOBAL_EFFECTIVE,
> +						REG_ENABLE);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	/* Set MIPI TX speed according to DT property */
> +	if (ov02a10->mipi_clock_voltage != OV02A10_MIPI_TX_SPEED_DEFAULT) {
> +		ret = i2c_smbus_write_byte_data(client, TX_SPEED_AREA_SEL,
> +						ov02a10->mipi_clock_voltage);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	/* Set stream on register */
> +	return i2c_smbus_write_byte_data(client, REG_SC_CTRL_MODE,
> +					 SC_CTRL_MODE_STREAMING);
> +}

...

> +/*

Was your intention to declare it as a kernel doc?

> + * ov02a10_set_exposure - Function called when setting exposure time
> + * @priv: Pointer to device structure
> + * @val: Variable for exposure time, in the unit of micro-second
> + *
> + * Set exposure time based on input value.
> + *
> + * Return: 0 on success
> + */
> +static int ov02a10_set_exposure(struct ov02a10 *ov02a10, int val)

...

> +static int ov02a10_check_hwcfg(struct device *dev, struct ov02a10 *ov02a10)
> +{
> +	struct fwnode_handle *ep;
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> +	};
> +	unsigned int i, j;
> +	int ret;

> +	if (!fwnode)
> +		return -EINVAL;

Basically you can avoid this check, but it's up to you.

> +	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> +	if (!ep)
> +		return -ENXIO;
> +
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	fwnode_handle_put(ep);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < ARRAY_SIZE(link_freq_menu_items); i++) {
> +		for (j = 0; j < bus_cfg.nr_of_link_frequencies; j++) {
> +			if (link_freq_menu_items[i] ==
> +				bus_cfg.link_frequencies[j]) {
> +				ov02a10->freq_index = i;
> +				break;
> +			}
> +		}
> +
> +		if (j == bus_cfg.nr_of_link_frequencies) {
> +			dev_err(dev, "no link frequency %lld supported\n",
> +				link_freq_menu_items[i]);
> +			ret = -EINVAL;
> +			break;
> +		}
> +	}
> +
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +	return ret;
> +}

...

> +	fwnode_property_read_u32(dev_fwnode(dev), "rotation", &rotation);

Same Q as per previous reviews. Why device property API can't be used here?

And everywhere else when you have
	 fwnode_property_read_*(dev_fwnode(dev), ...)
calls.

-- 
With Best Regards,
Andy Shevchenko


