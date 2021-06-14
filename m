Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 920B23A6784
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 15:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232967AbhFNNOq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 09:14:46 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:34163 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232818AbhFNNOo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 09:14:44 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id smOKlckVHhqltsmONlnAwE; Mon, 14 Jun 2021 15:12:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623676360; bh=q2dQo0YT7MpKVin37BvjOF2XnvJwcXU2GVew8gCqgsA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Fwfm0dPjZNQiY2Jnhbu0Pmo9iPnLdgQwanitRz0wdEFhaoFsVjO2hVrV+r40KQ/HZ
         bCONALXTnXHlxPoK5hBgqeKSM4gi6vMSOTDrWBElTvUSkFALLRDUWigQ/jgY6QUINX
         D65Cr3urjwvCZGnXdN1XsjUAeIAsirAsXVIZ5k92cyPPPzGMf1kRd/RkvaFwcVXY+1
         KCsCIDlnnSWGkzrwtaToomD5mIV5eK00DlKCbnSIqb4L4eNRxrbdKdhWAzgkh01fEq
         +lOojVao/E3iwAl8eP+S/tCY9SF2jhxRGdNr80CP6itFKUp36+KYNCyNZzCuJNjPHy
         iozMEBWkSgyCQ==
Subject: Re: [PATCH v2] media: rcar-isp: Add Renesas R-Car Image Signal
 Processor driver
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20210512081912.3976565-1-niklas.soderlund+renesas@ragnatech.se>
 <0af0c180-1ee5-0ae3-cc9a-6cfaeab65e8e@xs4all.nl>
 <YMdQnW0IfhVYDItu@oden.dyn.berto.se>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <79ff5f29-9a2f-d767-8bf7-279b0445a859@xs4all.nl>
Date:   Mon, 14 Jun 2021 15:12:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YMdQnW0IfhVYDItu@oden.dyn.berto.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfMA6e4dkaxIuOawclyjgL/ZwCEf2n2VT7UbFiG6c4sBCoXVL1iN70GsdR9B7A0fLl+Ph00rd2rql2Xaf3keHVJGVTNLCLAbDNYT3tJr1rxrLXukP01J1
 VitlhDDB1JstfiK/slFQvltU455UmiN3szgUml86V8606c1S7ZuNooXCGLvcw3LyDakUfydeLuJ0CJjafL32OHE2IdtBkmbff4h37hk8Pc73fX+fdG0R8l7J
 RwUj91k1DqghFTktLdVZkTrZy1uF3ZpTnZGxSMFsLup3FKdK3U1eIR+goM6uvQffYPpr6oqZtIhdKvhhd+EtrVTPTiSfNMCcJoud6NR1kDT+x2bWGeNaLJ//
 TfD6ph7g
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

(Added CC to Tomi)

On 14/06/2021 14:50, Niklas Söderlund wrote:
> Hi Hans,
> 
> Thanks for your feedback.
> 
> On 2021-06-14 14:29:32 +0200, Hans Verkuil wrote:
>> On 12/05/2021 10:19, Niklas Söderlund wrote:
>>> Add a V4L2 driver for Renesas R-Car Image Signal Processor. The driver
>>> supports the R-Car V3U SoC where the ISP IP sits between the R-Car CSI-2
>>> receiver and VIN and filters the CSI-2 data based on VC/DT and directs
>>> the video stream to different VIN IPs.
>>
>> Is ISP the right name for this? Based on the description above, it is not
>> really what I would consider an ISP.
> 
> Yes this models an ISP so the name is correct. But your observation is 
> correct it does not (yet) expose any real ISP functionality. I only have 
> documentation for the features exposed in this patch and unfortunately 
> the ISP is needed on some SoCs to enable video capture. Maybe in the 
> future more features can be added.

This needs to be documented in the driver, since right now this is not at all
clear. Perhaps list some/all of the features that the HW can do, then say
what it currently supports (very little :-) ).

Regards,

	Hans

