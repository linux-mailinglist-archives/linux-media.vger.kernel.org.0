Return-Path: <linux-media+bounces-30235-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40300A89D15
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 14:03:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A471F1894C1B
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 12:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F27294A16;
	Tue, 15 Apr 2025 12:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nxNeskT1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574E6292928;
	Tue, 15 Apr 2025 12:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744718590; cv=none; b=V4NayheIBzxyqRGFI9tG4z4B/3ICmAazf6eHBnCVSMucKLDgU41jqmL7h0uJ2Lj7P+SKO9n5kXVZtQPARVOlTQla1Fdz8BkSTfwnrczgYYZo8p0RviiMSf1L1Y9LeqL4TrqQF5PgijeZtBH2bm8M77LXOdruB675D7s2kHTURxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744718590; c=relaxed/simple;
	bh=wP0ThBUP8idHHlp9GFYkui5knj4p5JDuOZVp6VxxW1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NO1h5tgYzyR7QMd+4KUv8EFtJlRieGQnYTu58/duFdwMSPsJYhVO9UzgnXO3AHu0LCWvavRFybWSWIdZ7lg4WXLH4h0qWBRPwfBxhdaFP2xQHO4G1Zl559g8zMlTb1BCoZlIja156Q2HhD+tsOtUsfW1fTWkNInQJaftKo7vY8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nxNeskT1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744718589; x=1776254589;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wP0ThBUP8idHHlp9GFYkui5knj4p5JDuOZVp6VxxW1g=;
  b=nxNeskT1PxBVtwmWfI/VFbY9t5+BgjiAtuSIIymRczhkAhQwJQaY3zUk
   HuBx4ekNU/Dp42L3atk13KgH2s+T0myqje+aBiqZDdddYpv0jBPRmCj0O
   daFw2nYsa0t0tS18UpHdd1ZLc6mzT9o9mrUPQSE0luL/Je33lSg1dZRfx
   pivtnCJhvyDas1OBVj1A77pEJSOpkZzmAg6mzbjc2LzdhmFg/sN1+ayqZ
   RnMXm0AEZwz077KxbjWEeSnXwOQTQ/uXcDHKf+wYrkL0Sgr62KB+GVUVC
   zq/GkFPHoB4q0KgpspsBWtI852CEVpx3BrdcW0DuCzRowk1EQsQRLudLE
   g==;
X-CSE-ConnectionGUID: Ga5xHXMXR0+uYSS7PLCrbQ==
X-CSE-MsgGUID: TmPtaVagQPWqa9j4tXz9ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="50024649"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="50024649"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 05:03:05 -0700
X-CSE-ConnectionGUID: 3RR6Zl5xQ6CQOS5K1uL85w==
X-CSE-MsgGUID: 4d9SMaeXSQy6BsoqVm3BYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="153298578"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 05:03:03 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A345011F7E7;
	Tue, 15 Apr 2025 15:03:00 +0300 (EEST)
Date: Tue, 15 Apr 2025 12:03:00 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Sunny Patel <nueralspacetech@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov13858: Enable clock frequency macro
Message-ID: <Z_5K9Kz2i8TouhC4@kekkonen.localdomain>
References: <20250406144322.88464-1-nueralspacetech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250406144322.88464-1-nueralspacetech@gmail.com>

Hi Sunny,

On Sun, Apr 06, 2025 at 08:13:22PM +0530, Sunny Patel wrote:
> Defines a macro `OV13858_MCLK` for the clock frequency (19200000 Hz).
> Replaces the hardcoded clock frequency value in the probe function.

Thanks for the patch.

While the patch seems fine, the subject and the commit message would
benefit from some attention. For instance, don't use third person without a
subject. Please see examples in existing commit messages, too.

The clock seems to be called "EXTCLK" in the datasheet, too.

> 
> Signed-off-by: Sunny Patel <nueralspacetech@gmail.com>
> ---
>  drivers/media/i2c/ov13858.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
> index 7a3fc1d28514..a1242a90cdc9 100644
> --- a/drivers/media/i2c/ov13858.c
> +++ b/drivers/media/i2c/ov13858.c
> @@ -21,6 +21,8 @@
>  #define OV13858_REG_SOFTWARE_RST	0x0103
>  #define OV13858_SOFTWARE_RST		0x01
>  
> +#define OV13858_MCLK				19200000
> +
>  /* PLL1 generates PCLK and MIPI_PHY_CLK */
>  #define OV13858_REG_PLL1_CTRL_0		0x0300
>  #define OV13858_REG_PLL1_CTRL_1		0x0301
> @@ -1664,7 +1666,7 @@ static int ov13858_probe(struct i2c_client *client)
>  	u32 val = 0;
>  
>  	device_property_read_u32(&client->dev, "clock-frequency", &val);
> -	if (val != 19200000)
> +	if (val != OV13858_MCLK)
>  		return -EINVAL;
>  
>  	ov13858 = devm_kzalloc(&client->dev, sizeof(*ov13858), GFP_KERNEL);

-- 
Kind regards,

Sakari Ailus

