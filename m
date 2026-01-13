Return-Path: <linux-media+bounces-50550-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A077D185B4
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 12:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4675E30AD37A
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 11:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B96C038B986;
	Tue, 13 Jan 2026 11:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DAsoJO20"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D60438946D
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 11:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768302147; cv=none; b=O8fu5JnDH0OLIft/8eknalkQmf6/8k8MbcRAeXygTkrPVulB9SlO+u5FrWM3IpqIGdVzgckA3YoR6mc/Ko+FFZz1Ab5cURwIJ0rz70zzKa3hU3a6kx2o82lmxkGYlULpSEqzzCD6JOiRFvS4MQO7MsDwPDAN1Ua++jJOuWeluPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768302147; c=relaxed/simple;
	bh=gpOqF1TqXblIsQBWm5lasr0uafSNwxFi6PwrcQsdXjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=exUnQ3X5Mg6fOybjCgnTdpnjRgZmYNgdc3bSJWTo1V5wkRvPnAaCjDx4p/qOqNh7i3YXR9i0eqUgrkWjbUPVcZJyNcphXMAI15y6gSvVR0XU0O38lgPEWuA/0q+j3QEPOPY43BWlMhb1cEhZjH1Gr12Wf/TF6pV0FG1Bd5/cM1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DAsoJO20; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768302146; x=1799838146;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gpOqF1TqXblIsQBWm5lasr0uafSNwxFi6PwrcQsdXjQ=;
  b=DAsoJO20MMnSZBfmiyOMukGjsrfCo5u4mnL7+Kh1R+9FZlNhC7h7wGA4
   T6XRTWkhMWxlwY2vulYDxqxMzTHxIx+gguuAHfACWEZoZ2v6Xw9Q6E1yL
   fnSQZBufu9f0J7wmZ6lNvKZ4ngLgMKUObph8h43Awro7g679l9nJjcTeH
   RdBFYK08x2Mrs5WU3j2E2nFg+iUW+gHs7jhnMMmDDPzcc6uEKeZZZbji7
   GcLi5FCQv1+0hv+EPuvrE0thIiD55+weoxB8Ii+uVq8g1Deih5zJ2EBHN
   OFUcywAxZOHs4muihXNkos6LfC2q1Cv8XL/xOSX6bo5+viA+uwiiA7Ej2
   Q==;
X-CSE-ConnectionGUID: vjXzNFgoQnmlGIBGK00XCw==
X-CSE-MsgGUID: UDEa/hIaSEydVvXbepkZFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69641423"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69641423"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 03:02:25 -0800
X-CSE-ConnectionGUID: UN6rGDKESWG7AT97n1HQYw==
X-CSE-MsgGUID: +pyECoOTTUet6ZDQVTMAIQ==
X-ExtLoop1: 1
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.182])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 03:02:23 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 56ED811FB85;
	Tue, 13 Jan 2026 13:02:21 +0200 (EET)
Date: Tue, 13 Jan 2026 13:02:21 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
	mehdi.djait@intel.com
Subject: Re: [PATCH 1/1] media: ov01a10: Fix test pattern assignment
Message-ID: <aWYmPTLrbZJv1i3z@kekkonen.localdomain>
References: <20260113082512.102779-1-sakari.ailus@linux.intel.com>
 <988fe458-da1d-4042-92fa-8e1b80e09d5e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <988fe458-da1d-4042-92fa-8e1b80e09d5e@kernel.org>

On Tue, Jan 13, 2026 at 11:42:52AM +0100, Hans de Goede wrote:
> Hi,
> 
> On 13-Jan-26 09:25, Sakari Ailus wrote:
> > The test patterns of the test pattern menu control start from 1 whereas
> > register values start from 0. Fix this.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > This goes on top of my recent ov01a10 series.
> > 
> >  drivers/media/i2c/ov01a10.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
> > index 3dbc77430e0e..0a66d8974974 100644
> > --- a/drivers/media/i2c/ov01a10.c
> > +++ b/drivers/media/i2c/ov01a10.c
> > @@ -319,7 +319,7 @@ static int ov01a10_update_digital_gain(struct ov01a10 *ov01a10, u32 d_gain)
> >  static int ov01a10_test_pattern(struct ov01a10 *ov01a10, u32 pattern)
> >  {
> >  	if (pattern)
> > -		pattern |= OV01A10_TEST_PATTERN_ENABLE;
> > +		pattern = (pattern - 1) | OV01A10_TEST_PATTERN_ENABLE;
> 
> Nack, copy paste of my reply to Bingbu's email where this change was requested:
> 
> This was "pattern - 1" in the original v1 patch-set, the - 1 is dropped
> deliberately c2 because testing has shown that there is no difference
> between writing "0 | OV01A10_TEST_PATTERN_ENABLE" vs
> "1 | OV01A10_TEST_PATTERN_ENABLE" to the register.
> 
> See the discussion here:
> 
> https://lore.kernel.org/linux-media/jgzovuqvd5csxwzmzf5asri7xvftoyb4lqyywtfdsrsgdvwz7i@neqszepmzw3m/
> 
> Please drop this patch.

Ack; done.

-- 
Sakari Ailus

