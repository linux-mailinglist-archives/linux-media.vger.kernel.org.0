Return-Path: <linux-media+bounces-6625-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BAE874EED
	for <lists+linux-media@lfdr.de>; Thu,  7 Mar 2024 13:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A98202852D0
	for <lists+linux-media@lfdr.de>; Thu,  7 Mar 2024 12:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1A312B16F;
	Thu,  7 Mar 2024 12:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dU3/xBpu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9CA127B7C
	for <linux-media@vger.kernel.org>; Thu,  7 Mar 2024 12:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709814234; cv=none; b=DleR7CYhLeY3nTdCdVCEADkn5LuIbISGcaJhTPUAf5BwtAKvI83sQX391rDG/DKEgb1mkpF7PLS/iXlxs7ACSp+TpoBoTrOc+CdDvz2cT0k9r/THwdKrjHp444QjxXbA5ScDK30Sp8w5ltudvsQH/FWblYA/baiGQddeAnzJ62c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709814234; c=relaxed/simple;
	bh=2G6Mz5FvLn9yb0i9xGIR3+O/D2H8ZatKLWbuwt2UaEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tWkgDuuvwa0kEFX2CE3smDrF851/mNFfBbnUhXk/2H28GpL2BIi5yxTV8M6qt/t/YENMEr0B5ChwkXi1VyCJi6+t5OV1ngabsfuECsniFrhVhSEy8DQBErQsFd4KnMqKrSL3mWXPERiA+dZkmLbsDoJt6oQryGGhh10+SLAHOLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dU3/xBpu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709814232; x=1741350232;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2G6Mz5FvLn9yb0i9xGIR3+O/D2H8ZatKLWbuwt2UaEk=;
  b=dU3/xBpuC2bSxg+FmXSJDx6Pwgr9Nlg42j9lWSKSH8eES5H5XYdzvvTe
   Ms1JHeaOaH0BeizAwcxenKNEGSZXM062aBkluvD6UOVWGLZfLvzsNnnFj
   lHHSYdNgALErJfhjOG6lkTus6XLYLI0aun8lPzpv6tdSCJhxbcOkEyD9j
   VvXdrVtsQ5UF8VTIvmqrHTiReKCtxR47F+S7FtGcnzjykZJi5O0TZE4Ew
   XOhjgZzgGcETpiqmzhzioy0YuXvgA8u/Su9niuPcjC9rdQbYwzZt1GPxa
   rW1eMf8prtvPt9ryxIyMgMRYsvbkzacCCGZ9fKgKwHazScfY/A+8AUNkc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="21930207"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="21930207"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 04:23:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="10168646"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 04:23:51 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7DF3811F819;
	Thu,  7 Mar 2024 14:23:48 +0200 (EET)
Date: Thu, 7 Mar 2024 12:23:48 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 22/29] media: ipu3-cio2: Release the cio2 device
 context by media device callback
Message-ID: <Zemx1M4eMHs8RYi_@kekkonen.localdomain>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-23-sakari.ailus@linux.intel.com>
 <20240207143350.GJ2827@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207143350.GJ2827@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Feb 07, 2024 at 04:33:50PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Dec 20, 2023 at 12:37:06PM +0200, Sakari Ailus wrote:
