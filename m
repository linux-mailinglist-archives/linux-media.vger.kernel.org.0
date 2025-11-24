Return-Path: <linux-media+bounces-47651-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F43C7FD5A
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 11:18:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 82DB04E4D76
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 10:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5394626E175;
	Mon, 24 Nov 2025 10:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aGwSS8xY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8895A25F7A4;
	Mon, 24 Nov 2025 10:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763979519; cv=none; b=lPWJKADMOeyU4KbTLJ+DxpQsvfFjvKo7nb1kntyqKucniZQfVn+qozO7nP2UCTu4foXcjRtk7lh14n4kkkqI0KluZgAwGjBrFfdNRmBCTffHbD/2b4Dhj5lzLpt2YzuaICOpnwosMHpEcQb6xCU2IkCv0ctxFWvcuN1Uuvv/rxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763979519; c=relaxed/simple;
	bh=M3REM2AkGNRfWagplN2Td6j45eziRKuEeQGf6FkIvVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QtRpzMm+LoOa2X7Xys6u4OfxwjsrQQfgl1yh2NtgJY1S1fG4R6BGjJw1L/YyJvQE/LfHcLWHd6y+bauS2h8Bdfit5F4YQnVO+VUW5z4HvWRcR0JfsOF1rbNTWMCxgbvRJs/IQt2rD46crpu4KBWLOCjai5RcClNOSnNFNUk5RpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aGwSS8xY; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763979517; x=1795515517;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=M3REM2AkGNRfWagplN2Td6j45eziRKuEeQGf6FkIvVo=;
  b=aGwSS8xY1acNx9LrlyOZr+n/Ry4dUp/ZS6HdcLn0+6ROYLtcPZgEt0Qw
   1NECndnqi/9p+d/PcbuonIiny7luX6Nj/TodHZ72D4AKAB4ZA2Y9rVPIT
   WiJfmXPVo+bIYtsI8S+yf4+HLz3qyQrNV7s1tGUrxt2jUBgwWzM9KsttM
   KoPE9sQGH4DLzwwjy70z6GgjDfaqFXc7TKTXUvE3nBUZ86gmU8XkMeaDI
   2ECJC96RBEoGohTD2IcDpmVNAgLSUcSp1e/EkOIeLAd0tFiMsY2p4Piac
   S6PyKZQngWIC/7ZZT3tcB9gBFqzEATjHcKJtIov6YtkgPF++P2VUoE7P8
   g==;
X-CSE-ConnectionGUID: f+mIFPhwRDyMVNDnjRa5rQ==
X-CSE-MsgGUID: s1g3mON4SmadvmkycGQW1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="65855446"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="65855446"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 02:18:37 -0800
X-CSE-ConnectionGUID: KM+m4CkRRBCfpQiCwM9fNw==
X-CSE-MsgGUID: i/IUTimqRFC+XihnoxF4Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="191963443"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.9])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 02:18:34 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C4117121DC4;
	Mon, 24 Nov 2025 12:18:33 +0200 (EET)
Date: Mon, 24 Nov 2025 12:18:33 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v9 6/8] media: i2c: ov9282: add strobe_duration v4l2
 control
Message-ID: <aSQw-SaUr9U5heah@kekkonen.localdomain>
References: <20251120-ov9282-flash-strobe-v9-0-6c9e3a4301d7@linux.dev>
 <20251120-ov9282-flash-strobe-v9-6-6c9e3a4301d7@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251120-ov9282-flash-strobe-v9-6-6c9e3a4301d7@linux.dev>

Hi Richard,

On Thu, Nov 20, 2025 at 06:04:26PM +0100, Richard Leitner wrote:
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
>  drivers/media/i2c/ov9282.c | 37 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 6afce803a049..26296dc1d1b9 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -97,6 +97,10 @@
>  #define OV9282_REG_MIPI_CTRL00	0x4800
>  #define OV9282_GATED_CLOCK	BIT(5)
>  
> +/* Flash/Strobe control registers */
> +#define OV9282_REG_STROBE_FRAME_SPAN		0x3925
> +#define OV9282_STROBE_FRAME_SPAN_DEFAULT	0x0000001a
> +
>  /* Input clock rate */
>  #define OV9282_INCLK_RATE	24000000
>  
> @@ -687,6 +691,31 @@ static int ov9282_set_ctrl_flash_strobe_oe(struct ov9282 *ov9282, bool enable)
>  	return ov9282_write_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1, current_val);
>  }
>  
> +static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, u32 value)
> +{
> +	int ret;
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
> +	ret = ov9282_write_reg(ov9282, OV9282_REG_STROBE_FRAME_SPAN, 1,
> +			       (val >> 24) & 0xff);
> +	ret |= ov9282_write_reg(ov9282, OV9282_REG_STROBE_FRAME_SPAN + 1, 1,
> +				(val >> 16) & 0xff);
> +	ret |= ov9282_write_reg(ov9282, OV9282_REG_STROBE_FRAME_SPAN + 2, 1,
> +				(val >> 8) & 0xff);
> +	ret |= ov9282_write_reg(ov9282, OV9282_REG_STROBE_FRAME_SPAN + 3, 1,
> +				val & 0xff);

Bitwise or on error codes won't produce sensible results. Could you fix
that? The series won't make it to v6.19 in any case.

> +	return ret;
> +}
> +
>  /**
>   * ov9282_set_ctrl() - Set subdevice control
>   * @ctrl: pointer to v4l2_ctrl structure
> @@ -756,6 +785,9 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>  	case V4L2_CID_FLASH_STROBE_OE:
>  		ret = ov9282_set_ctrl_flash_strobe_oe(ov9282, ctrl->val);
>  		break;
> +	case V4L2_CID_FLASH_DURATION:
> +		ret = ov9282_set_ctrl_flash_duration(ov9282, ctrl->val);
> +		break;
>  	default:
>  		dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
>  		ret = -EINVAL;
> @@ -1345,7 +1377,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>  	u32 lpfr;
>  	int ret;
>  
> -	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 11);
> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
>  	if (ret)
>  		return ret;
>  
> @@ -1414,6 +1446,9 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>  	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops,
>  			  V4L2_CID_FLASH_STROBE_OE, 0, 1, 1, 0);
>  
> +	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
> +			  0, 13900, 1, 8);
> +
>  	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
>  	if (!ret) {
>  		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */
> 

-- 
Kind regards,

Sakari Ailus

