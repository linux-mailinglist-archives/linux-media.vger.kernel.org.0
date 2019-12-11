Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECF4111AD9F
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 15:36:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729823AbfLKOgz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 09:36:55 -0500
Received: from mga04.intel.com ([192.55.52.120]:41331 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729513AbfLKOgz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 09:36:55 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Dec 2019 06:36:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,301,1571727600"; 
   d="scan'208";a="220476305"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001.fm.intel.com with ESMTP; 11 Dec 2019 06:36:41 -0800
Received: from andy by smile with local (Exim 4.93-RC7)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1if36W-0000CJ-VS; Wed, 11 Dec 2019 16:36:40 +0200
Date:   Wed, 11 Dec 2019 16:36:40 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        sakari.ailus@linux.intel.com, drinkcat@chromium.org,
        tfiga@chromium.org, matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V6, 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
Message-ID: <20191211143640.GU32742@smile.fi.intel.com>
References: <20191211112849.16705-1-dongchun.zhu@mediatek.com>
 <20191211112849.16705-3-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191211112849.16705-3-dongchun.zhu@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 11, 2019 at 07:28:49PM +0800, Dongchun Zhu wrote:
> Add a V4L2 sub-device driver for OV02A10 image sensor. The OV02A10 is a
> 1/5" CMOS sensor from Omnivision, asupporting output format: 10-bit Raw.
> 
> This chip has a single MIPI lane interface and use the I2C bus for
> control and the CSI-2 bus for data.

...

> +#define OV02A10_MASK_8_BITS                            0xff

Besides GENMASK() why do you need a definition here? What's the point?

...

> +static int ov02a10_entity_init_cfg(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_pad_config *cfg)
> +{
> +	struct v4l2_subdev_format fmt = {
> +		.which = cfg ? V4L2_SUBDEV_FORMAT_TRY
> +			     : V4L2_SUBDEV_FORMAT_ACTIVE,
> +		.format = {
> +			.width = 1600,

> +			.height = 1200

Leave comma here.

> +		}
> +	};
> +
> +	ov02a10_set_fmt(sd, cfg, &fmt);
> +
> +	return 0;
> +}

...

> +	ret = i2c_smbus_write_byte_data(client, OV02A10_REG_GAIN,
> +					(val & OV02A10_MASK_8_BITS));

Too many parentheses.

> +	if (ret < 0)
> +		return ret;

...

> +static int ov02a10_set_vblank(struct ov02a10 *ov02a10, int val)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);

if you do

	int vts = val + ov02a10->cur_mode->height - OV02A10_BASIC_LINE;

you may increase readability below...

> +	int ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, REG_PAGE_SWITCH, REG_ENABLE);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, OV02A10_REG_VTS_H,
> +					(((val + ov02a10->cur_mode->height -
> +					OV02A10_BASIC_LINE) >>
> +					OV02A10_VTS_SHIFT) &
> +					OV02A10_MASK_8_BITS));

	ret = i2c_smbus_write_byte_data(client, OV02A10_REG_VTS_H,
					(vts >> OV02A10_VTS_SHIFT) &
					OV02A10_MASK_8_BITS));

And actually why do you need this mask here? Isn't enough to call

	ret = i2c_smbus_write_byte_data(client, OV02A10_REG_VTS_H,
					vts >> OV02A10_VTS_SHIFT);

here...


> +	if (ret < 0)
> +		return ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, OV02A10_REG_VTS_L,
> +					((val + ov02a10->cur_mode->height -
> +					OV02A10_BASIC_LINE) &
> +					OV02A10_MASK_8_BITS));

...and

	ret = i2c_smbus_write_byte_data(client, OV02A10_REG_VTS_L, vts);

here?

> +	if (ret < 0)
> +		return ret;
> +
> +	return i2c_smbus_write_byte_data(client, REG_GLOBAL_EFFECTIVE,
> +					 REG_ENABLE);
> +}

...

> +static int ov02a10_check_hwcfg(struct device *dev, struct ov02a10 *ov02a10)
> +{
> +	struct fwnode_handle *ep;
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
> +	struct v4l2_fwnode_endpoint bus_cfg = {

> +		.bus_type = V4L2_MBUS_CSI2_DPHY

Leave comma here.

> +	};
> +	unsigned int i, j;
> +	int ret;

> +	if (!fwnode)
> +		return -ENXIO;

A bit strange error code here.

> +
> +	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> +	if (!ep)
> +		return -ENXIO;
> +
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	fwnode_handle_put(ep);
> +	if (ret)
> +		return ret;

> +	if (!bus_cfg.nr_of_link_frequencies) {
> +		dev_err(dev, "no link frequencies defined");
> +		ret = -EINVAL;
> +		goto check_hwcfg_error;
> +	}

I still think it's redundant check, though it's up to maintainers.

> +
> +	for (i = 0; i < ARRAY_SIZE(link_freq_menu_items); i++) {
> +		for (j = 0; j < bus_cfg.nr_of_link_frequencies; j++) {
> +			if (link_freq_menu_items[i] ==
> +				bus_cfg.link_frequencies[j])
> +				break;
> +		}
> +
> +		if (j == bus_cfg.nr_of_link_frequencies) {
> +			dev_err(dev, "no link frequency %lld supported",
> +				link_freq_menu_items[i]);
> +			ret = -EINVAL;
> +			goto check_hwcfg_error;
> +		}
> +	}
> +
> +check_hwcfg_error:
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +	return ret;
> +}

...

> +static int ov02a10_probe(struct i2c_client *client)
> +{

> +	/* Optional indication of physical rotation of sensor */
> +	ret = fwnode_property_read_u32(dev_fwnode(dev), "rotation", &rotation);

> +	if (!ret) {

Why not positive conditional?

> +		ov02a10->upside_down = rotation == 180;
> +		if (rotation == 180) {
> +			ov02a10->upside_down = true;
> +			ov02a10->fmt.code = MEDIA_BUS_FMT_SRGGB10_1X10;
> +		}
> +	} else {
> +		dev_warn(dev, "failed to get rotation\n");
> +	}
> +
> +	/* Optional indication of mipi TX speed */
> +	ret = fwnode_property_read_u32(dev_fwnode(dev), "ovti,mipi-tx-speed",
> +				       &clock_lane_tx_speed);
> +

> +	if (!ret)

Ditto.

> +		ov02a10->mipi_clock_tx_speed = clock_lane_tx_speed;
> +	else
> +		dev_warn(dev, "failed to get mipi tx speed, using default...\n");
> +

> +	return ret;
> +}

-- 
With Best Regards,
Andy Shevchenko


