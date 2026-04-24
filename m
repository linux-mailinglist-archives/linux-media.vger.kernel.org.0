Return-Path: <linux-media+bounces-59501-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIfbN4Uu62mBJgAAu9opvQ
	(envelope-from <linux-media+bounces-59501-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 10:49:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 850AF45BB23
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 10:49:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD3D53013D7C
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 08:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C939A3596E3;
	Fri, 24 Apr 2026 08:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nte+apQW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169FA312819;
	Fri, 24 Apr 2026 08:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777020539; cv=none; b=hDgEwUwe6Yl6BXNwsNc2ddhyynWrT6EUMCVvdGSXhxhR/02kI+rnTRF3zLLj9qLR7SwAlvAfLbZEY9fPWt/24WwCmrIaMoiRMBZU5elLlPsXNqQBTgy3roA8rlvLj3piZoIpzcmmnm61o7hjVxbxDT4bFMjC1GwDGbPqfRTPp4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777020539; c=relaxed/simple;
	bh=icLhSJhC/W2Qmmmzj/awXVEbDZZ/hREewT1hmQo06/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJLHrt++t30re5a/wlGpGb5UtZvGH0E+gApjzluUhwa0mcUgWqn3Mhs616t2gRb2TuKRX1tQWI2lFiJoT0LekO6cSAGgVYB//jJFfSngC7Cfx2wkoNMpLtYj9PiI3IgOORnNkeY9ekwUJ6+cmStIq8cV0vCQR/rbpywJX2pHCig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nte+apQW; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777020538; x=1808556538;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=icLhSJhC/W2Qmmmzj/awXVEbDZZ/hREewT1hmQo06/o=;
  b=Nte+apQWciw0KFFAJXe0FGXdCU1lkrnv7b2L2DxVZCxDknE67ORvzd3W
   YO5unY/96LwpYiqOCGpex17UFgQlbqPHzBnpVMrEv7V15uNmDBcb8u2PJ
   aIYGe01gzsd40TFWSlDPclSkGW7MRNq77qJbpp0h1o4nBwRbO16un6tmJ
   NsHwayVZ7iXMUyUhJ3KX3bFA/2ozCxgxgWdC89H3riypPuVjwaeLQZ+qn
   HCKKqMN+o1SYxAmQCUReZSrOryZVVOL4TjRx8vhZ58LJVWFw7/tXx9k6X
   H1O3WYbflopTMmYrw/QVl8zv+ZGsMK27gCbyIHAT5UGElc4ZHUIYw0jef
   g==;
X-CSE-ConnectionGUID: igy1pwW1RPir3bPTY7ReWw==
X-CSE-MsgGUID: YpfDIzZsRRSwpOrU/NfAdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="89461929"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="89461929"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 01:48:58 -0700
X-CSE-ConnectionGUID: 4LesiDtzQCmmlNgyJzqP0A==
X-CSE-MsgGUID: gD7o+QX3Snaw7iLwvxsRxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="237240515"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.71])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 01:48:55 -0700
Date: Fri, 24 Apr 2026 11:48:52 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Robertus Diawan Chris <robertusdchris@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, me@brighamcampbell.com
Subject: Re: [PATCH RFT v2] media: atomisp: Add error check in
 create_host_regular_capture_pipeline()
Message-ID: <aesudPcQ8Fec0_VU@ashevche-desk.local>
References: <20260424081538.459564-1-robertusdchris@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424081538.459564-1-robertusdchris@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 850AF45BB23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59501-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ashevche-desk.local:mid]

On Fri, Apr 24, 2026 at 03:15:38PM +0700, Robertus Diawan Chris wrote:
> When calling ia_css_pipeline_create_and_add_stage() function, there's no
> condition to check whether ia_css_pipeline_create_and_add_stage() throw
> an error or not. So add conditional check for the return value of
> ia_css_pipeline_create_and_add_stage() function.

> This is reported by Coverity Scan with CID 1408952 as UNUSED_VALUE.

Unneeded detail in the commit message. Use the comment block for that (as there
changelog right now and other stuff you explained).

> Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
> Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
> ---
> v1 -> v2: Add Fixes tag (suggested by Dan Carpenter).
> 
> v1:
> https://lore.kernel.org/all/20260423060246.296986-1-robertusdchris@gmail.com/
> 
> I am not sure if omitting the error check is intentional or not, but from
> what I see from another ia_css_pipeline_create_and_add_stage() usage
> in the same function, we check the return value after the call and return
> the error code if it's non-zero.

Okay, while this observation sounds like a +1 to the suggested change,
you still need to dive into the code and try to get if
ia_css_pipeline_create_and_add_stage() failure is fatal or not for
create_host_regular_capture_pipeline().

> I also don't have the device to test this change.

It's a pity as this driver is quite complicated thing...

-- 
With Best Regards,
Andy Shevchenko



