Return-Path: <linux-media+bounces-52381-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cElEFvqaiWkv/gQAu9opvQ
	(envelope-from <linux-media+bounces-52381-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 09:29:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D3110CF8F
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 09:29:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E85FA30626D1
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 08:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3309E309F09;
	Mon,  9 Feb 2026 08:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cx0rr2os"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE34309DAB;
	Mon,  9 Feb 2026 08:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770625504; cv=none; b=gRo595SkrhloMN22f2KBfGsX7eR7G77Mv5BKMHcREGonNYGEtmLP9kyOLIR/RALS1e7ZrLYbwbYSb1rTCxSLhNHG2Y5qh4iaF7Oo6XafbW+IvvmCUksJ8X2yBK7mKg6cbJITi8hO5PJY1JYIuGclOMVU3eM85A3htw2+qREkXwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770625504; c=relaxed/simple;
	bh=mx78UmeNbhk0TI99UBtg+lRRnmrkyIKDNfGdylFc41A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=urluRo4uky1kuy/Xi9tQm7cLdqJBpIMyE18is4AQ6qAl5uspYiEAZvhekxQCRwKcCVQBasjB1u0UQUdtuCb/dV6Fn7EoEUI5svcwEtqDhilrkqjg+tbxZ8piLx+yD4xB1+Ed72R9m1whc41NUGPD79wrhh6c0euiWRTxj2iiKtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cx0rr2os; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770625504; x=1802161504;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mx78UmeNbhk0TI99UBtg+lRRnmrkyIKDNfGdylFc41A=;
  b=Cx0rr2osCftfK8/wL2ujXc1um1Zb1w069aFv5inSTFWZB4yqWpY9+Om4
   8zS2V9dCJB8HOIqs7m6DBeJ5NKQsRFu2/akCCY0hHmwNiuOucrVHY221h
   b/PRSLBywRok97D38l4WgpPFj/sQLa+CVwvgPrdUEfku///rIbMMiyrxU
   4/OCQ4lvjD1ZKF46Bs0hWFU10ogWefjwHva53Zh2qKVtRVW7Y7DfMHYNY
   85JTMi83rs5p1zeBuHt7XjXO+K2Jc5Pgmgij0rVVHC+Om2RojL0yKO7ya
   xy7/iqcLLgCY4r+22nTlll8YxPUm6ktM+8o4+ZxzlhhLjojpXz8or+tgw
   Q==;
X-CSE-ConnectionGUID: gZ5wAN6STvavuR/gY/n57w==
X-CSE-MsgGUID: RYUZg0LPTGqnj/mJkQWxUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="82465829"
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; 
   d="scan'208";a="82465829"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 00:25:03 -0800
X-CSE-ConnectionGUID: DuRIpxsURGW7X1lqgA1XPQ==
X-CSE-MsgGUID: BUgVpLUsTCqrsAmfys5qhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; 
   d="scan'208";a="210601791"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.128])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 00:25:01 -0800
Date: Mon, 9 Feb 2026 10:24:59 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Matt Wardle <matt@mattwardle.net>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: Fix brace style issues in binary.c
Message-ID: <aYmZ20RmdmJY0Pp_@smile.fi.intel.com>
References: <20260209044854.83299-1-matt@mattwardle.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209044854.83299-1-matt@mattwardle.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-52381-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,smile.fi.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checkpatch.pl:url]
X-Rspamd-Queue-Id: 65D3110CF8F
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 04:49:22AM +0000, Matt Wardle wrote:
> Fix checkpatch.pl errors and warnings regarding braces on incorrect
> lines and braces not required for single statement blocks

Missing period.

Note, if you are going to do this file-by-file, it won't scale. So, collect
(sub)folder and fix all files in that one for the same issue. Then repeat
the same for other (sub)folders. Make it a series of the patches.

...

>  int
> -ia_css_binary_init_infos(void) {
> +ia_css_binary_init_infos(void)

Side note: This can be one line now.

...

>  int
> -ia_css_binary_uninit(void) {
> +ia_css_binary_uninit(void)

Ditto.

-- 
With Best Regards,
Andy Shevchenko



