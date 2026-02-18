Return-Path: <linux-media+bounces-53044-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOLqEbmglWlcSwIAu9opvQ
	(envelope-from <linux-media+bounces-53044-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 12:21:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6881155D8C
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 12:21:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6548830268BF
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 11:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D3C309EFC;
	Wed, 18 Feb 2026 11:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MHc5dRLb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C1B23ABBE
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 11:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771413670; cv=none; b=hBi4JRvGVrWT/eZGoDKO+kEHn5LP5dqX7z1hKDUmkhkNkqe91wbtwBQVXLpoVmOjs0NsUVhi/YErWnaZxulXHMx8x6nAnk3OKrtEyh39s8xA/jRpey2cNKt4Iqo67T3+Y50J5lys5kHxW0pylTIispCKy0ygo4G48xvhF66/aHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771413670; c=relaxed/simple;
	bh=mEosZ6KNRMoZ9awgSjV7IChgMsbyKJT4xzcKjvyTSqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vld6TlrINcxYWsYYdF45/quylhNgRWRiR9xACmU2GPZDrV2AZGZp9mOXkUzdDVkAELecSHwrGYHgKgGRnoyFW6xFW+l2uF5L01Ld4WT6LzWXELtSplJgtzNK3dj5tZU14s7/OhisZUytkWaeaqW0imKGws3gR97OMu+kP8uBYyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MHc5dRLb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771413669; x=1802949669;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mEosZ6KNRMoZ9awgSjV7IChgMsbyKJT4xzcKjvyTSqg=;
  b=MHc5dRLbxPW4/e2KbJ6ZY2pwO/Pol7BgGjDRCraTaBUl0egQCOaZ2HYR
   EEgEUUpQgbY1R3OtlpoJJmZw/XUUQHe5SLT6ze/xwg5fYmKu/MmvOvNJY
   1UJbY8IGtmKp/8YkMsE576c+76RRLJbXThcTQWzm1Jfz3PFmjoUGh1iLS
   zeLxP+x8txugVtoZa5C7t374R2cehG2tzwtUZQwdoFIborOsZ0H/79+Aq
   eGPdLtt5HsbVSEA3FRTCc0e0j5uIWrexUtJiHpfx3Iea88FuTV2nxuDIx
   3+fl5P86vRuTnvp6tsz2R4aGd/4s9jqQvhrfjPDzcQJShuFEXIeTherFD
   A==;
X-CSE-ConnectionGUID: 0JWzYLw3S/G+nBIIep5x/A==
X-CSE-MsgGUID: UDylq8EzTPqJOuO8//UcKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="83934490"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="83934490"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 03:21:08 -0800
X-CSE-ConnectionGUID: PRna6cjjQTGUQtUh+79WRA==
X-CSE-MsgGUID: +JZ+IZm6R1mljnUbr7L81A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="219159448"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.5])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 03:21:07 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7D0CE121D50;
	Wed, 18 Feb 2026 13:21:30 +0200 (EET)
Date: Wed, 18 Feb 2026 13:21:30 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [raw2rgbpnm PATCH v3 1/3] Add explicit switch fallthrough
 notation
Message-ID: <aZWgunfrSSxxTXEA@kekkonen.localdomain>
References: <20260218083424.2432541-1-sakari.ailus@linux.intel.com>
 <20260218083424.2432541-2-sakari.ailus@linux.intel.com>
 <20260218102618.GA57525@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218102618.GA57525@killaraus.ideasonboard.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-53044-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: B6881155D8C
X-Rspamd-Action: no action

Hi Laurent,

On Wed, Feb 18, 2026 at 11:26:18AM +0100, Laurent Pinchart wrote:
> On Wed, Feb 18, 2026 at 10:34:22AM +0200, Sakari Ailus wrote:
> > Use __attribute__((fallthrough)) instead of a comment this is taking
> > place, to make modern GCC happy.
> 
> This will require gcc 7 or newer, which I think is fine. You could check
> the compiler version at build time and emit an error if the compiler is
> not recent enough (and you could use that as an opportunity to switch
> from make to meson :-)). This is of course out of scope for this series.

That could be interesting. Although there are just three .c files to
compile, I think make can do it. ;-)

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks, but the patches have been already merged. I'll use this for a
future patch. :-D

-- 
Kind regards,

Sakari Ailus

