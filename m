Return-Path: <linux-media+bounces-5557-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8197085D778
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 12:54:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC77E1C215AE
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 11:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFA2D47F59;
	Wed, 21 Feb 2024 11:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FMsKfBo2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4A03EA8B
	for <linux-media@vger.kernel.org>; Wed, 21 Feb 2024 11:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708516437; cv=none; b=OM7wJ5N3WeMnYEAKNND/7iGXq+o7swO8Af3ydRdpn1rEUV8nYSMtoVgjZZTM1ppyLwLsAPbxq40kJWmwuEFpstdgm4GJk9sZc2E/3jiRC07/cH8k9bL2nJ6Ekrdd0iVUPqjwdScLOKUN+YYhjBdNq06SIYBru+NPQPJrmTgz844=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708516437; c=relaxed/simple;
	bh=JnqzTlUNgW/h2mCbQIN5yLHNEehGZbUIl5clPNS/YMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sTyR3Ln5K+HFUNvIViWyTro4VebGkeneYBscgcfb9p4tU7YAu7ONoOKjZijTh4hlc6ZFNzWNTc6mW/kkwyRUMHoStymmY3P6cjuYZn4kHoHpzCBMR06lvb63+Wme2h+cpLDgcXeM9l7Lm7B8+je3E/tdbqXk5YQypaMdgw0Quis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FMsKfBo2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708516436; x=1740052436;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JnqzTlUNgW/h2mCbQIN5yLHNEehGZbUIl5clPNS/YMw=;
  b=FMsKfBo2jdziZ8OVnxHKeHflOb+4NZ6k+GDdBZIzEgCZw0CP76/YqvPV
   cR8nXwWZWCPhU1JvRPifVmIIad/sq5xsOfH/l5o85mXvOo6XMoz0xDPnB
   gFBRJJdIvyDJE/GYiXoRVc9geTNMnvA0Xg9tYcXnAnMDdbpB0A2fB4khk
   +6PHpr5m73y68IewoMtdW/J0x+rNGP1saR26yYWw5DAX8y1CZo4FTC7dX
   yIMQrAAsyhIlR4GRPCK5SlWfpPInARk2pJn2NwVPI4w0BcMeFz8qRZO4A
   2g7tALyZnAtg/cYaQ4pxoJaGTOaPyrAh0QL4yBSZ6lOfRz8uMhvYP/zkK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="20211733"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="20211733"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 03:53:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="827337381"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="827337381"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 03:53:53 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id EC9B011F855;
	Wed, 21 Feb 2024 13:53:50 +0200 (EET)
Date: Wed, 21 Feb 2024 11:53:50 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 26/29] media: mc: Maintain a list of open file handles
 in a media device
Message-ID: <ZdXkTo2QXrt95a-8@kekkonen.localdomain>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-27-sakari.ailus@linux.intel.com>
 <84475ab9-e644-4254-81f6-db4da6a3e12e@xs4all.nl>
 <20240205151602.GA8645@pendragon.ideasonboard.com>
 <659634d3-64c0-45fa-b816-4e32f9035a06@xs4all.nl>
 <20240205154136.GA9560@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240205154136.GA9560@pendragon.ideasonboard.com>

Hi Laurent, Hans,

On Mon, Feb 05, 2024 at 05:41:36PM +0200, Laurent Pinchart wrote:
> On Mon, Feb 05, 2024 at 04:32:44PM +0100, Hans Verkuil wrote:
> > On 05/02/2024 16:16, Laurent Pinchart wrote:
> > > On Mon, Feb 05, 2024 at 04:11:43PM +0100, Hans Verkuil wrote:
> > >> On 20/12/2023 11:37, Sakari Ailus wrote:
> > >>> The list of file handles is needed to deliver media events as well as for
> > >>> other purposes in the future.
> > >>>
> > >>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > >>> ---
> > >>>  drivers/media/mc/mc-device.c  | 23 ++++++++++++++++++++++-
> > >>>  drivers/media/mc/mc-devnode.c |  2 +-
> > >>>  include/media/media-devnode.h |  4 +++-
> > >>>  3 files changed, 26 insertions(+), 3 deletions(-)
> > >>>
> > >>> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> > >>> index 67a39cb63f89..9cc055deeec9 100644
> > >>> --- a/drivers/media/mc/mc-device.c
> > >>> +++ b/drivers/media/mc/mc-device.c
> > >>> @@ -45,9 +45,11 @@ static inline void __user *media_get_uptr(__u64 arg)
> > >>>  	return (void __user *)(uintptr_t)arg;
> > >>>  }
> > >>>  
> > >>> -static int media_device_open(struct file *filp)
> > >>> +static int media_device_open(struct media_devnode *devnode, struct file *filp)
> > >>>  {
> > >>> +	struct media_device *mdev = to_media_device(devnode);
> > >>>  	struct media_device_fh *fh;
> > >>> +	unsigned long flags;
> > >>>  
> > >>>  	fh = kzalloc(sizeof(*fh), GFP_KERNEL);
> > >>>  	if (!fh)
> > >>> @@ -55,12 +57,23 @@ static int media_device_open(struct file *filp)
> > >>>  
> > >>>  	filp->private_data = &fh->fh;
> > >>>  
> > >>> +	spin_lock_irqsave(&mdev->fh_list_lock, flags);
> > >>
> > >> The only reason for using the irqsave variant is because we want
> > >> to support events in the future, and those can be sent in irq context.
> > > 
> > > Even in that case, would media_device_open() ever be called from
> > > interrupt context ? spin_lock_irqsave() is only needed if you don't know
> > > which context the function can be called from. If we know we'll be
> > > called from interruptible context only, you can use spin_lock_irq()
> > > instead.
> > 
> > Someone can call open() while at the same time the kernel sends a
> > media event from interrupt context. Such an event function will walk
> > over the fh_list. The irqsave here is meant to ensure that no event
> > interrupt can run while we add our fh to the fh list.
> 
> You don't need spin_lock_irqsave() for that, spin_lock_irq() is enough.
> In your interrupt handler, you need spin_lock() only.
> spin_lock_irqsave() is for places that can be called both from
> interruptible and non-interruptible contexts.

I'll address this in v3.

-- 
Sakari Ailus

