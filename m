Return-Path: <linux-media+bounces-10384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A74468B64C0
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 23:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E790282567
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 21:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0B6D18410B;
	Mon, 29 Apr 2024 21:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aJqLriDS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4C31836E9
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 21:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714426996; cv=none; b=bWuAtvi5BXlejQKqDzAg9P3uE9z3FSuA8rZAn1NU8wOQVd0gyV/7B2tGNPcqwsd/iQ1PXgX/aBu2aU2gFcR6Mysy4GNAau795zD0dcpqdMUUL3SIq1+SnwOS8XqAdsDL/6EgAzdgw/efwDrlGX5kpjRmu+3YXREAqzOmsymp5Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714426996; c=relaxed/simple;
	bh=qnlHDo8xi7eR0W0KGGU/5B1g/F+RKVIASsSNE3iZODA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iku+kZRzztf0OdEkp4vRYXQdUUfcxzE3xPqCaAgM9nEQ63x4Ns65FUPqZjJwpJyQEEYcpUe4vt/bObbElULp1qOLczj5gd1hvVyi0lg+NlxonCs0AkdZeEhxsQ+LF+L1Uo5ssS2sOWfJdFOpAPkk8Z7ADu3LwrJvHxDM19ZT8sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aJqLriDS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714426995; x=1745962995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=qnlHDo8xi7eR0W0KGGU/5B1g/F+RKVIASsSNE3iZODA=;
  b=aJqLriDSSbXmy6OGWL1b3oUEsZ6npgihH+L73pppyzIia4tXj5nfe/n+
   EhysoUlX4S2A2PraL3pEtKbTxco3yssJDRk8n/OwEilxaUVGGcEx94sod
   Hf0T3PO5LRWkKSwmH6dHviiru/GotAjN10dBVjZaVRJNj5tPKhudKSQ7o
   jStFHdgr/lB/o7bl87GLczmP7mtiPtqQstaCtSVnN5Mi4O8B09qnrwVzq
   r3IgE+7dLY5CfpiaKnOlcLzIqyG8BQNeqBNq1nOQO8TSwOmFjBXoTo+St
   WMQwXBI/IzJYvlLErVKt6qqkGe+cM+i0zvjPNGB0D1sGoavoa30ZhP0x5
   A==;
X-CSE-ConnectionGUID: 53uqNBaLSFKGy3q1Rb4ZAg==
X-CSE-MsgGUID: b1uc8d36QZeOQW430DrTEQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="13899701"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="13899701"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 14:43:14 -0700
X-CSE-ConnectionGUID: UAXr8HJFTmClXRjs+4pQpw==
X-CSE-MsgGUID: P9q/p32JS/i7z3g0DXBn4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="26177783"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 14:43:12 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id AF87611F832;
	Tue, 30 Apr 2024 00:43:09 +0300 (EEST)
Date: Mon, 29 Apr 2024 21:43:09 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Pavel Machek <pavel@ucw.cz>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
	kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: et8ek8: Don't strip remove function when
 driver is builtin
Message-ID: <ZjAUbd5UunISLTEO@kekkonen.localdomain>
References: <20240324160045.238647-2-u.kleine-koenig@pengutronix.de>
 <diats73r4lt7pjuogurvhsk6s6dx5g3cojtdr5bz6coruni777@4nj47bv63vkd>
 <4faume33cuwisfxh7na3iqjzlblnotxcqvaj5ihpqnwdfllvqt@xs6fqd4gmaxp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4faume33cuwisfxh7na3iqjzlblnotxcqvaj5ihpqnwdfllvqt@xs6fqd4gmaxp>

Hi Uwe,

On Mon, Apr 29, 2024 at 10:26:55PM +0200, Uwe Kleine-König wrote:
> On Mon, Apr 29, 2024 at 10:20:09PM +0200, Uwe Kleine-König wrote:
> > Hello,
> > 
> > On Sun, Mar 24, 2024 at 05:00:44PM +0100, Uwe Kleine-König wrote:
> > > Using __exit for the remove function results in the remove callback
> > > being discarded with CONFIG_VIDEO_ET8EK8=y. When such a device gets
> > > unbound (e.g. using sysfs or hotplug), the driver is just removed
> > > without the cleanup being performed. This results in resource leaks. Fix
> > > it by compiling in the remove callback unconditionally.
> > > 
> > > This also fixes a W=1 modpost warning:
> > > 
> > > 	WARNING: modpost: drivers/media/i2c/et8ek8/et8ek8: section mismatch in reference: et8ek8_i2c_driver+0x10 (section: .data) -> et8ek8_remove (section: .exit.text)
> > > 
> > > Fixes: c5254e72b8ed ("[media] media: Driver for Toshiba et8ek8 5MP sensor")
> > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > 
> > I wonder if I failed to make the commit log drastic enough as the patch
> > wasn't picked up yet. This is a fix for a resource leak and IMHO should
> > qualify to go in before v6.9 (though I admit it gets late for that).
> > 
> > Did I address the right people?
> 
> Oh, I fatfingered my git cmdline and so missed this patch is in next
> already. I still think getting it into v6.9 would have been nice, but I
> won't argue if it goes into v6.10-rc1.

You should have received an e-mail from Patchwork when it got applied to my
tree (or around that time). It may still take a long time for it to be in
linux-next and that's of course quite confusing. That will change
eventually as we're amidst changing the process but we're not there yet.

-- 
Regards,

Sakari Ailus

