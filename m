Return-Path: <linux-media+bounces-33413-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF3BAC4471
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 22:27:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB1201896C33
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 20:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9F223FC5A;
	Mon, 26 May 2025 20:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Si7jau0A"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB61C5661;
	Mon, 26 May 2025 20:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748291257; cv=none; b=QaP1buTPncbW95UjuBtMc+IHaNxZMlVmox1dgD9WEfJ6G5GQeYwq7wm+rXcXJP9CWL88sRNEpBLKgf6qB8xMUm2RtMqQyGTgconQGycan8OINkVMRxYm2VwFSLBqRUzJanB2SbArK9bBV7JdpYqKb4cNF2PaKz/gnXqa42yWXKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748291257; c=relaxed/simple;
	bh=Nh8/1K7ZMzQEZ4JcLGLb/L+95yin+HM+S+Ls4yNlAj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SxkGNnDdvNmvOZeNZZWM0vDQFzdTi8+jPmFhJEGM2wbxAoo3O3P90muN6wZ7njkTKELYmWvhDn3LHXt9wVdTWDF4roYp+oYR8RpZvaf2vAxo2q2uvyybU7MmYHpXwRfJXe5hlokuPySTmxh6ttO78ax0LgTXRpzZ787/ZzAige8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Si7jau0A; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748291255; x=1779827255;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Nh8/1K7ZMzQEZ4JcLGLb/L+95yin+HM+S+Ls4yNlAj8=;
  b=Si7jau0A1WNuLlv3rySPDfpEe0Dwp3e61AgnU89PCVHq7md42DJ4xKln
   CICwP7CuqIe9aEQ5QZ1Du4tpiT01XNO0UVUAtWU8Ojr8QLAw7EW1NVEo8
   CMfT4pUDnUR0O5ZIwgMmKo2AkyWofnPopFNZNfyAZtoVTlabBzjkI8Q7m
   H3TqTGSIGi9SzwbvvC5Hgj6hRuRDelw5Q26QeBfJco1lx3PjhTtBuEL1k
   LGXwFWyGCYshyg6Bk3+N6ugclQBPPBaTZmG0sj5iKIVmoEgBuiMEuq4kz
   k/QWOmDvSj8X6ksXbYG+r/MqHMtAz9G/yz3gi9Qg7/fVKeoqDLjPr893Q
   w==;
X-CSE-ConnectionGUID: gHFGn4JYTI60+6ilYAfM4A==
X-CSE-MsgGUID: 0PBHOQ2vR+K34u6luGX9Kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="60526574"
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; 
   d="scan'208";a="60526574"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 13:27:35 -0700
X-CSE-ConnectionGUID: 8t2yvuZYQUu/iUFasK6wdw==
X-CSE-MsgGUID: Rw7AFbqWSlionXRNBlu78g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; 
   d="scan'208";a="173431596"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.33])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 13:27:33 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9A1DB11FC38;
	Mon, 26 May 2025 23:27:29 +0300 (EEST)
Date: Mon, 26 May 2025 20:27:29 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v4 08/10] media: i2c: ov9282: add strobe_duration v4l2
 control
Message-ID: <aDTOsR_ctSsySEsr@kekkonen.localdomain>
References: <20250507-ov9282-flash-strobe-v4-0-72b299c1b7c9@linux.dev>
 <20250507-ov9282-flash-strobe-v4-8-72b299c1b7c9@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250507-ov9282-flash-strobe-v4-8-72b299c1b7c9@linux.dev>

Hi Richard,

On Wed, May 07, 2025 at 09:51:37AM +0200, Richard Leitner wrote:
> Add V4L2_CID_FLASH_DURATION support using the "strobe_frame_span"
> feature of the sensor. This is implemented by transforming the given µs
> value by an interpolated formula to a "span step width" value and
> writing it to register PWM_CTRL_25, PWM_CTRL_26, PWM_CTRL_27,
> PWM_CTRL_28 (0x3925, 0x3926, 0x3927, 0x3928).
> 
> The maximum control value is set to the period of the current default
> framerate.
> 
> All register values are based on the OV9281 datasheet v1.53 (jan 2019)
> and tested using an ov9281 VisionComponents module.
> 
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index b6de96997426f7225a061bfdc841aa062e8d0891..0bbdf08d7cda8f72e05fdc292aa69a4c821e4e03 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -97,6 +97,10 @@
>  #define OV9282_REG_MIPI_CTRL00	0x4800
>  #define OV9282_GATED_CLOCK	BIT(5)
>  
> +/* Flash/Strobe control registers */
> +#define OV9282_REG_FLASH_DURATION	0x3925
> +#define OV9282_FLASH_DURATION_DEFAULT	0x0000001A

Lower case hexadecimals are preferred.

> +
>  /* Input clock rate */
>  #define OV9282_INCLK_RATE	24000000
>  
> @@ -687,6 +691,25 @@ static int ov9282_set_ctrl_flash_led_mode(struct ov9282 *ov9282, int mode)
>  				current_val);
>  }
>  
> +static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, int value)

I'd use u32 for the value here.

> +{
> +	/*
> +	 * Calculate "strobe_frame_span" increments from a given value (µs).
> +	 * This is quite tricky as "The step width of shift and span is
> +	 * programmable under system clock domain.", but it's not documented
> +	 * how to program this step width (at least in the datasheet available
> +	 * to the author at time of writing).
> +	 * The formula below is interpolated from different modes/framerates
> +	 * and should work quite well for most settings.
> +	 */
> +	u32 val = value * 192 / (ov9282->cur_mode->width + ov9282->hblank_ctrl->val);
> +
> +	ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION, 1, (val >> 24) & 0xff);
> +	ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION + 1, 1, (val >> 16) & 0xff);
> +	ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION + 2, 1, (val >> 8) & 0xff);
> +	return ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION + 3, 1, val & 0xff);
> +}
> +
>  /**
>   * ov9282_set_ctrl() - Set subdevice control
>   * @ctrl: pointer to v4l2_ctrl structure
> @@ -756,6 +779,9 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>  	case V4L2_CID_FLASH_LED_MODE:
>  		ret = ov9282_set_ctrl_flash_led_mode(ov9282, ctrl->val);
>  		break;
> +	case V4L2_CID_FLASH_DURATION:
> +		ret = ov9282_set_ctrl_flash_duration(ov9282, ctrl->val);
> +		break;
>  	default:
>  		dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
>  		ret = -EINVAL;
> @@ -1346,7 +1372,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>  	u32 lpfr;
>  	int ret;
>  
> -	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 11);
> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
>  	if (ret)
>  		return ret;
>  
> @@ -1418,6 +1444,9 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>  			       (1 << V4L2_FLASH_LED_MODE_TORCH),
>  			       V4L2_FLASH_LED_MODE_NONE);
>  
> +	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
> +			  0, 13900, 1, 8);

It'd be nice to calculate the limits based on the relevant parameters
rather than use a hard-coded value here.

> +
>  	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
>  	if (!ret) {
>  		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */
> 

-- 
Regards,

Sakari Ailus

