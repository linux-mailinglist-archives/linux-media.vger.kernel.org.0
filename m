Return-Path: <linux-media+bounces-65545-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GQ8vHAHIO2opdAgAu9opvQ
	(envelope-from <linux-media+bounces-65545-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:05:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E69516BDF74
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:05:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=W3G5oLDr;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65545-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65545-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6DE7F3011A5D
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 12:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E08C921ABD7;
	Wed, 24 Jun 2026 12:05:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCC93074B1;
	Wed, 24 Jun 2026 12:05:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782302715; cv=none; b=dR5fq5T9cOtbhrwuL6DiD2RW5GNoCeuLASOzy0QJVPbLw/DFNbD1h29ClfAO0pgopJ6RZdRilF4HLojeZ4XbL8i0g/7Vh2g2N8elc0V2ElU0MDlIKkudsYumm1V9rGTGmRwuUw11NW5nCrKa0z2aVWXC8YSl+fjLiNEo7jIPYAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782302715; c=relaxed/simple;
	bh=oi5lLnnIEO6XUNJojvUhkK9Z723NggAS9ES44szxH/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z62rLrGcC3vM4IexAA49tE12faMtKu5IdeVpI/xWNV6YQ/kvC5I4SkEYxIUT/aVvypM704EOMHZXMyg4Bf5Y5n5ccFvY21J+iKHxMu5qHJppP3DpAXOTv4NItTyd1Oyyd+Ec6QcxhuEugaKCU/HVusnTV0Ne9S98Uc3z2Yl59dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W3G5oLDr; arc=none smtp.client-ip=198.175.65.15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782302713; x=1813838713;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oi5lLnnIEO6XUNJojvUhkK9Z723NggAS9ES44szxH/k=;
  b=W3G5oLDrL5jl4tqntT6RkoCC0d6pW2x6dOjH2XDbII2VzayFuGy6FRv3
   kg5W6DNvGJxhH7ut41LZkXwp9+OQoxgxy0cQNgyLhoWzxWcF/oEtmbWyP
   qiBW9U+ZsJREx/heaVfCRYdSEqjc6kP3isGF1Qm1YmAC2fs1RWt3fI4sT
   mU0tAwChmyjLfLc4y94RaSH8bZBiwHwBQY8yINhLLBuKgh7b1kHl16P4b
   WiDwNIOcnEPqVkGmnqK++Hn63Q+FnrjzFWii51kIg31fHI/Vry6fOD1DS
   RvH87GZ81MNZwnZb+TK3d1B7ZPxAm/20RL26J3e1bXosZlgViaUyxISRJ
   A==;
X-CSE-ConnectionGUID: FUPshrIMR8KYGRme8AEylg==
X-CSE-MsgGUID: WFR74TSLR9uwhFGsodjaBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="86742962"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="86742962"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 05:05:13 -0700
X-CSE-ConnectionGUID: 6HS8kThQRQmb5SoOSwPwJg==
X-CSE-MsgGUID: yeQaKMvtSSC+p1iiOcsl+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="245719506"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.156])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 05:05:10 -0700
Date: Wed, 24 Jun 2026 15:05:08 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Igor Putko <igorpetindev@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] staging: media: atomisp: remove dead
 platform_support.h header file
Message-ID: <ajvH9Dcdi1DpFwO0@ashevche-desk.local>
References: <20260618120951.42956-1-igorpetindev@gmail.com>
 <20260618151246.6678-1-igorpetindev@gmail.com>
 <20260618151246.6678-4-igorpetindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618151246.6678-4-igorpetindev@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
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
	TAGGED_FROM(0.00)[bounces-65545-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:from_mime,ashevche-desk.local:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E69516BDF74

On Thu, Jun 18, 2026 at 06:12:46PM +0300, Igor Putko wrote:
> Remove the platform_support.h header file completely as it is no longer
> used anywhere in the driver and its contents are obsolete.

Right.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

...

> -#define CSS_ALIGN(d, a) d __attribute__((aligned(a)))

...assuming this macro will be still alive in the only one header.

-- 
With Best Regards,
Andy Shevchenko



