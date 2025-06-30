Return-Path: <linux-media+bounces-36330-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0629AEE5F9
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 19:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1401E168D45
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 17:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE74E2E3371;
	Mon, 30 Jun 2025 17:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NWHHWooW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9173128D8E1;
	Mon, 30 Jun 2025 17:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751305166; cv=none; b=spftoFKiPIgfDMx98jVuUGoe9AlL6jbhnAPDtz5nvjjT7YZJ1a1q/y1ZZxdPoe2ZB/Q3A0lrs8IJm+2AUu/ONZK9+l/cAjx5mX8wpkxr639z5zS065hF/rrTH+BAEO8XuUx/Nihx/GWz/NCpaRTlucINVXPdxbXj0afIcaUTbo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751305166; c=relaxed/simple;
	bh=u8fX7/Ls7MJ7zE7uXZsFHq8gKRiPLQqVOwd4iyuc1j0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4xsk84cbs4EeazgeNTThvkygJid1e/fpSZf2eR+C7R/xewn5i3Evp463gQo28AgxDkPonP9WFpiOFi/a4TpNsuc1WwuXiUrZRIyHm8zZhHtaB/mahrth15SXuUJZV/E7DyROCbXbsgwDlKJe58VY0jJk+3TH73QwRI/rjy7j24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NWHHWooW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id EA547667;
	Mon, 30 Jun 2025 19:38:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751305135;
	bh=u8fX7/Ls7MJ7zE7uXZsFHq8gKRiPLQqVOwd4iyuc1j0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NWHHWooWumxzLXT1idCf/DInO8fgfGVWLXC4fUvTapZBSmzMEDuRRDRrBk2J66vrj
	 NZcDPKDqlIRfqORoLkrdnpZZhVE2YCQDYmxRODMiS/IpzDVyf8Cbtq0Atmjy2CXByD
	 jj54u7+boOAPF4WzqNjGMLFx227jTYQCam06mewY=
Date: Mon, 30 Jun 2025 20:38:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Xu Yang <xu.yang_2@nxp.com>, Christoph Hellwig <hch@lst.de>,
	ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
	hdegoede@redhat.com, gregkh@linuxfoundation.org, mingo@kernel.org,
	tglx@linutronix.de, andriy.shevchenko@linux.intel.com,
	viro@zeniv.linux.org.uk, thomas.weissschuh@linutronix.de,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <20250630173851.GH20333@pendragon.ideasonboard.com>
References: <20250627101939.3649295-1-xu.yang_2@nxp.com>
 <20250627101939.3649295-2-xu.yang_2@nxp.com>
 <1c4f505f-d684-4643-bf77-89d97e01a9f2@rowland.harvard.edu>
 <wddmyx4lccthln7mbngkd4zbh6y7mwetdba5e7ob6u4xevecmj@zopp65eqbeuu>
 <e908261b-2acd-46ac-b3ef-92691eb50f88@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e908261b-2acd-46ac-b3ef-92691eb50f88@rowland.harvard.edu>

Hi Alan,

On Mon, Jun 30, 2025 at 10:16:30AM -0400, Alan Stern wrote:
> On Mon, Jun 30, 2025 at 04:18:51PM +0800, Xu Yang wrote:
> > > Also, the material that this routine replaces in the uvc and stk1160 
> > > drivers do not call flush_kernel_vmap_range().  Why did you add that 
> > > here?  Was this omission a bug in those drivers?
> > 
> > According to dma-api.rst:
> > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/tree/Documentation/core-api/dma-api.rst?h=linux-6.15.y#n664
> > 
> > "Once a non-contiguous allocation is mapped using this function, the
> > flush_kernel_vmap_range() and invalidate_kernel_vmap_range() APIs must
> > be used to manage the coherency between the kernel mapping, the device
> > and user space mappings (if any)."
> > 
> > Possibly the uvc and stk1160 missed calling it, but since they won't be
> > the only user of the USB core, so we'd better call these APIs.
> 
> Documentation/core-api/cachetbl.rst says:
> 
>   ``void flush_kernel_vmap_range(void *vaddr, int size)``
> 
>        flushes the kernel cache for a given virtual address range in
>        the vmap area.  This is to make sure that any data the kernel
>        modified in the vmap range is made visible to the physical
>        page.  The design is to make this area safe to perform I/O on.
>        Note that this API does *not* also flush the offset map alias
>        of the area.
> 
>   ``void invalidate_kernel_vmap_range(void *vaddr, int size) invalidates``
> 
>        the cache for a given virtual address range in the vmap area
>        which prevents the processor from making the cache stale by
>        speculatively reading data while the I/O was occurring to the
>        physical pages.  This is only necessary for data reads into the
>        vmap area.
> 
> So invalidate_kernel_vmap_range() is not needed for data writes, that 
> is, for OUT transfers.  And ironically, flush_kernel_vmap_range() _is_ 
> needed (but only for OUT transfers).

flush_kernel_vmap_range() for OUT transfers and
invalidate_kernel_vmap_range() for IN transfers make sense to me.

> On the other hand, Christoph may think these call should be included 
> regardless.  Let's see what he recommends.  Christoph?
> 
> (Actually, I would expect dma_sync_sgtable_for_cpu() and 
> dma_sync_sgtable_for_device() to handle all of this for us 
> automatically, but never mind...)

-- 
Regards,

Laurent Pinchart

