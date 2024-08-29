Return-Path: <linux-media+bounces-17091-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B07D963C29
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 09:05:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1A182859BB
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 07:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB49015C12F;
	Thu, 29 Aug 2024 07:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bOEGwti1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF08146000;
	Thu, 29 Aug 2024 07:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724915142; cv=none; b=QxbFuhUSDdZ49ruvE3I95CCH7nMUUzS+dPpS+kNXraYveJ1+8ydLeZiLwufCBIc7GmlPxH9QDQ+dEbLVGLHPtKvHlThFRrx3/bjcsnxfQCc3P6qnFZIsavUPdJYtzTrTY7c0CQkZXIvIZgde2Cf4e+5dq884sGFL9u5A/Pd/aQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724915142; c=relaxed/simple;
	bh=9TMnyHQT916Qgiu1O4+YLK4uZ0bhoFLAT+IJEiIT/yI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dCludNr2tJBfwkryW5mweOoiq4WVvFmTGo395BHVW1QCrjpA7Zfr4Sp/kFOvcGzbWiJXKTwFPc4Pmt/E3XCimA0QT5as+2R3saabgCgg/18/9FXj0Xj7pl/5WV21aeP426DFfAkXTXEoXDrEx6J20ps9xPqqJi3ch4wkj4mP/SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bOEGwti1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724915140; x=1756451140;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9TMnyHQT916Qgiu1O4+YLK4uZ0bhoFLAT+IJEiIT/yI=;
  b=bOEGwti1rONkE4yH0YbydJnB3M6WZUkhB0RO9v3s8k70u1g54G45NB+T
   qdx+KAuXPnnoX2rh8LXSVFyn0wTDoUE1jXuLht1jJocYXzB1ap+gNNVGG
   mlqJ+rPdpMYjXKZo0zxU21iWai+I57mRW725nDkVJtrMfk2bvEqZmqQOu
   w1jajNhAJ88EcEvQP6p57bTnyZR9bn136n9L7xJoWm2fWn7vxDnby+ryg
   rktd3oRZwvdDy/asVR+GBo6NgKBT+76/ri6udBXi3vS2jKI39VwiIQWwB
   nFIMzHEnttFFJspnwxlsTHoh/Oizi1TvfpEHJsfSTqbBua6IjcO2jXs2G
   w==;
X-CSE-ConnectionGUID: D9JMAVShQIaR7/dw8/+uRg==
X-CSE-MsgGUID: q2RSXYa8SGiTN5cFYJTZaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="27279340"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="27279340"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 00:05:39 -0700
X-CSE-ConnectionGUID: rM2t2ccgQEqehzfI3/XrWQ==
X-CSE-MsgGUID: bW81fn1KQROisXZaX0joYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="100999121"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 00:05:38 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C50F811FA32;
	Thu, 29 Aug 2024 10:05:34 +0300 (EEST)
Date: Thu, 29 Aug 2024 07:05:34 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Benjamin Bara <bbara93@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Benjamin Bara <benjamin.bara@skidata.com>
Subject: Re: [PATCH v2 1/2] media: i2c: imx290: Check for availability in
 probe()
Message-ID: <ZtAdvtkjr0XNbvmu@kekkonen.localdomain>
References: <20240828-imx290-avail-v2-0-bd320ac8e8fa@skidata.com>
 <20240828-imx290-avail-v2-1-bd320ac8e8fa@skidata.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828-imx290-avail-v2-1-bd320ac8e8fa@skidata.com>

Hi Benjamin,

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
> finished. However, as the errors are ignored, the subdev is initialized
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
>  #define IMX290_REGHOLD					CCI_REG8(0x3001)
>  #define IMX290_XMSTA					CCI_REG8(0x3002)
>  #define IMX290_ADBIT					CCI_REG8(0x3005)
> @@ -1016,7 +1018,7 @@ static int imx290_start_streaming(struct imx290 *imx290,
>  		return ret;
>  	}
>  
> -	cci_write(imx290->regmap, IMX290_STANDBY, 0x00, &ret);
> +	cci_write(imx290->regmap, IMX290_STANDBY, IMX290_STANDBY_OPERATING, &ret);

Please run

	./scripts/checkpatch.pl --strict --max-line-length=80

the next time. I'll wrap the line this time.

>  
>  	msleep(30);
>  
> @@ -1029,7 +1031,7 @@ static int imx290_stop_streaming(struct imx290 *imx290)
>  {
>  	int ret = 0;
>  
> -	cci_write(imx290->regmap, IMX290_STANDBY, 0x01, &ret);
> +	cci_write(imx290->regmap, IMX290_STANDBY, IMX290_STANDBY_STANDBY, &ret);
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
> +	if (ret)
> +		goto err_pm;
> +	if (val != IMX290_STANDBY_STANDBY) {
> +		dev_err(dev, "Sensor is not in standby mode\n");
> +		ret = -ENODEV;
> +		goto err_pm;
> +	}
> +
>  	/* Initialize the V4L2 subdev. */
>  	ret = imx290_subdev_init(imx290);
>  	if (ret)
> 

-- 
Kind regards,

Sakari Ailus

