Return-Path: <linux-media+bounces-64652-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VIp4BibDK2phEgQAu9opvQ
	(envelope-from <linux-media+bounces-64652-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 10:28:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C577677D1D
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 10:28:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=Id1zx6Qh;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64652-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64652-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7AB293035D63
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 08:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E21BC37CD3E;
	Fri, 12 Jun 2026 08:28:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0613624D4
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 08:28:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781252896; cv=none; b=bg7dONqTN2Ruxb1cein65uxsinBSvt7w0GPA97DAEsC53N3MPzCIt4ycnqIDvfVRevZsfQTCBnZDyWmuRV65K1SXrmfJJ95ThNYCJESSdW8BtKtxdIBdswKGtFpaiLfUW2QutL+zZrK22F4UR8S76LJ5UgHAq0XjeoYlXYyZFgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781252896; c=relaxed/simple;
	bh=bbL/MSfGzZp/Hy+6Xg2BBf8Jvii6ASQ5GdlAJThy7RA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RxRYbcTYuc2SHQQc6VGz/ecwGjLt8zZR8ivCoyPKvXEhZcZxuEWLbqjm8k8Ud7wQuf51TNeF8CIa2ag92LlP0FGYaNzTz0l3bhDEdMPVOSV4JfP+w4jSei2lUlVPXzI9zMsqpfe41ILFqH3136rVyaXzkIT3ZjBcI0lPqLl6y/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Id1zx6Qh; arc=none smtp.client-ip=198.175.65.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781252894; x=1812788894;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bbL/MSfGzZp/Hy+6Xg2BBf8Jvii6ASQ5GdlAJThy7RA=;
  b=Id1zx6Qhqp0+CUsRxbAWWxfQ/3w9oyrPEyJMVSwJhVoFrtLyhmH1vDFv
   Ys+JKtlv7N/CiKoIB+nlJnCZ+ecBdJeB6nnTD7Hgjo93lXJW1xkMZ3dyl
   ytd1+DB1jEwscCN4brNWPVOERQFb0ou/uyCfLmLtWQEutismr8H9Unxdl
   w4kJZtI1QSNTifowNfaJ35cgmdorFQF2+hyaGuUvguG4ND6yLO8c0XkqL
   FEbDMwcDlCrCvGngEtLvw17mIf8YC+4TxLYwcyw1G/GWv8tJJgTLqwT76
   AEWslaC6+vUgH3cnjEx7uDboF7YAg8GdEzYZwgUHgK/FT+SERd6BzYy22
   A==;
X-CSE-ConnectionGUID: IDdYv1wkQT+iBk/kTm3zFA==
X-CSE-MsgGUID: P2gPHyLcQEGxfE4TOGZDXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92401774"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="92401774"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 01:28:14 -0700
X-CSE-ConnectionGUID: 0/gMBBe+Tj6yTnuQEc8k/w==
X-CSE-MsgGUID: JwLu5HB5T6+KG0mO3xbuNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="240412666"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.102])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 01:28:12 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E8D83121C3C;
	Fri, 12 Jun 2026 11:28:08 +0300 (EEST)
Date: Fri, 12 Jun 2026 11:28:08 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Frank Li <Frank.li@nxp.com>
Subject: Re: [PATCH v2 00/17] Rework frame descriptors
Message-ID: <aivDGIhBQSMW0eBh@kekkonen.localdomain>
References: <20260518164318.3367888-1-sakari.ailus@linux.intel.com>
 <65ab9804-d6ac-4110-9bed-e259195d8f26@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65ab9804-d6ac-4110-9bed-e259195d8f26@ideasonboard.com>
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
	TAGGED_FROM(0.00)[bounces-64652-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomi.valkeinen@ideasonboard.com,m:linux-media@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:dave.stevenson@raspberrypi.com,m:jacopo.mondi@ideasonboard.com,m:jai.luthra@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:Frank.li@nxp.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C577677D1D

Moi,

On Thu, Jun 11, 2026 at 03:49:13PM +0300, Tomi Valkeinen wrote:
> Hi Sakari,
> 
> On 18/05/2026 19:43, Sakari Ailus wrote:
> > Hi folks,
> > 
> > This smallish set makes frame descriptors dynamically allocated and
> 
> Is there a real-life requirement for this? 8 frame-descs per pad has been
> more than enough for my uses so far.

Not in upstream right now. But I see this as a general improvement so I'd
be inclined to merge support for it.

The next hard limit is 64 (bits in u64).

> 
> > implements a single-entry frame descriptor based on the device's format,
> > using a new helper called v4l2_subdev_get_frame_desc(). All drivers that
> > do not obtain their frame descriptor from upstream are converted. The
> 
> Hmm, what does this mean? Don't all the drivers modified here already get
> their frame desc from upstream? Or did you mean "all drivers that obtain
> their frame desc from upstream..."?

I think there's an extra "not" indeed.

> 
> > helper also obtains a frame descriptor for the desired type (parallel or
> > CSI-2) and checks there's at least one entry there. These checks are
> 
> What does this mean? In patch 3, the desc says "If the remote sub-device
> does not support frame descriptors, v4l2_subdev_get_frame_desc() creates
> one".
> 
> So does v4l2_subdev_get_frame_desc() just check, or does
> v4l2_subdev_get_frame_desc() implement a fallback mechanism, if the upstream
> subdev does not implement .get_frame_desc?

There's a fallback mechanism, yes. Otherwise it wouldn't be very useful.

> 
> If it does, some of the drivers implement their own fallback. E.g. rpi cfe.c
> calls cfe_get_vc_dt_fallback() if it gets -ENOIOCTLCMD, which just
> constructs a default single-stream frame desc with virtual channel 0.

I'll remove this in the next version.

> 
> It also looks like you only modified platform drivers. Did you check the i2c
> drivers? Some call get_frame_desc().

I could have missed some, I'll check again.

> 
> > removed from drivers that currently perform them. (Some drivers also check
> > there's exactly a single frame descriptor entry but I think in most cases
> > this check could be loosened. That could be done after this set.)
> 
> Hmm, isn't that strictly tied to the multi-stream support? Or do you mean

Not really. These are existing drivers that do not support multiple
streams.

> that frame desc could contain multiple entries, but the receiver would only
> use one (if multi-stream is not supported)?

Correct. Some currently fail if there are more entries and others just use
the first one.

-- 
Regards,

Sakari Ailus

