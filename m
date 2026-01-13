Return-Path: <linux-media+bounces-50507-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D88ED173B5
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 09:16:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74DBA30443D8
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 08:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E2503793C9;
	Tue, 13 Jan 2026 08:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hHwtSCUr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E083030F946
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 08:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768292048; cv=none; b=M2OaFHvk0n0vtnEXz06XYQqTjQmsLBLeo/nfGTFpXc3IT9+zUJsUFpuqSsZkJ9pt3tM9XwScwnAv/3BzJCnDmDoxzjVNAgx/0WpI0VFnysfFR8RijhruQQ7n0QGxITREP20KbBGDncCL6jWBHgl3t47xS2GmCwZA6xHDD6BORfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768292048; c=relaxed/simple;
	bh=kE/smxxHATp9H64VZeGLdv3P1RKDeIDKctbphPX0ioc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CR/PVsTI/LwQUcPaGTgQEbYbdfO8vXXhppkeGJ1rZrEhEwtN2ve4FD3gVnvEkzS9fFsV/56kair3Kv6ksCVXCZBhO1zzTYYEMf1PvxABs82nlwQLDWrAf5BMLGhqq8fNXkWO0QtGszwJa6cNNNm97gX84hyPWRTddQrt0roEP38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hHwtSCUr; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768292047; x=1799828047;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kE/smxxHATp9H64VZeGLdv3P1RKDeIDKctbphPX0ioc=;
  b=hHwtSCUr0frzNTTWHkAGPNXbf610P5Pfd2hj6WPUs2aJbDoKo2Ij1rQB
   Q30oGj49/lgig2iQG0kTgOQWkYTMY2Ub03lyyp61wuhN7rl0NSCpiaUOY
   SdPDkeCcG0GX8JZp8ku2Ab5pdk3fBT0N9+1btsSHRzGs3Z0py9WF7tmJ5
   gbrPtikhMbAJdxuzY/kRIyCLDgPNGotwJJI2y9v+qpP77L5ViwQDq5hJX
   cPcfzkuIQBZz30UnfF1V/uh2CIeEs7oBprfruT7beSVlyBfqVrhqW1U0C
   sk1H913AII0EHY/4A9iiHKmPXjlyAxZirQtmu9zzlcL3EhCF9Wo4WXMLY
   A==;
X-CSE-ConnectionGUID: f0fZaXpkSTy+rA4AFbqppA==
X-CSE-MsgGUID: P5lB8PXGTau8Dc0urH5/1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="79868438"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="79868438"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:14:07 -0800
X-CSE-ConnectionGUID: W0OLhbu4TKiu7Uj8+Igl7Q==
X-CSE-MsgGUID: 1czKJaZ5TOKYaae2T5mv3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204334122"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.182])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:14:05 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A4FD111FC37;
	Tue, 13 Jan 2026 10:14:02 +0200 (EET)
Date: Tue, 13 Jan 2026 10:14:02 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
	Hans de Goede <hansg@kernel.org>, mehdi.djait@intel.com
Subject: Re: [PATCH v2 06/23] media: i2c: ov01a10: Fix test-pattern disabling
Message-ID: <aWX-ykmED-tw3pdo@kekkonen.localdomain>
References: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
 <20260112095949.3851-7-sakari.ailus@linux.intel.com>
 <419da2e9-1532-a39c-e4e6-dad0141e1002@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <419da2e9-1532-a39c-e4e6-dad0141e1002@linux.intel.com>

Hi Bingbu,

Thank you for the review!

On Tue, Jan 13, 2026 at 10:59:51AM +0800, Bingbu Cao wrote:
> Sakari and Hans,
> 
> On 1/12/26 5:59 PM, Sakari Ailus wrote:
> > From: Hans de Goede <hansg@kernel.org>
> > 
> > When the test-pattern control gets set to 0 (Disabled) 0 should be written
> > to the test-pattern register, rather then doing nothing.
> > 
> > Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Hans de Goede <hansg@kernel.org>
> > Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
> > Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> > Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/ov01a10.c | 11 ++++-------
> >  1 file changed, 4 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
> > index dd2b6d381175..3ad516e4d369 100644
> > --- a/drivers/media/i2c/ov01a10.c
> > +++ b/drivers/media/i2c/ov01a10.c
> > @@ -249,9 +249,8 @@ static const struct ov01a10_reg sensor_1280x800_setting[] = {
> >  static const char * const ov01a10_test_pattern_menu[] = {
> >  	"Disabled",
> >  	"Color Bar",
> > -	"Top-Bottom Darker Color Bar",
> > -	"Right-Left Darker Color Bar",
> > -	"Color Bar type 4",
> > +	"Left-Right Darker Color Bar",
> > +	"Bottom-Top Darker Color Bar",
> >  };
> >  
> >  static const s64 link_freq_menu_items[] = {
> > @@ -406,10 +405,8 @@ static int ov01a10_update_digital_gain(struct ov01a10 *ov01a10, u32 d_gain)
> >  
> >  static int ov01a10_test_pattern(struct ov01a10 *ov01a10, u32 pattern)
> >  {
> > -	if (!pattern)
> > -		return 0;
> > -
> > -	pattern = (pattern - 1) | OV01A10_TEST_PATTERN_ENABLE;
> > +	if (pattern)
> > +		pattern |= OV01A10_TEST_PATTERN_ENABLE;
> >
> 
> It should be 'pattern - 1', the pattern value for register start as 0.

I'll use:

	if (pattern)
		pattern = (pattern - 1) | OV01A10_TEST_PATTERN_ENABLE;


I already sent a PR so I'll add a new patch for this.

> 
> >  	return ov01a10_write_reg(ov01a10, OV01A10_REG_TEST_PATTERN, 1, pattern);
> >  }
> > 
> 

-- 
Kind regards,

Sakari Ailus

