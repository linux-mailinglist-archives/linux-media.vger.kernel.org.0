Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDFEA423072
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 20:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbhJES6E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 14:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbhJES6E (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 14:58:04 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9715FC061749
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 11:56:12 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id b20so114594lfv.3
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 11:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=jALeoOaj1RjZxprS4lyukdGrnIqoV9oECHG4EfJ9pf4=;
        b=sI8Qg+y7leUZlow9G5UzJvmtxi6Q7Raw+Z5OJqzxgNP7bYeisnQYqSZFy/ynqo78Hl
         uQ6vHlyutVFfMxuoZUJ7aDs14JAoQroYwoxkP0x2IJU53TPksNTPUV92ttj/8wimAXOE
         9AZd9csCU2DhE6YQRDwchNq/jtfII3gxIj85vyY4q5qwJrvUmCAbPAyj1u52pFlqgVTY
         oVmy+c+JYMUq0yZAZ6lRbOniVQz1toiu9Ng2Gdf1DpxRfQ4zb98soRgSDWWOR30May6j
         urFgZzukNPMMh3x8mR4rf2xKPFF639z5VgVWg/GIO3lJry+TnpiKPHLxCsC2Ia9TEaSI
         1sAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=jALeoOaj1RjZxprS4lyukdGrnIqoV9oECHG4EfJ9pf4=;
        b=2aR+E8J9fI8QG4Z9y53MiSs8Nj/FKDOoQMXt0Pb6EJkwjtI4qLntj1IMS940oemi4s
         8BcguDkDT3+HwFd/EL9zB4VNulZArkD93DQN1n17rBFhnkS2eWwRHwkVnIbe1odI+b5L
         lbJPeZBHJLPFnTxKQNjhSp+Xg5vNIh7xRaWytHaDp4EampzTE67m0aUGsiPcSMR2rcJ7
         KZqYDBNXYtNFRNR5OzN3V6Z00MbaUN+4xSAlCnWWItPwNA1iPUavNrVKBwzHgUDRvbyz
         jw5tF32icsGwZnf5M5NpAufDunpxIFXZLISIDfRpL3UW+N3e/J1+TTwWhLDIQcsn1eKm
         kpUQ==
X-Gm-Message-State: AOAM532E40fohN2NBUc9QmSzWNiUUPsXLew3sGrv1NhAUVSB1/Rkoe5K
        TXr0YtT6R8NkDfHwWH7ZCUQLdA==
X-Google-Smtp-Source: ABdhPJz9AcV4z5SuWRy5aQhHjzPCDw+jtn47kitjBExtfPv9fXP0ecpB3t2sXOtVKfPEgxKFBV87jA==
X-Received: by 2002:a2e:7d07:: with SMTP id y7mr24458512ljc.406.1633460170725;
        Tue, 05 Oct 2021 11:56:10 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id z12sm1902672lfs.101.2021.10.05.11.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 11:56:10 -0700 (PDT)
Date:   Tue, 5 Oct 2021 20:56:09 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5] media: rcar-isp: Add Renesas R-Car Image Signal
 Processor driver
Message-ID: <YVyfyRKXA3/pnZdU@oden.dyn.berto.se>
References: <20210914140057.2801405-1-niklas.soderlund+renesas@ragnatech.se>
 <20211004102159.y7bgaejz4ez47p3p@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211004102159.y7bgaejz4ez47p3p@uno.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thanks for your review.

