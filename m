Return-Path: <linux-media+bounces-67556-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wTcfJcYaVmr0zAAAu9opvQ
	(envelope-from <linux-media+bounces-67556-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 13:17:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC99C753D37
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 13:17:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=cJ+5NY8Q;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67556-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67556-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 394A230EE896
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 11:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EEE6385521;
	Tue, 14 Jul 2026 11:14:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EF137E316;
	Tue, 14 Jul 2026 11:14:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784027691; cv=none; b=BQMrbjaMAhCos9rKP5niN8ElcjWe2tHDNakfRnxWGhDqcczhdnksMc2Z+9llVX7xysUZERU9aETDE3umICOyKXEGW6hC2qqkqmjo9zqwUQKxYvQhVBIAN8qk+TdoSB72/g91KSaLhCtXtxBqCimBlMuEzV5FpIJjFzNMCQd9hjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784027691; c=relaxed/simple;
	bh=qQrwrHYx8cRM3oa6lWly2Rut3pgouXoDKfZfik3XUFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fzfxaOS+VDBU4IFaFn0csS5VjQ9t7gIWJ2HJ3RWo1qZpd6BJIdBNqAlK6XJqLZvAfQ854fhPQAvTngt3fc95jhBdFe0o9uqqUAizLM46Bs9L3aD/n9J00WpMz1YX5qhJhx/5lvSorqbIXa2pSGQ1b4i4EwGf9PGfT/ypL/v43v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cJ+5NY8Q; arc=none smtp.client-ip=192.198.163.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784027690; x=1815563690;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qQrwrHYx8cRM3oa6lWly2Rut3pgouXoDKfZfik3XUFA=;
  b=cJ+5NY8Q1hdGyE1YaCPav5Qh+W6LNeQKnIwkHWBeJB/JvBgz8NhSdi5r
   dJ1NJgD5kIURUAt2XaNaxMaJjDDphT5Yt8skTG0qs/tJhBIPeLB9tb98w
   k9RsKOFDXTvJ7rzRSQiV4sWmefMkvfVxgPHaA7N35TnItR++PqbP3CWw3
   1VjhE15/UhlskcgaVr4m5nkUKysV4MP7sxJLgRRQ2ZUqNKbADJHUbAvdw
   g5ZjoMo+HRWG+O+FM4BJPLvcUIoLc/fyiFYa37+SG8v71waMLc+3aqEy9
   OBFsWm7g/9F3n3zbXuHfeSUeZcjsgybRJ/1PuK9N2AK+9cBP2MIvG2tYu
   w==;
X-CSE-ConnectionGUID: 1nFwB2hLTq2GMTpJFYx6kA==
X-CSE-MsgGUID: FcQ6oKGLRTWNg9DZexWeDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="83767929"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="83767929"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 04:14:48 -0700
X-CSE-ConnectionGUID: 00oqJKDNQSOW58YS0IDmdg==
X-CSE-MsgGUID: UUkvYSlIQk+VNvVBo5ditw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="252444536"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.245])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 04:14:46 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5760511F8AD;
	Tue, 14 Jul 2026 14:14:44 +0300 (EEST)
Date: Tue, 14 Jul 2026 14:14:44 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, Andy Whitcroft <apw@canonical.com>,
	linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	hans@jjverkuil.nl
Subject: Re: [PATCH 1/1] checkpatch: Deprecate V4L2 pipeline power management
 code
Message-ID: <alYaJNtPID_c3eZn@kekkonen.localdomain>
References: <20260713161327.3682-1-sakari.ailus@linux.intel.com>
 <54ae65ff1286e2192b5a6575277e347469d4c44b.camel@perches.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54ae65ff1286e2192b5a6575277e347469d4c44b.camel@perches.com>
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
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:joe@perches.com,m:linux-kernel@vger.kernel.org,m:apw@canonical.com,m:linux-media@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:hans@jjverkuil.nl,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-67556-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC99C753D37

Hi Joe,

On Tue, Jul 14, 2026 at 03:28:13AM -0700, Joe Perches wrote:
> On Mon, 2026-07-13 at 19:13 +0300, Sakari Ailus wrote:
> > The V4L2 pipeline power management code, in particular
> > v4l2_pipeline_link_notify(), v4l2_pipeline_pm_get() and
> > v4l2_pipeline_pm_put() are deprecated and shall not be used in new code.
> > 
> > The drivers need to use the Runtime PM instead.
> 
> Nack. Say that in the error output.
> 
> Given this patch, checkpatch's message would be something like
> 
> "Deprecated use of 'v4l2_pipeline_pm_get', prefer '' instead"

That's even technically correct: these functions serve no useful purpose
anymore, all new drivers effectively use Runtime PM anyway.

> 
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
> > @@ -879,6 +879,9 @@ our %deprecated_apis = (
> >  	"DEFINE_IDR"				=> "DEFINE_XARRAY",
> >  	"idr_init"				=> "xa_init",
> >  	"idr_init_base"				=> "xa_init_flags",
> > +	"v4l2_pipeline_link_notify"		=> "",
> > +	"v4l2_pipeline_pm_get"			=> "",
> > +	"v4l2_pipeline_pm_put"			=> "",
> 
> Add something like "v4l2 runtime power management API" instead
> At least point out what that is.

How about simply "Runtime PM"?

> 
> And in today's '-next' there's seems to be no indication in
> documentation or code these calls are deprecated.

The deprecation notes were introduced in commits
b97213a41140b87f48865ba594a1f4b5c5566631 and
4ec2caab775606c4bf9d0f026f8942a0b33e2255, the latter of which was merged in
2024.

-- 
Regards,

Sakari Ailus

