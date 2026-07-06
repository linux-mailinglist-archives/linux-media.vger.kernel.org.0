Return-Path: <linux-media+bounces-66652-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SuXbMi85S2pzNwEAu9opvQ
	(envelope-from <linux-media+bounces-66652-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 07:12:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DED70C887
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 07:12:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=lwx1IheN;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66652-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66652-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24B41300953F
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 05:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC013BBFB9;
	Mon,  6 Jul 2026 05:12:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D4B2DB7AE;
	Mon,  6 Jul 2026 05:11:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783314719; cv=none; b=PysTXjR3goTb23NgtEy7lls3KQsVHRrTk+zIDpA0oQO0xezv+cBaTX23iKgishDG1iIuCfwEq0JDB8bPhMsdzglrvFoeTgaGlz54WC1wJkxu8Xvjs4N5xdc5XH/Y/r0ewhqRlQVpUTiet0RSQQmabPAi1XxZ3nTRQXYdFE0ipGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783314719; c=relaxed/simple;
	bh=MwHdV/M7HULwMGu6QgbyN8o/rLL5/OZBAo1FdxlJGHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HoDDtP3wjl53WMVdRkD9HTUwlkBL1XnUrFQ7dWHo5NNUkYnF9x+OMcHzBF1ZuwqBmbDVmUC+2LtV3oSHDWx464obUp1FKVajlNZUCxMEs6ZchA3gnezQ3a/gBsG6v+9QsxVA3Wu8+2PttwROtqgWVOLswoUSE2O5op9GuWnH72Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lwx1IheN; arc=none smtp.client-ip=198.175.65.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783314718; x=1814850718;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=MwHdV/M7HULwMGu6QgbyN8o/rLL5/OZBAo1FdxlJGHs=;
  b=lwx1IheNfx/dQnVhDH7xCKVNPHQt8TV/ViBZW1StX8WSZ9e8JeECANRL
   KnaJ3V7j7EpNUoV7lMLq5zm1Rhxy8SVKSz3a5TEDm0L9NzgXwsPPyYPVK
   tg97vzIvOiueRJFW7fqCmDQ+eilAgoE/CNxVSjxTsbQIJ0DcdhlpH0649
   L+gYyp2j3udn/a4RX8mabyjMGCuJFQ3OznubLIXnAAbFyD5IzS7BnGDvY
   tNCXNpkFNZ8XeTMhit/Rfd/UpsBmUHb7q4Rh+AgJJEdZRSdQrTbwM2mB0
   B/NQ2f0ofyR2f3o9Cn2c8GcA8/DiImmGxPkRLuch10LuWXyW6z03lfb/7
   Q==;
X-CSE-ConnectionGUID: ODtQZCMoTaGxhQvzMDq50g==
X-CSE-MsgGUID: 1S9AQXEiStKNnVB5cJT5oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="95446167"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="95446167"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 22:11:57 -0700
X-CSE-ConnectionGUID: JopTICciSpq8oA+jcxuYTQ==
X-CSE-MsgGUID: NsxLPvtjRDuuw8fVTJu6cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="254261321"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.48])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 22:11:54 -0700
Date: Mon, 6 Jul 2026 08:11:51 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Neal Patalay <nealpatalay0@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mugrinphoto@gmail.com,
	matt@mattwardle.net
Subject: Re: [PATCH v3] staging: media: atomisp: refactor pipe graph dump
 stage formatting
Message-ID: <aks5F-_nQmf6JelW@ashevche-desk.local>
References: <20260705073844.146578-1-nealpatalay0@gmail.com>
 <akpopoFZyWW2e9En@ashevche-desk.local>
 <CAGjuiT_WMkYOJJ40AJPcF_mbyZv+0pvgMOv8fp6hxPN29N_2Wg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGjuiT_WMkYOJJ40AJPcF_mbyZv+0pvgMOv8fp6hxPN29N_2Wg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66652-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nealpatalay0@gmail.com,m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:sakari.ailus@linux.intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:mugrinphoto@gmail.com,m:matt@mattwardle.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com,mattwardle.net];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 23DED70C887

On Sun, Jul 05, 2026 at 04:56:36PM -0700, Neal Patalay wrote:
> On Sun, Jul 5, 2026 at 7:22 AM Andy Shevchenko wrote:

...

> > If for some reason len is > 0 and offset is 0, this will write beyond
> > the boundaries.
> 
> I'll add a check to make sure the offset is greater than 0.

Please, do not remove context when it's related to the discussion.

I don't think it is that simple. One should think of flexibility.
Can we have (potentially) the case mentioned above? Can you first
investigate that? If it's confirmed that len > 0 and offset == 0
is not possible, no need to change the code, just add a comment.

...

> > This will continue writing even if there are more than 3 lines.
> 
> The original code completely removes the third line from the output
> by writing the third line into enable_info3, and then overwriting that
> buffer with everything after the third line. I'll assume the author meant
> to remove all flags after the third line.

It removes the flags that make the 3rd (and last possible) line too long.

-- 
With Best Regards,
Andy Shevchenko



