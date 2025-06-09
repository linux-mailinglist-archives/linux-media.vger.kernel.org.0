Return-Path: <linux-media+bounces-34339-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5D5AD1B90
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 12:29:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E809E164708
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 10:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673E5253931;
	Mon,  9 Jun 2025 10:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hGb1fqC0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3B32F37;
	Mon,  9 Jun 2025 10:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464948; cv=none; b=mLPlQi5tWZeTogTtH7oUz5nlBDH7Qm4taqDdnE4Q76Zpki5Bv2suOJyU0bnHFR48F10EIDNEdpGetS4/QaQBXhYfjl5dJ0jXgqVtNAc9MGuZfaHrFJsIuVk1l3X+4by90iAACwxpipFUTpi0PDHiOjcPAzFg3OFY2YBEVzWgefc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464948; c=relaxed/simple;
	bh=b81GxXQOgz++9oTBAz/FoXRwlEIZehWSTem3SGxqML4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gr10MP6S54DZky7pVCaWENqhTlUTALuIG2GyKjzwKgO6A9HyWZ8xLls8hUzvBHabIHzxz61MiU7Nto4UwZTpzF7mcVqclNkyJAmjGCbTzrvxeG9NHwup2WyelMxWl02pHY8ZXUwwvFuttnIzuv2OwD3wAzk78wQdyBRbAjWaiSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hGb1fqC0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749464947; x=1781000947;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=b81GxXQOgz++9oTBAz/FoXRwlEIZehWSTem3SGxqML4=;
  b=hGb1fqC0vSH/xYJdrZxC+heVp2z8DH/cGkJrCGok9Me6U3PMHj/goLSM
   2nObdNIr2nJx6UdqZwCaiz1tK8tvvOrHV6jHRNjGDyF6aqQzYq5M4hBR6
   w0HChnpFXMrP/rRfLeY8XirjQy+I77ZEJKIYb0VGAk5bpeRtlmNstp6jW
   I9icjOLKX+s8vwSfthV8CyILGoXs4+NUb1W0AaWnttRp2K25UQNO+nyGq
   Ga/6sw+hJYqEsKHqOK87CiO06bH4HFT2I+oxNOIrXPafn2jGvpA0b/qhr
   jx0CEcAiKKpOTpvBuEufR5SLpSjfXRTdKec+F3K3OEelMeBAU7J0XoCii
   A==;
X-CSE-ConnectionGUID: 1uSkid9dQbOZD2VZAxzlIg==
X-CSE-MsgGUID: LGMDkH2dREC/d8uTRSuybQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="62937883"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="62937883"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 03:29:06 -0700
X-CSE-ConnectionGUID: kw74qhyMR2WiVaCdt2Xedw==
X-CSE-MsgGUID: /Wqtw3bBSGKJCNaG4QUKcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="151292359"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.36])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 03:29:02 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 14D9511FBC0;
	Mon,  9 Jun 2025 13:28:59 +0300 (EEST)
Date: Mon, 9 Jun 2025 10:28:59 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	linux-media@vger.kernel.org,
	Sebastian Fricke <sebastian.fricke@collabora.com>
Subject: Re: [PATCH v3 3/5] media: mc: add debugfs node to keep track of
 requests
Message-ID: <aEa3azYxM5Sc6cZC@kekkonen.localdomain>
References: <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com>
 <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-3-603db4749d90@collabora.com>
 <aEC7jMDgRAg1cfXZ@kekkonen.localdomain>
 <870611a1e5d21fa375dd9359192641484c1c0e76.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <870611a1e5d21fa375dd9359192641484c1c0e76.camel@collabora.com>

Hi Nicolas,

