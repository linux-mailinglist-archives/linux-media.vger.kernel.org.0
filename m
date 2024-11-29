Return-Path: <linux-media+bounces-22346-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E606B9DE72D
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 14:23:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A28E7162018
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 13:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA21A19DF9E;
	Fri, 29 Nov 2024 13:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ad+DPktR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91569158A1F
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 13:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732886610; cv=none; b=re08PxSlhJG+tiE4eNz/Hdxe1tsm9eECcuwA2IFKWvv1lh5c6hW1XwnjoudL5paVDONOfiAJYUenYOeLDKrjT3/ln+PJ9nhG/W5oXOeNQadYxFskqZcv6sOTerkF718Ch/u3MPAoKYtx3N+GL43uBfGsyLVeOXM/dYVYNvagaIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732886610; c=relaxed/simple;
	bh=heUEBrPntKG+f/nGq6S3frsyZaDNzmdJY/4n5SJ8Obs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ULvBWwyDqT6EWtwPuvKmhoO4x9dBAkCGM1Nnhz/4ulT6KHCWFvehCPy+cKNnnoPKwLdPxCzytFnZUfGoyqn8AvSrQ9yIIF0B1zgZbZTP1HvW3vL+XbYItg4rd5KJAqnlIeV9B5+yimamzUDAiCJeNpubkAS5QNhDBO8TIf8kenU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ad+DPktR; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732886609; x=1764422609;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=heUEBrPntKG+f/nGq6S3frsyZaDNzmdJY/4n5SJ8Obs=;
  b=Ad+DPktRkhFoGXYdNsacyLpPw/3QZQ+hFzNioiCGJjZ3ffamWomdfpBt
   LswrpjszQCQ5iihwu0P4cYO/LLNdZKgR2B5RPQoCbEbPWFg44NT0NLXhB
   dP0PW8JLEG8ollCwexH15PsPGmsLiofY0/MfW9nnGo9HeF42ep+18LgjU
   Si58NfE6JOadgpVdeEoO0OKTXxbW5DF/4fFHLQmUV20wj63uXRseDco1B
   h86Mm7m0WU7fukMtZCxj3U3EBpozphNQRr7eva3+hgDDdsBJeGxML27JV
   BRxeBqw2m4T4ukm89k4md29S76m4mOt2+/VXwWoMVmVf4qKtkX+wb2V01
   g==;
X-CSE-ConnectionGUID: cZHkiPTgTdGDIWxu9pY7Iw==
X-CSE-MsgGUID: QKAJp6cjRwudDG9Gm2AVjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="50644441"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="50644441"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 05:23:27 -0800
X-CSE-ConnectionGUID: yAovkHN8Spiij0lF5zSL+A==
X-CSE-MsgGUID: s4mdZlAQROKoea1M89rtPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="92117569"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.246.8.237])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 05:23:25 -0800
Date: Fri, 29 Nov 2024 14:23:23 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 3/4] media: ov2740: Add powerdown GPIO support
Message-ID: <Z0nAS5oaG87ECYBz@linux.intel.com>
References: <20241128152338.4583-1-hdegoede@redhat.com>
 <20241128152338.4583-4-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128152338.4583-4-hdegoede@redhat.com>

On Thu, Nov 28, 2024 at 04:23:37PM +0100, Hans de Goede wrote:
> The ov2740 sensor has both reset and power_down inputs according to
> the datasheet one or the other should always be tied to DOVDD but on
> some designs both are attached to GPIOs.
> 
> Add support for controlling both a reset and a powerdown GPIO.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>  drivers/media/i2c/ov2740.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index 998e1977978d..14d0a0588cc2 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -525,6 +525,7 @@ struct ov2740 {
>  
>  	/* GPIOs, clocks */
>  	struct gpio_desc *reset_gpio;
> +	struct gpio_desc *powerdown_gpio;
>  	struct clk *clk;
>  
>  	/* Current mode */
> @@ -1306,6 +1307,7 @@ static int ov2740_suspend(struct device *dev)
>  	struct ov2740 *ov2740 = to_ov2740(sd);
>  
>  	gpiod_set_value_cansleep(ov2740->reset_gpio, 1);
> +	gpiod_set_value_cansleep(ov2740->powerdown_gpio, 1);
>  	clk_disable_unprepare(ov2740->clk);
>  	return 0;
>  }
> @@ -1320,6 +1322,7 @@ static int ov2740_resume(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> +	gpiod_set_value_cansleep(ov2740->powerdown_gpio, 0);
>  	gpiod_set_value_cansleep(ov2740->reset_gpio, 0);
>  	msleep(20);
>  
> @@ -1348,9 +1351,17 @@ static int ov2740_probe(struct i2c_client *client)
>  	if (IS_ERR(ov2740->reset_gpio)) {
>  		return dev_err_probe(dev, PTR_ERR(ov2740->reset_gpio),
>  				     "failed to get reset GPIO\n");
> -	} else if (ov2740->reset_gpio) {
> +	}
> +
> +	ov2740->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ov2740->powerdown_gpio)) {
> +		return dev_err_probe(dev, PTR_ERR(ov2740->powerdown_gpio),
> +				     "failed to get powerdown GPIO\n");
> +	}
> +
> +	if (ov2740->reset_gpio || ov2740->powerdown_gpio) {
>  		/*
> -		 * Ensure reset is asserted for at least 20 ms before
> +		 * Ensure reset/powerdown is asserted for at least 20 ms before
>  		 * ov2740_resume() deasserts it.
>  		 */
>  		msleep(20);
> -- 
> 2.47.0
> 
> 

