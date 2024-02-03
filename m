Return-Path: <linux-media+bounces-4634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EC1848525
	for <lists+linux-media@lfdr.de>; Sat,  3 Feb 2024 11:16:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 439AF1C22E90
	for <lists+linux-media@lfdr.de>; Sat,  3 Feb 2024 10:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6D74F1E0;
	Sat,  3 Feb 2024 10:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SKKeQJwK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695A85D736
	for <linux-media@vger.kernel.org>; Sat,  3 Feb 2024 10:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706955367; cv=none; b=k+U8iRRA8ZoYUNXh7hOeMG+Y37YV4Q41ZCd5ZtMcngdmawMR1fyMeSWVbQ8T5JT+b50YKtwrOD1kTq1OR/GmJrXZyhU02LGC5gllioDWfGYgVb1eT7lOY/b/qJohqBOG+YaRqLcmTwj0T9LWMmNlFcIUd6cWsYt+gDyYwPI7clM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706955367; c=relaxed/simple;
	bh=PuQH1EQnxH/IZgKo9ugoUe5VvQF1ISuIU9Pfncpv2CU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCV3eXIsVUxjSoItDk84ggsg/d+GHMohKUYkpkNKTydxeSKErjDWVxnfAGiGhnApl55F5ijwcQULOE4waKkYUHdvtDNU2Hf/s1aHK8EWFxT4GIMW/9rO7yUzA1FrRSL/qiO39TtMO2UsbrffQx1QIaX0Z1GJSaIX46ZwLTN28tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SKKeQJwK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-66-167.net.vodafone.it [5.90.66.167])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C7EED04;
	Sat,  3 Feb 2024 11:14:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1706955273;
	bh=PuQH1EQnxH/IZgKo9ugoUe5VvQF1ISuIU9Pfncpv2CU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SKKeQJwKJMlaueVb+6xDCNsaLb2XIQulm0wBWlVnhCdlnceg84otcevBLSByd7cRf
	 xajyDH+xA430oJuxhHELWPZ/lxPBgtRxKAQm35rSySiEjBGNkuch/H94mf5q+ZVpL4
	 IgM95kI97/wHvIn+fQQr7c2HjG9xVda2j10hq+OE=
Date: Sat, 3 Feb 2024 11:15:49 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Rui Miguel Silva <rmfrfs@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 4/4] media: hi556: Add support for avdd regulator
Message-ID: <6mi7ua4rtzbi7quvlgiokzeduz7i2bpbbouq3pgunsgwmpr7wj@ocjmpkjpdu7n>
References: <20240201215841.153499-1-hdegoede@redhat.com>
 <20240201215841.153499-5-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240201215841.153499-5-hdegoede@redhat.com>

Hi Hans

On Thu, Feb 01, 2024 at 10:58:41PM +0100, Hans de Goede wrote:
> On some ACPI platforms, such as Chromebooks the ACPI methods to
> change the power-state (_PS0 and _PS3) fully take care of powering
> on/off the sensor.
>
> On other ACPI platforms, such as e.g. various HP models with IPU6 +
> hi556 sensor, the sensor driver must control the avdd regulator itself.
>
> Add support for having the driver control the sensor's avdd regulator.
> Note this relies on the regulator-core providing a dummy regulator
> (which it does by default) on platforms where Linux is not aware of
> the avdd regulator.
>

Please excuse the question from an ACPI illiterate, but does it mean
that, in example:
1) Chromebooks: you get a dummy
2) HP: you get an actual regulator reference

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/i2c/hi556.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
> index fb6ba6984e38..90eff282a6e2 100644
> --- a/drivers/media/i2c/hi556.c
> +++ b/drivers/media/i2c/hi556.c
> @@ -9,6 +9,7 @@
>  #include <linux/i2c.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-fwnode.h>
> @@ -638,6 +639,7 @@ struct hi556 {
>  	/* GPIOs, clocks, etc. */
>  	struct gpio_desc *reset_gpio;
>  	struct clk *clk;
> +	struct regulator *avdd;
>
>  	/* Current mode */
>  	const struct hi556_mode *cur_mode;
> @@ -1287,8 +1289,17 @@ static int hi556_suspend(struct device *dev)
>  {
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>  	struct hi556 *hi556 = to_hi556(sd);
> +	int ret;
>
>  	gpiod_set_value_cansleep(hi556->reset_gpio, 1);
> +
> +	ret = regulator_disable(hi556->avdd);
> +	if (ret) {
> +		dev_err(dev, "failed to disable avdd: %d\n", ret);
> +		gpiod_set_value_cansleep(hi556->reset_gpio, 0);

I understand in error paths you're supposed to reverse the previously
done operations, but, as this is a reset, isn't it better to keep the
reset enabled since we're suspending anyway ?

> +		return ret;
> +	}
> +
>  	clk_disable_unprepare(hi556->clk);
>  	return 0;
>  }
> @@ -1303,6 +1314,13 @@ static int hi556_resume(struct device *dev)
>  	if (ret)
>  		return ret;
>
> +	ret = regulator_enable(hi556->avdd);
> +	if (ret) {
> +		dev_err(dev, "failed to enable avdd: %d\n", ret);
> +		clk_disable_unprepare(hi556->clk);
> +		return ret;
> +	}
> +
>  	gpiod_set_value_cansleep(hi556->reset_gpio, 0);
>  	usleep_range(5000, 5500);
>  	return 0;
> @@ -1338,6 +1356,12 @@ static int hi556_probe(struct i2c_client *client)
>  		return dev_err_probe(&client->dev, PTR_ERR(hi556->clk),
>  				     "failed to get clock\n");
>
> +	/* The regulator core will provide a "dummy" regulator if necessary */
> +	hi556->avdd = devm_regulator_get(&client->dev, "avdd");
> +	if (IS_ERR(hi556->avdd))
> +		return dev_err_probe(&client->dev, PTR_ERR(hi556->avdd),
> +				     "failed to get avdd regulator\n");
> +
>  	full_power = acpi_dev_state_d0(&client->dev);
>  	if (full_power) {
>  		/* Ensure non ACPI managed resources are enabled */
> --
> 2.43.0
>
>

