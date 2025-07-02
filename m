Return-Path: <linux-media+bounces-36527-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9A7AF12A8
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 12:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 575A31887AD3
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 10:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06D9425BEF3;
	Wed,  2 Jul 2025 10:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GUtxFgKq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D82325A33A;
	Wed,  2 Jul 2025 10:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751453626; cv=none; b=G4lUzzxIbM3qofYeYATVI4cYBRttJLZK1h3hFih1K/+aa+5gq/kLJd+BcbKXj45k33u4UnhS1W3wynRmftZd86NIyZAStRLp34teVaf0MFqm0rMl5JULcqTQupYJquRGdyUW/FUBQL01qcSHJ4N5nM9VYeiBn+xcigmbgli/kHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751453626; c=relaxed/simple;
	bh=Xrhf1GwnZkxyiYFhUf+rxHpGqV5vwwoSaFZMXP3lOGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fXh0EoWRmX/YWCN5i/taj/74O7Y+7olD8OUHtULoSbd9mBXdMm8sfF2KaF82LkDkM09wFqKgUWoh+iKXbAksf/w4Nv5tCC5j4Dkm/mYn0vPSQjmGxoA0+xch/J4TzrinkWTaYR+Ew4ftXNgxHalgwiN1UK1NVbOmHABPJc0Yf6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GUtxFgKq; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751453624; x=1782989624;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Xrhf1GwnZkxyiYFhUf+rxHpGqV5vwwoSaFZMXP3lOGY=;
  b=GUtxFgKqKhcHYIcAyhGbe3uCRe+bY+B8yph519YN5mMivVQWDdrw/95P
   r/k1NvuQEZ2WjQak9x9Wb4663g2YrJON89WbRM685okezpttI9O5TsaUO
   AN6sfL8prdn0qK5Axa/qejgMUnnuz4Wm44v20/UxRfIvlaSDkxHv9F2bb
   naHNjlh37CRDwmi9ZXOKrSxMWAgE7rVWL1CSy1L7elVibpxEH6D8k1UGQ
   D3l8ZMghtxC0OVfShmOyx4gThfB+Q9tgFd9lCv2/hYrexvVcZj8bCkWXk
   T1UVZw52+nCTiA01uTi/IetrQYl6C1YTmDi7QzmQui1wtambQBDuKS8Fn
   g==;
X-CSE-ConnectionGUID: qdjhNq5nReuRCt79ZU5sBg==
X-CSE-MsgGUID: liwysPppTcK70hyIbIQ7BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="52859653"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="52859653"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 03:53:43 -0700
X-CSE-ConnectionGUID: UpGjGzV8QDGpLFIE560HUA==
X-CSE-MsgGUID: klVJK8l4S8Kctp0tk/FcNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="158303529"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.245.162])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 03:53:40 -0700
Received: from svinhufvud (syyslaukka.retiisi.eu [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTPS id E135344390;
	Wed,  2 Jul 2025 13:53:37 +0300 (EEST)
Date: Wed, 2 Jul 2025 13:53:36 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Yan, Dongcheng" <dongcheng.yan@intel.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
	hverkuil@xs4all.nl,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>, u.kleine-koenig@baylibre.com,
	ricardo.ribalda@gmail.com, bingbu.cao@linux.intel.com,
	stable@vger.kernel.org, dongcheng.yan@linux.intel.com,
	hao.yao@intel.com
Subject: Re: [PATCH v3 1/2] platform/x86: int3472: add hpd pin support
Message-ID: <aGUPsDglThYGc/3g@svinhufvud>
References: <20250425104331.3165876-1-dongcheng.yan@intel.com>
 <5a04f105-3075-3226-6ad6-f2c3f31b29da@linux.intel.com>
 <116ea6fa-e9b8-4c28-bc31-f4d1589eb34b@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <116ea6fa-e9b8-4c28-bc31-f4d1589eb34b@intel.com>

Hi Dongcheng, Ilpo,

On Wed, Jul 02, 2025 at 06:23:19PM +0800, Yan, Dongcheng wrote:
> Hi Ilpo,
> 
> On 7/2/2025 6:19 PM, Ilpo Järvinen wrote:
> > On Fri, 25 Apr 2025, Dongcheng Yan wrote:
> > 
> >> Typically HDMI to MIPI CSI-2 bridges have a pin to signal image data is
> >> being received. On the host side this is wired to a GPIO for polling or
> >> interrupts. This includes the Lontium HDMI to MIPI CSI-2 bridges
> >> lt6911uxe and lt6911uxc.
> >>
> >> The GPIO "hpd" is used already by other HDMI to CSI-2 bridges, use it
> >> here as well.
> >>
> >> Signed-off-by: Dongcheng Yan <dongcheng.yan@intel.com>
> >> ---
> >>  drivers/platform/x86/intel/int3472/common.h   | 1 +
> >>  drivers/platform/x86/intel/int3472/discrete.c | 6 ++++++
> >>  2 files changed, 7 insertions(+)
> >>
> >> diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
> >> index 51b818e62a25..4593d567caf4 100644
> >> --- a/drivers/platform/x86/intel/int3472/common.h
> >> +++ b/drivers/platform/x86/intel/int3472/common.h
> >> @@ -23,6 +23,7 @@
> >>  #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
> >>  #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
> >>  #define INT3472_GPIO_TYPE_HANDSHAKE				0x12
> >> +#define INT3472_GPIO_TYPE_HOTPLUG_DETECT			0x13
> >>  
> >>  #define INT3472_PDEV_MAX_NAME_LEN				23
> >>  #define INT3472_MAX_SENSOR_GPIOS				3
> >> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> >> index 394975f55d64..efa3bc7af193 100644
> >> --- a/drivers/platform/x86/intel/int3472/discrete.c
> >> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> >> @@ -191,6 +191,10 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
> >>  		*con_id = "privacy-led";
> >>  		*gpio_flags = GPIO_ACTIVE_HIGH;
> >>  		break;
> >> +	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
> >> +		*con_id = "hpd";
> >> +		*gpio_flags = GPIO_ACTIVE_HIGH;
> >> +		break;
> >>  	case INT3472_GPIO_TYPE_POWER_ENABLE:
> >>  		*con_id = "avdd";
> >>  		*gpio_flags = GPIO_ACTIVE_HIGH;
> >> @@ -221,6 +225,7 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
> >>   * 0x0b Power enable
> >>   * 0x0c Clock enable
> >>   * 0x0d Privacy LED
> >> + * 0x13 Hotplug detect
> >>   *
> >>   * There are some known platform specific quirks where that does not quite
> >>   * hold up; for example where a pin with type 0x01 (Power down) is mapped to
> >> @@ -290,6 +295,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
> >>  	switch (type) {
> >>  	case INT3472_GPIO_TYPE_RESET:
> >>  	case INT3472_GPIO_TYPE_POWERDOWN:
> >> +	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
> >>  		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, con_id, gpio_flags);
> >>  		if (ret)
> >>  			err_msg = "Failed to map GPIO pin to sensor\n";
> > 
> > I was informed about existance of this patch through an off-band channel 
> > (as I was not among receipients). In future, please include all relevant 
> > maintainers and MLs as receipients as indicated by 
> > scripts/get_maintainers.pl.

Hans used to handle these previously and I think that's why you weren't
cc'd.

> > 
> > This may go through a media tree,
> > 
> > Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Thank you!

> > 
> > 
> 
> Thanks a lot and sorry for the trouble caused by me.

No worries.

-- 
Kind regards,

Sakari Ailus

