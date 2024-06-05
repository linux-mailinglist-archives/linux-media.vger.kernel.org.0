Return-Path: <linux-media+bounces-12567-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DADD48FC7B5
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 11:25:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 808C11F223A1
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 09:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFBFB190058;
	Wed,  5 Jun 2024 09:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R4IlBDUi"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B73518FDB5
	for <linux-media@vger.kernel.org>; Wed,  5 Jun 2024 09:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717579402; cv=none; b=Ergxc0imyvLCLOi+fC0JqWz0yNvG+89xRTbVqtjeyGL4YyiInfGMhPX7dpxQSK54/JK1SoK0/F222DXGaM1NK13t+92aqr6tcFZndlcE7bCwjHfEkYqbCDDCNsC2OTFRCQUWtrfWJ4UPvhmFSHZYIphNYaeQPZADzwZ8OPvfzAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717579402; c=relaxed/simple;
	bh=BF60kLa1oYWmpf/QdzM7vo5ujZs8ZT6VD8XVScs00UE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aUSfb8be0c+vE1o2gnH9LL/VctKA1wnWT6Ciog178wv5W3N9equwq7UbLSGrdQYKcy3TA5aW22pBPiJvSf3RSXMmkt/R4KGShOL3CvbgN2IKFupqICjfpCY74HGCaBhBaswYRaf/g9oIkzpK63KuUfiAzYewoLitu5nAdok5DTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R4IlBDUi; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717579400; x=1749115400;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BF60kLa1oYWmpf/QdzM7vo5ujZs8ZT6VD8XVScs00UE=;
  b=R4IlBDUixrfpi3mKn8gSJEkYrARYRB26ULgOVjSdU0Mgt4Mte0RrfJok
   EUjZL5+1bgYzqDqWuTRAWqzc3ojH0szhSj+u7eaJppYHQJm49nuAnW/BV
   ND1xjYKdDELk8Y/cVpxBXnalqPGU5bdOGBdqh387F/Rg4bg01I56DTWxT
   6CtvHI8S/5gZYSMtF81Ib1KPYZLlppXoVjPDSCF82OFLMvp9l2arxWboA
   vDRJpnIcpqnnPgFcDszqzmHlHTqBsw6xL0AceofOseMZLOxbL7obd5mdM
   kPQ9nXwqYO5lJRRn5cXNlLGtIFc4Qe4pcuYhFkRxcH1Zp/mwmubi/rj8E
   w==;
X-CSE-ConnectionGUID: FFchE0DjSM+OmtOpPCz3bA==
X-CSE-MsgGUID: BSEuGBpOTH+4vyyD6EaCLA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="14287400"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; 
   d="scan'208";a="14287400"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 02:23:20 -0700
X-CSE-ConnectionGUID: 0PY6PhOUSWiPdnJeuQ7jlA==
X-CSE-MsgGUID: /IuVTlNDT1G1hZ6d5fMG7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; 
   d="scan'208";a="41969022"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 02:23:18 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 63A0211FB5E;
	Wed,  5 Jun 2024 12:23:16 +0300 (EEST)
Date: Wed, 5 Jun 2024 09:23:16 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 19/29] media: omap3isp: Release the isp device struct
 by media device callback
Message-ID: <ZmAuhOIKX2x4SMux@kekkonen.localdomain>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-20-sakari.ailus@linux.intel.com>
 <20240207142311.GQ23702@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207142311.GQ23702@pendragon.ideasonboard.com>

Hi Laurent,

Thanks for the review.

On Wed, Feb 07, 2024 at 04:23:11PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Dec 20, 2023 at 12:37:03PM +0200, Sakari Ailus wrote:
> > Use the media device release callback to release the isp device's data
> > structure. This approach has the benefit of not releasing memory which may
> > still be accessed through open file handles whilst the isp driver is being
> > unbound.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > ---
> >  drivers/media/platform/ti/omap3isp/isp.c | 24 +++++++++++++++++++-----
> >  1 file changed, 19 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
> > index 1cda23244c7b..ef6a781d6da1 100644
> > --- a/drivers/media/platform/ti/omap3isp/isp.c
> > +++ b/drivers/media/platform/ti/omap3isp/isp.c
> > @@ -649,8 +649,11 @@ static irqreturn_t isp_isr(int irq, void *_isp)
> >  	return IRQ_HANDLED;
> >  }
> >  
> > +static void isp_release(struct media_device *mdev);
> > +
> 
> Forward declarations are not nice :-( Any hope to reorder functions to
> fix this ?

This depends on moving isp_cleanup_modules up, too. If you think it's the
lesser evil I'm fine with that.

> 
> >  static const struct media_device_ops isp_media_ops = {
> >  	.link_notify = v4l2_pipeline_link_notify,
> > +	.release = isp_release,
> >  };
> >  
> >  /* -----------------------------------------------------------------------------
> > @@ -1607,7 +1610,6 @@ static void isp_unregister_entities(struct isp_device *isp)
> >  	omap3isp_stat_unregister_entities(&isp->isp_hist);
> >  
> >  	v4l2_device_unregister(&isp->v4l2_dev);
> > -	media_device_cleanup(&isp->media_dev);
> >  }
> >  
> >  static int isp_link_entity(
> > @@ -1955,6 +1957,19 @@ static void isp_detach_iommu(struct isp_device *isp)
> >  #endif
> >  }
> >  
> > +static void isp_release(struct media_device *mdev)
> > +{
> > +	struct isp_device *isp =
> > +		container_of(mdev, struct isp_device, media_dev);
> > +
> > +	isp_cleanup_modules(isp);
> > +
> > +	media_entity_enum_cleanup(&isp->crashed);
> > +	v4l2_async_nf_cleanup(&isp->notifier);
> 
> This duplicates the call in isp_remove().

I'll drop the one in isp_remove().

> 
> > +
> > +	kfree(isp);
> > +}
> > +
> >  static int isp_attach_iommu(struct isp_device *isp)
> >  {
> >  #ifdef CONFIG_ARM_DMA_USE_IOMMU
> > @@ -2004,16 +2019,15 @@ static void isp_remove(struct platform_device *pdev)
> >  	v4l2_async_nf_unregister(&isp->notifier);
> >  	v4l2_async_nf_cleanup(&isp->notifier);
> >  	isp_unregister_entities(isp);
> > -	isp_cleanup_modules(isp);
> > +
> >  	isp_xclk_cleanup(isp);
> >  
> >  	__omap3isp_get(isp, false);
> >  	isp_detach_iommu(isp);
> >  	__omap3isp_put(isp, false);
> >  
> > -	media_entity_enum_cleanup(&isp->crashed);
> > -
> > -	kfree(isp);
> > +	/* May release isp immediately */
> > +	media_device_put(&isp->media_dev);
> >  }
> >  
> >  enum isp_of_phy {
> 

-- 
Kind regards,

Sakari Ailus

