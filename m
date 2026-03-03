Return-Path: <linux-media+bounces-54361-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QO9gBhTfpmlkYAAAu9opvQ
	(envelope-from <linux-media+bounces-54361-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 14:16:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E115F1F009E
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 14:16:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0BC073021C13
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 13:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB73E2D3EE5;
	Tue,  3 Mar 2026 13:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEU8T0mk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17D4175A8E
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 13:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772543756; cv=none; b=TSeuYBjwf2va3SKy06qTEDBr6m3+zfFzB6CBaXfhGjUiRFWHTu6qQFdUNAZuZA7JiotAr4AhJJgiMDI0d7xPlvTmEn91ANzEnDHXqggPNO75YdQO3SQ+APRh/N5Hal7sVJWxxJeUOw0sPB8J1gVzWiwD27eHaiY+0lfQbRCl6Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772543756; c=relaxed/simple;
	bh=Og/mbq1aFjzQa/su5PtWZ0EzrKzhz08S+BwJ8Ue+PzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f9gjdBP1x+14yL9MBXEIXuZWJhxv+LNX3VXU8UfMEoXrq/yYDNYo4FSnrukjrRCGfeSHAzn+6SM71GdRuHSqsuWt42wNvsP8H7looGGRFOwz/khJ5VEcZ2mgBjOUSqixJP2fWtbeQORHZo2Fe7GD5nBNbkKU0HYsLoM0UmXw7ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEU8T0mk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772543755; x=1804079755;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Og/mbq1aFjzQa/su5PtWZ0EzrKzhz08S+BwJ8Ue+PzA=;
  b=TEU8T0mkyqscX18NrBQovLNMxLkq0w9JzJ+MrF1FlQYi62h0Mn/8sKzL
   gq4ko4UUw4QDYMneXnSa08qrHqbislSNCW75Oseyc34go3fDTRwOh7TAv
   wwzk2FNQ4cJoGY5AWojjN/m+h89cMZ/VSJ5FJ7DbTF8GUc+swgyMl5QD4
   ovT9gFySIpnwQP/dIYA1+6w4e5SsjtywzK4TBbrprDjq4Nhz1tZiHPPV+
   YW+bOZwvBJyHJvRyw+FDHIq7uJP6HB7Ou0g+aoZAGn+1gy7hs2jJ6Uhqt
   oeluI8D9AGBknbDW2gBFeAeqKO/+vCaBL7OulSR8RLpqkPujQWxdb0Vce
   Q==;
X-CSE-ConnectionGUID: AoPHa/QETq6ZZvi07rVuuw==
X-CSE-MsgGUID: qaJJ0Al0SKiNB80AHVtgyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73486557"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="73486557"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 05:15:54 -0800
X-CSE-ConnectionGUID: ff9yUu72ShyVFPcebmQYGQ==
X-CSE-MsgGUID: vrbUjTQlRJeXpfwXI4MpUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="248492563"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.242])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 05:15:52 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 980B9121D1D;
	Tue, 03 Mar 2026 15:16:20 +0200 (EET)
Date: Tue, 3 Mar 2026 15:16:20 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-media@vger.kernel.org, andy@kernel.org, hansg@kernel.org,
	mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	Soufiane Dani <soufianeda@tutanota.com>
Subject: Re: [PATCH 1/1] staging: media: atomisp: Disallow all private IOCTLs
Message-ID: <aabfJEGDJGGP49bS@kekkonen.localdomain>
References: <20260303083501.3886922-1-sakari.ailus@linux.intel.com>
 <CAHp75VdaYxvQ+tx51WDPFYSzFOSWqHqFKB4xaNTOt-rx4O9CPw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VdaYxvQ+tx51WDPFYSzFOSWqHqFKB4xaNTOt-rx4O9CPw@mail.gmail.com>
X-Rspamd-Queue-Id: E115F1F009E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54361-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:dkim,intel.com:email]
X-Rspamd-Action: no action

Hi Andy,

On Tue, Mar 03, 2026 at 11:21:02AM +0200, Andy Shevchenko wrote:
> On Tue, Mar 3, 2026 at 10:34 AM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Disallow all private IOCTLs. These aren't quite as safe as one could
> > assume of IOCTL handlers; disable them for now. Instead of removing the
> > code, return in the beginning of the function if cmd is non-zero in order
> > to keep static checkers happy.
> >
> > Reported-by: Soufiane Dani <soufianeda@tutanota.com>
> > Closes: https://lore.kernel.org/linux-staging/20260210-atomisp-fix-v1-1-024429cbff31@tutanota.com/
> > Cc: stable@vger.kernel.org
> 
> > Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
> 
> Is it the correct one? Driver was before that, so I believe this needs
> to go deeper.

Technically yes, but even this one is from 2020 and the patch removing it
was merged in 2018, for v4.18. These aren't supported anymore.
> 
> ...
> 
> > +       /* Disable all private IOCTLs for now! */
> > +       if (cmd)
> > +               return -EINVAL;
> 
> Maybe even a warning?

That'd be just filling the logs, wouldn't it?

> 

-- 
Regards,

Sakari Ailus

