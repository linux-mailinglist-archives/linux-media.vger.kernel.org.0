Return-Path: <linux-media+bounces-18059-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0C9972D95
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 11:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A7BB1F262D1
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 09:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF63118D649;
	Tue, 10 Sep 2024 09:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j8G4ak1S"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAA0188CCB;
	Tue, 10 Sep 2024 09:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725960366; cv=none; b=LzPq6AcBsDhTf8RZGbM1AvfN2MSxeUkQGqzC86j9ZJ9H5lgyE7R56rwdncS+a1GtlNBohzmf5iKlPOpyZxdilmigodskkZnDLBgkHHDP/+ZAlhv+E795x5ZM4X9niFIMFSGLSSj7c8IPt7yw8F+LkpQn/YVEFRVm/Di6PBsusV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725960366; c=relaxed/simple;
	bh=LRHeTsxWfDELiybzeGmOm0O0UOGwOPx1jGxPuXuL8+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZmlhcoynEqJBM6KCkCvawembRN39Z4MS1HLsjZ26cOUw7rxmUDeaU7V9QnA5X6b6etyGALA4D3ggRLIfIaAoJcJrJZM8x1TXn11ugvuF5HhiV9SoNqXcRRiJWm2iUeqd+rgSlaFgo7g+VYb0m4RKvsD2H0FsfYgWWDrRTki+RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j8G4ak1S; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725960365; x=1757496365;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=LRHeTsxWfDELiybzeGmOm0O0UOGwOPx1jGxPuXuL8+k=;
  b=j8G4ak1SxtEjhuERlwwkftjX99afFOBJrxDC5Uf4klUIir6fB3aa5+xc
   NwgQhSUiEegf1bZopm6Hdh1wlo8R4lS4/XeI7qrZVwudtkGjeA07aXtGf
   X3AgCnX2FUJBSqhZN8Z17aLYRVleiYanVPR787sNJnlGBgPFogM6LI00E
   7hi0WdWdApxc3wSwemTqcPXfY5WCxML8IvCJz3pS4ycudoGXv7imWnQw3
   uzoyBla1WkH01rsi6uQy1O6mPssoNthyziURTpnXz1HWP45ZGbysLtbGd
   +/oH9Ohlum/o2Q4J80ANX771YSuC0FJ6mjRH0MCo+5S7q515GAcZnf4mi
   w==;
X-CSE-ConnectionGUID: eVFjiTMuRhykKNOn0Gv8/A==
X-CSE-MsgGUID: 9gVFfAaeSICOd3vXA834Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="36075600"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="36075600"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 02:26:04 -0700
X-CSE-ConnectionGUID: MBWYuWlqTwKVfDa3tVlqow==
X-CSE-MsgGUID: U+DDdEFtSJWVKqMQ5AAh8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="67215343"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 02:25:59 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8054311F83C;
	Tue, 10 Sep 2024 12:25:56 +0300 (EEST)
Date: Tue, 10 Sep 2024 09:25:56 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 3/4] media: raspberrypi: Add support for RP1-CFE
Message-ID: <ZuAQpITcee2SSYKk@kekkonen.localdomain>
References: <202409051822.ZzUGw3XQ-lkp@intel.com>
 <20240905111120.GK16183@pendragon.ideasonboard.com>
 <40cc1e95-b9fc-4c27-9428-1698d0bf9d25@ideasonboard.com>
 <763b3147-d7cb-44a7-b73b-8f7f4fd622ab@ideasonboard.com>
 <yib2r4wisxvk3kgogbjqawrpmfq6lcezfk4xjmftj44jzkbclc@icapodv2ffzk>
 <d5188c0a-4a52-4378-89b1-48f606e448cc@ideasonboard.com>
 <ggtlreq5gyhzfdv6yzeuia46y7fxpuyvg236prig52t43xsl2a@crlqks2nhfpe>
 <20240909134516.GA9448@pendragon.ideasonboard.com>
 <Zt8ZysTT5DIZr-J7@kekkonen.localdomain>
 <jdtjdspf4qyrgn6jmyxeab5ueo53wjd5vuhvlpin3pdiyifwht@dndfcqnmv7sd>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <jdtjdspf4qyrgn6jmyxeab5ueo53wjd5vuhvlpin3pdiyifwht@dndfcqnmv7sd>

Hi Jacopo,

