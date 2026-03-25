Return-Path: <linux-media+bounces-56959-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIo9JJujw2lssQQAu9opvQ
	(envelope-from <linux-media+bounces-56959-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 09:58:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 312E7321BCD
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 09:58:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1D04F305378F
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 08:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389C939A81E;
	Wed, 25 Mar 2026 08:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eRBgMWtd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E3739A7F5;
	Wed, 25 Mar 2026 08:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774428983; cv=none; b=r5lsobUq5R/raoioR0yz86oUt5mA43gJPsGLB8lTqgZpu3yYxpXIIvykypJBucKyju9JWsJalqVLOg8Xe4taqPHVB9nGNBrhU4Nfdv6TSAwNfkm+SYpV3ylJ13W6YvwFzlfDQkJ7rm9PasuUYvNXt9L0PLdNq+g0W4JmdyoERoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774428983; c=relaxed/simple;
	bh=i3RVsIoEwIF477giVRo9cm7wj/FOUjCy2mU65c2lBJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H0AXlqynwEkL0FMYUuBf8ng1CQVvizofqQ34dyXtdx+BhcN4dv3EgiaPaMlM541N7dRl98epnGEhdeRTJX8osOfmQgDJp7MPPKBrho4nXsa0OqnXnERx+mOYwH5fBi/2UYVqsSpQyFtfJJKYUfbGWKYGGysxlsLTW7edyINUwa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eRBgMWtd; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774428982; x=1805964982;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=i3RVsIoEwIF477giVRo9cm7wj/FOUjCy2mU65c2lBJk=;
  b=eRBgMWtd9QrCbioiGNFmsHhn40IqMLW+3XMUgJuaoR5+hdoU8RvOkuPy
   +r3x3eX4Ng06m7IMiiIKeVP9qmI8I0nNmBqCnqkwf1XHFHS+T0bFFkAjP
   PNSlafGg1HFBwVDQxwiwZ/ac+pSr+DEl/RF0pfkxo/9cEWzheLTKtGNGl
   psEcYgQBXgwOCEx4EqSiXNw/cyvQf0q6q1bsqcROw6rOlTgyd2xjhhlRq
   05WybdAD8BUKHC2TZx6QTQqlJ1UVW+Y2ghDxzhBnpyZugm775j7UeeRz6
   bjS0ZJ7iH2BEZOa9KyzCZpDJRff1W4kA8QQNH4at3cs9dkBCiwmIU7VSO
   Q==;
X-CSE-ConnectionGUID: zqKL9sTIQT2Sfpjj7sAB6w==
X-CSE-MsgGUID: 1JVrUNbAS6ydjKZUZWi5YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86538553"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="86538553"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 01:56:22 -0700
X-CSE-ConnectionGUID: Jb3KGClIT92Ld+xxeCsBIA==
X-CSE-MsgGUID: 9klnmbjCS8aT4HolBNdIAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="247648255"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.64])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 01:56:19 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9354C121CF9;
	Wed, 25 Mar 2026 10:56:23 +0200 (EET)
Date: Wed, 25 Mar 2026 10:56:23 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: "mehdi.djait@linux.intel.com" <mehdi.djait@linux.intel.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 11/13] media: i2c: os05b10: Update active format before
 adjusting framing controls
Message-ID: <acOjN4KiSTXwwciM@kekkonen.localdomain>
References: <20260306123304.76722-1-tarang.raval@siliconsignals.io>
 <20260306123304.76722-12-tarang.raval@siliconsignals.io>
 <PN3P287MB1829E89506AAA47318D694EB8B48A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3P287MB1829E89506AAA47318D694EB8B48A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	FROM_DN_EQ_ADDR(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56959-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,siliconsignals.io:email]
X-Rspamd-Queue-Id: 312E7321BCD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Tarang,

On Tue, Mar 24, 2026 at 04:31:02PM +0000, Tarang Raval wrote:
>  
> Hi Sakari,
> 
> > os05b10_set_pad_format() calls os05b10_set_framing_limits() before updating
> > the ACTIVE format. As a result, the VBLANK control handler uses the old
> > height when recalculating exposure limits, causing -ERANGE when switching
> > to a larger resolution.
> >
> > Update the ACTIVE format before adjusting framing controls so control
> > callbacks use the correct dimensions.
> >
> > Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> > ---
> >  drivers/media/i2c/os05b10.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
> > index 4601e33b7e8f..476dbcb49351 100644
> > --- a/drivers/media/i2c/os05b10.c
> > +++ b/drivers/media/i2c/os05b10.c
> > @@ -902,14 +902,14 @@ static int os05b10_set_pad_format(struct v4l2_subdev *sd,
> >  
> >          format = v4l2_subdev_state_get_format(sd_state, 0);
> >  
> > +       *format = fmt->format;
> > +
> 
> This is the final analysis without this patch.
> 
> Please check the logs in the attached file.
> 
> When switching the resolution from 1280x720 to 2592x1944, the logs show that
> while configuring the 1280 mode from the 2592 mode, the maximum exposure value
> is calculated as 2219 (fmt->height + ctrl->val - exposure margin).
> 
> However, after switching to the 2592 mode, the maximum exposure value is 774.
> 
> From both cases, it is evident that fmt->height is being calculated incorrectly
> It is still using the previous height instead of updating to the new resolution.
> 
> Please share your thoughts. Am I heading in the right direction?

I think the patch is reasonable. It'd be still nice to get reviews from
others before merging this.

-- 
Kind regards,

Sakari Ailus

