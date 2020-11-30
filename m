Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 321822C8212
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 11:24:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728707AbgK3KXD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 05:23:03 -0500
Received: from mga11.intel.com ([192.55.52.93]:64856 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728701AbgK3KXC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 05:23:02 -0500
IronPort-SDR: cWIKIZiHxoKGvdHjUalC3E+e5pWzMQB96RzCdSmxXVUfqkcpeAkPpVd4XaU/GGWzr6LCaUBe8n
 NN9Xk/Z7SNUg==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="169114768"
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; 
   d="scan'208";a="169114768"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 02:21:20 -0800
IronPort-SDR: 2Ys0l+dOySjT7iIaXcGhVyMcuadkJoJC2D/zCGAiDK332dToVsWtQbFvYhdBmMbSg159jHCsBN
 MBP3sDs/r+rg==
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; 
   d="scan'208";a="549042641"
Received: from mkrastex-mobl.ger.corp.intel.com (HELO mkrastexMOBL) ([10.104.71.12])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 02:21:16 -0800
From:   <martinax.krasteva@linux.intel.com>
To:     "'Sakari Ailus'" <sakari.ailus@linux.intel.com>,
        "'Jacopo Mondi'" <jacopo@jmondi.org>
Cc:     <linux-media@vger.kernel.org>, <mchehab@kernel.org>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <daniele.alessandrelli@linux.intel.com>,
        <gjorgjix.rosikopulos@linux.intel.com>
References: <20201120142803.308-1-martinax.krasteva@linux.intel.com> <20201120142803.308-3-martinax.krasteva@linux.intel.com> <20201123111029.rcoxchzj332tu6y4@uno.localdomain> <20201123140223.GZ3940@paasikivi.fi.intel.com>
In-Reply-To: <20201123140223.GZ3940@paasikivi.fi.intel.com>
Subject: RE: [PATCH 2/2] media: Add imx334 camera sensor driver
Date:   Mon, 30 Nov 2020 10:21:12 -0000
Message-ID: <001f01d6c702$8b760d40$a26227c0$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGUhaCwHgQDECFXL9iGIzaOw1hzuAD6Gw3OAjgv4U8BySLfFqo9BoVA
Content-Language: en-us
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari, Jacopo,

Thank you for the review

> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Monday, November 23, 2020 2:02 PM
> To: Jacopo Mondi <jacopo@jmondi.org>
> Cc: Martina Krasteva <martinax.krasteva@linux.intel.com>; linux-
> media@vger.kernel.org; mchehab@kernel.org; robh+dt@kernel.org;
> devicetree@vger.kernel.org; daniele.alessandrelli@linux.intel.com;
> gjorgjix.rosikopulos@linux.intel.com
> Subject: Re: [PATCH 2/2] media: Add imx334 camera sensor driver
> 
> Hi Jacopo,
> 
> On Mon, Nov 23, 2020 at 12:10:29PM +0100, Jacopo Mondi wrote:
> ...
> > > +#include <media/v4l2-fwnode.h>
> >
> > You only use v4l2_async_register_subdev_sensor_common() from fwnde.h
> > If you think you can replace it with v4l2_async_register_subdev() (see
> > below comment) this should be changed in v4l2-async.h
> 
> Either is fine in principle. I'd use
> v4l2_async_register_subdev_sensor_common() for sensors though, as it
allows
> connecting lens and flash sub-devices.
> 
> Regarding DT bindings --- I wonder if there's a way to say these are
relevant for
> all sensors. That'd be another discussion though.
> 

Should I add lens and flash in DT binding doc, so it is clear that
connecting such sub-devs is supported?
I thought the binding doc should include only the bare minimum for a certain
driver to be used, but it does make sense adding this info.

> ...
> 
> > > +	const struct imx334_mode *cur_mode;
> > > +	struct mutex mutex;
> >
> > Checkpatch wants this mutex commented, but you have documentation so I
> > think it's fine
> 
> Yes.
> 
> ...
> 
> > > +static int imx334_read_reg(struct imx334 *imx334, u16 reg, u32 len,
> > > +u32 *val) {
> > > +	struct i2c_client *client = v4l2_get_subdevdata(&imx334->sd);
> > > +	u8 addr_buf[2] = { reg >> 8, reg & 0xff };
> > > +	struct i2c_msg msgs[2] = { 0 };
> > > +	u8 data_buf[4] = { 0 };
> > > +	int ret;
> > > +
> > > +	if (WARN_ON(len > 4))
> > > +		return -EINVAL;
> >
> > This function (and the associated write_reg) are for internal use
> > only. This mean the only one that can get 'len' wrong is this driver
> > itself. Is it worth checking for that ?
> 
> I'd leave it, as bad things will happen if that argument is wrong and the
check is
> removed.
> 
> >
> > > +
> > > +	/* Write register address */
> > > +	msgs[0].addr = client->addr;
> > > +	msgs[0].flags = 0;
> > > +	msgs[0].len = ARRAY_SIZE(addr_buf);
> > > +	msgs[0].buf = addr_buf;
> > > +
> > > +	/* Read data from register */
> > > +	msgs[1].addr = client->addr;
> > > +	msgs[1].flags = I2C_M_RD;
> > > +	msgs[1].len = len;
> > > +	msgs[1].buf = &data_buf[4 - len];
> > > +
> > > +	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> > > +	if (ret != ARRAY_SIZE(msgs))
> > > +		return -EIO;
> > > +
> > > +	*val = get_unaligned_be32(data_buf);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/**
> > > + * imx334_write_reg() - Write register
> > > + * @imx334: pointer to imx334 device
> >
> > writing kernel doc for functions with internal use only is sometimes
> > an effort which is nice to do but not required. If you want to go that
> > way try to stay consisitent, in this case you started the other
> > parameters descriptions with a capital letter.
> >
> > Also if you want kernel doc to be generated I think you would need to
> > include this file in the Documentation build, otherwise doc does not
> > get build as far as I can tell. To be hones I would drop the double **
> > and make this regular documentation (I'm no expert on this, maybe wait
> > for maintainer's feedback).
> 
> These comments don't contain anything that the driver user would be likely
to
> need, nor they document something that would be useful outside of the
scope
> of the driver itself. So I wouldn't add them to the build.
> 
> ...
> 
> > > +/**
> > > + * imx334_set_pad_format() - Set subdevice pad format
> > > + * @sd: pointer to imx334 V4L2 sub-device structure
> > > + * @cfg: V4L2 sub-device pad configuration
> > > + * @fmt: V4L2 sub-device format need to be set
> > > + *
> > > + * Return: 0 if successful, error code otherwise.
> > > + */
> > > +static int imx334_set_pad_format(struct v4l2_subdev *sd,
> > > +				 struct v4l2_subdev_pad_config *cfg,
> > > +				 struct v4l2_subdev_format *fmt) {
> > > +	struct imx334 *imx334 = to_imx334(sd);
> > > +	const struct imx334_mode *mode;
> > > +	int ret = 0;
> > > +
> > > +	mutex_lock(&imx334->mutex);
> > > +
> > > +	mode = &supported_mode;
> > > +	imx334_fill_pad_format(imx334, mode, fmt);
> > > +
> > > +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> > > +		struct v4l2_mbus_framefmt *framefmt;
> > > +
> > > +		framefmt = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
> > > +		*framefmt = fmt->format;
> > > +	} else {
> > > +		ret = imx334_update_controls(imx334, mode);
> >
> > How can controls change since you have a single supported format ?
> >
> > I think with a single format get_pad_fmt and set_pad_fmt could be
> > implemented by a single function.
> 
> I think it'd be fair to expect more supported configurations could be
added later
> on, and so leave in place code that supports that even if it's not needed
right
> now.
> 
> ...
> 
> > > +static const struct media_entity_operations imx334_subdev_entity_ops
= {
> > > +	.link_validate = v4l2_subdev_link_validate, };
> >
> > Is link_validate called on sensor subdev ? My understanding is that
> > they're called on the sink entity, but I might be mistaken.
> 
> Correct.
> 

This is what I read in the v4l2-subdev.rst:
" If the subdev driver intends to process video and integrate with the media
framework, it must implement format related functionality using
:c:type:`v4l2_subdev_pad_ops` instead of :c:type:`v4l2_subdev_video_ops`.

In that case, the subdev driver may set the link_validate field to provide
its own link validation function. <<The link validation function is called
for
every link in the pipeline where both of the ends of the links are V4L2
sub-devices.>> The driver is still responsible for validating the
correctness
of the format configuration between sub-devices and video nodes."

I find it a bit misleading, however I checked the source code, so I will
remove it in the next version.

Something that is not clear to me is, do I have to explicitly set
link_validate for the sink pad's entity to trigger validation. According to
the doc
I don't need to, but I cannot find the place in the source code where the
default func is called even if the op is not set, neither setting default
ops in case they weren't set.
 
"If link_validate op is not set, the default function
:c:func:`v4l2_subdev_link_validate_default` is used instead. This function
ensures that width, height and the media bus pixel code are equal on both
source
and sink of the link. Subdev drivers are also free to use this function to
perform the checks mentioned above in addition to their own checks."

Best Regards,
Martina

> --
> Kind regards,
> 
> Sakari Ailus

