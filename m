Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DAE61D2C05
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 12:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726070AbgENKAG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 06:00:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725946AbgENKAD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 06:00:03 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4493DC061A0F
        for <linux-media@vger.kernel.org>; Thu, 14 May 2020 03:00:03 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id f15so989655plr.3
        for <linux-media@vger.kernel.org>; Thu, 14 May 2020 03:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=OSHq5Pp/53MkwY5nSwzDP4inUjAa+HuONEfUIgqpqIs=;
        b=dqo8g+25C54nbS1tLdLPEyWnpLVl065Zkip6hMjAe8Niz0xtH3LM4K5oH0xe+aOW6g
         mFCy24Fi8W1M9+NmaVvxretA05jGK0ml7T5Q1e51plIzwyF1eSg79724lQEYs6Y4dQkZ
         xqVFqENxMYFWkgr5laBS+skrooOfQfi7em4BXXmGAoUJKBhIhRtNZ+hVvoFneLNx3U6N
         TYvr0oNzXy9yMeaKgCaMuGkhXdVtqueWYQODLux6GMJLBMQ6q2mGvVS1MsfNi0jxiIxF
         iPNNu0D6fFXY7P4ctEMsNZY9/it6WtFNON6JtCGCJudcMKfiPg2pRjKhZx69dsTiHUNH
         HM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=OSHq5Pp/53MkwY5nSwzDP4inUjAa+HuONEfUIgqpqIs=;
        b=ecXPuD312GkHWP+zjNr7ufqhEwolGi0obkW4JGBcEtzw0UtQynE4EglnbKzLuf21Yd
         gzuc+2uamEBD57hi5YeX2nEaOC4E2w9kZzD1RQjbCzJpLfUFHErVpQ0+ZLQyK5iN4lTX
         KSh4LcylpSC9GhmLVQXnkGQ7LH9WL/dGlsZXA+fhYxQPPQ9RMPQmFoorPmHp79alaMco
         erjUGCMYZVlmDj3s8P/t5A1okf4fcClOb2h+JHq4DGyJR5K5cztMkdLVCIfKnhn1FyT0
         lC0qKEvX9+X57Lq+kOOs6AfSHrJAeDtMdMYm0Zs8ZJXkKpHAB/KjseyA9W6E/tSdP9AH
         DmbA==
X-Gm-Message-State: AOAM530Tt+tV6jb4RgqTJGK5gQmroL0AMvXq6sOUAL8WVtH7p8GRnoCi
        11WkrRKHeMQlpnCg1/nLUPTG
X-Google-Smtp-Source: ABdhPJxfy/YUdO+ZedB+eaE5h8q75oZDlgSYe5M+5JAXqFfuOXzePgyr7Xg2Ovi4ym8vNzHkPI7rvw==
X-Received: by 2002:a17:902:9686:: with SMTP id n6mr3478844plp.100.1589450401982;
        Thu, 14 May 2020 03:00:01 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:406:efde:ac17:556c:1ce3:639f])
        by smtp.gmail.com with ESMTPSA id a142sm1961963pfa.6.2020.05.14.02.59.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 May 2020 03:00:01 -0700 (PDT)
Date:   Thu, 14 May 2020 15:29:48 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>, sakari.ailus@iki.fi,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Hyun Kwon <hyunk@xilinx.com>, Rob Herring <robh+dt@kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v9 2/4] media: i2c: Add MAX9286 driver
Message-ID: <20200514095948.GE2877@Mani-XPS-13-9360>
References: <20200512155105.1068064-1-kieran.bingham+renesas@ideasonboard.com>
 <20200512155105.1068064-3-kieran.bingham+renesas@ideasonboard.com>
 <20200512174056.GH5526@Mani-XPS-13-9360>
 <e07af762-2db1-920c-5ab8-5528bdcfc2ce@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e07af762-2db1-920c-5ab8-5528bdcfc2ce@ideasonboard.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 14, 2020 at 10:53:00AM +0100, Kieran Bingham wrote:
