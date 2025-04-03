Return-Path: <linux-media+bounces-29328-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1459AA7A3A7
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 15:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F2CD188D37B
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 13:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 474EF24E4AF;
	Thu,  3 Apr 2025 13:26:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D2D1494C9;
	Thu,  3 Apr 2025 13:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743686777; cv=none; b=FuP1DbspHCLCuz0MwQO/00+fpxRV6My7vzN5Z8kJmlIKfEX0YAI6Rrdo8d6WF0n9exj39Znb4h0p1YA4lc7+Xfk1Wov+zsRQOj9oWJ+tNVdnBPtWlSY3meKz8SN4vMdVXr6b+e/n4SvN8cj5bfyF9bPe5rxn3pJ8MdkWPJ4ukd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743686777; c=relaxed/simple;
	bh=KpZeS4i86ifJ4Gzt4GavOtIg37jIc6PUSC0r2IM2rpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHSmMBe5R2UldCjk+v2cIgAcRLz0vBOTJivOwbxzVV73UPWzH03eC4CPXESKg+0bGXeia+p9JlmAUUOMBFxf7kWY9wg6jylEulV8hq6dWq6bMEJfNj3eZrYvNWkIscOST7BkP3JZsTkG6u27Belz+ReDMkehM0vyKuo3jkc8ltw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: H0AEOGn2TQakxPvirdltzA==
X-CSE-MsgGUID: 0IiadaqQTVa6rAf4fuSLAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="48887005"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="48887005"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 06:26:16 -0700
X-CSE-ConnectionGUID: ShXiCFE9QMSJpLQb5PkKJA==
X-CSE-MsgGUID: ynGXoKIKT2yBxsRvCs925w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="126994328"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 06:26:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1u0KaA-00000008owF-38a8;
	Thu, 03 Apr 2025 16:26:10 +0300
Date: Thu, 3 Apr 2025 16:26:10 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Gabriel Shahrouzi <gshahrouzi@gmail.com>, linux-media@vger.kernel.org,
	hdegoede@redhat.com, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: media: Fix indentation to use tabs instead
 of spaces
Message-ID: <Z-6McoFVsJ8EiLPV@smile.fi.intel.com>
References: <20250402135001.12475-1-gshahrouzi@gmail.com>
 <CAHp75Vc1nB8cDN=OcCJgeti3YNr0Dd4yeKgeSBvR95piLao1rg@mail.gmail.com>
 <Z-6Ay7T3n1vXfAO9@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z-6Ay7T3n1vXfAO9@stanley.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 03, 2025 at 03:36:27PM +0300, Dan Carpenter wrote:
> On Wed, Apr 02, 2025 at 05:36:31PM +0300, Andy Shevchenko wrote:
> > On Wed, Apr 2, 2025 at 4:50 PM Gabriel Shahrouzi <gshahrouzi@gmail.com> wrote:
> > >
> > > Replace spaces with tab to comply with kernel coding style.
> > 
> > Still 'tab'. please, capitalize it to be 'TAB'.
> > 
> > But wait a bit, the driver maintainer might do that for you whilst applying.
> 
> It's not an acronym so it shouldn't be capitalized.  It should be either
> "a tab" or "tabs".

Not everything that is capitalised is an acronym :-)

-- 
With Best Regards,
Andy Shevchenko



