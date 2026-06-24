Return-Path: <linux-media+bounces-65544-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TajAGIrHO2oCdAgAu9opvQ
	(envelope-from <linux-media+bounces-65544-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:03:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF51D6BDF09
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:03:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=YcWzrDJX;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65544-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65544-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 31F5B301EB44
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 12:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAAAE347532;
	Wed, 24 Jun 2026 12:03:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C619E22CBE6;
	Wed, 24 Jun 2026 12:03:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782302592; cv=none; b=mH0fzmXF4rF5sFJK0Sn7KScoq1rljChKL5Bz6hCq9/2vRydy1Pw8czMyHucQrhfg3U9ITtR+daFV72tg8HW1yL3hn7lyACvtXmTFmz3Xclw0a5XXFBP+fwssHi+ZNvQSTy8izljrp4NQz1JyuFKrAzIj21H/IKonijDglPni4rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782302592; c=relaxed/simple;
	bh=kh3YKvl+EUhdUT9ihySVJ1L30D+FhW/GdlHQryGZeBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s19Zuj18gFGiz4wE0mtqNe8c9LOp1pld2fr9reQMxgCfdzUbj/z2/NeYqSCvia662ywM0HHjl4lf+U1VLxozjfJ3auibHVBIM3K1aVYMKvuW+OsC1b51y0cKXpvBJ7o5L1emCpKwsE7giRNJMBf8pwSgclLW9amcKB0Kqr3NIAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YcWzrDJX; arc=none smtp.client-ip=198.175.65.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782302591; x=1813838591;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kh3YKvl+EUhdUT9ihySVJ1L30D+FhW/GdlHQryGZeBo=;
  b=YcWzrDJXqMiBos6FzKyQ8SpoM+n9rmjTl8HnsOe6lNgiz8Xd1+z5yf7d
   oUEUNmbcz+u+oEXsubNqXYeuSx3aLonxVvrM9qgeyFr9JcZ90A5FkxSPV
   Von2JoNl+L6w4Qxt0vFNXvPii1/+sph/qR0uDy5hIj5Y8tN35LJaiVx0a
   gRnc4hD9ObAjHgY/OhUHsLpZ1Swp2WgaIVg7PKdAiMuDWLTZUTASXRW7Y
   urbLBN4tUQioMPftcvs1qub96AJgktAYU70dnUa8xfz9VfxQGkiIkZ3KQ
   2WTPccvqNu3m7GZcS5mo3XlFZxDUc5jTbH/MCAPIUD+IxeRE83iTQwVL9
   Q==;
X-CSE-ConnectionGUID: Ym4NvyqtSwicbGKI5qQJHg==
X-CSE-MsgGUID: sANooL7KT4O+CKJUtO6lzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83064842"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="83064842"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 05:03:11 -0700
X-CSE-ConnectionGUID: 2bhGsjy3SUmTy/qiz+OPiw==
X-CSE-MsgGUID: zn+zNlnqThSMRW8HyMutnw==
X-ExtLoop1: 1
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.156])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 05:03:08 -0700
Date: Wed, 24 Jun 2026 15:03:06 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Igor Putko <igorpetindev@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] staging: media: atomisp: drop unused
 platform_support.h inclusions
Message-ID: <ajvHetrbCwo18_WU@ashevche-desk.local>
References: <20260618120951.42956-1-igorpetindev@gmail.com>
 <20260618151246.6678-1-igorpetindev@gmail.com>
 <20260618151246.6678-3-igorpetindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618151246.6678-3-igorpetindev@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:igorpetindev@gmail.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@intel.com,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65544-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:dkim,intel.com:email,intel.com:from_mime,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF51D6BDF09

On Thu, Jun 18, 2026 at 06:12:45PM +0300, Igor Putko wrote:
> Drop the unused inclusions of the platform_support.h header file across
> the driver. The header has become obsolete after replacing the custom
> CSS_ALIGN() macro with standard kernel attributes.

But in the above list there are no users even with the platform_support.h in
place, right? I mean that this patch can be, for example, applied first
without any regression. Correct? If so, make it the first in the series, it
helps a lot to understand the changes in the (currently) first patch.

> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Igor Putko <igorpetindev@gmail.com>
> ---

Code wise looks very good to me, thanks!

-- 
With Best Regards,
Andy Shevchenko



