Return-Path: <linux-media+bounces-41482-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50571B3F04C
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 23:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BE754E0067
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 21:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5990D258CF8;
	Mon,  1 Sep 2025 21:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n4xoN0W7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD25A32F75A;
	Mon,  1 Sep 2025 21:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756760816; cv=none; b=hccPUF3JjDbS41O9/YgX+nFKg2YfqAy3f5H3UFCj60hbXwm8ahujBGdH0mLNglm7VlVCngH/IMrAb0x2DU1Js8ciqWORrAjoMUmAvIF9bSWzqq71eZ//UpREKXYkfHMSqCd7EfZIVVNXfDzuuXIdIne3MbIerf1mBihr0ieB30E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756760816; c=relaxed/simple;
	bh=Ti4l8zkyu2kAQ5JGXLo2hb4sSkO72W5d4bHIkOmiLtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B4wC3mmgrWTtTS3qjHVVZ8LNg+QewisKTZLOrMVj5B0tN0kIOUc+Wj681Pi+SIXUyEw9vS3AYm7f+5W54Xa+eAS800ActZ94+mEdX3YsNq3lf07FlwVXXg8HWy/em+uyl7PWkrzcZBQebUFrKP2od7wLa/syMYtTfNkrq5J6SGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n4xoN0W7; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756760814; x=1788296814;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Ti4l8zkyu2kAQ5JGXLo2hb4sSkO72W5d4bHIkOmiLtI=;
  b=n4xoN0W7J+FibJMLiC/GL8c4trXrIYsE0Yrr2zH+b03G9xiTAi7XSfhV
   jH/F9wUxQ/tBnjmlUADKal6A51fOd3uY64f7bCBzS9+uGCezFBZyx/NOF
   UTvfqLTp+j59kIguFLhskPMiClmS18Ynn4dZT2vbpjqiZ/HModYuRLxMQ
   AMQD2Wk3KhgROf9RjcsMtWg0+t27qzx33AibOuyUZT0f9NQPVtg4Z9+ry
   zzcbiFY7nisORf/acXYrQrVvwW1f9QX37f9GM+ABVQoGeIx7oyBMSK9gU
   fsiYHbvTEQiLn2zf+lKvmrTcXNoaCbXRtkofqX8bHs9Vdi04xSt3bdrbn
   w==;
X-CSE-ConnectionGUID: yzTFga2cQPqSgufUDmh7Fg==
X-CSE-MsgGUID: fVnD4anLQLixV8XLeEzjcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58050932"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58050932"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 14:06:54 -0700
X-CSE-ConnectionGUID: WVA8sPPJRB+YFDHqKNrfuQ==
X-CSE-MsgGUID: uxXGUX42ToekTb2eJN9zWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170369465"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.254])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 14:06:50 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 209DF11F739;
	Tue, 02 Sep 2025 00:06:46 +0300 (EEST)
Date: Tue, 2 Sep 2025 00:06:46 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v7 09/10] media: i2c: ov9282: implement try_ctrl for
 strobe_duration
Message-ID: <aLYK5v0zYYSAdiiH@kekkonen.localdomain>
References: <20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev>
 <20250901-ov9282-flash-strobe-v7-9-d58d5a694afc@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250901-ov9282-flash-strobe-v7-9-d58d5a694afc@linux.dev>

Hi Richard,

On Mon, Sep 01, 2025 at 05:05:14PM +0200, Richard Leitner wrote:
> As the granularity of the hardware supported values is lower than the
> control value, implement a try_ctrl() function for
> V4L2_CID_FLASH_DURATION. This function calculates the nearest possible
> µs strobe duration for the given value and returns it back to the
> caller.
> 
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 54 ++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 52 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 9efc82a1929a76c6fb245e7dbfb5276a133d1c5d..b104ae77f00e9e7777342e48b7bf3caa6d297f69 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -128,6 +128,8 @@
>  #define OV9282_REG_MIN		0x00
>  #define OV9282_REG_MAX		0xfffff
>  
> +#define OV9282_STROBE_SPAN_FACTOR	192
> +
>  static const char * const ov9282_supply_names[] = {
>  	"avdd",		/* Analog power */
>  	"dovdd",	/* Digital I/O power */
> @@ -691,7 +693,7 @@ static int ov9282_set_ctrl_flash_hw_strobe_signal(struct ov9282 *ov9282, bool en
>  				current_val);
>  }
>  
> -static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, u32 value)
> +static u32 ov9282_us_to_flash_duration(struct ov9282 *ov9282, u32 value)
>  {
>  	/*
>  	 * Calculate "strobe_frame_span" increments from a given value (µs).
> @@ -702,7 +704,27 @@ static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, u32 value)
>  	 * The formula below is interpolated from different modes/framerates
>  	 * and should work quite well for most settings.
>  	 */
> -	u32 val = value * 192 / (ov9282->cur_mode->width + ov9282->hblank_ctrl->val);
> +	u32 frame_width = ov9282->cur_mode->width + ov9282->hblank_ctrl->val;
> +
> +	return value * OV9282_STROBE_SPAN_FACTOR / frame_width;
> +}
> +
> +static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
> +{
> +	/*
> +	 * As the calculation in ov9282_us_to_flash_duration uses an integer
> +	 * divison calculate in ns here to get more precision. Then check if
> +	 * we need to compensate that divison by incrementing the µs result.
> +	 */
> +	u32 frame_width = ov9282->cur_mode->width + ov9282->hblank_ctrl->val;
> +	u64 ns = value * 1000 * frame_width / OV9282_STROBE_SPAN_FACTOR;
> +
> +	return DIV_ROUND_UP(ns, 1000);
> +}
> +
> +static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, u32 value)
> +{
> +	u32 val = ov9282_us_to_flash_duration(ov9282, value);
>  
>  	ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION, 1, (val >> 24) & 0xff);
>  	ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION + 1, 1, (val >> 16) & 0xff);
> @@ -792,9 +814,37 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>  	return ret;
>  }
>  
> +static int ov9282_try_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct ov9282 *ov9282 =
> +		container_of(ctrl->handler, struct ov9282, ctrl_handler);

container_of_const(), please.

> +
> +	if (ctrl->id == V4L2_CID_FLASH_DURATION) {
> +		u32 fd = ov9282_us_to_flash_duration(ov9282, ctrl->val);
> +		u32 us = ctrl->val;

You could use us as argument to ov9282_us_to_flash_duration() if you switch
the order.

> +
> +		/* get nearest strobe_duration value */
> +		u32 us0 = ov9282_flash_duration_to_us(ov9282, fd);
> +		u32 us1 = ov9282_flash_duration_to_us(ov9282, (fd + 1));

Redundant parentheses.

> +
> +		if (abs(us1 - us) < abs(us - us0))
> +			ctrl->val = us1;
> +		else
> +			ctrl->val = us0;
> +
> +		if (us != ctrl->val) {
> +			dev_dbg(ov9282->dev, "using next valid strobe_duration %u instead of %u\n",
> +				ctrl->val, us);
> +		}

Redundant braces.

> +	}
> +
> +	return 0;
> +}
> +
>  /* V4l2 subdevice control ops*/
>  static const struct v4l2_ctrl_ops ov9282_ctrl_ops = {
>  	.s_ctrl = ov9282_set_ctrl,
> +	.try_ctrl = ov9282_try_ctrl,
>  };
>  
>  /**
> 

-- 
Kind regards,

Sakari Ailus

