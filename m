Return-Path: <linux-media+bounces-30164-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC864A880E0
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 14:54:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC9241898BDE
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 12:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 979122BE7BE;
	Mon, 14 Apr 2025 12:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AHdau/dz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C897D528;
	Mon, 14 Apr 2025 12:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744635289; cv=none; b=apcftnLaYMNSptZ1VLV8W1GN/sVThI1fOAwthme1jL4Hr9ZgXg4ohtsxhn78bVSOz5ufZhBLmRbXAiKi9xJI+MK9wZ9NWuZK3CqHS3t3TuSL+ScQqJhvCep/Vb6Lks115MAZ1SvNT0wzjf8dz9zGKHzSWdWH1d1phy623asAZzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744635289; c=relaxed/simple;
	bh=NY0tzV7UqUseL3iANR1N0E1X7gg+dX3pYys2GAnXB+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HQk0LEDqGSF2V13fr02GQzCUHlRnq4bqMuDc2CfzddQxHlYQXVa/JzPntn7YGct4kiqCLOYEIyoU3mNx71++M5GWNpgF1OjsFxjAu20t7s0l87/YcggJqpqodU3iT2MNPfqR9aa4DFG7+FD6Ah5M8ZOio5GmWUXD3aZuUAzfbI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AHdau/dz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744635287; x=1776171287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NY0tzV7UqUseL3iANR1N0E1X7gg+dX3pYys2GAnXB+s=;
  b=AHdau/dzCBqPaOgWAvzLvMgsRN4POds9mxtcPBzJe0x+i1ordX2v9gfg
   ei8MWq4p9iyEjBxOCe4TyCFYDs9GQXfNtZA+KGrD7uXgKlOKgOmcvGWKS
   8ZAf5kB9e80e6Acp/Y964Koi8a6u3mATPvV73o/6J0nJWN4JAIrpGlpTd
   y04XmXwYJNSehYTljwB2UFUUOiC919CBgTIpFP0brQxG/tETdJ9vTBBhK
   W0a33nqgivdzGfc5HCUeNbyRZGuxNLooIhR2DpJiBwh58QOsiXFgaCSCt
   kK+IZAY8ynrDB2nL/7LuwrV5rHFD0xWtE8RQh+Y3Z5Lnxu6VMgnGP2idy
   A==;
X-CSE-ConnectionGUID: Wd1Ig2NFRmSamSsyhxV/qw==
X-CSE-MsgGUID: +8I5GPpzRwi/OabCxz92Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45238557"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="45238557"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 05:54:46 -0700
X-CSE-ConnectionGUID: srnfHlBySNevRxPLnO7tgw==
X-CSE-MsgGUID: wLyVF0hlTi+k/zpt+XcuHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="134785955"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 05:54:43 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E078C11F871;
	Mon, 14 Apr 2025 15:54:40 +0300 (EEST)
Date: Mon, 14 Apr 2025 12:54:40 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: "Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"Yan, Dongcheng" <dongcheng.yan@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	hverkuil@xs4all.nl, u.kleine-koenig@baylibre.com,
	ricardo.ribalda@gmail.com, bingbu.cao@linux.intel.com,
	hao.yao@intel.com
Subject: Re: [PATCH v1 1/2] platform/x86: int3472: add hpd pin support
Message-ID: <Z_0FkADfsQLOdchI@kekkonen.localdomain>
References: <Z_zDGYD1QXZYWwI9@smile.fi.intel.com>
 <d9cab351-4850-42c7-8fee-a9340d157ed9@linux.intel.com>
 <Z_zMMtUdJYpHuny7@smile.fi.intel.com>
 <f10f919e-7bdc-4a01-b131-41bdc9eb6573@intel.com>
 <01570d5d-0bdf-4192-a703-88854e9bcf78@redhat.com>
 <9dc86b0c-b63c-447d-aa2f-953fbccb1d27@redhat.com>
 <Z_z04jMiTg_xW-c2@kekkonen.localdomain>
 <518b1420-a356-4e4b-8422-c2689bc54794@redhat.com>
 <Z_0AX9sdwSAWhzTc@kekkonen.localdomain>
 <0e2306d7-3a07-45ad-958f-1039fb10a8cf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e2306d7-3a07-45ad-958f-1039fb10a8cf@redhat.com>

Hi Hans,

On Mon, Apr 14, 2025 at 02:37:36PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 14-Apr-25 14:32, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Mon, Apr 14, 2025 at 02:21:56PM +0200, Hans de Goede wrote:
> >> Hi Sakari,
> >>
> >> On 14-Apr-25 13:43, Sakari Ailus wrote:
> >>> Hans, Dongcheng,
> >>>
> >>> On Mon, Apr 14, 2025 at 01:09:47PM +0200, Hans de Goede wrote:
> >>>> Hi,
> >>>>
> >>>> On 14-Apr-25 13:04, Hans de Goede wrote:
> >>>>> Hi,
> >>>>>
> >>>>> On 14-Apr-25 11:59, Yan, Dongcheng wrote:
> >>>>>> Hi Andy and Hans,
> >>>>>>
> >>>>>> I found the description of lt6911uxe's GPIO in the spec:
> >>>>>> GPIO5 is used as the interrupt signal (50ms low level) to inform SOC
> >>>>>> start reading registers from 6911UXE;
> >>>>>>
> >>>>>> So setting the polarity as GPIO_ACTIVE_LOW is acceptable?
> >>>>>
> >>>>> Yes that is acceptable, thank you for looking this up.
> >>>>
> >>>> p.s.
> >>>>
> >>>> Note that setting GPIO_ACTIVE_LOW will invert the values returned
> >>>> by gpiod_get_value(), so if the driver uses that you will need
> >>>> to fix this in the driver.
> >>>>
> >>>> Hmm, thinking more about this, I just realized that this is an
> >>>> input pin to the CPU, not an output pin like all other pins
> >>>> described by the INT3472 device. I missed that as first.
> >>>>
> >>>> In that case using GPIO_LOOKUP_FLAGS_DEFAULT as before probably
> >>>> makes the most sense. Please add a comment that this is an input
> >>>> pin to the INT3472 patch and keep GPIO_LOOKUP_FLAGS_DEFAULT for
> >>>> the next version.
> >>>
> >>> The GPIO_LOOKUP_FLAGS_DEFAULT is the "Linux default", not the hardware or
> >>> firmware default so I don't think it's relevant in this context. There's a
> >>> single non-GPIO bank driver using it, probably mistakenly.
> >>>
> >>> I'd also use GPIO_ACTIVE_LOW, for the reason Dongcheng pointed to above.
> >>
> >> The GPIO being interpreted as active-low is a thing specific to
> >> the chip used though. Where as in the future the HPD pin type
> >> in the INT3472 device might be used with other chips...
> >>
> >> Anyways either way is fine with me bu, as mentioned, using GPIO_ACTIVE_LOW
> >> will invert the values returned by gpiod_get_value(), for which the driver
> >> likely needs to be adjusted.
> > 
> > The driver appears to ask for both IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
> > and it only uses the GPIO for an ISR so it doesn't seem to require driver
> > changes IMO. Although this also seems to make the polarit irrelevant, at
> > least for this driver.
> 
> If the driver does not care about this I would prefer for the INT3472 code to
> use GPIO_ACTIVE_HIGH to avoid the inverting behavior of GPIO_ACTIVE_LOW making 
> things harder for other future drivers using the hpd pin through the INT3472
> glue code.

I'm fine with that, too. (My main point was indeed
GPIO_LOOKUP_FLAGS_DEFAULT doesn't seem to be a good fit here.)

-- 
Regards,

Sakari Ailus

