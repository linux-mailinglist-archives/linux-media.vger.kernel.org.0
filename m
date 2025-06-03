Return-Path: <linux-media+bounces-34031-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80957ACCFA0
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 00:11:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16B8B7A9AE6
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 22:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8BE722D4C0;
	Tue,  3 Jun 2025 22:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JdW1pHQZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC61226CE6
	for <linux-media@vger.kernel.org>; Tue,  3 Jun 2025 22:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748988637; cv=none; b=k3oxZ38n+td6EhRZxGYQa3tB3XopSz21L1J4qeJLOTijXNkbcuvfoqRZF0UN0c2CfVk4WNNE7IGof+svG2ZVeVMzdsEnsTrOOrhdGfxiDV0Pdcp27bx78LqKYjtSNd2L2xZ/fM0u0vjEt3/83RyQIosr9r/n3kwutaYbsJwXDZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748988637; c=relaxed/simple;
	bh=+xR+DnNGT7WzXSdTYBzeZb9zqYYE9cyTvVMdCr5ZD0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sw6h+MH7V+EyFB5G4F1iYMqzIpxBPgUym3EM+DuhxtTx7HS5aGH27BRdXq1/cdfXB+Zt8CXWdJuMT90EioCOGlG1qMh2REfvC8pI6FkWRyPIHZza2hdy3MgIn7SMzS+bARIgxo2k37Dmt32HsNWHYikHExQjooTdrJDbILxBKQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JdW1pHQZ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748988636; x=1780524636;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+xR+DnNGT7WzXSdTYBzeZb9zqYYE9cyTvVMdCr5ZD0o=;
  b=JdW1pHQZQEhZUJl9fAmlPz67hnHTD3xbgZSCk7wg9rkps5ypaOzotnXb
   /UE/xia6nexbCoCOX4PaBgj/I5cvWXqAIEzfzpnTb1ISW/mcatwVttfOy
   LeZ5/gdaYO+tlSHZzh4p7P2vsL3GLFZ7E0VcwCOwE0/6ini1l20aDQSHX
   iLymKzbCAZr/7xZIfkedcYcVJaHMYcN/i+CLNuDh79xNdCky1BuWbFbwp
   5uHKBJIAIIJV0QwvXhHKMMjzhz8lKJ+d+11UaO2Uxa8SkxpA5bx/WMlmF
   4GWqdHFUxaKTdaHlvbv1JV3J8IXF3RjlrFohJr3jUrNEWmYHCp+hr8LhO
   g==;
X-CSE-ConnectionGUID: 5Hxng3ykQfq2cbLgAdwGRQ==
X-CSE-MsgGUID: x4zR2n5cSEO6yqDikY4d1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="53676996"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; 
   d="scan'208";a="53676996"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 15:10:35 -0700
X-CSE-ConnectionGUID: tDthVrysSlmWaZSH107HeQ==
X-CSE-MsgGUID: bu1mhP3fRmKBjNQvQgayKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; 
   d="scan'208";a="145466307"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.17])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 15:10:34 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 503D011FC2C;
	Wed,  4 Jun 2025 01:10:31 +0300 (EEST)
Date: Tue, 3 Jun 2025 22:10:31 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, stanislaw.gruszka@linux.intel.com,
	bingbu.cao@linux.intel.com
Subject: Re: [PATCH 1/3] media: staging/ipu7: add register definitions
 cleanup in TODO
Message-ID: <aD9y18qTzyQOA_51@kekkonen.localdomain>
References: <20250603074914.2494111-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603074914.2494111-1-bingbu.cao@intel.com>

Hi Bingbu,

Thanks for the patch.

On Tue, Jun 03, 2025 at 03:49:12PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> Some register definitions need a cleanup, so add a new item
> in TODO.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/staging/media/ipu7/TODO | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/staging/media/ipu7/TODO b/drivers/staging/media/ipu7/TODO
> index 7031d0179c7d..3351720125f8 100644
> --- a/drivers/staging/media/ipu7/TODO
> +++ b/drivers/staging/media/ipu7/TODO
> @@ -17,3 +17,7 @@ staging directory.
>  - Work with the common IPU module
>    Sakari commented much of the driver code is the same than the IPU6 driver.
>    IPU7 driver is expected to work with the common IPU module in future.
> +
> +- Register definition cleanup
> +  Cleanup the register definitions, remove some unnecessary macros
> +  and 'U' suffix.

As noted, after reflecting on the topic, I'm fine with that (as long as the
figure is meant to be unsigned, decimal or hexadecimal).

This should be really about the fitness for the purpose of the register
definitions as well as their naming (e.g. missing IPU7 prefix).

> \ No newline at end of file

Please add the newline.

-- 
Regards,

Sakari Ailus

