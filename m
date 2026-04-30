Return-Path: <linux-media+bounces-60111-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAATLWm/82mw6gEAu9opvQ
	(envelope-from <linux-media+bounces-60111-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 22:45:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B98E54A7E29
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 22:45:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A790E30147AD
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 20:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B6563A6EFE;
	Thu, 30 Apr 2026 20:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/s9OLB2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667A62D7DC8;
	Thu, 30 Apr 2026 20:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777581574; cv=none; b=qFn1RGmmnIhMglNsOQ8fY8AdJ4LNfY3WZP991YcgG/OY9u4U9+4A6JuiWWvabMxWb/KN5AaBVEYAVpOlAuLpGsZHOoSgkeoDof1zXBWQbJ7Tlq+T43+mgAnG0XeAv2B8awr2p7/0Kn17ZP+VOTMA9oNuxIiCCam3qVX1RRsVuwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777581574; c=relaxed/simple;
	bh=XV0KlKpJGNkkyuqPoU+JgbjdJ7HJ8S7BPFQklxCb1OQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=caYcaGPscsY5eLqY/rcfax2Y+7+xCQTB/NOAPQox/h7ndhmKvNwF/SX53ZfBC7UuALVixgYqCl9XnqMVh37j89Qd3xBFlgCjrAtsTgkSW9pwLHrcXXfRdpGMu6rHjzBUSIJR1lioFweiQK2woo6ggLjQZMvVQG1xnYj+5jEC8YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/s9OLB2; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777581573; x=1809117573;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XV0KlKpJGNkkyuqPoU+JgbjdJ7HJ8S7BPFQklxCb1OQ=;
  b=i/s9OLB2RPW7zRzpEzvJdsSRmNqGHOmXVoql01enkAxcIQZlXUncF8Au
   wkhDscgL2bDGelJ1n1Rmt1Xt8apuDt6BrP/dFwFqEC+3AkIJCZDEMIWUk
   bjZbKjuBU8ro9GCJLhegBlzzzl6oEHPV9DBPO+AXFEkJACUkDqzz6oA0U
   EQRQhaIdA5U8fzudy0xgaANXcz5BOtZg2Oe62bdQrYfx02jGNa65vwSne
   Y3kCZLYkLlv5B8i8WKM6vO2bubdlceAgoLlQxNahD2lpsrRQKUz2g/jve
   ofsCAfXXkkElrlE4LaTeqCcFpdxy87GJs5/YSZ5L7YHMlmxfetjf7oq7s
   Q==;
X-CSE-ConnectionGUID: ydf39g2FTIG24xjLkOt9FA==
X-CSE-MsgGUID: ih0PNN1zQmaUc/FxByjrng==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="82402534"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="82402534"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 13:39:32 -0700
X-CSE-ConnectionGUID: FVXuOmnKQeK0SGZNTwPwEg==
X-CSE-MsgGUID: iDbhXFaxS8CFdZsBMG++Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="239698255"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.197])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 13:39:30 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AC3C8121CC0;
	Thu, 30 Apr 2026 23:39:34 +0300 (EEST)
Date: Thu, 30 Apr 2026 23:39:34 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: hi846: Add 6MP and 8MP modes support
Message-ID: <afO-Bg5PrPn9mnnp@kekkonen.localdomain>
References: <20260429070351.1307204-1-mitltlatltl@gmail.com>
 <20260429070351.1307204-3-mitltlatltl@gmail.com>
 <afHI29SDHDggH2Wt@kekkonen.localdomain>
 <CAH2e8h5mGfYZiG+Uy05xp9cDxy_7uAZ46ywHYrK5VYavLyLtrQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH2e8h5mGfYZiG+Uy05xp9cDxy_7uAZ46ywHYrK5VYavLyLtrQ@mail.gmail.com>
X-Rspamd-Queue-Id: B98E54A7E29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-60111-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim,kekkonen.localdomain:mid]

On Fri, May 01, 2026 at 12:18:09AM +0800, Pengyu Luo wrote:
> > > @@ -1042,9 +1142,11 @@ static const char * const hi846_test_pattern_menu[] = {
> > >
> > >  #define FREQ_INDEX_640       0
> > >  #define FREQ_INDEX_1280      1
> > > +#define FREQ_INDEX_3264      2
> > >  static const s64 hi846_link_freqs[] = {
> > >       [FREQ_INDEX_640] = 80000000,
> > >       [FREQ_INDEX_1280] = 200000000,
> > > +     [FREQ_INDEX_3264] = 288000000,
> >
> > Looking at the driver, the PLL configuration is present in the lane number
> > specific register list so the link frequency is in fact the same for all
> > modes. This problem isn't introduced by this patch but I think this needs
> > to be fixed before adding further modes to the driver.
> >
> 
> TBH, I didn't investigate the calculations. I just searched the
> datasheet for it. They are exactly wrong. Thans for pointing out this.
> 
> I can fix it, but the question is this driver was writing against
> 25Mhz mclk, but the typical value from datasheet is 24Mhz, and one
> device is using 25Mhz as the clock rate, my device is using 24Mhz,
> 25Mhz is unsupported on my platform. It seems that making the list not
> be runtime is not allowed as nobody did like this.

What do you mean?

PLL configuration calculated from platform and runtime configuration is
definitely preferred over hard-coded configuration, albeit much harder to
implement. It also helps to prevent problems such as the one above.

-- 
Sakari Ailus

