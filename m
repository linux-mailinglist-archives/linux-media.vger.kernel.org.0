Return-Path: <linux-media+bounces-54367-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKyJMJfppmnjZgAAu9opvQ
	(envelope-from <linux-media+bounces-54367-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 15:00:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A45EC1F0ED3
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 15:00:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 649473054362
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 13:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CE2F35E94C;
	Tue,  3 Mar 2026 13:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FUecG4z1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BDF357A4A
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 13:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772545858; cv=none; b=MwZ+0kBi1ykfop4kfjkRMtpYBJbUHd0jwrLQgXBQnPu+kE79b2/kfL6XNXfOPdWpeKTYRohjqCfleYC9vupr9YHegH5XLZU7D9RtwwHxRz+50keyUniqxe2mwIb6UJimxBcQ8jzzT0tKk2ugufzHNRULuWL+oj5gonBqz6ZiVTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772545858; c=relaxed/simple;
	bh=uoIfbXqHjSJ8xtVV/ST9mgkL0aX02gqhU/tO1caeV+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oh9TP8L8JTkuVUSfUwiR+8dsc7Nv8DxWFJhDZXQclHyu4ZYHDA3kxi99GrRlVkml/YtcR0bQ7sBYSX3rmyaowRivtFm1lQKETTYrpqnnSEldXmfpUoR6zXLnVA+5T3nWqN2Kb46wmc+8luZW8wkKF7bl1NXYI7iq+77OnvvxZvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FUecG4z1; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772545856; x=1804081856;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=uoIfbXqHjSJ8xtVV/ST9mgkL0aX02gqhU/tO1caeV+g=;
  b=FUecG4z1vWmGhmgvJfupbb9QF5KAq4x6oXCrLZqHFx2pwyy7+YOrK9aQ
   j9LcvhRsejcvlYUbh6qTFF3JPBQ0OQ2PdGK9LsziOzh6q9jaul6g6Ypun
   PO9echBGLtX+gHmodp+IzlGJl8t01yo+gAdVYuZQbYIJRoiNT6iYMq0wn
   kuC5lK9ejLWO8suxDfaEeVO/GxcBPmRmyppbmcvHEMVnK6Q/ourkfs0gv
   N1Y7pS6qC/Hi6nQCrtCV/t2azgzLIU/8HHIp2MU9Lw1/v9pZtL3pEj/ox
   Cc5lhSN01dhm2ggV+wJW8Qg2PIW0ct/73qw4I8pV7QItG/+K254cRI1FJ
   g==;
X-CSE-ConnectionGUID: wq+nLVQsQFKSr9e8FB0Mbg==
X-CSE-MsgGUID: MKVmI12yTMWb2B3NsQ97pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="84217731"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="84217731"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 05:50:55 -0800
X-CSE-ConnectionGUID: /wtfC6YiTzyIdyJGYKkAAg==
X-CSE-MsgGUID: m6vAaP45SV63KcB4NkJy9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="217157266"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.32])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 05:50:52 -0800
Date: Tue, 3 Mar 2026 15:50:49 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-media@vger.kernel.org, andy@kernel.org, hansg@kernel.org,
	mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	Soufiane Dani <soufianeda@tutanota.com>
Subject: Re: [PATCH 1/1] staging: media: atomisp: Disallow all private IOCTLs
Message-ID: <aabnORpRlVBN5_aj@ashevche-desk.local>
References: <20260303083501.3886922-1-sakari.ailus@linux.intel.com>
 <CAHp75VdaYxvQ+tx51WDPFYSzFOSWqHqFKB4xaNTOt-rx4O9CPw@mail.gmail.com>
 <aabfJEGDJGGP49bS@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aabfJEGDJGGP49bS@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: A45EC1F0ED3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,linuxfoundation.org,lists.linux.dev,tutanota.com];
	TAGGED_FROM(0.00)[bounces-54367-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,intel.com:dkim,intel.com:email,tutanota.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 03:16:20PM +0200, Sakari Ailus wrote:
> On Tue, Mar 03, 2026 at 11:21:02AM +0200, Andy Shevchenko wrote:
> > On Tue, Mar 3, 2026 at 10:34 AM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Disallow all private IOCTLs. These aren't quite as safe as one could
> > > assume of IOCTL handlers; disable them for now. Instead of removing the
> > > code, return in the beginning of the function if cmd is non-zero in order
> > > to keep static checkers happy.
> > >
> > > Reported-by: Soufiane Dani <soufianeda@tutanota.com>
> > > Closes: https://lore.kernel.org/linux-staging/20260210-atomisp-fix-v1-1-024429cbff31@tutanota.com/
> > > Cc: stable@vger.kernel.org
> > 
> > > Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
> > 
> > Is it the correct one? Driver was before that, so I believe this needs
> > to go deeper.
> 
> Technically yes, but even this one is from 2020 and the patch removing it
> was merged in 2018, for v4.18. These aren't supported anymore.

It doesn't matter, the Fixes should be correct one, the Revert patch is not
the initial one where the code appeared.

...

> > > +       /* Disable all private IOCTLs for now! */
> > > +       if (cmd)
> > > +               return -EINVAL;
> > 
> > Maybe even a warning?
> 
> That'd be just filling the logs, wouldn't it?

dev_warn_once()

-- 
With Best Regards,
Andy Shevchenko



