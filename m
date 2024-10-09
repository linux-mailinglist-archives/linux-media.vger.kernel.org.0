Return-Path: <linux-media+bounces-19324-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C79F996B92
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 15:17:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C4042838D4
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 13:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5645B194091;
	Wed,  9 Oct 2024 13:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="js5K285r"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A50E555
	for <linux-media@vger.kernel.org>; Wed,  9 Oct 2024 13:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728479813; cv=none; b=AOp23dWAohguCqrw5QhldznBBJQReBslkwcvEsDiDmcD26mEwFENdq7VVTAbpDOoLtnjuvd7X8YzeVpXm6rg30ls3+NOdHvhXUpP9RZG0q98W+M2GebEM9M7IB9qqtinOe9ivfbrJG15diJHzJcg/xB0Z2KuvBc3x96NMNFA9fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728479813; c=relaxed/simple;
	bh=1vc/6Qj/R4WmS6s7Ls7P7d+pJvbe4CQEJV5mHbRL/kQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=at/ktDkD2EKO4ytg7nUx7lybgbg7FQWBWbm6uAsU4IH9UwOfLj5K/X806Xlc+px9Y0b2mqmbny4zfSf7cAFjAXpu2lPUaXWgRpbq0R29m3PHB2kRQKMjIFlq4GpP4OtQYnttZjY+ZzKR8Ozq37WQr4KBrP/q9f084vVeNnNhK5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=js5K285r; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728479812; x=1760015812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1vc/6Qj/R4WmS6s7Ls7P7d+pJvbe4CQEJV5mHbRL/kQ=;
  b=js5K285rtxkLmILm5L1q0/O6UFzztg5wekycOXNxkiL8l2U9DqAZUXEW
   ZpiCwr5x7PpEohcZHbbwrLcA9AxMR/d/JyAtaH7IVb7v3Flu37LtA1Ww7
   JmKWcbSLwLdc/cffB9wrkHSXep2819wBZ2DBLMz1KJRCDy4PcWkLOb/M7
   NbtOFsm6PYchl3ESakk96z81z5uOfzTfBE8ZvPoCQbI3PVekanWhTS5LC
   XQRM3E5Lp8fkPVdreEN006UmGp2Z8FTXBEQ7iRWtEc6c9l2bdU3Ew+YAE
   5zPMMQSxQtVB+XB1SyOiJn9q8lU3QC+RttoKqLr3lKD2HHAknkkjZIueo
   Q==;
X-CSE-ConnectionGUID: VLEMrAxlTiCxz0+FylxuBg==
X-CSE-MsgGUID: usMCWCykTAOhmQE0YgfyQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="31671076"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="31671076"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 06:16:51 -0700
X-CSE-ConnectionGUID: 1gnlzrc2TEWE8sX5ZYCr0A==
X-CSE-MsgGUID: jyatgAKpQS+x+Ukvggc4Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="107073405"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 06:16:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1syWYZ-000000018LD-3Nfu;
	Wed, 09 Oct 2024 16:16:47 +0300
Date: Wed, 9 Oct 2024 16:16:47 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: bingbu.cao@intel.com, linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Subject: Re: [PATCH 1/2] media: ipu6: fix the wrong type cast and 64-bit
 division
Message-ID: <ZwaCP253Ahgqvn0v@smile.fi.intel.com>
References: <20241008061916.313517-1-bingbu.cao@intel.com>
 <ZwVOiq0RCJu9ECcr@smile.fi.intel.com>
 <6a6e8137-97f0-0af8-51b3-73e4f45e73c2@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a6e8137-97f0-0af8-51b3-73e4f45e73c2@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Oct 09, 2024 at 01:06:32PM +0800, Bingbu Cao wrote:
> On 10/8/24 11:23 PM, Andy Shevchenko wrote:
> > On Tue, Oct 08, 2024 at 02:19:15PM +0800, bingbu.cao@intel.com wrote:
> >> From: Bingbu Cao <bingbu.cao@intel.com>

...

> >>  /* Shared structure between driver and FW - do not modify */
> >>  struct ipu6_fw_sys_queue {
> >> -	u64 host_address;
> >> +	uintptr_t host_address;
> > 
> > Okay, in the given semantic this probably should be phys_addr_t.
> > BUT, is this address somehow is going to be used by IPU6 hardware?
> > If "yes", the type shall not be changed.
> > 
> > Looking at types used I hope the answer is "no", otherwise the types
> > in the structures should be  properly choose WRT endianess (and what
> > __packed is doing here? Is it part of the protocol?).
> 
> You are correct, the type here should not be changed.

Okay, so perhaps for now we can amend the code to work around 32-bit
compilation issues while leaving the type the same. Ideally this struct should
be modified to follow endianess (all those types with __le prefixes), but
that is another story.

> >>  	u32 vied_address;
> >>  	u32 size;
> >>  	u32 token_size;

> >>  } __packed;

...

> > Side Q: What are the alignment requirements for the prog pointer?
> 
> It should be 64 bytes alignment.

Okay, so in this case it's good to cast like this. Perhaps a comment should be
added at some point, because it sounds like I already asked the very same
question a while ago.

-- 
With Best Regards,
Andy Shevchenko