On Wed, Jun 04, 2025 at 07:08:53PM -0400, Nicolas Dufresne wrote:
> Le mercredi 04 juin 2025 à 21:33 +0000, Sakari Ailus a écrit :
> > Hi Nicolas, Hans,
> > 
> > Thanks for the update.
> 
> thanks for the review, these things are precious.
> 
> > 
> > On Wed, Jun 04, 2025 at 04:09:37PM -0400, Nicolas Dufresne wrote:
> > > From: Hans Verkuil <hverkuil@xs4all.nl>
> > > 
> > > Keep track of the number of requests and request objects of a media
> > > device. Helps to verify that all request-related memory is freed.
> > > 
> > > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > > ---
> > >  drivers/media/mc/mc-device.c  | 30 ++++++++++++++++++++++++++++++
> > >  drivers/media/mc/mc-devnode.c |  5 +++++
> > >  drivers/media/mc/mc-request.c |  6 ++++++
> > >  include/media/media-device.h  |  9 +++++++++
> > >  include/media/media-devnode.h |  4 ++++
> > >  include/media/media-request.h |  2 ++
> > >  6 files changed, 56 insertions(+)
> > > 
> > > diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> > > index c0dd4ae5722725f1744bc6fd6282d5c765438059..5a458160200afb540d8014fed42d8bf2dab9c8c3 100644
> > > --- a/drivers/media/mc/mc-device.c
> > > +++ b/drivers/media/mc/mc-device.c
> > > @@ -679,6 +679,23 @@ void media_device_unregister_entity(struct media_entity *entity)
> > >  }
> > >  EXPORT_SYMBOL_GPL(media_device_unregister_entity);
> > >  
> > > +#ifdef CONFIG_DEBUG_FS
> > > +/*
> > > + * Log the state of media requests.
> > > + * Very useful for debugging.
> > > + */
> > 
> > Fits on a single line.
> 
> Ack.
> 
> > 
> > > +static int media_device_requests(struct seq_file *file, void *priv)
> > > +{
> > > +	struct media_device *dev = dev_get_drvdata(file->private);
> > > +
> > > +	seq_printf(file, "number of requests: %d\n",
> > > +		   atomic_read(&dev->num_requests));
> > > +	seq_printf(file, "number of request objects: %d\n",
> > > +		   atomic_read(&dev->num_request_objects));
> > 
> > Newline here?
> 
> I prefer that too.
> 
> > 
> > > +	return 0;
> > > +}
> > > +#endif
> > > +
> > >  void media_device_init(struct media_device *mdev)
> > >  {
> > >  	INIT_LIST_HEAD(&mdev->entities);
> > > @@ -697,6 +714,9 @@ void media_device_init(struct media_device *mdev)
> > >  		media_set_bus_info(mdev->bus_info, sizeof(mdev->bus_info),
> > >  				   mdev->dev);
> > >  
> > > +	atomic_set(&mdev->num_requests, 0);
> > > +	atomic_set(&mdev->num_request_objects, 0);
> > > +
> > >  	dev_dbg(mdev->dev, "Media device initialized\n");
> > >  }
> > >  EXPORT_SYMBOL_GPL(media_device_init);
> > > @@ -748,6 +768,15 @@ int __must_check __media_device_register(struct media_device *mdev,
> > >  
> > >  	dev_dbg(mdev->dev, "Media device registered\n");
> > >  
> > > +#ifdef CONFIG_DEBUG_FS
> > > +	if (!media_debugfs_root)
> > > +		media_debugfs_root = debugfs_create_dir("media", NULL);
> > > +	mdev->media_dir = debugfs_create_dir(dev_name(&devnode->dev),
> > > +					     media_debugfs_root);
> > > +	debugfs_create_devm_seqfile(&devnode->dev, "requests",
> > > +				    mdev->media_dir, media_device_requests);
> > > +#endif
> > 
> > I have no objection to this but it would have been great to have the Media
> > device lifetime set in first and MC device and devnode merged. But maybe
> > it's too late for that. Well, at least this won't change error handling...
> 
> Since this specific patch is not required to fix the MTK VCODEC issue, I can
> delay this a little. Is that comment related to an existing patch ?

Yes.

I've pushed the current set here:
<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=media-ref>. I've
rebased it recently but it's still WiP.

...

> > > diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
> > > index d27c1c646c2805171be3997d72210dd4d1a38e32..dbcabeffcb572ae707f5fe1f51ff719d451c6784 100644
> > > --- a/include/media/media-devnode.h
> > > +++ b/include/media/media-devnode.h
> > > @@ -20,9 +20,13 @@
> > >  #include <linux/fs.h>
> > >  #include <linux/device.h>
> > >  #include <linux/cdev.h>
> > > +#include <linux/debugfs.h>
> > >  
> > >  struct media_device;
> > >  
> > > +/* debugfs top-level media directory */
> > > +extern struct dentry *media_debugfs_root;
> > > +
> > >  /*
> > >   * Flag to mark the media_devnode struct as registered. Drivers must not touch
> > >   * this flag directly, it will be set and cleared by media_devnode_register and
> > > diff --git a/include/media/media-request.h b/include/media/media-request.h
> > > index 7f9af68ef19ac6de0184bbb0c0827dc59777c6dc..610ccfe8d7b20ec38e166383433f9ee208248640 100644
> > > --- a/include/media/media-request.h
> > > +++ b/include/media/media-request.h
> > > @@ -292,6 +292,7 @@ struct media_request_object_ops {
> > >   * struct media_request_object - An opaque object that belongs to a media
> > >   *				 request
> > >   *
> > > + * @mdev: Media device this object belongs to
> > 
> > This deserves at least a comment what this may be used for: generally once
> > object is unbound, it's not related to a request anymore (nor a Media
> > device). This field also adds a new Media device lifetime issue: nothing
> 
> We could make it explicit by clearing the mdev pointer ?

That would probably be out of scope of this patch(set). Also see the
patchset I referred to earlier.

> 
> > guarantees the mdev is not disappearing at a wrong time albeit this is
> > very, very likely not user-triggerable without physically removing
> > hardware.
> 
> I'm not too familiar with the subject, if the MC knows it has open request
> FD(s), why would it allow userspace from unloading its module ?

Drivers nor MC currently have a list of request file handles.

Apart from the file handles, that was the original thinking, yes, but
devices can be also unbound without touching the driver (or other) modules.

> 
> > 
> > >   * @ops: object's operations
> > >   * @priv: object's priv pointer
> > >   * @req: the request this object belongs to (can be NULL)
> > > @@ -303,6 +304,7 @@ struct media_request_object_ops {
> > >   * another struct that contains the actual data for this request object.
> > >   */
> > >  struct media_request_object {
> > > +	struct media_device *mdev;
> > >  	const struct media_request_object_ops *ops;
> > >  	void *priv;
> > >  	struct media_request *req;
> > > 

-- 
Kind regards,

Sakari Ailus

