Return-Path: <linux-media+bounces-50273-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7C7D08461
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 10:42:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED317309B660
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 09:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC5F358D3B;
	Fri,  9 Jan 2026 09:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ka2c19wu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCB6332EBE
	for <linux-media@vger.kernel.org>; Fri,  9 Jan 2026 09:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767951432; cv=none; b=nla0V2WsnaupFP7UqWUl95Qf0/nxvrs/wo1mz9fQEBLckg80berKqaDy8l8/zTrEyi12MNLKSBRgnIBRcOSAJixkZ0hz5BJxu3MY4OewPRR+6HzywqZ/hzkt9IJ7t1ur99Ma+0Z+yo9Peg6nd8d/K2ipKrJKdL40PzoVXwv8AaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767951432; c=relaxed/simple;
	bh=uO995dkrsqU9+CIfFBkKbgrDjj1E6Yo/TpL3FfbfG+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZcmaYRNvicpU3BzlYxowjGWNmmfVkxC5WHDB8vtAxNRyJCpbWKJCczsJyfiuzZjaTSEkD7LCi8q5wPwK+P5h7/sOKNTpOdqnFD8vu462TiPSNV9odqbU0LKpHiNnHVTpwjTegG3jISG5FKJWzcjkTvwzVyNMiPfpXy2emXCkQ+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ka2c19wu; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767951431; x=1799487431;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uO995dkrsqU9+CIfFBkKbgrDjj1E6Yo/TpL3FfbfG+Y=;
  b=ka2c19wuHHDvOXRRapNAKYys2DjOdUUM2WaohsJQhGslhe2km/vlRDgq
   +VPRVxa0RODg+/h1Go0/Lq+nB1/lsgFP5wRa4a4vVJgnO0f1/nH0TttBM
   D+Z/IIZiShriU664EbW3OOr/n633DVs1l0nHR04lWANi316SSPJmRxx0d
   J2Xi/vaNM00jX0IurZJxMxLWWNdo1qbhTJdknj1tT1zFp8GXRkB7TEX5f
   j2MDOgBo62NR5trzmnZXFbGuQyDSGzXxgT/A+gejudRtRX5si7KpNLkPb
   8c7fei5Du1MOv6QdiQQSWoUOexRDifPlIKsEEq3G21g1s/7S5z8lVtkVj
   Q==;
X-CSE-ConnectionGUID: IWL2HW+nSZGNqb/TR+vlsA==
X-CSE-MsgGUID: Q+qK/FCQQKSb6Kc+LYPAmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69244663"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="69244663"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 01:37:10 -0800
X-CSE-ConnectionGUID: 4b2IbTCiQXqZrCxApvrMDw==
X-CSE-MsgGUID: lOhzE6VEQUG0Gd4JQAv//w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="203208995"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.126])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 01:37:09 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 20998121D77;
	Fri, 09 Jan 2026 11:37:22 +0200 (EET)
Date: Fri, 9 Jan 2026 11:37:22 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: johannes.goede@oss.qualcomm.com, bingbu.cao@intel.com,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov01a10: Fix digital gain range
Message-ID: <aWDMUiHCiZwfCCMu@kekkonen.localdomain>
References: <20260108135738.175304-1-mehdi.djait@linux.intel.com>
 <aWAxKVNem7XsKHQi@kekkonen.localdomain>
 <xpiwrxfvzdgme5e7djn2uoqttkwe2z6gf3zle7kqupad3ujjlp@ku7sntzmxclw>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xpiwrxfvzdgme5e7djn2uoqttkwe2z6gf3zle7kqupad3ujjlp@ku7sntzmxclw>

Hi Mehdi,

On Fri, Jan 09, 2026 at 09:18:48AM +0100, Mehdi Djait wrote:
> Hi Sakari,
> 
> On Fri, Jan 09, 2026 at 12:35:21AM +0200, Sakari Ailus wrote:
> > Hi Mehdi,
> > 
> > On Thu, Jan 08, 2026 at 02:57:38PM +0100, Mehdi Djait wrote:
> > > Digital gain wraps-around at the maximum of 16838 / 0x3fff.
> > > Fix the maximum digital gain by setting it to 0x3fff.
> > > 
> > > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> > 
> > Thanks for the patch. I believe this is already covered in my branch.
> 
> If you are talking about:
> 
> ad3ea1197513 media: i2c: ov01a10: Fix analogue gain range
> 
> this is for the analogue gain, the patch I sent is for the digital gain.

Ah, my mistake. Thanks; I'll pick this to the same PR then.

The same Fixes: tag (+ Cc: stable) would seem appropriate:

Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")

-- 
Sakari Ailus

