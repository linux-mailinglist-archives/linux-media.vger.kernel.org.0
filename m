Return-Path: <linux-media+bounces-54466-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGZODqUwqGm+pQAAu9opvQ
	(envelope-from <linux-media+bounces-54466-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 14:16:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88086200416
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 14:16:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C672306BC12
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 13:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F4A4288510;
	Wed,  4 Mar 2026 13:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Js9EQhZI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BDA28506A
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 13:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772630086; cv=none; b=UzmVaJWw4U6ZvyPYWEOPTKdaLQoi8+VpOszA+YTNGxSDzUFRESre/RrEbpA8UIqc6rJgX2aTbPwiXQE1Jp+4GM6nGj4xCurj7k+H53rfcTb2cOB1HgqzAXpZyPyvUcpHIheHqeGB3WGG5RLjjPju6no5yqgBP0hTc1tUouXarbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772630086; c=relaxed/simple;
	bh=KB1YQfn4YpIU2P8e55rN6KeP15OqymvRlqQrhehKSjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fBNwdXHducv3Hvyyrz72kaWPi6EDL9FFDtXI06wny9bvj3dyvN2bxLunS1H672U/kDS5MsNTejB7u9mgUYB1st2C82Hk/uLhc9HY0AJXtZCfLkQA1BjPJ+2JyNAcUBh4oo0qgQGmvO32iRJSH9rNSAPZoiON6DjKfW3NrVddqzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Js9EQhZI; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772630085; x=1804166085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=KB1YQfn4YpIU2P8e55rN6KeP15OqymvRlqQrhehKSjQ=;
  b=Js9EQhZIQ2Mw4H7SAGoD2dKMSwe+loBsf8plv2mcS+Jklj39V6DpTjty
   7KItFV5Sfp/3pU7e7gGuLcHLzgizB2jQt2W2b+CsyhZe6r51Nj510cmya
   TJiDO01seXFkBHBEsdQzL7YP3I9/cf0n38iZ1PiQ2tJLZu0zLAwUwV0CN
   vBPBUXUP4v8B7usQs3xgwoKR3gy34TZ27/9sguQMvKc3CDW5dZHYL/089
   fhl4XoN5bK0sHH6IDKZc1bIRQ0cs+6MlZ12bHlCSoAWZ+aXDdtqZ0SrQH
   3X61f0VM0y1gcQs/eNNLqIMybi4YYiJAH6ICsIL2IeDCHu3ac/lY6eaYB
   A==;
X-CSE-ConnectionGUID: G3bwDK+KRcuQKp4efiuhMA==
X-CSE-MsgGUID: 0PrBRziWRPyIY4GJISNI/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="85033455"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="85033455"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 05:14:44 -0800
X-CSE-ConnectionGUID: 2zbMfCvmQqSP7Yx7Bc6QGw==
X-CSE-MsgGUID: SF1C7PWCRmiBj4tfQ8M84Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="222506654"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.233])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 05:14:42 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8A689121D1E;
	Wed, 04 Mar 2026 15:15:10 +0200 (EET)
Date: Wed, 4 Mar 2026 15:15:10 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-media@vger.kernel.org, andy@kernel.org, hansg@kernel.org,
	mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	Soufiane Dani <soufianeda@tutanota.com>
Subject: Re: [PATCH 1/1] staging: media: atomisp: Disallow all private IOCTLs
Message-ID: <aagwXpJCKZ72Bw_b@kekkonen.localdomain>
References: <20260303083501.3886922-1-sakari.ailus@linux.intel.com>
 <CAHp75VdaYxvQ+tx51WDPFYSzFOSWqHqFKB4xaNTOt-rx4O9CPw@mail.gmail.com>
 <aabfJEGDJGGP49bS@kekkonen.localdomain>
 <aabnORpRlVBN5_aj@ashevche-desk.local>
 <aaflMrn55oP0_3JJ@kekkonen.localdomain>
 <CAHp75Ve+ntMquDiG12Qoz5HwQPVceXQHzo3ef4nJT8ep22Q=iA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Ve+ntMquDiG12Qoz5HwQPVceXQHzo3ef4nJT8ep22Q=iA@mail.gmail.com>
X-Rspamd-Queue-Id: 88086200416
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54466-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
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
	NEURAL_HAM(-0.00)[-0.962];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid,intel.com:dkim,intel.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Andy,

On Wed, Mar 04, 2026 at 01:08:42PM +0200, Andy Shevchenko wrote:
> On Wed, Mar 4, 2026 at 9:54 AM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> > On Tue, Mar 03, 2026 at 03:50:49PM +0200, Andy Shevchenko wrote:
> > > On Tue, Mar 03, 2026 at 03:16:20PM +0200, Sakari Ailus wrote:
> > > > On Tue, Mar 03, 2026 at 11:21:02AM +0200, Andy Shevchenko wrote:
> > > > > On Tue, Mar 3, 2026 at 10:34 AM Sakari Ailus
> > > > > <sakari.ailus@linux.intel.com> wrote:
> 
> ...
> 
> > > > > > Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
> > > > >
> > > > > Is it the correct one? Driver was before that, so I believe this needs
> > > > > to go deeper.
> > > >
> > > > Technically yes, but even this one is from 2020 and the patch removing it
> > > > was merged in 2018, for v4.18. These aren't supported anymore.
> > >
> > > It doesn't matter, the Fixes should be correct one, the Revert patch is not
> > > the initial one where the code appeared.
> >
> > Both patches actually separately introduce the bug. I'll use both Fixes:
> > tags then.
> 
> WFM, thanks!
> 
> ...
> 
> > > > > > +       /* Disable all private IOCTLs for now! */
> > > > > > +       if (cmd)
> > > > > > +               return -EINVAL;
> > > > >
> > > > > Maybe even a warning?
> > > >
> > > > That'd be just filling the logs, wouldn't it?
> > >
> > > dev_warn_once()
> >
> > Would that warning be useful? We don't warn about other unsupported IOCTLs
> > either...
> 
> The question here: will it be helpful to speedup / motivate moving
> users to the standard IOCTLs? If not, no need.

It won't: you can't set the IPU processing block parameters with private
IOCTLs disabled.

-- 
Kind regards,


Sakari Ailus

