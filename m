Return-Path: <linux-media+bounces-21241-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E49F09C394C
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 08:55:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93978281463
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 07:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B3115B115;
	Mon, 11 Nov 2024 07:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iNXD2OEs"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2251B67F;
	Mon, 11 Nov 2024 07:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731311750; cv=none; b=eNDup84a/YnTil1E7cLWv09D7ksNU9BoLjZmFUftxQCASdlcPLyR3fQyii3QqRbwYCE/VjDbePLMra1gZasaDzpkjU05oWFYbB61mMNtwYU7GCQq+/8wAZLdGausrywmMggOOSb6ws0X9jLZGvz1S/0rhCkYpvewUwGjjRHZTaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731311750; c=relaxed/simple;
	bh=xHHT7HP81sDKRhmaOtqdk2QHXH5hX8kRAFZkLb1RUuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XfsQR/Az7Jk/3+oLZS5mpfSOBPJ9yFmxia1/kPVEzeZdz9l+rVI/Q34rt7jcjmL/ACxWe88YrxJAqRUNTRZd8pb8M6s378F5bDCJ3xF6iJXY+bQn7o977Cs2AEVY6Q2XGONQwaC4Vs5xGKbY8a38etBD/ruW/XKZiREOb9ssG2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iNXD2OEs; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731311749; x=1762847749;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xHHT7HP81sDKRhmaOtqdk2QHXH5hX8kRAFZkLb1RUuo=;
  b=iNXD2OEsXjKv4AUdD7PsTnjxTiYqPn+rwRdUPKHVxWuSx+H5Txoery5Q
   pScctUtWpBgvBT3/GHdYwJ56fS7KL+819jMYb6YM8dmhNCBU+aLQiAO3w
   sNsUeRgZ/t/c2qevqvWlJkvYOKV6WdI016+uqZG797Q2Er3i/EKV5sxd3
   3GD/KZXyKOlsdrkl67+6hyxAnSif6aTFJo8UDr29qAnI0DC6l4W01Ch5+
   I2PfpvKI5ZQUCkM884EM79wQa48UR4o573kG+X+scNWztY27mZJAqqoo+
   HIpR2j0dyi7Ugwl7R3Z5IDnAeh92kwoTPHYVoGHnk7KKxb9Ioh6Xtlbgg
   Q==;
X-CSE-ConnectionGUID: TDESwvDLQRufJaIEpGekIQ==
X-CSE-MsgGUID: LlczYU+PR/W0o8H+iQr9dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30877310"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30877310"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 23:55:48 -0800
X-CSE-ConnectionGUID: mhrlM3+qRNOGsNsevNu0Og==
X-CSE-MsgGUID: LlF5qMHDQG23GfPn3Vp8jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="117710155"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 23:55:41 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A1B9811F72E;
	Mon, 11 Nov 2024 09:55:38 +0200 (EET)
Date: Mon, 11 Nov 2024 07:55:38 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 1/1] media: ov7251: Remap "reset" to "enable" for
 OV7251
Message-ID: <ZzG4ekFKe25Ws0D7@kekkonen.localdomain>
References: <20241108145024.1490536-1-andriy.shevchenko@linux.intel.com>
 <Zy43D7wAZLrBDtiX@kekkonen.localdomain>
 <Zy48Fc_nUceCs3PK@smile.fi.intel.com>
 <Zy4_hR9AsDhmK5MK@kekkonen.localdomain>
 <2957d1f6-f846-4916-980d-4346bc2b9d64@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2957d1f6-f846-4916-980d-4346bc2b9d64@redhat.com>

Hi Hans,