On 2021-10-04 12:21:59 +0200, Jacopo Mondi wrote:
> Hi Niklas,
> 
> On Tue, Sep 14, 2021 at 04:00:57PM +0200, Niklas Söderlund wrote:
> > Add a V4L2 driver for Renesas R-Car Image Signal Processor. The driver
> > supports the R-Car V3U SoC where the ISP IP sits between the R-Car CSI-2
> > receiver and VIN and filters the CSI-2 data based on VC/DT and directs
> > the video stream to different VIN IPs.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> > * Changes since v4
> > - Update to the new async function names.
> > - Do not depend on external s_power, instead control the device power at stream start/stop.
> > - Do not look at remote upstream subdevice format when starting (or at all).
> > - Serialise access for format variables in get_fmt and set_fmt.
> > - Make use of v4l2_subdev_link_validate_default()
> > - Add mutex_destroy() on error paths and in remove function.
> > - Propperly disable runtime PM if subdev registration fails.
> >
> > * Changes since v3
> > - Fix spelling in header information.
> > - Add parentheses around macro expansions.
> > - Add explicit blocks to for-loop body.
> > - Add documentation for mutex.
> >
> > * Changes since v2
> > - Add description of IPS capabilities and that only channel selection is
> >   currently supported.
> > - Update signature of v4l2_subdev_pad_ops set_fmt.
> > - Switch to pm_runtime_resume_and_get().
> > - Make better use of devm_kzalloc().
> > ---
> >  MAINTAINERS                       |   1 +
> >  drivers/media/platform/Kconfig    |  16 +
> >  drivers/media/platform/Makefile   |   1 +
> >  drivers/media/platform/rcar-isp.c | 517 ++++++++++++++++++++++++++++++
> >  4 files changed, 535 insertions(+)
> >  create mode 100644 drivers/media/platform/rcar-isp.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 08c9612e769af24a..8164d1bd0a4df351 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11575,6 +11575,7 @@ T:	git git://linuxtv.org/media_tree.git
> >  F:	Documentation/devicetree/bindings/media/renesas,csi2.yaml
> >  F:	Documentation/devicetree/bindings/media/renesas,isp.yaml
> >  F:	Documentation/devicetree/bindings/media/renesas,vin.yaml
> > +F:	drivers/media/platform/rcar-isp.c
> >  F:	drivers/media/platform/rcar-vin/
> >
> >  MEDIA DRIVERS FOR RENESAS - VSP1
> > diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> > index aa277a19e2759617..b95e9368110c7848 100644
> > --- a/drivers/media/platform/Kconfig
> > +++ b/drivers/media/platform/Kconfig
> > @@ -200,6 +200,22 @@ config VIDEO_TI_CAL_MC
> >
> >  endif # VIDEO_TI_CAL
> >
> > +config VIDEO_RCAR_ISP
> > +	tristate "R-Car Image Signal Processor (ISP)"
> > +	depends on VIDEO_V4L2 && OF
> > +	depends on ARCH_RENESAS || COMPILE_TEST
> > +	select MEDIA_CONTROLLER
> > +	select VIDEO_V4L2_SUBDEV_API
> > +	select RESET_CONTROLLER
> > +	select V4L2_FWNODE
> > +	help
> > +	  Support for Renesas R-Car Image Signal Processor (ISP).
> > +	  Enable this to support the Renesas R-Car Image Signal
> > +	  Processor (ISP).
> > +
> > +	  To compile this driver as a module, choose M here: the
> > +	  module will be called rcar-isp.
> > +
> >  endif # V4L_PLATFORM_DRIVERS
> >
> >  menuconfig V4L_MEM2MEM_DRIVERS
> > diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> > index 73ce083c2fc6b51b..a148553babfc0944 100644
> > --- a/drivers/media/platform/Makefile
> > +++ b/drivers/media/platform/Makefile
> > @@ -63,6 +63,7 @@ obj-$(CONFIG_VIDEO_AM437X_VPFE)		+= am437x/
> >
> >  obj-$(CONFIG_VIDEO_XILINX)		+= xilinx/
> >
> > +obj-$(CONFIG_VIDEO_RCAR_ISP)		+= rcar-isp.o
> >  obj-$(CONFIG_VIDEO_RCAR_VIN)		+= rcar-vin/
> >
> >  obj-$(CONFIG_VIDEO_ATMEL_ISC)		+= atmel/
> > diff --git a/drivers/media/platform/rcar-isp.c b/drivers/media/platform/rcar-isp.c
> > new file mode 100644
> > index 0000000000000000..1055ca87975c8676
> > --- /dev/null
> > +++ b/drivers/media/platform/rcar-isp.c
> > @@ -0,0 +1,517 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2021 Renesas Electronics Corp.
> > + *
> > + * Driver for Renesas R-Car ISP Channel Selector
> > + *
> > + * The ISP hardware is capable of more than just channel selection, features
> > + * such as demosaicing, white balance control and color space conversion are
> > + * also possible. These more advanced features are not supported by the driver
> > + * due to lack of documentation.
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/of_device.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/reset.h>
> > +
> > +#include <media/v4l2-subdev.h>
> > +
> > +#define ISPINPUTSEL0_REG				0x0008
> > +#define ISPINPUTSEL0_SEL_CSI0				BIT(31)
> > +
> > +#define ISPSTART_REG					0x0014
> > +#define ISPSTART_START					0xffff
> > +#define ISPSTART_STOP					0x0000
> > +
> > +#define ISPPROCMODE_DT_REG(n)				(0x1100 + (0x4 * (n)))
> > +#define ISPPROCMODE_DT_PROC_MODE_VC3(pm)		(((pm) & 0x3f) << 24)
> > +#define ISPPROCMODE_DT_PROC_MODE_VC2(pm)		(((pm) & 0x3f) << 16)
> > +#define ISPPROCMODE_DT_PROC_MODE_VC1(pm)		(((pm) & 0x3f) << 8)
> > +#define ISPPROCMODE_DT_PROC_MODE_VC0(pm)		((pm) & 0x3f)
> > +
> > +#define ISPCS_FILTER_ID_CH_REG(n)			(0x3000 + (0x0100 * (n)))
> > +
> > +#define ISPCS_DT_CODE03_CH_REG(n)			(0x3008 + (0x100 * (n)))
> > +#define ISPCS_DT_CODE03_EN3				BIT(31)
> > +#define ISPCS_DT_CODE03_DT3(dt)				(((dt) & 0x3f) << 24)
> > +#define ISPCS_DT_CODE03_EN2				BIT(23)
> > +#define ISPCS_DT_CODE03_DT2(dt)				(((dt) & 0x3f) << 16)
> > +#define ISPCS_DT_CODE03_EN1				BIT(15)
> > +#define ISPCS_DT_CODE03_DT1(dt)				(((dt) & 0x3f) << 8)
> > +#define ISPCS_DT_CODE03_EN0				BIT(7)
> > +#define ISPCS_DT_CODE03_DT0(dt)				((dt) & 0x3f)
> > +
> > +struct rcar_isp_format {
> > +	u32 code;
> > +	unsigned int datatype;
> > +	unsigned int procmode;
> > +};
> > +
> > +static const struct rcar_isp_format rcar_isp_formats[] = {
> > +	{ .code = MEDIA_BUS_FMT_RGB888_1X24,	.datatype = 0x24, .procmode = 0x15 },
> > +	{ .code = MEDIA_BUS_FMT_Y10_1X10,	.datatype = 0x2b, .procmode = 0x10 },
> > +	{ .code = MEDIA_BUS_FMT_UYVY8_1X16,	.datatype = 0x1e, .procmode = 0x0c },
> > +	{ .code = MEDIA_BUS_FMT_YUYV8_1X16,	.datatype = 0x1e, .procmode = 0x0c },
> > +	{ .code = MEDIA_BUS_FMT_UYVY8_2X8,	.datatype = 0x1e, .procmode = 0x0c },
> > +	{ .code = MEDIA_BUS_FMT_YUYV10_2X10,	.datatype = 0x1e, .procmode = 0x0c },
>                                             ^ tab                ^ space
> 
> > +};
> > +
> > +static const struct rcar_isp_format *risp_code_to_fmt(unsigned int code)
> > +{
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(rcar_isp_formats); i++) {
> > +		if (rcar_isp_formats[i].code == code)
> > +			return &rcar_isp_formats[i];
> > +	}
> > +
> > +	return NULL;
> > +}
> > +
> > +enum rcar_isp_input {
> > +	RISP_CSI_INPUT0,
> > +	RISP_CSI_INPUT1,
> > +};
> > +
> > +enum rcar_isp_pads {
> > +	RCAR_ISP_SINK,
> > +	RCAR_ISP_PORT0,
> > +	RCAR_ISP_PORT1,
> > +	RCAR_ISP_PORT2,
> > +	RCAR_ISP_PORT3,
> > +	RCAR_ISP_PORT4,
> > +	RCAR_ISP_PORT5,
> > +	RCAR_ISP_PORT6,
> > +	RCAR_ISP_PORT7,
> > +	RCAR_ISP_MAX_PAD,
> > +};
> > +
> > +struct rcar_isp {
> > +	struct device *dev;
> > +	void __iomem *base;
> > +	struct reset_control *rstc;
> > +
> > +	enum rcar_isp_input csi_input;
> > +
> > +	struct v4l2_subdev subdev;
> > +	struct media_pad pads[RCAR_ISP_MAX_PAD];
> > +
> > +	struct v4l2_async_notifier notifier;
> > +	struct v4l2_subdev *remote;
> > +	unsigned int remote_pad;
> > +
> > +	struct mutex lock; /* Protects mf and stream_count. */
> > +	struct v4l2_mbus_framefmt mf;
> > +	int stream_count;
> > +};
> > +
> > +static inline struct rcar_isp *sd_to_isp(struct v4l2_subdev *sd)
> > +{
> > +	return container_of(sd, struct rcar_isp, subdev);
> > +}
> > +
> > +static inline struct rcar_isp *notifier_to_isp(struct v4l2_async_notifier *n)
> > +{
> > +	return container_of(n, struct rcar_isp, notifier);
> > +}
> > +
> > +static void risp_write(struct rcar_isp *isp, u32 offset, u32 value)
> > +{
> > +	iowrite32(value, isp->base + offset);
> > +}
> > +
> > +static u32 risp_read(struct rcar_isp *isp, u32 offset)
> > +{
> > +	return ioread32(isp->base + offset);
> > +}
> > +
> > +static int risp_power_on(struct rcar_isp *isp)
> > +{
> > +	int ret;
> > +
> > +	ret = pm_runtime_resume_and_get(isp->dev);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret = reset_control_deassert(isp->rstc);
> > +	if (ret < 0) {
> > +		pm_runtime_put(isp->dev);
> > +		return ret;
> > +	}
> 
> I still think you should define a .resume and .suspend callbacks
> through something like SIMPLE_DEV_PM_OPS which assert/deassert the
> reset controller and just call pm_runtime_resume_and_get() and
> pm_runtime_put() at risp_start() and risp_stop() times.

I wrestled a bit with this in other subdevices involved in the R-Car 
capture chain. I was about to convert all of them to what you suggest 
here but ran into issues with suspend/resume to s2disk IIRC if there was 
a ongoing capture when suspending it would not start correctly. Having 
it in the s_stream call path like this ensured the proper power on of 
the different devices.

I'm sure it can be solved using SIMPLE_DEV_PM_OPS but I have not yet dug 
deep enough in all the drivers to figure it all out.

> 
> Otherwise am I wrong thinking that pm_runtime is only here for refcounting ?

It also (depending on platform) controls the module clocks.

> 
> > +
> > +	return 0;
> > +}
> > +
> > +static void risp_power_off(struct rcar_isp *isp)
> > +{
> > +	reset_control_assert(isp->rstc);
> > +	pm_runtime_put(isp->dev);
> > +}
> > +
> > +static int risp_start(struct rcar_isp *isp)
> > +{
> > +	const struct rcar_isp_format *format;
> > +	unsigned int vc;
> > +	u32 sel_csi = 0;
> > +	int ret;
> > +
> > +	format = risp_code_to_fmt(isp->mf.code);
> > +	if (!format) {
> > +		dev_err(isp->dev, "Unsupported bus format\n");
> > +		return -EINVAL;
> > +	}
> 
> I don't think this can now happen as isp->mf.code is set through
> set_fmt and it's adjusted

Ture. But I get mail from code cover testers that always add back this 
check so I thought I just added it myself this time ;-)

