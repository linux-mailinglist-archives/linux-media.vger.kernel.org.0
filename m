Return-Path: <linux-media+bounces-22878-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 816859E929D
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 12:40:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 164191883C1A
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 11:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA6521E0BF;
	Mon,  9 Dec 2024 11:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IYsXQh/P"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A761621B90B
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 11:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733744407; cv=none; b=mh1mztyzzHKQAt4e6CmqlDqqVms1w81Z1Mgy6mDgSsF0WDv0ZUExJDEnn9yoMu9IsQwzR7hsTmVQjSEwPDfC13xSprNsQ4A/2NVfJnvUjBNMgfFaX5Zh/knlXbpCvtMjd7yzfBbHDGxDv50wXFAT244pPQoVO0yUM/n5Bo8TRQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733744407; c=relaxed/simple;
	bh=QKZa8zi54vz5jBGXprGdg3VItqB3NCisdYslGHBgnA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XzlNk8PQB1ktmoFBIPcXP0vSBcOl7lPcWKakbS5gWlwhOQfJocwTUBgH8DoorROAWfxBflsb24xmQ0VVvpWM/0VlAhoXLmhe7+yB9Uo9Rmtqzdd+C0IU8KrP4hYoqC2kwEwA2hhER8CeSMzehlTCLQtnhSD/4BkhlULnziR0B/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IYsXQh/P; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733744406; x=1765280406;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QKZa8zi54vz5jBGXprGdg3VItqB3NCisdYslGHBgnA8=;
  b=IYsXQh/PFOUHHszMHHfgga3Sq5NmGAoG/5SoHzQ1zZYgc+t6d1s3Vf1a
   3ka/SONsUKL0sMx6ZvrdSItbYqmdUfUvDthqjn+SBIbvRV7NQOr1s760Z
   U4nqqBoRcFA8EyXY6Ab4w6q3zW5ayQMuXEr1CEoBM63FDZNCZrHhNsV53
   TTqaoUjpN7ePkyU3wKOQ/4HQvtgI1wErriCETxAMxiRkyVtyK+Cq33/Ze
   vwut1Um2Q2pXlcGZMgRT/XnWxDdopw97i4nYsseLK9kb+o58n4JunTY1N
   0rcTxKLVraKGUIc3L3b0J8axCWtWRnAik6VBV44pjEkXmIA+YI+76WecW
   g==;
X-CSE-ConnectionGUID: FCSuM0clSTulBsLimRbJRg==
X-CSE-MsgGUID: r9Efon6URgKi4FgFgQPFKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="36873403"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="36873403"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 03:40:05 -0800
X-CSE-ConnectionGUID: VlHSUraBTFOkzr88UFWIaw==
X-CSE-MsgGUID: 1ySaz9UCT8GhQEcwe7ZSqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="100078742"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 03:40:04 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CAACF11F775;
	Mon,  9 Dec 2024 13:40:00 +0200 (EET)
Date: Mon, 9 Dec 2024 11:40:00 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: linux-media@vger.kernel.org, david@ixit.cz
Subject: Re: [PATCH] media: ccs: Print a warning on CCS static data parse
 failure
Message-ID: <Z1bXED_CbIvPUDUG@kekkonen.localdomain>
References: <20241209111738.79679-1-mehdi.djait@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209111738.79679-1-mehdi.djait@linux.intel.com>

Hi Mehdi,

On Mon, Dec 09, 2024 at 12:17:38PM +0100, Mehdi Djait wrote:
> ccs_data_parse() return value is not propagated up to the probe
> function, making it difficult on static data parse Failure.

Could you reword this by referring to the CCS static data library only?
This would fit better for the CCS tools where the patch will also be
imported to.

<URL:https://github.com/MIPI-Alliance/ccs-tools>

I also wonder if the CCS driver should actually fail probe if parsing
fails: this is a very likely problem and quitting there would be
appropriate IMO. Not every device might need one, so it should be just
based on parser failure.

Thanks.

> Improve this by printing a warning when ccs_data_parse() fails.
> 
> Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> ---
>  drivers/media/i2c/ccs/ccs-data.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-data.c b/drivers/media/i2c/ccs/ccs-data.c
> index c40d859166dd..f64fbfa1c7b5 100644
> --- a/drivers/media/i2c/ccs/ccs-data.c
> +++ b/drivers/media/i2c/ccs/ccs-data.c
> @@ -976,6 +976,7 @@ int ccs_data_parse(struct ccs_data_container *ccsdata, const void *data,
>  out_cleanup:
>  	kvfree(bin.base);
>  	memset(ccsdata, 0, sizeof(*ccsdata));
> +	dev_warn(dev, "failed to parse CCS static data file: %d\n", rval);

s/ file//

>  
>  	return rval;
>  }

-- 
Kind regards,

Sakari Ailus

