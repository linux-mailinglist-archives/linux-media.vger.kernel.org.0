Return-Path: <linux-media+bounces-27499-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E14A4E543
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 17:15:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F149885B11
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 15:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66514209F42;
	Tue,  4 Mar 2025 15:32:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DD824C09B
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 15:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741102373; cv=none; b=PGldWD7jNaqFn6mTSly7e2wpxeo9Y/jkIKokA3MkxX7kg6jGOAUq0fvA03VP9vkCa6brn0rETVcrWlrjoLwmaWb9Rhf62DLFIxEBjdY3JD+nK8VwKbd6boY2KoGRmqB+R/ZF1OUgeAfc2ZfYCbg8no6kL8dpOY+usGmB+4lrvLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741102373; c=relaxed/simple;
	bh=VBSLhUOVyT8D0jjcpsY1bdTYviA6sOOXOdEQHcQ6Qp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ro2SXibYkD+YJfRdpphbR4B/zH5pVQ3OIQhxxV1VeuCbdP6MvCBbpxIQthLIiPu9QsOLoGI+kaBHbRaXO7htRb/cDcX4tOckoie5T3LuYgnMFnzfepGtVG4vz2ouqwxhZ0mArj9HCJ2+dLkmzxd2LFOHNXZI62xb21ePYwxxaK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69309C4CEE5;
	Tue,  4 Mar 2025 15:32:50 +0000 (UTC)
Message-ID: <7d27f3e3-8fd8-4ca3-821a-60c5401ab465@xs4all.nl>
Date: Tue, 4 Mar 2025 16:32:48 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] media: i2c: add lt6911uxe hdmi bridge driver
To: Dongcheng Yan <dongcheng.yan@intel.com>, linux-media@vger.kernel.org,
 sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
 ricardo.ribalda@gmail.com, bingbu.cao@linux.intel.com
Cc: tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
 daxing.li@intel.com, dongcheng.yan@linux.intel.com, ong.hock.yu@intel.com,
 balamurugan.c@intel.com, wei.a.fu@intel.com, xiaohong.zou@intel.com
References: <20250227061641.499763-1-dongcheng.yan@intel.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20250227061641.499763-1-dongcheng.yan@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Dongcheng,


Please fix the kernel test robot report, and also...

On 27/02/2025 07:16, Dongcheng Yan wrote:
> Lontium LT9611UXE is a HDMI to MIPI CSI-2 bridge,
> It supports modes up to 4k60fps, switches current mode when
> plugging HDMI or changing the source active signal mode.
> 
> Signed-off-by: Dongcheng Yan <dongcheng.yan@intel.com>
> ---
> v1 -> v2: replaced mutex with state_lock
> v2 -> v3: fixed some pm_runtime err handlings
> v3 -> v4: add dv_timings api
> v4 -> v5: use get_mbus_config to replace link_freq v4l2_ctrl_handler,
>           rm lt6911uxe_enum_frame_size & lt6911uxe_enum_frame_interval
> v5 -> v6: update format in irq_handle func,
>           fix the state_unlock missing bug
> 
> this patch has been tested with Intel IPU isp, and refers to
> drivers/media/pci/intel/ipu6.
> 
> ---
>  drivers/media/i2c/Kconfig     |  12 +
>  drivers/media/i2c/Makefile    |   1 +
>  drivers/media/i2c/lt6911uxe.c | 707 ++++++++++++++++++++++++++++++++++
>  3 files changed, 720 insertions(+)
>  create mode 100644 drivers/media/i2c/lt6911uxe.c
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 8ba096b8ebca..fbe3d0fe4ce6 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -1526,6 +1526,18 @@ config VIDEO_I2C
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called video-i2c
>  
> +config VIDEO_LT6911UXE

...this config is in the wrong place, it should be under the heading
"Video decoders", after the VIDEO_ISL7998X config (to keep it alphabetically
ordered).

Regards,

	Hans

