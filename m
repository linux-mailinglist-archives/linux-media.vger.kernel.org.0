Return-Path: <linux-media+bounces-49371-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA81CD6E43
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 19:28:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6E8130321F6
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 18:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435503218D8;
	Mon, 22 Dec 2025 18:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iBG9H8uG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E3F50276
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 18:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766428081; cv=none; b=nfVqhXnv/RZp/fzxwlELRge6PwhC6VU/yhzYfI23URHlgADeg2yGot0VbZRUqYMzahHrt22MmiiV0BCI7qf2KnhS1EuV1FUX6aRzL+kWeMhG4JohZxjgoVCa8bECSrHxeN7caQIIbV9uYq5MLGp8fgwCRVHXFpdrPzDPDLfRolY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766428081; c=relaxed/simple;
	bh=CnOniMnrWGBzRLbcQjGEJgTtlxVlfOr3+YTzF2RgiS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zsl9c7ySX9oq1Gu5uZ/t4hAPHAlgCG0QuSdS9WBlV9aZHGKGgScTBkxJwUCNHthm13IR3EEgStXV3i0xIftDgzlbHuRHY462DFLsvZHi9vOg9eFWp5vOxXrEzbfNNU/6HyQtYknt4WuHiamn/yBkUEVr1W0sUGnpp3ZhdF00CvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iBG9H8uG; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766428079; x=1797964079;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CnOniMnrWGBzRLbcQjGEJgTtlxVlfOr3+YTzF2RgiS4=;
  b=iBG9H8uGVxcoe+KXptmddLl+4Ak2R9NyJKAEDGXtXPIYJhmLZvhVjk7h
   1A8CF8VeYdDFRwN/c81dpFJH2xoaxjYSWP09KMqelRINssSIuMEG3T/Wd
   BTeXJOvPManjroSyzzESvoEoFrnYZixfGARI0D5tYi2fObxg4sgsF3Ol7
   Yrq0I8dDGxLQ1w35tiIMPKbkIO9NSBRa1xEO2kvEbjnbkinKXGHih7J+U
   +dlcMFnw93X2H29qjD6ER9L+0YiS+34KevippxhI2iruh8x/XoFccpbSA
   CEgynkxdlz8dG5LsKA55FIG0TuNF3P0SJMCY3nuj2EG1WYk6cpVaa0+zb
   A==;
X-CSE-ConnectionGUID: bMZKWGNtRWSFzS8PAzgGyw==
X-CSE-MsgGUID: ffU7p6/pTo61XPpCmqbNFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68224090"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68224090"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 10:27:58 -0800
X-CSE-ConnectionGUID: Egm50KOZSlqnSuKkyxNShA==
X-CSE-MsgGUID: Eouso6b2QKSFpnphSKqK0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="204069551"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.187])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 10:27:56 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 507AB121D86;
	Mon, 22 Dec 2025 20:27:57 +0200 (EET)
Date: Mon, 22 Dec 2025 20:27:57 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com, antti.laakso@linux.intel.com
Subject: Re: [PATCH 01/13] media: ipu6: Ensure stream_mutex is acquired when
 dealing with node list
Message-ID: <aUmNrf_dbMNSUFdg@kekkonen.localdomain>
References: <20251219095829.2830843-1-sakari.ailus@linux.intel.com>
 <20251219095829.2830843-2-sakari.ailus@linux.intel.com>
 <nvheuhadny3ta3bacuksl6osvpbg2lqbzgkgtyxampfrtm3jwi@6ogcv5zk2po4>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nvheuhadny3ta3bacuksl6osvpbg2lqbzgkgtyxampfrtm3jwi@6ogcv5zk2po4>

Hi Mehdi,

On Mon, Dec 22, 2025 at 05:22:12PM +0100, Mehdi Djait wrote:
> Hi Sakari,
> 
> Thank you for the patches!
> 
> On Fri, Dec 19, 2025 at 11:58:17AM +0200, Sakari Ailus wrote:
> > The ipu6 isys driver maintains the list of video buffer queues related to
> > a stream (in ipu6 context streams on the same CSI-2 virtual channel) and
> > this list is modified through VIDIOC_STREAMON and VIDIOC_STREAMOFF IOCTLs.
> > Ensure the common mutex is acquired when accessing the linked list, i.e.
> > the isys device context's stream_mutex.
> > 
> > Add a lockdep assert to ipu6_isys_get_buffer_list() and switch to guard()
> 
> while at it, would you want to switch to guard() for the stream->mutex
> in the vb2_ops callbacks: start_streaming() and buf_queue(). It will
> significantly improve the functions. Or maybe in a separate patch ?

I have patches on top of the metadata series that make quite a few changes
to these functions. I expect to post all probably around mid-January.

-- 
Kind regards,

Sakari Ailus

