Return-Path: <linux-media+bounces-37481-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCADB01BE5
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 14:25:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E51B47A69E7
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 12:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE0CF29A322;
	Fri, 11 Jul 2025 12:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WqQZXCCI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA4E295DB5;
	Fri, 11 Jul 2025 12:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752236726; cv=none; b=Dns9snn1zYcjInzLbsHUZ2fPMv+2QHr81TdcJFmGhzrlUF6+80CeAReSdvMPILOYYhY1ld+OTZTrAL0TTttqeNNuCx+HLdKdQW5T3wenOmCNipPjLSEz9/dMRMgEWdU4maCDAtGfzQE5P+Mk+wwdHSW06AqXikSLFBuPhY473ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752236726; c=relaxed/simple;
	bh=eB1NGX9YMF6q82VnaNMoGmtrWfntd1dbl39nMtl/Jls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t2hd8j8aPTS8QyEBN2WBE2LWJTPYGeHkVtm6KwS8bW+dplb+tUU319k7aJhvCp2oqO5MMM01qixUR86DwzN1cEyVtOhVLshysYVRmaGC8QkR2aPaijEKoPswD9WtEZc81UaxTPIXxCWFng+tWalmNh4C3kuWmJSFW7zqIqLSdoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WqQZXCCI; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752236725; x=1783772725;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eB1NGX9YMF6q82VnaNMoGmtrWfntd1dbl39nMtl/Jls=;
  b=WqQZXCCILXV1c2m+iZIFVmGZgZMoDiO9ASZA1yllH79FDCtDuaK+euvS
   bNjLlCdLVr3Sa27MEktbiPdp6jB83v96fL8RcL/aZonpBAG4O0XRfnsJg
   CzUrxsVJAHp0FIMZVkjg7LW50oAF05Sp4eaasYaBrdLUbxUdAHxgy8a4N
   R10rJSZvssJfuYK+s1cYTZYqh8ub48gpw3noDPF4/+SRDd5p0qXp1r8KB
   0QafRNkKPS3Nd4TTxuaHFH2EqpoMsthfPu7OutfrlFpRRpqx9aommbpTq
   htjiOXypWVNJr5mIYIrQn950wA8O99k25DRkyQBajLKS2jqEDNGviEjef
   Q==;
X-CSE-ConnectionGUID: YanhoC2gRLmlkCTX9QVwKg==
X-CSE-MsgGUID: 7D8TUkulR5Wuxu1EFLRPsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65981328"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="65981328"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 05:25:24 -0700
X-CSE-ConnectionGUID: AqOnp4PnQzm3wrDurReOCw==
X-CSE-MsgGUID: tdeiCF1ITmK0iwyQHz3h8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="161918492"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 05:25:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uaCoY-0000000EWMs-3uMk;
	Fri, 11 Jul 2025 15:25:18 +0300
Date: Fri, 11 Jul 2025 15:25:18 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v9 2/3] staging: media: atomisp: fix indentation in anr
Message-ID: <aHECrvSQCicV5nP5@smile.fi.intel.com>
References: <20250711-new_atomisp-v9-0-a9dd62425ef6@gmail.com>
 <20250711-new_atomisp-v9-2-a9dd62425ef6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711-new_atomisp-v9-2-a9dd62425ef6@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jul 11, 2025 at 07:54:37PM +0800, LiangCheng Wang wrote:
> This patch fixes tab/space indentation issues in anr
> following kernel coding style guidelines.
> 
> No functional logic changes were made.

Same comments about Link tags and suggestions in general.

...

>  		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
>  		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4

Side note, would be nice to add a trailing comma here.
I think it's okay to do in this patch as this is not
enough for a separate change and the driver in staging,
the rules are slightly relaxed on it.

>  	},
> -	{10, 20, 30}
> +	{ 10, 20, 30 },
>  };

-- 
With Best Regards,
Andy Shevchenko



