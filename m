Return-Path: <linux-media+bounces-30157-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BE2A88063
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 14:32:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C09116CF3D
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 12:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4DB192B81;
	Mon, 14 Apr 2025 12:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VbKNcsH5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6595318C32C;
	Mon, 14 Apr 2025 12:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744633960; cv=none; b=HvM4qo5hGXkREZaNF5dB46fIJacXnbfOoXjN7wwfkj5C2vqzabLnClRnFLjFU/cKIhcESSgke8fZsf+GKu9Hy23a0+Kf7LGNo8lKlqFxjRiyFizCTiaAYcnM1IVPn+GNtq3uYpOnxUXoyp0MAznjfKOiIXQTiPd0IwppSjo+aPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744633960; c=relaxed/simple;
	bh=b1keoTXPWw7k5udECc1+8NUdD3ePHHJCcIsh6QBDyYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rYvixVXn6LBHC4zyHBhFdmR8XTopoqdNm5k0xvmUs5qy+CTR2pS9NCSNH6pR1hTx7Md4NXHscPeEH+3LzptdNHNONCEiPSClMVNx+A6Wg2wgDVUPAuak7gepYpCw6Hcm8oWAEVrCpP7B69fQRv4qXLiGXba5wX0pdZZf7V7gm6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VbKNcsH5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744633958; x=1776169958;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b1keoTXPWw7k5udECc1+8NUdD3ePHHJCcIsh6QBDyYc=;
  b=VbKNcsH5nS1nIgn1hxeqxvEXiHoqGZeMNWn+QCdy9FfcLri3qnYHB2YD
   2qU0wLyRDwdAjlLDTEORPRBufhqyY0tgeryDqW08DMiKeRpQdMId6VUrP
   0AKowUk/lx0lBEG/vMm98ePSKnf/MALrb0QQdCq50EUKSSlO9Kxhh+6TN
   sAl8pPDGCP+wrJN3zEr6ARsMwtsCzVGCLCJU6gfJM9SKgMty74Wpyjj38
   Au3H1kUQfpxj/O31S0+6+6MmFECDVxtQ/GMS0FuloXw3VCdF8E5y60NpG
   1a4yktofKXY00snQVMBQF2OmLKpbRMBIqyAA9nPPP/9KckHjfV0subauh
   g==;
X-CSE-ConnectionGUID: iDcnApmaSyyO1rORWUtPCw==
X-CSE-MsgGUID: MYluBme5RVKPITNLzXV+nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46266132"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="46266132"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 05:32:37 -0700
X-CSE-ConnectionGUID: D/kesmV9TDqj8IL94+rbWQ==
X-CSE-MsgGUID: 9zsfbpScQAS/3cAy6pmd/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="160797047"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 05:32:34 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0B31C11F871;
	Mon, 14 Apr 2025 15:32:32 +0300 (EEST)
Date: Mon, 14 Apr 2025 12:32:31 +0000
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
Message-ID: <Z_0AX9sdwSAWhzTc@kekkonen.localdomain>
References: <cfc709a8-85fc-4e44-9dcf-ae3ef7ee0738@redhat.com>
 <c8ae2d43-157c-408a-af89-7248b30d52d1@linux.intel.com>
 <Z_zDGYD1QXZYWwI9@smile.fi.intel.com>
 <d9cab351-4850-42c7-8fee-a9340d157ed9@linux.intel.com>
 <Z_zMMtUdJYpHuny7@smile.fi.intel.com>
 <f10f919e-7bdc-4a01-b131-41bdc9eb6573@intel.com>
 <01570d5d-0bdf-4192-a703-88854e9bcf78@redhat.com>
 <9dc86b0c-b63c-447d-aa2f-953fbccb1d27@redhat.com>
 <Z_z04jMiTg_xW-c2@kekkonen.localdomain>
 <518b1420-a356-4e4b-8422-c2689bc54794@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <518b1420-a356-4e4b-8422-c2689bc54794@redhat.com>

Hi Hans,

On Mon, Apr 14, 2025 at 02:21:56PM +0200, Hans de Goede wrote:
> Hi Sakari,
> 
> On 14-Apr-25 13:43, Sakari Ailus wrote:
> > Hans, Dongcheng,
> > 
> > On Mon, Apr 14, 2025 at 01:09:47PM +0200, Hans de Goede wrote:
> >> Hi,
> >>
> >> On 14-Apr-25 13:04, Hans de Goede wrote:
> >>> Hi,
> >>>
> >>> On 14-Apr-25 11:59, Yan, Dongcheng wrote:
> >>>> Hi Andy and Hans,
> >>>>
> >>>> I found the description of lt6911uxe's GPIO in the spec:
> >>>> GPIO5 is used as the interrupt signal (50ms low level) to inform SOC
> >>>> start reading registers from 6911UXE;
> >>>>
> >>>> So setting the polarity as GPIO_ACTIVE_LOW is acceptable?
> >>>
> >>> Yes that is acceptable, thank you for looking this up.
> >>
> >> p.s.
> >>
> >> Note that setting GPIO_ACTIVE_LOW will invert the values returned
> >> by gpiod_get_value(), so if the driver uses that you will need
> >> to fix this in the driver.
> >>
> >> Hmm, thinking more about this, I just realized that this is an
> >> input pin to the CPU, not an output pin like all other pins
> >> described by the INT3472 device. I missed that as first.
> >>
> >> In that case using GPIO_LOOKUP_FLAGS_DEFAULT as before probably
> >> makes the most sense. Please add a comment that this is an input
> >> pin to the INT3472 patch and keep GPIO_LOOKUP_FLAGS_DEFAULT for
> >> the next version.
> > 
> > The GPIO_LOOKUP_FLAGS_DEFAULT is the "Linux default", not the hardware or
> > firmware default so I don't think it's relevant in this context. There's a
> > single non-GPIO bank driver using it, probably mistakenly.
> > 
> > I'd also use GPIO_ACTIVE_LOW, for the reason Dongcheng pointed to above.
> 
> The GPIO being interpreted as active-low is a thing specific to
> the chip used though. Where as in the future the HPD pin type
> in the INT3472 device might be used with other chips...
> 
> Anyways either way is fine with me bu, as mentioned, using GPIO_ACTIVE_LOW
> will invert the values returned by gpiod_get_value(), for which the driver
> likely needs to be adjusted.

The driver appears to ask for both IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
and it only uses the GPIO for an ISR so it doesn't seem to require driver
changes IMO. Although this also seems to make the polarit irrelevant, at
least for this driver.

-- 
Regards,

Sakari Ailus