> Hi Mani,
> 
> On 12/05/2020 18:40, Manivannan Sadhasivam wrote:
> > Hi Kieran,
> > 
> > On Tue, May 12, 2020 at 04:51:03PM +0100, Kieran Bingham wrote:
> >> The MAX9286 is a 4-channel GMSL deserializer with coax or STP input and
> >> CSI-2 output. The device supports multicamera streaming applications,
> >> and features the ability to synchronise the attached cameras.
> >>
> >> CSI-2 output can be configured with 1 to 4 lanes, and a control channel
> >> is supported over I2C, which implements an I2C mux to facilitate
> >> communications with connected cameras across the reverse control
> >> channel.
> >>
> >> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> >>
> >> --
> >> v2:
> >>  - Fix MAINTAINERS entry
> >>
> >> This posting is released with the following modifications to work
> >> without Sakari's VC developments:
> >>  - max9286_g_mbus_config() re-instated
> >>  - max9286_get_frame_desc() is not bus/csi aware
> >>  - max9286_{get,set}_routing() removed
> >>
> >> v3:
> >>  - Initialise notifier with v4l2_async_notifier_init
> >>  - Update for new mbus csi2 format V4L2_MBUS_CSI2_DPHY
> >>
> >> v4: - Re-introduce required code to function with the VC series.
> >>
> >>  - Implement max9286_get_routing, max9286_set_routing
> >>  - Remove max9286_g_mbus_config
> >>
> >> v5: (internal release)
> >>  - Fix printk formatting for hex value
> >>  - max9286->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE (add |)
> >>  - MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER -> MEDIA_ENT_F_VID_IF_BRIDGE
> >>  - Remove 'device is bound' workaround
> >>
> >> v6:
> >>  - v4l2_subdev_krouting instead of v4l2_subdev_routing separated
> >>    to allow integration without the VC/V4L2-Mux series.
> >>  - convert sd_to_max9286 to inline function
> >>  - rename max9286_device to max9286_priv
> >>  - Cleanup the v4l2_async_notifier
> >>  - Extend MODULE_AUTHOR
> >>  - Replace of_graph_get_endpoint_by_regs with fwnode_graph_get_endpoint_by_id
> >>  - Pass default bus type when parsing fwnode endpoint (Manivannan Sadhasivam)
> >>  - Use new YAML file reference in MAINTAINERS
> >>  - Parse new i2c-mux node in max9286_get_i2c_by_id
> >>    (This could/should be refactored to parse these separately first)
> >>  - Spelling and calculation fixes in the FSYNC_LOCKED check comments
> >>  - Identify each enabled i2c-mux channel in a single pass
> >>  - max9286: Improve mux-state readbility [v2]
> >>  - Fix frame sync lock durations
> >>  - Add comment to describe /why/ we must open the mux in s_stream
> >>  - use -EXDEV as return code for failed link synchronisation.
> >>  - Fix reference counting of the dt nodeS
> >>  - Convert to probe_new for I2C
> >>  - Remove redundant max9286_i2c_mux_state
> >>  - Provide optional enable-gpio (max9286-pwdn)
> >>
> >> v7:
> >>  [Kieran]
> >>  - Ensure powerdown lines are optional
> >>  - Add a 4ms power-up delay
> >>  - Add max9286_check_config_link() to core
> >>  - Add GPIO chip controller for GPIO0OUT and GPIO1OUT
> >>  - Fix GPIO registration
> >>  - max9286: Split out async registration
> >>    (fixes regulator -EPROBE_DEFERs failures)
> >>  - Collect all V4L2 registrations
> >>  - balance v4l2_async refcnting
> >>  - Rename max9286_v4l2_async_ => max9286_v4l2_notifier_
> >>
> >>  [Jacopo]
> >>  - Remove redundanct MAXIM_I2C_SPEED macros
> >>  - Move notifiers operations
> >>  - Add delay after reverse channel reconfiguration
> >>  - Move link setup to completion
> >>  - Fix up max9286_check_config_link() implementation
> >>  - Remove redundant dual configuration of reverse channel
> >>
> >> v8:
> >>
> >> [Kieran]
> >>  - Update the bound_sources mask on unbind
> >>  - Convert probe kzalloc usage to devm_ variant
> >>  - Fix up cleanup path from GPIO PowerDown registration
> >>  - cleanup GPIO device registration fail path
> >>  - Convert to use devm_regulator_get()
> >>  - Fit max9286_parse_dt print on one line
> >>  - Move multi-device workarounds out of upstream driver
> >>  - Remove I2C mod-table
> >>  - Lock format changes
> >>  - Describe pad index usage
> >>  - Remove poc_enabled workaround
> >>  - Rename the max9286_gpio to be more explicit on it's actions.
> >>  - Move max9286_init_format call
> >>  - Rework probe sequence and simplify error paths.
> >>  - Simplify i2c comments
> >>  - Implement Pixelrate control
> >>  - Disable overlap window
> >>
> >> [Jacopo]
> >>  - Adapt Kconfig to latest upstream changes
> >>  - Put of node on error
> >>  - Calculate pixel rate
> >>  - Simplify overlap window disablement
> >>
> >> v9:
> >>
> >> [Kieran]
> >>  - Kconfig: Depend on OF
> >>  - Re-sort addition to Makefile
> >> ---
> >>  MAINTAINERS                 |   10 +
> >>  drivers/media/i2c/Kconfig   |   13 +
> >>  drivers/media/i2c/Makefile  |    1 +
> >>  drivers/media/i2c/max9286.c | 1332 +++++++++++++++++++++++++++++++++++
> >>  4 files changed, 1356 insertions(+)
> >>  create mode 100644 drivers/media/i2c/max9286.c
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index a7bb6e22d5da..99e3bf7760fd 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -10274,6 +10274,16 @@ F:	Documentation/hwmon/max6697.rst
> >>  F:	drivers/hwmon/max6697.c
> >>  F:	include/linux/platform_data/max6697.h
> >>  
> >> +MAX9286 QUAD GMSL DESERIALIZER DRIVER
> >> +M:	Jacopo Mondi <jacopo+renesas@jmondi.org>
> >> +M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >> +M:	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >> +M:	Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> >> +L:	linux-media@vger.kernel.org
> >> +S:	Maintained
> >> +F:	Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> >> +F:	drivers/media/i2c/max9286.c
> >> +
> >>  MAX9860 MONO AUDIO VOICE CODEC DRIVER
> >>  M:	Peter Rosin <peda@axentia.se>
> >>  L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
> >> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> >> index 3abc80373ec0..2e390f41f6da 100644
> >> --- a/drivers/media/i2c/Kconfig
> >> +++ b/drivers/media/i2c/Kconfig
> >> @@ -464,6 +464,19 @@ config VIDEO_VPX3220
> >>  	  To compile this driver as a module, choose M here: the
> >>  	  module will be called vpx3220.
> >>  
> >> +config VIDEO_MAX9286
> >> +	tristate "Maxim MAX9286 GMSL deserializer support"
> >> +	depends on I2C && I2C_MUX
> >> +	depends on OF
> >> +	select V4L2_FWNODE
> >> +	select VIDEO_V4L2_SUBDEV_API
> >> +	select MEDIA_CONTROLLER
> >> +	help
> >> +	  This driver supports the Maxim MAX9286 GMSL deserializer.
> >> +
> >> +	  To compile this driver as a module, choose M here: the
> >> +	  module will be called max9286.
> >> +
> >>  comment "Video and audio decoders"
> >>  
> >>  config VIDEO_SAA717X
> >> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> >> index 77bf7d0b691f..f0b001ee4b05 100644
> >> --- a/drivers/media/i2c/Makefile
> >> +++ b/drivers/media/i2c/Makefile
> >> @@ -117,6 +117,7 @@ obj-$(CONFIG_VIDEO_IMX274)	+= imx274.o
> >>  obj-$(CONFIG_VIDEO_IMX290)	+= imx290.o
> >>  obj-$(CONFIG_VIDEO_IMX319)	+= imx319.o
> >>  obj-$(CONFIG_VIDEO_IMX355)	+= imx355.o
> >> +obj-$(CONFIG_VIDEO_MAX9286)	+= max9286.o
> >>  obj-$(CONFIG_VIDEO_ST_MIPID02) += st-mipid02.o
> >>  
> >>  obj-$(CONFIG_SDR_MAX2175) += max2175.o
> >> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> >> new file mode 100644
> >> index 000000000000..481d65f2b51d
> >> --- /dev/null
> >> +++ b/drivers/media/i2c/max9286.c
> >> @@ -0,0 +1,1332 @@
> >> +// SPDX-License-Identifier: GPL-2.0+
> >> +/*
> >> + * Maxim MAX9286 GMSL Deserializer Driver
> >> + *
> >> + * Copyright (C) 2017-2019 Jacopo Mondi
> >> + * Copyright (C) 2017-2019 Kieran Bingham
> >> + * Copyright (C) 2017-2019 Laurent Pinchart
> >> + * Copyright (C) 2017-2019 Niklas Söderlund
> >> + * Copyright (C) 2016 Renesas Electronics Corporation
> >> + * Copyright (C) 2015 Cogent Embedded, Inc.
> >> + */
> >> +
> >> +#include <linux/delay.h>
> >> +#include <linux/device.h>
> >> +#include <linux/fwnode.h>
> >> +#include <linux/gpio/consumer.h>
> >> +#include <linux/gpio/driver.h>
> >> +#include <linux/i2c.h>
> >> +#include <linux/i2c-mux.h>
> >> +#include <linux/module.h>
> >> +#include <linux/mutex.h>
> >> +#include <linux/of_graph.h>
> >> +#include <linux/regulator/consumer.h>
> >> +#include <linux/slab.h>
> >> +
> >> +#include <media/v4l2-async.h>
> >> +#include <media/v4l2-ctrls.h>
> >> +#include <media/v4l2-device.h>
> >> +#include <media/v4l2-fwnode.h>
> >> +#include <media/v4l2-subdev.h>
> >> +
> >> +/* Register 0x00 */
> >> +#define MAX9286_MSTLINKSEL_AUTO		(7 << 5)
> >> +#define MAX9286_MSTLINKSEL(n)		((n) << 5)
> >> +#define MAX9286_EN_VS_GEN		BIT(4)
> >> +#define MAX9286_LINKEN(n)		(1 << (n))
> >> +/* Register 0x01 */
> >> +#define MAX9286_FSYNCMODE_ECU		(3 << 6)
> >> +#define MAX9286_FSYNCMODE_EXT		(2 << 6)
> >> +#define MAX9286_FSYNCMODE_INT_OUT	(1 << 6)
> >> +#define MAX9286_FSYNCMODE_INT_HIZ	(0 << 6)
> >> +#define MAX9286_GPIEN			BIT(5)
> >> +#define MAX9286_ENLMO_RSTFSYNC		BIT(2)
> >> +#define MAX9286_FSYNCMETH_AUTO		(2 << 0)
> >> +#define MAX9286_FSYNCMETH_SEMI_AUTO	(1 << 0)
> >> +#define MAX9286_FSYNCMETH_MANUAL	(0 << 0)
> >> +#define MAX9286_REG_FSYNC_PERIOD_L	0x06
> >> +#define MAX9286_REG_FSYNC_PERIOD_M	0x07
> >> +#define MAX9286_REG_FSYNC_PERIOD_H	0x08
> >> +/* Register 0x0a */
> >> +#define MAX9286_FWDCCEN(n)		(1 << ((n) + 4))
> >> +#define MAX9286_REVCCEN(n)		(1 << (n))
> >> +/* Register 0x0c */
> >> +#define MAX9286_HVEN			BIT(7)
> >> +#define MAX9286_EDC_6BIT_HAMMING	(2 << 5)
> >> +#define MAX9286_EDC_6BIT_CRC		(1 << 5)
> >> +#define MAX9286_EDC_1BIT_PARITY		(0 << 5)
> >> +#define MAX9286_DESEL			BIT(4)
> >> +#define MAX9286_INVVS			BIT(3)
> >> +#define MAX9286_INVHS			BIT(2)
> >> +#define MAX9286_HVSRC_D0		(2 << 0)
> >> +#define MAX9286_HVSRC_D14		(1 << 0)
> >> +#define MAX9286_HVSRC_D18		(0 << 0)
> >> +/* Register 0x0f */
> >> +#define MAX9286_0X0F_RESERVED		BIT(3)
> >> +/* Register 0x12 */
> >> +#define MAX9286_CSILANECNT(n)		(((n) - 1) << 6)
> >> +#define MAX9286_CSIDBL			BIT(5)
> >> +#define MAX9286_DBL			BIT(4)
> >> +#define MAX9286_DATATYPE_USER_8BIT	(11 << 0)
> >> +#define MAX9286_DATATYPE_USER_YUV_12BIT	(10 << 0)
> >> +#define MAX9286_DATATYPE_USER_24BIT	(9 << 0)
> >> +#define MAX9286_DATATYPE_RAW14		(8 << 0)
> >> +#define MAX9286_DATATYPE_RAW11		(7 << 0)
> >> +#define MAX9286_DATATYPE_RAW10		(6 << 0)
> >> +#define MAX9286_DATATYPE_RAW8		(5 << 0)
> >> +#define MAX9286_DATATYPE_YUV422_10BIT	(4 << 0)
> >> +#define MAX9286_DATATYPE_YUV422_8BIT	(3 << 0)
> >> +#define MAX9286_DATATYPE_RGB555		(2 << 0)
> >> +#define MAX9286_DATATYPE_RGB565		(1 << 0)
> >> +#define MAX9286_DATATYPE_RGB888		(0 << 0)
> >> +/* Register 0x15 */
> >> +#define MAX9286_VC(n)			((n) << 5)
> >> +#define MAX9286_VCTYPE			BIT(4)
> >> +#define MAX9286_CSIOUTEN		BIT(3)
> >> +#define MAX9286_0X15_RESV		(3 << 0)
> >> +/* Register 0x1b */
> >> +#define MAX9286_SWITCHIN(n)		(1 << ((n) + 4))
> >> +#define MAX9286_ENEQ(n)			(1 << (n))
> >> +/* Register 0x27 */
> >> +#define MAX9286_LOCKED			BIT(7)
> >> +/* Register 0x31 */
> >> +#define MAX9286_FSYNC_LOCKED		BIT(6)
> >> +/* Register 0x34 */
> >> +#define MAX9286_I2CLOCACK		BIT(7)
> >> +#define MAX9286_I2CSLVSH_1046NS_469NS	(3 << 5)
> >> +#define MAX9286_I2CSLVSH_938NS_352NS	(2 << 5)
> >> +#define MAX9286_I2CSLVSH_469NS_234NS	(1 << 5)
> >> +#define MAX9286_I2CSLVSH_352NS_117NS	(0 << 5)
> >> +#define MAX9286_I2CMSTBT_837KBPS	(7 << 2)
> >> +#define MAX9286_I2CMSTBT_533KBPS	(6 << 2)
> >> +#define MAX9286_I2CMSTBT_339KBPS	(5 << 2)
> >> +#define MAX9286_I2CMSTBT_173KBPS	(4 << 2)
> >> +#define MAX9286_I2CMSTBT_105KBPS	(3 << 2)
> >> +#define MAX9286_I2CMSTBT_84KBPS		(2 << 2)
> >> +#define MAX9286_I2CMSTBT_28KBPS		(1 << 2)
> >> +#define MAX9286_I2CMSTBT_8KBPS		(0 << 2)
> >> +#define MAX9286_I2CSLVTO_NONE		(3 << 0)
> >> +#define MAX9286_I2CSLVTO_1024US		(2 << 0)
> >> +#define MAX9286_I2CSLVTO_256US		(1 << 0)
> >> +#define MAX9286_I2CSLVTO_64US		(0 << 0)
> >> +/* Register 0x3b */
> >> +#define MAX9286_REV_TRF(n)		((n) << 4)
> >> +#define MAX9286_REV_AMP(n)		((((n) - 30) / 10) << 1) /* in mV */
> >> +#define MAX9286_REV_AMP_X		BIT(0)
> >> +/* Register 0x3f */
> >> +#define MAX9286_EN_REV_CFG		BIT(6)
> >> +#define MAX9286_REV_FLEN(n)		((n) - 20)
> >> +/* Register 0x49 */
> >> +#define MAX9286_VIDEO_DETECT_MASK	0x0f
> >> +/* Register 0x69 */
> >> +#define MAX9286_LFLTBMONMASKED		BIT(7)
> >> +#define MAX9286_LOCKMONMASKED		BIT(6)
> >> +#define MAX9286_AUTOCOMBACKEN		BIT(5)
> >> +#define MAX9286_AUTOMASKEN		BIT(4)
> >> +#define MAX9286_MASKLINK(n)		((n) << 0)
> >> +
> >> +/*
> >> + * The sink and source pads are created to match the OF graph port numbers so
> >> + * that their indexes can be used interchangeably.
> >> + */
> >> +#define MAX9286_NUM_GMSL		4
> >> +#define MAX9286_N_SINKS			4
> >> +#define MAX9286_N_PADS			5
> >> +#define MAX9286_SRC_PAD			4
> >> +
> >> +struct max9286_source {
> >> +	struct v4l2_async_subdev asd;
> >> +	struct v4l2_subdev *sd;
> >> +	struct fwnode_handle *fwnode;
> >> +};
> >> +
> >> +#define asd_to_max9286_source(_asd) \
> >> +	container_of(_asd, struct max9286_source, asd)
> >> +
> >> +struct max9286_priv {
> >> +	struct i2c_client *client;
> >> +	struct gpio_desc *gpiod_pwdn;
> >> +	struct v4l2_subdev sd;
> >> +	struct media_pad pads[MAX9286_N_PADS];
> >> +	struct regulator *regulator;
> >> +
> >> +	struct gpio_chip gpio;
> >> +	u8 gpio_state;
> >> +
> >> +	struct i2c_mux_core *mux;
> >> +	unsigned int mux_channel;
> >> +	bool mux_open;
> >> +
> >> +	struct v4l2_ctrl_handler ctrls;
> >> +	struct v4l2_ctrl *pixelrate;
> >> +
> >> +	struct v4l2_mbus_framefmt fmt[MAX9286_N_SINKS];
> >> +
> >> +	/* Protects controls and fmt structures */
> >> +	struct mutex mutex;
> >> +
> >> +	unsigned int nsources;
> >> +	unsigned int source_mask;
> >> +	unsigned int route_mask;
> >> +	unsigned int bound_sources;
> >> +	unsigned int csi2_data_lanes;
> >> +	struct max9286_source sources[MAX9286_NUM_GMSL];
> >> +	struct v4l2_async_notifier notifier;
> >> +};
> >> +
[...]
> >> +static int max9286_enum_mbus_code(struct v4l2_subdev *sd,
> >> +				  struct v4l2_subdev_pad_config *cfg,
> >> +				  struct v4l2_subdev_mbus_code_enum *code)
> >> +{
> >> +	if (code->pad || code->index > 0)
> >> +		return -EINVAL;
> >> +
> >> +	code->code = MEDIA_BUS_FMT_UYVY8_2X8;
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static struct v4l2_mbus_framefmt *
> >> +max9286_get_pad_format(struct max9286_priv *priv,
> >> +		       struct v4l2_subdev_pad_config *cfg,
> >> +		       unsigned int pad, u32 which)
> >> +{
> >> +	switch (which) {
> >> +	case V4L2_SUBDEV_FORMAT_TRY:
> >> +		return v4l2_subdev_get_try_format(&priv->sd, cfg, pad);
> >> +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> >> +		return &priv->fmt[pad];
> >> +	default:
> >> +		return NULL;
> >> +	}
> >> +}
> >> +
> >> +static int max9286_set_fmt(struct v4l2_subdev *sd,
> >> +			   struct v4l2_subdev_pad_config *cfg,
> >> +			   struct v4l2_subdev_format *format)
> >> +{
> >> +	struct max9286_priv *priv = sd_to_max9286(sd);
> >> +	struct v4l2_mbus_framefmt *cfg_fmt;
> >> +
> >> +	if (format->pad >= MAX9286_SRC_PAD)
> >> +		return -EINVAL;
> >> +
> >> +	/* Refuse non YUV422 formats as we hardcode DT to 8 bit YUV422 */
> >> +	switch (format->format.code) {
> >> +	case MEDIA_BUS_FMT_UYVY8_2X8:
> >> +	case MEDIA_BUS_FMT_VYUY8_2X8:
> >> +	case MEDIA_BUS_FMT_YUYV8_2X8:
> >> +	case MEDIA_BUS_FMT_YVYU8_2X8:
> >> +		break;
> >> +	default:
> >> +		format->format.code = MEDIA_BUS_FMT_YUYV8_2X8;
> > 
> > Is there any reason for not setting default format to MEDIA_BUS_FMT_UYVY8_2X8?
> > 
> 
> 
> No good reason no, and I see that in max9286_enum_mbus_code(), we
> currently code to MEDIA_BUS_FMT_YUYV8_2X8, and that's the value that we
> init to, so that would be a better default indeed.
> 

max9286_enum_mbus_code() returns MEDIA_BUS_FMT_UYVY8_2X8, no?

Thanks,
Mani

> I'll update this for v10.
> 
> 
> > Thanks,
> > Mani
> > 
> >> +		break;
> >> +	}
> >> +
> >> +	cfg_fmt = max9286_get_pad_format(priv, cfg, format->pad, format->which);
> >> +	if (!cfg_fmt)
> >> +		return -EINVAL;
> >> +
> >> +	mutex_lock(&priv->mutex);
> >> +	*cfg_fmt = format->format;
> >> +	mutex_unlock(&priv->mutex);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int max9286_get_fmt(struct v4l2_subdev *sd,
> >> +			   struct v4l2_subdev_pad_config *cfg,
> >> +			   struct v4l2_subdev_format *format)
> >> +{
> >> +	struct max9286_priv *priv = sd_to_max9286(sd);
> >> +	struct v4l2_mbus_framefmt *cfg_fmt;
> >> +
> >> +	if (format->pad >= MAX9286_SRC_PAD)
> >> +		return -EINVAL;
> >> +
> >> +	cfg_fmt = max9286_get_pad_format(priv, cfg, format->pad, format->which);
> >> +	if (!cfg_fmt)
> >> +		return -EINVAL;
> >> +
> >> +	mutex_lock(&priv->mutex);
> >> +	format->format = *cfg_fmt;
> >> +	mutex_unlock(&priv->mutex);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static const struct v4l2_subdev_video_ops max9286_video_ops = {
> >> +	.s_stream	= max9286_s_stream,
> >> +};
> >> +
> >> +static const struct v4l2_subdev_pad_ops max9286_pad_ops = {
> >> +	.enum_mbus_code = max9286_enum_mbus_code,
> >> +	.get_fmt	= max9286_get_fmt,
> >> +	.set_fmt	= max9286_set_fmt,
> >> +};
> >> +
> >> +static const struct v4l2_subdev_ops max9286_subdev_ops = {
> >> +	.video		= &max9286_video_ops,
> >> +	.pad		= &max9286_pad_ops,
> >> +};
> >> +
> >> +static void max9286_init_format(struct v4l2_mbus_framefmt *fmt)
> >> +{
> >> +	fmt->width		= 1280;
> >> +	fmt->height		= 800;
> >> +	fmt->code		= MEDIA_BUS_FMT_UYVY8_2X8;
> >> +	fmt->colorspace		= V4L2_COLORSPACE_SRGB;
> >> +	fmt->field		= V4L2_FIELD_NONE;
> >> +	fmt->ycbcr_enc		= V4L2_YCBCR_ENC_DEFAULT;
> >> +	fmt->quantization	= V4L2_QUANTIZATION_DEFAULT;
> >> +	fmt->xfer_func		= V4L2_XFER_FUNC_DEFAULT;
> >> +}
> >> +
> >> +static int max9286_open(struct v4l2_subdev *subdev, struct v4l2_subdev_fh *fh)
> >> +{
> >> +	struct v4l2_mbus_framefmt *format;
> >> +	unsigned int i;
> >> +
> >> +	for (i = 0; i < MAX9286_N_SINKS; i++) {
> >> +		format = v4l2_subdev_get_try_format(subdev, fh->pad, i);
> >> +		max9286_init_format(format);
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static const struct v4l2_subdev_internal_ops max9286_subdev_internal_ops = {
> >> +	.open = max9286_open,
> >> +};
> >> +
> >> +static int max9286_s_ctrl(struct v4l2_ctrl *ctrl)
> >> +{
> >> +	switch (ctrl->id) {
> >> +	case V4L2_CID_PIXEL_RATE:
> >> +		return 0;
> >> +	default:
> >> +		return -EINVAL;
> >> +	}
> >> +}
> >> +
> >> +static const struct v4l2_ctrl_ops max9286_ctrl_ops = {
> >> +	.s_ctrl	= max9286_s_ctrl,
> >> +};
> >> +
> >> +static int max9286_v4l2_register(struct max9286_priv *priv)
> >> +{
> >> +	struct device *dev = &priv->client->dev;
> >> +	struct fwnode_handle *ep;
> >> +	int ret;
> >> +	int i;
> >> +
> >> +	/* Register v4l2 async notifiers for connected Camera subdevices */
> >> +	ret = max9286_v4l2_notifier_register(priv);
> >> +	if (ret) {
> >> +		dev_err(dev, "Unable to register V4L2 async notifiers\n");
> >> +		return ret;
> >> +	}
> >> +
> >> +	/* Configure V4L2 for the MAX9286 itself */
> >> +
> >> +	for (i = 0; i < MAX9286_N_SINKS; i++)
> >> +		max9286_init_format(&priv->fmt[i]);
> >> +
> >> +	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max9286_subdev_ops);
> >> +	priv->sd.internal_ops = &max9286_subdev_internal_ops;
> >> +	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> >> +
> >> +	v4l2_ctrl_handler_init(&priv->ctrls, 1);
> >> +	priv->pixelrate = v4l2_ctrl_new_std(&priv->ctrls,
> >> +					    &max9286_ctrl_ops,
> >> +					    V4L2_CID_PIXEL_RATE,
> >> +					    1, INT_MAX, 1, 50000000);
> >> +
> >> +	priv->sd.ctrl_handler = &priv->ctrls;
> >> +	ret = priv->ctrls.error;
> >> +	if (ret)
> >> +		goto err_async;
> >> +
> >> +	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> >> +
> >> +	priv->pads[MAX9286_SRC_PAD].flags = MEDIA_PAD_FL_SOURCE;
> >> +	for (i = 0; i < MAX9286_SRC_PAD; i++)
> >> +		priv->pads[i].flags = MEDIA_PAD_FL_SINK;
> >> +	ret = media_entity_pads_init(&priv->sd.entity, MAX9286_N_PADS,
> >> +				     priv->pads);
> >> +	if (ret)
> >> +		goto err_async;
> >> +
> >> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), MAX9286_SRC_PAD,
> >> +					     0, 0);
> >> +	if (!ep) {
> >> +		dev_err(dev, "Unable to retrieve endpoint on \"port@4\"\n");
> >> +		ret = -ENOENT;
> >> +		goto err_async;
> >> +	}
> >> +	priv->sd.fwnode = ep;
> >> +
> >> +	ret = v4l2_async_register_subdev(&priv->sd);
> >> +	if (ret < 0) {
> >> +		dev_err(dev, "Unable to register subdevice\n");
> >> +		goto err_put_node;
> >> +	}
> >> +
> >> +	return 0;
> >> +
> >> +err_put_node:
> >> +	fwnode_handle_put(ep);
> >> +err_async:
> >> +	max9286_v4l2_notifier_unregister(priv);
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +static void max9286_v4l2_unregister(struct max9286_priv *priv)
> >> +{
> >> +	fwnode_handle_put(priv->sd.fwnode);
> >> +	v4l2_async_unregister_subdev(&priv->sd);
> >> +	max9286_v4l2_notifier_unregister(priv);
> >> +}
> >> +
> >> +/* -----------------------------------------------------------------------------
> >> + * Probe/Remove
> >> + */
> >> +
> >> +static int max9286_setup(struct max9286_priv *priv)
> >> +{
> >> +	/*
> >> +	 * Link ordering values for all enabled links combinations. Orders must
> >> +	 * be assigned sequentially from 0 to the number of enabled links
> >> +	 * without leaving any hole for disabled links. We thus assign orders to
> >> +	 * enabled links first, and use the remaining order values for disabled
> >> +	 * links are all links must have a different order value;
> >> +	 */
> >> +	static const u8 link_order[] = {
> >> +		(3 << 6) | (2 << 4) | (1 << 2) | (0 << 0), /* xxxx */
> >> +		(3 << 6) | (2 << 4) | (1 << 2) | (0 << 0), /* xxx0 */
> >> +		(3 << 6) | (2 << 4) | (0 << 2) | (1 << 0), /* xx0x */
> >> +		(3 << 6) | (2 << 4) | (1 << 2) | (0 << 0), /* xx10 */
> >> +		(3 << 6) | (0 << 4) | (2 << 2) | (1 << 0), /* x0xx */
> >> +		(3 << 6) | (1 << 4) | (2 << 2) | (0 << 0), /* x1x0 */
> >> +		(3 << 6) | (1 << 4) | (0 << 2) | (2 << 0), /* x10x */
> >> +		(3 << 6) | (1 << 4) | (1 << 2) | (0 << 0), /* x210 */
> >> +		(0 << 6) | (3 << 4) | (2 << 2) | (1 << 0), /* 0xxx */
> >> +		(1 << 6) | (3 << 4) | (2 << 2) | (0 << 0), /* 1xx0 */
> >> +		(1 << 6) | (3 << 4) | (0 << 2) | (2 << 0), /* 1x0x */
> >> +		(2 << 6) | (3 << 4) | (1 << 2) | (0 << 0), /* 2x10 */
> >> +		(1 << 6) | (0 << 4) | (3 << 2) | (2 << 0), /* 10xx */
> >> +		(2 << 6) | (1 << 4) | (3 << 2) | (0 << 0), /* 21x0 */
> >> +		(2 << 6) | (1 << 4) | (0 << 2) | (3 << 0), /* 210x */
> >> +		(3 << 6) | (2 << 4) | (1 << 2) | (0 << 0), /* 3210 */
> >> +	};
> >> +
> >> +	/*
> >> +	 * Set the I2C bus speed.
> >> +	 *
> >> +	 * Enable I2C Local Acknowledge during the probe sequences of the camera
> >> +	 * only. This should be disabled after the mux is initialised.
> >> +	 */
> >> +	max9286_configure_i2c(priv, true);
> >> +
> >> +	/*
> >> +	 * Reverse channel setup.
> >> +	 *
> >> +	 * - Enable custom reverse channel configuration (through register 0x3f)
> >> +	 *   and set the first pulse length to 35 clock cycles.
> >> +	 * - Increase the reverse channel amplitude to 170mV to accommodate the
> >> +	 *   high threshold enabled by the serializer driver.
> >> +	 */
> >> +	max9286_write(priv, 0x3f, MAX9286_EN_REV_CFG | MAX9286_REV_FLEN(35));
> >> +	max9286_write(priv, 0x3b, MAX9286_REV_TRF(1) | MAX9286_REV_AMP(70) |
> >> +		      MAX9286_REV_AMP_X);
> >> +	usleep_range(2000, 2500);
> >> +
> >> +	/*
> >> +	 * Enable GMSL links, mask unused ones and autodetect link
> >> +	 * used as CSI clock source.
> >> +	 */
> >> +	max9286_write(priv, 0x00, MAX9286_MSTLINKSEL_AUTO | priv->route_mask);
> >> +	max9286_write(priv, 0x0b, link_order[priv->route_mask]);
> >> +	max9286_write(priv, 0x69, (0xf & ~priv->route_mask));
> >> +
> >> +	/*
> >> +	 * Video format setup:
> >> +	 * Disable CSI output, VC is set according to Link number.
> >> +	 */
> >> +	max9286_write(priv, 0x15, MAX9286_VCTYPE | MAX9286_0X15_RESV);
> >> +
> >> +	/* Enable CSI-2 Lane D0-D3 only, DBL mode, YUV422 8-bit. */
> >> +	max9286_write(priv, 0x12, MAX9286_CSIDBL | MAX9286_DBL |
> >> +		      MAX9286_CSILANECNT(priv->csi2_data_lanes) |
> >> +		      MAX9286_DATATYPE_YUV422_8BIT);
> >> +
> >> +	/* Automatic: FRAMESYNC taken from the slowest Link. */
> >> +	max9286_write(priv, 0x01, MAX9286_FSYNCMODE_INT_HIZ |
> >> +		      MAX9286_FSYNCMETH_AUTO);
> >> +
> >> +	/* Enable HS/VS encoding, use D14/15 for HS/VS, invert VS. */
> >> +	max9286_write(priv, 0x0c, MAX9286_HVEN | MAX9286_INVVS |
> >> +		      MAX9286_HVSRC_D14);
> >> +
> >> +	/*
> >> +	 * The overlap window seems to provide additional validation by tracking
> >> +	 * the delay between vsync and frame sync, generating an error if the
> >> +	 * delay is bigger than the programmed window, though it's not yet clear
> >> +	 * what value should be set.
> >> +	 *
> >> +	 * As it's an optional value and can be disabled, we do so by setting
> >> +	 * a 0 overlap value.
> >> +	 */
> >> +	max9286_write(priv, 0x63, 0);
> >> +	max9286_write(priv, 0x64, 0);
> >> +
> >> +	/*
> >> +	 * Wait for 2ms to allow the link to resynchronize after the
> >> +	 * configuration change.
> >> +	 */
> >> +	usleep_range(2000, 5000);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static void max9286_gpio_set(struct gpio_chip *chip,
> >> +			     unsigned int offset, int value)
> >> +{
> >> +	struct max9286_priv *priv = gpiochip_get_data(chip);
> >> +
> >> +	if (value)
> >> +		priv->gpio_state |= BIT(offset);
> >> +	else
> >> +		priv->gpio_state &= ~BIT(offset);
> >> +
> >> +	max9286_write(priv, 0x0f, MAX9286_0X0F_RESERVED | priv->gpio_state);
> >> +}
> >> +
> >> +static int max9286_gpio_get(struct gpio_chip *chip, unsigned int offset)
> >> +{
> >> +	struct max9286_priv *priv = gpiochip_get_data(chip);
> >> +
> >> +	return priv->gpio_state & BIT(offset);
> >> +}
> >> +
> >> +static int max9286_register_gpio(struct max9286_priv *priv)
> >> +{
> >> +	struct device *dev = &priv->client->dev;
> >> +	struct gpio_chip *gpio = &priv->gpio;
> >> +	int ret;
> >> +
> >> +	static const char * const names[] = {
> >> +		"GPIO0OUT",
> >> +		"GPIO1OUT",
> >> +	};
> >> +
> >> +	/* Configure the GPIO */
> >> +	gpio->label = dev_name(dev);
> >> +	gpio->parent = dev;
> >> +	gpio->owner = THIS_MODULE;
> >> +	gpio->of_node = dev->of_node;
> >> +	gpio->ngpio = 2;
> >> +	gpio->base = -1;
> >> +	gpio->set = max9286_gpio_set;
> >> +	gpio->get = max9286_gpio_get;
> >> +	gpio->can_sleep = true;
> >> +	gpio->names = names;
> >> +
> >> +	/* GPIO values default to high */
> >> +	priv->gpio_state = BIT(0) | BIT(1);
> >> +
> >> +	ret = devm_gpiochip_add_data(dev, gpio, priv);
> >> +	if (ret)
> >> +		dev_err(dev, "Unable to create gpio_chip\n");
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +static int max9286_init(struct device *dev)
> >> +{
> >> +	struct max9286_priv *priv;
> >> +	struct i2c_client *client;
> >> +	int ret;
> >> +
> >> +	client = to_i2c_client(dev);
> >> +	priv = i2c_get_clientdata(client);
> >> +
> >> +	/* Enable the bus power. */
> >> +	ret = regulator_enable(priv->regulator);
> >> +	if (ret < 0) {
> >> +		dev_err(&client->dev, "Unable to turn PoC on\n");
> >> +		return ret;
> >> +	}
> >> +
> >> +	ret = max9286_setup(priv);
> >> +	if (ret) {
> >> +		dev_err(dev, "Unable to setup max9286\n");
> >> +		goto err_regulator;
> >> +	}
> >> +
> >> +	/*
> >> +	 * Register all V4L2 interactions for the MAX9286 and notifiers for
> >> +	 * any subdevices connected.
> >> +	 */
> >> +	ret = max9286_v4l2_register(priv);
> >> +	if (ret) {
> >> +		dev_err(dev, "Failed to register with V4L2\n");
> >> +		goto err_regulator;
> >> +	}
> >> +
> >> +	ret = max9286_i2c_mux_init(priv);
> >> +	if (ret) {
> >> +		dev_err(dev, "Unable to initialize I2C multiplexer\n");
> >> +		goto err_v4l2_register;
> >> +	}
> >> +
> >> +	/* Leave the mux channels disabled until they are selected. */
> >> +	max9286_i2c_mux_close(priv);
> >> +
> >> +	return 0;
> >> +
> >> +err_v4l2_register:
> >> +	max9286_v4l2_unregister(priv);
> >> +err_regulator:
> >> +	regulator_disable(priv->regulator);
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +static void max9286_cleanup_dt(struct max9286_priv *priv)
> >> +{
> >> +	struct max9286_source *source;
> >> +
> >> +	for_each_source(priv, source) {
> >> +		fwnode_handle_put(source->fwnode);
> >> +		source->fwnode = NULL;
> >> +	}
> >> +}
> >> +
> >> +static int max9286_parse_dt(struct max9286_priv *priv)
> >> +{
> >> +	struct device *dev = &priv->client->dev;
> >> +	struct device_node *i2c_mux;
> >> +	struct device_node *node = NULL;
> >> +	unsigned int i2c_mux_mask = 0;
> >> +
> >> +	of_node_get(dev->of_node);
> >> +	i2c_mux = of_find_node_by_name(dev->of_node, "i2c-mux");
> >> +	if (!i2c_mux) {
> >> +		dev_err(dev, "Failed to find i2c-mux node\n");
> >> +		of_node_put(dev->of_node);
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	/* Identify which i2c-mux channels are enabled */
> >> +	for_each_child_of_node(i2c_mux, node) {
> >> +		u32 id = 0;
> >> +
> >> +		of_property_read_u32(node, "reg", &id);
> >> +		if (id >= MAX9286_NUM_GMSL)
> >> +			continue;
> >> +
> >> +		if (!of_device_is_available(node)) {
> >> +			dev_dbg(dev, "Skipping disabled I2C bus port %u\n", id);
> >> +			continue;
> >> +		}
> >> +
> >> +		i2c_mux_mask |= BIT(id);
> >> +	}
> >> +	of_node_put(node);
> >> +	of_node_put(i2c_mux);
> >> +
> >> +	/* Parse the endpoints */
> >> +	for_each_endpoint_of_node(dev->of_node, node) {
> >> +		struct max9286_source *source;
> >> +		struct of_endpoint ep;
> >> +
> >> +		of_graph_parse_endpoint(node, &ep);
> >> +		dev_dbg(dev, "Endpoint %pOF on port %d",
> >> +			ep.local_node, ep.port);
> >> +
> >> +		if (ep.port > MAX9286_NUM_GMSL) {
> >> +			dev_err(dev, "Invalid endpoint %s on port %d",
> >> +				of_node_full_name(ep.local_node), ep.port);
> >> +			continue;
> >> +		}
> >> +
> >> +		/* For the source endpoint just parse the bus configuration. */
> >> +		if (ep.port == MAX9286_SRC_PAD) {
> >> +			struct v4l2_fwnode_endpoint vep = {
> >> +				.bus_type = V4L2_MBUS_CSI2_DPHY
> >> +			};
> >> +			int ret;
> >> +
> >> +			ret = v4l2_fwnode_endpoint_parse(
> >> +					of_fwnode_handle(node), &vep);
> >> +			if (ret) {
> >> +				of_node_put(node);
> >> +				of_node_put(dev->of_node);
> >> +				return ret;
> >> +			}
> >> +
> >> +			if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
> >> +				dev_err(dev,
> >> +					"Media bus %u type not supported\n",
> >> +					vep.bus_type);
> >> +				v4l2_fwnode_endpoint_free(&vep);
> >> +				of_node_put(node);
> >> +				of_node_put(dev->of_node);
> >> +				return -EINVAL;
> >> +			}
> >> +
> >> +			priv->csi2_data_lanes =
> >> +				vep.bus.mipi_csi2.num_data_lanes;
> >> +			v4l2_fwnode_endpoint_free(&vep);
> >> +
> >> +			continue;
> >> +		}
> >> +
> >> +		/* Skip if the corresponding GMSL link is unavailable. */
> >> +		if (!(i2c_mux_mask & BIT(ep.port)))
> >> +			continue;
> >> +
> >> +		if (priv->sources[ep.port].fwnode) {
> >> +			dev_err(dev,
> >> +				"Multiple port endpoints are not supported: %d",
> >> +				ep.port);
> >> +
> >> +			continue;
> >> +		}
> >> +
> >> +		source = &priv->sources[ep.port];
> >> +		source->fwnode = fwnode_graph_get_remote_endpoint(
> >> +						of_fwnode_handle(node));
> >> +		if (!source->fwnode) {
> >> +			dev_err(dev,
> >> +				"Endpoint %pOF has no remote endpoint connection\n",
> >> +				ep.local_node);
> >> +
> >> +			continue;
> >> +		}
> >> +
> >> +		priv->source_mask |= BIT(ep.port);
> >> +		priv->nsources++;
> >> +	}
> >> +	of_node_put(node);
> >> +	of_node_put(dev->of_node);
> >> +
> >> +	priv->route_mask = priv->source_mask;
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int max9286_probe(struct i2c_client *client)
> >> +{
> >> +	struct max9286_priv *priv;
> >> +	int ret;
> >> +
> >> +	priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
> >> +	if (!priv)
> >> +		return -ENOMEM;
> >> +
> >> +	mutex_init(&priv->mutex);
> >> +
> >> +	priv->client = client;
> >> +	i2c_set_clientdata(client, priv);
> >> +
> >> +	priv->gpiod_pwdn = devm_gpiod_get_optional(&client->dev, "enable",
> >> +						   GPIOD_OUT_HIGH);
> >> +	if (IS_ERR(priv->gpiod_pwdn))
> >> +		return PTR_ERR(priv->gpiod_pwdn);
> >> +
> >> +	gpiod_set_consumer_name(priv->gpiod_pwdn, "max9286-pwdn");
> >> +	gpiod_set_value_cansleep(priv->gpiod_pwdn, 1);
> >> +
> >> +	/* Wait at least 4ms before the I2C lines latch to the address */
> >> +	if (priv->gpiod_pwdn)
> >> +		usleep_range(4000, 5000);
> >> +
> >> +	/*
> >> +	 * The MAX9286 starts by default with all ports enabled, we disable all
> >> +	 * ports early to ensure that all channels are disabled if we error out
> >> +	 * and keep the bus consistent.
> >> +	 */
> >> +	max9286_i2c_mux_close(priv);
> >> +
> >> +	/*
> >> +	 * The MAX9286 initialises with auto-acknowledge enabled by default.
> >> +	 * This can be invasive to other transactions on the same bus, so
> >> +	 * disable it early. It will be enabled only as and when needed.
> >> +	 */
> >> +	max9286_configure_i2c(priv, false);
> >> +
> >> +	ret = max9286_register_gpio(priv);
> >> +	if (ret)
> >> +		goto err_powerdown;
> >> +
> >> +	priv->regulator = devm_regulator_get(&client->dev, "poc");
> >> +	if (IS_ERR(priv->regulator)) {
> >> +		if (PTR_ERR(priv->regulator) != -EPROBE_DEFER)
> >> +			dev_err(&client->dev,
> >> +				"Unable to get PoC regulator (%ld)\n",
> >> +				PTR_ERR(priv->regulator));
> >> +		ret = PTR_ERR(priv->regulator);
> >> +		goto err_powerdown;
> >> +	}
> >> +
> >> +	ret = max9286_parse_dt(priv);
> >> +	if (ret)
> >> +		goto err_powerdown;
> >> +
> >> +	ret = max9286_init(&client->dev);
> >> +	if (ret < 0)
> >> +		goto err_cleanup_dt;
> >> +
> >> +	return 0;
> >> +
> >> +err_cleanup_dt:
> >> +	max9286_cleanup_dt(priv);
> >> +err_powerdown:
> >> +	gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +static int max9286_remove(struct i2c_client *client)
> >> +{
> >> +	struct max9286_priv *priv = i2c_get_clientdata(client);
> >> +
> >> +	i2c_mux_del_adapters(priv->mux);
> >> +
> >> +	max9286_v4l2_unregister(priv);
> >> +
> >> +	regulator_disable(priv->regulator);
> >> +
> >> +	gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
> >> +
> >> +	max9286_cleanup_dt(priv);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static const struct of_device_id max9286_dt_ids[] = {
> >> +	{ .compatible = "maxim,max9286" },
> >> +	{},
> >> +};
> >> +MODULE_DEVICE_TABLE(of, max9286_dt_ids);
> >> +
> >> +static struct i2c_driver max9286_i2c_driver = {
> >> +	.driver	= {
> >> +		.name		= "max9286",
> >> +		.of_match_table	= of_match_ptr(max9286_dt_ids),
> >> +	},
> >> +	.probe_new	= max9286_probe,
> >> +	.remove		= max9286_remove,
> >> +};
> >> +
> >> +module_i2c_driver(max9286_i2c_driver);
> >> +
> >> +MODULE_DESCRIPTION("Maxim MAX9286 GMSL Deserializer Driver");
> >> +MODULE_AUTHOR("Jacopo Mondi, Kieran Bingham, Laurent Pinchart, Niklas Söderlund, Vladimir Barinov");
> >> +MODULE_LICENSE("GPL");
> >> -- 
> >> 2.25.1
> >>
> 
