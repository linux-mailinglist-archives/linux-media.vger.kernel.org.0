Return-Path: <linux-media+bounces-65462-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eNoeFm9oOmpe8QcAu9opvQ
	(envelope-from <linux-media+bounces-65462-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 13:05:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE05E6B685D
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 13:05:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=O75t0OCy;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65462-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65462-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 213E9313C10F
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 10:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F743D25CE;
	Tue, 23 Jun 2026 10:58:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83EF2E5B2A;
	Tue, 23 Jun 2026 10:58:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212318; cv=none; b=GPHn04aPtmo940xdEEtjqzqggRNJCMCiF6UvlpuxbW9nmyT8TYgOZebB5D0N1it6WwzSgBXrs2VqGYNB8GWVHbF1kHyd1ttR/KZ8+bbGZ4cUVgbCmznrUcgLutw4iAB7TmVJdyha8Kccotj9x9y7MExyOss4lxssyT66fw479CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212318; c=relaxed/simple;
	bh=n/5t19g0g60eehGqfVR0OCwmQhk2y+XHzB08Wx8J4fA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tPzf5RcD6FMPZjATPNSNlzTCWqygf3tFyp5epKGaMzDxzY6pF3mKN33RpFKWiCUMaBZDEp9VKFzCv/Z8EWR/ge3aAtbRvBXI6tKqGhixVvR3jErkZBjw7h7usg8ovbtrqXUsreEGdaofnjNpGV/G1rHkDdrS9KLlJNWNkgV4lGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O75t0OCy; arc=none smtp.client-ip=198.175.65.21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782212316; x=1813748316;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n/5t19g0g60eehGqfVR0OCwmQhk2y+XHzB08Wx8J4fA=;
  b=O75t0OCybMywgPu7enYQSb7p8lVYtEhN+SGFAOnMft/0jQJfzqR9LWWd
   xlmfWjKaLIG7oneP8+z9n0cSCjcQGEVBZphCKIL3dPEPeUq7pNYG7sjr9
   c16ZPPXglwJDDRjbNNnBYTW9Ezj0mMPVtzexq5M3y8GqBnOobZ2K6qLHn
   g9sAKrKxDeYEKHDtWa2cIKq1j8a+CHfnKGRKmaCkkgRp7d8h6QBbWhVyU
   np6raQrRWD5NwlJxjkB09fZSYllTBvfEsd1m269EnVRUnGUoCfaaOHAXV
   r4BQ8IlVabgzhw9A3VE7oOeTdthVwLi9z3qZM2J709GXKUUomzrAg85zo
   g==;
X-CSE-ConnectionGUID: j7VUWsd9Q8GbxjyaXH1uQQ==
X-CSE-MsgGUID: n8lQBci1T1+dMEsrH5UzGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82838595"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="82838595"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 03:58:36 -0700
X-CSE-ConnectionGUID: Kh3soITZTlG4OMMVBsSHUQ==
X-CSE-MsgGUID: rLVE95zOR7+YUwKiLO5PQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="253367199"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.7])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 03:58:33 -0700
Date: Tue, 23 Jun 2026 13:58:30 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mohammad Abbasi <mail@mohammad-abbasi.me>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org,
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mohammad Abbasi <mohammad.v184@gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: constify pmic_name array
Message-ID: <ajpm1mtTGtTeR1jx@ashevche-desk.local>
References: <20260619111907.242382-1-mail@mohammad-abbasi.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619111907.242382-1-mail@mohammad-abbasi.me>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65462-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mail@mohammad-abbasi.me,m:hansg@kernel.org,m:mchehab@kernel.org,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-staging@lists.linux.dev,m:mohammad.v184@gmail.com,m:mohammadv184@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:dkim,intel.com:from_mime,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE05E6B685D

On Fri, Jun 19, 2026 at 02:49:07PM +0330, Mohammad Abbasi wrote:
> Fix the following checkpatch warning:
> 
> WARNING: static const char * array should probably be static const char * const

Missing blank line here.

> Signed-off-by: Mohammad Abbasi <mohammad.v184@gmail.com>

-- 
With Best Regards,
Andy Shevchenko



