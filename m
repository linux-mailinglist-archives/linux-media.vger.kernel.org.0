Return-Path: <linux-media+bounces-65455-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G1eKA+9ROmoo6AcAu9opvQ
	(envelope-from <linux-media+bounces-65455-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 11:29:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4EE6B5CED
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 11:29:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=iRuZd1VK;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65455-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65455-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 63693302D5FF
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 09:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B6D3655E9;
	Tue, 23 Jun 2026 09:29:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8AD2C181;
	Tue, 23 Jun 2026 09:29:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782206953; cv=none; b=DyhnJDAw7S7Z6z1CSXQOzX8BYQGCpj5UW+78fkbwH9saEluruBhgOe7ByzqCA/OM6xTrDU155WNcEkzz2cR2r1mY5c+pF1EiKPPpatqdGTEfzaPdJ+EUS7ZvoGfxUhWSeugwx4vC0xHKEQ6BSVOYi/OX6rmKIiVQvtI2IzqNpro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782206953; c=relaxed/simple;
	bh=hhmxGY3v3Z1tWeR8/98foV1B0+A+e8DwxVI7NPDMlOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LaHdJKNfvyTjnNtRwW4kH8b9067a1TrRtaAa7yT4Kjq2gBAeTAXiJEcIvCU8ebG5Qf3ZvIbDmyQnWDRuCVf76gwB3zLZOiOSjzfj6iooSWMOst+TcHKwmUOs9f532qLARm6tKTInoR4RxRja4pzi6j03NPUeU/sJOcpLpWdrsww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iRuZd1VK; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782206950; x=1813742950;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hhmxGY3v3Z1tWeR8/98foV1B0+A+e8DwxVI7NPDMlOA=;
  b=iRuZd1VKR5fxzgw9dVIHQLd24GuBmMuiFDtk1kihqrbjVUPrMmrT7nOo
   +w1e9XNB/qLWLBdqb5ZvTaTtAo56SxeqqQda+Gr+uXA7FlE36NiGd02sZ
   RhfL7AOYFitW46Gl6SHQaL3DpAsuduLLZIG0CInPBViIMV2Kaf2hkPfH1
   oOB1V/8kYpeYQrO7NQbzvWvz9Szn1NofdCoKU0fHJoWoYpL9JoeFgVNYu
   hu2E6FKeAbTKHOx3zTDh8AaWlGPFHlorJH4eGbUfAj/yZeZLhfGZqBUHQ
   h+BKwd+71XYu6Bss6OCiHg+8ygdREVq/cf+TQz5QnpG58Bf8+OgGqkhCy
   g==;
X-CSE-ConnectionGUID: I6Z9Pd+oQ6yyKg840QXKzw==
X-CSE-MsgGUID: BHyj8DYrQBaJkEMNkyyYwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="85493789"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="85493789"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 02:29:09 -0700
X-CSE-ConnectionGUID: W65lbi0lRQKXjP3EICLWow==
X-CSE-MsgGUID: a9mld5UhQsWVhz4ypZFEtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="273528327"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.7])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 02:29:06 -0700
Date: Tue, 23 Jun 2026 12:29:04 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht, linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 0/3] staging: media: atomisp: use kvmalloc_objs() and
 drop redundant OOM messages
Message-ID: <ajpR4P9FtIg2Se8i@ashevche-desk.local>
References: <20260622224402.34001-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622224402.34001-1-rodrigo.gobbi.7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65455-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:dkim,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AA4EE6B5CED

On Mon, Jun 22, 2026 at 07:42:41PM -0300, Rodrigo Gobbi wrote:
> Several allocations in the atomisp driver still size their buffers with
> open-coded multiplication, e.g. width * height * sizeof(*p). When the
> dimensions are large the product can silently wrap, causing kvmalloc()
> to allocate an undersized buffer.
> 
> Convert the remaining sites to kvmalloc_objs() with array_size(), which
> saturate to SIZE_MAX on overflow so kvmalloc() returns NULL instead of
> allocating too few bytes.
> 
> This continues the work started in commit [2], and picks up the stalled
> sites from [1], unifying with [3].
> 
> While here, drop the redundant IA_CSS_ERROR("out of memory") messages on
> the touched allocation paths: the memory management core already emits a
> far more detailed warning on allocation failure as raised at [1].

> [1] https://lore.kernel.org/all/20260413112904.98864-1-feng@innora.ai/
> [2] https://github.com/torvalds/linux/commit/d178c7ca8fefc28115d35b94c3b1f4d653e34182
> [3] https://lore.kernel.org/all/20260609215110.118860-1-rodrigo.gobbi.7@gmail.com/
> ---
> Hi, all,
> Regarding a comment from Andy at [3]:

> > There is a ongoing effort like this for other files from atomisp
> > at [1], yet, it is not covering the same file.

> > [1] https://lore.kernel.org/all/20260413112904.98864-1-feng@innora.ai/
> 
> > Yeah, the problem is that the activity seems stale. Can you pickup all
> > the patches from the mailing list that have not been yet applied (regarding
> > k*alloc() uses) and combine them into series or so and update regarding to
> > Sakari's comments?
> The only patches that I found from stale threads were added in this series,
> hope that is fine now.

You need to preserve the original authors.
Also see individual comments.

-- 
With Best Regards,
Andy Shevchenko



