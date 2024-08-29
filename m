Return-Path: <linux-media+bounces-17142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 794C2964651
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 15:19:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 307DB285F23
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 13:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D0A01A7047;
	Thu, 29 Aug 2024 13:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pRN/Jypv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FADF15E5C0;
	Thu, 29 Aug 2024 13:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724937584; cv=none; b=tVHAp8hoZ4xP3t8SOFslxHhpAqJ2mk3xyJOdHcO6glX9S2T+V+rfTQzvQhuAsGyr6Q/S+/+vyHscCNk0CSSbHkHv/241o/DJJ6GaK1tDAT52FF9t/NatTOnlHUJKzc4lgBZXGfEghG97ejuQn/71IPtePQh1YKeumhtOxXLHqzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724937584; c=relaxed/simple;
	bh=U1x/6vWB/VwHeIq5gLVZEAqrC70qrOF+f0nyAxlDf4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mdg2hPHRf5Ru7juxG5y3IJYULhUZNjF6QLiQSQ68p1snbm+ZZWIYo1WfyAhn4jOTSdPp4P2wKMz1PjtaZXtOjFw5hDLrHBgiKnqBtfcUQ2mRRnTvkx7VDvjfJkOF6EDiQI04lGyyNnCsWRA5PNn0PjrYH+IfxzF5c95oi3lgRh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pRN/Jypv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C33F9226;
	Thu, 29 Aug 2024 15:18:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724937512;
	bh=U1x/6vWB/VwHeIq5gLVZEAqrC70qrOF+f0nyAxlDf4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pRN/JypvBGrnipi1QoII8KV8uVbni2KqZBS6Kv1vbSNnZlP9MA8tT+haIBeXcIHUj
	 aplM6bdvUKkW0ZZgRD+JvONlxPev/l2puL6YK0hhEKMg2v/ixOmGErSNzXy5lr6STw
	 9cRlPya0lWLWBix3WtpvB1+W0gwkMTQsl1J0/X/I=
Date: Thu, 29 Aug 2024 16:19:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Benjamin Bara <bbara93@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Benjamin Bara <benjamin.bara@skidata.com>
Subject: Re: [PATCH v2 1/2] media: i2c: imx290: Check for availability in
 probe()
Message-ID: <20240829131909.GD12951@pendragon.ideasonboard.com>
References: <20240828-imx290-avail-v2-0-bd320ac8e8fa@skidata.com>
 <20240828-imx290-avail-v2-1-bd320ac8e8fa@skidata.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828-imx290-avail-v2-1-bd320ac8e8fa@skidata.com>

Hi Benjamin,

Thank you for the patch.

On Wed, Aug 28, 2024 at 08:13:07PM +0200, Benjamin Bara wrote:
> Currently, the V4L2 subdevice is also created when the device is not
> available/connected. In this case, dmesg shows the following:
> 
> [   10.419510] imx290 7-001a: Error writing reg 0x301c: -6
> [   10.428981] imx290 7-001a: Error writing reg 0x3020: -6
> [   10.442712] imx290 7-001a: Error writing reg 0x3018: -6
> [   10.454018] imx290 7-001a: Error writing reg 0x3020: -6
> 
> which seems to come from imx290_ctrl_update() after the subdev init is
> finished.

I think this should also be fixed. There should be no need to write
those registers at probe time. Would moving the
pm_runtime_mark_last_busy() and pm_runtime_put_autosuspend() calls to
just before imx290_subdev_init() help ?

> However, as the errors are ignored, the subdev is initialized
> but simply does not work. From userspace perspective, there is no
> visible difference between a working and not-working subdevice (except
> when trying it out or watching for the error message).
> 
> This commit adds a simple availability check before starting with the
> subdev initialization to error out instead.
> 
> Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> ---
> Changes since v1:
> - define operating/standby mode and use it
> - read out the standby mode during probe and ensure it is standby
> ---
>  drivers/media/i2c/imx290.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 4150e6e4b9a6..2a869576600c 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -29,6 +29,8 @@
>  #include <media/v4l2-subdev.h>
>  
>  #define IMX290_STANDBY					CCI_REG8(0x3000)
> +#define IMX290_STANDBY_OPERATING			(0 << 0)
> +#define IMX290_STANDBY_STANDBY				(1 << 0)

