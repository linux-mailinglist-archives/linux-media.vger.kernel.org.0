Return-Path: <linux-media+bounces-48378-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5773FCACC61
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 10:58:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 319B330A2150
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 09:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6AB31328B;
	Mon,  8 Dec 2025 09:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bEqCWnCS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37FE31283A;
	Mon,  8 Dec 2025 09:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765186775; cv=none; b=UOB882TWImQlUv8i+OaA+IheS/GMbYBA1yq0n2jev6dTfQwfG3dd8gZ1SRXHdSHBNxlDPeE//nmT/GPGsPdu7uUT4J8KsdXpDdt+U5weYv/5oXlDTydygbi1+kto8/DC5MNn6EZgK9TTOq5oCbgiLQ4Qv8dYzVnWPWodOENQykQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765186775; c=relaxed/simple;
	bh=gviCjbnq56aby5scYS69BYxhiq8umHHOwc1Xjn9kZt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TAr3vFooO3MnnmdNkEXdFplGsWLRxwhHGGoWkUHLljoZmehVn2T1nAao5Xm4SrhcxnYm1SYkZcX1hz0WldkScPS7eZDnfvOEedz7scs2s3Uj5L65eYf+A3jjJKFcx7b8sdV+jKZZYWv2V/AaJ4K9geK/mEIO0HD0y/r8+e2f2wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bEqCWnCS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765186774; x=1796722774;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gviCjbnq56aby5scYS69BYxhiq8umHHOwc1Xjn9kZt8=;
  b=bEqCWnCSpxYxr68wGM95Tz2Nkus3vis6Gyvo42oBRzIKoecrGWmSdGLQ
   9tultp9brcz/C/eeMtTe725qzm/x2YPs+pkIKvFSCOMM5FAfhmp4MdPiB
   BvB9z96i+Gbj13xBVN7SRb/bkBHXA/9S4W1ZD7HoIfCPR8sVQxRXQo7m8
   hDN+lEY0B9dZx5QMICEwkHen/XP+ODH05n5dNkZDLc6N5mbJL+L3I3Ac3
   oIqh/7LBVO2HdIrZMZxL+1t3r3/IQm/0J9TY05Dm06gP0NmGuBkofXSBM
   oN8mLhSyG+utAoRo6ZVPXdI6HppAXL2B46p/jHT3wYHmF7iHJwdJlSsCS
   Q==;
X-CSE-ConnectionGUID: G69SLJcdScu5MqM1ijmZxg==
X-CSE-MsgGUID: 98muNtudS1WBWhhvASCRtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="66125950"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="66125950"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 01:39:33 -0800
X-CSE-ConnectionGUID: s+tAqjc7Q/qgg4vgmKkhig==
X-CSE-MsgGUID: ZgakUZQbS7GyeJ/XNvYWIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="226549812"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.255])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 01:39:27 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AC69E1207CE;
	Mon, 08 Dec 2025 11:39:33 +0200 (EET)
Date: Mon, 8 Dec 2025 11:39:33 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Rishikesh Donadkar <r-donadkar@ti.com>, jai.luthra@linux.dev,
	laurent.pinchart@ideasonboard.com, mripard@kernel.org,
	y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com,
	vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, p.zabel@pengutronix.de, conor+dt@kernel.org,
	hverkuil-cisco@xs4all.nl, tomi.valkeinen@ideasonboard.com,
	changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com,
	sjoerd@collabora.com, dan.carpenter@linaro.org,
	hverkuil+cisco@kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 17/18] media: ti: j721e-csi2rx: Support runtime suspend
Message-ID: <aTac1eXTlzPaE-EQ@kekkonen.localdomain>
References: <20251112115459.2479225-1-r-donadkar@ti.com>
 <20251112115459.2479225-18-r-donadkar@ti.com>
 <aR8UlHdBppncdlRD@kekkonen.localdomain>
 <176518004114.20066.3953707820070167261@freya>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176518004114.20066.3953707820070167261@freya>

Hi Jai,

On Mon, Dec 08, 2025 at 01:17:21PM +0530, Jai Luthra wrote:
> > > @@ -1579,6 +1622,10 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
> > >               goto err_notifier;
> > >       }
> > >  
> > > +     pm_runtime_set_active(csi->dev);
> > > +     pm_runtime_enable(csi->dev);
> > 
> > Note that the sub-device driver's UAPI may be already available to users
> > when the async sub-device is registered. Therefore you'll need enable
> > runtime PM before that.
> > 
> 
> The only place where the driver actually writes registers to the hardware
> is in .start_streaming(), which I presume can only be called after the
> whole media pipeline is probed?

Correct, but without enabling runtime PM before registering the async
sub-device there's no guarantee of that order.

> 
> > > +     pm_request_idle(csi->dev);
> > > +
> > >       return 0;
> > >  
> > >  err_notifier:
> > > @@ -1609,6 +1656,9 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
> > >       mutex_destroy(&csi->mutex);
> > >       dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
> > >                         csi->drain.paddr);
> > 
> > Is there a guarantee the device is in a particular runtime PM state here,
> > e.g. suspended?
> > 
> 
> I don't think so, userspace could attempt to remove the device while
> streaming. Good point, I haven't checked what all goes wrong in that case.

We don't really support that yet. :-)

I'd still check the runtime Pm state and if it's active, I'd power the
device off.

> 
> > > +     pm_runtime_disable(&pdev->dev);
> > > +     pm_runtime_set_suspended(&pdev->dev);
> > > +
> > >  }
> > >  
> > >  static const struct of_device_id ti_csi2rx_of_match[] = {
> > > @@ -1623,6 +1673,7 @@ static struct platform_driver ti_csi2rx_pdrv = {
> > >       .driver = {
> > >               .name = TI_CSI2RX_MODULE_NAME,
> > >               .of_match_table = ti_csi2rx_of_match,
> > > +             .pm             = &ti_csi2rx_pm_ops,
> > >       },
> > >  };
> > >  
> > 

-- 
Kind regards,

Sakari Ailus

