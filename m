Return-Path: <linux-media+bounces-55891-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oE1gEfPnt2mzWwEAu9opvQ
	(envelope-from <linux-media+bounces-55891-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 12:22:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E06D2989A3
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 12:22:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2C10300F9D2
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 11:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE9D128B7DB;
	Mon, 16 Mar 2026 11:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jDhDZWpe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E0A28D8DF;
	Mon, 16 Mar 2026 11:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773659942; cv=none; b=GaveVvarCCDPM5bOOpbq8bJU36IYmec5UjTHWl8qpoY/W1rsU0IBBuX2TWEd45/9OeiyTXyw2AnRCWNMVCn9sY7G/+GO7HlZgBmamNqn8CAsNy6SOntHmlPMkl16lUOHMqBgYeKiMA1XEZauEn7NiFkuTnuokrbnLSl/z7fJR5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773659942; c=relaxed/simple;
	bh=pE6aBW5PWZbbitw0U2AKJCHXuOjvSiDQXNqow5+gO8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nRfgNi/3rr1PkbixYwQ0PLFer/W9ZqoPl1HuMKgQLlkyRqAjT1I0L1cHXdnxGc4sscCNZG+6XXLi6/NrbhvTSHKWg0iwO+tBe9C/aFNRJtATit9nYYHsQhR3oEmAUIGyaSgVjOzqfagNxoXj44M8ZbZhcyWHo4LIUmuvTdjK8s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jDhDZWpe; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773659940; x=1805195940;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pE6aBW5PWZbbitw0U2AKJCHXuOjvSiDQXNqow5+gO8M=;
  b=jDhDZWpehz1EPWyJQuRs43VyaB59Shp4QeJkqBm9nLY4R6blKTPDVBBE
   juHH072iGksaJ43FK0rQyN0lYtOeO2JIhbgcOROdt2n+TKw0e0ot3PoAB
   8jrIHye09rnK892M9VJL/hwSrrM3yoSqm7WKPuZMALxnRtHTUiCNhL3Xh
   aWdj+eGhhNMNOO21iaa20hV6oUMambFow7L6KB1lG6VUXUQKlkm9FA4bT
   /ypZW6KjbHNkvfLytbfkwk+DNPobPh8UECo6rZH7HjhKhoDPfz0NNeEmf
   j2nEl91iT7Q55zfqpQRaItMCIXPUE4/t2Rq5Dlf0SM3h8PEQUrTYXi1Ku
   w==;
X-CSE-ConnectionGUID: QJV+0qGTTO20Pn9qmyJimA==
X-CSE-MsgGUID: kF8e0KEGSA+aLLKbDrV+fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74859255"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74859255"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 04:18:59 -0700
X-CSE-ConnectionGUID: E2MwWpkJQNOfO5ddsF+RhA==
X-CSE-MsgGUID: UgCg/HY5TB6FwcRY/0Q7Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226559096"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.237])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 04:18:55 -0700
Date: Mon, 16 Mar 2026 13:18:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Subject: Re: [PATCH v2 1/6] media: vidtv: Rename PI definition to PI_SAMPLES
Message-ID: <abfnHSoZcKJUPAzd@ashevche-desk.local>
References: <20251107201005.3156118-1-andriy.shevchenko@linux.intel.com>
 <20251107201005.3156118-2-andriy.shevchenko@linux.intel.com>
 <8fcc1419-266c-429e-b1bf-1799322eb69e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fcc1419-266c-429e-b1bf-1799322eb69e@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,kernel.org,baylibre.com,analog.com,chromium.org,metafoo.de,gmail.com];
	TAGGED_FROM(0.00)[bounces-55891-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 9E06D2989A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 11:13:24AM +0100, Hans Verkuil wrote:
> 
> Just FYI: I'll take this patch. Regardless of the other patches in this series it does
> make sense.

Thank you!

> I haven't seen any updates to this series, is it abandoned?

There is no consensus which names should be chosen. I have strong opinion about
my choice, some do not agree with. Id est I like the idea to have PI as PI and
not something longer and confusing. Same for 64-bit, just some short.

My rationale is that, in most of the cases the 32-bit value will be used and
having it as is would be nice.

Another point is to have a macro that gives PI rounded to the chosen amount of
digits (to avoid / 10 / 100 / et cetera in the users). I don't know how to
implement that nicely, there is no loops or alike in C preprocessor.

-- 
With Best Regards,
Andy Shevchenko



