Return-Path: <linux-media+bounces-47221-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F879C65804
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 18:31:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 90A5B28E93
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 17:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE88309EE4;
	Mon, 17 Nov 2025 17:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SrxtI/Ht"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949D8302776;
	Mon, 17 Nov 2025 17:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763400644; cv=none; b=qpwnf0NfQt43OOMc0kZ6K16VJjL3FWiNb8Oqc5a5HINl53y5BQt2wuGdoy43zAd7IbHq14kPMUdzlNJW1YKzG49Ncu3jz6zAgNn5+6Mmb+6vX4U04ZKIU8UreuZ4eD6PFM8nCnLVWd05JBI5qtLZOKvoIKWMsY3m1QA1Jy05VXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763400644; c=relaxed/simple;
	bh=nR2cjGoprCmwf4S7T7dO+OEe6zIU8l2rU9RUyoI9qi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SU3i6B1KJdN/R52vkY5kDJEEFJIwkphlG5v/CYrmk3vnfyDy57MbnQ86EV1je8V/Tb8BxxJeAdVRQnuQOH7/9DjLWvr3pg/wdtqmfCnzNcRUuIWWFrUPyHblRuTvDee1RZiF68X52YhnyNseJlS0tC6WTGGKCs9HXk49qDDwCgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SrxtI/Ht; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763400643; x=1794936643;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nR2cjGoprCmwf4S7T7dO+OEe6zIU8l2rU9RUyoI9qi0=;
  b=SrxtI/HtU96kuA5RwpRv4FHXtqLH9rbs7mbXNWHoSuQwTgBbSGtUBmm8
   UGR66qxC553ky7SJ0uhyymvMcYT80ZO3uEbiBi1ebU7sa7N7Q0LwQuy5A
   FPMnIBrAjw3Dkl+/uc8mny1C44y/GcgDX05YSQVnIY2q2eJXXTQ4InUyn
   2Dbsx220pXcwAl0KmP/Txss5iTbxpHjsqU/B/5sEYg2I6nTUhCSafgiu3
   lSt/19z1mARACToTYbhsPD/OELAUIEfTbMzSesmMRi3xQRKL3/bt/Wr44
   BILAhxQQ7YnNQd9rSpvVF2I1A2Cq9X7vOQe+gYFXVrZADIfQGECHx7hKo
   A==;
X-CSE-ConnectionGUID: um25IIfrQl2Nn/m9blc/zQ==
X-CSE-MsgGUID: 99rPy7XlTzyPIL+07Fva8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="69275707"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="69275707"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 09:30:41 -0800
X-CSE-ConnectionGUID: Xl/AtU1PSSyudnJx6rdLZg==
X-CSE-MsgGUID: QlpWCE35SdagwT3LT28UqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="227843748"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 09:30:39 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 15C5911FA5E;
	Mon, 17 Nov 2025 19:30:40 +0200 (EET)
Date: Mon, 17 Nov 2025 19:30:40 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
	dave.stevenson@raspberrypi.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mchehab@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v3 1/4] media: i2c: ov9282: Fix reset-gpio logical state
Message-ID: <aRtbwK0Afo50Lh0B@kekkonen.localdomain>
References: <20251114133822.434171-1-loic.poulain@oss.qualcomm.com>
 <20251114133822.434171-2-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114133822.434171-2-loic.poulain@oss.qualcomm.com>

Hi Loic,

On Fri, Nov 14, 2025 at 02:38:19PM +0100, Loic Poulain wrote:
> Ensure reset state is low in the power-on state and high in the
> power-off state (assert reset). Note that the polarity is abstracted
> by the GPIO subsystem, so the logic level reflects the intended reset
> behavior.

That's an interesting approach to fix DTS gone systematically wrong.

I was thinking of the drivers that have this issue, too, but I would have
introduced a new GPIO under a different name (many sensors use "enable",
too). Any thoughts?

Cc Laurent.

