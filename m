Return-Path: <linux-media+bounces-64530-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yQTJLt1JKmoNmAMAu9opvQ
	(envelope-from <linux-media+bounces-64530-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 07:38:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3826366EB36
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 07:38:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="NdA/ps2a";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64530-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64530-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C99913026CAE
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 05:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9292026CE2D;
	Thu, 11 Jun 2026 05:35:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54E53594A;
	Thu, 11 Jun 2026 05:35:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781156104; cv=none; b=bW0maMEKDIdZNYmLptPSSzAi5jJddGiEh0kbc+5DN8xdVo5GB5agsq8XMnP2L/65VpZZcvpz2v2B9U5sIppOEsGNUMp/3IY0ZiU7OaU5oO31o1DpZzmISjmyY0Alw61nLL17Z9M2bfFs3hPn9B883G2h6afbsdMzXmD1zWoXIJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781156104; c=relaxed/simple;
	bh=enLo2LxBXG7SCp0mi4x5Y9nFoxfVVaRZ6ltmEJZMwqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N3yEUzfBTE/jrhLKy9JA5CbCGdC9TEyKDdUxNPgQA4eLCv5GfJGrCfVK5JbpkgQXysfevqBniPqHvzG9vOQwdYil+BVbZ2hnEXD+SNRTTgJNgcw/rp6gGyEhU8biLQrglSaJxJHYJlFW5GgTLEySm/qdpRb7K8OCJ4RJxDf+G0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NdA/ps2a; arc=none smtp.client-ip=198.175.65.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781156103; x=1812692103;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=enLo2LxBXG7SCp0mi4x5Y9nFoxfVVaRZ6ltmEJZMwqg=;
  b=NdA/ps2ani7MzKaPmsPmUkGet6gphDFyTCFq0/78ygqYyOePLjxbaFEq
   +7NhFnAV5Ks4SLhqaaJpzva+8vBwkvaBc6rn/49nGFG1ZxzKO8ts8d5Nv
   Cpd+9BJtJAI3S8zDbwS6PZSz0UDcXhsI77ueSz1k07djdfEp/cCZfPSQa
   3lAPSgGdxCBbM3NlLJYDPcWTvn5whhEDnvCTewL9AANhcOA1bYExZxqOj
   OJSRwgKwzjDrbN/knNm78TEmEK0DB2AAv9CjMmtmSUjH+PeK2umF/IZCf
   yfd5wZlZZTSzXknP2Rwyq6r/Xk2zCncRtYI9Si9D4QnMuX9gmtgxhuP+6
   A==;
X-CSE-ConnectionGUID: 7IDxd4oHRLqWniqVSTeBjw==
X-CSE-MsgGUID: 2FEqVQMvToCu2rvA/eHSUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="99385824"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="99385824"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 22:35:02 -0700
X-CSE-ConnectionGUID: cZaITnTdSfGt3wujyN8Bng==
X-CSE-MsgGUID: 4DkVQr/ZTtKPtgM7ywc3Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="242232880"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.123])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 22:35:00 -0700
Date: Thu, 11 Jun 2026 08:34:57 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mert Seftali <mertsftl@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: gmin: Use str_on_off() helper
Message-ID: <aipI6J4kDWESZgtA@ashevche-desk.local>
References: <20260610182348.217892-1-mertsftl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610182348.217892-1-mertsftl@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mertsftl@gmail.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-64530-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:email,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3826366EB36

On Wed, Jun 10, 2026 at 08:23:48PM +0200, Mert Seftali wrote:
> Replace the open-coded "on" : "off" ternary with the standard
> str_on_off() helper from <linux/string_choices.h>. This improves
> readability and reuses the kernel's existing string helper instead of
> duplicating the literals.
> 
> No functional change intended.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
but see a couple of nit-picks below.

...

>  #include <linux/gpio/consumer.h>
>  #include <linux/gpio.h>
>  #include <linux/platform_device.h>
> +#include <linux/string_choices.h>

While at it, perhaps add a blank line here.

>  #include "../../include/linux/atomisp_platform.h"
>  #include "../../include/linux/atomisp_gmin_platform.h"

...

>  	dev_dbg(subdev->dev, "Setting power state to %s\n",
> -		on ? "on" : "off");
> +		str_on_off(on));

Now this goes to be perfectly one line.

-- 
With Best Regards,
Andy Shevchenko



