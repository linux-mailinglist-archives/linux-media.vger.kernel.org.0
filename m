Return-Path: <linux-media+bounces-31824-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB6CAABD02
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 10:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBEAC50741C
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 08:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B93CC24A043;
	Tue,  6 May 2025 08:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G+P7wqpC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BE3225A47;
	Tue,  6 May 2025 08:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746519850; cv=none; b=E58+vTEoOV02x4R+c2CSR0D8n4E35rmJSMw44uX3mgslXiJ5t2g9E6Zh2rNKCLo392uoPfIcITiw8yGUCV/fTKz/3ApcEi5NTin61l3wwG295M6gWCkRSA0YEWXs8zO/DOroTeL1L8W072+P7zzeyOLkaxU5J+guxp4ZE3CyFjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746519850; c=relaxed/simple;
	bh=4Vq0BqJ8nGlSIUsmUEbVToE2ay07PjBE/NACmYz5mQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=plIqoB3EFn2jJtqItoZdkbgPZCCdH9PFf9vn0sVfpitTxzsMU6XvT8pzDFuy7c8puKG6KlmK2LLSgmBxu39J+S6D6GBPYlr89pGIOs6xcyJmrChdczX32wCU0PeWs4rZjlwM+Iw1K3bmlIYLmgho6d2Evk6MwjyZO+S4lvNITuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G+P7wqpC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746519849; x=1778055849;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4Vq0BqJ8nGlSIUsmUEbVToE2ay07PjBE/NACmYz5mQ4=;
  b=G+P7wqpCcPwTgJMw9qC7FHv5nd0ip+Sx5t8iwPEU/29Z43VauqxICyPG
   sAqySludWaQpwOWTmbk9mPj0a/V2J/b0oHkr2CWurf1H+tHtsVSqdEs1L
   MZxDHM4cmfVL4vPxfKypgQ2cjkVw1O8B+0xkSvaczUxQtG0BrdAoOkESf
   i+wi7nu/c6OdP8Wc8A518IJz2t1INcYLt6ttyBkXZJFa7i9ieSzm1OuzR
   jRRZYh0Ay4Am1ivNdX1mrSL925UKAF3fZ2kaPWhBxuTz+mJUZPbemww98
   k/7qtvs2LAQnhxDFpcjCz7gFiKVJ5QwlRHBtjZi3SolHs+xyLBk4QgKwS
   A==;
X-CSE-ConnectionGUID: RiS/ppCoRGK4cFS642zCNQ==
X-CSE-MsgGUID: FseWoxXrS8qvWi/2gbp8YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="59563301"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="59563301"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 01:24:08 -0700
X-CSE-ConnectionGUID: pnnpdw61Q5O/uSeG+eOgtQ==
X-CSE-MsgGUID: EzFzhfzPTjmvSUshnZev1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="139593835"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.165])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 01:24:06 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8B33C11F828;
	Tue,  6 May 2025 11:24:03 +0300 (EEST)
Date: Tue, 6 May 2025 08:24:03 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: git@apitzsch.eu
Cc: Ricardo Ribalda <ribalda@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2 4/4] media: i2c: imx214: Remove hard-coded external
 clock frequency
Message-ID: <aBnHI1APgjfcj2xG@kekkonen.localdomain>
References: <20250505-imx214_ccs_pll-v2-0-f50452061ff1@apitzsch.eu>
 <20250505-imx214_ccs_pll-v2-4-f50452061ff1@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250505-imx214_ccs_pll-v2-4-f50452061ff1@apitzsch.eu>

Hi André,

On Mon, May 05, 2025 at 11:05:56PM +0200, André Apitzsch via B4 Relay wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> Instead rely on the rate set on the clock (using assigned-clock-rates
> etc.)
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
>  drivers/media/i2c/imx214.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 9e9be47394ec768a5b34d44b06b5bbb0988da5a1..c12996e294dccebb18c608254f1e0d14dc064423 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -32,7 +32,6 @@
>  
>  #define IMX214_REG_FAST_STANDBY_CTRL	CCI_REG8(0x0106)
>  
> -#define IMX214_DEFAULT_CLK_FREQ	24000000
>  #define IMX214_DEFAULT_LINK_FREQ	600000000
>  /* Keep wrong link frequency for backward compatibility */
>  #define IMX214_DEFAULT_LINK_FREQ_LEGACY	480000000
> @@ -1405,11 +1404,6 @@ static int imx214_probe(struct i2c_client *client)
>  		return dev_err_probe(dev, PTR_ERR(imx214->xclk),
>  				     "failed to get xclk\n");
>  
> -	ret = clk_set_rate(imx214->xclk, IMX214_DEFAULT_CLK_FREQ);
> -	if (ret)
> -		return dev_err_probe(dev, ret,
> -				     "failed to set xclk frequency\n");
> -

Oops. I missed this is what the driver was doing already. Indeed, this is
one of the historic sensor drivers that do set the frequency in DT systems.

The driver never used the clock-frequency property and instead used a fixed
frequency. Changing the behaviour now could be problematic.

There are options here that I think we could do:

1) use your v1 patch (4) which uses "clock-frequency" if it exists and
otherwise uses the default, fixed frequency or

2) set the frequency only if the "clock-frequency" property exists. The DT
currently requires clock-frequency and the YAML conversion was done in 2020
whereas the driver is from 2018. If we do this, the clock-frequency should
be deprecated (or even removed from bingings).

I wonder what others think. Cc'd Laurent in any case.

>  	ret = imx214_get_regulators(dev, imx214);
>  	if (ret < 0)
>  		return dev_err_probe(dev, ret, "failed to get regulators\n");
> 

-- 
Regards,

Sakari Ailus

