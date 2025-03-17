Return-Path: <linux-media+bounces-28345-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B26A64956
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 11:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA51C169B31
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 10:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB89230274;
	Mon, 17 Mar 2025 10:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eWb79POI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E0C11185;
	Mon, 17 Mar 2025 10:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742206650; cv=none; b=qXuZu+CBoGFjx9RF8QBLgFzmfFCNVh1IA/0mlGSgDkY2XLWd1tTq6MaeO7YyP/4iaQfrS2Cb/5xm7euJbOMMIWtqsobZgNvD5o8T5zspqWIESr/Kxq81HLaGEI2jIXdk5YMJ2oFudgU/EXyZPn6qzQdIaq7hH3vcqo3ATZh0YJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742206650; c=relaxed/simple;
	bh=7Ig07IL0hYtvwsZbHSCfJWHOKySji8yIp6WpMqp8UoI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WchzWhvB77kruxyIkeaVJAiiNnv2kn0lfyOS4YYwCAiYP8hdhzVFSlcsg23VUOrj0g2FWa9gpqW+XFDnKoV0SZxrEFXs3PUN9CUPvG+CYyTGw4woKflfq4bmNPtY8Rnm4GECIiDapbcnJQ3POr6dJU3inYmYwxlIcFhdtglk/vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eWb79POI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742206649; x=1773742649;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7Ig07IL0hYtvwsZbHSCfJWHOKySji8yIp6WpMqp8UoI=;
  b=eWb79POIH/B+5En0y5jpk5cmFzSSWRmduNWRdrxgnCrC+vvMjfKn39/2
   25TCv5nEVXa8koeJZhD1S5SAcElFAnvRol5D7D77plvc5ObovBjnKyn6Q
   AN9Wb+XG/R2QNy1HhnJHND+c8C0hpPY1NYuSGPKpqHBksOK3MwVF34aCF
   jOygAIod0mKrzUbfXErUIYwNXkUH4dT9rI3Ag2vr2SbnbPCDBMAS5cixT
   v2z00QCyC43Z4ynw9ZlnaunEHItR01c3WR/GM5w/+Gzqo/XTIlmtTWYdm
   TqxBY6XTcq20Cz1NczgzmhKBfoElv5Lf6uj7+uW4SD3bshTUuVbHbT4Sf
   A==;
X-CSE-ConnectionGUID: RnCZ/VaeR5yCZ0tHxTiYJQ==
X-CSE-MsgGUID: QAv42ZRyTRKqXWaOMOSSfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="65757409"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="65757409"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 03:17:28 -0700
X-CSE-ConnectionGUID: 2hr63sXWQ8yQTBQvVCCZBQ==
X-CSE-MsgGUID: ny9JBYUyQrm7SvcIbDHPEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="127076450"
Received: from unknown (HELO [10.238.224.248]) ([10.238.224.248])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 03:17:26 -0700
Message-ID: <ecb959fe-69e3-4265-9e4b-326bff421153@intel.com>
Date: Mon, 17 Mar 2025 18:17:23 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: lt6911uxe: Fix Kconfig dependencies:
To: Arnd Bergmann <arnd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: Arnd Bergmann <arnd@arndb.de>, Sakari Ailus
 <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250314154738.3983798-1-arnd@kernel.org>
From: "Yan, Dongcheng" <dongcheng.yan@intel.com>
Content-Language: en-US
In-Reply-To: <20250314154738.3983798-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Arnd,

On 3/14/2025 11:46 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The new driver fails to build if I2C is disabled:
> 
> drivers/media/i2c/lt6911uxe.c:703:1: error: data definition has no type or storage class [-Werror]
>   703 | module_i2c_driver(lt6911uxe_i2c_driver);
> 
> or if I2C is on but V4L2_CCI_I2C is not:
> 
> ERROR: modpost: "cci_write" [drivers/media/i2c/lt6911uxe.ko] undefined!
> ERROR: modpost: "cci_read" [drivers/media/i2c/lt6911uxe.ko] undefined!
> 
> For both by adding a dependency on I2C and selecting V4L2_CCI_I2C, which
> follows the common practice for these.
> 
> Fixes: e49563c3be09 ("media: i2c: add lt6911uxe hdmi bridge driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/media/i2c/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index e576b213084d..b06365d02ef1 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -1149,8 +1149,9 @@ config VIDEO_ISL7998X
>  
>  config VIDEO_LT6911UXE
>  	tristate "Lontium LT6911UXE decoder"
> -	depends on ACPI && VIDEO_DEV
> +	depends on ACPI && VIDEO_DEV && I2C
>  	select V4L2_FWNODE
> +	select V4L2_CCI_I2C
>  	help
>  	  This is a Video4Linux2 sensor-level driver for the Lontium
>  	  LT6911UXE HDMI to MIPI CSI-2 bridge.

Thanks for your fix.

Lkp is a bit weird to me, because it tested a warning in patch v6 likes
below:

    kismet: WARNING: unmet direct dependencies detected for V4L2_CCI_I2C
when selected by VIDEO_LT6911UXE

So I remove this select flag and passed lkp build test in patch v7.
But now it encounters build error again, I'm curious why...

Thanks,
Dongcheng


