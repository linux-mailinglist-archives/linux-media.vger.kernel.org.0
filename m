Return-Path: <linux-media+bounces-64911-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LMk6DvsCMGoLLwUAu9opvQ
	(envelope-from <linux-media+bounces-64911-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 15:49:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE34686DD3
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 15:49:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=DbpRiaFd;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64911-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64911-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F36C3059039
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 13:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 201CA3F44FC;
	Mon, 15 Jun 2026 13:49:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7F13128AB;
	Mon, 15 Jun 2026 13:49:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781531375; cv=none; b=b8Z9HzlNx/c2QFeJMMY8rPljlI8jL9UsHNe9jvLwUh7S5upVS6C4bgaCbMvs0qnes9TPJRrkgECQvge+dUEZL+Ep1DdQsQNnFDhxlRhH8zmz5iJVQQQGf+Gcb/4oXWMXPnixwlnnQx35TRmJQrKBZ0VZFGW42nfkaiFCx6m4Fak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781531375; c=relaxed/simple;
	bh=k++5s6H7LP2FFKO/y3x5gTxmu8AjlTXP5feboQ5QR34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K1LTrFtIQpjaZDAevGmz+LI1cujZrz6Tu2rCHhIcV860ZN1LxMwv6PiVs/hVQwIvS7G36GgW7gs8IXyu2owaDGuzwIZoZyGg/XmoQSCCS4bM8GMbSgv49ENRl8tqEPhNKxYjecwgZ8eTNyXFIxRSig4hpILESWLsRBB14we7F+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DbpRiaFd; arc=none smtp.client-ip=198.175.65.20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781531375; x=1813067375;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k++5s6H7LP2FFKO/y3x5gTxmu8AjlTXP5feboQ5QR34=;
  b=DbpRiaFdKrrvMovLdO3T7J60MlAjYD7CVJ/oIDV/AUtJrMU9YbR/sJii
   ckXfvyIG8ix0S4vE8iDT2R7B5QmskPHDz1tybH1K54UCSJQXgPNZd4SI9
   3pl55USSFSdK4HyJe/vmh33eeywVy3Si3u30qlBTk0z/QMvKN0XsdEyML
   trjHNEcukL6ic9TJCvYvJlA1DU9GlLh2k2i6piYx567A+WVGFCuXrY2QQ
   YQbHXO7/vOnRMkY3DIVelwwa0x2Olm2uq62d9F9VUxVnlPuWBtsMZF0i1
   B+0TrKPOEBn7GdYL2nvnRl9C1qcietswNb/3x11cSAqIY36gr0wb4R/cN
   A==;
X-CSE-ConnectionGUID: l+TSo+fTTuK7ykcysnr64g==
X-CSE-MsgGUID: DNeOYT7NTU6ubeD7jiwSgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82009969"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="82009969"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 06:49:35 -0700
X-CSE-ConnectionGUID: Pth0CHSJTs2hBLA6+YSDJg==
X-CSE-MsgGUID: 3Vf0x/xLSbyquNjEzhLtsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="249363221"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 06:49:31 -0700
Date: Mon, 15 Jun 2026 16:49:28 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Dawei Feng <dawei.feng@seu.edu.cn>, andy@kernel.org, hansg@kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, abdelrahmanfekry375@gmail.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, jianhao.xu@seu.edu.cn,
	Zilin Guan <zilin@seu.edu.cn>, Kees Cook <keescook@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2 1/2] media: atomisp: fix memory leak in
 atomisp_pci_probe()
Message-ID: <ajAC6E3Pc0edjySZ@ashevche-desk.local>
References: <20260615072841.3113700-1-dawei.feng@seu.edu.cn>
 <20260615072841.3113700-2-dawei.feng@seu.edu.cn>
 <ai_d0B8YOZAwnqu_@ashevche-desk.local>
 <ai_kfgkuDYcFd0bG@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ai_kfgkuDYcFd0bG@stanley.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64911-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:error27@gmail.com,m:dawei.feng@seu.edu.cn,m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:abdelrahmanfekry375@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:jianhao.xu@seu.edu.cn,m:zilin@seu.edu.cn,m:keescook@chromium.org,m:corbet@lwn.net,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[seu.edu.cn,kernel.org,linux.intel.com,linuxfoundation.org,gmail.com,vger.kernel.org,lists.linux.dev,chromium.org,lwn.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8FE34686DD3

On Mon, Jun 15, 2026 at 02:39:42PM +0300, Dan Carpenter wrote:
> On Mon, Jun 15, 2026 at 02:11:12PM +0300, Andy Shevchenko wrote:

...

> > > The bug was first flagged by an experimental analysis tool we are
> > > developing for kernel memory-management bugs while analyzing
> > > v6.13-rc1. The tool is still under development and is not yet publicly
> > > available. Manual inspection confirms that the bug is still present in
> > > v7.1-rc7.
> > > 
> > > An x86_64 allyesconfig build showed no new warnings. As we do not have
> > > an Intel Atom ISP platform with the required camera sensor hardware to
> > > test with, no runtime testing was able to be performed.
> > 
> > These last two paragraphs do not suit the commit message. Please, drop them
> > here and better to describe all this in the cover letter (if not yet).
> 
> This is how the documentation says to write commit messages.
> 
> https://lore.kernel.org/all/ahgaOigklcDCYvRp@stanley.mountain/

Isn't it enough to have in the cover letter?

Thanks for commenting there, but I would insist to move these two paragraphs
from the commit message here. Maybe Kees is okay with that, I'm thinking that
this is too much (since we have lore archives).

-- 
With Best Regards,
Andy Shevchenko



