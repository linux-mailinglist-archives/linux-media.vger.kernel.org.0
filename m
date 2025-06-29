Return-Path: <linux-media+bounces-36225-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAE5AED1D4
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 01:40:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56C2F3A3713
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 23:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C462424290D;
	Sun, 29 Jun 2025 23:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZscVSics"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982FD237707;
	Sun, 29 Jun 2025 23:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751240393; cv=none; b=q+fTl/j9rDgJGd4USDwGZelY/966RroT7rhWxYdYse+3Eq7rFu/KdmWun/pDjZrrBotepWJu40tcFkC1JpWeKhnH96F357M+VJPVUQ0WFgdosoBTHoAFiBMlixEJmy/ci4Sy4vum/euS8Ldas26AtwREDjdeMHYBmHdAtbl9g1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751240393; c=relaxed/simple;
	bh=duyH01qOwJHRvyxCFaAsXWWg9+tURXrWgirrUu1Bvgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGRO2mM9nFq4Xz1gkK+N9GkOSEL573JJq7qx9Uu5Qk89TaZOdf9TS7vKytRKOEUnB6DFeSkG3DdQBMu4EugfUHJ91u04bF7VRscwS8ukLFDSqtUAuKsFsAEuy9bBY9Caq3hGitbLa3DNXufuq678rCTc7PbLns+OobQuvVHnK4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZscVSics; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 64511C78;
	Mon, 30 Jun 2025 01:39:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751240367;
	bh=duyH01qOwJHRvyxCFaAsXWWg9+tURXrWgirrUu1Bvgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZscVSicsm/wXkRud4SlMwFAe0Xv32SrHoGv9SmgA+5cxotxtcN8of3ToEP+/n9Fcf
	 4F+GAoPz4couZYgiQHe2la+4BAQR+dS7Ubenxof0dLiE1ctcKu9PiuBDaUUgYHMhrf
	 1/71UsCcD8xYj+KcvuZ3FjtLOq1v690uJh8yx4qw=
Date: Mon, 30 Jun 2025 02:39:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Xu Yang <xu.yang_2@nxp.com>, ezequiel@vanguardiasur.com.ar,
	mchehab@kernel.org, hdegoede@redhat.com, gregkh@linuxfoundation.org,
	mingo@kernel.org, tglx@linutronix.de,
	andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk,
	thomas.weissschuh@linutronix.de, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v2 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <20250629233924.GC20732@pendragon.ideasonboard.com>
References: <20250627101939.3649295-1-xu.yang_2@nxp.com>
 <20250627101939.3649295-2-xu.yang_2@nxp.com>
 <1c4f505f-d684-4643-bf77-89d97e01a9f2@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1c4f505f-d684-4643-bf77-89d97e01a9f2@rowland.harvard.edu>

On Fri, Jun 27, 2025 at 10:23:36AM -0400, Alan Stern wrote:
> On Fri, Jun 27, 2025 at 06:19:37PM +0800, Xu Yang wrote:
> > This will add usb_alloc_noncoherent() and usb_free_noncoherent()
> > functions to support alloc and free buffer in a dma-noncoherent way.
> > 
> > To explicit manage the memory ownership for the kernel and device,
> > this will also add usb_dma_noncoherent_sync_for_cpu/device() functions
> > and call it at proper time.  The management requires the user save
> > sg_table returned by usb_alloc_noncoherent() to urb->sgt.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/core/hcd.c | 30 ++++++++++++++++
> >  drivers/usb/core/usb.c | 80 ++++++++++++++++++++++++++++++++++++++++++
> >  include/linux/usb.h    |  9 +++++
> >  3 files changed, 119 insertions(+)
> > 
> > diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> > index c22de97432a0..5fa00d32afb8 100644
> > --- a/drivers/usb/core/hcd.c
> > +++ b/drivers/usb/core/hcd.c
> > @@ -1496,6 +1496,34 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
> >  }
> >  EXPORT_SYMBOL_GPL(usb_hcd_map_urb_for_dma);
> >  
> > +static void usb_dma_noncoherent_sync_for_cpu(struct usb_hcd *hcd,
> > +					     struct urb *urb)
> > +{
> > +	enum dma_data_direction dir;
> > +
> > +	if (!urb->sgt)
> > +		return;
> > +
> > +	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> 
> Are the following operations really necessary if the direction is OUT?  
> There are no bidirectional URBs, and an OUT transfer never modifies the 
> contents of the transfer buffer so the buffer contents will be the same 
> after the URB completes as they were when the URB was submitted.

The arch part of dma_sync_sgtable_for_cpu(DMA_TO_DEVICE) is a no-op on
all architectures but microblaze, mips, parisc and powerpc (at least in
some configurations of those architectures).

The IOMMU DMA mapping backend calls into the arch-specific code, and
also handles swiotlb, which is a no-op for DMA_TO_DEVICE. There's also
some IOMMU-related arch-specific handling for sparc.

I think dma_sync_sgtable_for_cpu() should be called for the
DMA_TO_DEVICE direction, to ensure proper operation in those uncommon
but real cases where platforms need to perform some operation. It has a
non-zero cost on other platforms, as the CPU will need to go through a
few function calls to end up in no-ops and then go back up the call
stack.

invalidate_kernel_vmap_range() may not be needed. I don't recall why it
was added. The call was introduced in

commit 20e1dbf2bbe2431072571000ed31dfef09359c08
Author: Ricardo Ribalda <ribalda@chromium.org>
Date:   Sat Mar 13 00:55:20 2021 +0100

    media: uvcvideo: Use dma_alloc_noncontiguous API

Ricardo, do we need to invalidate the vmap range in the DMA_TO_DEVICE
case ?

> > +	invalidate_kernel_vmap_range(urb->transfer_buffer,
> > +				     urb->transfer_buffer_length);
> > +	dma_sync_sgtable_for_cpu(hcd->self.sysdev, urb->sgt, dir);

In the DMA_FROM_DEVICE case, shouldn't the vmap range should be
invalidated after calling dma_sync_sgtable_for_cpu() ? Otherwise I think
speculative reads coming between invalidation and dma sync could result
in data corruption.

> > +}
> 
> This entire routine should be inserted at the appropriate place in 
> usb_hcd_unmap_urb_for_dma() instead of being standalone.
> 
> > +static void usb_dma_noncoherent_sync_for_device(struct usb_hcd *hcd,
> > +						struct urb *urb)
> > +{
> > +	enum dma_data_direction dir;
> > +
> > +	if (!urb->sgt)
> > +		return;
> > +
> > +	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> > +	flush_kernel_vmap_range(urb->transfer_buffer,
> > +				urb->transfer_buffer_length);
> > +	dma_sync_sgtable_for_device(hcd->self.sysdev, urb->sgt, dir);
> > +}
> 
> Likewise, this code belongs inside usb_hcd_map_urb_for_dma().
> 
> Also, the material that this routine replaces in the uvc and stk1160 
> drivers do not call flush_kernel_vmap_range().  Why did you add that 
> here?  Was this omission a bug in those drivers?
> 
> Alan Stern

-- 
Regards,

Laurent Pinchart

