Return-Path: <linux-media+bounces-17968-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C60097130D
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 11:13:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E5101F229BB
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 09:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCD001B2EF4;
	Mon,  9 Sep 2024 09:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Nm6fxUam"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC131B2ECF;
	Mon,  9 Sep 2024 09:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725873197; cv=none; b=atfKy/w0ytOdmSpWopVi0xwpGy9jywKC+2uCYYXiKKFK9r6hcFVXOjbL4EWNmy7Scuok0VMD3Xfl3JdOA5X4iSwrzd+i/yhEG9xXDSv8R2oD1rHFCReCIRqEO3vq8P7Dq5Y6im+oA8L4xGbvNiNiF8b74LZLBQWWRB/F+XpBgLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725873197; c=relaxed/simple;
	bh=e2ZtB7/J/dXnRJ3lIbCKVoMI6QBb+RQ9HEmJypzOLus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uw/Oa9GcWnDJLVlace2jF255zNfWTfvt/UNI7Rz3XJo5hfkJh+PMWGWkoqDhVcE+oQOSbKbqjcPnfnQy37fI4PjgAtiWrzirvnZ5A1pZ2Nhg2wf372UVV+YlnWdkrhSGvOom13sqNtlminfmGD4jsTjDnzl77SpHMRx87niGtwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Nm6fxUam; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [213.208.157.109])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 066356EC;
	Mon,  9 Sep 2024 11:11:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725873117;
	bh=e2ZtB7/J/dXnRJ3lIbCKVoMI6QBb+RQ9HEmJypzOLus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nm6fxUamoqf9FVPhR27x5kHHzMJvdy5JYdIx5BAkw7hGYyej0KQTJVwloDyVbkcpI
	 U10/RsZYyT8ZGr3iwr0TxRDXb96BmbsaQH2rLF9joOMIWfZG+mENhGfrRRfmgU+UsL
	 2pZrK/V9j8anOzXnwiuA3CYwQwI/jA4/D+JX2+eo=
Date: Mon, 9 Sep 2024 11:13:07 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Naushir Patuck <naush@raspberrypi.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 3/4] media: raspberrypi: Add support for RP1-CFE
Message-ID: <yib2r4wisxvk3kgogbjqawrpmfq6lcezfk4xjmftj44jzkbclc@icapodv2ffzk>
References: <20240904-rp1-cfe-v4-3-f1b5b3d69c81@ideasonboard.com>
 <202409051822.ZzUGw3XQ-lkp@intel.com>
 <20240905111120.GK16183@pendragon.ideasonboard.com>
 <40cc1e95-b9fc-4c27-9428-1698d0bf9d25@ideasonboard.com>
 <763b3147-d7cb-44a7-b73b-8f7f4fd622ab@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <763b3147-d7cb-44a7-b73b-8f7f4fd622ab@ideasonboard.com>

Hi Tomi

On Mon, Sep 09, 2024 at 08:22:59AM GMT, Tomi Valkeinen wrote:
> Hi Laurent, Jacopo,
>
> On 09/09/2024 08:08, Tomi Valkeinen wrote:
> > Hi,
> >
> > On 05/09/2024 14:11, Laurent Pinchart wrote:
> > > On Thu, Sep 05, 2024 at 06:50:48PM +0800, kernel test robot wrote:
> > > > Hi Tomi,
> > > >
> > > > kernel test robot noticed the following build warnings:
> > > >
> > > > [auto build test WARNING on 431c1646e1f86b949fa3685efc50b660a364c2b6]
> > > >
> > > > url:    https://github.com/intel-lab-lkp/linux/commits/Tomi-
> > > > Valkeinen/media-uapi-Add-meta-formats-for-PiSP-FE-config-and-
> > > > stats/20240904-192729
> > > > base:   431c1646e1f86b949fa3685efc50b660a364c2b6
> > > > patch link:    https://lore.kernel.org/r/20240904-rp1-cfe-v4-3-
> > > > f1b5b3d69c81%40ideasonboard.com
> > > > patch subject: [PATCH v4 3/4] media: raspberrypi: Add support
> > > > for RP1-CFE
> > > > config: m68k-allmodconfig (https://download.01.org/0day-ci/
> > > > archive/20240905/202409051822.ZzUGw3XQ-lkp@intel.com/config)
> > > > compiler: m68k-linux-gcc (GCC) 14.1.0
> > > > reproduce (this is a W=1 build):
> > > > (https://download.01.org/0day-ci/
> > > > archive/20240905/202409051822.ZzUGw3XQ-lkp@intel.com/reproduce)
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a
> > > > new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-
> > > > all/202409051822.ZzUGw3XQ-lkp@intel.com/
> > > >
> > > > All warnings (new ones prefixed by >>):
> > > >
> > > > > > drivers/media/platform/raspberrypi/rp1-cfe/cfe.c:2445:12:
> > > > > > warning: 'cfe_runtime_resume' defined but not used
> > > > > > [-Wunused-function]
> > > >      2445 | static int cfe_runtime_resume(struct device *dev)
> > > >           |            ^~~~~~~~~~~~~~~~~~
> > > > > > drivers/media/platform/raspberrypi/rp1-cfe/cfe.c:2435:12:
> > > > > > warning: 'cfe_runtime_suspend' defined but not used
> > > > > > [-Wunused-function]
> > > >      2435 | static int cfe_runtime_suspend(struct device *dev)
> > > >           |            ^~~~~~~~~~~~~~~~~~~
> > > > vim +/cfe_runtime_resume +2445
> > > > drivers/media/platform/raspberrypi/ rp1-cfe/cfe.c
> > >
> > > The recommended way to fix this is to switch from SET_RUNTIME_PM_OPS()
> > > to RUNTIME_PM_OPS() and use pm_ptr() to set .driver.pm. This being said,
> > > the driver won't work on a kernel with !CONFIG_PM given how you
> > > implemented probe() and remove().
> > >
> > > The pisp-be driver suffered from the same issue and Jacopo fixed it in
> > > the last version. You can have a look at implement something similar.
> >
> > I can't right away think of any reason to not just depend on CONFIG_PM
> > and be done with it without any tricks. Do you know if there's a reason?

We had the same discussion, and even if I would be fine depending on
CONFIG_PM, supporting !CONFIG_PM is not that much work, I kept it as
an optional dependency (it was suggested during the review as well)

>
> Also, I don't think pisp-be is correct. It just calls
> pispbe_runtime_resume() in probe() to wake the IP up (which only enables
> pisp clock), without telling the runtime PM about it. This means the parent
> device and the suppliers may not be powered up.

Are you referring to the code currently in the tree or to this patch ?
https://patchwork.linuxtv.org/project/linux-media/patch/20240904095836.344833-5-jacopo.mondi@ideasonboard.com/

>
>  Tomi
>
>

