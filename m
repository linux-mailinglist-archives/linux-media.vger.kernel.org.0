Return-Path: <linux-media+bounces-21827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDAD9D5D6E
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 11:43:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87B8FB23530
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 10:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F981DE3A2;
	Fri, 22 Nov 2024 10:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jDyF6Tux"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2541A187321;
	Fri, 22 Nov 2024 10:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732272203; cv=none; b=Joa1/GFVK5PQTmHPrWBYozIUdUEdrCihTn/2Bnk2slod8GhtDornucy+rr/aqLLEHbxSnNGkjEld8/2k7RvsOg9gzjf8clIBuhmz3kvkfMOriHDJhPqDwZrpKwwj8WIwuW2FWxw6hTD/fBFqcJ68pUZ6t084Fc8fKAZpUmOJ/Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732272203; c=relaxed/simple;
	bh=x0J7TmMtWw4m8MrhPi0Qs99f62vfNGRcSXHSXU9CiEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMoUHFQX9eK9SFUWOOkfW/xnhWLQ9i0piCtQGHrT2fSMyVZDplSIQDn9lXymRHTK0BYboKNX41G8Iuaclen5PwoLoQmw2i4bfbQyBqkWoKdz3HDpsrATILxbAgwSkvMn2DABMqYF8zNxT3qx/brSdicKhPq3A8OSNVbih9beNHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jDyF6Tux; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732272202; x=1763808202;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=x0J7TmMtWw4m8MrhPi0Qs99f62vfNGRcSXHSXU9CiEg=;
  b=jDyF6TuxSXcqtVygpW1Ym6cq79zl8p3xgKVRSx4RoIbC8DdUIsoUA0kJ
   3fpaqC50fu08IbmwRoQ1ksxymztcDfl0N2oFjW/08NtSNpKDPntkjw4RV
   5RUTKiLMk7B1Gp68FFiSKqXPyEjOkoHGr2fTvuBeyp340GBXrq/+/TfH2
   4PI+d3txFrhGTwWBMKmgEILVf1ZBQQg2MDN6b8cH1Fnu/EHcC30MdQVIq
   9P9ewVn2bh1gwFXqYDjdru27TSuXrrephft0vzRezQ1AX142n0xGecqYc
   0npWTd9L87I1q2KUhTuVjcj4kOuV8XmIhFhm+/qEu3v0qPeqLf8M0uKz/
   w==;
X-CSE-ConnectionGUID: FPpFIHiYTBaT36CG17lw6A==
X-CSE-MsgGUID: xbukUEG5TveHDpuyE9YXag==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32281235"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="32281235"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 02:43:22 -0800
X-CSE-ConnectionGUID: 26W8L4aLRFGAlM7FXXlq2Q==
X-CSE-MsgGUID: tslC0Lf6TXWojTN2pUn7kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="113818793"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 02:43:19 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D110A11F726;
	Fri, 22 Nov 2024 12:43:16 +0200 (EET)
Date: Fri, 22 Nov 2024 10:43:16 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ricardo Ribalda Delgado <ribalda@kernel.org>
Cc: =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	sakari.ailus@iki.fi
Subject: Re: [PATCH v2 09/13] media: i2c: imx214: Extract format and crop
 settings
Message-ID: <Z0BgRIlK-Tdcm8AV@kekkonen.localdomain>
References: <20241021-imx214-v2-0-fbd23e99541e@apitzsch.eu>
 <20241021-imx214-v2-9-fbd23e99541e@apitzsch.eu>
 <CAPybu_09-1E4+Xe1Tnaue01i4JPtOHz15OUei=4q=Roqcuoz2Q@mail.gmail.com>
 <f927d1aa8718568cd7cecc90255f73ddbd673a41.camel@apitzsch.eu>
 <CAPybu_2xPkrL=jTT0O_10KuCgyfe3BU033Y+q2+jq9ErPU9ACA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPybu_2xPkrL=jTT0O_10KuCgyfe3BU033Y+q2+jq9ErPU9ACA@mail.gmail.com>

Hi Ricardo,

On Wed, Nov 20, 2024 at 10:22:54PM +0100, Ricardo Ribalda Delgado wrote:
> Hi André
> 
> On Wed, Nov 20, 2024 at 9:07 PM André Apitzsch <git@apitzsch.eu> wrote:
> >
> > Hi Ricardo,
> >
> > Am Mittwoch, dem 30.10.2024 um 13:10 +0100 schrieb Ricardo Ribalda
> > Delgado:
> > > Hi
> > >
> > > Aren't you changing the binning mode for 1920x1080  with this patch?
> > > I think that could be considered an ABI change.
> >
> > Is the problem that the ABI changes or that it is not mentioned in the
> > commit message?
> 
> I think it is a combination of both. There will be products out there
> that after applying this change will get different frames using the
> same configuration.
> 
> @Sakari Ailus  What do we usually do in these cases?

Good question. Always when something is changed in the UAPI there's a
chance for breakages and these are a big no-no, at least in principle.
Keeping the old behaviour in place is how you generally can avoid breakages
but this has its issues, too.

We're in the process to make changes to the sensor APIs in general,
while old drivers would need to maintain current functionality. See
<20241122100633.8971-1-sakari.ailus@linux.intel.com> on LMML.

Ricardo: I'll cc you to the next version.

> 
> > >
> > > Also, if we are not letting the user change the value, I do not see
> > > much value in setting the cropping programmatically, I'd rather not
> > > take this change.
> >
> > I assume the first "value" refers to "binning value", that cannot be
> > changed by the user. Is it right, that .set_selection needs to be
> > implemented to change that?
> 
> I believe set_selection is the correct way, yes. Sakari again to keep
> me honest :)

Please see the RFC set.

-- 
Kind regards,

Sakari Ailus

