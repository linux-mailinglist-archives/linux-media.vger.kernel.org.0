Return-Path: <linux-media+bounces-64916-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v3vYKJYHMGpIMAUAu9opvQ
	(envelope-from <linux-media+bounces-64916-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 16:09:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD5A686F2A
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 16:09:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=EkyQlu85;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64916-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64916-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A077302E0C6
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 14:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90C2D3F65EC;
	Mon, 15 Jun 2026 14:09:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E432E3F4840
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 14:09:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781532560; cv=none; b=sV6ntw0TVgOdDLNnuaZXHR+1rbfLt3HJ3t34vPwk8Sp5uwB49zEBCq+GoOR8J5TPEYpU18vvi7z6eKoJSzvS3iE6nPzYEiscxUnDXa/xeoXaOupKzw+hr72YMVikKgP8PMxMcujZknzn+c+V2oPi9C9woYpUQYm/fbpLKr0wiu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781532560; c=relaxed/simple;
	bh=ty7y+PmmpPMcSZT3QxdciDZM4mxShqfTp18fzBz+R40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXbBi95GLPEt6pR/51PgZE0AZLLeac5uzAgud8ZRX66D48ksuHEnFQao5/mwJZXQj9SPmyl8egJp+02AmwlrNjido1SRNBMbB0fCs4AjyTY7U+YZ46K8OZhDZ3eewSjoL/yaUbTHnvfBbJL5yLGB2BNh18AAtU8HHI5G6Z5cHGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EkyQlu85; arc=none smtp.client-ip=198.175.65.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781532558; x=1813068558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ty7y+PmmpPMcSZT3QxdciDZM4mxShqfTp18fzBz+R40=;
  b=EkyQlu85IFI4V7FkeCY+AfM5gVtITJcEC70AZXWEIYc0qGSsPbcDfNNR
   GNGkkGF+sPG+moxyg52mZb2TMJ9InCLfG6UzXW73UP73iWu/CttDtvxVh
   iEqmsHGi6texgqXZZ/djBV5ai88pGUnNs/ss6a1RMnEpcqsT8WhxCMa3g
   bmA58kQ4kokkK0nbIgHh1sU3jFVKpmm5kasM/Lc3gsBwu/5cdixPoVMku
   zawqKFCQoakPkDyqWPksZ94tEMUwWl5QeGcioKrcpvbwXV0IOyyC53hqH
   BNDp6lXVbsCphjSR+w19YkeWk1LuBWD9cB9gKzcdsalWaDbuVWzywLZCw
   A==;
X-CSE-ConnectionGUID: w2SxsSQPSWyr3hE0//eOjQ==
X-CSE-MsgGUID: nzPSKEZ5QjuqhKgJzYAeVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="104943463"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="104943463"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 07:09:18 -0700
X-CSE-ConnectionGUID: B91fJA2qRLStv/s4C6nG9A==
X-CSE-MsgGUID: XpaavBfkRRK1Hp5t+sA3PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="243115678"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 07:09:16 -0700
Date: Mon, 15 Jun 2026 17:09:14 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Andrei Khomenkov <khomenkov@mailbox.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>, Kees Cook <kees@kernel.org>,
	linux-staging@lists.linux.dev, linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: atomisp: replace kmalloc() with
 kmalloc_array() in sh_css.c
Message-ID: <ajAHitx6a0Sk5pLZ@ashevche-desk.local>
References: <20260613110712.71436-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260613110712.71436-1-khomenkov@mailbox.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:khomenkov@mailbox.org,m:gregkh@linuxfoundation.org,m:andy@kernel.org,m:kees@kernel.org,m:linux-staging@lists.linux.dev,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-64916-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,intel.com:dkim,intel.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0FD5A686F2A

On Sat, Jun 13, 2026 at 02:07:12PM +0300, Andrei Khomenkov wrote:
> Replace arithmetic in the kmalloc() function with the kmalloc_array()
> function, as this calculation method is unsafe.

Why not kmalloc_objs()?

-- 
With Best Regards,
Andy Shevchenko



