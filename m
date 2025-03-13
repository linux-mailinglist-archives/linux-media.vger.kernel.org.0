Return-Path: <linux-media+bounces-28137-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4487BA5F227
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 12:16:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BB133BDCAF
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 11:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48A57266189;
	Thu, 13 Mar 2025 11:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NdfzZcht"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C691FBEB0;
	Thu, 13 Mar 2025 11:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741864564; cv=none; b=UElDnswzjvwFvMAzqj1LL+eMO4S6k4X3zrg75MzIOQubKQOE8epD/pzdoXDezaA1XB9IfytlHBnM6B3QOEADk47J/rGRmeDSRpguJE9UwYnGqLsbtFWr7pycyVfTuBbOgt1LDjEzhsAKiWVnAXs+WGmBxlt6IOWDCAG95hs+BNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741864564; c=relaxed/simple;
	bh=OFfpkEzHxhOABMaT4KyceyuEDCDd92h3glEoeMlg2T0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQh65rxBZuUeqAOIUjEzbrzBiLzv8NTSfq0eJNrG0/mNSjd5uLGGe+6MC6MKFaRy876xUj68hq+Rg86Jsjct8joKs7VaRXaaZ2lzm47/DfACKs5YHY8QW2DRVU+cFM/Zv0VQw9HjTpDce1Eelj/eFzUyxho18NPN67ljoO+VgvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NdfzZcht; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741864563; x=1773400563;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=OFfpkEzHxhOABMaT4KyceyuEDCDd92h3glEoeMlg2T0=;
  b=NdfzZchtRnJJ8F3fYTteaui1MJfVHszub3ohzJx//0DlD4AkoxhrBik2
   g70I2KlwbjULTl+Pzmb/h7zxVFotDg6UAIf2lr0CJPmA2XBYVa5lpUp0p
   H15k//G50SHbi556ZzbC0P26VtdBVgDHoZkK4Ei9QcMLZYEbUyWaqr2Qd
   KHpA0UPR5PBScsDMxA/T4zBNFepqeWmyKMNcVi0Oj5/n/IYXGMbuTLbYH
   I8lPIBBd8gb67jPajPg51PCaf349RCVf7KD949b5cCcMVY15sHI404A9E
   JlV+3yk5tCVyxrkfjZPKVF+V7HEIJGh/hlCg2AMLVSelH/t7oqxXkkCvL
   A==;
X-CSE-ConnectionGUID: ++qzPgYNTsKz/ogDHgf7bA==
X-CSE-MsgGUID: NF+mv9HRSJit3C594GZOSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="53970180"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="53970180"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 04:16:02 -0700
X-CSE-ConnectionGUID: yskAIJPzQhK7cpqvxPTHag==
X-CSE-MsgGUID: /nr/laTQQ2WOpZQd3zd9YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="125092976"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 04:16:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tsgXe-000000029bo-3xjN;
	Thu, 13 Mar 2025 13:15:58 +0200
Date: Thu, 13 Mar 2025 13:15:58 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Ricardo Ribalda <ribalda@chromium.org>, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [v2,1/1] media: =?iso-8859-1?Q?v4l2-co?=
 =?iso-8859-1?Q?re=3A_Replace_the_check_for_firmware_registered_I=B2?=
 =?iso-8859-1?Q?C?= devices
Message-ID: <Z9K-bh9uxzA1x1QA@smile.fi.intel.com>
References: <20250312192528.95838-1-andriy.shevchenko@linux.intel.com>
 <67d1f748.050a0220.353790.339b@mx.google.com>
 <Z9Kf06nLg86jmcqI@smile.fi.intel.com>
 <4633173e-111a-4659-945d-149e3857896c@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4633173e-111a-4659-945d-149e3857896c@xs4all.nl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Mar 13, 2025 at 10:52:25AM +0100, Hans Verkuil wrote:
> On 13/03/2025 10:05, Andy Shevchenko wrote:
> > On Wed, Mar 12, 2025 at 02:06:16PM -0700, Patchwork Integration wrote:
> >> Dear Andy Shevchenko:
> >>
> >> Thanks for your patches! Unfortunately the Media CI robot detected some
> >> issues:
> >>
> >> # Test media-patchstyle:./0001-media-v4l2-core-Replace-the-check-for-firmware-regis.patch media style
> >> ERROR: ./0001-media-v4l2-core-Replace-the-check-for-firmware-regis.patch: Missing 'media:' prefix in Subject
> > 
> > LOL, what?
> 
> Hmm, the 'I²C' bit in the Subject header causes it to be UTF-8. The Subject line in
> patchwork (1) is now:
> 
> Subject: [PATCH v2 1/1] =?utf-8?q?media=3A_v4l2-core=3A_Replace_the_check_fo?=
>         =?utf-8?q?r_firmware_registered_I=C2=B2C_devices?=
> 
> so the check for the 'media:' prefix in the Subject line fails.
> 
> Interestingly, if I commit the patch (git am) to a test branch, then run
> 'git format-patch -n1' the Subject line now reads:
> 
> Subject: [PATCH 1/1] =?UTF-8?q?media:=20v4l2-core:=20Replace=20the=20check?=
>  =?UTF-8?q?=20for=20firmware=20registered=20I=C2=B2C=20devices?=
> 
> and that restored the ':'.
> 
> Ricardo, can you look at this?
> 
> I also noticed that the v1 and v2 patches ended up in my spam folder. Whether that
> is related to UTF-8 in the Subject is not clear (my provider marks way too many
> legit posts as spam).
> 
> Andy, can you post a v3 with just 'I2C' in the subject instead of 'I²C'? If nothing
> else, I'd like to know if that's the reason it ended up in my spam folder.

Sure. Will do ASAP.

-- 
With Best Regards,
Andy Shevchenko



