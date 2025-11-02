Return-Path: <linux-media+bounces-46140-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EE1C28DA2
	for <lists+linux-media@lfdr.de>; Sun, 02 Nov 2025 11:57:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1811D347BB7
	for <lists+linux-media@lfdr.de>; Sun,  2 Nov 2025 10:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81ED526E714;
	Sun,  2 Nov 2025 10:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Wi0kVEQQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3675E2264A9;
	Sun,  2 Nov 2025 10:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762081028; cv=none; b=rPcf8YzzSuirn15eGipcKYdO2NqyFTR554w6sBPNfn3tKFGl+Vi3YUk6mv2J3obZ5kpiORlyPNgxiDmcOaefq4KFm/0q4ujQdRHss8BML6B9QunXnDw2oY/fK1SAE/LdhzQl8wD8sgaxi2svd/QQFSQ4AmvVtD7jK2mvaJQ8wQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762081028; c=relaxed/simple;
	bh=xsjNnBk/QkmgSAG5n3nrTOX2ojRciG717tCy+qHjaQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwNAZ/kKLvcOVH/xI5YHS2W160V3Lh7xg5lMH8V0ywK3+QsmJz+n1UQCJzSFfVy/tEQInHa7YJZuEYFJDWjcM8VQ+Kd2dNhBRISbzRmqZ3YIx1xz/ZB/oN2r0uHDrFXX1cZ2uB79yW29fevyOrDsfN1e8YKs+Iovzp2X3yG5sfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Wi0kVEQQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-50-232.net.vodafone.it [5.90.50.232])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6B300B3;
	Sun,  2 Nov 2025 11:55:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762080913;
	bh=xsjNnBk/QkmgSAG5n3nrTOX2ojRciG717tCy+qHjaQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wi0kVEQQ9NCVGZTJ/m9GvKl4yfHu4HL5nquEK299QrXdLTTOnPjEY7fSp07josm2u
	 ivP9q+pDjHtq4AAPcYV6XCeLuVuIwMnIE2RHDnkk/7HpaVEfTT+yBD//XKTstgOFMM
	 Q0k0+q2Er1J49ah4UJRvbPB4r1ltIoQzSokZcA7s=
Date: Sun, 2 Nov 2025 11:57:02 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	David Plowman <david.plowman@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
	"Ivan T. Ivanov" <iivanov@suse.de>
Subject: Re: [PATCH 07/13] media: i2c: ov5647: Add support for regulator
 control.
Message-ID: <dcr6edcm4tjxadd6fjfnolqqver2lg3fxh6mhe4f6lvip3ufy5@5kuc7e566nxi>
References: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com>
 <20251028-b4-rpi-ov5647-v1-7-098413454f5e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251028-b4-rpi-ov5647-v1-7-098413454f5e@ideasonboard.com>

Hi Jai

On Tue, Oct 28, 2025 at 12:57:18PM +0530, Jai Luthra wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> The driver supported using GPIOs to control the shutdown line,
> but no regulator control.
>
> Add regulator hooks.

Do bindings need an update ?

>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5647.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index a33e2d8edc114d302e830639cb7cb161f16a6208..598764638d518a28c8ac61ea590b996f09ecd45c 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -20,6 +20,7 @@
>  #include <linux/module.h>
>  #include <linux/of_graph.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>  #include <linux/videodev2.h>
>  #include <media/v4l2-ctrls.h>
> @@ -83,6 +84,15 @@
>  #define OV5647_EXPOSURE_DEFAULT		1000
>  #define OV5647_EXPOSURE_MAX		65535
>
> +/* regulator supplies */
> +static const char * const ov5647_supply_names[] = {
> +	"avdd",		/* Analog power */
> +	"dovdd",	/* Digital I/O power */
> +	"dvdd",		/* Digital core power */
> +};
> +
> +#define OV5647_NUM_SUPPLIES ARRAY_SIZE(ov5647_supply_names)
> +
>  struct regval_list {
>  	u16 addr;
>  	u8 data;
> @@ -104,6 +114,7 @@ struct ov5647 {
>  	struct mutex			lock;
>  	struct clk			*xclk;
>  	struct gpio_desc		*pwdn;
> +	struct regulator_bulk_data supplies[OV5647_NUM_SUPPLIES];

nit: please align 'supplies' to other members

>  	bool				clock_ncont;
>  	struct v4l2_ctrl_handler	ctrls;
>  	const struct ov5647_mode	*mode;
> @@ -781,6 +792,12 @@ static int ov5647_power_on(struct device *dev)
>
>  	dev_dbg(dev, "OV5647 power on\n");
>
> +	ret = regulator_bulk_enable(OV5647_NUM_SUPPLIES, sensor->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable regulators\n");
> +		return ret;
> +	}
> +
>  	if (sensor->pwdn) {
>  		gpiod_set_value_cansleep(sensor->pwdn, 0);

Should we disable regulators if this fail ?

Also, gpiod_set_value_cansleep() supports optional gpios, so you might
want to remove if (sensor->pwdn), check the return value of this
function and jump to a new label

>  		msleep(PWDN_ACTIVE_DELAY_MS);
> @@ -812,6 +829,7 @@ static int ov5647_power_on(struct device *dev)
>  	clk_disable_unprepare(sensor->xclk);
>  error_pwdn:
>  	gpiod_set_value_cansleep(sensor->pwdn, 1);
> +	regulator_bulk_disable(OV5647_NUM_SUPPLIES, sensor->supplies);
>
>  	return ret;
>  }
> @@ -841,6 +859,7 @@ static int ov5647_power_off(struct device *dev)
>
>  	clk_disable_unprepare(sensor->xclk);
>  	gpiod_set_value_cansleep(sensor->pwdn, 1);
> +	regulator_bulk_disable(OV5647_NUM_SUPPLIES, sensor->supplies);
>
>  	return 0;
>  }
> @@ -1341,6 +1360,18 @@ static const struct v4l2_ctrl_ops ov5647_ctrl_ops = {
>  	.s_ctrl = ov5647_s_ctrl,
>  };
>
> +static int ov5647_configure_regulators(struct device *dev,
> +				       struct ov5647 *sensor)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < OV5647_NUM_SUPPLIES; i++)

nit: you can now declared i inside the for loop

Thanks
  j

> +		sensor->supplies[i].supply = ov5647_supply_names[i];
> +
> +	return devm_regulator_bulk_get(dev, OV5647_NUM_SUPPLIES,
> +				       sensor->supplies);
> +}
> +
>  static int ov5647_init_controls(struct ov5647 *sensor, struct device *dev)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
> @@ -1489,6 +1520,12 @@ static int ov5647_probe(struct i2c_client *client)
>  		return -EINVAL;
>  	}
>
> +	ret = ov5647_configure_regulators(dev, sensor);
> +	if (ret) {
> +		dev_err(dev, "Failed to get power regulators\n");
> +		return ret;
> +	}
> +
>  	mutex_init(&sensor->lock);
>
>  	sensor->mode = OV5647_DEFAULT_MODE;
>
> --
> 2.51.0
>