> 
> To maintain backward compatibility with DTS files that use an incorrect
> flag, we implement a mechanism similar to:
>   commit 738455858a2d ("ASoC: codecs: wsa881x: Use proper shutdown GPIO polarity")
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/media/i2c/ov9282.c | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index a9f6176e9729..e79b326cdd94 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -160,6 +160,7 @@ struct ov9282_mode {
>   * @sd: V4L2 sub-device
>   * @pad: Media pad. Only one pad supported
>   * @reset_gpio: Sensor reset gpio
> + * @reset_gpio_val: Logical value to reset the sensor
>   * @inclk: Sensor input clock
>   * @supplies: Regulator supplies for the sensor
>   * @ctrl_handler: V4L2 control handler
> @@ -180,6 +181,7 @@ struct ov9282 {
>  	struct v4l2_subdev sd;
>  	struct media_pad pad;
>  	struct gpio_desc *reset_gpio;
> +	unsigned int reset_gpio_val;
>  	struct clk *inclk;
>  	struct regulator_bulk_data supplies[OV9282_NUM_SUPPLIES];
>  	struct v4l2_ctrl_handler ctrl_handler;
> @@ -1127,13 +1129,29 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
>  
>  	/* Request optional reset pin */
>  	ov9282->reset_gpio = devm_gpiod_get_optional(ov9282->dev, "reset",
> -						     GPIOD_OUT_LOW);
> +						     GPIOD_OUT_HIGH);
>  	if (IS_ERR(ov9282->reset_gpio)) {
>  		dev_err(ov9282->dev, "failed to get reset gpio %ld",
>  			PTR_ERR(ov9282->reset_gpio));
>  		return PTR_ERR(ov9282->reset_gpio);
>  	}
>  
> +	/*
> +	 * Backwards compatibility work-around.
> +	 *
> +	 * The reset GPIO is active-low, but the driver has always used the
> +	 * gpiod API with inverted logic. As a result, the DTS had to
> +	 * incorrectly mark the GPIO as active-high to compensate for this
> +	 * behavior. Changing the flag in the driver now would break backward
> +	 * compatibility with existing DTS configurations. To address this,
> +	 * we add a simple value inversion so the driver works with both old
> +	 * and new DTS.
> +	 */
> +	ov9282->reset_gpio_val = gpiod_is_active_low(ov9282->reset_gpio);
> +	if (!ov9282->reset_gpio_val)
> +		dev_warn(ov9282->dev, "Using ACTIVE_HIGH for reset GPIO. Your DTB might be outdated\n");
> +	gpiod_set_value_cansleep(ov9282->reset_gpio, ov9282->reset_gpio_val);
> +
>  	/* Get sensor input clock */
>  	ov9282->inclk = devm_v4l2_sensor_clk_get(ov9282->dev, NULL);
>  	if (IS_ERR(ov9282->inclk))
> @@ -1237,7 +1255,7 @@ static int ov9282_power_on(struct device *dev)
>  
>  	usleep_range(400, 600);
>  
> -	gpiod_set_value_cansleep(ov9282->reset_gpio, 1);
> +	gpiod_set_value_cansleep(ov9282->reset_gpio, !ov9282->reset_gpio_val);
>  
>  	ret = clk_prepare_enable(ov9282->inclk);
>  	if (ret) {
> @@ -1260,7 +1278,7 @@ static int ov9282_power_on(struct device *dev)
>  error_clk:
>  	clk_disable_unprepare(ov9282->inclk);
>  error_reset:
> -	gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
> +	gpiod_set_value_cansleep(ov9282->reset_gpio, ov9282->reset_gpio_val);
>  
>  	regulator_bulk_disable(OV9282_NUM_SUPPLIES, ov9282->supplies);
>  
> @@ -1278,7 +1296,7 @@ static int ov9282_power_off(struct device *dev)
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>  	struct ov9282 *ov9282 = to_ov9282(sd);
>  
> -	gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
> +	gpiod_set_value_cansleep(ov9282->reset_gpio, ov9282->reset_gpio_val);
>  
>  	clk_disable_unprepare(ov9282->inclk);
>  

-- 
Kind regards,

Sakari Ailus

