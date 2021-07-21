Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1BDE3D092C
	for <lists+linux-media@lfdr.de>; Wed, 21 Jul 2021 08:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233349AbhGUGH6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Jul 2021 02:07:58 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:56069 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229920AbhGUGHy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Jul 2021 02:07:54 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 661tmza2Ahqx9661umxz5b; Wed, 21 Jul 2021 08:48:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1626850110; bh=eRpKvcZ/KQWdmahquc1IXyezaD1GpJZ94j57GlZHqto=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=s2+GE4mMzr/jjQEPA85JwLTIY+h8GM0euvZ7YX+RrReAOGuY7ADI2v96pgHvIIJg8
         dbw7mKp5uMe4mBF3+bXyYvhFCgyd25J3Lhg0Nf2OzwthgPOEs4+8IdDbQbOQiEzTJa
         e8OlBu5+5wW2+1cFLuT2syvrbtJvwetkv8NsxokIXLFvJEcFgzeNJvQBRG8Ju5eZXM
         BQ7XZmXZKTlCVmWAQjRExsiei/63yOMbb4IONIeftDNa2AGlNBC/kTP5OqXqJ5eZi8
         6W+frF0V+Bysvx7ybxiaTSeAP8zwagV2esTFmWN1K8NkkcYVBf28nNFZM6NTXJzr8h
         pLVBsU0ECrfKA==
Subject: Re: [PATCH v3] media: rcar-isp: Add Renesas R-Car Image Signal
 Processor driver
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20210630141358.3008156-1-niklas.soderlund+renesas@ragnatech.se>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <e6c3ed89-7903-ef84-669f-200b3dc528ed@xs4all.nl>
Date:   Wed, 21 Jul 2021 08:48:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630141358.3008156-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfM5rptrcMYHmi3IN0+tgyufNyKbgNjb5BtUND8zkQdA21wpJWFIAKhmeOioIN3MvTN6zJe5JYHoEFUIsCqBZ5ZZTamoUfaeOHXW9qbftSTuOU4gYTldN
 VneHvbxq8L0dm9XibAmkzCMcxqXGDL32UInobz4poVY45ku4/SWcaUVr3zaG7EnBPA0/3C3UWcwGh7fxAEus46UJMPra2yvz+uMGiGxqeSszEXBRo7OYFpwk
 uFUWd2SdGPvzae9v6VBKzKlSYe4mazZUk1tjuAOi1QxSxLatjm5KspUCLPdCSzMzv3w6vhPHNVYgQGMU9o1iJcPv8WYzcasqQgPq/3Odg9+Zw0XGrwxaZZeh
 vsXQint6k4QJWQnsHkO0fiwTpVQUkLYDWxib62rDvrEVvPZ2f+A=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

A few minor comments below.

I also agree with Jacopo that it is time to move all the renesas modules
in their own subdirectory. But I am OK with that being done in a follow-up
patch.

