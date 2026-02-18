Return-Path: <linux-media+bounces-53043-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHYPEVyglWlcSwIAu9opvQ
	(envelope-from <linux-media+bounces-53043-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 12:19:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5073C155D73
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 12:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D65B3016EF5
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 11:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97615309F0D;
	Wed, 18 Feb 2026 11:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZPGmGF/Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B8E1EB5F8
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 11:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771413591; cv=none; b=SCmYiZBCpPt3O19lNaFy3rg2Omts6X3gdhUkY9kiHxgSZYp9DCzFcInaYE5uJ9IKtCksST1kndpdsla2tp6C721aMvLMwltfu5v43K34hHyI1SjMODdBFdUJacQAsTB10MKlLCcc3MSRyfJYQepqKet0110GaViprm0YXWpGh4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771413591; c=relaxed/simple;
	bh=SbRVOhtErEqdDWWF7OT0Nrr4V9/Q1cEw2n5cqavB+5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q04mNYahcNch+egErHcR1VFdOpJsqkYACFPxao7W/7Ausq65Kh75IR7YAlZT4Es4VVv46ZVIY+kCnVlFCjuWKbWNerLpApE9xqY5JOakcs7oHd2IAEQs9lBBadWDu5WKeg8aqvc6KQmdIkg1QNMOjUYfUTpa1LvsaeRzqxHrGnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZPGmGF/Y; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771413589; x=1802949589;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SbRVOhtErEqdDWWF7OT0Nrr4V9/Q1cEw2n5cqavB+5g=;
  b=ZPGmGF/Y/wfgZpqkhRFmtc7o3riHm1QL8OFoTRjKJ1D0twMGdsTh/5Jh
   GEx4ipdgR7Oinz5lmcQNfKEyNnWBtBhKgOlRCSP7JSDvMF65wXXgCDZ01
   aTEubs59+msQmXyZdbV2X3wbDOL1zd2mrVAVIWpZs8FxEGD3unDlGFwtZ
   QbK52GJ1TQvI58aN6z5v6D01ujgVK+/a264TG4rC3nYrhteGH373/iEeF
   Qayuxedfa7iYwtJEPxVMEKEb7dXJI2AUYqxx5GI4J9z70u0+ImmShAFyh
   bknbWQCXPzclgMDsHCGx5to8/PiWowcINr2A1NzW6kvcpWZBTKppRifcP
   g==;
X-CSE-ConnectionGUID: tST61sybSRKCWD7VUrmeOA==
X-CSE-MsgGUID: vZelKF8ATS21oiqd7/iSRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="60056583"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="60056583"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 03:19:48 -0800
X-CSE-ConnectionGUID: iRsMZ6v/S/aQFUojwlc6+g==
X-CSE-MsgGUID: cWnhTR3mQgyNA2Jn3t1h9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="212272030"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.5])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 03:19:47 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8C54E121D50;
	Wed, 18 Feb 2026 13:20:10 +0200 (EET)
Date: Wed, 18 Feb 2026 13:20:10 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [raw2rgbpnm PATCH v3 2/3] Add compiler options to avoid warnings
Message-ID: <aZWganf2JP1muCEs@kekkonen.localdomain>
References: <20260218083424.2432541-1-sakari.ailus@linux.intel.com>
 <20260218083424.2432541-3-sakari.ailus@linux.intel.com>
 <20260218102736.GC520738@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218102736.GC520738@killaraus.ideasonboard.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-53043-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 5073C155D73
X-Rspamd-Action: no action

Hi Laurent,

On Wed, Feb 18, 2026 at 11:27:36AM +0100, Laurent Pinchart wrote:
> On Wed, Feb 18, 2026 at 10:34:23AM +0200, Sakari Ailus wrote:
> > Add -Wno-missing-field-initializers option to avoid warnings on modern
> > GCC.
> 
> Maybe I should have mentioned that explicitly in v1, but I would also
> fix the code instead of disabling the warning.

Since when has it been preferred to require initialising every field in a
struct? We don't do it in the kernel either... nor this is C++.

> 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index ab363501a212..7545682dbcce 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1,7 +1,7 @@
> >  CROSS_COMPILE ?=
> >  
> >  CC	:= $(CROSS_COMPILE)gcc
> > -CFLAGS	?= -O2 -W -Wall -Iinclude
> > +CFLAGS	?= -O2 -W -Wall -Iinclude -Wno-missing-field-initializers
> >  LDFLAGS	?=
> >  
> >  %.o : %.c
> 

-- 
Regards,

Sakari Ailus

