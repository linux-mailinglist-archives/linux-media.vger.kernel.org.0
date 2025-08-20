Return-Path: <linux-media+bounces-40451-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1BFB2E0B2
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 17:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33DA4189A77E
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 15:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD1E8322DDE;
	Wed, 20 Aug 2025 15:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CI0YlpwQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3FB322C9C;
	Wed, 20 Aug 2025 15:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755702347; cv=none; b=T69FfC/QNsvxxjMKgHPpKN68hDtsh5EiRbVqf5z5qvD9v4i6z6MoY3JxejhucXpAZLa8cEfwkq7kek3WGEfRlwFofaHpnv7xddOC5E7Cag5xj09UZgHi7t4zD2ZcRJl+9XO4reHOdmCTomwYHIr9K+xJF/5bW2aM5Gh4tCwm6tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755702347; c=relaxed/simple;
	bh=GBFRnaGUe0PtLf2WRCVyGSnESVeBAJmHfroHsv5eb5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X18FW9xrDzLuJC5WLN36aqMxj3CyB5MRz0DP4d1208Mw4Vw4piaW7JJTIpbaCUMfs1QuZ3/AHphKXJYfdJ09rmcPHsevaAFGUFmZKImERDoJxTeBkH/0xswIjU4EVVXxLvSFQoi5bZchGld/xXmwh791G1Q/lVFbsVlo2iVzfUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CI0YlpwQ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755702346; x=1787238346;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GBFRnaGUe0PtLf2WRCVyGSnESVeBAJmHfroHsv5eb5Q=;
  b=CI0YlpwQn6b/WIayG5YvXHBwaiQ9OsN6WVqA+86eEm1/GRnoFdqHtN+D
   hAP3vW39DTxtz+5c1veGJEIGGibhJCQ8BpIegkMFqNdAJqbGknivw1cDP
   UrL7MeUCDUTyN5cdJn/J2r2xrGylOnx+D4/TGcPzD/tsGwUvTp/1eqD3d
   BFktg3WNaypB5poPeWGPFpET89cU6R7MguUIhcex7VYbaVy5BXzNaEadF
   Emlgp1vyssmjOyHzk2N8EvgDGmkn6prK8yG17jdxwCRKWwleLxK3yBF26
   kwg6Ead/oxESUc0SHUV733JlURZXaanksfpqm3GYWWsY74g6SK6yBgvc1
   Q==;
X-CSE-ConnectionGUID: Uv3SestNTm6U/dDdm+MC5Q==
X-CSE-MsgGUID: Kmkrit4rQmGLQEidFvWtrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57925092"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="57925092"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 08:05:45 -0700
X-CSE-ConnectionGUID: tCKJADDiT1ChV/wxhc0O7A==
X-CSE-MsgGUID: SsxXlSxFQPGDOsN+0QbjWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="167658465"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 08:05:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uokNf-00000006xzl-3mCl;
	Wed, 20 Aug 2025 18:05:39 +0300
Date: Wed, 20 Aug 2025 18:05:39 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Colin Ian King <colin.i.king@gmail.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: atomisp: use kmalloc_array() for array space
 allocation
Message-ID: <aKXkQ0WXaG-hMgEW@smile.fi.intel.com>
References: <20250817092942.95053-1-rongqianfeng@vivo.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250817092942.95053-1-rongqianfeng@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Aug 17, 2025 at 05:29:39PM +0800, Qianfeng Rong wrote:
> Replace kmalloc(count * sizeof) with kmalloc_array() for safer memory
> allocation and overflow prevention.

...

> -	descr->in_info = kmalloc(descr->num_stage *
> -				 sizeof(struct ia_css_frame_info),
> -				 GFP_KERNEL);
> +	descr->in_info = kmalloc_array(descr->num_stage,
> +				       sizeof(struct ia_css_frame_info),
> +				       GFP_KERNEL);

At the same time it would be nice to use sizeof(*...) variants instead of using
type-based.

-- 
With Best Regards,
Andy Shevchenko



