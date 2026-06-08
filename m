Return-Path: <linux-media+bounces-64169-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IsqHEnmOJmrKYgIAu9opvQ
	(envelope-from <linux-media+bounces-64169-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 11:42:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E82654AF1
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 11:42:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=Vg+moecv;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64169-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64169-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5A2B63007527
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 09:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29113B42EB;
	Mon,  8 Jun 2026 09:42:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DF43AEF4F
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 09:42:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780911731; cv=none; b=Sli6c+baQXunS8+j1pzu4FiXCmz3lxlY23MOwJjfEiPQewQgiWgF8Q29EYdZ0+gT+4HkGotCJGihsITITk7jGvLppa7knGro3rkT08Q7mebwgDEIhUdmI0jXMmAsvTImDyvZdnnM3e4hkBSweS5qSk1rwGz6rE/8E/8U0KkSXNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780911731; c=relaxed/simple;
	bh=ldOnsl5F3ax8w/TkW/PCiwokYR6H6h8KIyl0418IMUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d5jnXpq9nbPL6Wc1ZzUgC/9sG1SsQOAGz7QUhMMkSWgqijMV1vGOpLKaMT9u7DYLDlWdwlEXQZMaYH4XwW/j7tL4SfyDfA/Nusm37euinpG92UegTbyXQJbWHCWFxyXIjNHiwsmPWQM8nrW/NEZlrz1LByYBJxgkp0llNpIw5C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vg+moecv; arc=none smtp.client-ip=192.198.163.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780911730; x=1812447730;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ldOnsl5F3ax8w/TkW/PCiwokYR6H6h8KIyl0418IMUY=;
  b=Vg+moecvtREJ+5nGrsiaBcUQpa+p6fd/VPaOx/V1Cmetbmf1PGPjhpPL
   mdFbRz10kMVJ6Bu1WULBEIuQ76H8H8QnfnzJRSeUf2DNqrU8QgMjjoPvG
   BFkmYWNlgBTjYhrNjlDZddkhqWoGGqB2wpQCkbbUHbuQElamz9EnwisaE
   nUtmolPUVnXNHJdkZVry5uGMe+s8T8AIUpIVp0c8aaQptOWZfkGavwy/9
   KDQQXT+4ZbbJ05jyVZhKd5n457gLHp6KkN12w3Rb4uffKFs3Rw9MGui0j
   gf62IjTCHc3ARW7mPTqQn0/lpDEWGbhtG3EL0++JFLDBOXJ6b/58ZyflA
   Q==;
X-CSE-ConnectionGUID: 33f+ER6GQwWvDGqoq9AIXw==
X-CSE-MsgGUID: k5KThWjlSIew4EUwl/8isQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="93033465"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="93033465"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 02:42:09 -0700
X-CSE-ConnectionGUID: GqS50Ob9Q4KKiKVgJFVomw==
X-CSE-MsgGUID: Hui5CjryTMCiAZGFt3QOiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="245596346"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.110])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 02:42:01 -0700
Date: Mon, 8 Jun 2026 12:41:58 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Andrei Khomenkov <khomenkov@mailbox.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kees Cook <kees@kernel.org>, linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: Re: [PATCH RESEND] media: atomisp: replace kmalloc() with
 kmalloc_array() in sh_css.c
Message-ID: <aiaOZrwQjHufwiLE@ashevche-desk.local>
References: <20260606095410.13968-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260606095410.13968-1-khomenkov@mailbox.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64169-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:khomenkov@mailbox.org,m:gregkh@linuxfoundation.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:andy@kernel.org,m:sakari.ailus@linux.intel.com,m:kees@kernel.org,m:linux-staging@lists.linux.dev,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:from_mime,intel.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 41E82654AF1

On Sat, Jun 06, 2026 at 12:54:10PM +0300, Andrei Khomenkov wrote:
> Replace arithmetic in the kmalloc() function with the kmalloc_array()
> function, as this calculation method is unsafe.

...

> -	descr->in_info = kmalloc(descr->num_stage *
> -				 sizeof(struct ia_css_frame_info),
> -				 GFP_KERNEL);
> +	descr->in_info = kmalloc_array(descr->num_stage, sizeof(struct ia_css_frame_info),

Why not sizeof(*descr->in_info) ?

...

Same Q to the rest.

-- 
With Best Regards,
Andy Shevchenko