On Tue, Sep 10, 2024 at 11:19:57AM +0200, Jacopo Mondi wrote:
> Hi Sakari, Tomi
> 
> On Mon, Sep 09, 2024 at 03:52:42PM GMT, Sakari Ailus wrote:
> > Hi Laurent,
> >
> > On Mon, Sep 09, 2024 at 04:45:16PM +0300, Laurent Pinchart wrote:
> > > On Mon, Sep 09, 2024 at 03:29:30PM +0200, Jacopo Mondi wrote:
> > > > On Mon, Sep 09, 2024 at 01:04:35PM GMT, Tomi Valkeinen wrote:
> > > > > On 09/09/2024 12:13, Jacopo Mondi wrote:
> > > > > > On Mon, Sep 09, 2024 at 08:22:59AM GMT, Tomi Valkeinen wrote:
> > > > > > > On 09/09/2024 08:08, Tomi Valkeinen wrote:
> > > > > > > > On 05/09/2024 14:11, Laurent Pinchart wrote:
> > > > > > > > > On Thu, Sep 05, 2024 at 06:50:48PM +0800, kernel test robot wrote:
> > > > > > > > > > Hi Tomi,
> > > > > > > > > >
> > > > > > > > > > kernel test robot noticed the following build warnings:
> > > > > > > > > >
> > > > > > > > > > [auto build test WARNING on 431c1646e1f86b949fa3685efc50b660a364c2b6]
> > > > > > > > > >
> > > > > > > > > > url:    https://github.com/intel-lab-lkp/linux/commits/Tomi-
> > > > > > > > > > Valkeinen/media-uapi-Add-meta-formats-for-PiSP-FE-config-and-
> > > > > > > > > > stats/20240904-192729
> > > > > > > > > > base:   431c1646e1f86b949fa3685efc50b660a364c2b6
> > > > > > > > > > patch link:    https://lore.kernel.org/r/20240904-rp1-cfe-v4-3-
> > > > > > > > > > f1b5b3d69c81%40ideasonboard.com
> > > > > > > > > > patch subject: [PATCH v4 3/4] media: raspberrypi: Add support
> > > > > > > > > > for RP1-CFE
> > > > > > > > > > config: m68k-allmodconfig (https://download.01.org/0day-ci/
> > > > > > > > > > archive/20240905/202409051822.ZzUGw3XQ-lkp@intel.com/config)
> > > > > > > > > > compiler: m68k-linux-gcc (GCC) 14.1.0
> > > > > > > > > > reproduce (this is a W=1 build):
> > > > > > > > > > (https://download.01.org/0day-ci/
> > > > > > > > > > archive/20240905/202409051822.ZzUGw3XQ-lkp@intel.com/reproduce)
> > > > > > > > > >
> > > > > > > > > > If you fix the issue in a separate patch/commit (i.e. not just a
> > > > > > > > > > new version of
> > > > > > > > > > the same patch/commit), kindly add following tags
> > > > > > > > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > > > > > > > | Closes: https://lore.kernel.org/oe-kbuild-
> > > > > > > > > > all/202409051822.ZzUGw3XQ-lkp@intel.com/
> > > > > > > > > >
> > > > > > > > > > All warnings (new ones prefixed by >>):
> > > > > > > > > >
> > > > > > > > > > > > drivers/media/platform/raspberrypi/rp1-cfe/cfe.c:2445:12:
> > > > > > > > > > > > warning: 'cfe_runtime_resume' defined but not used
> > > > > > > > > > > > [-Wunused-function]
> > > > > > > > > >       2445 | static int cfe_runtime_resume(struct device *dev)
> > > > > > > > > >            |            ^~~~~~~~~~~~~~~~~~
> > > > > > > > > > > > drivers/media/platform/raspberrypi/rp1-cfe/cfe.c:2435:12:
> > > > > > > > > > > > warning: 'cfe_runtime_suspend' defined but not used
> > > > > > > > > > > > [-Wunused-function]
> > > > > > > > > >       2435 | static int cfe_runtime_suspend(struct device *dev)
> > > > > > > > > >            |            ^~~~~~~~~~~~~~~~~~~
> > > > > > > > > > vim +/cfe_runtime_resume +2445
> > > > > > > > > > drivers/media/platform/raspberrypi/ rp1-cfe/cfe.c
> > > > > > > > >
> > > > > > > > > The recommended way to fix this is to switch from SET_RUNTIME_PM_OPS()
> > > > > > > > > to RUNTIME_PM_OPS() and use pm_ptr() to set .driver.pm. This being said,
> > > > > > > > > the driver won't work on a kernel with !CONFIG_PM given how you
> > > > > > > > > implemented probe() and remove().
> > > > > > > > >
> > > > > > > > > The pisp-be driver suffered from the same issue and Jacopo fixed it in
> > > > > > > > > the last version. You can have a look at implement something similar.
> > > > > > > >
> > > > > > > > I can't right away think of any reason to not just depend on CONFIG_PM
> > > > > > > > and be done with it without any tricks. Do you know if there's a reason?
> > > > > >
> > > > > > We had the same discussion, and even if I would be fine depending on
> > > > > > CONFIG_PM, supporting !CONFIG_PM is not that much work, I kept it as
> > > > > > an optional dependency (it was suggested during the review as well)
> > > > > >
> > > > > > >
> > > > > > > Also, I don't think pisp-be is correct. It just calls
> > > > > > > pispbe_runtime_resume() in probe() to wake the IP up (which only enables
> > > > > > > pisp clock), without telling the runtime PM about it. This means the parent
> > > > > > > device and the suppliers may not be powered up.
> > > > > >
> > > > > > Are you referring to the code currently in the tree or to this patch ?
> > > > > > https://patchwork.linuxtv.org/project/linux-media/patch/20240904095836.344833-5-jacopo.mondi@ideasonboard.com/
> > > > >
> > > > > Ah, I missed that one.
> > > > >
> > > > > I don't think it fixes the issue I mentioned. If we have PM enabled, and the
> > > > > parent device requires powering up for the child device (BE) to be
> > > > > accessible, the driver will crash when calling pispbe_hw_init(). I think you
> > > > > should call pm_runtime_set_active() before calling pispbe_runtime_resume().
> > > >
> > > > As discussed, this is not a problem currently for BE, but indeed you
> > > > have a point.
> 
> I admit the runtime_pm intrinsics are obscure to me, but Laurent just
> made me notice something.
> 
> Consider the following scenario
> 
> *) Kernel compiled with CONFIG_PM
> *) i2c sensor driver that supports both CONFIG_PM and !CONFIG_PM by:
>   *) Manually power up the sensor during probe
>   *) Call pm_runtime_enable() and pm_runtime_set_active() at the end
>      of the probe routine after having accessed the chip over i2c
>      (like most, if not all the i2c drivers in mainline do including
>      ccs)
> 
> All these drivers work, and during the probe routine before accessing
> the HW, they don't need to power up the parent i2c controller.

