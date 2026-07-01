Return-Path: <linux-media+bounces-66184-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d4l2As7eRGqk2QoAu9opvQ
	(envelope-from <linux-media+bounces-66184-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 11:33:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0016EB9EF
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 11:33:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=eVbCqeJt;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66184-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66184-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BFA6304EBBA
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 09:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B9C23F076E;
	Wed,  1 Jul 2026 09:30:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606AD32470A;
	Wed,  1 Jul 2026 09:30:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782898256; cv=none; b=bSbCThKEFPLATAtvgt6MnKDhHZWjy6hIV/Zd6CtF0X78tGGcWSSJcQXwac6UW+t1nAvf/pewFzLKjyqvHKsTayx8gQ/GcrA7pPwNXWAqGRNZDplXhs8GkLwR/koxykgVkAhnF9lfIKXEaoyzEMyHHULSj3X7FOBT2kllRzDwmMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782898256; c=relaxed/simple;
	bh=zxdlH1FR6khQMS+6yKVEt4UheNLI9wZOoLU6TFR9BOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i6Ke/bEK8FM/1Snfdu+4SZGCMhenyFjJhL+qOPjn/e/TMLpsGSAIV4m1wMqFBwcIy+/fizsQdO5mP6rf7yXWNG3ULz9s/W0CklK8U3w1PU651KMPGR9lUHQJUXiVn2FLI4r4xXVNbUZ7yI72tXWdQ/lKHa2Uec3N1TBN28JUcRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eVbCqeJt; arc=none smtp.client-ip=192.198.163.16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782898255; x=1814434255;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=zxdlH1FR6khQMS+6yKVEt4UheNLI9wZOoLU6TFR9BOI=;
  b=eVbCqeJtKWm1p5EzNDYJkTafMfbjm1jFfBaE4sQ+fkqKxwVZ/FYtQbxY
   ubRhkWI7FWVMGa4qQXp39pAPIfJRWx/paK9Yd4FinBHpVkDMrCn9FDGvH
   Tgl4jHj5tn+VjdJTNd3I7FnTKIcgPTkCN4Rvb3y5CP4H9JxF+z42H68pY
   +9cnsKi7hqnxERJLyKbqQB0dNqfKzEJvyv+f3v0LOHP95L/2K+tDzaDn6
   iznh7UjLy9fhqyC/N6glqqMT6OVWhwmmjMawnpqiET3cx0hFqAADYiBCV
   8qPyV4nX9j/wWJ4jcNF7Url9btbNVx7TCMj7r6/OEJRwcen04L+rjVImo
   w==;
X-CSE-ConnectionGUID: XL+DVbBhQuOEYNRWmJZ+SA==
X-CSE-MsgGUID: jFK+LGw/ROee3XNrFLuYyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="71150578"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="71150578"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 02:30:55 -0700
X-CSE-ConnectionGUID: IG6YrvELQtayc+DmRhZEeQ==
X-CSE-MsgGUID: X4PJDEzmRS+/ArkfpiivJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="248537020"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.65])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 02:30:52 -0700
Date: Wed, 1 Jul 2026 12:30:50 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bohdan Derkach <bohdandmarcus@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, hansg@kernel.org,
	mchehab@kernel.org, gregkh@linuxfoundation.org, andy@kernel.org,
	sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: atomisp: fix block comment formatting style
Message-ID: <akTeSuxmA8PesfAt@ashevche-desk.local>
References: <20260630160435.3293-1-bohdandmarcus@gmail.com>
 <CAHp75VdX_DmiWXc_pYCgZd88cO3=yB7vFsgHx_8HLAJtaJOHow@mail.gmail.com>
 <CANqab03_SQFDb38wkXBMUiJ1Xk-g9_ZpqvOUo+nQyR+SsVnsFQ@mail.gmail.com>
 <CANqab0096R4gKrwfKF78iyQt2aM0qQJoSwrBKBqMiZxna60rsg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANqab0096R4gKrwfKF78iyQt2aM0qQJoSwrBKBqMiZxna60rsg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66184-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bohdandmarcus@gmail.com,m:andy.shevchenko@gmail.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:andy@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:andyshevchenko@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,linux.intel.com,vger.kernel.org,lists.linux.dev];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,intel.com:dkim,intel.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,checkpatch.pl:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E0016EB9EF

On Wed, Jul 01, 2026 at 11:51:43AM +0300, Bohdan Derkach wrote:

First of all, do not top-post!

Second, do not send HTML, the only plain text is what is considered.

> On Wed, Jul 1, 2026 at 11:42 AM Bohdan Derkach <bohdandmarcus@gmail.com> wrote:

> > You are completely right about the indentation and line wraps. Dan
> > Carpenter also pointed this out to me yesterday, and I have already
> > prepared a v4 that fixes all of these issues perfectly. I am strictly
> > following the rule to wait a full 24 hours between sending versions, so I
> > will send v4 later today.
> >
> > Regarding your question about whether this is the only issue in the driver:
> > I understand that sending a patch for a single block comment in a 100k LoC
> > driver is a very small contribution. Since this is my very first patch to
> > the Linux kernel, my main goal was to learn the correct workflow (git
> > send-email, formatting versions, acting on feedback) before sending larger
> > patch series.
> >
> > Once this v4 is accepted and I am confident that my setup is correct, my
> > next step is to grep through the rest of atomisp to fix similar block
> > comments and submit them as a proper patch series.

It really doesn't matter if this is a single place fix or not, the part of
the process is to try to fix the whole class of the problems at once.

Also check that your code is based on latest and greatest maintainer's tip.
(It's located somewhere on git.linuxtv.org with atomisp in the tree name.)

> > Thank you for your patience and for guiding a newcomer!

You're welcome.

> > On Wed, Jul 1, 2026 at 11:31 AM Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> >>
> >> On Tue, Jun 30, 2026 at 7:06 PM Bohdan D. Marcus
> >> <bohdandmarcus@gmail.com> wrote:
> >> >
> >> > Fix a block comment formatting warning reported by
> >> > checkpatch.pl in atomisp_cmd.c to conform to the
> >> > Linux kernel coding style.
> >>
> >> Almost the same comments as per v2. Please, slow down, read other
> >> comments and act accordingly.

-- 
With Best Regards,
Andy Shevchenko