On 30/06/2021 16:13, Niklas Söderlund wrote:
> Add a V4L2 driver for Renesas R-Car Image Signal Processor. The driver
> supports the R-Car V3U SoC where the ISP IP sits between the R-Car CSI-2
> receiver and VIN and filters the CSI-2 data based on VC/DT and directs
> the video stream to different VIN IPs.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v2
> - Add description of IPS capabilities and that only channel selection is
>   currently supported.
> - Update signature of v4l2_subdev_pad_ops set_fmt.
> - Switch to pm_runtime_resume_and_get().
> - Make better use of that devm_kzalloc().
> ---
>  MAINTAINERS                       |   1 +
>  drivers/media/platform/Kconfig    |  16 +
>  drivers/media/platform/Makefile   |   1 +
>  drivers/media/platform/rcar-isp.c | 504 ++++++++++++++++++++++++++++++
>  4 files changed, 522 insertions(+)
>  create mode 100644 drivers/media/platform/rcar-isp.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0a1d93ca54875f0c..a25293d66a72cc15 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11408,6 +11408,7 @@ T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/renesas,csi2.yaml
>  F:	Documentation/devicetree/bindings/media/renesas,isp.yaml
>  F:	Documentation/devicetree/bindings/media/renesas,vin.yaml
> +F:	drivers/media/platform/rcar-isp.c
>  F:	drivers/media/platform/rcar-vin/
>  
>  MEDIA DRIVERS FOR RENESAS - VSP1
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 157c924686e4b61b..a8777d5dd6bc3ec1 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -200,6 +200,22 @@ config VIDEO_TI_CAL_MC
>  
>  endif # VIDEO_TI_CAL
>  
> +config VIDEO_RCAR_ISP
> +	tristate "R-Car Image Signal Processor (ISP)"
> +	depends on VIDEO_V4L2 && OF
> +	depends on ARCH_RENESAS || COMPILE_TEST
> +	select MEDIA_CONTROLLER
> +	select VIDEO_V4L2_SUBDEV_API
> +	select RESET_CONTROLLER
> +	select V4L2_FWNODE
> +	help
> +	  Support for Renesas R-Car Image Signal Processor (ISP).
> +	  Enable this to support the Renesas R-Car Image Signal
> +	  Processor (ISP).
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called rcar-isp.
> +
>  endif # V4L_PLATFORM_DRIVERS
>  
>  menuconfig V4L_MEM2MEM_DRIVERS
> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> index 73ce083c2fc6b51b..a148553babfc0944 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -63,6 +63,7 @@ obj-$(CONFIG_VIDEO_AM437X_VPFE)		+= am437x/
>  
>  obj-$(CONFIG_VIDEO_XILINX)		+= xilinx/
>  
> +obj-$(CONFIG_VIDEO_RCAR_ISP)		+= rcar-isp.o
>  obj-$(CONFIG_VIDEO_RCAR_VIN)		+= rcar-vin/
>  
>  obj-$(CONFIG_VIDEO_ATMEL_ISC)		+= atmel/
> diff --git a/drivers/media/platform/rcar-isp.c b/drivers/media/platform/rcar-isp.c
> new file mode 100644
> index 0000000000000000..0f439eb17d740e67
> --- /dev/null
> +++ b/drivers/media/platform/rcar-isp.c
> @@ -0,0 +1,504 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2021 Renesas Electronics Corp.
> + *
> + * Driver for Renesas R-Car ISP Channel Selector
> + *
> + * The ISP hardware is capable of more then just channel selection, features

then -> than

> + * such as demosacing, white balance control and color space conversion are also

demosacing -> demosaicing

> + * possible. These more advance features are not supported by the driver due to

advance -> advanced

> + * lack of documentation.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +
> +#include <media/v4l2-subdev.h>
> +
> +#define ISPINPUTSEL0_REG				0x0008
> +#define ISPINPUTSEL0_SEL_CSI0				BIT(31)
> +
> +#define ISPSTART_REG					0x0014
> +#define ISPSTART_START					0xffff
> +#define ISPSTART_STOP					0x0000
> +
> +#define ISPPROCMODE_DT_REG(n)				(0x1100 + (0x4 * n))

Add parenthesis around n in the macro.

> +#define ISPPROCMODE_DT_PROC_MODE_VC3(pm)		(((pm) & 0x3f) << 24)
> +#define ISPPROCMODE_DT_PROC_MODE_VC2(pm)		(((pm) & 0x3f) << 16)
> +#define ISPPROCMODE_DT_PROC_MODE_VC1(pm)		(((pm) & 0x3f) << 8)
> +#define ISPPROCMODE_DT_PROC_MODE_VC0(pm)		((pm) & 0x3f)
> +
> +#define ISPCS_FILTER_ID_CH_REG(n)			(0x3000 + (0x0100 * n))

Ditto

> +
> +#define ISPCS_DT_CODE03_CH_REG(n)			(0x3008 + (0x100 * n))


Ditto

