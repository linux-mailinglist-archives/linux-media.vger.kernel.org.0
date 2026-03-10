Return-Path: <linux-media+bounces-55084-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFovNucEsGlAegIAu9opvQ
	(envelope-from <linux-media+bounces-55084-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 12:47:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3561724B8E4
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 12:47:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A72BB31BC9F8
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 11:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74DB6381AF8;
	Tue, 10 Mar 2026 11:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ypu8snO8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641CE313E32;
	Tue, 10 Mar 2026 11:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773142999; cv=none; b=jvHBGdd9StQ7VN7xEGGq4oLzIY7BPiSF6HPwTnSRRm0+O8jG0HrZfBXBIylFeJgBEQwodX2rpQJr7DdIMM1Xo5R727n3xlJBEX0mUgfsHVesRMuCE4oQRFWC1wxAfcyUiG8DIeScmirkZrPeGAZiCJlijrKO5Rt6roz79Xu+tL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773142999; c=relaxed/simple;
	bh=mqbkG/edCyp0Mk2DsLFE06P3hc0McCqa8DLzWHkPv4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5i7B40W8RqZ0RVvReUusPhgcB6k365Pi79uAntaG5Hn++YGnoWTZhCwGKn3cT+pZEVljzkG/IWkCO5E8L8JSQJhrC4xpbqel55H2c6Lx3eQxAIGA40P+s5+/2xcu5TjjLlJhExsVJEQqMFSzkF8Ann29DEQin/5NMXmHMbUHrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ypu8snO8; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773142998; x=1804678998;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mqbkG/edCyp0Mk2DsLFE06P3hc0McCqa8DLzWHkPv4I=;
  b=Ypu8snO8bQVBaDv22gMix0YbUscJJ69FZ4qWE9Jfrc/70pIRjY6sR1ar
   zOhAXAjRyMUidWpCY6nm6NgeprhVXcM3UQq+YG3vMj9hqvhDPv6pK+Ytu
   npb8t9Hwttg6Lp94gpxw1PqV1G3Wxz/mdb7NOdf0EMDA69Ld+t/9Tlc3y
   sevr3vw6rn2Df2h87wNZuDnO0qSXVbhdFiDBkG3vqNTG11uVbgsbz+Lj0
   9yIjDjDjz82Sbc8zuYKNSBCiAT+bsu3EGm18JC7nsKAuVGILZ+7/Q0IL8
   gWaDl2yyRS/l3N7HDzbXqz85vtoB7mSqGReG+2P9ruB4mYI3QEEOH06VS
   g==;
X-CSE-ConnectionGUID: Sg4mEqkrTnu+yJWY93i1bg==
X-CSE-MsgGUID: qim6SFPzSgSWxaq1PPGDbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="73381605"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="73381605"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 04:43:18 -0700
X-CSE-ConnectionGUID: tGXQp/o+TxiIABjTVNio/Q==
X-CSE-MsgGUID: X5knLD3qRXmaciQpLoEcew==
X-ExtLoop1: 1
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 04:43:15 -0700
Date: Tue, 10 Mar 2026 13:43:13 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: atomisp: fix block comment style in refcount.c
Message-ID: <abAD0ZvWiTUDizs8@ashevche-desk.local>
References: <20260309215516.6091-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309215516.6091-1-rayfraytech@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 3561724B8E4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-55084-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 10:55:16PM +0100, Oskar Ray-Frayssinet wrote:
> Fix block comment formatting to comply with kernel coding style:
> - Add leading '*' on continuation lines
> - Move trailing '*/' to a separate line
> - Remove unnecessary braces around single statement block

Are they the only ones to fix in the entire driver?

...

>  /* TODO: enable for other memory aswell
> -	 now only for ia_css_ptr */
> + * now only for ia_css_ptr
> + */

/*
 * Please, fix them in a better
 * way as depicted by this comment.
 */

...

>  			/*	ia_css_debug_dtrace(IA_CSS_DBG_TRACE,
> -				"ia_css_refcount_uninit: freeing (%x)\n",
> -				entry->data);*/
> +			 *	"ia_css_refcount_uninit: freeing (%x)\n",
> +			 *	entry->data);
> +			 */

No, instead use #if 0 ... #endif. Or even better if you find any existing
compile-time definition for that (instead of 0).

...

>  				/* ia_css_debug_dtrace(IA_CSS_DBEUG_TRACE,
> -				   "ia_css_refcount_decrement: freeing\n");*/
> +				 * "ia_css_refcount_decrement: freeing\n");
> +				 */

Ditto.

...

> -			if (entry->count != 0) {
> +			if (entry->count != 0)
>  				IA_CSS_WARNING("Ref count for entry %x is not zero!", entry->id);
> -			}

Make this to be a separate patch, and find more occurrences of a such.

-- 
With Best Regards,
Andy Shevchenko



