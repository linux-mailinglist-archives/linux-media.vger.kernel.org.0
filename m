Return-Path: <linux-media+bounces-28023-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B28AA5BDC1
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 11:24:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5F743A67E7
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 10:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE9A234977;
	Tue, 11 Mar 2025 10:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e5YnoLbe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A803C3EA83;
	Tue, 11 Mar 2025 10:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741688676; cv=none; b=hRQHRwERNsELQUUhoBm1ZCeQxhx1ZDCWosnqtA5FyW7oxrei5mPmMxNOVG2OoSl3TP3EaOKb4ikXpbHmFp9fowN/ACxXBC1e84X4+mudLaagcEsW7HLs0UVt7HK3nk+Zhmpv3fUgcz43u+ZGF0pdyS9yAoYvQPe2oPRtybR34vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741688676; c=relaxed/simple;
	bh=uEg6EotqzlEYdDCB2DPwOgfUbi85oVx2TdXMye9F6P8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jPf56euqWOvJCjsVYyg483ac/bGX0n5seMz74t7r7VbkwLIfeeWfpDlmjDC95vVj6IYAL+iVjiua7Rsf6lEM5RDedYa2oi4tYM+X3h0jMTJs4M9pMRzF5D43Tg+f279stDmlwTxNONQ8t0LVTqx79rLvsV+Pqrcuuz7Jl1ijIBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e5YnoLbe; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741688675; x=1773224675;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uEg6EotqzlEYdDCB2DPwOgfUbi85oVx2TdXMye9F6P8=;
  b=e5YnoLbehtbk78uF7EMBwIZ4XZlKxVncLnLcW3cxnieHxqrUYefd9O4I
   yJnkMzOYBGVm49NQ9LXefcX/QOkn8n7AU3jbFVCXrOB2KQpaL5UmX6PCw
   GxMyWPSnpZq/AXTICct9m5+1pIVfE0PMGZfNkPDg+T6hdKNfJqOgz0qai
   Czub3hoM3VDsBavpgeqwwVhqM50sv/aPSw3NSx4JcgBEEhqvroAupuO58
   UUSBV+20jH1CKmVamRx+/GKw7x7zBlSSwsynohib5Q3qUAGiinyGG7tcr
   3ce93IazHWICmS4T9jXlio4p/EvqERou/7cd6SsF1GjzMh2xgvwCOKmel
   w==;
X-CSE-ConnectionGUID: DcfMgJqvQk6PLlwuSr1Mkw==
X-CSE-MsgGUID: /rtYjHMNToKOzx8iuAehxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="45504272"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="45504272"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 03:24:34 -0700
X-CSE-ConnectionGUID: wc4RuTR3ThSiXNrYTtFGHQ==
X-CSE-MsgGUID: VoTMr2R8SCelKv/Z3mXPWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="120005295"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 03:24:31 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C334F11F7E5;
	Tue, 11 Mar 2025 12:24:27 +0200 (EET)
Date: Tue, 11 Mar 2025 10:24:27 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: eugen.hristev@linaro.org, mchehab@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, hugues.fruchet@foss.st.com,
	alain.volmat@foss.st.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, andriy.shevchenko@linux.intel.com,
	hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Convert media drivers to use devm_kmemdup_array()
Message-ID: <Z9APW3EdFAvKcV4X@kekkonen.localdomain>
References: <20250228073649.152157-1-raag.jadav@intel.com>
 <Z86KeDfg9GwFBpGQ@black.fi.intel.com>
 <Z87ExUkOnaHpfxfE@kekkonen.localdomain>
 <Z8_YsIMCJ0zirqN1@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8_YsIMCJ0zirqN1@black.fi.intel.com>

Hi Raag,

On Tue, Mar 11, 2025 at 08:31:12AM +0200, Raag Jadav wrote:
> On Mon, Mar 10, 2025 at 10:53:57AM +0000, Sakari Ailus wrote:
> > Hi Raag,
> > 
> > On Mon, Mar 10, 2025 at 08:45:12AM +0200, Raag Jadav wrote:
> > > On Fri, Feb 28, 2025 at 01:06:47PM +0530, Raag Jadav wrote:
> > > > This series converts media drivers to use the newly introduced[1]
> > > > devm_kmemdup_array() helper. This depends on changes available on
> > > > immutable tag[2].
> > > > 
> > > > [1] https://lore.kernel.org/r/20250212062513.2254767-1-raag.jadav@intel.com
> > > > [2] https://lore.kernel.org/r/Z7xGpz3Q4Zj6YHx7@black.fi.intel.com
> > > 
> > > Bump, anything I can do to move this forward?
> > 
> > The patches these depend on (those adding devm_kmemdup_array()) aren't in
> > the Media tree yet. They don't seem urgent though so I'd just wait.
> 
> I was hoping the immutable tag would be useful here. But sure, no problem.
> 
> > Speaking of the patches themselves: I'd use *array instead of array[0] for
> > sizeof argument.
> 
> I know it doesn't matter much to the compiler but since the source itself
> is an array here, doesn't [0] make more sense?

The element at index 0 isn't anyhow special in this respect so I do prefer
*array instead. In practice it works either way of course.

-- 
Regards,

Sakari Ailus

