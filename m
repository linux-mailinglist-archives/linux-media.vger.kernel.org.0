Return-Path: <linux-media+bounces-33414-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEFEAC4483
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 22:41:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EAFAF7AB324
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 20:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B79DA241105;
	Mon, 26 May 2025 20:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y9yG2rVK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575A31DF97F;
	Mon, 26 May 2025 20:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748292076; cv=none; b=Bfhp0MUFKvoXP1v8Kc7LroiKMAe6HlwBlwS1EMpDG9V81D70lICCVi2E8dwNkKyE8XkM/3yy1dP/MrbIgrfFwNEZSkZbBq1rE0GZb/COg+MTsMUpSWiP+vFCKa8VyeyPiYEUdDnFr0+luDap2qJnpU9wH/5aW10L8EUaXmAHk5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748292076; c=relaxed/simple;
	bh=DdduRr9td+u2BBffEZ3WM/3w/57lanFQ09Acm8f3RgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D5DVMdLCBjyHMswUXKMRrmGT/azrXpNFR2QbEICe3lUowWm7NrqqGax/hpl2AqwJxQFd+uO4sUqb7zM6ND/t3q/mKCraGzXCRYWwwNTIcIvWcA2VAQ4Gf7iHTGl/kGFuaFhYjj/HV4DxkCmGE+c9HeAq5/yKpdMq+9ZzvZT3YxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y9yG2rVK; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748292075; x=1779828075;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DdduRr9td+u2BBffEZ3WM/3w/57lanFQ09Acm8f3RgM=;
  b=Y9yG2rVKMoLl1hHFENX0tSkMdNK8Wb0DXtUzSTOfw0anYa+lttbAm6+x
   ixmFNYR7Mn1mVG0aDo/NSnmZBEDK6YMai/+F6zhXyfztJswp7OHnXPx0u
   lG+g5+bgz9CEig2HrG14mTrVkSHB/eBFGQbfREsWrB0OxuohcWBV3sB/o
   yRQ3U+G0xqWvpf7w5yxKTMRGp5thRIHW/dMhcXqeINDuWT/KvUMWcpfyy
   732teOcwekH0OJL7RgI1TX48FOIwqHO7HrkinuGWQnb7uPlKHsghQMBsp
   WTho4HQ1EfBfgxFnCNAjdp3ZVOcEdWP7vYst/20u32rE6DoMnhxuHhrzb
   Q==;
X-CSE-ConnectionGUID: mGJleZfYR3OAePUYalhqrQ==
X-CSE-MsgGUID: HMkiVqjmToyPOhQXzmloSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="72801051"
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; 
   d="scan'208";a="72801051"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 13:41:14 -0700
X-CSE-ConnectionGUID: /rZuVg9BSk+SMLA/dCLwGQ==
X-CSE-MsgGUID: ZDzE5rA4TZ2vk6bNSTZxfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; 
   d="scan'208";a="142966046"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.33])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 13:41:11 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 92DCF11FC8C;
	Mon, 26 May 2025 23:41:08 +0300 (EEST)
Date: Mon, 26 May 2025 20:41:08 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v4 07/10] media: i2c: ov9282: add led_mode v4l2 control
Message-ID: <aDTR5JrYIvj2gxHR@kekkonen.localdomain>
References: <20250507-ov9282-flash-strobe-v4-0-72b299c1b7c9@linux.dev>
 <20250507-ov9282-flash-strobe-v4-7-72b299c1b7c9@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507-ov9282-flash-strobe-v4-7-72b299c1b7c9@linux.dev>

Hi Richard,

On Wed, May 07, 2025 at 09:51:36AM +0200, Richard Leitner wrote:
> Add V4L2_CID_FLASH_LED_MODE support using the "strobe output enable"
> feature of the sensor. This implements following modes:

The flash LED mode control is, well, setting the flash LED mode. There's no
LED on the sensor so I think I'd add a new control for this.

I'd call it V4L2_FLASH_LED_STROBE_ENABLE, and make it a boolean control.

(My apologies for not giving a better review for this set earlier on.)

How does this sensor make use the information? E.g. what's the latching
point this setting in relation to a given frame?

> 
>  - V4L2_FLASH_LED_MODE_NONE, which disables the strobe output
>  - V4L2_FLASH_LED_MODE_FLASH, which enables the strobe output
> 
> All values are based on the OV9281 datasheet v1.53 (january 2019) and
> tested using an ov9281 VisionComponents module.
> 
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index f42e0d439753e74d14e3a3592029e48f49234927..b6de96997426f7225a061bfdc841aa062e8d0891 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -670,6 +670,23 @@ static int ov9282_set_ctrl_vflip(struct ov9282 *ov9282, int value)
>  				current_val);
>  }
>  
> +static int ov9282_set_ctrl_flash_led_mode(struct ov9282 *ov9282, int mode)
> +{
> +	u32 current_val;
> +	int ret = ov9282_read_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1,
> +				  &current_val);
> +	if (ret)
> +		return ret;
> +
> +	if (mode == V4L2_FLASH_LED_MODE_FLASH)
> +		current_val |= OV9282_OUTPUT_ENABLE6_STROBE;
> +	else
> +		current_val &= ~OV9282_OUTPUT_ENABLE6_STROBE;
> +
> +	return ov9282_write_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1,
> +				current_val);
> +}
> +
>  /**
>   * ov9282_set_ctrl() - Set subdevice control
>   * @ctrl: pointer to v4l2_ctrl structure
> @@ -736,6 +753,9 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>  		ret = ov9282_write_reg(ov9282, OV9282_REG_TIMING_HTS, 2,
>  				       (ctrl->val + ov9282->cur_mode->width) >> 1);
>  		break;
> +	case V4L2_CID_FLASH_LED_MODE:
> +		ret = ov9282_set_ctrl_flash_led_mode(ov9282, ctrl->val);
> +		break;
>  	default:
>  		dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
>  		ret = -EINVAL;
> @@ -1326,7 +1346,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>  	u32 lpfr;
>  	int ret;
>  
> -	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 11);
>  	if (ret)
>  		return ret;
>  
> @@ -1391,6 +1411,13 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>  						OV9282_TIMING_HTS_MAX - mode->width,
>  						1, hblank_min);
>  
> +	/* Flash/Strobe controls */
> +	v4l2_ctrl_new_std_menu(ctrl_hdlr, &ov9282_ctrl_ops,
> +			       V4L2_CID_FLASH_LED_MODE,
> +			       V4L2_FLASH_LED_MODE_TORCH,
> +			       (1 << V4L2_FLASH_LED_MODE_TORCH),
> +			       V4L2_FLASH_LED_MODE_NONE);
> +
>  	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
>  	if (!ret) {
>  		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */
> 

-- 
Regards,

Sakari Ailus

