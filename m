Return-Path: <linux-media+bounces-31559-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2801AA6E84
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 11:54:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 255F4467314
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 09:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6626B235066;
	Fri,  2 May 2025 09:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZ7MsxuF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC82231831
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 09:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746179689; cv=none; b=fmwbYWTrA+2+YuJhFKWx2PK6jD/bqaJRDquiA8Su3mwxrq7/FWQnbyPa33g5OlK639XKybVZwmnJ1dzkV9BEh+45zK4wzW2w1PWzOS4Q4Ye1D6dX+9DRpyAGPv0ShPwR3WKV4ogXPi0646QzPXOQ0iunLNliQLg1Pp4UdX5h2oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746179689; c=relaxed/simple;
	bh=Onp5MzMeToLO312ahu3KnFuvC1mNmnpUnBcYsbnwUPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzAPbgBskTIGOg60fGUqDKAgPsymB/UbErTc80AUvaX0JPUgUKRAAJzyMU5EhtCL4/rJ+tPcAsmh08F+XXa0YSwYetAlp9+odVlrfen55hjFrBTREX0SuIg9r/Z6bGQh4HqhS+DKqjyhVtI4TaWk47DVpUuJF8e86a5CRoTU+G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jZ7MsxuF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746179688; x=1777715688;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Onp5MzMeToLO312ahu3KnFuvC1mNmnpUnBcYsbnwUPI=;
  b=jZ7MsxuFTU3GBw3KzBLbzkZh53yPJJI0BqY9V4/lPrSx4kuovKEfifaY
   KYJcljZKscNyTdACnUlO2krUrDZpD0WNOlAgRdFQz+gWY2kx2OagM7kGb
   76llT9tTAHsmGXC3XH+JSVEPSfeB8fV0sqT8tIGs1vak8xkYWSw7WTt8O
   pRljcimziqwV5cLZYdE4fRsrAVslrAHuWSs9GnmS4AFE1V12lmyXbi0EY
   DXs6S1mkXEWJOULABO3BRTh3Q2ZgzuStPg/upIxJDQRlGr5kP+/kehvIx
   DIEd7RiYmFgoML7blCp0YncJIhnz21OZTPWE2rWF7DZtkN+mHECSp5fu5
   g==;
X-CSE-ConnectionGUID: SKNc2ehzTJ+cIbUFKKeizQ==
X-CSE-MsgGUID: pDsyf9tRQtekfKYdSbPh/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="48003320"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="48003320"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 02:54:47 -0700
X-CSE-ConnectionGUID: HQ/wl0AKSomKlgLiUa83GA==
X-CSE-MsgGUID: wSBg3Kz8S+uhyTULtXt00A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="135580686"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.61])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 02:54:46 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 83B3911F995;
	Fri,  2 May 2025 12:54:43 +0300 (EEST)
Date: Fri, 2 May 2025 09:54:43 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH v2 2/5] media: intel/ipu6: Remove ipu6_isys dependency
 from ipu6_isys_subdev
Message-ID: <aBSWY4uOroyHNOIF@kekkonen.localdomain>
References: <20250428161643.321617-1-stanislaw.gruszka@linux.intel.com>
 <20250428161643.321617-3-stanislaw.gruszka@linux.intel.com>
 <aBSWJ0zUZg3fzlIc@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBSWJ0zUZg3fzlIc@kekkonen.localdomain>

On Fri, May 02, 2025 at 09:53:43AM +0000, Sakari Ailus wrote:
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
> > index e5ce76c17ca3..7c6125dc4af4 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
> > @@ -265,10 +265,9 @@ static const struct v4l2_subdev_internal_ops ipu6_isys_subdev_internal_ops = {
> >  	.init_state = ipu6_isys_subdev_init_state,
> >  };
> >  
> > -int ipu6_isys_subdev_init(struct ipu6_isys_subdev *asd,
> > +int ipu6_isys_subdev_init(struct ipu6_isys_subdev *asd, struct device *dev,
> 
> I wouldn't pass a function arguments that it already has access to through
> other means, i.e. dev in this case.

Oh, please ignore the above. The comment below still holds though. :-)

> 
> That being said, having a macro to obtain a struct device pointer based on
> sub-device or isys could be nice, it could be called e.g.
> ipu_isys_to_dev(). As this patch is simply moving the code around I'd add
> this in a separate patch.

-- 
Sakari Ailus

