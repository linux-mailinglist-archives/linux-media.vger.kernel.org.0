Return-Path: <linux-media+bounces-65460-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CJliCj1fOmqU7QcAu9opvQ
	(envelope-from <linux-media+bounces-65460-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 12:26:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 829AD6B6426
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 12:26:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=S+oZS+CS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65460-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65460-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E3D0305504E
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 10:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D87378D93;
	Tue, 23 Jun 2026 10:23:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A629376BC1;
	Tue, 23 Jun 2026 10:23:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782210184; cv=none; b=TJ8Z34jg9KivSq/5x6ZqaWWxmVorcccO4Mn9k3ZuNqKJvy29WFYRrxiYUvKXRZO04Z2NyCl2M4+zO1v9/6t9nSuXjsYi6JDipZl+vC8KGx9sLeD4bGP9CzVheMh1TB4v/UOVTbDO34ick9Jv07RAFSinBEgZT+yZrz8stRQTkfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782210184; c=relaxed/simple;
	bh=VcLFiuENyyd3m/b4a3E+So1QsoqXa7Lc8NGW4N5fCW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tz06Lo7lU1q5RfWsGSpMujaIGLKJqaUHtjvfEsCayEZbYYH+7QhoVOVLdH24idAb96DQQrHFBzIDOMUGGreTJb6yCORQzPyXuotNIFEFg1Y4y5hKI/fBvoD+wapsmxv0K6ELZVaGwbHgbfAPvpMwJbqoYUKgxluiBEl6LtZGRmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+oZS+CS; arc=none smtp.client-ip=198.175.65.14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782210183; x=1813746183;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VcLFiuENyyd3m/b4a3E+So1QsoqXa7Lc8NGW4N5fCW4=;
  b=S+oZS+CSAhU6Y98vuVz1BVBIsWiz9wkV6SCn1ak0OHayEkp+/THtt1ti
   DHBjyQKhvUl6grcwjWec41Fw9Hl4DWrcK2E/YlPYsPS3yi/KvTfGylb79
   MesUep+ksYzdKDluHtD4RXgCGxxXCYf8CUxUXzytngQ27TfCC99Jcop4C
   EspA9ulq+mCBGanJYaHn514G6InDWFHYrvmf1uIK92bDgZCr3wXXb62P2
   HgqGdPqUHaRX2RMpcsxc0O2h40C4fGLPOw01SjjfOvE/tY8NbnSBKuIy4
   vrH1bgWBMyuNeYzem4yIpjjhZqnbEhYqplE+fgZCnBOqoMCsusrLCz08A
   w==;
X-CSE-ConnectionGUID: 86SZxW1/QXGCJIbzu5F5lQ==
X-CSE-MsgGUID: O8Z9/YAtTFGkmgfGI6/lRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="86856117"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="86856117"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 03:23:02 -0700
X-CSE-ConnectionGUID: EuFLw/PpT8mMtaz73qmLHA==
X-CSE-MsgGUID: 8j8e1yFVTDSG/5DLJv65KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="279659047"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.7])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 03:23:00 -0700
Date: Tue, 23 Jun 2026 13:22:57 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht, linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 2/3] staging: media: atomisp: use kvmalloc_objs() for
 overflow-safe allocation
Message-ID: <ajpegTS1vfclimCQ@ashevche-desk.local>
References: <20260622224402.34001-1-rodrigo.gobbi.7@gmail.com>
 <20260622224402.34001-3-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622224402.34001-3-rodrigo.gobbi.7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65460-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rodrigo.gobbi.7@gmail.com,m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:~lkcamp/patches@lists.sr.ht,m:linux-kernel-mentees@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:rodrigogobbi7@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 829AD6B6426

On Mon, Jun 22, 2026 at 07:42:43PM -0300, Rodrigo Gobbi wrote:
> Several allocations in sh_css_params.c still size their buffers with
> open-coded multiplication (e.g. width * height * sizeof(*p)), which can
> silently overflow and under-allocate.
> 
> Convert them to kvmalloc_objs() with array_size(), which saturate to
> SIZE_MAX on overflow so kvmalloc() returns NULL instead of allocating
> too few bytes.

...

> +	me->hor_coefs = kvmalloc_objs(*me->hor_coefs,
> +				      array_size(grid->num_hor_coefs,
> +						 IA_CSS_DVS_NUM_COEF_TYPES));

Here and elsewhere with long line, do like you have done in one case
with a temporary variable cnt. It makes same number of lines of code,
but readability is better.

>  	if (!me->hor_coefs)
>  		goto err;

-- 
With Best Regards,
Andy Shevchenko



