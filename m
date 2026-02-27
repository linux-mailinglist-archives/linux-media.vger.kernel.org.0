Return-Path: <linux-media+bounces-53689-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAEbIQR4oWnJtQQAu9opvQ
	(envelope-from <linux-media+bounces-53689-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 11:55:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 475851B63FA
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 11:54:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 82B35300F7AE
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 10:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66FB36D4E4;
	Fri, 27 Feb 2026 10:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LXDjrLM3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122F536E48F
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 10:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772189643; cv=none; b=DOjsTU66KwT9Akc66iw87NOWGOeyMzOpe1Er4o/fxFb3VT6LOt7w2tlMbAN2u0YSr4ebihFomQmidvQFSf4/obHuAcUM7M0i9U2war1yeWMb1hQ8AzcHFuexrxwYoN8M3iXby08tTtxf5cV3a2JLAL4D6iU8qCWCPaMDK2LqZB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772189643; c=relaxed/simple;
	bh=kO+XTmDOsNEEx74+zD/4AjlfNI1loK9wTjl2o7uCpnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tdEOqNbzzl+KmOXyz/y8mG5ZZNnoYqQacqQncHTB7VaS201KBr0fIqonSCiyol1fGeMdg9WZRKtrh+rYOR6apCXyEyCCKHRbmZGCVk9pc+pC0hVPu+TBqGkJ3FEBKD6LNNzpc7+DELABFUJwtQBIG9eo5HgLy6dRWlKDltmY9So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LXDjrLM3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772189641; x=1803725641;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kO+XTmDOsNEEx74+zD/4AjlfNI1loK9wTjl2o7uCpnc=;
  b=LXDjrLM3SFfp+PNJHWab21KPu9z6Y9FyiZ2935NnWMtI7E/A4bso1qb0
   zenMHwjy74rtKDBeNDiaO+PWNPRzoK4rzZtRFbWLDyEbhwabWpv2lb92z
   ACrkFQU5r95UidSlkQV/RaRsKUlryHa15tSq1GgKSgl1/E3HLMjVL7yub
   AxtUvAxfV6BphY29zmRFzg6kUEKtZaK3+doADz413fCXpESEZlNd5Xq/U
   avykYPfFeCb7oqUg51HQhI0BK5jy/3KRiRJ9/lc3frcH60FeWQQZgrqQH
   622rqfvA3kyRAuA7z6mFTW1lAqRjZyFo2P3WAYjN05q14TvUPYVWETnQH
   Q==;
X-CSE-ConnectionGUID: UyR147/oSEmycBXpSkxYqQ==
X-CSE-MsgGUID: 3f+bpj6GSRqi846sjTvH2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="90672694"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="90672694"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 02:54:00 -0800
X-CSE-ConnectionGUID: 9ItbOOuOS16RoZrtXOyxqw==
X-CSE-MsgGUID: QnalAIfDQ5OCYXWNt1ag/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="254643993"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.120])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 02:53:58 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 73905120FD6;
	Fri, 27 Feb 2026 12:54:26 +0200 (EET)
Date: Fri, 27 Feb 2026 12:54:26 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-media@vger.kernel.org, andy@kernel.org, hansg@kernel.org,
	mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	Soufiane Dani <soufianeda@tutanota.com>
Subject: Re: [PATCH 1/1] staging: media: atomisp: Disallow all private
 IOCTLSs but S_PARAMETERS
Message-ID: <aaF34slAiw7vOJGl@kekkonen.localdomain>
References: <20260227092327.3654603-1-sakari.ailus@linux.intel.com>
 <aaFkcS1fMVLxGB87@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaFkcS1fMVLxGB87@smile.fi.intel.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53689-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 475851B63FA
X-Rspamd-Action: no action

Hi Andy,

On Fri, Feb 27, 2026 at 11:31:29AM +0200, Andy Shevchenko wrote:
> On Fri, Feb 27, 2026 at 11:23:27AM +0200, Sakari Ailus wrote:
> > Disallow all private IOCTLs except ATOMISP_IOC_S_PARAMETERS. These aren't
> > quite as safe as one could assume of IOCTL handlers; disable them for now.
> > Instead of removing the code, simply check the IOCTL matches with
> > S_PARAMETERS and bail out otherwise, in order to ease backporting.
> 
> > In particular, ATOMISP_IOC_S_ISP_FPN_TABLE is disabled by this patch.
> 
> Why not removing the code?
> It's still and will be in the Git index, it won't disappear.

There have been changes in the IOCTL handler over the supported kernel
versions. This patch can be backported all the way down to v5.10.

I'm fine with removing the now-redundant code, but I'd rather do it
separtely from fixing the issue at hand.

-- 
Regards,

Sakari Ailus