> +        tristate "Lontium LT6911UXE decoder"
> +        depends on ACPI && VIDEO_DEV
> +        select V4L2_FWNODE
> +        select V4L2_CCI_I2C
> +        help
> +          This is a Video4Linux2 sensor-level driver for the Lontium
> +          LT6911UXE HDMI to MIPI CSI-2 bridge.
> +
> +          To compile this driver as a module, choose M here: the
> +          module will be called lt6911uxe.
> +
>  config VIDEO_M52790
>  	tristate "Mitsubishi M52790 A/V switch"
>  	depends on VIDEO_DEV && I2C
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index fbb988bd067a..6c23a4463527 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -64,6 +64,7 @@ obj-$(CONFIG_VIDEO_ISL7998X) += isl7998x.o
>  obj-$(CONFIG_VIDEO_KS0127) += ks0127.o
>  obj-$(CONFIG_VIDEO_LM3560) += lm3560.o
>  obj-$(CONFIG_VIDEO_LM3646) += lm3646.o
> +obj-$(CONFIG_VIDEO_LT6911UXE) += lt6911uxe.o
>  obj-$(CONFIG_VIDEO_M52790) += m52790.o
>  obj-$(CONFIG_VIDEO_MAX9271_LIB) += max9271.o
>  obj-$(CONFIG_VIDEO_MAX9286) += max9286.o
> diff --git a/drivers/media/i2c/lt6911uxe.c b/drivers/media/i2c/lt6911uxe.c
> new file mode 100644
> index 000000000000..6b9d07d2b365
> --- /dev/null
> +++ b/drivers/media/i2c/lt6911uxe.c
> @@ -0,0 +1,707 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2023 - 2025 Intel Corporation.
> +
> +#include <linux/acpi.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/v4l2-dv-timings.h>
> +
> +#include <media/v4l2-cci.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-dv-timings.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fwnode.h>
> +
> +#define LT6911UXE_CHIP_ID		0x2102
> +#define REG_CHIP_ID			CCI_REG16(0xe100)
> +
> +#define REG_ENABLE_I2C			CCI_REG8(0xe0ee)
> +#define REG_HALF_PIX_CLK		CCI_REG24(0xe085)
> +#define REG_BYTE_CLK			CCI_REG24(0xe092)
> +#define REG_HALF_H_TOTAL		CCI_REG16(0xe088)
> +#define REG_V_TOTAL			CCI_REG16(0xe08a)
> +#define REG_HALF_H_ACTIVE		CCI_REG16(0xe08c)
> +#define REG_V_ACTIVE			CCI_REG16(0xe08e)
> +#define REG_MIPI_FORMAT			CCI_REG8(0xe096)
> +#define REG_MIPI_TX_CTRL		CCI_REG8(0xe0b0)
> +
> +/* Interrupts */
> +#define REG_INT_HDMI			CCI_REG8(0xe084)
> +#define INT_VIDEO_DISAPPEAR		0x0
> +#define INT_VIDEO_READY			0x1
> +
> +#define LT6911UXE_DEFAULT_LANES		4
> +#define LT6911_PAGE_CONTROL		0xff
> +#define YUV422_8_BIT			0x7
> +
> +static const struct v4l2_dv_timings_cap lt6911uxe_timings_cap_4kp30 = {
> +	.type = V4L2_DV_BT_656_1120,
> +	/* Pixel clock from REF_01 p. 20. Min/max height/width are unknown */
> +	V4L2_INIT_BT_TIMINGS(160, 3840,			/* min/max width */
> +			     120, 2160,			/* min/max height */
> +			     50000000, 594000000,	/* min/max pixelclock */
> +			     V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_DMT |
> +			     V4L2_DV_BT_STD_CVT,
> +			     V4L2_DV_BT_CAP_PROGRESSIVE |
> +			     V4L2_DV_BT_CAP_CUSTOM |
> +			     V4L2_DV_BT_CAP_REDUCED_BLANKING)
> +};
> +
> +static const struct regmap_range_cfg lt6911uxe_ranges[] = {
> +	{
> +		.name = "register_range",
> +		.range_min =  0,
> +		.range_max = 0xffff,
> +		.selector_reg = LT6911_PAGE_CONTROL,
> +		.selector_mask = 0xff,
> +		.selector_shift = 0,
> +		.window_start = 0,
> +		.window_len = 0x100,
> +	},
> +};
> +
> +static const struct regmap_config lt6911uxe_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = 0xffff,
> +	.ranges = lt6911uxe_ranges,
> +	.num_ranges = ARRAY_SIZE(lt6911uxe_ranges),
> +};
> +
> +struct lt6911uxe_mode {
> +	u32 width;
> +	u32 height;
> +	u32 htotal;
> +	u32 vtotal;
> +	u32 code;
> +	u32 fps;
> +	u32 lanes;
> +	s64 link_freq;
> +	u64 pixel_clk;
> +};
> +
> +struct lt6911uxe {
> +	struct v4l2_subdev sd;
> +	struct media_pad pad;
> +	struct v4l2_ctrl_handler ctrl_handler;
> +	struct v4l2_ctrl *pixel_rate;
> +	struct v4l2_dv_timings timings;
> +	struct lt6911uxe_mode cur_mode;
> +	struct regmap *regmap;
> +	struct gpio_desc *reset_gpio;
> +	struct gpio_desc *irq_gpio;
> +};
> +
> +static const struct v4l2_event lt6911uxe_ev_source_change = {
> +	.type = V4L2_EVENT_SOURCE_CHANGE,
> +	.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION,
> +};
> +
> +static inline struct lt6911uxe *to_lt6911uxe(struct v4l2_subdev *sd)
> +{
> +	return container_of(sd, struct lt6911uxe, sd);
> +}
> +
> +static s64 get_pixel_rate(struct lt6911uxe *lt6911uxe)
> +{
> +	s64 pixel_rate;
> +
> +	pixel_rate = (s64)lt6911uxe->cur_mode.width *
> +		     lt6911uxe->cur_mode.height *
> +		     lt6911uxe->cur_mode.fps * 16;
> +	do_div(pixel_rate, lt6911uxe->cur_mode.lanes);
> +
> +	return pixel_rate;
> +}
> +
> +static int lt6911uxe_get_detected_timings(struct v4l2_subdev *sd,
> +					  struct v4l2_dv_timings *timings)
> +{
> +	struct lt6911uxe *lt6911uxe = to_lt6911uxe(sd);
> +	struct v4l2_bt_timings *bt = &timings->bt;
> +
> +	memset(timings, 0, sizeof(struct v4l2_dv_timings));
> +
> +	timings->type = V4L2_DV_BT_656_1120;
> +
> +	bt->width = lt6911uxe->cur_mode.width;
> +	bt->height = lt6911uxe->cur_mode.height;
> +	bt->vsync = lt6911uxe->cur_mode.vtotal - lt6911uxe->cur_mode.height;
> +	bt->hsync = lt6911uxe->cur_mode.htotal - lt6911uxe->cur_mode.width;
> +	bt->pixelclock = lt6911uxe->cur_mode.pixel_clk;
> +
> +	return 0;
> +}
> +
> +static int lt6911uxe_s_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
> +				  struct v4l2_dv_timings *timings)
> +{
> +	struct lt6911uxe *lt6911uxe = to_lt6911uxe(sd);
> +	struct v4l2_subdev_state *state;
> +
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> +	if (v4l2_match_dv_timings(&lt6911uxe->timings, timings, 0, false)) {
> +		v4l2_subdev_unlock_state(state);
> +		return 0;
> +	}
> +
> +	if (!v4l2_valid_dv_timings(timings, &lt6911uxe_timings_cap_4kp30,
> +				   NULL, NULL)) {
> +		v4l2_subdev_unlock_state(state);
> +		return -ERANGE;
> +	}
> +	lt6911uxe->timings = *timings;
> +	v4l2_subdev_unlock_state(state);
> +
> +	return 0;
> +}
> +
> +static int lt6911uxe_g_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
> +				  struct v4l2_dv_timings *timings)
> +{
> +	struct lt6911uxe *lt6911uxe = to_lt6911uxe(sd);
> +	struct v4l2_subdev_state *state;
> +
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> +
> +	*timings = lt6911uxe->timings;
> +	v4l2_subdev_unlock_state(state);
> +
> +	return 0;
> +}
> +
> +static int lt6911uxe_query_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
> +				      struct v4l2_dv_timings *timings)
> +{
> +	struct v4l2_subdev_state *state;
> +	int ret;
> +
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> +	ret = lt6911uxe_get_detected_timings(sd, timings);
> +	if (ret) {
> +		v4l2_subdev_unlock_state(state);
> +		return ret;
> +	}
> +
> +	if (!v4l2_valid_dv_timings(timings, &lt6911uxe_timings_cap_4kp30,
> +				   NULL, NULL)) {
> +		v4l2_subdev_unlock_state(state);
> +		return -ERANGE;
> +	}
> +
> +	v4l2_subdev_unlock_state(state);
> +	return 0;
> +}
> +
> +static int lt6911uxe_enum_dv_timings(struct v4l2_subdev *sd,
> +				     struct v4l2_enum_dv_timings *timings)
> +{
> +	return v4l2_enum_dv_timings_cap(timings,
> +			&lt6911uxe_timings_cap_4kp30, NULL, NULL);
> +}
> +
> +static int lt6911uxe_dv_timings_cap(struct v4l2_subdev *sd,
> +				    struct v4l2_dv_timings_cap *cap)
> +{
> +	*cap = lt6911uxe_timings_cap_4kp30;
> +	return 0;
> +}
> +
> +static int lt6911uxe_status_update(struct lt6911uxe *lt6911uxe)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&lt6911uxe->sd);
> +	u64 int_event;
> +	u64 byte_clk, half_pix_clk, fps, format;
> +	u64 half_htotal, vtotal, half_width, height;
> +	int ret = 0;
> +
> +	/* Read interrupt event */
> +	cci_read(lt6911uxe->regmap, REG_INT_HDMI, &int_event, &ret);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to read interrupt event: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	switch (int_event) {
> +	case INT_VIDEO_READY:
> +		cci_read(lt6911uxe->regmap, REG_BYTE_CLK, &byte_clk, &ret);
> +		byte_clk *= 1000;
> +		cci_read(lt6911uxe->regmap, REG_HALF_PIX_CLK,
> +			 &half_pix_clk, &ret);
> +		half_pix_clk *= 1000;
> +
> +		if (ret || byte_clk == 0 || half_pix_clk == 0) {
> +			dev_dbg(&client->dev,
> +				"invalid ByteClock or PixelClock\n");
> +			return -EINVAL;
> +		}
> +
> +		cci_read(lt6911uxe->regmap, REG_HALF_H_TOTAL,
> +			 &half_htotal, &ret);
> +		cci_read(lt6911uxe->regmap, REG_V_TOTAL, &vtotal, &ret);
> +		if (ret || half_htotal == 0 || vtotal == 0) {
> +			dev_dbg(&client->dev, "invalid htotal or vtotal\n");
> +			return -EINVAL;
> +		}
> +
> +		fps = div_u64(half_pix_clk, half_htotal * vtotal);
> +		if (fps > 60) {
> +			dev_dbg(&client->dev,
> +				"max fps is 60, current fps: %llu\n", fps);
> +			return -EINVAL;
> +		}
> +
> +		cci_read(lt6911uxe->regmap, REG_HALF_H_ACTIVE,
> +			 &half_width, &ret);
> +		cci_read(lt6911uxe->regmap, REG_V_ACTIVE, &height, &ret);
> +		if (ret || half_width == 0 || half_width * 2 > 3840 ||
> +		    height == 0 || height > 2160) {
> +			dev_dbg(&client->dev, "invalid width or height\n");
> +			return -EINVAL;
> +		}
> +
> +		/*
> +		 * Get MIPI format, YUV422_8_BIT is expected in lt6911uxe
> +		 */
> +		cci_read(lt6911uxe->regmap, REG_MIPI_FORMAT, &format, &ret);
> +		if (format != YUV422_8_BIT) {
> +			dev_dbg(&client->dev, "invalid MIPI format\n");
> +			return -EINVAL;
> +		}
> +
> +		lt6911uxe->cur_mode.height = height;
> +		lt6911uxe->cur_mode.width = half_width * 2;
> +		lt6911uxe->cur_mode.fps = fps;
> +		/* MIPI Clock Rate = ByteClock × 4, defined in lt6911uxe spec */
> +		lt6911uxe->cur_mode.link_freq = byte_clk * 4;
> +		lt6911uxe->cur_mode.pixel_clk = half_pix_clk * 2;
> +		lt6911uxe->cur_mode.vtotal = vtotal;
> +		lt6911uxe->cur_mode.htotal = half_htotal * 2;
> +		break;
> +
> +	case INT_VIDEO_DISAPPEAR:
> +		cci_write(lt6911uxe->regmap, REG_MIPI_TX_CTRL, 0x0, &ret);
> +		lt6911uxe->cur_mode.height = 0;
> +		lt6911uxe->cur_mode.width = 0;
> +		lt6911uxe->cur_mode.fps = 0;
> +		lt6911uxe->cur_mode.link_freq = 0;
> +		break;
> +
> +	default:
> +		ret = -ENOLINK;
> +	}
> +	v4l2_subdev_notify_event(&lt6911uxe->sd, &lt6911uxe_ev_source_change);
> +	return ret;
> +}
> +
> +static int lt6911uxe_init_controls(struct lt6911uxe *lt6911uxe)
> +{
> +	struct v4l2_ctrl_handler *ctrl_hdlr;
> +	s64 pixel_rate;
> +	int ret;
> +
> +	ctrl_hdlr = &lt6911uxe->ctrl_handler;
> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
> +	if (ret)
> +		return ret;
> +
> +	pixel_rate = get_pixel_rate(lt6911uxe);
> +	lt6911uxe->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, NULL,
> +						  V4L2_CID_PIXEL_RATE,
> +						  pixel_rate, pixel_rate, 1,
> +						  pixel_rate);
> +
> +	if (ctrl_hdlr->error) {
> +		ret = ctrl_hdlr->error;
> +		goto hdlr_free;
> +	}
> +	lt6911uxe->sd.ctrl_handler = ctrl_hdlr;
> +
> +	return 0;
> +
> +hdlr_free:
> +	v4l2_ctrl_handler_free(ctrl_hdlr);
> +	return ret;
> +}
> +
> +static void lt6911uxe_update_pad_format(const struct lt6911uxe_mode *mode,
> +					struct v4l2_mbus_framefmt *fmt)
> +{
> +	fmt->width = mode->width;
> +	fmt->height = mode->height;
> +	fmt->code = mode->code;
> +	fmt->field = V4L2_FIELD_NONE;
> +}
> +
> +static int lt6911uxe_enable_streams(struct v4l2_subdev *sd,
> +				    struct v4l2_subdev_state *state,
> +				    u32 pad, u64 streams_mask)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> +	struct lt6911uxe *lt6911uxe = to_lt6911uxe(sd);
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(&client->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	cci_write(lt6911uxe->regmap, REG_MIPI_TX_CTRL, 0x1, &ret);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to start stream: %d\n", ret);
> +		goto err_rpm_put;
> +	}
> +
> +	return 0;
> +
> +err_rpm_put:
> +	pm_runtime_put(&client->dev);
> +	return ret;
> +}
> +
> +static int lt6911uxe_disable_streams(struct v4l2_subdev *sd,
> +				     struct v4l2_subdev_state *state,
> +				     u32 pad, u64 streams_mask)
> +{
> +	struct lt6911uxe *lt6911uxe = to_lt6911uxe(sd);
> +	struct i2c_client *client = v4l2_get_subdevdata(&lt6911uxe->sd);
> +	int ret;
> +
> +	ret = cci_write(lt6911uxe->regmap, REG_MIPI_TX_CTRL, 0x0, NULL);
> +	if (ret)
> +		dev_err(&client->dev, "failed to stop stream: %d\n", ret);
> +
> +	pm_runtime_put(&client->dev);
> +	return 0;
> +}
> +
> +static int lt6911uxe_set_format(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_state *sd_state,
> +				struct v4l2_subdev_format *fmt)
> +{
> +	struct lt6911uxe *lt6911uxe = to_lt6911uxe(sd);
> +	u64 pixel_rate;
> +
> +	lt6911uxe_update_pad_format(&lt6911uxe->cur_mode, &fmt->format);
> +	*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> +		return 0;
> +
> +	pixel_rate = get_pixel_rate(lt6911uxe);
> +	__v4l2_ctrl_modify_range(lt6911uxe->pixel_rate, pixel_rate,
> +				 pixel_rate, 1, pixel_rate);
> +
> +	return 0;
> +}
> +
> +static int lt6911uxe_enum_mbus_code(struct v4l2_subdev *sd,
> +				    struct v4l2_subdev_state *sd_state,
> +				    struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	struct lt6911uxe *lt6911uxe = to_lt6911uxe(sd);
> +
> +	if (code->index)
> +		return -EINVAL;
> +
> +	code->code = lt6911uxe->cur_mode.code;
> +
> +	return 0;
> +}
> +
> +static int lt6911uxe_get_mbus_config(struct v4l2_subdev *sd,
> +				     unsigned int pad,
> +				     struct v4l2_mbus_config *cfg)
> +{
> +	struct lt6911uxe *lt6911uxe = to_lt6911uxe(sd);
> +	struct v4l2_subdev_state *state;
> +
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> +	cfg->type = V4L2_MBUS_CSI2_DPHY;
> +	cfg->link_freq = lt6911uxe->cur_mode.link_freq;
> +	v4l2_subdev_unlock_state(state);
> +
> +	return 0;
> +}
> +
> +static int lt6911uxe_init_state(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_state *sd_state)
> +{
> +	struct v4l2_subdev_format fmt = {
> +		.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY
> +		: V4L2_SUBDEV_FORMAT_ACTIVE,
> +	};
> +
> +	return lt6911uxe_set_format(sd, sd_state, &fmt);
> +}
> +
> +static const struct v4l2_subdev_video_ops lt6911uxe_video_ops = {
> +	.s_stream = v4l2_subdev_s_stream_helper,
> +};
> +
> +/*
> + * lt6911uxe provides editable EDID for customers, but only can be edited like
> + * updating flash. Due to this limitation, it is not possible to implement
> + * EDID support.
> + */
> +static const struct v4l2_subdev_pad_ops lt6911uxe_pad_ops = {
> +	.set_fmt = lt6911uxe_set_format,
> +	.get_fmt = v4l2_subdev_get_fmt,
> +	.enable_streams = lt6911uxe_enable_streams,
> +	.disable_streams = lt6911uxe_disable_streams,
> +	.enum_mbus_code = lt6911uxe_enum_mbus_code,
> +	.get_frame_interval = v4l2_subdev_get_frame_interval,
> +	.s_dv_timings = lt6911uxe_s_dv_timings,
> +	.g_dv_timings = lt6911uxe_g_dv_timings,
> +	.query_dv_timings = lt6911uxe_query_dv_timings,
> +	.enum_dv_timings = lt6911uxe_enum_dv_timings,
> +	.dv_timings_cap = lt6911uxe_dv_timings_cap,
> +	.get_mbus_config = lt6911uxe_get_mbus_config,
> +};
> +
> +static const struct v4l2_subdev_core_ops lt6911uxe_subdev_core_ops = {
> +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> +};
> +
> +static const struct v4l2_subdev_ops lt6911uxe_subdev_ops = {
> +	.core = &lt6911uxe_subdev_core_ops,
> +	.video = &lt6911uxe_video_ops,
> +	.pad = &lt6911uxe_pad_ops,
> +};
> +
> +static const struct media_entity_operations lt6911uxe_subdev_entity_ops = {
> +	.link_validate = v4l2_subdev_link_validate,
> +};
> +
> +static const struct v4l2_subdev_internal_ops lt6911uxe_internal_ops = {
> +	.init_state = lt6911uxe_init_state,
> +};
> +
> +static int lt6911uxe_fwnode_parse(struct lt6911uxe *lt6911uxe,
> +				  struct device *dev)
> +{
> +	struct fwnode_handle *endpoint;
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> +	};
> +	int ret;
> +
> +	endpoint = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
> +						   FWNODE_GRAPH_ENDPOINT_NEXT);
> +	if (!endpoint)
> +		return dev_err_probe(dev, -EPROBE_DEFER,
> +				     "endpoint node not found\n");
> +
> +	ret = v4l2_fwnode_endpoint_parse(endpoint, &bus_cfg);
> +	fwnode_handle_put(endpoint);
> +	if (ret) {
> +		dev_err(dev, "failed to parse endpoint node: %d\n", ret);
> +		goto out_err;
> +	}
> +
> +	/*
> +	 * Check the number of MIPI CSI2 data lanes,
> +	 * lt6911uxe only support 4 lanes.
> +	 */
> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != LT6911UXE_DEFAULT_LANES) {
> +		dev_err(dev, "only 4 data lanes are currently supported\n");
> +		goto out_err;
> +	}
> +	lt6911uxe->cur_mode.lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
> +	lt6911uxe->cur_mode.code = MEDIA_BUS_FMT_UYVY8_1X16;
> +
> +	return 0;
> +
> +out_err:
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +	return ret;
> +}
> +
> +static int lt6911uxe_identify_module(struct lt6911uxe *lt6911uxe,
> +				     struct device *dev)
> +{
> +	u64 val;
> +	int ret = 0;
> +
> +	/* Chip ID should be confirmed when the I2C slave is active */
> +	cci_write(lt6911uxe->regmap, REG_ENABLE_I2C, 0x1, &ret);
> +	cci_read(lt6911uxe->regmap, REG_CHIP_ID, &val, &ret);
> +	cci_write(lt6911uxe->regmap, REG_ENABLE_I2C, 0x0, &ret);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "fail to read chip id\n");
> +
> +	if (val != LT6911UXE_CHIP_ID) {
> +		return dev_err_probe(dev, -ENXIO, "chip id mismatch: %x!=%x\n",
> +				     LT6911UXE_CHIP_ID, (u16)val);
> +	}
> +
> +	return 0;
> +}
> +
> +static irqreturn_t lt6911uxe_threaded_irq_fn(int irq, void *dev_id)
> +{
> +	struct v4l2_subdev *sd = dev_id;
> +	struct lt6911uxe *lt6911uxe = to_lt6911uxe(sd);
> +	struct v4l2_subdev_state *state;
> +	struct v4l2_subdev_format fmt = {
> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE
> +	};
> +
> +	lt6911uxe_status_update(lt6911uxe);
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> +	/*
> +	 * As a HDMI to CSI2 bridge, it needs to update the format in time
> +	 * when the HDMI source changes.
> +	 */
> +	lt6911uxe_set_format(sd, state, &fmt);
> +	v4l2_subdev_unlock_state(state);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void lt6911uxe_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct lt6911uxe *lt6911uxe = to_lt6911uxe(sd);
> +
> +	free_irq(gpiod_to_irq(lt6911uxe->irq_gpio), lt6911uxe);
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(sd);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_ctrl_handler_free(&lt6911uxe->ctrl_handler);
> +	pm_runtime_disable(&client->dev);
> +	pm_runtime_set_suspended(&client->dev);
> +}
> +
> +static int lt6911uxe_probe(struct i2c_client *client)
> +{
> +	struct lt6911uxe *lt6911uxe;
> +	struct device *dev = &client->dev;
> +	u64 irq_pin_flags;
> +	int ret;
> +
> +	lt6911uxe = devm_kzalloc(dev, sizeof(*lt6911uxe), GFP_KERNEL);
> +	if (!lt6911uxe)
> +		return -ENOMEM;
> +
> +	lt6911uxe->regmap = devm_regmap_init_i2c(client,
> +						 &lt6911uxe_regmap_config);
> +	if (IS_ERR(lt6911uxe->regmap))
> +		return dev_err_probe(dev, PTR_ERR(lt6911uxe->regmap),
> +				     "failed to init CCI\n");
> +
> +	v4l2_i2c_subdev_init(&lt6911uxe->sd, client, &lt6911uxe_subdev_ops);
> +
> +	lt6911uxe->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_IN);
> +	if (IS_ERR(lt6911uxe->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(lt6911uxe->reset_gpio),
> +				     "failed to get reset gpio\n");
> +
> +	lt6911uxe->irq_gpio = devm_gpiod_get(dev, "readystat", GPIOD_IN);
> +	if (IS_ERR(lt6911uxe->irq_gpio))
> +		return dev_err_probe(dev, PTR_ERR(lt6911uxe->irq_gpio),
> +				     "failed to get ready_stat gpio\n");
> +
> +	ret = lt6911uxe_fwnode_parse(lt6911uxe, dev);
> +	if (ret)
> +		return ret;
> +
> +	usleep_range(10000, 10500);
> +
> +	ret = lt6911uxe_identify_module(lt6911uxe, dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to find chip\n");
> +
> +	ret = lt6911uxe_init_controls(lt6911uxe);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to init control\n");
> +
> +	lt6911uxe->sd.dev = dev;
> +	lt6911uxe->sd.internal_ops = &lt6911uxe_internal_ops;
> +	lt6911uxe->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	lt6911uxe->sd.entity.ops = &lt6911uxe_subdev_entity_ops;
> +	lt6911uxe->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> +	lt6911uxe->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&lt6911uxe->sd.entity, 1, &lt6911uxe->pad);
> +	if (ret) {
> +		dev_err(dev, "failed to init entity pads: %d\n", ret);
> +		goto v4l2_ctrl_handler_free;
> +	}
> +
> +	/*
> +	 * Device is already turned on by i2c-core with ACPI domain PM.
> +	 * Enable runtime PM and turn off the device.
> +	 */
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_idle(dev);
> +
> +	ret = v4l2_subdev_init_finalize(&lt6911uxe->sd);
> +	if (ret) {
> +		dev_err(dev, "failed to init v4l2 subdev: %d\n", ret);
> +		goto media_entity_cleanup;
> +	}
> +
> +	/* Setting irq */
> +	irq_pin_flags = IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING |
> +			IRQF_ONESHOT;
> +
> +	ret = request_threaded_irq(gpiod_to_irq(lt6911uxe->irq_gpio), NULL,
> +				   lt6911uxe_threaded_irq_fn,
> +				   irq_pin_flags, NULL, lt6911uxe);
> +	if (ret) {
> +		dev_err(dev, "failed to request IRQ: %d\n", ret);
> +		goto subdev_cleanup;
> +	}
> +
> +	ret = v4l2_async_register_subdev_sensor(&lt6911uxe->sd);
> +	if (ret) {
> +		dev_err(dev, "failed to register V4L2 subdev: %d\n", ret);
> +		goto free_irq;
> +	}
> +
> +	return 0;
> +
> +free_irq:
> +	free_irq(gpiod_to_irq(lt6911uxe->irq_gpio), lt6911uxe);
> +
> +subdev_cleanup:
> +	v4l2_subdev_cleanup(&lt6911uxe->sd);
> +
> +media_entity_cleanup:
> +	pm_runtime_disable(dev);
> +	pm_runtime_set_suspended(dev);
> +	media_entity_cleanup(&lt6911uxe->sd.entity);
> +
> +v4l2_ctrl_handler_free:
> +	v4l2_ctrl_handler_free(lt6911uxe->sd.ctrl_handler);
> +
> +	return ret;
> +}
> +
> +static const struct acpi_device_id lt6911uxe_acpi_ids[] = {
> +	{ "INTC10C5" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(acpi, lt6911uxe_acpi_ids);
> +
> +static struct i2c_driver lt6911uxe_i2c_driver = {
> +	.driver = {
> +		.name = "lt6911uxe",
> +		.acpi_match_table = ACPI_PTR(lt6911uxe_acpi_ids),
> +	},
> +	.probe = lt6911uxe_probe,
> +	.remove = lt6911uxe_remove,
> +};
> +
> +module_i2c_driver(lt6911uxe_i2c_driver);
> +
> +MODULE_AUTHOR("Yan Dongcheng <dongcheng.yan@intel.com>");
> +MODULE_DESCRIPTION("Lontium lt6911uxe HDMI to MIPI Bridge Driver");
> +MODULE_LICENSE("GPL");
> 
> base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3


