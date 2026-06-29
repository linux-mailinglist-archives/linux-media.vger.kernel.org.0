Return-Path: <linux-media+bounces-65986-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iQ/2M1eQQmpD9wkAu9opvQ
	(envelope-from <linux-media+bounces-65986-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 17:33:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B496DCBA8
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 17:33:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=oFHMvkvL;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65986-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65986-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9235F3045E47
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 15:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F96426688;
	Mon, 29 Jun 2026 15:23:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736813EF0A8;
	Mon, 29 Jun 2026 15:23:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782746592; cv=none; b=dQrCOIwQDYxKjNYS6yqaN7TSbGREJhDIxzCRJ6LhsHhFCDK7jPNBe/NCYfogUJHMOx3cTMS1fR0rfe6hv0Yf0vofcOYsWMX25J9+7cGS7vE4Nwc7EyDks093fNChm8M4rWPgXM/nCyZu0Ir5jGvnklsbBhlCwNlTYWsZdIVKnAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782746592; c=relaxed/simple;
	bh=Hmw1lJtqV0z5faRyMSz7VQliHrWd+hlBXRedsAOCRvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hqsq0yug1oNjk3c8vlLWHfcaVf7Bf7+kmZUvWmIABiCKVXXLcrnrCoZB2e9XFTygDyuMKTqQbZi0vRMd6a0oE90a1JOGa6kZvnIncMba1RftvFHun52lO2X15Ly56fGZU1VHJXzeGZF+qHeVMNTTiBOc+NexfEOsHoTVkJS0CCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFHMvkvL; arc=none smtp.client-ip=198.175.65.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782746590; x=1814282590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hmw1lJtqV0z5faRyMSz7VQliHrWd+hlBXRedsAOCRvE=;
  b=oFHMvkvLubD1FixRaXWTxNW+YSH5zE2tqtScxHtGqTr1xbtWO34RE9rr
   LJYLzH/uBXKQXYCWwzlUmURilVH9VnRYPbVUCsGm1OG2satjww23AGo8E
   ZhSaCXbhNgxqmqpHm7brQbFn14gRrAtrAlkmAJsYsky2/Ns7CviFBKC1n
   et9SQGle5xLOPVujGQcMEMJ6d19Fqqlv7cLp1S3fJT/jl/i1pfeP5etpS
   TwKDxVZEEin4uRZJtpelcQJ38j9WFJy09aRWYnkBB9UMTQJLzGqjp3ROW
   abTSQjNVbxlRrl/w1rLIQR8sFRmOVlvvrQOFyQ4anRDTzwCuiokICxFkn
   w==;
X-CSE-ConnectionGUID: TONsXjJQR9u28wVyk5m6pw==
X-CSE-MsgGUID: HQgha/hRSVqEJkIjoM0/dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83469266"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="83469266"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:23:10 -0700
X-CSE-ConnectionGUID: rFSmfhwZSi+DllYgefUacg==
X-CSE-MsgGUID: tvIRMopLRzuj/M9fo1u/kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="247531687"
Received: from abityuts-desk.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.82])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:23:07 -0700
Date: Mon, 29 Jun 2026 17:22:57 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/15] media: i2c: os05b10: drop unused group-hold
 programming
Message-ID: <akKNsGUaG6xsjVAT@mdjait-mobl>
References: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
 <20260325114404.95188-3-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325114404.95188-3-tarang.raval@siliconsignals.io>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65986-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mehdi.djait@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tarang.raval@siliconsignals.io,m:sakari.ailus@linux.intel.com,m:himanshu.bhavani@siliconsignals.io,m:elgin.perumbilly@siliconsignals.io,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mehdi.djait@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linux.intel.com:from_mime,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:email,mdjait-mobl:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B8B496DCBA8

Hi Tarang,

On Wed, Mar 25, 2026 at 05:13:48PM +0530, Tarang Raval wrote:
> Register table included group-hold (0x3208) sequences for
> groups 6/7/8/9 that only stage alternative tuning values in SRAM but are
> never launched by the driver. Remove these group-hold blocks.
> 
> Also remove a duplicate register entry for 0x37bf.
> 

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>

--
Kind Regards
Mehdi Djait

