Return-Path: <linux-media+bounces-38947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 097CBB1BBD1
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 23:38:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FDEA6204EC
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 21:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D402257AC1;
	Tue,  5 Aug 2025 21:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MKspjJAP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E9019258E;
	Tue,  5 Aug 2025 21:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754429907; cv=none; b=EWJRCoC3Pdzfto/fWtFaC0SWaPymiy8HHxFQceHlsJY9HRJV7fl8D6W0LscBs5HALX9kcv1luRm5I6KGn0dnahJ50nzju8n92zqLXIA5Ckns0ko20Ha2FReBSJtXBE0J2OCb/cyLq70v45RxUXlAwpJFfE3Sd4lVkvadoFNzUmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754429907; c=relaxed/simple;
	bh=O7QEgj3AC1Za8HKKsiIH4fTV8OJN8Z6NVdCKquxoXzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VhSpAGyJMzYSHv8v+2MVV4pm9y2YLdoukvTawzreNfhHyRW6+1M9rijp4BZpX2TbG6MW6hCzOQsnfqWyBZaAlqFrCfx34KAx/6+GHLCEBfA+d15AJsYVmOQLtdaCoUmzCeGd8Lj9wzQYB+lgMfgfVUrR/5sDMwAehsOqszgsXVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MKspjJAP; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754429907; x=1785965907;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O7QEgj3AC1Za8HKKsiIH4fTV8OJN8Z6NVdCKquxoXzA=;
  b=MKspjJAPmOwD57f+Jn/oB0M4ZlS2Jh5eFp7iwv2cyGVfr4Nl7rLvQDH5
   I98aa3w7ek3xqW+iXQq9y8Azu8YCFz2C6fhChDAi4OqyaLfI0txRA0XMv
   nndL0G8oqemh0qij8PuDAr9NVGlER2KeiDlBN3cmXpc/VjW+gf6Jdurd+
   SJjBbOyWyftqQY+51/t2lA2qX7l/ph8zDSdnYRkkRn2MVaPbykxCb27mJ
   SEZFlWfF8OS/9yL1tJHP01QYn0lmgHPqEBz3dg//5cYZiKLBk3E2npUHO
   tjNqO30UkqfGmfZ4B/Bq+QsyPoVnpOTG2Ye9KDgmIxm44Ow5QbhnznLhN
   Q==;
X-CSE-ConnectionGUID: 8TeHnVZnRYuNbyHthV/2Hg==
X-CSE-MsgGUID: VbLjnB8MStSde4rtZpQM7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56452884"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="56452884"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 14:38:26 -0700
X-CSE-ConnectionGUID: aUkXqemnQmu846ufHv9L/Q==
X-CSE-MsgGUID: cEhQfpz0SPekjpI0Nzu6Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="164963402"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 14:38:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ujPMR-00000003rM2-3Ayl;
	Wed, 06 Aug 2025 00:38:19 +0300
Date: Wed, 6 Aug 2025 00:38:19 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	llvm@lists.linux.dev
Subject: Re: [PATCH v11 0/4] staging: media: atomisp: indentation cleanup per
 directory
Message-ID: <aJJ5y4-nWWS2gISP@smile.fi.intel.com>
References: <20250726-new_atomisp-v11-0-46eba1953fba@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250726-new_atomisp-v11-0-46eba1953fba@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Jul 26, 2025 at 03:53:10PM +0800, LiangCheng Wang wrote:
> This patch focuses on cleaning up indentation (spaces, tabs) in the
> AtomISP driver under drivers/staging/media/atomisp/pci/isp/kernels/.
> 
> There are no functional changes.
> 
> This version splits the original cleanup patch into four smaller patches,
> following review feedback from Dan Carpenter to keep changes focused and easier to review.

This version LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



