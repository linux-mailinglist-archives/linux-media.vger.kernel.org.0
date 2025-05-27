Return-Path: <linux-media+bounces-33434-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AF5AC4880
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 08:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 968D37A8F12
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 06:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0919C1F8724;
	Tue, 27 May 2025 06:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kAbAHH40"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6700A1F540F;
	Tue, 27 May 2025 06:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748327815; cv=none; b=q3zx3SQ/cOJDgyn4EbZGYmvt0wbAplDl+gXF/SMsBXNQHbv5U/X1VZZ9bkftbJhFNC/TQHxpCb36f2hID0eusnZE1LXlWSXyiZ9wjZLF5V/pZ9jnapUCwE4KI//ujNcUXweEFehFMSApP82nFVQZ0QJN1jS7V6Xvr6fOkNCgp8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748327815; c=relaxed/simple;
	bh=J7zeaY485iuldgqut5ZbwwPrllwA1ayRl+Nd/rGxucU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uk92nLhw0qilMDxonbJ3YXiNWs48YUArYFXIRq+8MggxD+3U+lbTFXwEzGgICnPwj+Jfp/hWO3jCf4zbBHpJi9NtXYkjHj9BVNr7gm65Fblr6wL0yuk4eQTK2ZGK7y24zLEcUlHDn79YWSq9OAICOgTEzdqqwGpsJIgb+tcTJMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kAbAHH40; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748327812; x=1779863812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J7zeaY485iuldgqut5ZbwwPrllwA1ayRl+Nd/rGxucU=;
  b=kAbAHH40v0nm++UVRCgxOvUj08BXtcLtUiSnSgYG5wA7WlUR4mTySMe8
   vBKLtkcacYAlBdwvT6DLk0CTJyQBsHJF7nTYM6ogzaka4kIaBpxtTgOhr
   3NdzqWJU+rxYgFxlfEdGgjQT887+jb+BNOq2yW3sqbW+bRohsG5R++h9j
   xp790byv/3WTO3Heq8tcvvXT0Vfd96JIg/Qtx15Sag9Ew1kK5r+D1cBRN
   UXj51oY7/XVEl4iCfB42Lz6vRcaK4fsxMjOcjXgrCh79M6JLXELnEytu4
   yZh38MIyI2u+Iuh/jZaR5r3K7rgZ5lcIyAjS+FIbkjIr+QIYz2TANqzoy
   g==;
X-CSE-ConnectionGUID: uryOrqVIQlmk0b1A26zSPg==
X-CSE-MsgGUID: FwVmXF5HT+6AuqYOD/LVyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="75693434"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="75693434"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 23:36:51 -0700
X-CSE-ConnectionGUID: /PhxJ89BSNaYc6wNOcq0Vg==
X-CSE-MsgGUID: xA3sQva5RqaRW2I2vgVTEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="146557371"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.73])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 23:36:47 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id ACC1511F738;
	Tue, 27 May 2025 09:36:42 +0300 (EEST)
Date: Tue, 27 May 2025 06:36:42 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mathis Foerst <mathis.foerst@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	manuel.traut@mt.com, mathis.foerst@zuehlke.com
Subject: Re: [PATCH v6 7/7] media: mt9m114: Set pad-slew-rate
Message-ID: <aDVdekApG-GT5BHj@kekkonen.localdomain>
References: <20250522143512.112043-1-mathis.foerst@mt.com>
 <20250522143512.112043-8-mathis.foerst@mt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522143512.112043-8-mathis.foerst@mt.com>

Hi Mathis,

On Thu, May 22, 2025 at 04:35:11PM +0200, Mathis Foerst wrote:
> The MT9M114 supports the different slew rates (0 to 7) on the output pads.
> At the moment, this is hardcoded to 7 (the fastest rate).
> The user might want to change this values due to EMC requirements.
> 
> Read the 'slew-rate' from the DT and configure the pad slew rates of
> the output pads accordingly in mt9m114_initialize().
> Remove the hardcoded slew rate setting from the mt9m114_init table.
> 
> Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/mt9m114.c | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index 9ff46c72dbc1..f3f9ecc0866c 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -18,6 +18,7 @@
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/property.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/types.h>
> @@ -42,6 +43,9 @@
>  #define MT9M114_RESET_AND_MISC_CONTROL			CCI_REG16(0x001a)
>  #define MT9M114_RESET_SOC					BIT(0)
>  #define MT9M114_PAD_SLEW				CCI_REG16(0x001e)
> +#define MT9M114_PAD_SLEW_MIN					0
> +#define MT9M114_PAD_SLEW_MAX					7
> +#define MT9M114_PAD_SLEW_DEFAULT				7
>  #define MT9M114_PAD_CONTROL				CCI_REG16(0x0032)
>  
>  /* XDMA registers */
> @@ -388,6 +392,7 @@ struct mt9m114 {
>  
>  	unsigned int pixrate;
>  	bool streaming;
> +	u32 pad_slew_rate;
>  
>  	/* Pixel Array */
>  	struct {
> @@ -650,9 +655,6 @@ static const struct cci_reg_sequence mt9m114_init[] = {
>  	{ MT9M114_CAM_SENSOR_CFG_FINE_INTEG_TIME_MAX,	1459 },
>  	{ MT9M114_CAM_SENSOR_CFG_FINE_CORRECTION,	96 },
>  	{ MT9M114_CAM_SENSOR_CFG_REG_0_DATA,		32 },
> -
> -	/* Miscellaneous settings */
> -	{ MT9M114_PAD_SLEW,				0x0777 },
>  };
>  
>  /* -----------------------------------------------------------------------------
> @@ -784,6 +786,13 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
>  	if (ret < 0)
>  		return ret;
>  
> +	value = (sensor->pad_slew_rate)
> +	      | (sensor->pad_slew_rate) << 4
> +	      |	(sensor->pad_slew_rate) << 8;

Please drop the redundant parentheses.

> +	cci_write(sensor->regmap, MT9M114_PAD_SLEW, value, &ret);
> +	if (ret < 0)
> +		return ret;
> +
>  	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
>  	if (ret < 0)
>  		return ret;
> @@ -2398,6 +2407,17 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
>  		goto error;
>  	}
>  
> +	sensor->pad_slew_rate = MT9M114_PAD_SLEW_DEFAULT;
> +	device_property_read_u32(&sensor->client->dev, "slew-rate",
> +				 &sensor->pad_slew_rate);
> +
> +	if (sensor->pad_slew_rate < MT9M114_PAD_SLEW_MIN ||
> +	    sensor->pad_slew_rate > MT9M114_PAD_SLEW_MAX) {
> +		dev_err(&sensor->client->dev, "Invalid slew-rate %u\n",
> +			sensor->pad_slew_rate);
> +		return -EINVAL;
> +	}
> +
>  	return 0;
>  
>  error:

-- 
Sakari Ailus

