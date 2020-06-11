Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D3061F64FD
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2020 11:53:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbgFKJxl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jun 2020 05:53:41 -0400
Received: from mga18.intel.com ([134.134.136.126]:44837 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726864AbgFKJxl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jun 2020 05:53:41 -0400
IronPort-SDR: Sms9Q2Hm/JkSkW4tVuMabxfb07/On+egWnY/F3NkAylRi2vpBSGDT3POL3CkaaQ0cv523qHVvr
 SKjr/BcRvl2Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2020 02:53:41 -0700
IronPort-SDR: dHCsEc4njPF+kHjdOEWILszXP2QQ+HFtapoZFzJIsrkp1puF+YHOe0YdbiUqnorzm8NusR4716
 26t59K7DO3yA==
X-IronPort-AV: E=Sophos;i="5.73,499,1583222400"; 
   d="scan'208";a="350138738"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2020 02:53:35 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 6E06720680; Thu, 11 Jun 2020 12:53:33 +0300 (EEST)
Date:   Thu, 11 Jun 2020 12:53:33 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, mchehab@kernel.org,
        andriy.shevchenko@linux.intel.com, robh+dt@kernel.org,
        mark.rutland@arm.com, drinkcat@chromium.org,
        matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V9, 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
Message-ID: <20200611095333.GK16711@paasikivi.fi.intel.com>
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
 <20200523084103.31276-3-dongchun.zhu@mediatek.com>
 <20200610194455.GK201868@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200610194455.GK201868@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On Wed, Jun 10, 2020 at 07:44:55PM +0000, Tomasz Figa wrote:
> Hi Dongchun,
> 
> On Sat, May 23, 2020 at 04:41:03PM +0800, Dongchun Zhu wrote:
> > Add a V4L2 sub-device driver for OV02A10 image sensor.
> > 
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > ---
> >  MAINTAINERS                 |    1 +
> >  drivers/media/i2c/Kconfig   |   13 +
> >  drivers/media/i2c/Makefile  |    1 +
> >  drivers/media/i2c/ov02a10.c | 1025 +++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 1040 insertions(+)
> >  create mode 100644 drivers/media/i2c/ov02a10.c
> > 
> 
> Thank you for the patch. Please see my comments inline.
> 
> [snip]
> > diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
> > new file mode 100644
> > index 0000000..160a0b5
> > --- /dev/null
> > +++ b/drivers/media/i2c/ov02a10.c
> [snip]
> > +static const char * const ov02a10_test_pattern_menu[] = {
> > +	"Disabled",
> > +	"Color Bar",
> 
> nit: We should normalize this to one of the standard names. What is the
> pattern on this sensor? Is it perhaps "Eight Vertical Colour Bars"?
> 
> > +};
> [snip]
> > +static int ov02a10_set_fmt(struct v4l2_subdev *sd,
> > +			   struct v4l2_subdev_pad_config *cfg,
> > +			   struct v4l2_subdev_format *fmt)
> > +{
> > +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > +	struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
> > +
> > +	mutex_lock(&ov02a10->mutex);
> > +
> 
> 
> Don't we need to handle the case when fmt->which is V4L2_SUBDEV_FORMAT_TRY,
> which is used for trying the format, but not applying it to the hardware?

Yes.

> 
> > +	if (ov02a10->streaming) {
> > +		mutex_unlock(&ov02a10->mutex);
> > +		return -EBUSY;
> > +	}
> > +
> > +	/* Only one sensor mode supported */
> > +	mbus_fmt->code = ov02a10->fmt.code;
> > +	ov02a10_fill_fmt(ov02a10->cur_mode, mbus_fmt);
> > +	ov02a10->fmt = fmt->format;
> > +
> > +	mutex_unlock(&ov02a10->mutex);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ov02a10_get_fmt(struct v4l2_subdev *sd,
> > +			   struct v4l2_subdev_pad_config *cfg,
> > +			   struct v4l2_subdev_format *fmt)
> > +{
> > +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > +	struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
> > +
> > +	mutex_lock(&ov02a10->mutex);
> > +
> > +	fmt->format = ov02a10->fmt;
> 
> Ditto.
> 
> > +	mbus_fmt->code = ov02a10->fmt.code;
> > +	ov02a10_fill_fmt(ov02a10->cur_mode, mbus_fmt);
> > +
> > +	mutex_unlock(&ov02a10->mutex);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ov02a10_enum_mbus_code(struct v4l2_subdev *sd,
> > +				  struct v4l2_subdev_pad_config *cfg,
> > +				  struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > +
> > +	if (code->index >= ARRAY_SIZE(supported_modes))
> > +		return -EINVAL;
> 
> Hmm, supported_modes[] doesn't seem to hold the information about mbus
> codes. Should this just perhaps be "!= 0"?
> 
> > +
> > +	code->code = ov02a10->fmt.code;
> > +
> > +	return 0;
> > +}
> [snip]
> > +static int ov02a10_entity_init_cfg(struct v4l2_subdev *sd,
> > +				   struct v4l2_subdev_pad_config *cfg)
> > +{
> > +	struct v4l2_subdev_format fmt = {
> > +		.which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE,
> > +		.format = {
> > +			.width = 1600,
> > +			.height = 1200,
> > +		}
> > +	};
> > +
> > +	ov02a10_set_fmt(sd, cfg, &fmt);
> > +
> > +	return 0;
> > +}
> > +
> 
> I'm not familiar with this init_cfg operation and the documentation is very
> sparse about it. Sakari, is this a correct implementation?

The purpose is to initialise a pad configuration (format and selection
rectangles) to the device defaults. As there seem to be no selection
rectangles, this seems fine to me.

-- 
Regards,

Sakari Ailus
