Return-Path: <linux-media+bounces-33354-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAE5AC3B13
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 10:05:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 429AA168932
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 08:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0431DED56;
	Mon, 26 May 2025 08:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C1NWBRxa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED878256D
	for <linux-media@vger.kernel.org>; Mon, 26 May 2025 08:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748246704; cv=none; b=XbU44mVw60jGnX0bkkQLSmLFiFPpay3lT8Gqs56oNjNEaWe5WShuxKcfg73tIQNY+dxEp1fMJSMPRFmPVB6qH99wSIeuicnyPRLZq2NTL0d2WyELu2kGHiCjSQ/YN0PkzGzMH/+til4NRp8aCj3Lu/vSbx5DsfKNSOZzMb5qnIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748246704; c=relaxed/simple;
	bh=pk8u74y+7mkO96EwpNRIF0jRbpYncYqLssKAOyfnB1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OyHXQPmV3i2W2MJULGmLH560//B8tjTHnJJYKG4D7Yswm8PMdOmgtszZqsUtRlI6plnMJBWaLs+9fWly5tJfN53hybeVHxWN5n8NVVS8vITZBn/QVbwXVCg+agaeXyzUWnO1lrf/EWcRhtwhuWKxUbqEvOwJDp/IMQgkzRC+Np0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C1NWBRxa; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748246703; x=1779782703;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pk8u74y+7mkO96EwpNRIF0jRbpYncYqLssKAOyfnB1U=;
  b=C1NWBRxa2qjD1QrmwcxbV1LbGCu6sK2evL90uzqIVAXBNoo3HpiRAiBL
   7M6/g/wvyyrGZZ8LK+nvrpGwebw3rkvtUQd33OhakhyBAN4OH0ImXlMRK
   fgTbbVW1hGyZpRttC/sLpsr5cBdkNzqcokAYJRFfsj6aM5YBPpWkwHdXP
   X0gcliUcalaR198IOk0sxwRNpxJx0Y+WuPnZOhVex9no1Q5b1g3x+jow3
   zMGqt31xr+MeVyCikEY4l9HqS1rXAgxm1rua/MFNcX9ySMYUWBfWf+zGU
   LLCnVRduoReyxSQcpHHZyEJBFAn1YBIylRdbHhWb5WETgl0tuZc2xpGXB
   w==;
X-CSE-ConnectionGUID: ZZMfMSExTZikOOQl3Zmn+Q==
X-CSE-MsgGUID: kdb+4JufTlKlEU8RXzhtnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="60843094"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="60843094"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 01:05:02 -0700
X-CSE-ConnectionGUID: 1XoswmuxS4CT/ns962AEGA==
X-CSE-MsgGUID: SdLah10hQtKlwbE9hqwqWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="165447361"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.125])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 01:05:00 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1346211F731;
	Mon, 26 May 2025 11:04:58 +0300 (EEST)
Date: Mon, 26 May 2025 08:04:58 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: mhecht73@googlemail.com
Cc: linux-media@vger.kernel.org, tomm.merciai@gmail.com,
	martin.hecht@avnet.com, Martin Hecht <mhecht73@gmail.com>
Subject: Re: [PATCH] media: i2c: alvium: Accelerated alvium_set_power
Message-ID: <aDQgqo8NBB-tXOpt@kekkonen.localdomain>
References: <20250513141019.3871882-2-mhecht73@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513141019.3871882-2-mhecht73@gmail.com>

Hi Martin,

Thanks for the patch.

On Tue, May 13, 2025 at 04:10:20PM +0200, mhecht73@googlemail.com wrote:
> From: Martin Hecht <mhecht73@gmail.com>
> 
> Now alvium_set_power tests if Alvium is up and running already instead
> of waiting for the period of a full reboot. This safes about 7 seconds
> delay for each connected and already booted camera especially when
> using multiple Alvium cameras.
> 
> Signed-off-by: Martin Hecht <mhecht73@gmail.com>
> ---
>  drivers/media/i2c/alvium-csi2.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
> index 05b708bd0a64..c7d39b10d1a2 100644
> --- a/drivers/media/i2c/alvium-csi2.c
> +++ b/drivers/media/i2c/alvium-csi2.c
> @@ -2367,6 +2367,9 @@ static int alvium_get_dt_data(struct alvium_dev *alvium)
>  static int alvium_set_power(struct alvium_dev *alvium, bool on)
>  {
>  	int ret;
> +	int alvium_boot_time_timout = 7000;
> +	const int alvium_poll_interval = 500;
> +	u64 val = 0;
>  
>  	if (!on)
>  		return regulator_disable(alvium->reg_vcc);
> @@ -2375,8 +2378,22 @@ static int alvium_set_power(struct alvium_dev *alvium, bool on)
>  	if (ret)
>  		return ret;
>  
> -	/* alvium boot time 7s */
> -	msleep(7000);
> +	/* alvium boot time is less than 7s, but eventually it's already on */
> +	do {
> +		alvium_read(alvium, REG_BCRM_HEARTBEAT_RW, &val, &ret);
> +		if (ret >= 0)
> +			break;
> +
> +		msleep(alvium_poll_interval);
> +		alvium_boot_time_timout -= alvium_poll_interval;
> +	} while (alvium_boot_time_timout > 0);

Please use read_poll_timeout() for this.

> +
> +	if (ret < 0)
> +		return ret;
> +
> +	if (alvium_boot_time_timout <= 0)
> +		return -ETIMEDOUT;
> +
>  	return 0;
>  }
>  

-- 
Regards,

Sakari Ailus