> +#define ISPCS_DT_CODE03_EN3				BIT(31)
> +#define ISPCS_DT_CODE03_DT3(dt)				(((dt) & 0x3f) << 24)
> +#define ISPCS_DT_CODE03_EN2				BIT(23)
> +#define ISPCS_DT_CODE03_DT2(dt)				(((dt) & 0x3f) << 16)
> +#define ISPCS_DT_CODE03_EN1				BIT(15)
> +#define ISPCS_DT_CODE03_DT1(dt)				(((dt) & 0x3f) << 8)
> +#define ISPCS_DT_CODE03_EN0				BIT(7)
> +#define ISPCS_DT_CODE03_DT0(dt)				((dt) & 0x3f)
> +
> +struct rcar_isp_format {
> +	u32 code;
> +	unsigned int datatype;
> +	unsigned int procmode;
> +};
> +
> +static const struct rcar_isp_format rcar_isp_formats[] = {
> +	{ .code = MEDIA_BUS_FMT_RGB888_1X24,	.datatype = 0x24, .procmode = 0x15 },
> +	{ .code = MEDIA_BUS_FMT_Y10_1X10,	.datatype = 0x2b, .procmode = 0x10 },
> +	{ .code = MEDIA_BUS_FMT_UYVY8_1X16,	.datatype = 0x1e, .procmode = 0x0c },
> +	{ .code = MEDIA_BUS_FMT_YUYV8_1X16,	.datatype = 0x1e, .procmode = 0x0c },
> +	{ .code = MEDIA_BUS_FMT_UYVY8_2X8,	.datatype = 0x1e, .procmode = 0x0c },
> +	{ .code = MEDIA_BUS_FMT_YUYV10_2X10,	.datatype = 0x1e, .procmode = 0x0c },
> +};
> +
> +static const struct rcar_isp_format *risp_code_to_fmt(unsigned int code)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(rcar_isp_formats); i++)
> +		if (rcar_isp_formats[i].code == code)
> +			return &rcar_isp_formats[i];
> +
> +	return NULL;
> +}
> +
> +enum rcar_isp_input {
> +	RISP_CSI_INPUT0,
> +	RISP_CSI_INPUT1,
> +};
> +
> +enum rcar_isp_pads {
> +	RCAR_ISP_SINK,
> +	RCAR_ISP_PORT0,
> +	RCAR_ISP_PORT1,
> +	RCAR_ISP_PORT2,
> +	RCAR_ISP_PORT3,
> +	RCAR_ISP_PORT4,
> +	RCAR_ISP_PORT5,
> +	RCAR_ISP_PORT6,
> +	RCAR_ISP_PORT7,
> +	RCAR_ISP_MAX_PAD,
> +};
> +
> +struct rcar_isp {
> +	struct device *dev;
> +	void __iomem *base;
> +	struct reset_control *rstc;
> +
> +	enum rcar_isp_input csi_input;
> +
> +	struct v4l2_subdev subdev;
> +	struct media_pad pads[RCAR_ISP_MAX_PAD];
> +
> +	struct v4l2_async_notifier notifier;
> +	struct v4l2_subdev *remote;
> +	unsigned int remote_pad;
> +
> +	struct v4l2_mbus_framefmt mf;
> +
> +	struct mutex lock;

Add a comment describing the mutex.

> +	int stream_count;
> +};
> +
> +static inline struct rcar_isp *sd_to_isp(struct v4l2_subdev *sd)
> +{
> +	return container_of(sd, struct rcar_isp, subdev);
> +}
> +
> +static inline struct rcar_isp *notifier_to_isp(struct v4l2_async_notifier *n)
> +{
> +	return container_of(n, struct rcar_isp, notifier);
> +}
> +
> +static void risp_write(struct rcar_isp *isp, u32 offset, u32 value)
> +{
> +	iowrite32(value, isp->base + offset);
> +}
> +
> +static u32 risp_read(struct rcar_isp *isp, u32 offset)
> +{
> +	return ioread32(isp->base + offset);
> +}
> +
> +static int risp_s_power(struct v4l2_subdev *sd, int on)
> +{
> +	struct rcar_isp *isp = sd_to_isp(sd);
> +	int ret;
> +
> +	if (on) {
> +		ret = pm_runtime_resume_and_get(isp->dev);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = reset_control_deassert(isp->rstc);
> +		if (ret < 0)
> +			return ret;
> +	} else {
> +		reset_control_assert(isp->rstc);
> +		pm_runtime_put(isp->dev);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_core_ops risp_core_ops = {
> +	.s_power = risp_s_power,
> +};
> +
> +static int risp_remote_code(struct rcar_isp *isp)
> +{
> +	struct v4l2_subdev_format fmt = {
> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +	};
> +
> +	fmt.pad = isp->remote_pad;
> +	if (v4l2_subdev_call(isp->remote, pad, get_fmt, NULL, &fmt))
> +		return -EPIPE;
> +
> +	return fmt.format.code;
> +}
> +
> +static int risp_start(struct rcar_isp *isp)
> +{
> +	const struct rcar_isp_format *format;
> +	unsigned int vc;
> +	u32 sel_csi = 0;
> +
> +	format = risp_code_to_fmt(risp_remote_code(isp));
> +	if (!format) {
> +		dev_err(isp->dev, "Unsupported bus format\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Select CSI-2 input source. */
> +	if (isp->csi_input == RISP_CSI_INPUT1)
> +		sel_csi = ISPINPUTSEL0_SEL_CSI0;
> +
> +	risp_write(isp, ISPINPUTSEL0_REG,
> +		   risp_read(isp, ISPINPUTSEL0_REG) | sel_csi);
> +
> +	/* Configure Channel Selector. */
> +	for (vc = 0; vc < 4; vc++) {
> +		u8 ch = vc + 4;
> +		u8 dt = format->datatype;
> +
> +		risp_write(isp, ISPCS_FILTER_ID_CH_REG(ch), BIT(vc));
> +		risp_write(isp, ISPCS_DT_CODE03_CH_REG(ch),
> +			   ISPCS_DT_CODE03_EN3 | ISPCS_DT_CODE03_DT3(dt) |
> +			   ISPCS_DT_CODE03_EN2 | ISPCS_DT_CODE03_DT2(dt) |
> +			   ISPCS_DT_CODE03_EN1 | ISPCS_DT_CODE03_DT1(dt) |
> +			   ISPCS_DT_CODE03_EN0 | ISPCS_DT_CODE03_DT0(dt));
> +	}
> +
> +	/* Setup processing method. */
> +	risp_write(isp, ISPPROCMODE_DT_REG(format->datatype),
> +		   ISPPROCMODE_DT_PROC_MODE_VC3(format->procmode) |
> +		   ISPPROCMODE_DT_PROC_MODE_VC2(format->procmode) |
> +		   ISPPROCMODE_DT_PROC_MODE_VC1(format->procmode) |
> +		   ISPPROCMODE_DT_PROC_MODE_VC0(format->procmode));
> +
> +	/* Start ISP. */
> +	risp_write(isp, ISPSTART_REG, ISPSTART_START);
> +
> +	return v4l2_subdev_call(isp->remote, video, s_stream, 1);
> +}
> +
> +static void risp_stop(struct rcar_isp *isp)
> +{
> +	v4l2_subdev_call(isp->remote, video, s_stream, 0);
> +
> +	/* Stop ISP. */
> +	risp_write(isp, ISPSTART_REG, ISPSTART_STOP);
> +}
> +
> +static int risp_s_stream(struct v4l2_subdev *sd, int enable)
> +{
> +	struct rcar_isp *isp = sd_to_isp(sd);
> +	int ret = 0;
> +
> +	mutex_lock(&isp->lock);
> +
> +	if (!isp->remote) {
> +		ret = -ENODEV;
> +		goto out;
> +	}
> +
> +	if (enable && isp->stream_count == 0) {
> +		ret = risp_start(isp);
> +		if (ret)
> +			goto out;
> +	} else if (!enable && isp->stream_count == 1) {
> +		risp_stop(isp);
> +	}
> +
> +	isp->stream_count += enable ? 1 : -1;
> +out:
> +	mutex_unlock(&isp->lock);
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_subdev_video_ops risp_video_ops = {
> +	.s_stream = risp_s_stream,
> +};
> +
> +static int risp_set_pad_format(struct v4l2_subdev *sd,
> +			       struct v4l2_subdev_state *sd_state,
> +			       struct v4l2_subdev_format *format)
> +{
> +	struct rcar_isp *isp = sd_to_isp(sd);
> +	struct v4l2_mbus_framefmt *framefmt;
> +
> +	if (!risp_code_to_fmt(format->format.code))
> +		format->format.code = rcar_isp_formats[0].code;
> +
> +	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> +		isp->mf = format->format;
> +	} else {
> +		framefmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
> +		*framefmt = format->format;
> +	}
> +
> +	return 0;
> +}
> +
> +static int risp_get_pad_format(struct v4l2_subdev *sd,
> +			       struct v4l2_subdev_state *sd_state,
> +			       struct v4l2_subdev_format *format)
> +{
> +	struct rcar_isp *isp = sd_to_isp(sd);
> +
> +	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> +		format->format = isp->mf;
> +	else
> +		format->format = *v4l2_subdev_get_try_format(sd, sd_state, 0);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_pad_ops risp_pad_ops = {
> +	.set_fmt = risp_set_pad_format,
> +	.get_fmt = risp_get_pad_format,
> +};
> +
> +static const struct v4l2_subdev_ops rcar_isp_subdev_ops = {
> +	.core	= &risp_core_ops,
> +	.video	= &risp_video_ops,
> +	.pad	= &risp_pad_ops,
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * Async handling and registration of subdevices and links
> + */
> +
> +static int risp_notify_bound(struct v4l2_async_notifier *notifier,
> +			     struct v4l2_subdev *subdev,
> +			     struct v4l2_async_subdev *asd)
> +{
> +	struct rcar_isp *isp = notifier_to_isp(notifier);
> +	int pad;
> +
> +	pad = media_entity_get_fwnode_pad(&subdev->entity, asd->match.fwnode,
> +					  MEDIA_PAD_FL_SOURCE);
> +	if (pad < 0) {
> +		dev_err(isp->dev, "Failed to find pad for %s\n", subdev->name);
> +		return pad;
> +	}
> +
> +	isp->remote = subdev;
> +	isp->remote_pad = pad;
> +
> +	dev_dbg(isp->dev, "Bound %s pad: %d\n", subdev->name, pad);
> +
> +	return media_create_pad_link(&subdev->entity, pad,
> +				     &isp->subdev.entity, 0,
> +				     MEDIA_LNK_FL_ENABLED |
> +				     MEDIA_LNK_FL_IMMUTABLE);
> +}
> +
> +static void risp_notify_unbind(struct v4l2_async_notifier *notifier,
> +			       struct v4l2_subdev *subdev,
> +			       struct v4l2_async_subdev *asd)
> +{
> +	struct rcar_isp *isp = notifier_to_isp(notifier);
> +
> +	isp->remote = NULL;
> +
> +	dev_dbg(isp->dev, "Unbind %s\n", subdev->name);
> +}
> +
> +static const struct v4l2_async_notifier_operations risp_notify_ops = {
> +	.bound = risp_notify_bound,
> +	.unbind = risp_notify_unbind,
> +};
> +
> +static int risp_parse_dt(struct rcar_isp *isp)
> +{
> +	struct v4l2_async_subdev *asd;
> +	struct fwnode_handle *fwnode;
> +	struct fwnode_handle *ep;
> +	unsigned int id;
> +	int ret;
> +
> +	for (id = 0; id < 2; id++) {
> +		ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(isp->dev),
> +						     0, id, 0);
> +		if (ep)
> +			break;
> +	}
> +
> +	if (!ep) {
> +		dev_err(isp->dev, "Not connected to subdevice\n");
> +		return -EINVAL;
> +	}
> +
> +	if (id == 1)
> +		isp->csi_input = RISP_CSI_INPUT1;
> +
> +	fwnode = fwnode_graph_get_remote_endpoint(ep);
> +	fwnode_handle_put(ep);
> +
> +	dev_dbg(isp->dev, "Found '%pOF'\n", to_of_node(fwnode));
> +
> +	v4l2_async_notifier_init(&isp->notifier);
> +	isp->notifier.ops = &risp_notify_ops;
> +
> +	asd = v4l2_async_notifier_add_fwnode_subdev(&isp->notifier, fwnode,
> +						    struct v4l2_async_subdev);
> +	fwnode_handle_put(fwnode);
> +	if (IS_ERR(asd))
> +		return PTR_ERR(asd);
> +
> +	ret = v4l2_async_subdev_notifier_register(&isp->subdev, &isp->notifier);
> +	if (ret)
> +		v4l2_async_notifier_cleanup(&isp->notifier);
> +
> +	return ret;
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * Platform Device Driver
> + */
> +
> +static const struct media_entity_operations risp_entity_ops = {
> +	.link_validate = v4l2_subdev_link_validate,
> +};
> +
> +static int risp_probe_resources(struct rcar_isp *isp,
> +				struct platform_device *pdev)
> +{
> +	struct resource *res;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	isp->base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(isp->base))
> +		return PTR_ERR(isp->base);
> +
> +	isp->rstc = devm_reset_control_get(&pdev->dev, NULL);
> +
> +	return PTR_ERR_OR_ZERO(isp->rstc);
> +}
> +
> +static const struct of_device_id risp_of_id_table[] = {
> +	{ .compatible = "renesas,r8a779a0-isp" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, risp_of_id_table);
> +
> +static int risp_probe(struct platform_device *pdev)
> +{
> +	struct rcar_isp *isp;
> +	unsigned int i;
> +	int ret;
> +
> +	isp = devm_kzalloc(&pdev->dev, sizeof(*isp), GFP_KERNEL);
> +	if (!isp)
> +		return -ENOMEM;
> +
> +	isp->dev = &pdev->dev;
> +
> +	mutex_init(&isp->lock);
> +
> +	ret = risp_probe_resources(isp, pdev);
> +	if (ret) {
> +		dev_err(isp->dev, "Failed to get resources\n");
> +		return ret;
> +	}
> +
> +	platform_set_drvdata(pdev, isp);
> +
> +	ret = risp_parse_dt(isp);
> +	if (ret)
> +		return ret;
> +
> +	isp->subdev.owner = THIS_MODULE;
> +	isp->subdev.dev = &pdev->dev;
> +	v4l2_subdev_init(&isp->subdev, &rcar_isp_subdev_ops);
> +	v4l2_set_subdevdata(&isp->subdev, &pdev->dev);
> +	snprintf(isp->subdev.name, V4L2_SUBDEV_NAME_SIZE, "%s %s",
> +		 KBUILD_MODNAME, dev_name(&pdev->dev));
> +	isp->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
> +
> +	isp->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
> +	isp->subdev.entity.ops = &risp_entity_ops;
> +
> +	isp->pads[RCAR_ISP_SINK].flags = MEDIA_PAD_FL_SINK;
> +	for (i = RCAR_ISP_PORT0; i < RCAR_ISP_MAX_PAD; i++)
> +		isp->pads[i].flags = MEDIA_PAD_FL_SOURCE;
> +
> +	ret = media_entity_pads_init(&isp->subdev.entity, RCAR_ISP_MAX_PAD,
> +				     isp->pads);
> +	if (ret)
> +		goto error;
> +
> +	pm_runtime_enable(&pdev->dev);
> +
> +	ret = v4l2_async_register_subdev(&isp->subdev);
> +	if (ret < 0)
> +		goto error;
> +
> +	dev_info(isp->dev, "Using CSI-2 input: %u\n", isp->csi_input);
> +
> +	return 0;
> +error:
> +	v4l2_async_notifier_unregister(&isp->notifier);
> +	v4l2_async_notifier_cleanup(&isp->notifier);
> +
> +	return ret;
> +}
> +
> +static int risp_remove(struct platform_device *pdev)
> +{
> +	struct rcar_isp *isp = platform_get_drvdata(pdev);
> +
> +	v4l2_async_notifier_unregister(&isp->notifier);
> +	v4l2_async_notifier_cleanup(&isp->notifier);
> +	v4l2_async_unregister_subdev(&isp->subdev);
> +
> +	pm_runtime_disable(&pdev->dev);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver rcar_isp_driver = {
> +	.driver = {
> +		.name = "rcar-isp",
> +		.of_match_table = risp_of_id_table,
> +	},
> +	.probe = risp_probe,
> +	.remove = risp_remove,
> +};
> +
> +module_platform_driver(rcar_isp_driver);
> +
> +MODULE_AUTHOR("Niklas Söderlund <niklas.soderlund@ragnatech.se>");
> +MODULE_DESCRIPTION("Renesas R-Car ISP Channel Selector driver");
> +MODULE_LICENSE("GPL");
> 

Regards,

	Hans
