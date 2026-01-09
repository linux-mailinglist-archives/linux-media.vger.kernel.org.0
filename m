Return-Path: <linux-media+bounces-50274-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C160D084BE
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 10:46:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 57884305555C
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 09:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F2823596FD;
	Fri,  9 Jan 2026 09:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MvqTNsWz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E0A358D38
	for <linux-media@vger.kernel.org>; Fri,  9 Jan 2026 09:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767951723; cv=none; b=Nc7QvpoI8nltxBz6K6Yw4yBlaSzC8XqVuaT9jyvo8KPd5XSYSsXeSA16ggvqu7lh281X/+J27zlZjj/OwrxhtivfRDu7xyo3pL7li0oVPYQxidzOKVQT+gyvSZ30egydOOyP2aNy05yriY/EmFuXcLvmgRWWmGcs55+Ruq7mDNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767951723; c=relaxed/simple;
	bh=jx1Upih4djgKcb48GQeUHPVtIg0QoUMDYijdScadRag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gTE2LFWIZHlb2nrYEtpY2ye+qriNcpbjmaJWuQJEjqsgKWQ7szoklplQLwwM2VylcOyz/xXaDtk2+HZP4LYwoumCdYlhPFMqzbRnHTJF4rcRNgQra5KpQH7PzKQDeILRT+SLqFnJ3Lsd2+VEDkAWb3n0olHNlEJtiKeBsk61vZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MvqTNsWz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767951722; x=1799487722;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jx1Upih4djgKcb48GQeUHPVtIg0QoUMDYijdScadRag=;
  b=MvqTNsWzFW7Pn9n4XKEHvh6Dotb/XG646mEyq9GPs5AC1P6ANi0eAmmz
   CBpLYT85Hf2RfY8nhvT0q9Ou56j1qxTqQWaKtp57bdtY+iogGF5VloU4l
   BS1kF0t8j5XK+aoofsoXoTsL3Hc67/BmOJDQlUjRVsG0w80aiGSg0N6vu
   8W4kC8zCt9Jum5hLmLipL7/AWLf/dOHG9BGMoMd/UyL+sK3uF+JaJWdzk
   wLxFfzMkE7qOauK0EtgsbExvozSGHOal2as/7zVliwxLhNkyM9h07rHjJ
   i64Mg/s9MIUeFNVymoI0JrLgIR4MZngJCDCsShoIGLN0IYlQhZNNcyhFX
   A==;
X-CSE-ConnectionGUID: U/hZBsMiQGekAI44eLNK3w==
X-CSE-MsgGUID: GI8SK6ExRPy9xAzSotpf9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69244888"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="69244888"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 01:42:01 -0800
X-CSE-ConnectionGUID: jvaX9i2nRTKA70SlUhCGKg==
X-CSE-MsgGUID: dELkV12qRo+8UptBiCsfZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="207910343"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.145])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 01:41:58 -0800
Date: Fri, 9 Jan 2026 10:41:48 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: johannes.goede@oss.qualcomm.com, bingbu.cao@intel.com, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov01a10: Fix digital gain range
Message-ID: <5fz7rmblmwbcuxuq6btztwqtrb2qevrercxnv6xcstshkv7y22@3kduwzi4xjhc>
References: <20260108135738.175304-1-mehdi.djait@linux.intel.com>
 <aWAxKVNem7XsKHQi@kekkonen.localdomain>
 <xpiwrxfvzdgme5e7djn2uoqttkwe2z6gf3zle7kqupad3ujjlp@ku7sntzmxclw>
 <aWDMUiHCiZwfCCMu@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWDMUiHCiZwfCCMu@kekkonen.localdomain>

Hi Sakari,

On Fri, Jan 09, 2026 at 11:37:22AM +0200, Sakari Ailus wrote:
> Hi Mehdi,
> 
> On Fri, Jan 09, 2026 at 09:18:48AM +0100, Mehdi Djait wrote:
> > Hi Sakari,
> > 
> > On Fri, Jan 09, 2026 at 12:35:21AM +0200, Sakari Ailus wrote:
> > > Hi Mehdi,
> > > 
> > > On Thu, Jan 08, 2026 at 02:57:38PM +0100, Mehdi Djait wrote:
> > > > Digital gain wraps-around at the maximum of 16838 / 0x3fff.
> > > > Fix the maximum digital gain by setting it to 0x3fff.
> > > > 
> > > > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> > > 
> > > Thanks for the patch. I believe this is already covered in my branch.
> > 
> > If you are talking about:
> > 
> > ad3ea1197513 media: i2c: ov01a10: Fix analogue gain range
> > 
> > this is for the analogue gain, the patch I sent is for the digital gain.
> 
> Ah, my mistake. Thanks; I'll pick this to the same PR then.
> 
> The same Fixes: tag (+ Cc: stable) would seem appropriate:
> 
> Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")

Yes, thank you!

--
Kind Regards
Mehdi Djait

