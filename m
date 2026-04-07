Return-Path: <linux-media+bounces-58195-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NtHA20f1Wl/1AcAu9opvQ
	(envelope-from <linux-media+bounces-58195-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 17:14:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBA23B0C20
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 17:14:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 25D06303BBF5
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 15:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2397D3612E8;
	Tue,  7 Apr 2026 15:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2I7+TrM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C37F33E34B;
	Tue,  7 Apr 2026 15:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775574736; cv=none; b=IoZyngfIfvMfJJm8FnrRA1tXxgoESFf6KPB57UMNiSQgf/axgUZAmzORYAWHO6k74FZag6C6NP676576bVypoQc+zdIU4lRPcyb56Y+cKz0UwGNG5ZVYXwS2nZNSqpc8k3ghBgu8wF4BT59/eoKc7Ofn0DW4wVmPVPAhyYwfYCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775574736; c=relaxed/simple;
	bh=ksaPGYZ9IDzRDhhhQbnkR90C6+w3bzomRLvdju5WGHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CO3I0RXGepIDrCMNOI3fxaktiVHfdPRVVtBE3ebcbVdfl2zXuAdRRnVzUpiB234JH43a79DbU7AH5EUrptZiHVUJSqk/IsmtXrrUCYF8EC2u/j3z0OZmqEzvZqsfbDvUUOJBnAtKjR/CtH7ATzBIHlukw75ZAnrdHmfdKrzzepA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e2I7+TrM; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775574736; x=1807110736;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ksaPGYZ9IDzRDhhhQbnkR90C6+w3bzomRLvdju5WGHo=;
  b=e2I7+TrMGCoY8aPcoNCWNGNoBfS1P/kd+ReS3WJji/UijJ2YiOB2WoN7
   hkSYQh1pTc0w7aXk8A6bvoX8AYeaQ0GHz5X2X0yqD40dNDm5IuaJY5WHE
   tU1WXgxKUV+Rkeh9DGEdSwenscv06Ka+tpcVl1FpeZQx6VNumvs+KNGMb
   rxiQNe4OpdabX4WPgNECPjGTd2vJ0BJ0ltDG9kb1Y634FRbzFv7iiLkvp
   DtRLSCOV9QU00L/ToY/2wf00Aw/Ty5PXNe+IcXkBNu11cZ4ZC6d02ZM3O
   c25oDY7W8byv/PiUWwi23jrdarhUm1ojJANIJ+D6s8BPA0RsWYYfFFM42
   w==;
X-CSE-ConnectionGUID: XLT1mF1QQtWekmnT5m6uJw==
X-CSE-MsgGUID: Dl6f5YmQSXW8AD6mWrWqxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="86833223"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="86833223"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 08:12:15 -0700
X-CSE-ConnectionGUID: rk/XMJc1Q0uC4KoCJTZNJA==
X-CSE-MsgGUID: cMVQU6sQSbaeXq+xPWqEPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="233070942"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.182])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 08:12:13 -0700
Date: Tue, 7 Apr 2026 18:12:11 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC] staging: media: atomisp: change copy_from_compatible to
 iov_iter
Message-ID: <adUeywfiQzZ5JgEd@ashevche-desk.local>
References: <CALoEA-wrnqUM_5hDGUL1xJi3crf64ApE7fUrb2_47xVzhBT35Q@mail.gmail.com>
 <adUddSgsIhsZ9WP3@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adUddSgsIhsZ9WP3@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58195-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,ashevche-desk.local:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0BBA23B0C20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 06:06:33PM +0300, Andy Shevchenko wrote:
> On Tue, Apr 07, 2026 at 04:46:49PM +0200, Joshua Crofts wrote:
> 
> > I've had some spare time and looked at the copy_from_compatible function
> > in pci/atomisp_cmd.c. You've recommended checking out the korg1212 driver
> > and patch for adding iov_iter support. What I find strange is that the korg1212
> > driver already expects to receive the userspace data in the form of iov_iter,
> > meanwhile atomisp expects a from and to pointer along with a boolean
> > whether it's coming from the kernel or userspace. My question is whether
> > you meant this as a local fix where I'd use an iov_iter in the atomisp_cmd.c
> > file (maybe separating the functions to user/kernel, since I don't
> > really like the
> > passing of the from_user boolean)
> 
> iov_iter has a type that implies the user or kernel buffer.
> 
> > or if you were hinting to a ground-up
> > rebuild of the underlying atomisp architecture (which is definitely a tedious
> > task, looking at the source code).
> 
> I believe the second (latter) option. The code has to be revisited to convert
> using iov_iter and drop the custom code.

FWIW, the core part of the sound change is here
cf393babb37a ("ALSA: pcm: Add copy ops with iov_iter")

> > Thanks for your time.
> 
> Thanks for looking into that!

-- 
With Best Regards,
Andy Shevchenko



