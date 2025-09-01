Return-Path: <linux-media+bounces-41481-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDD6B3F025
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 22:57:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4ED1020796D
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 20:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A2B274B3B;
	Mon,  1 Sep 2025 20:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ktlvCysZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324281E868;
	Mon,  1 Sep 2025 20:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756760243; cv=none; b=ohX4/Xopg0xAscSCFUPMpO+t+4dmePxnFPIRFkqcNoFDZyaImQMURvHqkNrQwoXT5SexLM4ZiQ/5DSLP7+VGy31iFCm5iYKYUKjVzagHdmJ2B2fylAVgW5mRMGxFqMARqtG3p0bsRN0N+a2b5NAVBF3U5nJkS3jtNO6ONT9e4Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756760243; c=relaxed/simple;
	bh=M4cVGwbdKULx/fHz8KiShYafSLQ3PwDTmrU/byPSxeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=haDNtkDZ0KvqglnBEF8sNamjDcaqMHfL/pXKk8mKfgxAiEz014yGx3GO5SlHphtKW5dBfhUUwv3qVtTJY+4Lck/rULuwT0+mm+eYrTkYBicDv90AMnC9pN975A/GUNSzltlijk92QWOHMig1RZgx+niY4jhYC8/9z3+m9KAGdYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ktlvCysZ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756760242; x=1788296242;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M4cVGwbdKULx/fHz8KiShYafSLQ3PwDTmrU/byPSxeE=;
  b=ktlvCysZfNTsSpbirmPNypBcB9MuON/FnKYwRnoBv3xmH8w0jMvx/yno
   TBXRg0P7WM7Y2thHWuiRRySp5ndyWMkLF8I7+qx9lz4tLgB9cRpOFR9Vv
   pq4XLYYy608SY9E6rpPTLziAjEJZNekyXNKnT4bCCSa9dJ0X7oqG25h/z
   5H2C1VnIQbIt6s90EUccu13+YvV8WFD7u3ZxWE4RU8u5vt4S6ePpO0YhH
   OBI+MpsHbwE4Uv0oL7qf/J7l9Z8cv3/QRAAb7n0q+oUL9IIu7YPjnYwJW
   R8E1lGsZXJxm/61iHuJE5xf0L9IxZ4Eoj9B/c4HWb190Z5pBrjZqjQKBL
   w==;
X-CSE-ConnectionGUID: I5aDZ61ORRKJgXYdbTyx7A==
X-CSE-MsgGUID: fprn2abjRIyhDArevisHMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58952855"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58952855"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 13:57:21 -0700
X-CSE-ConnectionGUID: 0Q2Ae0JmQTSwqv2xc18MEg==
X-CSE-MsgGUID: GnEqVZFjTD6ZJ17jtCBFDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="194745996"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.254])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 13:57:18 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id EA63711F739;
	Mon, 01 Sep 2025 23:57:15 +0300 (EEST)
Date: Mon, 1 Sep 2025 23:57:15 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v7 06/10] media: i2c: ov9282: add hardware strobe signal
 v4l2 control
Message-ID: <aLYIq6GxLgPM6ReC@kekkonen.localdomain>
References: <20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev>
 <20250901-ov9282-flash-strobe-v7-6-d58d5a694afc@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901-ov9282-flash-strobe-v7-6-d58d5a694afc@linux.dev>

Hi Richard,

On Mon, Sep 01, 2025 at 05:05:11PM +0200, Richard Leitner wrote:
> Add V4L2_CID_FLASH_HW_STROBE_SIGNAL enable/disable support using the
> "strobe output enable" feature of the sensor.
> 
> All values are based on the OV9281 datasheet v1.53 (january 2019) and
> tested using an ov9281 VisionComponents module.
> 
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index f42e0d439753e74d14e3a3592029e48f49234927..ff0f69f0dc3a2d0518806b9ea65c1b520b5c55fb 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -670,6 +670,23 @@ static int ov9282_set_ctrl_vflip(struct ov9282 *ov9282, int value)
>  				current_val);
>  }
>  
> +static int ov9282_set_ctrl_flash_hw_strobe_signal(struct ov9282 *ov9282, bool enable)
> +{
> +	u32 current_val;
> +	int ret = ov9282_read_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1,
> +				  &current_val);
> +	if (ret)
> +		return ret;

Please don't do assignments in variable declaration if that involves error
handling.

> +
> +	if (enable)
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
> +	case V4L2_CID_FLASH_HW_STROBE_SIGNAL:
> +		ret = ov9282_set_ctrl_flash_hw_strobe_signal(ov9282, ctrl->val);
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
> @@ -1391,6 +1411,9 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>  						OV9282_TIMING_HTS_MAX - mode->width,
>  						1, hblank_min);
>  
> +	/* Flash/Strobe controls */
> +	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_HW_STROBE_SIGNAL, 0, 1, 1, 0);

This seems rather long.

> +
>  	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
>  	if (!ret) {
>  		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */
> 

-- 
Regards,

Sakari Ailus

