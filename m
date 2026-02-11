Return-Path: <linux-media+bounces-52605-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mC64NeKDjGl/qAAAu9opvQ
	(envelope-from <linux-media+bounces-52605-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 14:28:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE53124BD2
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 14:28:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30D993018D5B
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 13:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498CF258ED7;
	Wed, 11 Feb 2026 13:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FoCDX6r6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0206253932
	for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 13:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770816476; cv=none; b=JqTdlDeM0z+OZWTetiBnUUHJDrgOvxzSMdxM3RzRAvDxNRpdZTDqbPYMl7ONZyYtK1zOL2iiPLepT5i1ppJD1y3AsM2vRlo1iXcOUH9NthrhnN4OiYiLC2KH37EtmzsbLsyQuJOqT/sp/SwOcQY+uMHHTJtXku3teqGI/ssopWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770816476; c=relaxed/simple;
	bh=KIpkk4qkTF0dEAOYjue7sSA86aEDyVdvx/ayJN78AOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JJlrZaW1Sv8ACX+gpwltDo2ipuTR/Ncq9AVcoP6csadZci35dNISTaVbod5jEt7Yz+YPbHiRH2AgO8YQ3zYlXZmp3+kOapknhCOBGIjXI1qyDLU9l8CjFAnhJqeogqNSR15MMx7+9yDaRmokEGoTgnVuv2V3nPgn/b8bXgS3If8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FoCDX6r6; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770816476; x=1802352476;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KIpkk4qkTF0dEAOYjue7sSA86aEDyVdvx/ayJN78AOk=;
  b=FoCDX6r6yHfKSz/CaXPg1F0OROJuJg+u1qfNWS9yrwP6WFUUhuMt8ufD
   4wqYyFHC2YQq64+FYP/4L6XFOLr9KltOYcptK2hvU3fB/sKrvHoIzYiS/
   6bBAGiVAACoT49svJMnWWBR3AeKTMk0mYsycTasTMW3KSVMrltnr0SwEB
   s6XRnRHdpjCND+/FbBj7mAnUHOR0gSQ08nnXLwXt6QU/RaUkkg3o4f9R1
   I9PzBxcnaylv341O/q3XSUTwYFZ+8dX7/UFkeAh3q1/SiNGPDAqiNP9+d
   AnJ3IDtv5RHI4hu9VcXng5RbEVPxpPsOe06rUjxGaIc23Gz2e4Q4dym7H
   w==;
X-CSE-ConnectionGUID: Gx4LTDnMTGGdi6NZ9etjeA==
X-CSE-MsgGUID: qhhxxSQVTKSyxD1iCexNsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="72148989"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="72148989"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 05:27:56 -0800
X-CSE-ConnectionGUID: 5I6Ihw5nTYySa5jf+eQXQg==
X-CSE-MsgGUID: X3t47fadSn6uXNsNFZZ+Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="212352943"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.220])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 05:27:53 -0800
Date: Wed, 11 Feb 2026 15:27:50 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: johannes.goede@oss.qualcomm.com
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>, soufianeda@tutanota.com,
	linux-staging@lists.linux.dev, Andy Shevchenko <andy@kernel.org>,
	linux-media@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] staging: atomisp: fix heap buffer overflow in
 framebuffer conversion
Message-ID: <aYyD1rUzNT_2muyf@smile.fi.intel.com>
References: <20260210-atomisp-fix-v1-1-024429cbff31@tutanota.com>
 <aYt-vrc7h7CJOmSu@stanley.mountain>
 <aYw5q_gsHOmKAIhK@kekkonen.localdomain>
 <8efb3705-42f3-40c5-9631-d72eb2dda74a@oss.qualcomm.com>
 <aYxqjBSI-t8Jk9UF@smile.fi.intel.com>
 <b8ca670f-c45b-487e-9e29-2b097c1d5c17@oss.qualcomm.com>
 <aYxuCyTizpKM4Ul1@kekkonen.localdomain>
 <83b1b61c-828c-43eb-b297-8e4d8dc014be@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83b1b61c-828c-43eb-b297-8e4d8dc014be@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52605-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,intel.com:dkim,smile.fi.intel.com:mid]
X-Rspamd-Queue-Id: 1DE53124BD2
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 01:31:19PM +0100, johannes.goede@oss.qualcomm.com wrote:
> On 11-Feb-26 12:54, Sakari Ailus wrote:
> > On Wed, Feb 11, 2026 at 12:50:18PM +0100, johannes.goede@oss.qualcomm.com wrote:
> >> On 11-Feb-26 12:39, Andy Shevchenko wrote:
> >>> On Wed, Feb 11, 2026 at 12:28:35PM +0100, johannes.goede@oss.qualcomm.com wrote:
> >>>> On 11-Feb-26 09:11, Sakari Ailus wrote:

...

> >>>> This will cause a bunch of code to turn into dead code, but I would
> >>>> like to keep that code around since when we add support for
> >>>> a parameter buffer queue that code can serve as an example how to send
> >>>> parameters to the ISP.
> >>>
> >>> But it's forever in the Git index, we can remove it, so it's just matter
> >>> of convenience to keep it in a working copy (tree). That being said,
> >>> I would rather drop the dead code to avoid a stream of not-so-useful
> >>> white space, style, and similar cleanups.
> >>
> >> That is a good point, dropping some of the dead-code stemming
> >> from this is fine with me.
> >>
> >> We should probably stop pruning dead code when we get
> >> deep into the helpers to pack things into fw specific
> >> formats.
> > 
> > Either works for me, however the actual IOCTL handling related code
> > contains less redundancy than the rest of the driver. When it comes to this
> > patch, I'd keep the changes small allow easy backporting.
> 
> Ack, as said we can start with a patch just dropping the
> default ioctl handler. That should be easy to backport.
> 
> Removing some of the then unused functions can be done as
> followup patches.

I am on the same page.

-- 
With Best Regards,
Andy Shevchenko



