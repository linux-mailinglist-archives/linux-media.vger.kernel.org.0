Return-Path: <linux-media+bounces-21182-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFDD9C218F
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 17:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDA911C246FC
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 16:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E43F139D0B;
	Fri,  8 Nov 2024 16:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NfOCR5kO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9339C8EB;
	Fri,  8 Nov 2024 16:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731082006; cv=none; b=bAG4YsCCNLCFWHqr3KF49cLOCz5qsrCRlvOf55IGVwpdx3PlWDuFIHXjnxcHS0o9IoUvFgFkFV/yStlpBgVbex06G7VY19bcnUneuzytszxDnEIFfzg+haC6+qHSqr6U1vuzOCzmhZ/5ZCxLSkkLi/weT6Ig37zya25kivgDwb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731082006; c=relaxed/simple;
	bh=6LSa1bRrJgKUR49mqBK1J02SyFpaBrod093WWPObqKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g6Ar9ugkM52gpChON9zoGSmyCYDnfo4nGSXsTKuiYWhifwljcnRwf1dcfJJJ+lTqcfp61sNgiytn2ZtfMQDWCFcUu+OfQCzGQCwvN9TTPIx5GN0Vy+bYrHHzPS/AQam8dFiirJB5ZzEUJPvK3LWEiloWcC3aC87jsa6yFajsP1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NfOCR5kO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731082005; x=1762618005;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6LSa1bRrJgKUR49mqBK1J02SyFpaBrod093WWPObqKw=;
  b=NfOCR5kOtBZF0VAabneZZBRLVWk2tv7NZZQtEXhdESHHcshNxWm1pPiR
   St1Ut0eOYWbR9x+EtxThbbDfrrHNjhFRS41xEYdgFzpty/k/U+z7bX8FZ
   ZsbFqjh5+rrwKnPmWQe/zNJCxk9DzbitdDscBj8+sFW7kVu35KpqGGMDC
   s5U/M+I5tGZbZ5dHrH8vYeHFY2KWNK5K4JyrrOAnE0pXbOuXQFVX11IiF
   yLqULy+8ouk6YxEJkXQrUS+bDF5Brkx36NloXBiiRklyRiqZtGMDcSHzV
   VdztpDlriTXd+BV4qyLSJ4GvNrldl/vcEch3iLHJ1DgEgNQljr4jzcOXD
   g==;
X-CSE-ConnectionGUID: 8wIvmWzwRF60PKGBiOO+yg==
X-CSE-MsgGUID: KBY/tQOITqyJ6rKQpz9P2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="42357195"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="42357195"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 08:06:44 -0800
X-CSE-ConnectionGUID: JUm8/uH4SZqt/cLVuEw3SA==
X-CSE-MsgGUID: wIJE8lAEReGMgGkU2tka+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="123141563"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 08:06:42 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 90D5411F9BF;
	Fri,  8 Nov 2024 18:06:39 +0200 (EET)
Date: Fri, 8 Nov 2024 16:06:39 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v1 1/1] media: ov7251: Remap "reset" to "enable" for
 OV7251
Message-ID: <Zy43D7wAZLrBDtiX@kekkonen.localdomain>
References: <20241108145024.1490536-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108145024.1490536-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

Thanks for the patch.

On Fri, Nov 08, 2024 at 04:50:24PM +0200, Andy Shevchenko wrote:
> The driver of OmniVision OV7251 expects "enable" pin instead of "reset".
> Remap "reset" to "enable" and update polarity.
> 
> In particular, the Linux kernel can't load the camera sensor
> driver on Microsoft Surface Book without this change:
> 
>  ov7251 i2c-INT347E:00: supply vdddo not found, using dummy regulator
>  ov7251 i2c-INT347E:00: supply vddd not found, using dummy regulator
>  ov7251 i2c-INT347E:00: supply vdda not found, using dummy regulator
>  ov7251 i2c-INT347E:00: cannot get enable gpio
>  ov7251 i2c-INT347E:00: probe with driver ov7251 failed with error -2
> 
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Should this be cc'd to stable? I guess it's not exactly a fix in the driver
but a BIOS bug, but it can be worked around in the driver. :-)

> ---
>  drivers/media/i2c/ov7251.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
> index 30f61e04ecaf..7b35add1e0ed 100644
> --- a/drivers/media/i2c/ov7251.c
> +++ b/drivers/media/i2c/ov7251.c
> @@ -1696,7 +1696,21 @@ static int ov7251_probe(struct i2c_client *client)
>  		return PTR_ERR(ov7251->analog_regulator);
>  	}
>  
> +	/*
> +	 * The device-tree bindings call this pin "enable", but the
> +	 * datasheet describes the pin as "reset (active low with internal
> +	 * pull down resistor)". The ACPI tables describing this sensor

It's the functionality that matters albeit I guess this is somewhat a
matter of taste: a similar pin was named "reset" for MIPI CCS.

> +	 * on, e.g., the Microsoft Surface Book use the ACPI equivalent of
> +	 * "reset" as pin name, which ACPI glue code then maps to "reset".
> +	 * Check for a "reset" pin if there is no "enable" pin.
> +	 */
>  	ov7251->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ov7251->enable_gpio) &&
> +	    PTR_ERR(ov7251->enable_gpio) != -EPROBE_DEFER) {
> +		ov7251->enable_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);

This looks like it'd benefit from a line wrap. I can do that if there's no
need for v2 otherwise.

> +		if (!IS_ERR(ov7251->enable_gpio))
> +			gpiod_toggle_active_low(ov7251->enable_gpio);
> +	}
>  	if (IS_ERR(ov7251->enable_gpio)) {
>  		dev_err(dev, "cannot get enable gpio\n");
>  		return PTR_ERR(ov7251->enable_gpio);

-- 
Kind regards,

Sakari Ailus

