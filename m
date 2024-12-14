Return-Path: <linux-media+bounces-23420-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 324549F2079
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2024 19:50:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2CC3167785
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2024 18:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB71B1AB531;
	Sat, 14 Dec 2024 18:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y59S4kWR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A794B1A8F79;
	Sat, 14 Dec 2024 18:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734202153; cv=none; b=NqY6CUqoqlJ1zMC789JzNQ2RP7JJB8uAoZaI2IeiidTPhe8kQ02fc13KiEhF9qc84ipmbRdN10dd7mX/59dRjdZ26jjXnpZOaKh+YKGdFBrSrCp372c0VjWYLI03chw9bREo1/tOI+MOECxn7ugz6BU5jPgLB86pdXmoYLlR/qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734202153; c=relaxed/simple;
	bh=XrdtM6njkrXNWozn3mpzxyYmI3G3n7Yz2dgowLZPE4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/7mYr9CMw7/0dDguu4SuFeGJ/3N8yG1FUPT5HTmL/rnsRnKyecEpxKYq8XyhtaEDaK5XXNutWVokFWzkzA+HfAo2MH98vjYehNVAN0Cekv2sPMA0RYVSehnOmf+G/F3QI7NtZpkORCYIzE9L5KClaVsnC9KfwMBbS4DAAe7wpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y59S4kWR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734202152; x=1765738152;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XrdtM6njkrXNWozn3mpzxyYmI3G3n7Yz2dgowLZPE4A=;
  b=Y59S4kWRH2wyGEQ33QnXWbe1YJqUbUQti9knIv9gN1wptm7gnh+IwaOW
   r2FyAgWQVYCeS0suVvIAXovSsGUn4lbN/KQxhgwcw0NALR3wVMLk8kXyc
   tYWVLYNZzVGyRn8JYTv81TJhP/uenxzPLf312WwbOdh75bW/UywFD4b9/
   zsHI9y2p6MCO5cd6fyOAfAuyksTeQ63qgsEOqYVvY3BmKRM9wm2CEYNGq
   L5W0pbyCRPBH6IOuB5riC7cz1uKevK3ICKZZdle+S2tXk0elOuvfHleD2
   LVjD1seHlx8WannDkOooNqRtyUQVz4tfLlS6hbaYNCXoWXZMJERcZiIHC
   g==;
X-CSE-ConnectionGUID: iBp44EnLRs6dHJt5dzxXpA==
X-CSE-MsgGUID: lUclV/auS6q6ZgI3Q26uJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="34681197"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="34681197"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 10:49:11 -0800
X-CSE-ConnectionGUID: xiaTl1xxTTe9oBEclDhZ6A==
X-CSE-MsgGUID: UBrifzzRTBid6SSMnNv7EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96681526"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 10:49:10 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4E42E11FA2A;
	Sat, 14 Dec 2024 20:49:06 +0200 (EET)
Date: Sat, 14 Dec 2024 18:49:06 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 12/15] media: i2c: ds90ub960: Handle errors in
 ub960_log_status_ub960_sp_eq()
Message-ID: <Z13TIvIt7Eh_ehHA@kekkonen.localdomain>
References: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
 <20241206-ub9xx-fixes-v4-12-466786eec7cc@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206-ub9xx-fixes-v4-12-466786eec7cc@ideasonboard.com>

On Fri, Dec 06, 2024 at 10:26:48AM +0200, Tomi Valkeinen wrote:
> Add error handling for i2c read/write calls to
> ub960_log_status_ub960_sp_eq().
> 
> Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Link: https://lore.kernel.org/all/Zv40EQSR__JDN_0M@kekkonen.localdomain/

I've replaced these with Closes: to make checkpatch.pl happy. The CI should
be able to tell this nowadays. Same for a few others in the set.

-- 
Sakari Ailus

