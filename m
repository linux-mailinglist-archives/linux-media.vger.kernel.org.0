Return-Path: <linux-media+bounces-65193-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zkNDEkzqM2plIQYAu9opvQ
	(envelope-from <linux-media+bounces-65193-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 14:53:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDAC6A0356
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 14:53:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=bcxh8mg9;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65193-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65193-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A2ED230193A2
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 12:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 271F13F4DC3;
	Thu, 18 Jun 2026 12:53:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93BB39AD3A;
	Thu, 18 Jun 2026 12:53:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787208; cv=none; b=dPZBMN9Zzm6SU1ax9abVUV1PBDETEeXkiIkayM0b97Rf2WA24cTQm2AOyXS9lAph6XBCNV7DDvw4mpjeTTjJsDCAzqxsq7fhkDXC14dPEQtEhJXD5GsHv65+R+MZyt23txS4nMnggaMUp9ygMb3diLRcUhrLCf9500Y64xhXV9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787208; c=relaxed/simple;
	bh=aypHnN9reC8L8eyUnvgwOvzHn+KPVFzjiikVKD3mP1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n6monlvIrKn93aSypklVaGOrIIAv+nIt5hUfl+PVN55CSKNEDFNZDNPaQ0+8o8c6VAGYYSztRhIAJYeBLTiBjcVNui3PcZz10UQz4PLBMnFGt6gW6qJHjRNIVqNmaQRPYg73wWMB8pAO4nLO4NkA6OLPYHrnUleCHYrPwaVxJOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bcxh8mg9; arc=none smtp.client-ip=198.175.65.20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781787207; x=1813323207;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aypHnN9reC8L8eyUnvgwOvzHn+KPVFzjiikVKD3mP1E=;
  b=bcxh8mg9h8OsEyCdADWtL5ZubdN70cFE4ulNxGf+x0ZI09dZiKKLrHVv
   JgiCW07v+9qxxHsGT26OjUmeW8OAhEOm4R9t75umBuZNz3LetQXLuVV8c
   pk4dbb8DwMwW/DaY6c2yetCrWQsS/6gElQCZxpZYsH4D9CrB+1zMv5c70
   QeUDrlLTP2T2y+vB+X2MbPi6YHZR0i1Ml+xO8qakehAX6XP8ZsKJ2voEF
   pFMiyi2ds5e5VxV0P0hBWYVAGgNIjlfHknpkJdUvguK/HUrmnpCJMWzGo
   hPAKcrDOkdApW/qXIuPlZoerW4u3S3WOaHxaJTzjrFL+2EKq58tB9pP+K
   w==;
X-CSE-ConnectionGUID: Mio5y54/RBeyzkK8X1EqAA==
X-CSE-MsgGUID: 9Moqp5saS7yVVAH36Mw+Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82387879"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="82387879"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 05:53:27 -0700
X-CSE-ConnectionGUID: OB+f9B2nTt6093pbAheJ1g==
X-CSE-MsgGUID: XBiHXvFKSLqx/bFtKjORaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="247211081"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.10])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 05:53:24 -0700
Date: Thu, 18 Jun 2026 15:53:21 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Igor Putko <igorpetindev@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	andy@kernel.org, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: prefer __aligned over
 __attribute__((aligned))
Message-ID: <ajPqQSudT9mS1e53@ashevche-desk.local>
References: <20260618120951.42956-1-igorpetindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618120951.42956-1-igorpetindev@gmail.com>
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
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:igorpetindev@gmail.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:andy@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65193-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0DDAC6A0356

On Thu, Jun 18, 2026 at 03:09:51PM +0300, Igor Putko wrote:
> Replace the GCC-specific __attribute__((aligned(a))) with the standard
> __aligned(a) macro to match the kernel coding style.
> 
> The checkpatch.pl error about complex macro values is a false positive
> here, as enclosing the macro expansion in parentheses breaks declaration
> syntax.

...

> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h
> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h

>  #define UINT32_MAX UINT_MAX
>  #define UCHAR_MAX  (255)
>  
> -#define CSS_ALIGN(d, a) d __attribute__((aligned(a)))
> +#define CSS_ALIGN(d, a) d __aligned(a)

Ah, nice finding! But this header should be killed. It means that rather
kill the macro altogether and replace all occurrences with the proper
attribute (see the history of math_support.h as an example).

-- 
With Best Regards,
Andy Shevchenko



