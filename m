Return-Path: <linux-media+bounces-37229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09501AFF337
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 22:43:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC0931896E4A
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 20:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEEDE244692;
	Wed,  9 Jul 2025 20:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PGmZPTos"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30B21CAA85;
	Wed,  9 Jul 2025 20:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752093793; cv=none; b=aEVQ6kyvnl9o1ITkj8Bt9RcWciyubIEjz6B3v9wpvHu16DCVixcI+p6w+iskiB/1aUhWY+9I46ESgNZ9sE7xfdQPgWNVJq4Q2TRQz3zHxJyOFeAyFnJZiKKN4S5ONNmG4XsjWNzFtJd6mU5AwOuZzt5jXsbjdPcNqEAR2T+i1R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752093793; c=relaxed/simple;
	bh=vXZxtv0D4jlgPPRePM4PDpSU26LaCzorbsB/7xNQuB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xa8qAZmpx105BI/N4m8C7+pi22v2zDnWykLmHVEpUVcXaljAGEj0efCN3XVY7S+eTrTO/J60BRFT7SyDsux1X4camkwQKDW/YU3oCfZstyqRXfjn3usCLI7y8JLe9R8MTXXIbMU0SsoksoFtPFDQJKDhMZct6CuiQ7aEJC3DM9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PGmZPTos; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752093792; x=1783629792;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vXZxtv0D4jlgPPRePM4PDpSU26LaCzorbsB/7xNQuB8=;
  b=PGmZPTosjKNO+g2c9a0FdKVVY4Qjezh+IC2YLVhX9fYbymlKWSLMGWfh
   YjpdIDLkZKO2gTFu5OiFJPrWcWXIxV+9qM8OxONHVeVP0aMIq+1rggEIO
   h6TlJhHHyaNkQN44KWWKaeALUDqQ42AKB6VEI5WQSBEG2IF91T0PE88Ic
   d41goCv7d1Myx/annqHlomd+2hCfv5cvkO2yitqTUgL7XmMq4RbcYAdqC
   MApr1/IAVm55n3qKIk+W/U4zU9iGQCdrHUY3t7SYNiB8pnj0RyDfyCM0L
   HjVsPAuuLQUB0AH5uWS7kyqkBDi/9NESBR4SG8Ley2qn/m1xkqBq736R7
   w==;
X-CSE-ConnectionGUID: td9E98hPQHqEsEt1BdDgaw==
X-CSE-MsgGUID: 4l8fyhPnT0CL7dk8mWyzQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="53475870"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="53475870"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 13:43:11 -0700
X-CSE-ConnectionGUID: fvbPLDfOQi+/JnPn7Fm0YQ==
X-CSE-MsgGUID: NZKqYa5dTE6j/CNZyjq2FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="156432117"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.15])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 13:43:08 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 35B3D11FBEE;
	Wed,  9 Jul 2025 23:43:06 +0300 (EEST)
Date: Wed, 9 Jul 2025 20:43:06 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: laurent.pinchart@ideasonboard.com, jacopo.mondi@ideasonboard.com,
	hverkuil@xs4all.nl, kieran.bingham@ideasonboard.com,
	mchehab@kernel.org, hdegoede@redhat.com, arnd@arndb.de,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] media: i2c: Kconfig: Ensure a dependency on
 COMMON_CLK for VIDEO_CAMERA_SENSOR
Message-ID: <aG7UWg8kYMNX32MS@kekkonen.localdomain>
References: <20250709101114.22185-1-mehdi.djait@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709101114.22185-1-mehdi.djait@linux.intel.com>

Hi Mehdi,

Thanks for the update.

On Wed, Jul 09, 2025 at 12:11:14PM +0200, Mehdi Djait wrote:
> Both ACPI and DT-based systems are required to obtain the external
> camera sensor clock using the new devm_v4l2_sensor_clk_get() helper
> function.
> 
> Ensure a dependency on COMMON_CLK when config VIDEO_CAMERA_SENSOR is
> enabled.
> 
> Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> ---
> v1 -> v2:
> Suggested by Arnd Bergmann:
> 	- removed the select statement and replaced it by "depends on
> 	  COMMON_CLK"
> 
> Link v1: https://lore.kernel.org/linux-media/20250708161637.227111-1-mehdi.djait@linux.intel.com
> 
>  drivers/media/i2c/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index e68202954a8f..98750fa5a7b6 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -27,7 +27,7 @@ config VIDEO_IR_I2C
>  
>  menuconfig VIDEO_CAMERA_SENSOR
>  	bool "Camera sensor devices"
> -	depends on MEDIA_CAMERA_SUPPORT && I2C
> +	depends on MEDIA_CAMERA_SUPPORT && I2C && COMMON_CLK

As of now, this patch makes COMMON_CLK a requirement to use camera sensors.
I think you should depend on COMMON_CLK only on ACPI-based platforms as
non-CCF clock implementations are still in use and these platforms do not
use ACPI.

>  	select MEDIA_CONTROLLER
>  	select V4L2_FWNODE
>  	select VIDEO_V4L2_SUBDEV_API

-- 
Regards,

Sakari Ailus