The datasheet documents the STANDBY field as a single bit, but doesn't
mention an OPERATING value. I would match that, drop
IMX290_STANDBY_OPERATING and write

#define IMX290_STANDBY_STANDBY				BIT(0)

>  #define IMX290_REGHOLD					CCI_REG8(0x3001)
>  #define IMX290_XMSTA					CCI_REG8(0x3002)
>  #define IMX290_ADBIT					CCI_REG8(0x3005)
> @@ -1016,7 +1018,7 @@ static int imx290_start_streaming(struct imx290 *imx290,
>  		return ret;
>  	}
>  
> -	cci_write(imx290->regmap, IMX290_STANDBY, 0x00, &ret);
> +	cci_write(imx291->regmap, IMX290_STANDBY, IMX290_STANDBY_OPERATING, &ret);

This hunk would then be dropped.

>  
>  	msleep(30);
>  
> @@ -1029,7 +1031,7 @@ static int imx290_stop_streaming(struct imx290 *imx290)
>  {
>  	int ret = 0;
>  
> -	cci_write(imx290->regmap, IMX290_STANDBY, 0x01, &ret);
> +	cci_write(imx290->regmap, IMX290_STANDBY, IMX290_STANDBY_STANDBY, &ret);

And this looks fine.

The change isn't mentioned in the commit message though. I wouldn't ask
for a v3 just to split this, but as you need to address other issues, it
would be nice to have a separate patch in v3.

>  
>  	msleep(30);
>  
> @@ -1520,6 +1522,7 @@ static int imx290_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	struct imx290 *imx290;
> +	u64 val;
>  	int ret;
>  
>  	imx290 = devm_kzalloc(dev, sizeof(*imx290), GFP_KERNEL);
> @@ -1580,6 +1583,16 @@ static int imx290_probe(struct i2c_client *client)
>  	pm_runtime_set_autosuspend_delay(dev, 1000);
>  	pm_runtime_use_autosuspend(dev);
>  
> +	/* Make sure the sensor is available before V4L2 subdev init. */
> +	ret = cci_read(imx290->regmap, IMX290_STANDBY, &val, NULL);

I still wish we had an ID register, but so be it.

> +	if (ret)

Maybe add

		ret = dev_err_probe(dev, -ENODEV, "Failed to detect sensor\n");

or something similar ? Up to you.

> +		goto err_pm;
> +	if (val != IMX290_STANDBY_STANDBY) {

I think this check could be dropped though. If the sensor isn't present
or doesn't respond to I2C reads for any other reason, cci_read() will
fail.

> +		dev_err(dev, "Sensor is not in standby mode\n");
> +		ret = -ENODEV;
> +		goto err_pm;
> +	}
> +

My last concern is about accessing hardware at probe time. There are
known cases where this is problematic. They can be split in two
categories, systems that exhibit unwanted side effects when powering the
sensor up, and systems where the sensor can't be accessed at probe time.

The two issues I can think of in the first category is devices that have
a camera privacy light that could cause worries among users if it
flashes at boot time, and devices that agressively optimize boot time.

In the second category, I know that some people use camera serdes
(FPD-Link, GMSL, ...) that are controlled by userspace. As they should
instead use kernel drivers for those components, upstream may not care
too much about this use case. Another issue I was told about was a
device booting in temperatures that were too low for the camera to
operate, which then needed half an hour to heat the device enclosure
before the sensor and serdes could be accessed. That's a bit extreme,
but it sounds like a valid use case to me.

What do we do with those cases ? Detecting devices at probe time does
have value, so I think it should be a policy decision. We may want to
convey some of that information through DT properties (I'm not sure what
would be acceptable there though). In any case, that's quite a bit of
yak shaving, so I'm inclined to accept this series (or rather its next
version), given that quite a few other camera sensor drivers detect the
device at probe time. I would however like feedback on the problem to
try and find a good solution.

>  	/* Initialize the V4L2 subdev. */
>  	ret = imx290_subdev_init(imx290);
>  	if (ret)
> 

-- 
Regards,

Laurent Pinchart

