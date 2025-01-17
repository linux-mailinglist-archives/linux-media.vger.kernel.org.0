Return-Path: <linux-media+bounces-24860-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D32A14863
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 04:02:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0157718864FA
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 03:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1D4918A6C1;
	Fri, 17 Jan 2025 03:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AfLUuZlh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B99625A648
	for <linux-media@vger.kernel.org>; Fri, 17 Jan 2025 03:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737082952; cv=none; b=IE4VC2ZIdS1fmTuplZwb0LeBHi5QS5+eF4fkGkPfpOnvKB4s09NK0seHlAI/nsxeD8INTNGcyICewHdxh2LGm47Nnn6GIQTm4EGlnOU67Z6A2LYivZwN2sf2RGoVZYFKNYn6mcOopIZN8x3o22wpMLytYvgofr1+6Fecxc6ytlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737082952; c=relaxed/simple;
	bh=cuXBrjwrRlOPnvUPo8cjRjvs+nMTzu93fOII7KAukOc=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=T/jPE44zdAn3G2i/e0me5Pg0N61g7/b4Vh65dlNfXNIYJ9ezhnjBMagZwsR9BhdBiGTWc8iry9xOFIQiZTq4nIOfY2jr2MhTlQhNWSVRvZRc0B3CczLYFjOmfJSUCdRehCEH2g4z412NdeyBgLvbUGtr8d6NdWwbC/CNotHC8pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AfLUuZlh; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737082951; x=1768618951;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=cuXBrjwrRlOPnvUPo8cjRjvs+nMTzu93fOII7KAukOc=;
  b=AfLUuZlhVlkZ/jID8p/IQ9Kf+2kjdTl+7QMVFYz1QFov2fEq8WuHNZxf
   TBqO/szHRzNr6OcTSm+8un7+syxBMEiQCe9LAPHPIT5s0ndfB+h/OPATK
   v60WgS57lYMC/CZMxBTRuq9uZbKt8Gwlc16Rwek+slZqQJS15SqoVit+Z
   LQTOEOU/ncp6AhQfFsFAXGB44g38GFQI5eeqPFq6FT6x1WJfxrPKKZiAN
   myVoEuJaAIS1zXykbwK/iCp/TdBH5iAP4UvW5wZEgjnSxVfYR3QjMjxm/
   ywlt5AhI+5kyoZiOUZlU6XyD96aCtF/WZwUaNzYQvGwxh7gjxzlVEAOTn
   g==;
X-CSE-ConnectionGUID: +h97L5RFS8uMbqW/S/lO3g==
X-CSE-MsgGUID: 4HfaI1zZRMe5UkSRKBmVRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37381607"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="37381607"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 19:02:30 -0800
X-CSE-ConnectionGUID: 6fGL7pvpQdOCdNQZ1VffCQ==
X-CSE-MsgGUID: +JII8gEzTsaBubpegAsOrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="105641240"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 19:02:28 -0800
Subject: Re: [PATCH 3/4] media: i2c: imx219: Rectify runtime PM handling in
 probe and remove
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Bingbu Cao <bingbu.cao@intel.com>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Tianshu Qiu <tian.shu.qiu@intel.com>
References: <20250116124118.42130-1-sakari.ailus@linux.intel.com>
 <20250116124118.42130-4-sakari.ailus@linux.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <8a05c8dd-9bde-2317-29f5-543e1cd913f0@linux.intel.com>
Date: Fri, 17 Jan 2025 11:00:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250116124118.42130-4-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

On 1/16/25 8:41 PM, Sakari Ailus wrote:
> Set the device's runtime PM status and enable runtime PM before
> registering the async sub-device. This is needed to avoid the case where
> the device is runtime PM resumed while runtime PM has not been enabled
> yet.
> 
> Also set the device's runtime PM status to suspended in remove only if it
> wasn't so already.
> 
> Fixes: 1283b3b8f82b ("media: i2c: Add driver for Sony IMX219 sensor")
> Cc: stable@vger.kernel.org # for >= v6.6
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/imx219.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 2d54cea113e1..c6c30109225c 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -1178,6 +1178,9 @@ static int imx219_probe(struct i2c_client *client)
>  		goto error_media_entity;
>  	}
>  
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +
>  	ret = v4l2_async_register_subdev_sensor(&imx219->sd);
>  	if (ret < 0) {
>  		dev_err_probe(dev, ret,
> @@ -1185,15 +1188,14 @@ static int imx219_probe(struct i2c_client *client)
>  		goto error_subdev_cleanup;
>  	}
>  
> -	/* Enable runtime PM and turn off the device */
> -	pm_runtime_set_active(dev);
> -	pm_runtime_enable(dev);
>  	pm_runtime_idle(dev);
>  
>  	return 0;
>  
>  error_subdev_cleanup:
>  	v4l2_subdev_cleanup(&imx219->sd);
> +	pm_runtime_disable(dev);
> +	pm_runtime_set_suspended(dev);
>  
>  error_media_entity:
>  	media_entity_cleanup(&imx219->sd.entity);
> @@ -1218,9 +1220,10 @@ static void imx219_remove(struct i2c_client *client)
>  	imx219_free_controls(imx219);
>  
>  	pm_runtime_disable(&client->dev);
> -	if (!pm_runtime_status_suspended(&client->dev))
> +	if (!pm_runtime_status_suspended(&client->dev)) {
>  		imx219_power_off(&client->dev);
> -	pm_runtime_set_suspended(&client->dev);
> +		pm_runtime_set_suspended(&client->dev);
> +	}
>  }
>  
>  static const struct of_device_id imx219_dt_ids[] = {
> 

-- 
Best regards,
Bingbu Cao

