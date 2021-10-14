Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1704942D629
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 11:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbhJNJgR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 05:36:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbhJNJgQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 05:36:16 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2600C061746
        for <linux-media@vger.kernel.org>; Thu, 14 Oct 2021 02:34:11 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1max7q-0006RI-1e; Thu, 14 Oct 2021 11:34:10 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1max7p-0006Gr-EY; Thu, 14 Oct 2021 11:34:09 +0200
Date:   Thu, 14 Oct 2021 11:34:09 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        kernel@pengutronix.de
Subject: Re: [PATCH v5 3/3] media: i2c: isl7998x: Add driver for Intersil
 ISL7998x
Message-ID: <20211014093409.GC31981@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>, kernel@pengutronix.de
References: <20211012084150.755160-1-m.tretter@pengutronix.de>
 <20211012084150.755160-4-m.tretter@pengutronix.de>
 <f4fca151a04b1c30fca7b2f40dacb2a3b4b4f2c6.camel@pengutronix.de>
 <20211013080530.GB31981@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211013080530.GB31981@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:14:33 up 238 days, 12:38, 136 users,  load average: 0.26, 0.23,
 0.23
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 13 Oct 2021 10:05:30 +0200, Michael Tretter wrote:
> On Tue, 12 Oct 2021 15:27:11 +0200, Philipp Zabel wrote:
> > On Tue, 2021-10-12 at 10:41 +0200, Michael Tretter wrote:
> > > From: Marek Vasut <marex@denx.de>
> > > 
> > > Add driver for the Intersil ISL7998x Analog to MIPI CSI-2/BT656 decoder.
> > > This chip supports 1/2/4 analog video inputs and converts them into
> > > 1/2/4 VCs in MIPI CSI2 stream.
> > > 
> > > This driver currently supports ISL79987 and both 720x480 and 720x576
> > > resolutions, however as per specification, all inputs must use the
> > > same resolution and standard. The only supported pixel format is now
> > > YUYV/YUV422. The chip should support RGB565 on the CSI2 as well, but
> > > this is currently unsupported.
> > > 
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > To: linux-media@vger.kernel.org
> > > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > > ---
> > > Changelog:
> > > 
> > > v5: none
> > > 
> > > v4:
> > > 
> > > - fix lines over 80 chars where applicable
> > > - fix possible NULL pointer access in link_freq
> > > - initialize bus type with CSI2_DPHY
> > > - iterate over pads instead of hard coded 4
> > > - merge power_{on,off} functions into resume,suspend
> > > - switch to v4l2_subdev_state
> > > - report field order based on video standard
> > > - add error message for timeout
> > > - simplify dev_dbg statement in update_std
> > > - call v4l2_ctrl_handler_setup
> > > - don't set control if pm_runtime is not enabled
> > > - fix YUV422 byte order
> > > - switch to pre_streamon callback for LP11 mode
> > > 
> > > v3:
> > > 
> > > - follow dt binding change: pd-gpios -> powerdown-gpios
> > > 
> > > v2:
> > > 
> > > - general cleanup
> > > - remove isl7998x_g_mbus_config function
> > > - implement enum_frame_size function
> > > - replace msleep with usleep_range
> > > - rework set_fmt/get_fmt functions
> > > - calculate number of inputs using number of input ports
> > > - switch to runtime_pm
> > > - add reset gpio
> > > - add adv_debug support
> > > - add MAINTAINERS entry
> > > ---
> > >  MAINTAINERS                  |    8 +
> > >  drivers/media/i2c/Kconfig    |    9 +
> > >  drivers/media/i2c/Makefile   |    1 +
> > >  drivers/media/i2c/isl7998x.c | 1416 ++++++++++++++++++++++++++++++++++
> > >  4 files changed, 1434 insertions(+)
> > >  create mode 100644 drivers/media/i2c/isl7998x.c
> > > 
[...]
> > > diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
> > > new file mode 100644
[...]
> > > +static int isl7998x_wait_power_on(struct isl7998x *isl7998x)
> > > +{
> > > +	struct device *dev = isl7998x->subdev.dev;
> > > +	unsigned int retry;
> > > +	u32 chip_id;
> > > +	int ret = -ETIMEDOUT;
> > > +
> > > +	for (retry = 10; ret && retry > 0; retry--) {
> > > +		ret = regmap_read(isl7998x->regmap,
> > > +				  ISL7998x_REG_P0_PRODUCT_ID_CODE, &chip_id);
> > > +		usleep_range(1000, 2000);
> > > +	}
> > 
> > Consider using regmap_read_poll_timeout() here.
> 
> Ack. I forgot about this function.

regmap_read_poll_timeout() cannot be used here, because it returns if
regmap_read() returns an error. The driver uses the return value of
regmap_read() to detect, if the chip is available, and should continue polling
if regmap_read() failed. I can implement the necessary behavior with
read_poll_timeout(), but am not sure if it is really worth it.

Michael
