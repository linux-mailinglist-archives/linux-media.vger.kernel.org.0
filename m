Return-Path: <linux-media+bounces-48341-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFEFCA90EA
	for <lists+linux-media@lfdr.de>; Fri, 05 Dec 2025 20:26:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81AC030FB480
	for <lists+linux-media@lfdr.de>; Fri,  5 Dec 2025 19:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2380934FF65;
	Fri,  5 Dec 2025 19:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GhNsZ7CC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E3E34FF53;
	Fri,  5 Dec 2025 19:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764961517; cv=none; b=QxQmOTcZhwYKB9W/DwR4fVJQ0khA8JzPvWwJSrnw1sG5GHhLMxnh2D69JMxAoSVCdohf5kT/OAnCW4TpoTiizVOwy7BqcwvKW748ZefMnUe2qseqYBJsIEwtwAr2DOuaDbQfKarkgpSaBVWVYLa5NTmpP0+r+eZzFUzSAWa0Q2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764961517; c=relaxed/simple;
	bh=UHdvJI9kaQi6Fh6mI+Tto3rsBItk5S5n/pQpVpwTVgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fAdT1fB5I25c8vDFpcrYNHWc+FT7FV2sXY4KnIUCxkfgDDbZRlpNEfog0T+B+vAwligv/+UQXgNAHSaM8tS50rxlqna7TJnYBOPG95bnO3Hgx7v2uXJxFOvrgTCeszlmQdamW7K5rRzytq7KZoafY8xf6P45sniS2YDiduNXBg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GhNsZ7CC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764961515; x=1796497515;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UHdvJI9kaQi6Fh6mI+Tto3rsBItk5S5n/pQpVpwTVgc=;
  b=GhNsZ7CChppB3Ftrhu1m6SIerkmdGtsiFPlNTOPMpG4/D0hLb1pYKuNs
   trewdVhVQMf/dAixTQodkYoD9lc/Bv+2qmy3aFRdR7xwmMszhbhR/zmmm
   bLkmDVho/wJS349yecu3tp2sc5Pviopgsx4Aul1O5VG9jxjbANJiAzL51
   zIMpHQL8g00qZAcB6I7g0KhTjV9A0BwZM8DRBspVEtt0xTqdXYn+P/G5g
   WdcuYX8tvlfjFIQEFs15nVK7YftQTcjvQPpd97+NiPFyQFUTwpuxz37it
   HrUuuzxArns6Ejx7kj8PBzOsNHQfUUyOcz2SJLie5SXzDADgEog5wvRSW
   Q==;
X-CSE-ConnectionGUID: WvV9G4NOS1mtbsp4h8JFZA==
X-CSE-MsgGUID: m+6RdVlWRJqr4xRdhGq+7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66188283"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="66188283"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 11:05:10 -0800
X-CSE-ConnectionGUID: G5QHvL7eRxm7Sy/j5VhMfw==
X-CSE-MsgGUID: POvelRNtQcKek6ISZQlRzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="194666456"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.181])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 11:05:07 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0E253120347;
	Fri, 05 Dec 2025 21:05:12 +0200 (EET)
Date: Fri, 5 Dec 2025 21:05:12 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: Hao Yao <hao.yao@intel.com>, platform-driver-x86@vger.kernel.org,
	hdegoede@redhat.com, dan.scally@ideasonboard.com,
	ilpo.jarvinen@linux.intel.com, bingbu.cao@intel.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: int3472: Use actual clock frequency for
 DSM method
Message-ID: <aTMs6PB2O58KbikU@kekkonen.localdomain>
References: <20251205095525.1264971-1-hao.yao@intel.com>
 <d4f08e2d-8257-ec95-9f67-7514240a4f82@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4f08e2d-8257-ec95-9f67-7514240a4f82@linux.intel.com>

On Fri, Dec 05, 2025 at 06:10:10PM +0800, Bingbu Cao wrote:
> > +#define PCH_CLK_FREQ_19M	1
> 
> I like 19P2MHZ.

How about simply PCH_CLK_FREQ_19M2?

-- 
Sakari Ailus

