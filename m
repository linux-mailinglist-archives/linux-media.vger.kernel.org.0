Return-Path: <linux-media+bounces-35890-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AC5AE8961
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 18:14:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFB194A177A
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 16:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD10129AAEA;
	Wed, 25 Jun 2025 16:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XWXFFGzA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EE52BEFE9
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 16:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750867996; cv=none; b=ZHuCZixW6XjQpaFpUwbejo1GndJNuwTssJAXYhuTqInp7o7FG9Z0JF4QoA8zrQh9uJK//Iawvus98Zs6YEudJ/jBsNTCEumDfC/WLZxztjC1okT+j7chyssOZILmD4oVwy/w3ixkp8VBJjNC+zdk07InkztX0hGCBaxQiuDIFtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750867996; c=relaxed/simple;
	bh=jxwPWTP7SVp3pPaEHX2z0RPFIjZZfZ4m6EN/P1rYnwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=keVm/cbmuXX5wRBLBT7zI9eIPJekMW+D5X2MjHt301eW9MZNPG/sNdCOq15yp4vEa67b9/foKsFruzFfqlrifSYVAk89BLbIVwY81JtWi3pBO5VfBaOuqYG87JewR5sBd0JybRc09bby6Vp62kLS77mRzvXdkphbWqQPmebB5g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XWXFFGzA; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750867994; x=1782403994;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jxwPWTP7SVp3pPaEHX2z0RPFIjZZfZ4m6EN/P1rYnwY=;
  b=XWXFFGzA4IrCcUyx8j6sGtY2lCIjbsyDur8NPWSyalHGtBS7mMpj+3UO
   xF5lN4cdeNWfp5lNd/SrLqtaF0bJAX1qnQe9sjSCqiiFNtGvOt5SDo+LG
   ejL7tSQhWw7OiFUfwCSHZMC1LwoyD2SBAIWOQpvyqsg0AjBfTmsbWDI73
   I88kIxMUZIcsThbr4ddKuxBfRxBtOWSHBGTNN2ngZvxNQH1A0tJu8P3gB
   7iUOWj8UN6SlkSLot9TkxrLCm4jjIHPvPJ6BNw3jbRB3QV5zHJN4vPULX
   JCrcabNnDGU/hTFjBa1pxu6CEwTYDFV96cCcfwlXTPSc57Xo9D6cBsqPS
   g==;
X-CSE-ConnectionGUID: DA2t1DzjRbuC5Fg/FqGecA==
X-CSE-MsgGUID: AV6YK3Z+RSmsoHHBpmLvTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="78574919"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="78574919"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 09:12:45 -0700
X-CSE-ConnectionGUID: FdtR2iv9RXKKrkmt1z1+PA==
X-CSE-MsgGUID: aLKRbM3rRzCsuOxoJIxSHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="151776855"
Received: from agladkov-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.57])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 09:12:42 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6884F11F737;
	Wed, 25 Jun 2025 19:12:39 +0300 (EEST)
Date: Wed, 25 Jun 2025 16:12:39 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 08/13] media: v4l2-subdev: Print early in
 v4l2_subdev_{enable,disable}_streams()
Message-ID: <aFwf9zTr8Ii4ro_5@kekkonen.localdomain>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-9-sakari.ailus@linux.intel.com>
 <20250619170320.GJ32166@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619170320.GJ32166@pendragon.ideasonboard.com>

Hi Laurent,

On Thu, Jun 19, 2025 at 08:03:20PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Thu, Jun 19, 2025 at 11:15:41AM +0300, Sakari Ailus wrote:
> > Print debug messages early in v4l2_subdev_enable_streams() and
> > v4l2_subdev_disable_streams(), before sanity checks take place. This can
> > help figuring out why something goes wrong, in driver development or
> > otherwise.
> > 
> > Also print the name of the sub-device where streaming is to be enabled or
> > disabled.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 5afdd9d548b5..6bc855058ca6 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -2273,6 +2273,9 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
> >  	bool use_s_stream;
> >  	int ret;
> >  
> > +	dev_dbg(dev, "enable streams %s:%u/%#llx\n", sd->entity.name, pad,
> > +		streams_mask);
> 
> I suppose there can be multiple subdevs per struct device, so printing
> the entity name can be useful. I'd put quotes around '%s' as the entity
> name can contain spaces. Apart from that,

I'll use double quotes as that is how sub-device (or entity) name is
typically quoted in debug prints.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thank you.

-- 
Regards,

Sakari Ailus

