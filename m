Return-Path: <linux-media+bounces-57953-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KA0IIjFmzmmXnQYAu9opvQ
	(envelope-from <linux-media+bounces-57953-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 14:50:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B2F3893FE
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 14:50:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7DC72300D4E2
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 12:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48C783DFC6D;
	Thu,  2 Apr 2026 12:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nn8RcMLE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF743D34A0;
	Thu,  2 Apr 2026 12:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134240; cv=none; b=soGNd03Ra10GJuYHt33NFvRAqkU1qr2JL5DBo8UrRGejXoKI3e5zBsZyNAdXPRVT7PYemaUhPnbFIT9DyjVD98ZLGiON4hdUQ8nwTjrFnMJSjTkB934lj3p21vnRI9vpP6KBPp9PwngIsipAKEfLedm62KsYODFYn6GYfr7vuzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134240; c=relaxed/simple;
	bh=tibweY+B+N0uBAl5xfAd8SBcdQVS7DQKA8+tBS5xoJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NRiBZB2V0i6mOx/AsJ441rpyMpvHg2QOSoFJRGtamcsqisLKsu2sm2mzSeP7rzk9J2au6H16svOJffted9Yh25XA501tNGUiOENEjTYusaJkTrRnRG20yGI5dep2x8CwxBkNvjdRsa0Z73BIY0UkiKr019YBD5B1cKHrinMzLU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nn8RcMLE; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775134237; x=1806670237;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tibweY+B+N0uBAl5xfAd8SBcdQVS7DQKA8+tBS5xoJ8=;
  b=nn8RcMLEOJGKVuuRtRVK2diDImlPN1J8YuyeBqfZHYM3k6f6cig+ow0c
   YfJPncQ5Fl9L3xjo44kC2hE3Xd8boHRLyeBkqmCu2NZqAee5+EsZrCvPq
   99Sd646Fux/ny/X0PSqKLAdW18CKQZNhtogPcE+a1R+ZnBk7EdQwFWxcQ
   ym6LqNVZ0125mgHkZm06ek+b8qLTm+ISxgUQWfaU8MN0mXe+57iLrXl8N
   7yI+FvcDJdy9q3gRN8P01GmQ9zFNh96+dOhKqwWz7libYnZx2ItRjB4nu
   zj/VpGvyPfcmcbCzib5naWAsymev7t/O3wJdpPza0aJnO6WsDrh2eeaND
   w==;
X-CSE-ConnectionGUID: Sv5vKy4bTPOoype9vcFztA==
X-CSE-MsgGUID: vgoAvAJaRMqSBIlAcGQe2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="93583314"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="93583314"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 05:50:35 -0700
X-CSE-ConnectionGUID: EopDx8fCRSuOx9SYA0eYMw==
X-CSE-MsgGUID: uzWCp2R4Sy2dgHHmcs4yUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="226837152"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.31])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 05:50:32 -0700
Date: Thu, 2 Apr 2026 15:50:30 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org,
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
	grondon@gmail.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: atomisp: fix alignment in function signature
Message-ID: <ac5mFkf5RIEg410Q@ashevche-desk.local>
References: <20260402091827.2163-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402091827.2163-1-joshua.crofts1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57953-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 23B2F3893FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 09:18:27AM +0000, Joshua Crofts wrote:
> Fix alignment checks in function signatures

First of all, missing period at the end.
Second, why? Does it fix anything?
Third, is this the only issue with the driver of a kind?

-- 
With Best Regards,
Andy Shevchenko



