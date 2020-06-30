Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80DCB20FC28
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 20:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbgF3Sr0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 14:47:26 -0400
Received: from mga04.intel.com ([192.55.52.120]:53666 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726685AbgF3SrZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 14:47:25 -0400
IronPort-SDR: C4VHZ/hpOeqdZPxdLrQVRJypvjj7qq4OlP9nAx/0+qmZfiF4y+GKjENd+hpmg9D4DUy89zXiEC
 v5bWtmjcp7MQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="143837485"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; 
   d="scan'208";a="143837485"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2020 11:47:25 -0700
IronPort-SDR: rwVGtmfbR0pwoeXCRYv2ynGhpocdPidy3VhMUffP6vE5ltM9z9q9Ro5H3oFtn6JmunWuAzBog5
 RkAH5/3FZT7A==
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; 
   d="scan'208";a="481025031"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2020 11:47:21 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 1B272207F6; Tue, 30 Jun 2020 21:47:03 +0300 (EEST)
Date:   Tue, 30 Jun 2020 21:47:03 +0300
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
Subject: Re: [PATCH V11 2/2] media: i2c: ov02a10: Add OV02A10 image sensor
 driver
Message-ID: <20200630184702.GH16711@paasikivi.fi.intel.com>
References: <20200630024942.20891-1-dongchun.zhu@mediatek.com>
 <20200630024942.20891-3-dongchun.zhu@mediatek.com>
 <20200630170746.GD1212092@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630170746.GD1212092@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 30, 2020 at 05:07:46PM +0000, Tomasz Figa wrote:
> Hi Dongchun,
> 
> On Tue, Jun 30, 2020 at 10:49:42AM +0800, Dongchun Zhu wrote:
> > Add a V4L2 sub-device driver for OV02A10 image sensor.
> > 
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > ---
> >  MAINTAINERS                 |    1 +
> >  drivers/media/i2c/Kconfig   |   13 +
> >  drivers/media/i2c/Makefile  |    1 +
> >  drivers/media/i2c/ov02a10.c | 1052 +++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 1067 insertions(+)
> >  create mode 100644 drivers/media/i2c/ov02a10.c
> 
> Thank you for the patch. Please see my comments inline.
> 
> [snip]
> > +static int ov02a10_entity_init_cfg(struct v4l2_subdev *sd,
> > +				   struct v4l2_subdev_pad_config *cfg)
> > +{
> > +	struct v4l2_subdev_format fmt = {
> > +		.which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE,
> 
> As we discussed before, this function is never called with cfg == NULL.
> Perhaps what we need here is to call ov02a10_set_fmt() twice, once for
> V4L2_SUBDEV_FORMAT_ACTIVE and then for V4L2_SUBDEV_FORMAT_TRY?
> 
> Sakari, would that be a proper implementation of this function?

It's fine to test fmt, but it should be only done if the driver calls the
function with ACTIVE format. I.e. it can be removed here, and always use
TRY.

> 
> > +		.format = {
> > +			.width = 1600,
> > +			.height = 1200,
> > +		}
> > +	};
> > +
> > +	ov02a10_set_fmt(sd, cfg, &fmt);
> > +
> > +	return 0;
> [snip]
> 
> With this and Sakari's comment about the initial state of the reset pin
> fixed, feel free to add my
> 
> Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> 
> Best regards,
> Tomasz

-- 
Sakari Ailus
