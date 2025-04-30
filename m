Return-Path: <linux-media+bounces-31378-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 613E6AA455D
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 10:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D2249A46D1
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 08:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D2921C9F3;
	Wed, 30 Apr 2025 08:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZxuCi3Eg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27F921C192;
	Wed, 30 Apr 2025 08:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746001668; cv=none; b=Qy5YkeIqvkKicdR9e0pTDN5O/TzR8Fxyv3HaZfOtQwWEsDdqB91MrmLhxqjm9vWjb6IACHOGmme1pkt3FQqQwZn/U4ZHnihVVRjGNiTlbdhQgC3wK0mAe45bNycL5qcu9pLo1R8CuIrbVbTBBIU8tepPYx/gJrUL+aWt7bbdU+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746001668; c=relaxed/simple;
	bh=1ajhych4dIHqm2r+oPn9BP8t6MqW579K9pobXMlt7/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R4rSrOKADM6IFborZ0wpyl/3Vr473t1ubwmNuYZagN6Bo7fs7wc7FTHkxcJ+jOAtRjwH5yyAVR45mwdJpNo/K/Wqt5YD7WWUNqoxsHy1D20vI185n+pLMhmU58E+EaYwYFkAB8FQYUhtT/injAO85gkiqVqzQuFKNMSYpxI+2Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZxuCi3Eg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746001667; x=1777537667;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=1ajhych4dIHqm2r+oPn9BP8t6MqW579K9pobXMlt7/0=;
  b=ZxuCi3EgP4NgzJU9mD2OuDHbUBkqE39vE7J5kv8QijXj7LpZVbpQs2SL
   lIRuyfKi/jynQ7boBOWnGQSezjro9XsTk4wi2cflXNx6ZMZgy4QH5VWkX
   fx+sAhBgGg5xOU91Cl6NCMQ8f7nGmTc0oefBDwxT48ng9pE7ZjSjX5a1Z
   Gytn8dw0Tq0hiX0v7doj7EXcIA9+95TkGXq45kOXDASBv6PVjdJY86BQP
   Mi2i1hSdqa/uDZCdSA2QObKSTmqaSZ+C5MkBJ8aAgPQ7zm500cmwf+vso
   flMz3RwPMmTUSzYxEzSqAyFYn6tDDi6jrIJOS8k1xr8P99T0/CP+HSWwb
   w==;
X-CSE-ConnectionGUID: KXTPJBA+SEGo86cMg8+EGw==
X-CSE-MsgGUID: VgE0Zzl1RMO48n9We3fR/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="59027743"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="59027743"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 01:27:46 -0700
X-CSE-ConnectionGUID: ywYNeeGrQsyke34kyLRaBg==
X-CSE-MsgGUID: KxgODg1PT/e7Ko7+LzMAkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="133964071"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 01:27:44 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E9C0A120765;
	Wed, 30 Apr 2025 11:27:39 +0300 (EEST)
Date: Wed, 30 Apr 2025 08:27:39 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 8/9] media: i2c: ov9282: add strobe_duration v4l2
 control
Message-ID: <aBHe-55_U3bYTXyG@kekkonen.localdomain>
References: <20250429-ov9282-flash-strobe-v3-0-2105ce179952@linux.dev>
 <20250429-ov9282-flash-strobe-v3-8-2105ce179952@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250429-ov9282-flash-strobe-v3-8-2105ce179952@linux.dev>

Hi Richard,

On Tue, Apr 29, 2025 at 02:59:13PM +0200, Richard Leitner wrote:
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
>  drivers/media/i2c/ov9282.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 35edbe1e0efb61a0e03da0ed817c4c4ec0ae9c35..5ddbfc51586111fbd2e17b739fb3d28bfb0aee1e 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -97,6 +97,10 @@
>  #define OV9282_REG_MIPI_CTRL00	0x4800
>  #define OV9282_GATED_CLOCK	BIT(5)
>  
> +/* Flash/Strobe control registers */
> +#define OV9282_REG_FLASH_DURATION	0x3925
> +#define OV9282_FLASH_DURATION_DEFAULT	0x0000001A
> +
>  /* Input clock rate */
>  #define OV9282_INCLK_RATE	24000000
>  
> @@ -687,6 +691,24 @@ static int ov9282_set_ctrl_flash_led_mode(struct ov9282 *ov9282, int mode)
>  				current_val);
>  }
>  
> +static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, int value)
> +{
> +	/* Calculate "strobe_frame_span" increments from a given value (µs).

/*
 * Multi-line
 * comment.
 */

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

The granularity of the hardware supported values is lower than that of the
control. Could you add try_ctrl op to provide the actual value back to the
user space?

> +}
> +
>  /**
>   * ov9282_set_ctrl() - Set subdevice control
>   * @ctrl: pointer to v4l2_ctrl structure
> @@ -756,6 +778,9 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>  	case V4L2_CID_FLASH_LED_MODE:
>  		ret = ov9282_set_ctrl_flash_led_mode(ov9282, ctrl->val);
>  		break;
> +	case V4L2_CID_FLASH_DURATION:
> +		ret = ov9282_set_ctrl_flash_duration(ov9282, ctrl->val);
> +		break;
>  	default:
>  		dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
>  		ret = -EINVAL;
> @@ -1418,6 +1443,9 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>  			       (1 << V4L2_FLASH_LED_MODE_TORCH),
>  			       V4L2_FLASH_LED_MODE_NONE);
>  
> +	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,

Should the number of controls in the handler be updated?

> +			  0, 13900, 1, 8);
> +
>  	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
>  	if (!ret) {
>  		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */
> 

-- 
Regards,

Sakari Ailus

