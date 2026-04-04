Return-Path: <linux-media+bounces-58055-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLSqCDtr0WllJQcAu9opvQ
	(envelope-from <linux-media+bounces-58055-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Apr 2026 21:49:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D74C39C4E2
	for <lists+linux-media@lfdr.de>; Sat, 04 Apr 2026 21:49:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6081B300EF7C
	for <lists+linux-media@lfdr.de>; Sat,  4 Apr 2026 19:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A50B33DEFC;
	Sat,  4 Apr 2026 19:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dXLidFNS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38311E5B64;
	Sat,  4 Apr 2026 19:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775332141; cv=none; b=UqfAGdPrLnacsWQp6g8oKU1iS3oHQGN01fqMvxwyIL/JOrdW057RHv7zBCnkOw+j9eGwzG1TmNkm8wQ049fslIPYk9B9Xlm02SjMTBOz3VjrLKSJFj3+zqQ5Nh1d850DeB5fHODzprzpG1YNmaNEMTwy2leedbECRD1O561ld7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775332141; c=relaxed/simple;
	bh=oNK7J/ZJrj15UHcEgyp/oaOFDQo7MzlFwyxSC0GuWnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFZx0Iq3Pvl0CvInB3aiLFtVBxfeTQyq9u2/NJWD5OsL/cgTcuTS+ETcTxq0EgARO3N84QvNT09X4oDkJH3MsJrkIh7CI1YI2MSmhaQdpJeehoISikDJQE8HBCo+xxVqNiP+nmnNu1i7BmZVpg3/aKd35RwCZezlIgqqF5L7H30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dXLidFNS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775332140; x=1806868140;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oNK7J/ZJrj15UHcEgyp/oaOFDQo7MzlFwyxSC0GuWnA=;
  b=dXLidFNSk3mHB4nf03UNRrZDrCGuzztz+sM2egixeYQNf+q7Z8TMcRV8
   rquOhDpGAdYM4R3aWESrwT00b6wF1i1Z4zRdyjp9iT5UCYCL/pPAyStRq
   FfAPa1OD1ipqEW0bmjUFWPG2DkNRkKXJXGqG/je5bvtu5Yoef2mDRKWCz
   ezsPLWTZ2+9PhNWwtiVwyLN+zkIYVhcHz55AqrZjFE4YTq3V3iJf+EKDj
   Nuy20ycbiASwTddKHqJ3IcPdzCNqnoHZgIXo0XCemPx7S5KEtDG8GcSjp
   CGF0eff+QTlm6hSJOZitf8NFHf7OT1NymxJ+vFcQSpLFuN2BqhTkytUAy
   Q==;
X-CSE-ConnectionGUID: iQOj5l9ATum7/dL2DTotqQ==
X-CSE-MsgGUID: tzVXpKW/RSaXZYFXB9xFLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11749"; a="80235661"
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="80235661"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 12:48:59 -0700
X-CSE-ConnectionGUID: NakGEKgiSyyBsdO+UkFnwQ==
X-CSE-MsgGUID: VThqi0DrSOSZUBuveC4uEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="265483901"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.247])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 12:48:56 -0700
Date: Sat, 4 Apr 2026 22:48:54 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org,
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
	grondon@gmail.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: atomisp: cleanup parenthesis alignment in
 pci.
Message-ID: <adFrJmqSfx7dEJWt@ashevche-desk.local>
References: <CALoEA-z0aGoir4_C8cMyZGguJ-Bp1UUADKxntDgjcseUkzNuag@mail.gmail.com>
 <20260403202101.34849-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403202101.34849-1-joshua.crofts1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58055-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.899];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ashevche-desk.local:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 6D74C39C4E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 10:21:01PM +0200, Joshua Crofts wrote:
> Cleanup parenthesis alignment as per checkpatch.pl in the
> pci/ directory.

Use prefix in the subject as "media: atomisp:".

...

>  	hmm_store(ddr_addr,
> -		   (void *)(data->address),
> -		   (size_t)data->size);
> +		  (void *)(data->address),
> +		  (size_t)data->size);

In cases like this, try to use the room on the previous lines:

	hmm_store(ddr_addr, (void *)(data->address), (size_t)data->size);

is perfectly fits 80 characters.


-- 
With Best Regards,
Andy Shevchenko



