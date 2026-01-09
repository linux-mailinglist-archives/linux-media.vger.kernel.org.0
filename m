Return-Path: <linux-media+bounces-50282-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA51D09F49
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 13:48:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B04D8306EC3A
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 12:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8921E35B137;
	Fri,  9 Jan 2026 12:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oJZP8UuN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A2231ED6D;
	Fri,  9 Jan 2026 12:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767962187; cv=none; b=Y5bxNFY8XFFxHyu1LzbjI0gk89oX4KlSpgfRCoOu4hm0YCpwW0xpOTwhmOCcejqaac1itoCr++9L0rCXH86xczydR7t76lm1tU4s4BvQwZ1juZQuJYaJ4Xp2iVIc7UurLdMcIuSDXmk49uLSAaf+4ia5IYgtxVan0f8+1gOUb24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767962187; c=relaxed/simple;
	bh=w2Bv2Upj5UBhrRqSGhN5Cjw5w8pKSCo7nDq2DNh1JKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dDskRdU2abOwGTk0l4C2WlHJTQEfpKxAupSZLIGlruSPLnSkT+q/Ng8b9vKqwwbLXlmaV8/+FIgSRqic9whdhG5UHgmvfv2JphTnz8tJMf5mie0JVlIwjl7smiXQntSDEx/rYPrO2bPWTMYp6uJX9MPvBrgVsTeTiY4yG9fStbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oJZP8UuN; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767962186; x=1799498186;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w2Bv2Upj5UBhrRqSGhN5Cjw5w8pKSCo7nDq2DNh1JKQ=;
  b=oJZP8UuNMbGOP/92kKPlULbUXuBUZjawyVzAh54Bq+SDBsctcDAXjRar
   DYWrlx00yuPPEehCnW7SQdOB3ImrE7oCkDWSYmpQMrWYbcOoFh9M7zWX1
   E+4MRbsmgJsVa5uWHUUveNJWTQbs5RNM62Euz9Q1ilQPKofmEbAHeXeMu
   v+yJ5q4bIVuf5RVq2bjho9n3jZM/KTnN6kK7h05VebLDTeSpiuLFPAEj0
   KcqpL9eZbHztNumWWYjc2NU0IExIL6dxDKUWs2YadpPdNpgdfWhT6MFIk
   wCv7up6NW7Fua5cz4opq85TAPPvhx+jUANZstEQI2xDiy/bnveUgZtmf8
   w==;
X-CSE-ConnectionGUID: Od4KbJpgTgKrAQk7BBVZqQ==
X-CSE-MsgGUID: Y4tnP8sKSIOZSs9Pej0FMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="94812943"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="94812943"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 04:36:25 -0800
X-CSE-ConnectionGUID: 7J3M7jUdRE6j7SkNZx7L5A==
X-CSE-MsgGUID: Ko4jKXLKRsWF/6k9oArCkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="203242702"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.161])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 04:36:22 -0800
Date: Fri, 9 Jan 2026 13:36:15 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: david@ixit.cz
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v2] media: ccs: Accommodate C-PHY into the calculation
Message-ID: <dpfnnipikl2hk5gazqxsfe2572yanzbe4h22cvyzur7hhha7hx@s2iiuonsn3m7>
References: <20260108-ccs-account-for-cphy-v2-1-f2749ecf0733@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-ccs-account-for-cphy-v2-1-f2749ecf0733@ixit.cz>

Hi David,

Thank you for the patch!

On Thu, Jan 08, 2026 at 12:04:30AM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> We need to set correct mode for PLL to calculate correct frequency.
> Signalling mode is known at this point, so use it for that.
> 
> Fixes: 47b6eaf36eba ("media: ccs-pll: Differentiate between CSI-2 D-PHY and C-PHY")
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

--
Kind Regards
Mehdi Djait

