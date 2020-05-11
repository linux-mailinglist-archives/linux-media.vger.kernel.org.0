Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1B751CD518
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 11:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729532AbgEKJdL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 05:33:11 -0400
Received: from mga12.intel.com ([192.55.52.136]:33548 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729529AbgEKJdK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 05:33:10 -0400
IronPort-SDR: RgQtd9rP8233Y9yvMg3fk7LOgvTrZrjafupW2FIBOxq+nkzUuzrV6GqmComyJexjd5ZtYF4gg1
 fN3iQOjCQtRg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2020 02:33:10 -0700
IronPort-SDR: ONYW+QqYbjMLn1MDFmvWENe6egF5WQnYr3Nj7Te1ktN7xBvPMhyHdGCfc/X9xjhrYEJUEWRnwl
 KL4sexatOzeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,379,1583222400"; 
   d="scan'208";a="371171194"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001.fm.intel.com with ESMTP; 11 May 2020 02:33:06 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jY4o8-005vQO-I5; Mon, 11 May 2020 12:33:08 +0300
Date:   Mon, 11 May 2020 12:33:08 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        sakari.ailus@linux.intel.com, drinkcat@chromium.org,
        tfiga@chromium.org, matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V8, 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
Message-ID: <20200511093308.GF185537@smile.fi.intel.com>
References: <20200509080627.23222-1-dongchun.zhu@mediatek.com>
 <20200509080627.23222-3-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200509080627.23222-3-dongchun.zhu@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, May 09, 2020 at 04:06:27PM +0800, Dongchun Zhu wrote:
> Add a V4L2 sub-device driver for OV02A10 image sensor.

...

> +#define OV02A10_ID(_msb, _lsb)				((_msb) << 8 | (_lsb))

How often do you use this macro?

...

> +static int ov02a10_read_smbus(struct ov02a10 *ov02a10, unsigned char reg,
> +			      unsigned char *val)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> +	int ret;
> +
> +	ret = i2c_smbus_read_byte_data(client, reg);

> +

Extra blank line.

> +	if (ret < 0)
> +		return ret;
> +
> +	*val = (unsigned char)ret;
> +
> +	return 0;
> +}

...

> +static int ov02a10_entity_init_cfg(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_pad_config *cfg)
> +{
> +	struct v4l2_subdev_format fmt = {

> +		.which = cfg ? V4L2_SUBDEV_FORMAT_TRY
> +			     : V4L2_SUBDEV_FORMAT_ACTIVE,

I think it would be fine to have it on one line.

> +		.format = {
> +			.width = 1600,
> +			.height = 1200,
> +		}
> +	};
> +
> +	ov02a10_set_fmt(sd, cfg, &fmt);
> +
> +	return 0;
> +}

...

> +	if (!ret) {
> +		if (rotation == 180) {

if (a) {
	if (b) {
		...
	}
}

==

if (a && b) {
	...
}

> +			ov02a10->upside_down = true;
> +			ov02a10->fmt.code = MEDIA_BUS_FMT_SRGGB10_1X10;
> +		}
> +	}

-- 
With Best Regards,
Andy Shevchenko


