Return-Path: <linux-media+bounces-65454-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HO6SDJRROmoI6AcAu9opvQ
	(envelope-from <linux-media+bounces-65454-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 11:27:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B335E6B5CCB
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 11:27:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=a8uod8sM;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65454-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65454-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE47F305881A
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 09:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902973655E9;
	Tue, 23 Jun 2026 09:26:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C3635F5E3;
	Tue, 23 Jun 2026 09:26:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782206771; cv=none; b=d+yC2YBIVeCVNoD+XOdNEd5xI+oNY2qrfFJ81o2DxLPIXKvJE4M/yHxVBYyaX53c+7uCCLf1ZSWxQk66ZngOappPwJjuBr1MsWU5D8y0WK+B9H0JrsIflcV40pRxJpI3FR9AUrEjMjYCaGsrNSTLxoMyoQLCsC1AzkzCRoGQ8GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782206771; c=relaxed/simple;
	bh=4cB5K1MyOwAljSIAB5h7y5ycwAo3C4xLQVfz3v4GAzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6cEgT/YkGdYhwTzwurnBMs/oxRbDvQgTl28VEDMPshnWdt/KOBaMwuII+5J98nLDMYjUMHMGpZ3tjl7oyiXszElX0Gk2S4ppZeD3zdw2hPQxUBXQY9OzkV3Y2PiJukxSsXx1t0vKWRxtLbtV7bme/gtWYW94JF+6xBqwgGz1Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a8uod8sM; arc=none smtp.client-ip=198.175.65.20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782206770; x=1813742770;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4cB5K1MyOwAljSIAB5h7y5ycwAo3C4xLQVfz3v4GAzM=;
  b=a8uod8sMauYbWfesq+1ySRcR04CV29R3Jy9LwTFWY43XQJFkljT4Lk3G
   FFryj9f+3EwhOci+F1Ub4K6zWNLUkToQeu1NRC3F5wVWCG6mrvLE7T26P
   tT6ci/3Tr0W7ReAGl3E3J9epiGjHc71cXjQZ/3PlejWGCpWjDuDJo7Ys+
   Xu8hxsovbzbSYMLX8LMRylzigLvq8mZda44Uu+q58xQc66ox6/YbgQ9N1
   bmf6umEBf0qoyAwuL7pv+M5IYMrqIegu375g/jgAY1Pz5OJAnGNSOA19/
   8ohlLi/YiiiJXjTrpNQQvYTUD/WvNjGNG+SEG/9chvxH0YUHw9FfLobah
   w==;
X-CSE-ConnectionGUID: fS0jCD+RTYCRZSm/AAGzRg==
X-CSE-MsgGUID: LqDlwu7nTM6YIeIcsmhijg==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82714271"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="82714271"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 02:26:09 -0700
X-CSE-ConnectionGUID: zEZVrUorT9qnndCarBVKHQ==
X-CSE-MsgGUID: tmp9o37zSa+KBzMYh1pQVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="249593710"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.7])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 02:26:07 -0700
Date: Tue, 23 Jun 2026 12:26:04 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mani Bharadwaj <manibharadwajcr@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: media: atomisp: anr: move trailing statement
 to its own line
Message-ID: <ajpRLLxE3iBt5ZGL@ashevche-desk.local>
References: <20260622184100.33490-1-manibharadwajcr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622184100.33490-1-manibharadwajcr@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:manibharadwajcr@gmail.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-staging@lists.linux.dev,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65454-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:from_mime,ashevche-desk.local:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B335E6B5CCB

On Tue, Jun 23, 2026 at 12:11:00AM +0530, Mani Bharadwaj wrote:
> Move the return statement in ia_css_anr_dump() to its own line
> to fix the following checkpatch error:
> 
>   ERROR: trailing statements should be on next line
> 
> No functional change.
> 
> Changes in v3:
> - Fix subject prefix: add missing 'media:' subsystem tag
>   per Media CI bot feedback.

No. Take your time and read the linux-media mailing list archive for last a few
months in regard to this driver. Only _after_ think about contribution (what to
contribute and how).

...

Also read the process documentation. Do your homework before, please.

-- 
With Best Regards,
Andy Shevchenko



