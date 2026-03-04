Return-Path: <linux-media+bounces-54423-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KbmADjnp2mDlgAAu9opvQ
	(envelope-from <linux-media+bounces-54423-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 09:03:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FBB1FC1E0
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 09:03:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5422630D3ECC
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 07:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D36737F8B5;
	Wed,  4 Mar 2026 07:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KAax5lPK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C787B3914F0
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 07:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772610843; cv=none; b=YY5MVOBwVa9Tgn6A3xXE2h1DPQLGaKoL9A4irLwi6/083qrnzYIaAhRBK0QUEz1lmT/ZGDmB1zRJlxdgS9wTzbXSVDuSiQ38wRD94/DdL6L8zsIpk1jnVC9jNXTPmAHg2JfoYbHArMxNcHJo+ErdWi96PWvb9xKZApZ17zFPkAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772610843; c=relaxed/simple;
	bh=26fiH1if8gs9ZxlWdfCJaqGAk6CuKqNZrTLX0ZO0ueA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JM0GuRqDXFg0tZAI20EDQVP3LKmUwp5xTKsj17n/VJQGK28HvCTuC7xMQc4CdgKh8uD8msmAvE7N8xY8lMpFAaYiqfpOFbyBkYyN+4oH43OCdmke/b4WvlmXIQHQ85HajrSiPwkBQEEPOlFJCthicLRizVz56KfbFzGLXjG2wsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KAax5lPK; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772610841; x=1804146841;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=26fiH1if8gs9ZxlWdfCJaqGAk6CuKqNZrTLX0ZO0ueA=;
  b=KAax5lPKUc7IjRinQZEL4g4drZ+T+MLG8ooWPUn2YIcuUEqZwE0h3ENk
   z2V1PVyMua7svuJmns8rpmp5WLQ0QdFrEdptES+R1AgL76s3t6boTFU54
   DizS5bPgvo6JfX19xni1/tuUT5L2CuZQeAGj0NGmcAALKMvrlXRmAfjHu
   A82thOfOyKgM6b3fcV7zQhX6fpTzole7UK83Vgcu6mXlra2PS+bb9C5Nj
   CQOTRZNP7xsdQUZEqopmFPWxmWiUktfagFy9Fnn9+AWIrZ/IFpMedZgt1
   e7txyQ3xzkDSnDPuZWM18mHHZIOdcJT5M3TeL9TEDzjOdiq2k0SpYUtfD
   A==;
X-CSE-ConnectionGUID: ocHu/BOjQdul6nbCbisEGg==
X-CSE-MsgGUID: 08I8DikuQKKmaOfLypbzUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="84755298"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="84755298"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 23:54:01 -0800
X-CSE-ConnectionGUID: /Y+pchhJT0+pi1mJj1ORLw==
X-CSE-MsgGUID: A4BBVG+tRfGI7TqWdZ2t+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="215662894"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.163])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 23:53:58 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DCF2C121D1E;
	Wed, 04 Mar 2026 09:54:26 +0200 (EET)
Date: Wed, 4 Mar 2026 09:54:26 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-media@vger.kernel.org, andy@kernel.org, hansg@kernel.org,
	mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	Soufiane Dani <soufianeda@tutanota.com>
Subject: Re: [PATCH 1/1] staging: media: atomisp: Disallow all private IOCTLs
Message-ID: <aaflMrn55oP0_3JJ@kekkonen.localdomain>
References: <20260303083501.3886922-1-sakari.ailus@linux.intel.com>
 <CAHp75VdaYxvQ+tx51WDPFYSzFOSWqHqFKB4xaNTOt-rx4O9CPw@mail.gmail.com>
 <aabfJEGDJGGP49bS@kekkonen.localdomain>
 <aabnORpRlVBN5_aj@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aabnORpRlVBN5_aj@ashevche-desk.local>
X-Rspamd-Queue-Id: E4FBB1FC1E0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,linuxfoundation.org,lists.linux.dev,tutanota.com];
	TAGGED_FROM(0.00)[bounces-54423-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,intel.com:email]
X-Rspamd-Action: no action

Hi Andy,

On Tue, Mar 03, 2026 at 03:50:49PM +0200, Andy Shevchenko wrote:
> On Tue, Mar 03, 2026 at 03:16:20PM +0200, Sakari Ailus wrote:
> > On Tue, Mar 03, 2026 at 11:21:02AM +0200, Andy Shevchenko wrote:
> > > On Tue, Mar 3, 2026 at 10:34 AM Sakari Ailus
> > > <sakari.ailus@linux.intel.com> wrote:
> > > >
> > > > Disallow all private IOCTLs. These aren't quite as safe as one could
> > > > assume of IOCTL handlers; disable them for now. Instead of removing the
> > > > code, return in the beginning of the function if cmd is non-zero in order
> > > > to keep static checkers happy.
> > > >
> > > > Reported-by: Soufiane Dani <soufianeda@tutanota.com>
> > > > Closes: https://lore.kernel.org/linux-staging/20260210-atomisp-fix-v1-1-024429cbff31@tutanota.com/
> > > > Cc: stable@vger.kernel.org
> > > 
> > > > Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
> > > 
> > > Is it the correct one? Driver was before that, so I believe this needs
> > > to go deeper.
> > 
> > Technically yes, but even this one is from 2020 and the patch removing it
> > was merged in 2018, for v4.18. These aren't supported anymore.
> 
> It doesn't matter, the Fixes should be correct one, the Revert patch is not
> the initial one where the code appeared.

Both patches actually separately introduce the bug. I'll use both Fixes:
tags then.

> 
> ...
> 
> > > > +       /* Disable all private IOCTLs for now! */
> > > > +       if (cmd)
> > > > +               return -EINVAL;
> > > 
> > > Maybe even a warning?
> > 
> > That'd be just filling the logs, wouldn't it?
> 
> dev_warn_once()

Would that warning be useful? We don't warn about other unsupported IOCTLs
either...

-- 
Sakari Ailus