On Fri, Nov 08, 2024 at 07:19:05PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 8-Nov-24 5:42 PM, Sakari Ailus wrote:
> > Hi Andy,
> > 
> > On Fri, Nov 08, 2024 at 06:28:05PM +0200, Andy Shevchenko wrote:
> >> On Fri, Nov 08, 2024 at 04:06:39PM +0000, Sakari Ailus wrote:
> >>> On Fri, Nov 08, 2024 at 04:50:24PM +0200, Andy Shevchenko wrote:
> >>>> The driver of OmniVision OV7251 expects "enable" pin instead of "reset".
> >>>> Remap "reset" to "enable" and update polarity.
> >>>>
> >>>> In particular, the Linux kernel can't load the camera sensor
> >>>> driver on Microsoft Surface Book without this change:
> >>>>
> >>>>  ov7251 i2c-INT347E:00: supply vdddo not found, using dummy regulator
> >>>>  ov7251 i2c-INT347E:00: supply vddd not found, using dummy regulator
> >>>>  ov7251 i2c-INT347E:00: supply vdda not found, using dummy regulator
> >>>>  ov7251 i2c-INT347E:00: cannot get enable gpio
> >>>>  ov7251 i2c-INT347E:00: probe with driver ov7251 failed with error -2
> >>
> >> ...
> >>
> >>> Should this be cc'd to stable? I guess it's not exactly a fix in the driver
> >>> but a BIOS bug, but it can be worked around in the driver. :-)
> >>
> >> It's everything, but a BIOS bug, it's DT bug and whoever first introduced that
> >> GPIO in the driver. Even in the DT present in kernel the pin was referred as
> > 
> > How is that a DT (binding?) bug?
> 
> Since it is not following the datasheet name for the pin,
> it arguably is a DT binding bug
> 
> But whatever, the whole discussion about if it is a bug and whose
> bug it is is not useful. Since we cannot go back in time and change
> the DT binding DT and ACPI are simply going to disagree on the name
> and we will need something like this patch.
> 
> >> CAM_RST_N, which is exactly how this patch names it.
> >>
> >> OTOH it's a fix to the driver that never worked for ACPI case, so there never
> >> was a regression to fix.
> > 
> > It probably worked just fine, just not with that Surface Book.
> > 
> > The polarity of the enable gpio appears to be set wrong in devm_gpiod_get()
> > call. I can post a patch but cannot test it.
> 
> That is on purpose, at least the polarity if the devm_gpiod_get(..., "reset",
> ...) is inverted from the existing one for "enable" because reset needs
> to be inactive/disabled to enable the sensor.
> 
> > Similarly, you should actually set the flags to GPIOD_OUT_HIGH as reset
> > should be enabled here -- it's disabled only in power_on() as part of the
> > power-on sequence.
> 
> This seems to be a pre-existing bug in this driver, which currently
> starts driving enable high, enabling the sensor at gpiod_get() time.
> 
> Note that fixing this is tricky-ish, if the pin was already high at
> gpiod_get() time then changing the gpiod_get() to drive it low
> will result in it only being driven low for a very short time since
> ov7251_set_power_on() will get called almost immediately after this
> and it will drive the pin high again without any delays.

The question here is not about how long the hard reset is applied, but
whether or not the sensor's power-on sequence is followed. Currently it is
not.

> 
> So if the pin was already high then making it low at gpiod_get()
> time will result in a very short spike to low, immediately followed
> by the pin going high again. This short spike may very well leave
> the sensor in a confused state rather then properly resetting it...
> 
> OTOH if the pin was already high with the old code where
> gpiod_get("enable") requests the pin as high (so it is left high),
> then the existing state of the sensor is simply preserved (no reset)
> which should be fine for the initial probe which just checks
> the id register.
> 
> And if the pin was low then it is driven high once and kept high,
> so again no glitch / spike. So arguably the old code is fine.

I'm not sure how do you reach that conclusion. Because it happens to work,
presumably at least somewhere? The code appears to be part of the 

> 
> If this is changed then a delay needs to be added to ensure that
> the pin is guaranteed to be driven low for some minimum amount
> of time.

-- 
Regards,

Sakari Ailus

