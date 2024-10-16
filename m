Return-Path: <linux-media+bounces-19762-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0E19A0AE3
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 14:57:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B97E31F26366
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 12:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD89209F21;
	Wed, 16 Oct 2024 12:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U7rh8kBz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5E8208980;
	Wed, 16 Oct 2024 12:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729083458; cv=none; b=NvWHIso76lk49wNB/Of40r/tzuTPqKcPwVGzvfrUpiy4zvRKTduPMzu2lbenZAjnlfghdTpTBFiMFNK+dFaVYNdk1Nq92kiUQG3nTj5H+CfMkbVbZV9noDcq/K30LfR7yhbGOOlfcezZH/4TF0J0IGWJAZRgLtaMMV7KHcvn/zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729083458; c=relaxed/simple;
	bh=LvLMHQGJAvYO/dKqTYLk5f3spffzr3oHEXbV5qyztso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rmXmUtMUr64B5orf3oXTD+c5FNWZEJacPKWKPBIes6z9T99tb4UW9kusL+RlpZXkW+U5c86C0a0/6D449Q8c6/Lnqiy7fZlpGQNi1hBkKhzUTyq/HO8RVpzPxtRf2Zk7FmU8gGUXuNJXW7EcQU8kgCtsKg5sCAlQpT02veT2//o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U7rh8kBz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729083457; x=1760619457;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LvLMHQGJAvYO/dKqTYLk5f3spffzr3oHEXbV5qyztso=;
  b=U7rh8kBzMkAN9bhHhB7UB97fcmfFcqSb0JeeCB4you+qdShIudSpvBH8
   us3IZjK9QoDXv0sUeXVO20raNzt9yriTYSdy7ygl+QKjspTHOgXK56MAx
   h2+bgj6Antv8yZmISMKD3f5MMNJptG70JoZXwC/hiU1CyRB3+/bIrM9g1
   ZqCZtqeXKRMNAThzMjK6kSFrkZIIp3EoHdOic9efUeOsk8QsIbNr43du2
   lIMWN33ZojneM03UNzjEfLOPTSjOQWyVbnETAIh1Xssuzwu9iGwAa9bQy
   bXe3hwvXRISwZOgha8ipekdR3N00iZGXj4KlJ0ScL055GuGPLJLxqI8IA
   A==;
X-CSE-ConnectionGUID: b54Fh8RaSi2a1miMBK0i1Q==
X-CSE-MsgGUID: P7GfvZlRRsCdvjRdT8V22w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51064199"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="51064199"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 05:57:35 -0700
X-CSE-ConnectionGUID: g7vC8qJ4RoKmAQd7+mpBng==
X-CSE-MsgGUID: M/AeNeg+R++xL0Olth51ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="82761945"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 05:57:32 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 923F111F7E7;
	Wed, 16 Oct 2024 15:57:29 +0300 (EEST)
Date: Wed, 16 Oct 2024 12:57:29 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 08/13] media: ar0521: don't overflow when checking PLL
 values
Message-ID: <Zw-4OVuTCE13H-Yl@kekkonen.localdomain>
References: <cover.1729074076.git.mchehab+huawei@kernel.org>
 <39b23d468eea2714a24a94cb6c20aef5aff492e6.1729074076.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39b23d468eea2714a24a94cb6c20aef5aff492e6.1729074076.git.mchehab+huawei@kernel.org>

Hi Mauro,

On Wed, Oct 16, 2024 at 12:22:24PM +0200, Mauro Carvalho Chehab wrote:
> The PLL checks are comparing 64 bit integers with 32 bit
> ones. Depending on the values of the variables, this may
> underflow.
> 
> Fix it ensuring that both sides of the expression are u64.
> 
> Fixes: 852b50aeed15 ("media: On Semi AR0521 sensor driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/i2c/ar0521.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> index fc27238dd4d3..24873149096c 100644
> --- a/drivers/media/i2c/ar0521.c
> +++ b/drivers/media/i2c/ar0521.c
> @@ -255,10 +255,10 @@ static u32 calc_pll(struct ar0521_dev *sensor, u32 freq, u16 *pre_ptr, u16 *mult
>  			continue; /* Minimum value */
>  		if (new_mult > 254)
>  			break; /* Maximum, larger pre won't work either */
> -		if (sensor->extclk_freq * (u64)new_mult < AR0521_PLL_MIN *
> +		if (sensor->extclk_freq * (u64)new_mult < (u64)AR0521_PLL_MIN *
>  		    new_pre)
>  			continue;
> -		if (sensor->extclk_freq * (u64)new_mult > AR0521_PLL_MAX *
> +		if (sensor->extclk_freq * (u64)new_mult > (u64)AR0521_PLL_MAX *
>  		    new_pre)
>  			break; /* Larger pre won't work either */
>  		new_pll = div64_round_up(sensor->extclk_freq * (u64)new_mult,

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

