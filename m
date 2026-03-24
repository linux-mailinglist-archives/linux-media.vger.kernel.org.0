Return-Path: <linux-media+bounces-56864-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NU5ERd/wmnqdAQAu9opvQ
	(envelope-from <linux-media+bounces-56864-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 13:09:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE17307EF8
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 13:09:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9091A311C8E3
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 11:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 824463ED5CE;
	Tue, 24 Mar 2026 11:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NwtF/nN5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA863EF0B6;
	Tue, 24 Mar 2026 11:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774353039; cv=none; b=NoCfuY2/Lkzt/qdrfWdb4hmTLp6ITOFKrFsQAg4Z3wqVm0CrH42a5MPrLKQHiZk0Gb9yj1ANPk6HRKi/34BzWIei4bMNyjrRuufG58XanH65FFij0ZjfhQySGPHrqQa0Timmb6KBFwoiHdIha6JmCXsMrLkDyTXFArRfjYYMWBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774353039; c=relaxed/simple;
	bh=qMdwZDsCBrOJkZUqhv1MvpTWq97aqolkMxusnEM52QY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p1WyL7ragOJNX3WemDeF9JIrai3LdliNLyn/48Aa4W4QYm8PaoMtLjnZrrle+1Ha1SJLE3U4CLpuym/OTn0sqaKazQmTZ4cAyNBdEhv4dynEtv4er3oqo49HeCUotCX84kDDk+o2Fp1lQQ4+9PAEJqaBUfQnvelWMs4QrZhIn5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NwtF/nN5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774353038; x=1805889038;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qMdwZDsCBrOJkZUqhv1MvpTWq97aqolkMxusnEM52QY=;
  b=NwtF/nN56aumlgDoZTrsRzrQbTtecBoy9fp878d7NhgJiqy6sDDzBkw/
   2TZgiOHFaSSeTRUCP7Y0ckZKOYRe3Q7XedtZXLWpkYGs/9wdco1EDtkLl
   gWAd6B2QudqviC+kW0HGTwlDEyO/ZFET/qe93/5jXXMrvJPbB3pfw92Sh
   h6GQfGde7/Z77B5zDYZVs+6SnWLyoRnWtWDFBxP+1a/6wQE1R1QbjC+cu
   8mgqPM9voRXPsA60ZVVxST41+ZZ1MLBQ5JmoLAlY+opzGfejq1J78bdfK
   WGhwp2CTpUgFLhMjoXtNBfy18P1HXvDJD3G4VUn9/VA1yQ43UBtXjMGZx
   A==;
X-CSE-ConnectionGUID: amc86Uz6Rw2DOK+c1unDrQ==
X-CSE-MsgGUID: xcH4F01dQBWWraIkEz+Caw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="92743988"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="92743988"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 04:50:37 -0700
X-CSE-ConnectionGUID: 1V2gU2V9R4eatb4n5+DU8g==
X-CSE-MsgGUID: BZCIPyUlQVuvGboj8655Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="221435823"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.214])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 04:50:35 -0700
Date: Tue, 24 Mar 2026 13:50:32 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Anushka Badhe <anushkabadhe@gmail.com>
Cc: gregkh@linuxfoundation.org, mchehab@kernel.org, hansg@kernel.org,
	andy@kernel.org, sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: atomisp: pci: remove leading whitespace at the
 start of the line
Message-ID: <acJ6iD5FGE2ZlORd@ashevche-desk.local>
References: <20260324081007.23165-1-anushkabadhe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324081007.23165-1-anushkabadhe@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56864-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: DEE17307EF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 01:40:07PM +0530, Anushka Badhe wrote:
> Removed the whitespace at the start of the line to comply with
>  linux kernel coding style.

Linux

...

>  const hrt_address GP_TIMER_BASE =
> -    (hrt_address)0x0000000000000600ULL;
> +	(hrt_address)0x0000000000000600ULL;

Always think one or even two steps further. How does your patch add value?
For now it's just a warning of a tool or even no warning, just some whitespace
shuffling, which is usually the type of patches that are doomed to be ceased.

Compare to

const hrt_address GP_TIMER_BASE = (hrt_address)0x0000000000000600ULL;

which gives the same result + reduces number of LoC for free. This increases
the value of the change. Now, you can look at the rest of the code for the
indentation problems.

BUT, they are so-o-o-o LOW priority thing, that most likely will be simply
NAKed. Can you rather do a real patch instead, please?

-- 
With Best Regards,
Andy Shevchenko



