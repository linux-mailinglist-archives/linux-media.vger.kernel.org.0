Return-Path: <linux-media+bounces-64986-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OGw5N18tMWpXdQUAu9opvQ
	(envelope-from <linux-media+bounces-64986-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 13:02:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A31168E992
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 13:02:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=BDwd3upS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64986-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64986-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5086D302D74E
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 11:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DC99429825;
	Tue, 16 Jun 2026 11:01:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461953ACF05
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 11:01:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781607716; cv=none; b=YojAyniK2J3XApecLpV2pbMeiUdrFHC/a27SPvtCUoWujWGESBJ5+mgxSUEgr9KsM3WmGW2o02TWWmcqCGCAboU7LZhBAk10tVeoCmA16Jm8RuCCFl5RDXeIzkmWb5NginBQS798Hm4ovKsxeBIe5gEUm4Zu5WLZVx7Ki0XfyMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781607716; c=relaxed/simple;
	bh=p4d1amCcedwI1v3xqzug5CnPQ8gUoAn3v47/+9BBe5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SPlYUTvtvy7TbL5IX1pX11xyF2BLUKuDDoQBF99PSrOVmJMfQvYt2FPTO9T/r2pkc6uNexdYkrIH9JbYIDd2PCyABSxpdPqOkFV7rcAkLhIzy2euINt0//YFqOfQ7Woxacafy2TALDfWLUY5V9jMXYxrCaV+ivFmV9bzEV073RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BDwd3upS; arc=none smtp.client-ip=192.198.163.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781607715; x=1813143715;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p4d1amCcedwI1v3xqzug5CnPQ8gUoAn3v47/+9BBe5w=;
  b=BDwd3upSm0k1FiRHYsTZh67VnlIfd7wGIom2VYMmyfQukikZ8OiObNdy
   bx0fvCNwaqBodf9BG2hh09s9gQ4BtdM1nzqSTraGpHgRd1JGZH9tBDcX2
   dryDWLQUa77nJbOo4R5lOFKhgX3vksAEH+3mcvTKxnb8dc6BfvY4985Jr
   P8kUPufT0KeNYxJ5qH11PWTN5/eN7BP188lvKXtZas1oFqw5uV4tOqIra
   gXUn9jb3RRFWI+9inbXx2HTarNixBu7iqpdkLc52Y5Q8aFfKSHrDUUt8i
   14r1O94mDW4CSQRmLpQJdGdE2X0qK7ZwvDTC4tDOtT78gWMFCX3P21bbL
   A==;
X-CSE-ConnectionGUID: dEX+v4QqTmaHFaQOxs+FCw==
X-CSE-MsgGUID: 46xUGCCVTvOD7M+3hijo8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="81377613"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="81377613"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 04:01:54 -0700
X-CSE-ConnectionGUID: SnTGqHIjQVC2mTdyxS1hAQ==
X-CSE-MsgGUID: 9i6vCf4+SSq80ut0e54RHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="285852468"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.153])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 04:01:53 -0700
Date: Tue, 16 Jun 2026 14:01:49 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Andrei Khomenkov <khomenkov@mailbox.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-media@vger.kernel.org
Subject: Re: [PATCH v3] media: atomisp: replace kmalloc() with kmalloc_objs()
 in sh_css.c
Message-ID: <ajEtHT5PXYZYXUX8@ashevche-desk.local>
References: <20260615194548.20963-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615194548.20963-1-khomenkov@mailbox.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64986-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:khomenkov@mailbox.org,m:gregkh@linuxfoundation.org,m:linux-staging@lists.linux.dev,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,ashevche-desk.local:mid,intel.com:dkim,intel.com:email,intel.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A31168E992

On Mon, Jun 15, 2026 at 10:45:48PM +0300, Andrei Khomenkov wrote:
> Replace arithmetic in the kmalloc() function with the kmalloc_objs()
> macro, as this calculation method is unsafe.

...

> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>

Nope, I haven't suggested the initial idea.

...

What about patches that were sent against this driver for the past year?
There were at least two patches of the similar changes. Please, check on
the prior work and if needed rebased, updated, upstreamed.

(If you haven't taken that, it has to be explained why.)

https://lore.kernel.org will help you and
https://lore.kernel.org/linux-media/?q=s%3Aatomisp+b%3Akmalloc
as a rough first step.

-- 
With Best Regards,
Andy Shevchenko



