Return-Path: <linux-media+bounces-65977-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gWiNDr6KQmra9QkAu9opvQ
	(envelope-from <linux-media+bounces-65977-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 17:09:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9F66DC79A
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 17:09:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=Ps7AyLzw;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65977-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65977-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32D313260239
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 14:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71BC03C37B3;
	Mon, 29 Jun 2026 14:45:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15C9331EB4;
	Mon, 29 Jun 2026 14:45:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744344; cv=none; b=fvZeKMKFf1Z6xJUBU0OGyMmw1RGC6RaSjV2XKrwmL+eEM4hdi2zbDB15mrkqaIHD4LQlbchmbGkHH+FOWYe7Hx5G1rfre7igbyd/ywSubFfsaEYS2TKOSpon7G4SjhjuE7+7ZOcrs7W1A3xmlonN0SNw+uTBHvqzkyYWcwyy1aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744344; c=relaxed/simple;
	bh=w3GHAqb3u4iLGjd3yw7Exzd83KYIdmWzhLlfn6AgVSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RTESkWZ1bl73wc6fLLGYYdWlncqMzNBI1UuswcMRbwxMGV0aL32ChXfWj4QGACP5XS7g/uveDi7qEqV1jDIscgm57V47XqMg5wWqHopj2tPuNJcpgUovWRT82gkQr4GI7JG3swcognSME0dSqXrxzu8tuJrCHL0OrKOHH/Sxkzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ps7AyLzw; arc=none smtp.client-ip=198.175.65.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782744344; x=1814280344;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w3GHAqb3u4iLGjd3yw7Exzd83KYIdmWzhLlfn6AgVSU=;
  b=Ps7AyLzwJeQu/ixKshBVixrJHYsXx1u9yOSrPmr0DyrOPcSY2j3N1Uks
   UHecaec6WFHqF9m1t1lPLA0SlyWGi+y8tGvvJUTyFOsJiSrgG97uBaGyq
   Xu7VH+pP4YChOzQWSp3xASHkJd6o0al2J0e/jDFsriS4hccoT4fTr14yA
   VkJWiQGgVkxRsmO/GIqNDsTZU0PGZ8fLoIykwV13gHf0PjZ0H0EedxMOx
   RTjrNYRkczIc0s4Ty/y7gFQhKRjBHmVLNvaMon0p4U1j8ms44B/U1GfRU
   GcZWVxPH2ZYWXb45kiQrq24KijQxgIlRHsoPXdBYF4jLkV8G4fj/huE84
   w==;
X-CSE-ConnectionGUID: X2R+KGzgSBi3ztpULnewsw==
X-CSE-MsgGUID: 45C7Qs95SNuMy1PM4a6wkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="93786968"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="93786968"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 07:45:43 -0700
X-CSE-ConnectionGUID: Yvml85BDTPW1zl4vyEvb+Q==
X-CSE-MsgGUID: WdeJ8/LOSdK/mOGMLc37ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="290100360"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 07:45:39 -0700
Date: Mon, 29 Jun 2026 17:45:37 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Dawei Feng <dawei.feng@seu.edu.cn>, hansg@kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com, andy@kernel.org,
	gregkh@linuxfoundation.org, azpijr@gmail.com, kees@kernel.org,
	arnd@arndb.de, pontescpedro@gmail.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	jianhao.xu@seu.edu.cn, zilin@seu.edu.cn
Subject: Re: [PATCH] media: atomisp: fix CAS scaler descriptor leaks
Message-ID: <akKFEf73wisw6Qrn@ashevche-desk.local>
References: <20260627060151.2543613-1-dawei.feng@seu.edu.cn>
 <akItMNqgKTDBCGV0@stanley.mountain>
 <akJUBYUpjIX0dvx7@ashevche-desk.local>
 <akJehriJCKiJNo2I@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akJehriJCKiJNo2I@stanley.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65977-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:error27@gmail.com,m:dawei.feng@seu.edu.cn,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:azpijr@gmail.com,m:kees@kernel.org,m:arnd@arndb.de,m:pontescpedro@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-staging@lists.linux.dev,m:jianhao.xu@seu.edu.cn,m:zilin@seu.edu.cn,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[seu.edu.cn,kernel.org,linux.intel.com,linuxfoundation.org,gmail.com,arndb.de,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:from_mime,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF9F66DC79A

On Mon, Jun 29, 2026 at 03:01:10PM +0300, Dan Carpenter wrote:
> On Mon, Jun 29, 2026 at 02:16:21PM +0300, Andy Shevchenko wrote:
> > On Mon, Jun 29, 2026 at 11:30:40AM +0300, Dan Carpenter wrote:
> > > On Sat, Jun 27, 2026 at 02:01:51PM +0800, Dawei Feng wrote:

...

> > > free_output_stage:
> > > 	if (need_scalar) {
> > > 		kfree(mycs->is_output_stage);
> > > 		mycs->is_output_stage = NULL;
> > > 	}
> > > free_scalar_binary:
> > > 	if (need_scalar) {
> > > 		kfree(mycs->yuv_scaler_binary);
> > > 		mycs->yuv_scaler_binary = NULL;
> > > 	}
> > 
> > If we go this way, double check that the checks are needed as we have kfree()
> > to be NULL-aware.
> 
> Dawei, Andy is the one reviewing atomisp so his opinion matters more
> than mine here.  So do what he says.
> 
> But I don't really agree...
> 
> In this case, sure, hopefully the caller zeroes the ->yuv_scaler_binary
> pointer, but if we just follow the simple rule of only undoing things
> which we have done then we don't need to check.  The function is
> self contained and self explanatory.
> 
> And more generally, I've always hated patches which delete NULL
> checks before a ionmap() or whatever.  Hiding the NULL check inside the
> free function makes the code less self contained.  The real fix is to
> stop mixing allocated and unallocated pointers.  Then you don't need a
> NULL check because you already know.  (Also I think those iounmap()
> patches were wrong because some arches have a warning when you unmap
> a NULL).

I fully agree with the statement against iounmap(), but for regular memory
freeing it's almost an idiomatic to just call it with valid pointer (note that
NULL *is* valid pointer, just may not be dereferenced). You can also read recent
discussion with Linus with Kees on some other topic where it was explained the
malloc(0) to give a valid pointer (as an "empty" something). Ah, now I remember
what was that, it was about ARRAY_END() macro.

So, having unconditional kfree() for (optional) memory allocations is perfectly
fine.

-- 
With Best Regards,
Andy Shevchenko



