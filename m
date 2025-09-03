Return-Path: <linux-media+bounces-41664-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D53BB41CB8
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 13:08:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF9A31BA6874
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 11:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1BA2F7441;
	Wed,  3 Sep 2025 11:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fSymEeh6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0272F5305;
	Wed,  3 Sep 2025 11:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756897668; cv=none; b=WlermTuKefV3s8mG+xTVhjCPy7vvnWCJCN2mc9wNtGj4SgpkuoRu1MrXzGczNhQatq8/hvH8vLWH9zQR9UeVzC0wF8aWRQTq8qn0FLmvSA/joAfdbZ5MVq5QVxLhIH73PGktuPDQtzP4TFUXkTx2O2xHFSJTEeOfPqcBesHMVnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756897668; c=relaxed/simple;
	bh=Rn4oGXhbcrYs2K3Dha2QKPcBreQzKeMaMsXQQ1ZcJxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ggM+QWgtS9rRzlUcDXhgpCacaw1iAyfzN4L1Rmio5OAEB+A8zOxiaqa4hyWVfZV1wcvLA6fraKLxdyF9a8rdwPlZEzgY3WliXB039QSq1nmY988lgKJdKWvtaMx3YvBvrpvqqTOoOwRHhVY2hQsrMpjnZyML/PBcTb8zrbu5ikA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fSymEeh6; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756897667; x=1788433667;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Rn4oGXhbcrYs2K3Dha2QKPcBreQzKeMaMsXQQ1ZcJxE=;
  b=fSymEeh6q9+yomzEK00V2A2STE5xeVawpr7uRBXcsIVj0fmw7XcSmRyw
   lPZm+1CMKPdWcIE3uLktyr31riA4aPPnBNgON4Dq4d0CMefYJuRaVrnCG
   rHLzzFVfz7wYIjSzLd6KoHU1Ph36fizd+yWijxpE/+ZNdwRrat4sLNqZg
   QVpmtFZwQvoxe2oxYczpaHm0blB6lET6NmUv8bgYoYl2JmdXPFnbgiU3M
   +5kGHAXwKb8qYNTSfim5ZioFjErIT+gFauuUwgrOKYhrTjtnH7c72+0l/
   JO3pNDsBdBzXjUw7gY+a5fagBqMc9fCErqe/A/TjiGvMrQr1/hKHjoJ8g
   Q==;
X-CSE-ConnectionGUID: ztHMNzPgQIeh91idjpiDTQ==
X-CSE-MsgGUID: ggBM6V77Qf6A88YqgrYtyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="69819902"
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="69819902"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 04:07:46 -0700
X-CSE-ConnectionGUID: pJpnTF79Qe2LcM4SPRGO/Q==
X-CSE-MsgGUID: uPX+WvPSRCe46Fqk+1Cs9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="171129834"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 04:07:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1utlL2-0000000Axra-1OMv;
	Wed, 03 Sep 2025 14:07:40 +0300
Date: Wed, 3 Sep 2025 14:07:40 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [RFC PATCH v2 0/2] staging: media: atomisp: Refactor bit logic
 helpers in vmem.c
Message-ID: <aLghfGH1ATFQT-9P@smile.fi.intel.com>
References: <20250903092754.2751556-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250903092754.2751556-1-abarnas@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 03, 2025 at 09:27:52AM +0000, Adrian Barnaś wrote:
> Refactor proposition for bit operation in vmem.c.
> * Previous name for function "inv_subword()" for me is not telling what
> function acctualy does - it clears bit specified by subword, so renamed
> to clear_subword()
> * Added a helper to create a proper bitmask for a subword, without using
> GENMASK(end-1, start) which was claimed to be unsafe
> * Simplified subword() and clear_subword() to be more readable.
> 
> Continuation of https://lore.kernel.org/linux-staging/20250902073841.2338568-1-abarnas@google.com/ 

Thanks for the effort, but I think it's just a tip of the iceberg.
What we really need is to completely rewrite hive_sim_wide_unpack()
and hive_sim_wide_pack(). If we want to preserve arbitrary bit numbers
we ought to use bitmap API rather than that custom approach.

-- 
With Best Regards,
Andy Shevchenko



