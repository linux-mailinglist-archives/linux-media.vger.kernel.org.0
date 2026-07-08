Return-Path: <linux-media+bounces-67067-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SIudB8inTmoVRgIAu9opvQ
	(envelope-from <linux-media+bounces-67067-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 21:40:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F15729E9A
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 21:40:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=T8AX9xlz;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67067-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67067-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4CF81300CDAB
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 19:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9090A3E00A9;
	Wed,  8 Jul 2026 19:40:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93A53DCDB5;
	Wed,  8 Jul 2026 19:40:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783539647; cv=none; b=IjiY0pAX3OOHZ9RC2DjMP/q2WNP6IsjziNujXUc2pPcQIT5rywPl5vagOhohGHp3gO6McVzkAqJ7Gb7k9uZrg3gHPKh8sGFbn/ERLySJDbTBuwv4eiUz79mtuB7aK6k1apqL7Zb4OXJv/xO+B2ErCOdtIHldfpA/GdrwHQ/LZnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783539647; c=relaxed/simple;
	bh=5iLgoM6FdWeIjsguhTuPqlmikv7HeX2dzDKaGkjhz5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FKOFf9UDJZ5XF8U+FuDc973ciQJyE5zRb9CHbJNw4h3cuGhO2IGPRgOjbC21fglEAGNlyuNq1oxfDbFTyqRoXyyBZkCCNMJDMfbL1B+fWgELiHArZCDbO2BhdzbC+b3N0BEDucUEEfCWg0w+qHxd4RbEQM/liK0biR2o/L8vEQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T8AX9xlz; arc=none smtp.client-ip=192.198.163.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783539644; x=1815075644;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5iLgoM6FdWeIjsguhTuPqlmikv7HeX2dzDKaGkjhz5g=;
  b=T8AX9xlz0qwEB7qfgDE83LZLPYasTVswYcAT4LUeWURyn9zSpF4kj16t
   /9D3AN0HsCM/8xDBk2AY27mitp/Xl0zGe612bFn27ML+vn3l8MjFqSjgj
   I5qKSnP5aDgirgRq2Uf1StrXQA754fseydalIpVXzRA7sDL8GucYcZ4Vt
   KFeLwetEZ+z3QrFkQ+Qrkqij9IzZnwip22v9DW/E/IJr1nQ9w8Y9zIXWk
   Tey6pxiNoJq8qhgEyF8dQHUzXCef2+L7YgR8Cmg4SvHWxG3234HlCCjYI
   izOHDdGYJQi53pLGMTwvOSUHrWdzQyaZKovx+h/LFq0jhXdak545p3jxC
   Q==;
X-CSE-ConnectionGUID: ZH6DH64iT1Wn6L8ZiUo/bg==
X-CSE-MsgGUID: +qFNak3DQN2lGbYo5fyAkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83329358"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="83329358"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 12:40:38 -0700
X-CSE-ConnectionGUID: PQs3/ecVT320T0unyIWRVg==
X-CSE-MsgGUID: JSKCW9JaTrW1nzg5lJBBig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="251724976"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.100])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 12:40:36 -0700
Date: Wed, 8 Jul 2026 22:40:34 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: sakari.ailus@linux.intel.com, mchehab@kernel.org,
	dongchun.zhu@mediatek.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v4] media: i2c: ov02a10: fix endpoint parsing
 use-after-free
Message-ID: <ak6nsu5EQ2juLQdJ@ashevche-desk.local>
References: <20260613083235.57363-1-birenpandya@gmail.com>
 <20260708181248.57758-2-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708181248.57758-2-birenpandya@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:birenpandya@gmail.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:dongchun.zhu@mediatek.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:vladimir.zapolskiy@linaro.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-67067-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D4F15729E9A

On Wed, Jul 08, 2026 at 11:42:48PM +0530, Biren Pandya wrote:
> The ov02a10_check_hwcfg() function calls fwnode_handle_put(ep)
> immediately after allocating and parsing the endpoint. However, it
> subsequently calls fwnode_property_read_u32() using the same 'ep'
> handle, leading to a potential use-after-free.
> 
> Additionally, reading the optional 'ovti,mipi-clock-voltage' property
> used to overwrite the 'ret' variable. If the property was missing,
> 'ret' would become negative, and this failure code would be incorrectly
> returned at the end of the function, causing probe to fail entirely.
> 
> Fix the use-after-free by moving fwnode_property_read_u32() before
> the endpoint is parsed and freed. Avoid the error leak by not
> assigning the result of fwnode_property_read_u32() to 'ret'.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> Changes in v4:
> - Collapsed fwnode_property_read_u32() into a single line per Vladimir's review.

Wasn't me?

-- 
With Best Regards,
Andy Shevchenko



