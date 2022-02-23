Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 532F34C11EF
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 12:52:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236123AbiBWLwi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 06:52:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237855AbiBWLwf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 06:52:35 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1B0B3BF87;
        Wed, 23 Feb 2022 03:51:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5D8C160AE3;
        Wed, 23 Feb 2022 11:51:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E90C340E7;
        Wed, 23 Feb 2022 11:51:51 +0000 (UTC)
Message-ID: <2a2038bc-9f84-c451-deb3-1e807ac2f0d3@xs4all.nl>
Date:   Wed, 23 Feb 2022 12:51:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v10 2/2] media: i2c: isl7998x: Add driver for Intersil
 ISL7998x
Content-Language: en-US
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        p.zabel@pengutronix.de, Ian Arkver <ian.arkver.dev@gmail.com>,
        kernel@pengutronix.de, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>
References: <20220217154407.2892822-1-m.tretter@pengutronix.de>
 <20220217154407.2892822-3-m.tretter@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220217154407.2892822-3-m.tretter@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/17/22 16:44, Michael Tretter wrote:
> From: Marek Vasut <marex@denx.de>
> 
> Add driver for the Intersil ISL7998x Analog to MIPI CSI-2/BT656 decoder.
> This chip supports 1/2/4 analog video inputs and converts them into
> 1/2/4 VCs in MIPI CSI2 stream.
> 
> This driver currently supports ISL79987 and both 720x480 and 720x576
> resolutions, however as per specification, all inputs must use the
> same resolution and standard. The only supported pixel format is now
> YUYV/YUV422. The chip should support RGB565 on the CSI2 as well, but
> this is currently unsupported.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> To: linux-media@vger.kernel.org
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
> Changelog:
> 
> v10:
> 
> - add a lock for subdev calls
> - remove unnecessary pm_runtime_enabled
> - fix indentation and format
> - free controls on error
> - fix set_standard call
> - remove camel case in macro definitions
> - add macros for video formats
> - rework lookup of video standards
> - add support for PAL Nc
> - add explicit trigger for format detection
> 
> v9: none
> 
> v8:
> 
> - fix warning "type qualifiers ignored on function return type"
> 
> v7:
> 
> - reserve driver specific controls
> - add documentation for driver specific controls
> - implement g_input_status
> - track device enabled state in driver
> - store norm instead of mode in driver
> - select test pattern based on video norm
> - improve debug message for enabled test pattern
> - fix off by one with 4 inputs
> - implement querystd and friends
> - fix polling condition for standard detection
> - use v4l2_norm_to_name instead of custom implementation
> 
> v6:
> 
> - remove unused log2.h
> - add select MEDIA_CONTROLLER
> - use poll_read_timeout to wait for power on
> - add timeout to polling for video standard
> - use fwnode_graph_get_endpoint_by_id
> - fix invalid bus type error message
> 
> v5: none
> 
> v4:
> 
> - fix lines over 80 chars where applicable
> - fix possible NULL pointer access in link_freq
> - initialize bus type with CSI2_DPHY
> - iterate over pads instead of hard coded 4
> - merge power_{on,off} functions into resume,suspend
> - switch to v4l2_subdev_state
> - report field order based on video standard
> - add error message for timeout
> - simplify dev_dbg statement in update_std
> - call v4l2_ctrl_handler_setup
> - don't set control if pm_runtime is not enabled
> - fix YUV422 byte order
> - switch to pre_streamon callback for LP11 mode
> 
> v3:
> 
> - follow dt binding change: pd-gpios -> powerdown-gpios
> 
> v2:
> 
> - general cleanup
> - remove isl7998x_g_mbus_config function
> - implement enum_frame_size function
> - replace msleep with usleep_range
> - rework set_fmt/get_fmt functions
> - calculate number of inputs using number of input ports
> - switch to runtime_pm
> - add reset gpio
> - add adv_debug support
> - add MAINTAINERS entry
> ---
>  MAINTAINERS                        |    8 +
>  drivers/media/i2c/Kconfig          |   10 +
>  drivers/media/i2c/Makefile         |    1 +
>  drivers/media/i2c/isl7998x.c       | 1633 ++++++++++++++++++++++++++++
>  include/uapi/linux/v4l2-controls.h |    6 +
>  5 files changed, 1658 insertions(+)
>  create mode 100644 drivers/media/i2c/isl7998x.c
> 

<snip>

> +static int isl7998x_pre_streamon(struct v4l2_subdev *sd, u32 flags)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> +	struct device *dev = &client->dev;
> +
> +	if (flags & V4L2_SUBDEV_PRE_STREAMON_FL_MANUAL_LP)
> +		return pm_runtime_resume_and_get(dev);
> +
> +	return 0;

This feels a bit scary: if V4L2_SUBDEV_PRE_STREAMON_FL_MANUAL_LP is NOT
set, then pm_runtime_resume_and_get() isn't called, but this function
still returns success...

> +}
> +
> +static int isl7998x_post_streamoff(struct v4l2_subdev *sd)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> +	struct device *dev = &client->dev;
> +
> +	pm_runtime_put(dev);

...and pm_runtime_put() is called without the corresponding get.

The documentation in v4l2-subdev.h isn't very clear about what
pre_streamon should return. I'm inclined to say that it should
return -EACCES.

Sakari, what do you think?

> +
> +	return 0;
> +}

Regards,

	Hans
