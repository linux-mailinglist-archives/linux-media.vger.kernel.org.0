Return-Path: <linux-media+bounces-53836-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAVbFtzIommy5QQAu9opvQ
	(envelope-from <linux-media+bounces-53836-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 11:52:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E261C2501
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 11:52:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC488303EBB4
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 10:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86AEB421F06;
	Sat, 28 Feb 2026 10:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bj7DtuUV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45AD428464
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 10:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772275930; cv=none; b=bSPWjOpgpXLaqYEAOMC9bMfhwrnmnY+uFMHMlqzzEdvcR6vWafr+6cUH0tejeOt99EFVELYf7QYfeZF+dV0zLkwUkD5+VajfbsRkm5lOUoIJURU9OBTSepiISaJmn4FgFYXWHCnGHu9FHRmHTJl4eBQMH1I6qpxfOlqSd3QSJkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772275930; c=relaxed/simple;
	bh=rYLbzvI0bc1WQ7qZxTZvQwV+mqhzjYhcH3SkBHv82r8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjNRgq30tXFxvOFZJxzm6XSVAB+6w6bRlKsijIxJyzwNv2mr5n1FE+U/lPh0o7T5mlENnl9dwjcrqBoF9AwMc/PslEoO75xeZQ2an5Mu1VW6sDOH+fGQGFe7dRCBQKslAUeSQIcFW1NELJIwv2RGfG6JPTEPdbvVXkcW6XEVQAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bj7DtuUV; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772275928; x=1803811928;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rYLbzvI0bc1WQ7qZxTZvQwV+mqhzjYhcH3SkBHv82r8=;
  b=bj7DtuUVvUTpFzh9b7sy0TVmmttenGVHYTkJp91fUDLBwz4yqKjGGhqd
   8D2tyKTeSD7py9azSW4f4EkEMavWYLXLgq6QqwYRVukb2GJbq2fc4WnfA
   9LoQPV4vWdD2ZqpHSHs6Q1ysmD/KbJkXQdi7IP8jXAGGAVHDVrHp5MD72
   fT9ZDcJ3keu6iUm9N5ItPMdokIL04nq5QG57FVnejKEXNU0eq7wD6oDk/
   IaR9Zfw+ddce4oqC4eoyCAkcinkEOWBfcSD0msJkoA3yb/qK0EU9vm1uR
   dqOiUPWJaaLU7HstkmjiJ9vXfrej1dsKENPXt48Ll5pwolBuk9wUhh1qt
   Q==;
X-CSE-ConnectionGUID: uGZImFVFTAauvLBCt0qN5g==
X-CSE-MsgGUID: T+WasVC8SVuqikbH9bxRYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="90926397"
X-IronPort-AV: E=Sophos;i="6.21,316,1763452800"; 
   d="scan'208";a="90926397"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 02:52:07 -0800
X-CSE-ConnectionGUID: 0PQSA69VS7GBrAfx1adZXQ==
X-CSE-MsgGUID: tXFUMXZtR8W3GGRz1HXIpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,316,1763452800"; 
   d="scan'208";a="216384219"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.224])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 02:52:05 -0800
Date: Sat, 28 Feb 2026 12:52:02 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, andy@kernel.org, hansg@kernel.org,
	mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	Soufiane Dani <soufianeda@tutanota.com>
Subject: Re: [PATCH 1/1] staging: media: atomisp: Disallow all private
 IOCTLSs but S_PARAMETERS
Message-ID: <aaLI0jBqUQiJEJTz@ashevche-desk.local>
References: <20260227092327.3654603-1-sakari.ailus@linux.intel.com>
 <aaFkcS1fMVLxGB87@smile.fi.intel.com>
 <aaF34slAiw7vOJGl@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaF34slAiw7vOJGl@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53836-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C5E261C2501
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 12:54:26PM +0200, Sakari Ailus wrote:
> On Fri, Feb 27, 2026 at 11:31:29AM +0200, Andy Shevchenko wrote:
> > On Fri, Feb 27, 2026 at 11:23:27AM +0200, Sakari Ailus wrote:
> > > Disallow all private IOCTLs except ATOMISP_IOC_S_PARAMETERS. These aren't
> > > quite as safe as one could assume of IOCTL handlers; disable them for now.
> > > Instead of removing the code, simply check the IOCTL matches with
> > > S_PARAMETERS and bail out otherwise, in order to ease backporting.
> > 
> > > In particular, ATOMISP_IOC_S_ISP_FPN_TABLE is disabled by this patch.
> > 
> > Why not removing the code?
> > It's still and will be in the Git index, it won't disappear.
> 
> There have been changes in the IOCTL handler over the supported kernel
> versions. This patch can be backported all the way down to v5.10.
> 
> I'm fine with removing the now-redundant code, but I'd rather do it
> separtely from fixing the issue at hand.

Fair enough,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