> 
>>
>>>
>>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>>> ---
>>>  MAINTAINERS                       |   1 +
>>>  drivers/media/platform/Kconfig    |  16 +
>>>  drivers/media/platform/Makefile   |   1 +
>>>  drivers/media/platform/rcar-isp.c | 500 ++++++++++++++++++++++++++++++
>>>  4 files changed, 518 insertions(+)
>>>  create mode 100644 drivers/media/platform/rcar-isp.c
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index c35a9c93da84f4f7..03f3d52e03596f66 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -11400,6 +11400,7 @@ T:	git git://linuxtv.org/media_tree.git
>>>  F:	Documentation/devicetree/bindings/media/renesas,csi2.yaml
>>>  F:	Documentation/devicetree/bindings/media/renesas,isp.yaml
>>>  F:	Documentation/devicetree/bindings/media/renesas,vin.yaml
>>> +F:	drivers/media/platform/rcar-isp.c
>>>  F:	drivers/media/platform/rcar-vin/
>>>  
>>>  MEDIA DRIVERS FOR RENESAS - VSP1
>>> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
>>> index 157c924686e4b61b..a8777d5dd6bc3ec1 100644
>>> --- a/drivers/media/platform/Kconfig
>>> +++ b/drivers/media/platform/Kconfig
>>> @@ -200,6 +200,22 @@ config VIDEO_TI_CAL_MC
>>>  
>>>  endif # VIDEO_TI_CAL
>>>  
>>> +config VIDEO_RCAR_ISP
>>> +	tristate "R-Car Image Signal Processor (ISP)"
>>> +	depends on VIDEO_V4L2 && OF
>>> +	depends on ARCH_RENESAS || COMPILE_TEST
>>> +	select MEDIA_CONTROLLER
>>> +	select VIDEO_V4L2_SUBDEV_API
>>> +	select RESET_CONTROLLER
>>> +	select V4L2_FWNODE
>>> +	help
>>> +	  Support for Renesas R-Car Image Signal Processor (ISP).
>>> +	  Enable this to support the Renesas R-Car Image Signal
>>> +	  Processor (ISP).
>>> +
>>> +	  To compile this driver as a module, choose M here: the
>>> +	  module will be called rcar-isp.
>>> +
>>>  endif # V4L_PLATFORM_DRIVERS
>>>  
>>>  menuconfig V4L_MEM2MEM_DRIVERS
>>> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
>>> index eedc14aafb32c2fa..8ae543f6ef764c48 100644
>>> --- a/drivers/media/platform/Makefile
>>> +++ b/drivers/media/platform/Makefile
>>> @@ -63,6 +63,7 @@ obj-$(CONFIG_VIDEO_AM437X_VPFE)		+= am437x/
>>>  
>>>  obj-$(CONFIG_VIDEO_XILINX)		+= xilinx/
>>>  
>>> +obj-$(CONFIG_VIDEO_RCAR_ISP)		+= rcar-isp.o
>>>  obj-$(CONFIG_VIDEO_RCAR_VIN)		+= rcar-vin/
>>>  
>>>  obj-$(CONFIG_VIDEO_ATMEL_ISC)		+= atmel/
>>> diff --git a/drivers/media/platform/rcar-isp.c b/drivers/media/platform/rcar-isp.c
>>> new file mode 100644
>>> index 0000000000000000..bf6a376354ece89d
>>> --- /dev/null
>>> +++ b/drivers/media/platform/rcar-isp.c
>>> @@ -0,0 +1,500 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Driver for Renesas R-Car ISP Channel Selector
>>> + *
>>> + * Copyright (C) 2021 Renesas Electronics Corp.
>>> + */
>>> +
>>> +#include <linux/module.h>
>>> +#include <linux/mutex.h>
>>> +#include <linux/of_device.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/pm_runtime.h>
>>> +#include <linux/reset.h>
>>> +
>>> +#include <media/v4l2-subdev.h>
>>> +
>>> +#define ISPINPUTSEL0_REG				0x0008
>>> +#define ISPINPUTSEL0_SEL_CSI0				BIT(31)
>>> +
>>> +#define ISPSTART_REG					0x0014
>>> +#define ISPSTART_START					0xffff
>>> +#define ISPSTART_STOP					0x0000
>>> +
>>> +#define ISPPROCMODE_DT_REG(n)				(0x1100 + (0x4 * n))
>>> +#define ISPPROCMODE_DT_PROC_MODE_VC3(pm)		(((pm) & 0x3f) << 24)
>>> +#define ISPPROCMODE_DT_PROC_MODE_VC2(pm)		(((pm) & 0x3f) << 16)
>>> +#define ISPPROCMODE_DT_PROC_MODE_VC1(pm)		(((pm) & 0x3f) << 8)
>>> +#define ISPPROCMODE_DT_PROC_MODE_VC0(pm)		((pm) & 0x3f)
>>> +
>>> +#define ISPCS_FILTER_ID_CH_REG(n)			(0x3000 + (0x0100 * n))
>>> +
>>> +#define ISPCS_DT_CODE03_CH_REG(n)			(0x3008 + (0x100 * n))
>>> +#define ISPCS_DT_CODE03_EN3				BIT(31)
>>> +#define ISPCS_DT_CODE03_DT3(dt)				(((dt) & 0x3f) << 24)
>>> +#define ISPCS_DT_CODE03_EN2				BIT(23)
>>> +#define ISPCS_DT_CODE03_DT2(dt)				(((dt) & 0x3f) << 16)
>>> +#define ISPCS_DT_CODE03_EN1				BIT(15)
>>> +#define ISPCS_DT_CODE03_DT1(dt)				(((dt) & 0x3f) << 8)
>>> +#define ISPCS_DT_CODE03_EN0				BIT(7)
>>> +#define ISPCS_DT_CODE03_DT0(dt)				((dt) & 0x3f)
>>> +
>>> +struct rcar_isp_format {
>>> +	u32 code;
>>> +	unsigned int datatype;
>>> +	unsigned int procmode;
>>> +};
>>> +
>>> +static const struct rcar_isp_format rcar_isp_formats[] = {
>>> +	{ .code = MEDIA_BUS_FMT_RGB888_1X24,	.datatype = 0x24, .procmode = 0x15 },
>>> +	{ .code = MEDIA_BUS_FMT_Y10_1X10,	.datatype = 0x2b, .procmode = 0x10 },
>>> +	{ .code = MEDIA_BUS_FMT_UYVY8_1X16,	.datatype = 0x1e, .procmode = 0x0c },
>>> +	{ .code = MEDIA_BUS_FMT_YUYV8_1X16,	.datatype = 0x1e, .procmode = 0x0c },
>>> +	{ .code = MEDIA_BUS_FMT_UYVY8_2X8,	.datatype = 0x1e, .procmode = 0x0c },
>>> +	{ .code = MEDIA_BUS_FMT_YUYV10_2X10,	.datatype = 0x1e, .procmode = 0x0c },
>>> +};
>>> +
>>> +static const struct rcar_isp_format *risp_code_to_fmt(unsigned int code)
>>> +{
>>> +	unsigned int i;
>>> +
>>> +	for (i = 0; i < ARRAY_SIZE(rcar_isp_formats); i++)
>>> +		if (rcar_isp_formats[i].code == code)
>>> +			return &rcar_isp_formats[i];
>>> +
>>> +	return NULL;
>>> +}
>>> +
>>> +enum rcar_isp_input {
>>> +	RISP_CSI_INPUT0,
>>> +	RISP_CSI_INPUT1,
>>> +};
>>> +
>>> +enum rcar_isp_pads {
>>> +	RCAR_ISP_SINK,
>>> +	RCAR_ISP_PORT0,
>>> +	RCAR_ISP_PORT1,
>>> +	RCAR_ISP_PORT2,
>>> +	RCAR_ISP_PORT3,
>>> +	RCAR_ISP_PORT4,
>>> +	RCAR_ISP_PORT5,
>>> +	RCAR_ISP_PORT6,
>>> +	RCAR_ISP_PORT7,
>>> +	RCAR_ISP_MAX_PAD,
>>> +};
>>> +
>>> +struct rcar_isp {
>>> +	struct device *dev;
>>> +	void __iomem *base;
>>> +	struct reset_control *rstc;
>>> +
>>> +	enum rcar_isp_input csi_input;
>>> +
>>> +	struct v4l2_subdev subdev;
>>> +	struct media_pad pads[RCAR_ISP_MAX_PAD];
>>> +
>>> +	struct v4l2_async_notifier notifier;
>>> +	struct v4l2_subdev *remote;
>>> +	unsigned int remote_pad;
>>> +
>>> +	struct v4l2_mbus_framefmt mf;
>>> +
>>> +	struct mutex lock;
>>> +	int stream_count;
>>> +};
>>> +
>>> +static inline struct rcar_isp *sd_to_isp(struct v4l2_subdev *sd)
>>> +{
>>> +	return container_of(sd, struct rcar_isp, subdev);
>>> +}
>>> +
>>> +static inline struct rcar_isp *notifier_to_isp(struct v4l2_async_notifier *n)
>>> +{
>>> +	return container_of(n, struct rcar_isp, notifier);
>>> +}
>>> +
>>> +static void risp_write(struct rcar_isp *isp, u32 offset, u32 value)
>>> +{
>>> +	iowrite32(value, isp->base + offset);
>>> +}
>>> +
>>> +static u32 risp_read(struct rcar_isp *isp, u32 offset)
>>> +{
>>> +	return ioread32(isp->base + offset);
>>> +}
>>> +
>>> +static int risp_s_power(struct v4l2_subdev *sd, int on)
>>> +{
>>> +	struct rcar_isp *isp = sd_to_isp(sd);
>>> +	int ret;
>>> +
>>> +	if (on) {
>>> +		ret = pm_runtime_get_sync(isp->dev);
>>> +		if (ret < 0)
>>> +			return ret;
>>> +
>>> +		ret = reset_control_deassert(isp->rstc);
>>> +		if (ret < 0)
>>> +			return ret;
>>> +	} else {
>>> +		reset_control_assert(isp->rstc);
>>> +		pm_runtime_put(isp->dev);
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct v4l2_subdev_core_ops risp_core_ops = {
>>> +	.s_power = risp_s_power,
>>> +};
>>> +
>>> +static int risp_remote_code(struct rcar_isp *isp)
>>> +{
>>> +	struct v4l2_subdev_format fmt = {
>>> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
>>> +	};
>>> +
>>> +	fmt.pad = isp->remote_pad;
>>> +	if (v4l2_subdev_call(isp->remote, pad, get_fmt, NULL, &fmt))
>>> +		return -EPIPE;
>>> +
>>> +	return fmt.format.code;
>>> +}
>>> +
>>> +static int risp_start(struct rcar_isp *isp)
>>> +{
>>> +	const struct rcar_isp_format *format;
>>> +	unsigned int vc;
>>> +	u32 sel_csi = 0;
>>> +
>>> +	format = risp_code_to_fmt(risp_remote_code(isp));
>>> +	if (!format) {
>>> +		dev_err(isp->dev, "Unsupported bus format\n");
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	/* Select CSI-2 input source. */
>>> +	if (isp->csi_input == RISP_CSI_INPUT1)
>>> +		sel_csi = ISPINPUTSEL0_SEL_CSI0;
>>> +
>>> +	risp_write(isp, ISPINPUTSEL0_REG,
>>> +		   risp_read(isp, ISPINPUTSEL0_REG) | sel_csi);
>>> +
>>> +	/* Configure Channel Selector. */
>>> +	for (vc = 0; vc < 4; vc++) {
>>> +		u8 ch = vc + 4;
>>> +		u8 dt = format->datatype;
>>> +
>>> +		risp_write(isp, ISPCS_FILTER_ID_CH_REG(ch), BIT(vc));
>>> +		risp_write(isp, ISPCS_DT_CODE03_CH_REG(ch),
>>> +			   ISPCS_DT_CODE03_EN3 | ISPCS_DT_CODE03_DT3(dt) |
>>> +			   ISPCS_DT_CODE03_EN2 | ISPCS_DT_CODE03_DT2(dt) |
>>> +			   ISPCS_DT_CODE03_EN1 | ISPCS_DT_CODE03_DT1(dt) |
>>> +			   ISPCS_DT_CODE03_EN0 | ISPCS_DT_CODE03_DT0(dt));
>>> +	}
>>> +
>>> +	/* Setup processing method. */
>>> +	risp_write(isp, ISPPROCMODE_DT_REG(format->datatype),
>>> +		   ISPPROCMODE_DT_PROC_MODE_VC3(format->procmode) |
>>> +		   ISPPROCMODE_DT_PROC_MODE_VC2(format->procmode) |
>>> +		   ISPPROCMODE_DT_PROC_MODE_VC1(format->procmode) |
>>> +		   ISPPROCMODE_DT_PROC_MODE_VC0(format->procmode));
>>> +
>>> +	/* Start ISP. */
>>> +	risp_write(isp, ISPSTART_REG, ISPSTART_START);
>>> +
>>> +	return v4l2_subdev_call(isp->remote, video, s_stream, 1);
>>> +}
>>> +
>>> +static void risp_stop(struct rcar_isp *isp)
>>> +{
>>> +	v4l2_subdev_call(isp->remote, video, s_stream, 0);
>>> +
>>> +	/* Stop ISP. */
>>> +	risp_write(isp, ISPSTART_REG, ISPSTART_STOP);
>>> +}
>>> +
>>> +static int risp_s_stream(struct v4l2_subdev *sd, int enable)
>>> +{
>>> +	struct rcar_isp *isp = sd_to_isp(sd);
>>> +	int ret = 0;
>>> +
>>> +	mutex_lock(&isp->lock);
>>> +
>>> +	if (!isp->remote) {
>>> +		ret = -ENODEV;
>>> +		goto out;
>>> +	}
>>> +
>>> +	if (enable && isp->stream_count == 0) {
>>> +		ret = risp_start(isp);
>>> +		if (ret)
>>> +			goto out;
>>> +	} else if (!enable && isp->stream_count == 1) {
>>> +		risp_stop(isp);
>>> +	}
>>> +
>>> +	isp->stream_count += enable ? 1 : -1;
>>> +out:
>>> +	mutex_unlock(&isp->lock);https://qa-deploy.rd.cisco.com/gates/7/results/86270
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static const struct v4l2_subdev_video_ops risp_video_ops = {
>>> +	.s_stream = risp_s_stream,
>>> +};
>>> +
>>> +static int risp_set_pad_format(struct v4l2_subdev *sd,
>>> +			       struct v4l2_subdev_pad_config *cfg,
>>> +			       struct v4l2_subdev_format *format)
>>
>> This prototype will change very soon (I hope) as soon as
>>
>> https://patchwork.linuxtv.org/project/linux-media/cover/20210610145606.3468235-1-tomi.valkeinen@ideasonboard.com/
>>
>> is merged (PR is outstanding).
>>
>> Once that is merged, this patch will have to be rebased and a v3 posted.
> 
> Thanks for the heads-up, I will rebase and resend once it's merged.
> 
>>
>>> +{
>>> +	struct rcar_isp *isp = sd_to_isp(sd);
>>> +	struct v4l2_mbus_framefmt *framefmt;
>>> +
>>> +	if (!risp_code_to_fmt(format->format.code))
>>> +		format->format.code = rcar_isp_formats[0].code;
>>> +
>>> +	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>>> +		isp->mf = format->format;
>>> +	} else {
>>> +		framefmt = v4l2_subdev_get_try_format(sd, cfg, 0);
>>> +		*framefmt = format->format;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int risp_get_pad_format(struct v4l2_subdev *sd,
>>> +			       struct v4l2_subdev_pad_config *cfg,
>>> +			       struct v4l2_subdev_format *format)
>>> +{
>>> +	struct rcar_isp *isp = sd_to_isp(sd);
>>> +
>>> +	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
>>> +		format->format = isp->mf;
>>> +	else
>>> +		format->format = *v4l2_subdev_get_try_format(sd, cfg, 0);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct v4l2_subdev_pad_ops risp_pad_ops = {
>>> +	.set_fmt = risp_set_pad_format,
>>> +	.get_fmt = risp_get_pad_format,
>>> +};
>>> +
>>> +static const struct v4l2_subdev_ops rcar_isp_subdev_ops = {
>>> +	.core	= &risp_core_ops,
>>> +	.video	= &risp_video_ops,
>>> +	.pad	= &risp_pad_ops,
>>> +};
>>> +
>>> +/* -----------------------------------------------------------------------------
>>> + * Async handling and registration of subdevices and links
>>> + */
>>> +
>>> +static int risp_notify_bound(struct v4l2_async_notifier *notifier,
>>> +			     struct v4l2_subdev *subdev,
>>> +			     struct v4l2_async_subdev *asd)
>>> +{
>>> +	struct rcar_isp *isp = notifier_to_isp(notifier);
>>> +	int pad;
>>> +
>>> +	pad = media_entity_get_fwnode_pad(&subdev->entity, asd->match.fwnode,
>>> +					  MEDIA_PAD_FL_SOURCE);
>>> +	if (pad < 0) {
>>> +		dev_err(isp->dev, "Failed to find pad for %s\n", subdev->name);
>>> +		return pad;
>>> +	}
>>> +
>>> +	isp->remote = subdev;
>>> +	isp->remote_pad = pad;
>>> +
>>> +	dev_dbg(isp->dev, "Bound %s pad: %d\n", subdev->name, pad);
>>> +
>>> +	return media_create_pad_link(&subdev->entity, pad,
>>> +				     &isp->subdev.entity, 0,
>>> +				     MEDIA_LNK_FL_ENABLED |
>>> +				     MEDIA_LNK_FL_IMMUTABLE);
>>> +}
>>> +
>>> +static void risp_notify_unbind(struct v4l2_async_notifier *notifier,
>>> +			       struct v4l2_subdev *subdev,
>>> +			       struct v4l2_async_subdev *asd)
>>> +{
>>> +	struct rcar_isp *isp = notifier_to_isp(notifier);
>>> +
>>> +	isp->remote = NULL;
>>> +
>>> +	dev_dbg(isp->dev, "Unbind %s\n", subdev->name);
>>> +}
>>> +
>>> +static const struct v4l2_async_notifier_operations risp_notify_ops = {
>>> +	.bound = risp_notify_bound,
>>> +	.unbind = risp_notify_unbind,
>>> +};
>>> +
>>> +static int risp_parse_dt(struct rcar_isp *isp)
>>> +{
>>> +	struct v4l2_async_subdev *asd;
>>> +	struct fwnode_handle *fwnode;
>>> +	struct fwnode_handle *ep;
>>> +	unsigned int id;
>>> +	int ret;
>>> +
>>> +	for (id = 0; id < 2; id++) {
>>> +		ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(isp->dev),
>>> +						     0, id, 0);
>>> +		if (ep)
>>> +			break;
>>> +	}
>>> +
>>> +	if (!ep) {
>>> +		dev_err(isp->dev, "Not connected to subdevice\n");
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	if (id == 1)
>>> +		isp->csi_input = RISP_CSI_INPUT1;
>>> +
>>> +	fwnode = fwnode_graph_get_remote_endpoint(ep);
>>> +	fwnode_handle_put(ep);
>>> +
>>> +	dev_dbg(isp->dev, "Found '%pOF'\n", to_of_node(fwnode));
>>> +
>>> +	v4l2_async_notifier_init(&isp->notifier);
>>> +	isp->notifier.ops = &risp_notify_ops;
>>> +
>>> +	asd = v4l2_async_notifier_add_fwnode_subdev(&isp->notifier, fwnode,
>>> +						    struct v4l2_async_subdev);
>>> +	fwnode_handle_put(fwnode);
>>> +	if (IS_ERR(asd))
>>> +		return PTR_ERR(asd);
>>> +
>>> +	ret = v4l2_async_subdev_notifier_register(&isp->subdev, &isp->notifier);
>>> +	if (ret)
>>> +		v4l2_async_notifier_cleanup(&isp->notifier);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +/* -----------------------------------------------------------------------------
>>> + * Platform Device Driver
>>> + */
>>> +
>>> +static const struct media_entity_operations risp_entity_ops = {
>>> +	.link_validate = v4l2_subdev_link_validate,
>>> +};
>>> +
>>> +static int risp_probe_resources(struct rcar_isp *isp,
>>> +				struct platform_device *pdev)
>>> +{
>>> +	struct resource *res;
>>> +
>>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> +	isp->base = devm_ioremap_resource(&pdev->dev, res);
>>> +	if (IS_ERR(isp->base))
>>> +		return PTR_ERR(isp->base);
>>> +
>>> +	isp->rstc = devm_reset_control_get(&pdev->dev, NULL);
>>> +
>>> +	return PTR_ERR_OR_ZERO(isp->rstc);
>>> +}
>>> +
>>> +static const struct of_device_id risp_of_id_table[] = {
>>> +	{ .compatible = "renesas,r8a779a0-isp" },
>>> +	{ /* sentinel */ },
>>> +};
>>> +MODULE_DEVICE_TABLE(of, risp_of_id_table);
>>> +
>>> +static int risp_probe(struct platform_device *pdev)
>>> +{
>>> +	struct rcar_isp *isp;
>>> +	unsigned int i;
>>> +	int ret;
>>> +
>>> +	isp = devm_kzalloc(&pdev->dev, sizeof(*isp), GFP_KERNEL);
>>> +	if (!isp)
>>> +		return -ENOMEM;
>>> +
>>> +	isp->dev = &pdev->dev;
>>> +
>>> +	mutex_init(&isp->lock);
>>> +	isp->stream_count = 0;
>>> +
>>> +	ret = risp_probe_resources(isp, pdev);
>>> +	if (ret) {
>>> +		dev_err(isp->dev, "Failed to get resources\n");
>>> +		return ret;
>>> +	}
>>> +
>>> +	platform_set_drvdata(pdev, isp);
>>> +
>>> +	ret = risp_parse_dt(isp);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	isp->subdev.owner = THIS_MODULE;
>>> +	isp->subdev.dev = &pdev->dev;
>>> +	v4l2_subdev_init(&isp->subdev, &rcar_isp_subdev_ops);
>>> +	v4l2_set_subdevdata(&isp->subdev, &pdev->dev);
>>> +	snprintf(isp->subdev.name, V4L2_SUBDEV_NAME_SIZE, "%s %s",
>>> +		 KBUILD_MODNAME, dev_name(&pdev->dev));
>>> +	isp->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
>>> +
>>> +	isp->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
>>
>> Similar question to the one at the top: is this really a pixel formatter?
>>
>> It really feels more like a routing device.
> 
> It can be a pixel formatter.
> 
>>
>> I wonder if this series isn't relevant for this driver:
>>
>> https://patchwork.linuxtv.org/project/linux-media/cover/20210524104408.599645-1-tomi.valkeinen@ideasonboard.com/
> 
> Maybe, all the internal routes are static so there is no need to expose 
> an API to modify the routing. But as any device that deals with 
> multiplexed links it will benefit once Tomi's work is in in as the 
> formats between all the devices in the media graph can be validated.
> 
> Given that the internal routing series have been on the list for years I 
> rather not wait for it and I would prefers to as I add support for the 
> new API once it's done. I will need to add support for the R-Car CSI-2 
> receiver as well for this new API once its merged.
> 
>>
>> Regards,
>>
>> 	Hans
>>
>>> +	isp->subdev.entity.ops = &risp_entity_ops;
>>> +
>>> +	isp->pads[RCAR_ISP_SINK].flags = MEDIA_PAD_FL_SINK;
>>> +	for (i = RCAR_ISP_PORT0; i < RCAR_ISP_MAX_PAD; i++)
>>> +		isp->pads[i].flags = MEDIA_PAD_FL_SOURCE;
>>> +
>>> +	ret = media_entity_pads_init(&isp->subdev.entity, RCAR_ISP_MAX_PAD,
>>> +				     isp->pads);
>>> +	if (ret)
>>> +		goto error;
>>> +
>>> +	pm_runtime_enable(&pdev->dev);
>>> +
>>> +	ret = v4l2_async_register_subdev(&isp->subdev);
>>> +	if (ret < 0)
>>> +		goto error;
>>> +
>>> +	dev_info(isp->dev, "Using CSI-2 input: %u\n", isp->csi_input);
>>> +
>>> +	return 0;
>>> +error:
>>> +	v4l2_async_notifier_unregister(&isp->notifier);
>>> +	v4l2_async_notifier_cleanup(&isp->notifier);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static int risp_remove(struct platform_device *pdev)
>>> +{
>>> +	struct rcar_isp *isp = platform_get_drvdata(pdev);
>>> +
>>> +	v4l2_async_notifier_unregister(&isp->notifier);
>>> +	v4l2_async_notifier_cleanup(&isp->notifier);
>>> +	v4l2_async_unregister_subdev(&isp->subdev);
>>> +
>>> +	pm_runtime_disable(&pdev->dev);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static struct platform_driver rcar_isp_driver = {
>>> +	.driver = {
>>> +		.name = "rcar-isp",
>>> +		.of_match_table = risp_of_id_table,
>>> +	},
>>> +	.probe = risp_probe,
>>> +	.remove = risp_remove,
>>> +};
>>> +
>>> +module_platform_driver(rcar_isp_driver);
>>> +
>>> +MODULE_AUTHOR("Niklas Söderlund <niklas.soderlund@ragnatech.se>");
>>> +MODULE_DESCRIPTION("Renesas R-Car ISP Channel Selector driver");
>>> +MODULE_LICENSE("GPL");
>>>
>>
> 

