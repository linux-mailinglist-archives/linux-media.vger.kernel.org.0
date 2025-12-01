Return-Path: <linux-media+bounces-47969-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A0DC97F08
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 16:00:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AD6D3A3DDD
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 15:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0E8031D372;
	Mon,  1 Dec 2025 14:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eL99zanm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F1230EF80;
	Mon,  1 Dec 2025 14:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764601196; cv=none; b=n9DSCjexOEWOwWkkZ6eFpFw+IMO41ZPlT3l1xfLTXFuwdA0KoJxSSdCT4HTtyNHDMW0vwrxFB8iRxLErekhUi7aDliUErYFpCoKPfeCJMkEXhUMYdhzQAtN38amE+WwypnqaASld3PqCIXxoA0AGWr3Epz2VLk0vN8ZzS5tGIfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764601196; c=relaxed/simple;
	bh=ulh2bn+2WKDluX5GWhwlkG5/dY2gOP3lEy3gmhehvQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hxLyfHERo7SGGBCR1lqxA29QpEKfMR1f9MhqCdoqBPJVV7oLi6Gkmc8GbpQdE+GHxSW9Letfu39240a7oa1jBUFafwQ84t4hn/LC19cCNElZoNnyaYqOBeE6hWHAkezpAXcxVAMUAeE2+ecG/9Jdc1PfMZjrbU3yL3Sl5KShQgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eL99zanm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2EE824F1;
	Mon,  1 Dec 2025 15:57:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764601058;
	bh=ulh2bn+2WKDluX5GWhwlkG5/dY2gOP3lEy3gmhehvQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eL99zanm38HXDrhOXmTsTbb5SvdTAZd9bJ31yvRgKYDJbj2PPEPzzBe9SalqyI2hW
	 I8YcyP4X+HgasgYw/uxHtbC7jrfDUTwIp8GVuYn51JEZ9Pe+llfUA3gvtDXhrsxqcK
	 rxnBlVGmHz54ImzhMaWOJHFsAQDTM8Aek+qbCc48=
Date: Mon, 1 Dec 2025 15:59:48 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Naushir Patuck <naush@raspberrypi.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Peter Robinson <pbrobinson@gmail.com>, 
	Stefan Wahren <wahrenst@gmx.net>, "Ivan T. Ivanov" <iivanov@suse.de>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v2 06/16] media: i2c: ov5647: Add support for regulator
 control
Message-ID: <te5zzhmux2dbwrudgiugjyqsxdmj5qqqued3ys5nnav4gys5wh@zuglcnehcyv2>
References: <20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com>
 <20251118-b4-rpi-ov5647-v2-6-5e78e7cb7f9b@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251118-b4-rpi-ov5647-v2-6-5e78e7cb7f9b@ideasonboard.com>

Hi Jai

On Tue, Nov 18, 2025 at 05:32:59PM +0530, Jai Luthra wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> The driver supported using GPIOs to control the shutdown line,
> but no regulator control.
>
> Add regulator hooks.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5647.c | 43 ++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 40 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index c0f1121b025e5592d6fd4d5fd23e4262dde2d84c..dbc134af06a26e0e31b12a6360d794afa8bad5dd 100644
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
> @@ -81,6 +82,15 @@
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
> @@ -102,6 +112,7 @@ struct ov5647 {
>  	struct mutex			lock;
>  	struct clk			*xclk;
>  	struct gpio_desc		*pwdn;
> +	struct regulator_bulk_data	supplies[OV5647_NUM_SUPPLIES];
>  	bool				clock_ncont;
>  	struct v4l2_ctrl_handler	ctrls;
>  	const struct ov5647_mode	*mode;
> @@ -777,11 +788,20 @@ static int ov5647_power_on(struct device *dev)
>
>  	dev_dbg(dev, "OV5647 power on\n");
>
> -	if (sensor->pwdn) {
> -		gpiod_set_value_cansleep(sensor->pwdn, 0);
> -		msleep(PWDN_ACTIVE_DELAY_MS);
> +	ret = regulator_bulk_enable(OV5647_NUM_SUPPLIES, sensor->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = gpiod_set_value_cansleep(sensor->pwdn, 0);
> +	if (ret < 0) {
> +		dev_err(dev, "pwdn gpio set value failed: %d\n", ret);
> +		goto error_reg_disable;
>  	}
>
> +	msleep(PWDN_ACTIVE_DELAY_MS);
> +

That's loooong

But a comment on the delay seems to justify it and it was there
already, so

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

>  	ret = clk_prepare_enable(sensor->xclk);
>  	if (ret < 0) {
>  		dev_err(dev, "clk prepare enable failed\n");
> @@ -808,6 +828,8 @@ static int ov5647_power_on(struct device *dev)
>  	clk_disable_unprepare(sensor->xclk);
>  error_pwdn:
>  	gpiod_set_value_cansleep(sensor->pwdn, 1);
> +error_reg_disable:
> +	regulator_bulk_disable(OV5647_NUM_SUPPLIES, sensor->supplies);
>
>  	return ret;
>  }
> @@ -837,6 +859,7 @@ static int ov5647_power_off(struct device *dev)
>
>  	clk_disable_unprepare(sensor->xclk);
>  	gpiod_set_value_cansleep(sensor->pwdn, 1);
> +	regulator_bulk_disable(OV5647_NUM_SUPPLIES, sensor->supplies);
>
>  	return 0;
>  }
> @@ -1284,6 +1307,16 @@ static const struct v4l2_ctrl_ops ov5647_ctrl_ops = {
>  	.s_ctrl = ov5647_s_ctrl,
>  };
>
> +static int ov5647_configure_regulators(struct device *dev,
> +				       struct ov5647 *sensor)
> +{
> +	for (unsigned int i = 0; i < OV5647_NUM_SUPPLIES; i++)
> +		sensor->supplies[i].supply = ov5647_supply_names[i];
> +
> +	return devm_regulator_bulk_get(dev, OV5647_NUM_SUPPLIES,
> +				       sensor->supplies);
> +}
> +
>  static int ov5647_init_controls(struct ov5647 *sensor)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
> @@ -1416,6 +1449,10 @@ static int ov5647_probe(struct i2c_client *client)
>  		return -EINVAL;
>  	}
>
> +	ret = ov5647_configure_regulators(dev, sensor);
> +	if (ret)
> +		dev_err_probe(dev, ret, "Failed to get power regulators\n");
> +
>  	mutex_init(&sensor->lock);
>
>  	sensor->mode = OV5647_DEFAULT_MODE;
>
> --
> 2.51.1
>
>