> 
> > +
> > +	ret = risp_power_on(isp);
> > +	if (ret) {
> > +		dev_err(isp->dev, "Failed to power on ISP\n");
> > +		return ret;
> > +	}
> > +
> > +	/* Select CSI-2 input source. */
> > +	if (isp->csi_input == RISP_CSI_INPUT1)
> > +		sel_csi = ISPINPUTSEL0_SEL_CSI0;
> > +
> > +	risp_write(isp, ISPINPUTSEL0_REG,
> > +		   risp_read(isp, ISPINPUTSEL0_REG) | sel_csi);
> > +
> > +	/* Configure Channel Selector. */
> 
> If I'm not mistaken we have a fixed routing from channel 4-7 to
> VIN[0-3] as routing is controlled by VC/DT matching. If that's the
> case, should this be recorded ?

I like it the way it is :-)

> 
> > +	for (vc = 0; vc < 4; vc++) {
> > +		u8 ch = vc + 4;
> > +		u8 dt = format->datatype;
> > +
> > +		risp_write(isp, ISPCS_FILTER_ID_CH_REG(ch), BIT(vc));
> > +		risp_write(isp, ISPCS_DT_CODE03_CH_REG(ch),
> > +			   ISPCS_DT_CODE03_EN3 | ISPCS_DT_CODE03_DT3(dt) |
> > +			   ISPCS_DT_CODE03_EN2 | ISPCS_DT_CODE03_DT2(dt) |
> > +			   ISPCS_DT_CODE03_EN1 | ISPCS_DT_CODE03_DT1(dt) |
> > +			   ISPCS_DT_CODE03_EN0 | ISPCS_DT_CODE03_DT0(dt));
> > +	}
> > +
> > +	/* Setup processing method. */
> > +	risp_write(isp, ISPPROCMODE_DT_REG(format->datatype),
> > +		   ISPPROCMODE_DT_PROC_MODE_VC3(format->procmode) |
> > +		   ISPPROCMODE_DT_PROC_MODE_VC2(format->procmode) |
> > +		   ISPPROCMODE_DT_PROC_MODE_VC1(format->procmode) |
> > +		   ISPPROCMODE_DT_PROC_MODE_VC0(format->procmode));
> > +
> > +	/* Start ISP. */
> > +	risp_write(isp, ISPSTART_REG, ISPSTART_START);
> > +
> > +	ret = v4l2_subdev_call(isp->remote, video, s_stream, 1);
> > +	if (ret)
> > +		risp_power_off(isp);
> > +
> > +	return ret;
> > +}
> > +
> > +static void risp_stop(struct rcar_isp *isp)
> > +{
> > +	v4l2_subdev_call(isp->remote, video, s_stream, 0);
> > +
> > +	/* Stop ISP. */
> > +	risp_write(isp, ISPSTART_REG, ISPSTART_STOP);
> > +
> > +	risp_power_off(isp);
> > +}
> > +
> > +static int risp_s_stream(struct v4l2_subdev *sd, int enable)
> > +{
> > +	struct rcar_isp *isp = sd_to_isp(sd);
> > +	int ret = 0;
> > +
> > +	mutex_lock(&isp->lock);
> > +
> > +	if (!isp->remote) {
> > +		ret = -ENODEV;
> > +		goto out;
> > +	}
> > +
> > +	if (enable && isp->stream_count == 0) {
> > +		ret = risp_start(isp);
> > +		if (ret)
> > +			goto out;
> > +	} else if (!enable && isp->stream_count == 1) {
> > +		risp_stop(isp);
> > +	}
> > +
> > +	isp->stream_count += enable ? 1 : -1;
> > +out:
> > +	mutex_unlock(&isp->lock);
> > +
> > +	return ret;
> > +}
> > +
> > +static const struct v4l2_subdev_video_ops risp_video_ops = {
> > +	.s_stream = risp_s_stream,
> > +};
> > +
> > +static int risp_set_pad_format(struct v4l2_subdev *sd,
> > +			       struct v4l2_subdev_state *sd_state,
> > +			       struct v4l2_subdev_format *format)
> > +{
> > +	struct rcar_isp *isp = sd_to_isp(sd);
> > +	struct v4l2_mbus_framefmt *framefmt;
> > +
> > +	mutex_lock(&isp->lock);
> > +
> > +	if (!risp_code_to_fmt(format->format.code))
> > +		format->format.code = rcar_isp_formats[0].code;
> > +
> > +	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> > +		isp->mf = format->format;
> > +	} else {
> > +		framefmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
> > +		*framefmt = format->format;
> > +	}
> > +
> > +	mutex_unlock(&isp->lock);
> > +
> > +	return 0;
> > +}
> > +
> > +static int risp_get_pad_format(struct v4l2_subdev *sd,
> > +			       struct v4l2_subdev_state *sd_state,
> > +			       struct v4l2_subdev_format *format)
> > +{
> > +	struct rcar_isp *isp = sd_to_isp(sd);
> > +
> > +	mutex_lock(&isp->lock);
> > +
> > +	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> > +		format->format = isp->mf;
> > +	else
> > +		format->format = *v4l2_subdev_get_try_format(sd, sd_state, 0);
> > +
> > +	mutex_unlock(&isp->lock);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct v4l2_subdev_pad_ops risp_pad_ops = {
> > +	.set_fmt = risp_set_pad_format,
> > +	.get_fmt = risp_get_pad_format,
> > +	.link_validate = v4l2_subdev_link_validate_default,
> > +};
> > +
> > +static const struct v4l2_subdev_ops rcar_isp_subdev_ops = {
> > +	.video	= &risp_video_ops,
> > +	.pad	= &risp_pad_ops,
> > +};
> > +
> > +/* -----------------------------------------------------------------------------
> > + * Async handling and registration of subdevices and links
> > + */
> > +
> > +static int risp_notify_bound(struct v4l2_async_notifier *notifier,
> > +			     struct v4l2_subdev *subdev,
> > +			     struct v4l2_async_subdev *asd)
> > +{
> > +	struct rcar_isp *isp = notifier_to_isp(notifier);
> > +	int pad;
> > +
> > +	pad = media_entity_get_fwnode_pad(&subdev->entity, asd->match.fwnode,
> > +					  MEDIA_PAD_FL_SOURCE);
> > +	if (pad < 0) {
> > +		dev_err(isp->dev, "Failed to find pad for %s\n", subdev->name);
> > +		return pad;
> > +	}
> > +
> > +	isp->remote = subdev;
> > +	isp->remote_pad = pad;
> 
> remote_pad is not used anywhere now that the format comes from the
> local pad.

Good catch, thanks!

> 
> > +
> > +	dev_dbg(isp->dev, "Bound %s pad: %d\n", subdev->name, pad);
> > +
> > +	return media_create_pad_link(&subdev->entity, pad,
> > +				     &isp->subdev.entity, 0,
> > +				     MEDIA_LNK_FL_ENABLED |
> > +				     MEDIA_LNK_FL_IMMUTABLE);
> > +}
> > +
> > +static void risp_notify_unbind(struct v4l2_async_notifier *notifier,
> > +			       struct v4l2_subdev *subdev,
> > +			       struct v4l2_async_subdev *asd)
> > +{
> > +	struct rcar_isp *isp = notifier_to_isp(notifier);
> > +
> > +	isp->remote = NULL;
> > +
> > +	dev_dbg(isp->dev, "Unbind %s\n", subdev->name);
> > +}
> > +
> > +static const struct v4l2_async_notifier_operations risp_notify_ops = {
> > +	.bound = risp_notify_bound,
> > +	.unbind = risp_notify_unbind,
> > +};
> > +
> > +static int risp_parse_dt(struct rcar_isp *isp)
> > +{
> > +	struct v4l2_async_subdev *asd;
> > +	struct fwnode_handle *fwnode;
> > +	struct fwnode_handle *ep;
> > +	unsigned int id;
> > +	int ret;
> > +
> > +	for (id = 0; id < 2; id++) {
> > +		ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(isp->dev),
> > +						     0, id, 0);
> > +		if (ep)
> > +			break;
> > +	}
> > +
> > +	if (!ep) {
> > +		dev_err(isp->dev, "Not connected to subdevice\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (id == 1)
> > +		isp->csi_input = RISP_CSI_INPUT1;
> > +
> > +	fwnode = fwnode_graph_get_remote_endpoint(ep);
> > +	fwnode_handle_put(ep);
> > +
> > +	dev_dbg(isp->dev, "Found '%pOF'\n", to_of_node(fwnode));
> > +
> > +	v4l2_async_nf_init(&isp->notifier);
> > +	isp->notifier.ops = &risp_notify_ops;
> > +
> > +	asd = v4l2_async_nf_add_fwnode(&isp->notifier, fwnode,
> > +				       struct v4l2_async_subdev);
> > +	fwnode_handle_put(fwnode);
> > +	if (IS_ERR(asd))
> > +		return PTR_ERR(asd);
> > +
> > +	ret = v4l2_async_subdev_nf_register(&isp->subdev, &isp->notifier);
> > +	if (ret)
> > +		v4l2_async_nf_cleanup(&isp->notifier);
> > +
> > +	return ret;
> > +}
> > +
> > +/* -----------------------------------------------------------------------------
> > + * Platform Device Driver
> > + */
> > +
> > +static const struct media_entity_operations risp_entity_ops = {
> > +	.link_validate = v4l2_subdev_link_validate,
> > +};
> > +
> > +static int risp_probe_resources(struct rcar_isp *isp,
> > +				struct platform_device *pdev)
> > +{
> > +	struct resource *res;
> > +
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	isp->base = devm_ioremap_resource(&pdev->dev, res);
> > +	if (IS_ERR(isp->base))
> > +		return PTR_ERR(isp->base);
> > +
> > +	isp->rstc = devm_reset_control_get(&pdev->dev, NULL);
> > +
> > +	return PTR_ERR_OR_ZERO(isp->rstc);
> > +}
> > +
> > +static const struct of_device_id risp_of_id_table[] = {
> > +	{ .compatible = "renesas,r8a779a0-isp" },
> > +	{ /* sentinel */ },
> > +};
> > +MODULE_DEVICE_TABLE(of, risp_of_id_table);
> > +
> > +static int risp_probe(struct platform_device *pdev)
> > +{
> > +	struct rcar_isp *isp;
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	isp = devm_kzalloc(&pdev->dev, sizeof(*isp), GFP_KERNEL);
> > +	if (!isp)
> > +		return -ENOMEM;
> > +
> > +	isp->dev = &pdev->dev;
> > +
> > +	mutex_init(&isp->lock);
> > +
> > +	ret = risp_probe_resources(isp, pdev);
> > +	if (ret) {
> > +		dev_err(isp->dev, "Failed to get resources\n");
> > +		goto error_mutex;
> > +	}
> > +
> > +	platform_set_drvdata(pdev, isp);
> > +
> > +	pm_runtime_enable(&pdev->dev);
> > +
> > +	ret = risp_parse_dt(isp);
> > +	if (ret)
> > +		goto error_pm;
> > +
> > +	isp->subdev.owner = THIS_MODULE;
> > +	isp->subdev.dev = &pdev->dev;
> > +	v4l2_subdev_init(&isp->subdev, &rcar_isp_subdev_ops);
> > +	v4l2_set_subdevdata(&isp->subdev, &pdev->dev);
> > +	snprintf(isp->subdev.name, V4L2_SUBDEV_NAME_SIZE, "%s %s",
> > +		 KBUILD_MODNAME, dev_name(&pdev->dev));
> > +	isp->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +
> > +	isp->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
> > +	isp->subdev.entity.ops = &risp_entity_ops;
> > +
> > +	isp->pads[RCAR_ISP_SINK].flags = MEDIA_PAD_FL_SINK;
> > +	for (i = RCAR_ISP_PORT0; i < RCAR_ISP_MAX_PAD; i++)
> > +		isp->pads[i].flags = MEDIA_PAD_FL_SOURCE;
> > +
> > +	ret = media_entity_pads_init(&isp->subdev.entity, RCAR_ISP_MAX_PAD,
> > +				     isp->pads);
> > +	if (ret)
> > +		goto error_notifier;
> > +
> > +	ret = v4l2_async_register_subdev(&isp->subdev);
> > +	if (ret < 0)
> > +		goto error_notifier;
> > +
> > +	dev_info(isp->dev, "Using CSI-2 input: %u\n", isp->csi_input);
> > +
> > +	return 0;
> 
> Maybe an empy line to highlight the error path

I think it's a matter of preference, I (almost) never inject empty lines 
for labels :-)

> 
> Anyway, all minors, you'll have a new version anyway and pm_runtime
> usage has been under the eyes of Sakari and Hans for 5 versions and
> they have not complained so I guess it's fine.
> 
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks!

> 
> Thanks
>    j
> 
> > +error_notifier:
> > +	v4l2_async_nf_unregister(&isp->notifier);
> > +	v4l2_async_nf_cleanup(&isp->notifier);
> > +error_pm:
> > +	pm_runtime_disable(&pdev->dev);
> > +error_mutex:
> > +	mutex_destroy(&isp->lock);
> > +
> > +	return ret;
> > +}
> > +
> > +static int risp_remove(struct platform_device *pdev)
> > +{
> > +	struct rcar_isp *isp = platform_get_drvdata(pdev);
> > +
> > +	v4l2_async_nf_unregister(&isp->notifier);
> > +	v4l2_async_nf_cleanup(&isp->notifier);
> > +
> > +	v4l2_async_unregister_subdev(&isp->subdev);
> > +
> > +	pm_runtime_disable(&pdev->dev);
> > +
> > +	mutex_destroy(&isp->lock);
> > +
> > +	return 0;
> > +}
> > +
> > +static struct platform_driver rcar_isp_driver = {
> > +	.driver = {
> > +		.name = "rcar-isp",
> > +		.of_match_table = risp_of_id_table,
> > +	},
> > +	.probe = risp_probe,
> > +	.remove = risp_remove,
> > +};
> > +
> > +module_platform_driver(rcar_isp_driver);
> > +
> > +MODULE_AUTHOR("Niklas Söderlund <niklas.soderlund@ragnatech.se>");
> > +MODULE_DESCRIPTION("Renesas R-Car ISP Channel Selector driver");
> > +MODULE_LICENSE("GPL");
> 
> 
> > --
> > 2.33.0
> >

-- 
Regards,
Niklas Söderlund
