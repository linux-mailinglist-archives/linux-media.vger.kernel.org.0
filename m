Return-Path: <linux-media+bounces-33411-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07905AC4465
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 22:22:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F055188B1D6
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 20:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3CE23F42D;
	Mon, 26 May 2025 20:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GV3v74HY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9593E1A254C;
	Mon, 26 May 2025 20:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748290943; cv=none; b=n6//PCH4phDMIb4CpzCobkoMovvQ1Bx3cMyFrZK+b+yGQ0JR+phKBi+ijwzZSdpAGyR1GrRWAPPacmwCH66IX7Eor4dfAeY6y9TK1i1WKOaWD5JWpsR3RDzlh1jcabnuDfQYJso+KhXbP3FkJIGGtSU6KLg4vgjAn9qYOrt+nRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748290943; c=relaxed/simple;
	bh=JDwpsv1GIhHv7XBiBnNOGFkHQ7eEcDYdNtGTAjzzDyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oovnk3eYdtpf9JG10Fmvwpb6y4Lq1lortVMeSbQd8RIHULEGPs00Fk/ojwDjZY87sx67jRW7LacuOkg+imUNxjcFGESaBK5t7x0A0flD5zdvL0TBdMyBpvNPtvWv8l9zh47oQSp8REUKN3od3S42/8Kn/ySOJ92g4z4iKXt2dx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GV3v74HY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748290941; x=1779826941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JDwpsv1GIhHv7XBiBnNOGFkHQ7eEcDYdNtGTAjzzDyA=;
  b=GV3v74HY8d0FEcOphWbiGMf6y9cVHoWe4C9xsQDXz8huRm90BsPZKm8N
   dWQa4xIEHhzbdsZ7Wlf5xxQ+QUMkpf9KCOeK09W3oWbU1uw35MA45aYhj
   6GTF+UlW8ms9NeciFxDE6K94jyUCBFWnNby8YE+rGpkhiWLt50spkZioR
   3kPfQHNs543v5xbEIEwyB8eEEEKC7H3S9hw8syuUUCZc9U6VFb3nf7Jpd
   8k7jlwanITvCFmRMSLzXxmoEUwOEqEjpbxlSDBo85YeaWY0zFsTMQDxtX
   xdYZVRIUkvVpjA6Lyt/RMhAxkgsSeXDHc8xIL5o919+ZPRjyPI92AJqAg
   g==;
X-CSE-ConnectionGUID: NblYh/b4SpKGCRahAre6uw==
X-CSE-MsgGUID: yZPzS+MGQSy+mDCTEu/tYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="61628090"
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; 
   d="scan'208";a="61628090"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 13:22:21 -0700
X-CSE-ConnectionGUID: 4iuxfoY5RG2XKVhKRNA67g==
X-CSE-MsgGUID: nTws/JbPS7SWNjdoT/uGhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; 
   d="scan'208";a="142961204"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.33])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 13:22:18 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D29BE11FC38;
	Mon, 26 May 2025 23:22:15 +0300 (EEST)
Date: Mon, 26 May 2025 20:22:15 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v4 10/10] media: i2c: ov9282: implement try_ctrl for
 strobe_duration
Message-ID: <aDTNd7sswLyBNbzd@kekkonen.localdomain>
References: <20250507-ov9282-flash-strobe-v4-0-72b299c1b7c9@linux.dev>
 <20250507-ov9282-flash-strobe-v4-10-72b299c1b7c9@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250507-ov9282-flash-strobe-v4-10-72b299c1b7c9@linux.dev>

Hi Richard,

Thanks for the update.

On Wed, May 07, 2025 at 09:51:39AM +0200, Richard Leitner wrote:
> As the granularity of the hardware supported values is lower than the
> control value, implement a try_ctrl() function for
> V4L2_CID_FLASH_DURATION. This function calculates the nearest possible
> µs strobe duration for the given value and returns it back to the
> caller.
> 
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 56 ++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 54 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 09d522d5977ec6fb82028ddb6015f05c9328191d..f75882dcb73bea0e00e2cb37ffc19ec3c3a8b126 100644
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
> @@ -691,7 +693,7 @@ static int ov9282_set_ctrl_flash_led_mode(struct ov9282 *ov9282, int mode)
>  				current_val);
>  }
>  
> -static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, int value)
> +static u32 ov9282_us_to_flash_duration(struct ov9282 *ov9282, u32 value)
>  {
>  	/*
>  	 * Calculate "strobe_frame_span" increments from a given value (µs).
> @@ -702,7 +704,31 @@ static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, int value)
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
> +	u32 us = ns / 1000;
> +	u32 remainder = ns % 1000;
> +
> +	if (remainder > 0)
> +		us++;

It looks like you're trying to round up here. Wouldn't

	return DIV_ROUND_UP(ns, 1000);

do the same?

> +	return us;
> +}
> +
> +static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, int value)
> +{
> +	u32 val = ov9282_us_to_flash_duration(ov9282, value);
>  
>  	ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION, 1, (val >> 24) & 0xff);
>  	ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION + 1, 1, (val >> 16) & 0xff);
> @@ -792,9 +818,35 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>  	return ret;
>  }
>  
> +static int ov9282_try_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct ov9282 *ov9282 =
> +		container_of(ctrl->handler, struct ov9282, ctrl_handler);
> +
> +	if (ctrl->id == V4L2_CID_FLASH_DURATION) {
> +		u32 fd = ov9282_us_to_flash_duration(ov9282, ctrl->val);
> +		u32 us = ctrl->val;
> +		u32 us0 = ov9282_flash_duration_to_us(ov9282, fd);
> +		u32 us1 = ov9282_flash_duration_to_us(ov9282, (fd + 1));
> +
> +		if ((us1 - us) < (us - us0))

Is this missing abs?

> +			ctrl->val = us1;
> +		else
> +			ctrl->val = us0;
> +
> +		if (us != ctrl->val) {
> +			dev_dbg(ov9282->dev, "using next valid strobe_duration %u instead of %u\n",
> +				ctrl->val, us);
> +		}
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
Regards,

Sakari Ailus

