Return-Path: <linux-media+bounces-36986-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F66AFB228
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 13:20:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6457A1706E5
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 11:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A754B29994A;
	Mon,  7 Jul 2025 11:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aXwgORC1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DC51EA7F4
	for <linux-media@vger.kernel.org>; Mon,  7 Jul 2025 11:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751887209; cv=none; b=d2H5mUY5lJVEf+bLanWxakiSx5Cax+bK5W45entRw0/VpR9u78Vwd8nxv/l03YhvFVcDWlfLzPFvVNB5w1GsGZQOUgB+AboRDGFSCX6P6ivjOtG3Oo6IiRmX0h3ybkdMxrfXGjxBmT/hoytRpEJJpRR9gG3UHIuqAspCm9bVTgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751887209; c=relaxed/simple;
	bh=bSGhFDjhKbAh5jTSPYc1zs6QthHUlQee4oW5K2f/adk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q83xoMyU2BAFLVckDLOhIhC3/CsHnKCc8rMis9bsyqqy0nL5ws1CTp5n1LVh+RIUk+XzPwBFYD7OYTM8GF1wTxwlGfaOobtVv9IwC1/O9mZ0y4+bCrIkZyVyBb36NAgW1vufXt5iX4qpKqyXeKZj9jk1KxhY9o3N73Q3vT6CEwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aXwgORC1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751887207; x=1783423207;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bSGhFDjhKbAh5jTSPYc1zs6QthHUlQee4oW5K2f/adk=;
  b=aXwgORC1upM4n69AjZGeDbF2JP/nObf7d4pQHKhnLgx4Do5BToN6Cbj/
   hJp+IpBOVYBMbV2jkKd9G7ErS46jPzjd818qe5gWim0A4lVrvrUuQr37U
   VOtmSnIGNhPBlW6X/sTPObaGn6xsi0GpQTaxGlnKAOASOb58T4F4NN49P
   uewLp2+GprgjEQIwmOmPxBphPmWgf3IFbJtEvBW3l9m/wzXyqS5WoNdkl
   9nxgGpuTTUWQvav5idapkSWJ8KFLd1i4DkEA+glhx5iCeG1alRLh+xXrN
   S8itaV2qpi+vj2PkizPaXSEqp0za49sO+p543Kf9OhxBCDGNZW33oUeb0
   g==;
X-CSE-ConnectionGUID: ahhEycExTD2sQXIhaLN2/Q==
X-CSE-MsgGUID: NoWwM3jHSJ+ldD8kv78eTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="65451821"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="65451821"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 04:20:06 -0700
X-CSE-ConnectionGUID: Yrx4J8pXRGS+UOBmM0KdXw==
X-CSE-MsgGUID: ZOW+Q3PORIGJmTEv4+rB9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="155773487"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.101])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 04:20:06 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0C36411F8D7;
	Mon,  7 Jul 2025 14:20:04 +0300 (EEST)
Date: Mon, 7 Jul 2025 11:20:03 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl,
	bingbu.cao@linux.intel.com
Subject: Re: [PATCH] media: staging/ipu7: use 64-bit macro for post delay
 calculation
Message-ID: <aGutY-iTiwBuHt0W@kekkonen.localdomain>
References: <20250707095806.3425876-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707095806.3425876-1-bingbu.cao@intel.com>

Hi Bingbu,

Thanks for the patch.

On Mon, Jul 07, 2025 at 05:58:06PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> When build ipu7 driver with i386 config, it will report error:
> ERROR: modpost: "__udivdi3" [../intel-ipu7-isys.ko] undefined!
> 
> This patch fix the problem by using correct math macro to implement
> the 64-bit value division instead of C divide operator.
> 
> This patch also update the calculation to make it aligned with
> the formula in the specification.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202507051239.cb4TkmuW-lkp@intel.com/
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/staging/media/ipu7/ipu7-isys-csi-phy.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
> index 4407750c7f40..1ac68696983e 100644
> --- a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
> +++ b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
> @@ -731,6 +731,7 @@ static void ipu7_isys_cphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
>  	u16 delay_thresh;
>  	u16 reset_thresh;
>  	u16 cap_prog = 6U;
> +	u32 t3 = 224U;
>  	u16 reg;
>  	u16 val;
>  	u32 i;
> @@ -815,9 +816,7 @@ static void ipu7_isys_cphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
>  		dwc_phy_write_mask(isys, id, reg + 0x400 * i,
>  				   deass_thresh, 0, 7);
>  
> -	delay_thresh =
> -		((224U - (9U * 7U)) * 1000U) / (5U * mbps) - 7U;
> -
> +	delay_thresh = div64_u64((t3 - 63U) * 1000U, 5U * mbps) - 7U;

Not directly related to this patch, but what these values signify?

Moving 224U to a new local variable named t3 doesn't really change this.
I.e. I'd just use the plain value here, too, and have some explanation
added for these later on.

>  	if (delay_thresh < 1)
>  		delay_thresh = 1;
>  

-- 
Kind regards,

Sakari Ailus

