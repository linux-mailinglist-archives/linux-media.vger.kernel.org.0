Return-Path: <linux-media+bounces-64445-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DmCYBTdqKWreWQMAu9opvQ
	(envelope-from <linux-media+bounces-64445-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 15:44:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 601AE669DF2
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 15:44:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=DrOQZOmF;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64445-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64445-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 988023352E2F
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 13:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D98240B6E5;
	Wed, 10 Jun 2026 13:36:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6CE3E44F0;
	Wed, 10 Jun 2026 13:36:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098589; cv=none; b=rfCmVusk1wzoxxO1puHgQlcp29cL1oMdkWDj2pb3xHGKJBe+3U1tfvZSivYkdeh8kJ2GsYtQzcrRRuE1V6Vd8LPbMSHHJf2IgOsQC4SYXv1qodUuoS8vGol1zEP5SIhGFC5FBEtOI5pfwoXSty21ctwdFDroHhysGqEwM5mAElQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098589; c=relaxed/simple;
	bh=l2JZP7zzFaDa2y3gL9xNyiYHIWkp0WBUocN6D/6f+J0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qhefgXha/Bp2ekx822N8vixwR/p+B8qvk5MHx+5fMDI0VDMYy7RYdSpBxgkZLfn8k8BmLzVr6I0yHaW7xO2+SPgD8VhaVypOLOzOU4RU4qxiy4mmSrXEssTC2bKlSyObjjj4Ug2+w70EU9wQgyKB/DKyk7VsC0KG180CkFDdZ80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DrOQZOmF; arc=none smtp.client-ip=198.175.65.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781098585; x=1812634585;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l2JZP7zzFaDa2y3gL9xNyiYHIWkp0WBUocN6D/6f+J0=;
  b=DrOQZOmFtc436O2pdK3CoPxCZ/Oe0UVkPyu9ka/hgxZd3Q291G68t8cO
   FzwquHXwB3EHzSZjQIAiIhI/y0tfJn/xBR+l3L4BsqYD9uwPmh59jR064
   yOCGuUPo8hV3yFqOlw9Y5epMBxZZKAr3S6W+Ebf3Nqix1qHUY7po0SJ7C
   IuDvFew4YpM60bLXFtgiEvDLKruxvU9WwvdVzQb/IYBQpMqW19r4V0X6P
   RZrsoVBZt3zrPGkvG0HDLDy+T+je/tE9+YxHYbYAGujipBPEd8i8E0cQ5
   wvgVwjCJfKAwjXwIPaxwGIXoZKj25blkyJL9eYi/DTFX7H8/vj7vUero5
   A==;
X-CSE-ConnectionGUID: vcUdAREeSaeOdmvsubpfqw==
X-CSE-MsgGUID: OY+NOtolR2SqQs0XVHP0Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81868622"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81868622"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 06:36:24 -0700
X-CSE-ConnectionGUID: IqWG2RouTdi7xF0imV58dQ==
X-CSE-MsgGUID: vEg/9p1mSVirOQOcH0Buug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="246027947"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 06:36:21 -0700
Date: Wed, 10 Jun 2026 16:36:19 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	feng@innora.ai, ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: use kvmalloc_objs() in
 make_histogram()
Message-ID: <ailoU33VyQJtpEcA@ashevche-desk.local>
References: <20260609215110.118860-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609215110.118860-1-rodrigo.gobbi.7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64445-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:rodrigo.gobbi.7@gmail.com,m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:feng@innora.ai,m:~lkcamp/patches@lists.sr.ht,m:linux-kernel-mentees@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:rodrigogobbi7@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	HAS_ORG_HEADER(0.00)[];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 601AE669DF2

On Tue, Jun 09, 2026 at 06:46:31PM -0300, Rodrigo Gobbi wrote:
> Replace kvmalloc() with multiply with kvmalloc_objs(), which handles
> the size multiplication internally with overflow checking, silenting
> checkpatch warn.
> 
> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
> ---
> Hi, all,
> There is a ongoing effort like this for other files from atomisp
> at [1], yet, it is not covering the same file.
> Tks and regards.
> 
> [1] https://lore.kernel.org/all/20260413112904.98864-1-feng@innora.ai/

Yeah, the problem is that the activity seems stale. Can you pickup all
the patches from the mailing list that have not been yet applied (regarding
k*alloc() uses) and combine them into series or so and update regarding to
Sakari's comments?


-- 
With Best Regards,
Andy Shevchenko



