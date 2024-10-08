Return-Path: <linux-media+bounces-19275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D32AC995353
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 17:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B09D1F2793D
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 15:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF7A1DFE2D;
	Tue,  8 Oct 2024 15:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DjvRNQ9V"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9EC4C97
	for <linux-media@vger.kernel.org>; Tue,  8 Oct 2024 15:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728401045; cv=none; b=HxECPyIippnXNEFQqBgv1zctTjkUq/I52+I0AhqQJiX+Jz7ukBz2xs9obPF/VwrQK/pWtWKlju3xm0DZkrZ6ogoGZg2/LIlL+bnWETEkwg4Z3DzMSUBC2K0DwTOa1oQMj8krekVjloqlQY1S9kPYlzeoiSC56hT3RDinVoHZIAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728401045; c=relaxed/simple;
	bh=HmQ1nwTUfPPFNXrjeBs48ugjdw5IXs/znwIlEThMSig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tYJ3ZmoDu1CwLQPzbjxFm/LnsQT4gmgySN1lPpf48dPItFYAA5FN1YBJtlHhZJswCERt47cp3Qr8FTCXmgpev4IHFkvw7RrY0fRVlGEzpBqsAdSbj2nQnBdBcM6ZID+cM1jj7dQPq3Cq6HoFZdT8Avb120zU1hio6/BprGpOUHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DjvRNQ9V; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728401044; x=1759937044;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HmQ1nwTUfPPFNXrjeBs48ugjdw5IXs/znwIlEThMSig=;
  b=DjvRNQ9VFEKt8QkoxazyQq4Y0hQiBhddFWnENeOTYSNsHXhy+dyNs7K4
   o3g2LV231sYKdJyHtrI5SFeAxquScMMjRybDkhlj+2740nnCx1YMZFEMx
   C59dQo4zk7cwB4L+/Zp6MDx9keW3Bzq2KuBWqa19Lkb9Isn1q3Q9UckcT
   OQXF3lA+7EjONZ+WKKjLfSmTM6vhlAxe1sJ4OQ7Lk/PHlcDF6P3hfIZ6e
   0v/eAYFGmHETJRGeKdW6pzWRelj2hQd2JN8Wsp138uxzOb/7pCYfA5+P1
   fSSxK7+iWx6gMojvnKyGsJLn7EYcM6zwWZuTBCPpw6oUw0O1OWcqLzYq1
   A==;
X-CSE-ConnectionGUID: OamTE4TmQ8KFX6nixBztKA==
X-CSE-MsgGUID: OiT5k2RERuiORVuhnVMuog==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27492681"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="27492681"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 08:23:59 -0700
X-CSE-ConnectionGUID: Y5m73LopRnCbRK6jk5/R0g==
X-CSE-MsgGUID: iLsiktKjQxuih8PVQ7bsVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="75549890"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 08:23:57 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1syC43-00000000jlv-1DnY;
	Tue, 08 Oct 2024 18:23:55 +0300
Date: Tue, 8 Oct 2024 18:23:54 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
	bingbu.cao@linux.intel.com
Subject: Re: [PATCH 1/2] media: ipu6: fix the wrong type cast and 64-bit
 division
Message-ID: <ZwVOiq0RCJu9ECcr@smile.fi.intel.com>
References: <20241008061916.313517-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008061916.313517-1-bingbu.cao@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Oct 08, 2024 at 02:19:15PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> This patch fixes the build errors with `i386-allmodconfig`, the
> errors are caused by wrong type cast and 64-bit division.

Thanks for the change, my comments below.

...

>  /* Shared structure between driver and FW - do not modify */
>  struct ipu6_fw_sys_queue {
> -	u64 host_address;
> +	uintptr_t host_address;

Okay, in the given semantic this probably should be phys_addr_t.
BUT, is this address somehow is going to be used by IPU6 hardware?
If "yes", the type shall not be changed.

Looking at types used I hope the answer is "no", otherwise the types
in the structures should be  properly choose WRT endianess (and what
__packed is doing here? Is it part of the protocol?).

>  	u32 vied_address;
>  	u32 size;
>  	u32 token_size;
> @@ -40,7 +40,7 @@ struct ipu6_fw_sys_queue {
>  } __packed;
>  
>  struct ipu6_fw_sys_queue_res {
> -	u64 host_address;
> +	uintptr_t host_address;

Ditto.

>  	u32 vied_address;
>  	u32 reg;
>  } __packed;

...

> -	dev_dbg(dev, "write: reg 0x%lx = data 0x%x", base + addr - isys_base,
> -		data);
> +	dev_dbg(dev, "write: reg 0x%lx = data 0x%x",
> +		(ulong)(base + addr - isys_base), data);

No, one should use proper specifiers for this. And what the heck 'ulong' is?
Where is it being defined?

...

> -	dev_dbg(dev, "read: reg 0x%lx = data 0x%x", base + addr - isys_base,
> -		data);
> +	dev_dbg(dev, "read: reg 0x%lx = data 0x%x",
> +		(ulong)(base + addr - isys_base), data);

Ditto.

...

>  	pg_offset = server_fw_addr - dma_addr;
> -	prog = (struct ipu6_cell_program *)((u64)isp->cpd_fw->data + pg_offset);
> +	prog = (struct ipu6_cell_program *)((uintptr_t)isp->cpd_fw->data +
> +					    pg_offset);

Side Q: What are the alignment requirements for the prog pointer?

-- 
With Best Regards,
Andy Shevchenko



