Return-Path: <linux-media+bounces-64912-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XHFaM3kDMGofLwUAu9opvQ
	(envelope-from <linux-media+bounces-64912-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 15:51:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 266D7686DE0
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 15:51:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=RiLZPPNF;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64912-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64912-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CFAC30599F8
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 13:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 475AC3F4DCC;
	Mon, 15 Jun 2026 13:51:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E44D2E7BB6;
	Mon, 15 Jun 2026 13:51:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781531501; cv=none; b=hzgnzzEtuigon8KA+pMOJooRx+DmTXDdrZnY/0boy1VGQEu3uPtniSq8tt/oSQe3zh9NTmpdkuzEYvsCOPKZoCaqnFmfx0MAJRKWh3auC5ZJVtuUrjGaKERq0i/AuJTLXL0b2Fda6ppGbwrSmW5DGqcJUvnXAzsQSkDsh1jj+Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781531501; c=relaxed/simple;
	bh=NKdIejRqD7O9YL3VpvIPAzjNzj9Oq85oYsq2qct6wBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D/5llcu4B06u8c+AMQ130oRyqnF9bx093A0E2byJ1KXFCzUOJlytBgT4KV/iHhTn2h/jOH/uWp5Fgo1JPv/tsrvw03EzgxLzowAcrTA6ROlCeEFZHECa53ivkd+mD9L5jE/t1sEobSxb8ca+saA7P6kV8nTuFIBPA3/gMt74ekM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RiLZPPNF; arc=none smtp.client-ip=192.198.163.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781531500; x=1813067500;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NKdIejRqD7O9YL3VpvIPAzjNzj9Oq85oYsq2qct6wBI=;
  b=RiLZPPNFuLP09Pw9lqfzpU7tpowS9y16RJSkBMJFv9gDz5ftKDSxJomT
   2eaYu3k10ALxhwzkhQFE5/ViUCjVqJx0Haev6sSe7aO1V8mafwiqn9uwf
   g7gMZKekK5NP+MNTuXfWKg0zAeytAyIE+AFZKY2H6LMqactLbRWJPQX9q
   pnP/NFFiL8FSCIuE+8jsHIkjRfWaXGblvCUg2OgJf0bBVY2xhRVfKUCVa
   Ih1tfjSYQo+8APB3Pp2tm+GG5xFwdVZZ4QYUjlb+P6dcnuKCiI8V7BAMD
   +P0KF/JmtmGYUvkACjsik5f2maSuNT3Do2zmBSliFP2PBDYcdoD8wo1+L
   A==;
X-CSE-ConnectionGUID: qCiG338BTpCQM1nct99zOw==
X-CSE-MsgGUID: JpEfB6sKR6OdU7pkxpIVKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82117880"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="82117880"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 06:51:40 -0700
X-CSE-ConnectionGUID: 716bzmjzQdO0Gl1ucZ4RQg==
X-CSE-MsgGUID: Y3YAacW0RlGHMqAEjlJ2QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="251754307"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 06:51:35 -0700
Date: Mon, 15 Jun 2026 16:51:33 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dawei Feng <dawei.feng@seu.edu.cn>
Cc: abdelrahmanfekry375@gmail.com, error27@gmail.com, andy@kernel.org,
	corbet@lwn.net, gregkh@linuxfoundation.org, hansg@kernel.org,
	jianhao.xu@seu.edu.cn, keescook@chromium.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, zilin@seu.edu.cn
Subject: Re: [PATCH v2 1/2] media: atomisp: fix memory leak in
 atomisp_pci_probe()
Message-ID: <ajADZZqqsFcgAPhy@ashevche-desk.local>
References: <ai_kfgkuDYcFd0bG@stanley.mountain>
 <20260615123515.3289855-1-dawei.feng@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615123515.3289855-1-dawei.feng@seu.edu.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64912-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dawei.feng@seu.edu.cn,m:abdelrahmanfekry375@gmail.com,m:error27@gmail.com,m:andy@kernel.org,m:corbet@lwn.net,m:gregkh@linuxfoundation.org,m:hansg@kernel.org,m:jianhao.xu@seu.edu.cn,m:keescook@chromium.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:zilin@seu.edu.cn,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lwn.net,linuxfoundation.org,seu.edu.cn,chromium.org,vger.kernel.org,lists.linux.dev,linux.intel.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:from_mime,vger.kernel.org:from_smtp,seu.edu.cn:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 266D7686DE0

On Mon, Jun 15, 2026 at 08:35:15PM +0800, Dawei Feng wrote:
> On Mon, Jun 15, 2026 at 02:11:12PM +0300, Andy Shevchenko wrote:
> >> Fixes: 9d4fa1a16b28 ("media: atomisp: cleanup directory hierarchy")
> >> Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
> >> Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>
> >
> >This SoB chain is wrong. Who is Zilin and why is he here?
> 
> Zilin is the discoverer of this bug. We are in the same research group,
> and he actively participated in reviewing this patch. 

> To better align with the kernel submission guidelines, I will add a
> "Co-developed-by:" tag in the v3 patch for Zilin to properly reflect his
> contributions. Would this be acceptable?

But did he _develop_ any parts of this patch? Otherwise Reported-by is more
suitable.

> >These last two paragraphs do not suit the commit message. Please, drop them
> >here and better to describe all this in the cover letter (if not yet).
> 
> As Dan mentioned, I included those paragraphs following the exapmle in
> researcher-guidelines[1].

Yes, and I still insist to move them to the cover letter. In any case those are
not present in the second patch anyway, moving that to cover letter covers the
entire series (and I believe you tested the entire series, didn't you?).

> [1] https://docs.kernel.org/process/researcher-guidelines.html

-- 
With Best Regards,
Andy Shevchenko



