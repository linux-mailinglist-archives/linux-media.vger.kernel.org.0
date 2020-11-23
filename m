Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD49A2C0CB5
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 15:14:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730063AbgKWODm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 09:03:42 -0500
Received: from mga02.intel.com ([134.134.136.20]:38166 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730016AbgKWODl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 09:03:41 -0500
IronPort-SDR: qE1YOPNmBPE7W3lAxYJfoIBnS/AgMnWfC6ugSv1gkBYVwUblzqqipC0QoO9DX36edV6sacCMmY
 JHUZOoBtoxYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="158809438"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="158809438"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 06:02:27 -0800
IronPort-SDR: A01REYm2AkSl1Q4TuDCCc8xZ7yY4e3VaMmEO0gYUH2ZPWdRm36OwVXQyy71NhXmqUmMy3G/zEk
 6B+hu9thU39g==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="364655004"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 06:02:25 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 462C8206D6; Mon, 23 Nov 2020 16:02:23 +0200 (EET)
Date:   Mon, 23 Nov 2020 16:02:23 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Martina Krasteva <martinax.krasteva@linux.intel.com>,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        daniele.alessandrelli@linux.intel.com,
        gjorgjix.rosikopulos@linux.intel.com
Subject: Re: [PATCH 2/2] media: Add imx334 camera sensor driver
Message-ID: <20201123140223.GZ3940@paasikivi.fi.intel.com>
References: <20201120142803.308-1-martinax.krasteva@linux.intel.com>
 <20201120142803.308-3-martinax.krasteva@linux.intel.com>
 <20201123111029.rcoxchzj332tu6y4@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201123111029.rcoxchzj332tu6y4@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Nov 23, 2020 at 12:10:29PM +0100, Jacopo Mondi wrote:
...
> > +#include <media/v4l2-fwnode.h>
> 
> You only use v4l2_async_register_subdev_sensor_common() from fwnde.h
> If you think you can replace it with v4l2_async_register_subdev() (see
> below comment) this should be changed in v4l2-async.h

Either is fine in principle. I'd use
v4l2_async_register_subdev_sensor_common() for sensors though, as it allows
connecting lens and flash sub-devices.

Regarding DT bindings --- I wonder if there's a way to say these are
relevant for all sensors. That'd be another discussion though.

...

> > +	const struct imx334_mode *cur_mode;
> > +	struct mutex mutex;
> 
> Checkpatch wants this mutex commented, but you have documentation so I
> think it's fine

Yes.

...

> > +static int imx334_read_reg(struct imx334 *imx334, u16 reg, u32 len, u32 *val)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(&imx334->sd);
> > +	u8 addr_buf[2] = { reg >> 8, reg & 0xff };
> > +	struct i2c_msg msgs[2] = { 0 };
> > +	u8 data_buf[4] = { 0 };
> > +	int ret;
> > +
> > +	if (WARN_ON(len > 4))
> > +		return -EINVAL;
> 
> This function (and the associated write_reg) are for internal use
> only. This mean the only one that can get 'len' wrong is this driver
> itself. Is it worth checking for that ?

I'd leave it, as bad things will happen if that argument is wrong and the
check is removed.

> 
> > +
> > +	/* Write register address */
> > +	msgs[0].addr = client->addr;
> > +	msgs[0].flags = 0;
> > +	msgs[0].len = ARRAY_SIZE(addr_buf);
> > +	msgs[0].buf = addr_buf;
> > +
> > +	/* Read data from register */
> > +	msgs[1].addr = client->addr;
> > +	msgs[1].flags = I2C_M_RD;
> > +	msgs[1].len = len;
> > +	msgs[1].buf = &data_buf[4 - len];
> > +
> > +	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> > +	if (ret != ARRAY_SIZE(msgs))
> > +		return -EIO;
> > +
> > +	*val = get_unaligned_be32(data_buf);
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * imx334_write_reg() - Write register
> > + * @imx334: pointer to imx334 device
> 
> writing kernel doc for functions with internal use only is sometimes
> an effort which is nice to do but not required. If you want to go that
> way try to stay consisitent, in this case you started the other
> parameters descriptions with a capital letter.
> 
> Also if you want kernel doc to be generated I think you would need to
> include this file in the Documentation build, otherwise doc does not
> get build as far as I can tell. To be hones I would drop the double **
> and make this regular documentation (I'm no expert on this, maybe wait
> for maintainer's feedback).

These comments don't contain anything that the driver user would be likely
to need, nor they document something that would be useful outside of the
scope of the driver itself. So I wouldn't add them to the build.

...

> > +/**
> > + * imx334_set_pad_format() - Set subdevice pad format
> > + * @sd: pointer to imx334 V4L2 sub-device structure
> > + * @cfg: V4L2 sub-device pad configuration
> > + * @fmt: V4L2 sub-device format need to be set
> > + *
> > + * Return: 0 if successful, error code otherwise.
> > + */
> > +static int imx334_set_pad_format(struct v4l2_subdev *sd,
> > +				 struct v4l2_subdev_pad_config *cfg,
> > +				 struct v4l2_subdev_format *fmt)
> > +{
> > +	struct imx334 *imx334 = to_imx334(sd);
> > +	const struct imx334_mode *mode;
> > +	int ret = 0;
> > +
> > +	mutex_lock(&imx334->mutex);
> > +
> > +	mode = &supported_mode;
> > +	imx334_fill_pad_format(imx334, mode, fmt);
> > +
> > +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> > +		struct v4l2_mbus_framefmt *framefmt;
> > +
> > +		framefmt = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
> > +		*framefmt = fmt->format;
> > +	} else {
> > +		ret = imx334_update_controls(imx334, mode);
> 
> How can controls change since you have a single supported format ?
> 
> I think with a single format get_pad_fmt and set_pad_fmt could be
> implemented by a single function.

I think it'd be fair to expect more supported configurations could be
added later on, and so leave in place code that supports that even if it's
not needed right now.

...

> > +static const struct media_entity_operations imx334_subdev_entity_ops = {
> > +	.link_validate = v4l2_subdev_link_validate,
> > +};
> 
> Is link_validate called on sensor subdev ? My understanding is that
> they're called on the sink entity, but I might be mistaken.

Correct.

-- 
Kind regards,

Sakari Ailus
