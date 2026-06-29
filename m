Return-Path: <linux-media+bounces-66009-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0hjuAZavQmrS/gkAu9opvQ
	(envelope-from <linux-media+bounces-66009-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 19:47:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 633F66DDDC5
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 19:47:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=aNHnYcSV;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66009-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66009-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A37BE303589E
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 17:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A85183803EF;
	Mon, 29 Jun 2026 17:46:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C62318EE6;
	Mon, 29 Jun 2026 17:46:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782755213; cv=none; b=Q0ysDzH6jen9kxsF7+86nGzDnVvzZp04qzk/ToQnOKjn1c9QzizVakLya/30hnbSPjY8ekJMVyMOerZXA5gwhCOebx4uAhSz1nrsk8T/q7PTWhuEA6FJ0QKji9XUwPT3kAyDm5zlOz7bSUNoNhaZ+xNNDjpsfR5bjMDOT8TC0is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782755213; c=relaxed/simple;
	bh=Gqsw1pW7i6nGU1jNertuHP6roce2PEW69oDsk7J1LiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFDWFLc8UeWeNBjWEpEyArWACYJmjUQnTZvVEZ7TWyJ+iejmGQVn/nyR2fJr1HKCjTuUNA/g/SR4efT3vmBsgsxCTqoIbQ93RhcyhfyBT9qof/d5xqWWem24RciqZrRvoFzUm9YK4aj9Rso8P0RuqkfjZj6LjLikueyIYUB8+so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aNHnYcSV; arc=none smtp.client-ip=198.175.65.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782755212; x=1814291212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Gqsw1pW7i6nGU1jNertuHP6roce2PEW69oDsk7J1LiM=;
  b=aNHnYcSVCzEJV7NHAVDTc1AtJmamPmTDsXFTxrUQ7xuKT+750YHzZyd8
   xxt1h1SZPQrSxrc1J0+uf3OYleRH9GDc1ujiuHLpKoxbbUTBN5IEGPyNU
   c3PUb2DVEBT7ReB4OH0wcTPGLOpX59Xy0LPFk5A5mXfGYosW8SHt8WajK
   KMRgCV0Opi7iyUm4O/ZPByQo4Pvg7flIR0qX9sVt/8qeep4a81yqPMaZ8
   Y8r7it3bDsWqY2WwkyuCc34ityPzIsB0PSiaJUgKV1hivH08VBsLLvPeH
   8Z0vuXc4m8ra29GQZTyAZboiOAclE78c4LsCEwsQCIZfoBGdgHn81HTRE
   w==;
X-CSE-ConnectionGUID: +UVjVl90QISvNQWHddZfSg==
X-CSE-MsgGUID: gUiUADLbS8i35XErHT7yAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="106253864"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="106253864"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 10:46:45 -0700
X-CSE-ConnectionGUID: 22+hkID1RIGeSqnEZMg/Dg==
X-CSE-MsgGUID: 86ddzfK/T5aItVVVW1CvSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="245671320"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 10:46:43 -0700
Date: Mon, 29 Jun 2026 20:46:41 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 1/1] media: camif-core: Drop unused include
Message-ID: <akKvgdXIj4EmKfxs@ashevche-desk.local>
References: <20260320215910.3236783-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320215910.3236783-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sylvester.nawrocki@gmail.com,m:mchehab@kernel.org,m:sylvesternawrocki@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66009-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,linux.intel.com:from_mime,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 633F66DDDC5

On Fri, Mar 20, 2026 at 10:59:10PM +0100, Andy Shevchenko wrote:
> This driver includes the legacy header <linux/gpio.h> but does
> not use any symbols from it. Drop the inclusion.

Can anybody take this, please?

-- 
With Best Regards,
Andy Shevchenko



