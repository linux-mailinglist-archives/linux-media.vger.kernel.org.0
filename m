Return-Path: <linux-media+bounces-57961-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SI1GOeRrzmmpngYAu9opvQ
	(envelope-from <linux-media+bounces-57961-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 15:15:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF263897F7
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 15:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE1A3318FA87
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 13:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C77053BE634;
	Thu,  2 Apr 2026 13:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m96HQAzg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49CA3D6CA4;
	Thu,  2 Apr 2026 13:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135047; cv=none; b=BB469xH0J2ZPfF0bfJwqZB0Atnv6YE3sm6avj2aYt4ss1hWDdbv6YlJ3FwNawor1TTRjc6T1CNynUG34gPLPT6fi7g6HTP8ayT36OfWypyjxKxl6e7tlIxpH3bZArZm3BNw5I7fi/aQK0zxFMu/YDom5RhbgA0b6DMjMCjjz7Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135047; c=relaxed/simple;
	bh=PZ1mbJckwHJY4yOabONXFik8vFfJx/UYDjn4Ro1vDHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DlkTSGVzFdqrHTo+8GJ+WgoGZY1hxIz/GB0PpC7q2KXKu+62iqksmVyxA9+m9pQn9tDbA7D4XiR/KSeDvfK7ZU3jUkYcjU25P5Dbu3j+mSSfLT6DUe+QF4mckx1UfxFje8ZKX7lDjTDoc4gnSsJ5OE7BeLEhZgHzvz2mEdJEuBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m96HQAzg; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775135042; x=1806671042;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PZ1mbJckwHJY4yOabONXFik8vFfJx/UYDjn4Ro1vDHE=;
  b=m96HQAzg9vIGKOV6CZK0Ze1PF5hgwdWEIOKsha7iewaSnVSpQPaZphFb
   7puu1H96yaEYnx69FGqjQBY+T6Y/YSj3W7IpbLJYZYMALA81/lUy6sW7A
   ntw3bpPw7Vqpl7yi/fVfqEPwcLXTMH9cTgE/ZCX2FuL/ye3cX+ImxWbgs
   sFuqaFqC64kGcbtnAUtmyLxy3A43+o9CEo9kPrGyOufFWlY2IN55w1XHE
   lZzDig+6gRs6MhJvfJhqih44gDznRnRhh0xV4s4m602+DedQlgsLcy33E
   obR/QJW/M3yzrLMA82hgKsGiefcFHnMj9xI1T7VoPzPDL4D882GO0CD4Z
   A==;
X-CSE-ConnectionGUID: ZYTkMZvPRgeMN4z0wPyHKQ==
X-CSE-MsgGUID: UcPZUvmTRjupkZjmav386g==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87264654"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="87264654"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:04:01 -0700
X-CSE-ConnectionGUID: P5C5wateQVS3yhD/6xLZMA==
X-CSE-MsgGUID: sFllq6i7QcWu+BgJJClAOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="250178420"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.31])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:03:57 -0700
Date: Thu, 2 Apr 2026 16:03:55 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org,
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
	grondon@gmail.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: atomisp: fix alignment in function signature
Message-ID: <ac5pOwTLZHFtgyfG@ashevche-desk.local>
References: <20260402091827.2163-1-joshua.crofts1@gmail.com>
 <ac5mFkf5RIEg410Q@ashevche-desk.local>
 <CALoEA-zg2pFEvGGesXJPVfEJQCKZA0Cj5-oqS=U8GUKBd-TRkw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALoEA-zg2pFEvGGesXJPVfEJQCKZA0Cj5-oqS=U8GUKBd-TRkw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57961-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,linux.intel.com,gmail.com,vger.kernel.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.949];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,checkpatch.pl:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 5FF263897F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 02:56:08PM +0200, Joshua Crofts wrote:
> On Thu, 2 Apr 2026 at 14:50, Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > First of all, missing period at the end.
> > Second, why? Does it fix anything?
> > Third, is this the only issue with the driver of a kind?
> >
> Hi, I was doing some checkpatch.pl work and got a few check errors.
> Wasn't sure if it's convention to group all check errors together or do each
> separately. Apologies for the misleading commit name, i'm aware it's cleanup
> and not a fix.

It is okay and good to group the fixes for the same driver of the same kind.
I don't believe it's the only single problem of this kind in this driver.
But you may double check and fix them all.


-- 
With Best Regards,
Andy Shevchenko



