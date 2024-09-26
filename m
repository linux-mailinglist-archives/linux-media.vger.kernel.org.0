Return-Path: <linux-media+bounces-18605-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A610D986FBD
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 11:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65CD328371B
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 09:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C90D1A7AD8;
	Thu, 26 Sep 2024 09:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m541ZdnN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0E413D62B;
	Thu, 26 Sep 2024 09:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727342132; cv=none; b=CIPOloS9NvI7/JjYDsQNk7R3EBxRSthTkEd4Il4xtDOtmbyIV6zbv/9y+oowtfGb3+lpBvcsiDTcjvixsTDpQfQjfqGSqJumQmS++TeXyZ3j1mlq5bOSQKqcws3GHkybqIyMi1gwANO9/4BM9vNtbgiRBufSFN4BqK7mhFuKa3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727342132; c=relaxed/simple;
	bh=t52b6eEVFeh7vAeNYk36NpJtPvi1jrH1+vPlodx9txE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AyxXvF8m8yXqQBbRfZaO06A0INUCAvFeo/IWMDUD9Vy44UjAkHdo6rsEGc48MTyNTCcavzYTZf15696OF+fTB7Zgn8yzAb4qbEgJ6rg1SB3XoBswIQxICqyXDAlSZbbz4yA2uNzM0txmVEmShFCfevX24r0MuYeC7kayB8vrxFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m541ZdnN; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727342131; x=1758878131;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t52b6eEVFeh7vAeNYk36NpJtPvi1jrH1+vPlodx9txE=;
  b=m541ZdnNf+ULLTIQHchHCGFUSPK6+IsKpyI62K/FIQXRcnWQAMQNgCH0
   biwA6tPc2Nwjx+h9MAZ29qTMD8v4QkJwXbv7dsPNW/72dDsRBQ2sQOf3Z
   vVIa3nWEAyFZ0FNTyEaxX0F+VGdZUL6XYBDWqgMW0yNFNaxVEdHOxnsdj
   riAX6kDmB69PyBbQCFUamFVCpBsiH68Q4KfAbi1dpu2F2ArPkjbXhbM1g
   6DWrN82nHOWWUErrdCRwkdggnwWbEgo65aDo4gn72SWYBGWVE4hDyglBu
   OH2Mc2Rc+Zh7LES0j3SNsx1RL3ChH3bX+8DtaanZNI8dsbi4FvjiERQL8
   Q==;
X-CSE-ConnectionGUID: LPNlnmx1SMCF1g7r7JmscQ==
X-CSE-MsgGUID: ZyQ4Muu6Qg2Y1lpyLJKLjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="36988984"
X-IronPort-AV: E=Sophos;i="6.10,260,1719903600"; 
   d="scan'208";a="36988984"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 02:15:30 -0700
X-CSE-ConnectionGUID: 9OFVUKdLRm6pTw+dhT+qfA==
X-CSE-MsgGUID: xXJSVCtHRMah9HuTwI3otQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,260,1719903600"; 
   d="scan'208";a="76888054"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 02:15:27 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5F63611F843;
	Thu, 26 Sep 2024 12:15:23 +0300 (EEST)
Date: Thu, 26 Sep 2024 09:15:23 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v5 0/4] media: raspberrypi: Support RPi5's CFE
Message-ID: <ZvUmK3wGvcrytqg-@kekkonen.localdomain>
References: <20240910-rp1-cfe-v5-0-9ab4c4c8eace@ideasonboard.com>
 <fe968dc7-67a5-40be-871e-fe682dc60d70@ideasonboard.com>
 <yj5zt4a275pjedrxvs4ys2wgp5heblisihal6jrqdryoq3ydph@6rriiytwpkpq>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yj5zt4a275pjedrxvs4ys2wgp5heblisihal6jrqdryoq3ydph@6rriiytwpkpq>

Hi Jacopo,

On Thu, Sep 26, 2024 at 11:04:36AM +0200, Jacopo Mondi wrote:
> Hi Tomi
> 
> On Thu, Sep 26, 2024 at 10:13:29AM GMT, Tomi Valkeinen wrote:
> > Hi,
> >
> > On 10/09/2024 11:07, Tomi Valkeinen wrote:
> > > This series adds support to the CFE hardware block on RaspberryPi 5. The
> > > CFE (Camera Front End) contains a CSI-2 receiver and Front End, a small
> > > ISP.
> > >
> > > To run this, you need the basic RPi5 kernel support plus relevant dts
> > > changes to enable the cfe and camera. My work branch with everything
> > > needed to run CFE can be found from:
> > >
> > > git://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git rp1-cfe
> > >
> > > A few notes about the patches:
> > >
> > > - The original work was done by RaspberryPi, mostly by Naushir Patuck.
> > > - The second video node only sets V4L2_CAP_META_CAPTURE instead of both
> > >    V4L2_CAP_META_CAPTURE and V4L2_CAP_META_CAPTURE like the other nodes.
> > >    This is a temporary workaround for userspace (libcamera), and
> > >    hopefully can be removed soon.
> > >
> > > I have tested this with:
> > > - A single IMX219 sensor connected to the RPi5's CSI-2 port
> > > - Arducam's UB960 FPD-Link board with four imx219 sensors connected
> > >
> > >   Tomi
> > >
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > ---
> > > Changes in v5:
> > > - Add "depends on PM". The platforms that use CFE will always have PM in
> > >    practice, and it's not worth supporting both the PM and !PM cases as
> > >    it adds complexity to the driver.
> > > - Link to v4: https://lore.kernel.org/r/20240904-rp1-cfe-v4-0-f1b5b3d69c81@ideasonboard.com
> >
> > Is this solution to the PM issue ok for everyone? It feels most sensible to
> > me. Any other comments?
> 
> There was consensus at the media summit that platform drivers are
> allowed to depend on PM.

I'd say you should have generally a good idea these devices aren't found in
systems without runtime PM support and that mostly applies to platform
drivers.

> 
> I'll do the same for my latest PiSP BE series.

Ack.

-- 
Kind regards,

Sakari Ailus