> > Use the media device release callback to release the cio2 device's data
> > structure. This approach has the benefit of not releasing memory which may
> > still be accessed through open file handles whilst the ipu3-cio2 driver is
> > being unbound.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > ---
> >  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 58 ++++++++++++++++--------
> >  1 file changed, 40 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> > index 3222ec5b8345..bff66e6d3b1e 100644
> > --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> > +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> > @@ -238,9 +238,15 @@ static int cio2_fbpt_init(struct cio2_device *cio2, struct cio2_queue *q)
> >  	return 0;
> >  }
> >  
> > -static void cio2_fbpt_exit(struct cio2_queue *q, struct device *dev)
> > +static int cio2_fbpt_exit(struct cio2_queue *q, struct device *dev)
> >  {
> > +	if (!q->fbpt)
> > +		return -ENOENT;
> > +
> >  	dma_free_coherent(dev, CIO2_FBPT_SIZE, q->fbpt, q->fbpt_bus_addr);
> > +	q->fbpt = NULL;
> > +
> > +	return 0;
> >  }
> >  
> >  /**************** CSI2 hardware setup ****************/
> > @@ -1643,13 +1649,13 @@ static int cio2_queue_init(struct cio2_device *cio2, struct cio2_queue *q)
> >  
> >  static void cio2_queue_exit(struct cio2_device *cio2, struct cio2_queue *q)
> >  {
> > -	vb2_video_unregister_device(&q->vdev);
> >  	media_entity_cleanup(&q->vdev.entity);
> >  	v4l2_device_unregister_subdev(&q->subdev);
> 
> Is the release callback the right time for this ?

Neither driver remove or media device release is entirely correct as we
don't have refcounting for these yet. A better place would still be in the
remove callback. I'll move it there.

> 
> >  	media_entity_cleanup(&q->subdev.entity);
> > -	cio2_fbpt_exit(q, &cio2->pci_dev->dev);
> > -	mutex_destroy(&q->subdev_lock);
> > -	mutex_destroy(&q->lock);
> > +	if (!cio2_fbpt_exit(q, &cio2->pci_dev->dev)) {
> 
> This doesn't look very nice, but I suppose there are many other things
> to clean up in this driver, so I'll close my eyes.

I'd say ipu3-cio2 is one of the better CSI-2 receiver drivers.

This is related to error handing: you can't call mutex_destroy() on a mutex
that's been already destroyed. cio2_queue_exit() is called when the media
device is released but we don't know here whether mutexes have been
initialised yet. I guess that's something that could be changed but it
would create more lines of code elsewhere.

> 
> > +		mutex_destroy(&q->subdev_lock);
> > +		mutex_destroy(&q->lock);
> > +	}
> >  }
> >  
> >  static int cio2_queues_init(struct cio2_device *cio2)
> > @@ -1695,6 +1701,23 @@ static int cio2_check_fwnode_graph(struct fwnode_handle *fwnode)
> >  	return cio2_check_fwnode_graph(fwnode->secondary);
> >  }
> >  
> > +static void cio2_media_release(struct media_device *mdev)
> > +{
> > +	struct cio2_device *cio2 =
> > +		container_of(mdev, struct cio2_device, media_dev);
> > +
> > +	v4l2_async_nf_cleanup(&cio2->notifier);
> > +	cio2_queues_exit(cio2);
> > +	cio2_fbpt_exit_dummy(cio2);
> > +	mutex_destroy(&cio2->lock);
> > +
> > +	kfree(cio2);
> > +}
> > +
> > +static const struct media_device_ops cio2_mdev_ops = {
> > +	.release = cio2_media_release,
> > +};
> > +
> >  /**************** PCI interface ****************/
> >  
> >  static int cio2_pci_probe(struct pci_dev *pci_dev,
> > @@ -1722,7 +1745,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
> >  			return r;
> >  	}
> >  
> > -	cio2 = devm_kzalloc(dev, sizeof(*cio2), GFP_KERNEL);
> > +	cio2 = kzalloc(sizeof(*cio2), GFP_KERNEL);
> >  	if (!cio2)
> >  		return -ENOMEM;
> >  	cio2->pci_dev = pci_dev;
> > @@ -1767,6 +1790,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
> >  	mutex_init(&cio2->lock);
> >  
> >  	cio2->media_dev.dev = dev;
> > +	cio2->media_dev.ops = &cio2_mdev_ops;
> >  	strscpy(cio2->media_dev.model, CIO2_DEVICE_NAME,
> >  		sizeof(cio2->media_dev.model));
> >  	cio2->media_dev.hw_revision = 0;
> > @@ -1774,7 +1798,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
> >  	media_device_init(&cio2->media_dev);
> >  	r = media_device_register(&cio2->media_dev);
> >  	if (r < 0)
> > -		goto fail_mutex_destroy;
> > +		goto fail_media_device_put;
> >  
> >  	cio2->v4l2_dev.mdev = &cio2->media_dev;
> >  	r = v4l2_device_register(dev, &cio2->v4l2_dev);
> > @@ -1808,35 +1832,33 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
> >  
> >  fail_clean_notifier:
> >  	v4l2_async_nf_unregister(&cio2->notifier);
> > -	v4l2_async_nf_cleanup(&cio2->notifier);
> > -	cio2_queues_exit(cio2);
> > +
> >  fail_v4l2_device_unregister:
> >  	v4l2_device_unregister(&cio2->v4l2_dev);
> > +
> >  fail_media_device_unregister:
> >  	media_device_unregister(&cio2->media_dev);
> > -	media_device_cleanup(&cio2->media_dev);
> > -fail_mutex_destroy:
> > -	mutex_destroy(&cio2->lock);
> > -	cio2_fbpt_exit_dummy(cio2);
> >  
> > +fail_media_device_put:
> > +	media_device_put(&cio2->media_dev);
> >  	return r;
> >  }
> >  
> >  static void cio2_pci_remove(struct pci_dev *pci_dev)
> >  {
> >  	struct cio2_device *cio2 = pci_get_drvdata(pci_dev);
> > +	unsigned int i;
> >  
> >  	media_device_unregister(&cio2->media_dev);
> > +	for (i = 0; i < CIO2_QUEUES; i++)
> > +		vb2_video_unregister_device(&cio2->queue[i].vdev);
> >  	v4l2_device_unregister(&cio2->v4l2_dev);
> >  	v4l2_async_nf_unregister(&cio2->notifier);
> > -	v4l2_async_nf_cleanup(&cio2->notifier);
> > -	cio2_queues_exit(cio2);
> > -	cio2_fbpt_exit_dummy(cio2);
> > -	media_device_cleanup(&cio2->media_dev);
> > -	mutex_destroy(&cio2->lock);
> >  
> >  	pm_runtime_forbid(&pci_dev->dev);
> >  	pm_runtime_get_noresume(&pci_dev->dev);
> > +
> > +	media_device_put(&cio2->media_dev);
> >  }
> >  
> >  static int __maybe_unused cio2_runtime_suspend(struct device *dev)
> 

-- 
Regards,

Sakari Ailus

