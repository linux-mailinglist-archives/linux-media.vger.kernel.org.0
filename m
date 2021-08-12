Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C5FF3EAA5C
	for <lists+linux-media@lfdr.de>; Thu, 12 Aug 2021 20:41:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234916AbhHLSlS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Aug 2021 14:41:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234899AbhHLSlR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Aug 2021 14:41:17 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9203AC061756
        for <linux-media@vger.kernel.org>; Thu, 12 Aug 2021 11:40:50 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dbd1vftgng281pd4yskly-3.rev.dnainternet.fi [IPv6:2001:14ba:8eb:1240:ab2d:b956:f00:7a12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 70B002004E;
        Thu, 12 Aug 2021 21:40:45 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1628793645;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cTvJN8eDupZQcQkX/kIZrQ0vsfDMIP+YqKHvLpEVYoM=;
        b=BVvFqbcX/OBLA/KPeKR6y8VVwMflEx9HvZgxjxvAlTr+NAqFVeT3AkAPyz4zUZALu28qqa
        zSaS5pu9uHdSkLCi/lOxlZNcNDlLi++kI7DaWktVy7J6SPiCF9C6o69lgTGp/ljJFVP10M
        asFIdE/jT7Chjtygy6qsd4uTahPu1SM=
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A9B12634C87;
        Thu, 12 Aug 2021 21:38:54 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1mEFd3-0004S7-BC; Thu, 12 Aug 2021 21:40:33 +0300
Date:   Thu, 12 Aug 2021 21:40:33 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: staging: max96712: Add basic support for MAX96712
 GMSL2 deserializer
Message-ID: <20210812184033.GV3@valkosipuli.retiisi.eu>
References: <20210413171815.2513216-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210413171815.2513216-1-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1628793645;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cTvJN8eDupZQcQkX/kIZrQ0vsfDMIP+YqKHvLpEVYoM=;
        b=sr3Sm2+h6rRpENI+e0m8i0DN8sXBlXgJM6v2bIFYGRD82D1Ra4M1ME/vrczwOqdCShac3E
        KzOg4+NlSY1sbgkc59vCJryW8HFz2wj8SmTPv8wC/lDoyM6inC5jsOO8Sr7jMd8Zn3nX7n
        bjYD8+eqTSh4Laa05M3fELu6YNLexGY=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1628793645; a=rsa-sha256; cv=none;
        b=u1QsBIefECvM0iP7Lt2AAaeITQ9Av6mBUuT5mUoKVOcfDYicRC5sC7UiP85NSCG7Ci0j7Z
        iyWKQ6iEdxXiaaZfjVingjdXX4+ctswzx3EJ/TcXPoO3AKV44/ep8LHHX86buevVKoEzHJ
        BdgzuvBTBQr+EY4wVXrFltxkV5HJ5l8=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hejssan Niklas,

Tack för den här lappan.

On Tue, Apr 13, 2021 at 07:18:15PM +0200, Niklas Söderlund wrote:
> Add basic support for Maxim MAX96712 quad GMSL2 deserializers. The
> driver is capable of powering on the device and configuring the MIPI
> CSI-2 bus in a DPHY 4-lane configuration as well as operating the
> internal VTG (Video Timing Generator) and VPG (Video Pattern Generator).
> 
> Using these features the driver is able to act as a 1080p @ 30 fps V4L2
> video source. Producing either a checkerboard or gradient pattern on the
> CSI-2 bus, selectable thru a V4L2 control.
> 
> While the driver is useful as-is and have been used to prove the correct
> operation of the MAX96712 itself and "downstream" devices using the
> MAX96712 as a video source there are a lot of features missing. Most
> notably the ability to operate the GMSL bus.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  MAINTAINERS                               |   6 +
>  drivers/staging/media/Kconfig             |   2 +
>  drivers/staging/media/Makefile            |   1 +
>  drivers/staging/media/max96712/Kconfig    |  13 +
>  drivers/staging/media/max96712/Makefile   |   2 +
>  drivers/staging/media/max96712/max96712.c | 429 ++++++++++++++++++++++
>  6 files changed, 453 insertions(+)
>  create mode 100644 drivers/staging/media/max96712/Kconfig
>  create mode 100644 drivers/staging/media/max96712/Makefile
>  create mode 100644 drivers/staging/media/max96712/max96712.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cb727179826b1996..b265a7ba60e709f3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10831,6 +10831,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
>  F:	drivers/media/i2c/max9286.c
>  
> +MAX96712 QUAD GMSL2 DESERIALIZER DRIVER
> +M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	drivers/staging/media/max96712/max96712.c
> +
>  MAX9860 MONO AUDIO VOICE CODEC DRIVER
>  M:	Peter Rosin <peda@axentia.se>
>  L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
> diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
> index ca59986b20f8a898..f104da4b5a358ffe 100644
> --- a/drivers/staging/media/Kconfig
> +++ b/drivers/staging/media/Kconfig
> @@ -26,6 +26,8 @@ source "drivers/staging/media/hantro/Kconfig"
>  
>  source "drivers/staging/media/imx/Kconfig"
>  
> +source "drivers/staging/media/max96712/Kconfig"
> +
>  source "drivers/staging/media/meson/vdec/Kconfig"
>  
>  source "drivers/staging/media/omap4iss/Kconfig"
> diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
> index 716929a1a313000f..37e0b1f85b5f7286 100644
> --- a/drivers/staging/media/Makefile
> +++ b/drivers/staging/media/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_INTEL_ATOMISP)     += atomisp/
>  obj-$(CONFIG_VIDEO_IMX_MEDIA)	+= imx/
> +obj-$(CONFIG_VIDEO_MAX96712)	+= max96712/
>  obj-$(CONFIG_VIDEO_MESON_VDEC)	+= meson/vdec/
>  obj-$(CONFIG_VIDEO_OMAP4)	+= omap4iss/
>  obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC)	+= rkvdec/
> diff --git a/drivers/staging/media/max96712/Kconfig b/drivers/staging/media/max96712/Kconfig
> new file mode 100644
> index 0000000000000000..258d47644cbd8459
> --- /dev/null
> +++ b/drivers/staging/media/max96712/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0
> +config VIDEO_MAX96712
> +	tristate "Maxim MAX96712 Quad GMSL2 Deserializer support"
> +	depends on I2C
> +	depends on OF_GPIO
> +	select V4L2_FWNODE
> +	select VIDEO_V4L2_SUBDEV_API
> +	select MEDIA_CONTROLLER
> +	help
> +	  This driver supports the Maxim MAX96712 Quad GMSL2 Deserializer.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called max96712.
> diff --git a/drivers/staging/media/max96712/Makefile b/drivers/staging/media/max96712/Makefile
> new file mode 100644
> index 0000000000000000..70c1974ce3f05fe4
> --- /dev/null
> +++ b/drivers/staging/media/max96712/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_VIDEO_MAX96712) += max96712.o
> diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> new file mode 100644
> index 0000000000000000..6a993e8ee9259fda
> --- /dev/null
> +++ b/drivers/staging/media/max96712/max96712.c
> @@ -0,0 +1,429 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Maxim MAX9286 Quad GMSL2 Deserializer Driver
> + *
> + * Copyright (C) 2021 Renesas Electronics Corporation
> + * Copyright (C) 2021 Niklas Söderlund
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of_graph.h>
> +#include <linux/regmap.h>
> +
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-subdev.h>
> +
> +#define MAX96712_ID 0x20
> +
> +#define MAX96712_DPLL_FREQ 1000
> +
> +enum max96712_pattern {
> +	MAX96712_PATTERN_CHECKERBOARD = 0,
> +	MAX96712_PATTERN_GRADIENT,
> +};
> +
> +struct max96712_priv {
> +	struct i2c_client *client;
> +	struct regmap *regmap;
> +	struct gpio_desc *gpiod_pwdn;
> +
> +	struct v4l2_fwnode_bus_mipi_csi2 mipi;
> +
> +	struct v4l2_subdev sd;
> +	struct v4l2_ctrl_handler ctrl_handler;
> +	struct media_pad pads[1];
> +
> +	enum max96712_pattern pattern;
> +};
> +
> +static int max96712_read(struct max96712_priv *priv, int reg)
> +{
> +	int ret, val;
> +
> +	ret = regmap_read(priv->regmap, reg, &val);
> +	if (ret) {
> +		dev_err(&priv->client->dev, "read 0x%04x failed\n", reg);
> +		return ret;
> +	}
> +
> +	return val;
> +}
> +
> +static int max96712_write(struct max96712_priv *priv, unsigned int reg, u8 val)
> +{
> +	int ret;
> +
> +	ret = regmap_write(priv->regmap, reg, val);
> +	if (ret)
> +		dev_err(&priv->client->dev, "write 0x%04x failed\n", reg);
> +
> +	return ret;
> +}
> +
> +static int max96712_update_bits(struct max96712_priv *priv, unsigned int reg,
> +				u8 mask, u8 val)
> +{
> +	int ret;
> +
> +	ret = regmap_update_bits(priv->regmap, reg, mask, val);
> +	if (ret)
> +		dev_err(&priv->client->dev, "update 0x%04x failed\n", reg);
> +
> +	return ret;
> +}
> +
> +static int max96712_write_bulk(struct max96712_priv *priv, unsigned int reg,
> +			       const void *val, size_t val_count)
> +{
> +	int ret;
> +
> +	ret = regmap_bulk_write(priv->regmap, reg, val, val_count);
> +	if (ret)
> +		dev_err(&priv->client->dev, "bulk write 0x%04x failed\n", reg);
> +
> +	return ret;
> +}
> +
> +static int max96712_write_bulk_value(struct max96712_priv *priv,
> +				     unsigned int reg, unsigned int val,
> +				     size_t val_count)
> +{
> +	unsigned int i;
> +	u8 values[4];
> +
> +	for (i = 1; i <= val_count; i++)
> +		values[i - 1] = (val >> ((val_count - i) * 8)) & 0xff;
> +
> +	return max96712_write_bulk(priv, reg, &values, val_count);
> +}
> +
> +static void max96712_reset(struct max96712_priv *priv)
> +{
> +	max96712_update_bits(priv, 0x13, 0x40, 0x40);
> +	mdelay(10);

Why not msleep()?

> +}
> +
> +static void max96712_mipi_enable(struct max96712_priv *priv, bool enable)
> +{
> +	if (enable) {
> +		max96712_update_bits(priv, 0x40b, 0x02, 0x02);
> +		max96712_update_bits(priv, 0x8a0, 0x80, 0x80);
> +	} else {
> +		max96712_update_bits(priv, 0x8a0, 0x80, 0x00);
> +		max96712_update_bits(priv, 0x40b, 0x02, 0x00);
> +	}
> +}
> +
> +static void max96712_mipi_configure(struct max96712_priv *priv)
> +{
> +	unsigned int i;
> +	u8 phy5 = 0;
> +
> +	max96712_mipi_enable(priv, false);
> +
> +	/* Select 2x4 mode. */
> +	max96712_write(priv, 0x8a0, 0x04);
> +
> +	/* Configure a 4-lane DPHY using PHY0 and PHY1. */
> +	/* TODO: Add support for 2-lane and 1-lane configurations. */
> +	/* TODO: Add support CPHY mode. */
> +	max96712_write(priv, 0x94a, 0xc0);
> +
> +	/* Configure lane mapping for PHY0 and PHY1. */
> +	/* TODO: Add support for lane swapping. */
> +	max96712_write(priv, 0x8a3, 0xe4);
> +
> +	/* Configure lane polarity for PHY0 and PHY1. */
> +	for (i = 0; i < priv->mipi.num_data_lanes + 1; i++)
> +		if (priv->mipi.lane_polarities[i])
> +			phy5 |= BIT(i == 0 ? 5 : i < 3 ? i - 1 : i);
> +	max96712_write(priv, 0x8a5, phy5);
> +
> +	/* Set link frequency for PHY0 and PHY1. */
> +	max96712_update_bits(priv, 0x415, 0x3f,
> +			     ((MAX96712_DPLL_FREQ / 100) & 0x1f) | BIT(5));
> +	max96712_update_bits(priv, 0x418, 0x3f,
> +			     ((MAX96712_DPLL_FREQ / 100) & 0x1f) | BIT(5));
> +
> +	/* Enable PHY0 and PHY1 */
> +	max96712_update_bits(priv, 0x8a2, 0xf0, 0x30);
> +}
> +
> +static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
> +{
> +	const u32 h_active = 1920;
> +	const u32 h_fp = 88;
> +	const u32 h_sw = 44;
> +	const u32 h_bp = 148;
> +	const u32 h_tot = h_active + h_fp + h_sw + h_bp;
> +
> +	const u32 v_active = 1080;
> +	const u32 v_fp = 4;
> +	const u32 v_sw = 5;
> +	const u32 v_bp = 36;
> +	const u32 v_tot = v_active + v_fp + v_sw + v_bp;
> +
> +	if (!enable) {
> +		max96712_write(priv, 0x1051, 0x00);
> +		return;
> +	}
> +
> +	/* PCLK 75MHz. */
> +	max96712_write(priv, 0x0009, 0x01);
> +
> +	/* Configure Video Timing Generator for 1920x1080 @ 30 fps. */
> +	max96712_write_bulk_value(priv, 0x1052, 0, 3);
> +	max96712_write_bulk_value(priv, 0x1055, v_sw * h_tot, 3);
> +	max96712_write_bulk_value(priv, 0x1058,
> +				  (v_active + v_fp + + v_bp) * h_tot, 3);
> +	max96712_write_bulk_value(priv, 0x105b, 0, 3);
> +	max96712_write_bulk_value(priv, 0x105e, h_sw, 2);
> +	max96712_write_bulk_value(priv, 0x1060, h_active + h_fp + h_bp, 2);
> +	max96712_write_bulk_value(priv, 0x1062, v_tot, 2);
> +	max96712_write_bulk_value(priv, 0x1064,
> +				  h_tot * (v_sw + v_bp) + (h_sw + h_bp), 3);
> +	max96712_write_bulk_value(priv, 0x1067, h_active, 2);
> +	max96712_write_bulk_value(priv, 0x1069, h_fp + h_sw + h_bp, 2);
> +	max96712_write_bulk_value(priv, 0x106b, v_active, 2);
> +
> +	/* Generate VS, HS and DE in free-running mode. */
> +	max96712_write(priv, 0x1050, 0xfb);
> +
> +	/* Configure Video Pattern Generator. */
> +	if (priv->pattern == MAX96712_PATTERN_CHECKERBOARD) {
> +		/* Set checkerboard pattern size. */
> +		max96712_write(priv, 0x1074, 0x3c);
> +		max96712_write(priv, 0x1075, 0x3c);
> +		max96712_write(priv, 0x1076, 0x3c);
> +
> +		/* Set checkerboard pattern colors. */
> +		max96712_write_bulk_value(priv, 0x106e, 0xfecc00, 3);
> +		max96712_write_bulk_value(priv, 0x1071, 0x006aa7, 3);
> +
> +		/* Generate checkerboard pattern. */
> +		max96712_write(priv, 0x1051, 0x10);
> +	} else {
> +		/* Set gradient increment. */
> +		max96712_write(priv, 0x106d, 0x10);
> +
> +		/* Generate gradient pattern. */
> +		max96712_write(priv, 0x1051, 0x20);
> +	}
> +}
> +
> +static int max96712_s_stream(struct v4l2_subdev *sd, int enable)
> +{
> +	struct max96712_priv *priv = v4l2_get_subdevdata(sd);
> +
> +	if (enable) {
> +		max96712_pattern_enable(priv, true);
> +		max96712_mipi_enable(priv, true);
> +	} else {
> +		max96712_mipi_enable(priv, false);
> +		max96712_pattern_enable(priv, false);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_video_ops max96712_video_ops = {
> +	.s_stream = max96712_s_stream,
> +};
> +
> +static int max96712_get_pad_format(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_pad_config *cfg,
> +				   struct v4l2_subdev_format *format)
> +{
> +	format->format.width = 1920;
> +	format->format.height = 1080;
> +	format->format.code = MEDIA_BUS_FMT_RGB888_1X24;
> +	format->format.field = V4L2_FIELD_NONE;
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_pad_ops max96712_pad_ops = {
> +	.get_fmt = max96712_get_pad_format,

Please use the same for .set_fmt.

> +};
> +
> +static struct v4l2_subdev_ops max96712_subdev_ops = {
> +	.video = &max96712_video_ops,
> +	.pad = &max96712_pad_ops,
> +};
> +
> +static const char * const max96712_test_pattern[] = {
> +	"Checkerboard",
> +	"Gradient",
> +};
> +
> +static int max96712_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct max96712_priv *priv =
> +		container_of(ctrl->handler, struct max96712_priv, ctrl_handler);
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_TEST_PATTERN:
> +		priv->pattern = ctrl->val ?
> +			MAX96712_PATTERN_GRADIENT :
> +			MAX96712_PATTERN_CHECKERBOARD;
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops max96712_ctrl_ops = {
> +	.s_ctrl = max96712_s_ctrl,
> +};
> +
> +static int max96712_v4l2_register(struct max96712_priv *priv)
> +{
> +	long pixel_rate;
> +	int ret;
> +
> +	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max96712_subdev_ops);
> +	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> +
> +	v4l2_ctrl_handler_init(&priv->ctrl_handler, 2);

You'll need to free the control handler below on error paths.

> +
> +	pixel_rate = MAX96712_DPLL_FREQ / priv->mipi.num_data_lanes * 1000000;

What does this value signify?

The pixel rate control has been re-purposed as follows:

``V4L2_CID_PIXEL_RATE (64-bit integer)``
    Pixel sampling rate in the device's pixel array. This control is
    read-only and its unit is pixels / second.

    Some devices use horizontal and vertical balanking to configure the frame
    rate. The frame rate can be calculated from the pixel rate, analogue crop
    rectangle as well as horizontal and vertical blanking. The pixel rate
    control may be present in a different sub-device than the blanking controls
    and the analogue crop rectangle configuration.

    The configuration of the frame rate is performed by selecting the desired
    horizontal and vertical blanking. The unit of this control is Hz.

Could you use the LINK_FREQ control instead?

> +	v4l2_ctrl_new_std(&priv->ctrl_handler, NULL, V4L2_CID_PIXEL_RATE,
> +			  pixel_rate, pixel_rate, 1, pixel_rate);
> +
> +	v4l2_ctrl_new_std_menu_items(&priv->ctrl_handler, &max96712_ctrl_ops,
> +				     V4L2_CID_TEST_PATTERN,
> +				     ARRAY_SIZE(max96712_test_pattern) - 1,
> +				     0, 0, max96712_test_pattern);
> +
> +	priv->sd.ctrl_handler = &priv->ctrl_handler;
> +	ret = priv->ctrl_handler.error;
> +	if (ret)
> +		return ret;
> +
> +	priv->pads[0].flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&priv->sd.entity, 1, priv->pads);
> +	if (ret)
> +		return ret;
> +
> +	v4l2_set_subdevdata(&priv->sd, priv);
> +
> +	ret = v4l2_async_register_subdev(&priv->sd);
> +	if (ret < 0)
> +		dev_err(&priv->client->dev, "Unable to register subdevice\n");
> +
> +	return ret;
> +}
> +
> +static int max96712_parse_dt(struct max96712_priv *priv)
> +{
> +	struct fwnode_handle *ep;
> +	struct v4l2_fwnode_endpoint v4l2_ep = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY
> +	};
> +	int ret;
> +
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(&priv->client->dev), 4,
> +					     0, 0);
> +	if (!ep) {
> +		dev_err(&priv->client->dev, "Not connected to subdevice\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = v4l2_fwnode_endpoint_parse(ep, &v4l2_ep);
> +	fwnode_handle_put(ep);
> +	if (ret) {
> +		dev_err(&priv->client->dev, "Could not parse v4l2 endpoint\n");
> +		return -EINVAL;
> +	}
> +
> +	if (v4l2_ep.bus.mipi_csi2.num_data_lanes != 4) {
> +		dev_err(&priv->client->dev, "Only 4 data lanes supported\n");
> +		return -EINVAL;
> +	}
> +
> +	priv->mipi = v4l2_ep.bus.mipi_csi2;
> +
> +	return 0;
> +}
> +
> +static const struct regmap_config max96712_i2c_regmap = {
> +	.reg_bits = 16,
> +	.val_bits = 8,
> +	.max_register = 0x1f00,
> +};
> +
> +static int max96712_probe(struct i2c_client *client)
> +{
> +	struct max96712_priv *priv;
> +	int ret;
> +
> +	priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->client = client;
> +	i2c_set_clientdata(client, priv);
> +
> +	priv->regmap = devm_regmap_init_i2c(client, &max96712_i2c_regmap);
> +	if (IS_ERR(priv->regmap))
> +		return PTR_ERR(priv->regmap);
> +
> +	priv->gpiod_pwdn = devm_gpiod_get_optional(&client->dev, "enable",
> +						   GPIOD_OUT_HIGH);
> +	if (IS_ERR(priv->gpiod_pwdn))
> +		return PTR_ERR(priv->gpiod_pwdn);
> +
> +	gpiod_set_consumer_name(priv->gpiod_pwdn, "max96712-pwdn");
> +	gpiod_set_value_cansleep(priv->gpiod_pwdn, 1);
> +
> +	if (priv->gpiod_pwdn)
> +		usleep_range(4000, 5000);
> +
> +	if (max96712_read(priv, 0x4a) != MAX96712_ID)
> +		return -ENODEV;
> +
> +	max96712_reset(priv);
> +
> +	ret = max96712_parse_dt(priv);
> +	if (ret)
> +		return ret;
> +
> +	max96712_mipi_configure(priv);
> +
> +	return max96712_v4l2_register(priv);
> +}
> +
> +static int max96712_remove(struct i2c_client *client)
> +{
> +	struct max96712_priv *priv = i2c_get_clientdata(client);
> +
> +	v4l2_async_unregister_subdev(&priv->sd);
> +
> +	gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id max96712_of_table[] = {
> +	{ .compatible = "maxim,max96712" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, max96712_of_table);
> +
> +static struct i2c_driver max96712_i2c_driver = {
> +	.driver	= {
> +		.name = "max96712",
> +		.of_match_table	= of_match_ptr(max96712_of_table),
> +	},
> +	.probe_new = max96712_probe,
> +	.remove = max96712_remove,
> +};
> +
> +module_i2c_driver(max96712_i2c_driver);
> +
> +MODULE_DESCRIPTION("Maxim MAX96712 Quad GMSL2 Deserializer Driver");
> +MODULE_AUTHOR("Niklas Söderlund <niklas.soderlund@ragnatech.se>");
> +MODULE_LICENSE("GPL");

-- 
Trevliga hälsningar,

Sakari Ailus
