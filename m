Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A91004C128D
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 13:16:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240302AbiBWMRE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 07:17:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238969AbiBWMRD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 07:17:03 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E373CAE6A;
        Wed, 23 Feb 2022 04:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645618595; x=1677154595;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4LoZeDLBYzFBlN86wCMXs/AqeJIDEyrTC1KNX8MbMDs=;
  b=bG1mquN4xqv3HpoI4CqWauxqlpA3ilgut40ert+7Z4PPpJp87hUFDOXS
   IhiJil5KMv2NjYy4/ltHTAyVg9CQi9wb2bMfTYabA3moJDyeL7BWwzIsk
   4LAdbY3RY9aaM1R4TMqq8WNiXxxSpN+z8RISyyC3gWyAgrYZIMQe1lijs
   sIDy3xgt16+9vGGZNin0rlnkFSIg5H+xFyuvXFkiIHo9jachSPJvA1JPw
   jcUdjG6JTbMDPludlYEv9esW5S1mEu4fbAFqMINtoABg1wE5KUoYsdfUW
   8NA+vzHHDKLGf3iFXVt2gv36UNeMMxCA14NY4dUmgI3KLuspXBp9H4pBP
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="232570754"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="232570754"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 04:16:35 -0800
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="607034007"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 04:16:30 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 6AB012028B;
        Wed, 23 Feb 2022 14:16:28 +0200 (EET)
Date:   Wed, 23 Feb 2022 14:16:28 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        p.zabel@pengutronix.de, Ian Arkver <ian.arkver.dev@gmail.com>,
        kernel@pengutronix.de, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v10 2/2] media: i2c: isl7998x: Add driver for Intersil
 ISL7998x
Message-ID: <YhYlnEBAh0QtRXZ0@paasikivi.fi.intel.com>
References: <20220217154407.2892822-1-m.tretter@pengutronix.de>
 <20220217154407.2892822-3-m.tretter@pengutronix.de>
 <2a2038bc-9f84-c451-deb3-1e807ac2f0d3@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a2038bc-9f84-c451-deb3-1e807ac2f0d3@xs4all.nl>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, Michael,

On Wed, Feb 23, 2022 at 12:51:49PM +0100, Hans Verkuil wrote:
> On 2/17/22 16:44, Michael Tretter wrote:
> > From: Marek Vasut <marex@denx.de>
> > 
> > Add driver for the Intersil ISL7998x Analog to MIPI CSI-2/BT656 decoder.
> > This chip supports 1/2/4 analog video inputs and converts them into
> > 1/2/4 VCs in MIPI CSI2 stream.
> > 
> > This driver currently supports ISL79987 and both 720x480 and 720x576
> > resolutions, however as per specification, all inputs must use the
> > same resolution and standard. The only supported pixel format is now
> > YUYV/YUV422. The chip should support RGB565 on the CSI2 as well, but
> > this is currently unsupported.
> > 
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > To: linux-media@vger.kernel.org
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > ---
> > Changelog:
> > 
> > v10:
> > 
> > - add a lock for subdev calls
> > - remove unnecessary pm_runtime_enabled
> > - fix indentation and format
> > - free controls on error
> > - fix set_standard call
> > - remove camel case in macro definitions
> > - add macros for video formats
> > - rework lookup of video standards
> > - add support for PAL Nc
> > - add explicit trigger for format detection
> > 
> > v9: none
> > 
> > v8:
> > 
> > - fix warning "type qualifiers ignored on function return type"
> > 
> > v7:
> > 
> > - reserve driver specific controls
> > - add documentation for driver specific controls
> > - implement g_input_status
> > - track device enabled state in driver
> > - store norm instead of mode in driver
> > - select test pattern based on video norm
> > - improve debug message for enabled test pattern
> > - fix off by one with 4 inputs
> > - implement querystd and friends
> > - fix polling condition for standard detection
> > - use v4l2_norm_to_name instead of custom implementation
> > 
> > v6:
> > 
> > - remove unused log2.h
> > - add select MEDIA_CONTROLLER
> > - use poll_read_timeout to wait for power on
> > - add timeout to polling for video standard
> > - use fwnode_graph_get_endpoint_by_id
> > - fix invalid bus type error message
> > 
> > v5: none
> > 
> > v4:
> > 
> > - fix lines over 80 chars where applicable
> > - fix possible NULL pointer access in link_freq
> > - initialize bus type with CSI2_DPHY
> > - iterate over pads instead of hard coded 4
> > - merge power_{on,off} functions into resume,suspend
> > - switch to v4l2_subdev_state
> > - report field order based on video standard
> > - add error message for timeout
> > - simplify dev_dbg statement in update_std
> > - call v4l2_ctrl_handler_setup
> > - don't set control if pm_runtime is not enabled
> > - fix YUV422 byte order
> > - switch to pre_streamon callback for LP11 mode
> > 
> > v3:
> > 
> > - follow dt binding change: pd-gpios -> powerdown-gpios
> > 
> > v2:
> > 
> > - general cleanup
> > - remove isl7998x_g_mbus_config function
> > - implement enum_frame_size function
> > - replace msleep with usleep_range
> > - rework set_fmt/get_fmt functions
> > - calculate number of inputs using number of input ports
> > - switch to runtime_pm
> > - add reset gpio
> > - add adv_debug support
> > - add MAINTAINERS entry
> > ---
> >  MAINTAINERS                        |    8 +
> >  drivers/media/i2c/Kconfig          |   10 +
> >  drivers/media/i2c/Makefile         |    1 +
> >  drivers/media/i2c/isl7998x.c       | 1633 ++++++++++++++++++++++++++++
> >  include/uapi/linux/v4l2-controls.h |    6 +
> >  5 files changed, 1658 insertions(+)
> >  create mode 100644 drivers/media/i2c/isl7998x.c
> > 
> 
> <snip>
> 
> > +static int isl7998x_pre_streamon(struct v4l2_subdev *sd, u32 flags)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> > +	struct device *dev = &client->dev;
> > +
> > +	if (flags & V4L2_SUBDEV_PRE_STREAMON_FL_MANUAL_LP)
> > +		return pm_runtime_resume_and_get(dev);
> > +
> > +	return 0;
> 
> This feels a bit scary: if V4L2_SUBDEV_PRE_STREAMON_FL_MANUAL_LP is NOT
> set, then pm_runtime_resume_and_get() isn't called, but this function
> still returns success...

Good find.

pm_runtime_resume_and_get() need to be called unconditionally.

Alternatively, store what was done here, and put the PM use count
accordingly below. But I see no reason to do that.

> 
> > +}
> > +
> > +static int isl7998x_post_streamoff(struct v4l2_subdev *sd)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> > +	struct device *dev = &client->dev;
> > +
> > +	pm_runtime_put(dev);
> 
> ...and pm_runtime_put() is called without the corresponding get.
> 
> The documentation in v4l2-subdev.h isn't very clear about what
> pre_streamon should return. I'm inclined to say that it should
> return -EACCES.
> 
> Sakari, what do you think?

It should return 0 if successful. Indeed we could make the return type
void, as this is simply tearing down what was set up previously.

-- 
Kind regards,

Sakari Ailus
