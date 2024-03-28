Return-Path: <linux-media+bounces-8145-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CBA890CC5
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 22:57:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B35AA294057
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 21:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C1613B287;
	Thu, 28 Mar 2024 21:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VhMHpfD2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EBC4EB4C
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 21:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711663073; cv=none; b=a6ov9BJetvDOLeydkoY80BdWj2kncNlQ6yHUO6hh8lAMZH2O8eeleO73HyS9bGUfOQ4cld5AZb3Up7NZXFRs+xT+52pT2xd7zzsTEpHYP9bJl2rHzmZY33ibNv44yOyrEWMN1+wAC+bbSp6U7N6HpANG53wpS+SMcXE6YKk8P54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711663073; c=relaxed/simple;
	bh=yvRW2Ztx/gYEvNzPtywlDl5Y7UC/bCdfDVm8Y5aJ3XY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qdOfTPyJ3Gepam9lfMVghsuXo+j3oPFXJngHu48Fkjgizp7oeUrIYoERcmXGV0Rer/l4Y7JKVyc7YNDaN4NNQ/T3ki1bt4pwS6q/KyzggphmilUmeWOpUDVYsgphOl3hU7d/EoKSu58n1k0Rw5Z39uSbMTgQde9mJr+y0IpH+Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VhMHpfD2; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711663072; x=1743199072;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yvRW2Ztx/gYEvNzPtywlDl5Y7UC/bCdfDVm8Y5aJ3XY=;
  b=VhMHpfD2C3jxGGZNBbhF5QNmvH/TEK0+UiWyion2V95pREp+FS6hZh4s
   QjTDxjKH7p7XXzxPvHwMG5ykZFSlTlQr2Qp6lb0NiGwALtKGhBJ1ujbRh
   YWT4+xTAQtrFHR1G5F8g5j4bTH+3x4p2DtwWfUoKgRYJr+zXP/MK6IPr/
   BODUUfRHq7yXOWshhpBQgL9V6r+xf3m9YRIkiUvPuZKdjyyg2QLIEjo0D
   qgGjmpEI01yNdGvTzC5/VKJ7ZzT+6TdBx68eJw2UXcyh6s8sj8vjdJgWF
   hLHqNaPhC4hYR/NCY51d5B834F1Ap08IJn/i8FmcMrm9HDF+8OTzIKq7q
   A==;
X-CSE-ConnectionGUID: A6CZo0bcQtuvtdKIgN7sIA==
X-CSE-MsgGUID: Aym7v1JISoO0RsmI6yia5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="24296170"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="24296170"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 14:57:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="16662181"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 14:57:49 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 43A3811F8B1;
	Thu, 28 Mar 2024 23:57:46 +0200 (EET)
Date: Thu, 28 Mar 2024 21:57:46 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: rmfrfs@gmail.com, hansg@kernel.org, linux-media@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 1/2] media: ov2680: Allow probing if link-frequencies is
 absent
Message-ID: <ZgXn2u4x6mLWMImc@kekkonen.localdomain>
References: <20240328051320.2428125-1-festevam@gmail.com>
 <ZgUiP2WnaAWnJ207@kekkonen.localdomain>
 <ZgXnZKhhOdpD4beP@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgXnZKhhOdpD4beP@kekkonen.localdomain>

On Thu, Mar 28, 2024 at 09:55:48PM +0000, Sakari Ailus wrote:
> On Thu, Mar 28, 2024 at 07:54:41AM +0000, Sakari Ailus wrote:
> > Hi Fabio,
> > 
> > On Thu, Mar 28, 2024 at 02:13:19AM -0300, Fabio Estevam wrote:
> > > From: Fabio Estevam <festevam@denx.de>
> > > 
> > > Since commit 63b0cd30b78e ("media: ov2680: Add bus-cfg / endpoint
> > > property verification") the ov2680 no longer probes on a imx7s-warp7:
> > > 
> > > ov2680 1-0036: error -EINVAL: supported link freq 330000000 not found
> > > ov2680 1-0036: probe with driver ov2680 failed with error -2
> > > 
> > > As the 'link-frequencies' property is not mandatory, allow the probe
> > > to succeed by skipping the link-frequency verification when the
> > > property is absent.
> > > 
> > > Fixes: 63b0cd30b78e ("media: ov2680: Add bus-cfg / endpoint property verification")
> > > Signed-off-by: Fabio Estevam <festevam@denx.de>
> > > ---
> > >  drivers/media/i2c/ov2680.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> > > index 39d321e2b7f9..f611ce3a749c 100644
> > > --- a/drivers/media/i2c/ov2680.c
> > > +++ b/drivers/media/i2c/ov2680.c
> > > @@ -1123,6 +1123,9 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
> > >  		goto out_free_bus_cfg;
> > >  	}
> > >  
> > > +	if (!bus_cfg.nr_of_link_frequencies)
> > > +		return 0;
> > > +
> > 
> > Thanks for the patch.
> > 
> > I'd still rather try to avoid going to this direction as these frequencies
> > are hardware dependent. Add a new one to the driver and some boards may
> > stop working properly. For details see
> > <URL:https://hverkuil.home.xs4all.nl/spec/driver-api/camera-sensor.html#handling-clocks>.
> 
> While the above holds, on second thought, the driver has been around for
> quite some time and indeed the added validation does break certain boards
> (at least without adding the link frequencies there).
> 
> So I'm fine with the patch.
> 
> I think this should also be cc'd to stable.

And this applies to the newer version of the patch that fixes the memory
leak, of course.

> 
> > 
> > >  	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++)
> > >  		if (bus_cfg.link_frequencies[i] == sensor->link_freq[0])
> > >  			break;
> > 
> 
> -- 
> Sakari Ailus

-- 
Sakari Ailus