This isn't done explicitly by the I²C drivers, indeed but...

> 
> Might it be that during probe() the parent is guaranteed to be enabled ?

...yes.

> 
> I add a look in the driver-core and pm Documentation/ but found
> nothing.
> 
> A quick stroll in driver/base/ got me to __device_attach() and it
> seems parents are powered up before attaching a driver to a device
> (which in my understanding should be what ends up calling probe()).
> Clearly I've no real understanding of what I'm talking about when it
> comes to driver-core, so take this with a grain of salt.

This only works with runtime PM enabled.

> 
> > > >
> > > > Sad note: most of all the occurrences of "grep set_active" in
> > > > drivers/media/platform/ show that set_active() is used as I've done in
> > > > my patch
> > > >
> > > > > However, you said above that "supporting !CONFIG_PM is not that much work".
> > > > > Maybe not. But how much work is it to get it right (for both PM and !PM),
> > > > > and make sure it stays right? =).
> > > > >
> > > > > Just my opinion, but if there are zero use cases for the !PM, I would just
> > > > > go with "depends on PM" to keep the driver simpler, less bug-prone, and
> > > > > easier to maintain.
> > >
> > > I'm fine with that, and for platform drivers, that's my preferred
> > > option. Sakari ?
> >
> > I'm concerned with your (?) recent finding that many architectures don't
> > have support for CONFIG_PM. In this case the device is very unlikely to be
> > used outside ARM(64) so I guess it's fine.
> >
> 
> Also, this IP is RPi specific, and the !CONFIG_PM case is not used or
> tested on Pi.
> 
> However, I think this current patch is correct (assuming the above
> reasoning on i2c sensor drivers is correct) and doesn't require
> CONFIG_PM, so I would be tempted to keep this version.

I understand the current patch does depend on CONFIG_PM: it requires
runtime PM to be operational to start the clock, for instance.

> 
> > >
> > > > I don't see a use case for !PM and we confirmed with RPi they don't
> > > > need to support it. During the review of a previous version of the BE
> > > > driver iirc I've been asked to support !PM but I'm not sure I recall
> > > > the reasons.
> > >
> > > I hope it wasn't me :-)
> >
> > Me neither. Although it'd be nice: CONFIG_PM isn't a hardware specific
> > option as such. As one part of the kernel requires !CONFIG_PM and another
> > CONFIG_PM, we can expect problems, at least in principle.
> >
> > Ideally all architectures would support it so CONFIG_PM could be removed
> > and we could say the problem has been solved. :-)

-- 
Kidnregards,

Sakari Ailus

