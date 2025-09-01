Return-Path: <linux-media+bounces-41480-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53038B3F020
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 22:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3A411A826F9
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 20:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D63274B34;
	Mon,  1 Sep 2025 20:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ICQ0X7e5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6160B1E868;
	Mon,  1 Sep 2025 20:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756760147; cv=none; b=L1F/CuDDtZBFsi92LCHZEAPKfwRDeSuV2XYzsAJM59vRTqTtqnKFPyfqnjlevjeYpQOnzyjSd8ZMaLDricA03TG6ONzEYlygijUqrkJZjpdfe39QBc35AWhnKzY11+ITK7cNVc4Qkumt+Fae48TYEJWVsd6zdE4A92XtuZsXn34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756760147; c=relaxed/simple;
	bh=rt3zG8i3vlYwmKYtzB8OW4yTeNsqXFE1dxWxwz6rHQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LqgIbUBwdcJe/6kQn+m/KfkbNKpcHqd0JeqJbVznnAxE/DdLj3qzXbIInNXstEIu3L7vM+qRnhepZZ6GNt6JchcJBHtV8afBVS8VxlPL7LXnYj/dKBJPWURjqiueF5BJ+KHQv6s19hwRbTNRk0/eByf8QEKij78hKHRXR4fkNLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ICQ0X7e5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756760146; x=1788296146;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rt3zG8i3vlYwmKYtzB8OW4yTeNsqXFE1dxWxwz6rHQE=;
  b=ICQ0X7e5XDaUyflU7EXX/1ZJZicQIlD6HTlL2WgtgpjkTNoxOPcidhON
   7Wo9NJbqzkRSW4I8jO73jusqvUEOzV9dnE0qhzYPxLqVtzPR5FQKD7Rrj
   yOOZrDvbMzvqWvV40DNSj72SaR80HWVX51TiEllGiu4dRDP7Jq1j4rGkD
   AUquIB2BSdHqWuiCQOFq8v694CjaDW6dNmVMnE4Om9qnQGszaKhplGiYx
   SXSwvMDNd/lJMtRU0bWot4z2kBWiIdsmNa7wIAatY9UvEBLV2VCzc7Kl0
   6aW9eUUaaUGJ9GMsDB63QoU21ukXu3FNvCN5sAx/4WixrRVG3mfFWX9Tw
   Q==;
X-CSE-ConnectionGUID: abJ8kfCJTm+7Y9wuR4tkFQ==
X-CSE-MsgGUID: UmdcaWCETKyTGdazgpHImg==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="76464538"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="76464538"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 13:55:44 -0700
X-CSE-ConnectionGUID: S/zzZFtGR5ug7vVsPVzt6g==
X-CSE-MsgGUID: 8a59BmLNShWQAAbVCw5dVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170647873"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.254])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 13:55:41 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B5D7A11F739;
	Mon, 01 Sep 2025 23:55:37 +0300 (EEST)
Date: Mon, 1 Sep 2025 23:55:37 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v7 07/10] media: i2c: ov9282: add strobe_duration v4l2
 control
Message-ID: <aLYISb07ziGDmFGS@kekkonen.localdomain>
References: <20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev>
 <20250901-ov9282-flash-strobe-v7-7-d58d5a694afc@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250901-ov9282-flash-strobe-v7-7-d58d5a694afc@linux.dev>

Hi Richard,

On Mon, Sep 01, 2025 at 05:05:12PM +0200, Richard Leitner wrote:
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
> index ff0f69f0dc3a2d0518806b9ea65c1b520b5c55fb..c405e3411daf37cf98d5af3535702f8321394af5 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -97,6 +97,10 @@
>  #define OV9282_REG_MIPI_CTRL00	0x4800
>  #define OV9282_GATED_CLOCK	BIT(5)
>  
> +/* Flash/Strobe control registers */
> +#define OV9282_REG_FLASH_DURATION	0x3925
> +#define OV9282_FLASH_DURATION_DEFAULT	0x0000001a
> +
>  /* Input clock rate */
>  #define OV9282_INCLK_RATE	24000000
>  
> @@ -687,6 +691,25 @@ static int ov9282_set_ctrl_flash_hw_strobe_signal(struct ov9282 *ov9282, bool en
>  				current_val);
>  }
>  
> +static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, u32 value)
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

The bitwise and operation is redundant.

Could you do this in a single write?

Also error handling is (largely) missing.

> +}
> +
>  /**
>   * ov9282_set_ctrl() - Set subdevice control
>   * @ctrl: pointer to v4l2_ctrl structure
> @@ -756,6 +779,9 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>  	case V4L2_CID_FLASH_HW_STROBE_SIGNAL:
>  		ret = ov9282_set_ctrl_flash_hw_strobe_signal(ov9282, ctrl->val);
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
> @@ -1414,6 +1440,9 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>  	/* Flash/Strobe controls */
>  	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_HW_STROBE_SIGNAL, 0, 1, 1, 0);
>  
> +	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
> +			  0, 13900, 1, 8);
> +
>  	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
>  	if (!ret) {
>  		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */
> 

-- 
Regards,

Sakari Ailus

