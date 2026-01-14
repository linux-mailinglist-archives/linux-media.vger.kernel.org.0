Return-Path: <linux-media+bounces-50728-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7169FD21423
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 22:03:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 790BF3011F82
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 21:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0458354AC8;
	Wed, 14 Jan 2026 21:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kWJFzRdc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7C030AAAF
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 21:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768424581; cv=none; b=OyrhjOVZnBgqxZLemroh4rAi1unZQAsbNe/QFhknAc5V6YABfo4a4Gwu1lm2wo9FVfkbSNghXUWP0f41Iq1xEVHatlU6/qVGkI1d5OTvh69e3Sw/um7/NhImBluoODnfNvaJrOBR8hsG+AhkNQiPfB4uTNeSYagk4GV7rTDtwL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768424581; c=relaxed/simple;
	bh=//LF8dEiPizIsIgQI3pUoygT3MeT/rwvJ8maF8YuSA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dxHq75UR//OMRl1jRsagTDzhYcMDBe9izoqMrug1fRWBp8AxwHfmvL4nmA09+BEhv8TF2arDZbVO8jydqAlTKGD76psncoa0s8s1SgoxTie5JscwoWdJfb1fxFWRFSv1Zfq2IC9UPrKaFR4khy8aqEW/xcCaTxs/KGE2oP2VsuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kWJFzRdc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768424580; x=1799960580;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=//LF8dEiPizIsIgQI3pUoygT3MeT/rwvJ8maF8YuSA4=;
  b=kWJFzRdcukDvDC/Gb5u0fX/Hyus+4BEUEQOK0ySzUyx7pxF9j2dmY3Y/
   zugy+lXvjhXIn32wePs5xNFXEPTvW4DxF+L8xxAKcAvT8z2serXWEVIIc
   IYPk8IcTRc/IQAJ1aWZ4E3/SeXIFGtsboTieGtX3l5CKEUFrzdjn/Jqzy
   4Qr8NEK1a9XpzJq+u/JReB3PkL0uJM1AzbzynxkUMSRb0G9uQcv8eK5//
   Lk7Q8s/D6esl4I9yex2luJZvXWSUD9kCJAVZLq7amG0i59Xr+TjXNIe7v
   KgB9Idk+3HkgwolSN8PAb+BBS1sFeGLjJ7YUzJcyclApp4767z3Ol5RSp
   g==;
X-CSE-ConnectionGUID: 8l5lYLHGSiebO5zMI35MYA==
X-CSE-MsgGUID: rIQZOqxcTNO07ikRYGcMOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80378103"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="80378103"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 13:02:59 -0800
X-CSE-ConnectionGUID: b1VRcTKqQLGKhrVmYevPiA==
X-CSE-MsgGUID: EYAFHkziRE2lrR/WbI3ljw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="209282651"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.83])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 13:02:57 -0800
Date: Wed, 14 Jan 2026 23:02:54 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hamdan Khan <hamdankhan212@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: media: atomisp: Fix typos and comment
 alignment issues in include/linux/* header files
Message-ID: <aWgEfqMnpHzw-rA5@smile.fi.intel.com>
References: <20260114201453.17329-1-hamdankhan212@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114201453.17329-1-hamdankhan212@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jan 15, 2026 at 01:14:53AM +0500, Hamdan Khan wrote:
> Revised version: minor comment alignment, typos, and checkpatch.pl
> warnings/checks fixes in atomisp/include/linux/*.h files.

No, this is not a commit message.
Please, study this article https://chris.beams.io/git-commit and act accordingly.
Thanks!

> patch v1: https://lore.kernel.org/linux-staging/20251129061228.6286-1-hamdankhan212@gmail.com/

Should be in the changelog section.

-- 
With Best Regards,
Andy Shevchenko



