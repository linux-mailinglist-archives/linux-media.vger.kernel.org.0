Return-Path: <linux-media+bounces-37184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFB2AFE572
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 12:16:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EB7B1C4519C
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 10:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0688D28A716;
	Wed,  9 Jul 2025 10:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SxP762nW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435DC1C84D5;
	Wed,  9 Jul 2025 10:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752055968; cv=none; b=qUh3TTNmHp10jwt3Urix7DOOddeBbzikMX3oJDylxvLNcH94IkwurRbd2TkcR0udk0hwSFwG5RwtDmDHGXOy7FI/7U1i5E43p046PceaqXDLvgrrKJycXGApgh5N1HqCUllPW13Uk0TmsPppdZG2EY/O2q2HOVpycfDXk4L2nYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752055968; c=relaxed/simple;
	bh=m0kYMK0yCrqfQlb4xvdKgoherQ8t98N5/gOCQakTYm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JDTZ++y/ipz2LSNwn3qijHG+bMEe4KL7OwkFRaht5a5Xu1wasgpBE2s42iUm6JIblPmlexud/n0hRpF1xzrRuwUaqw5c+a3BIWQO7VjV6iUSK3hPeYqQnZrkMObMABwVjnvV/j6ldhYnbP439MsVxV6z37GniR+P9o/q4KmorGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SxP762nW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46981C4CEF0;
	Wed,  9 Jul 2025 10:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752055967;
	bh=m0kYMK0yCrqfQlb4xvdKgoherQ8t98N5/gOCQakTYm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SxP762nWXfF/1YFF0BUywJwgj0icoVdmnhopJoF6KsWbx+2jnKUxHs5ollJrZIVQy
	 CWp2/4dsgOYmsaU4IvbHmkIakqfjDMpnnrFQnZS77FT9Ub1YJlVe2he22DeYUz0owL
	 YcC+n01eE3VMNnp0ugeYhyuEw5031bwaX13EOUCo=
Date: Wed, 9 Jul 2025 12:12:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hans de Goede <hansg@kernel.org>
Cc: Xu Yang <xu.yang_2@nxp.com>, ezequiel@vanguardiasur.com.ar,
	mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com, mingo@kernel.org, tglx@linutronix.de,
	andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk,
	thomas.weissschuh@linutronix.de, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v5 0/3] add dma noncoherent API
Message-ID: <2025070932-stifle-squabble-6042@gregkh>
References: <20250704095751.73765-1-xu.yang_2@nxp.com>
 <78b86f34-6477-436a-b59c-b0ae5371f581@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78b86f34-6477-436a-b59c-b0ae5371f581@kernel.org>

On Mon, Jul 07, 2025 at 12:02:41PM +0200, Hans de Goede wrote:
> Hi all,
> 
> On 4-Jul-25 11:57, Xu Yang wrote:
> > On architectures where there is no coherent caching such as ARM it's
> > proved that using dma_alloc_noncontiguous API and handling manually
> > the cache flushing will significantly improve performance.
> > 
> > Refer to:
> > commit 20e1dbf2bbe2 ("media: uvcvideo: Use dma_alloc_noncontiguous API")
> > commit 68d0c3311ec1 ("media: stk1160: use dma_alloc_noncontiguous API")
> > 
> > However, it's obvious that there is significant code duplication between
> > these two commits. Besides, a potential user USB Monitor may read outdated
> > data before the driver do DMA sync for CPU which will make the data
> > unreliable.
> > 
> > To reduce code duplication and avoid USB Monitor result unreliable, this
> > series will introduce DMA noncoherent API to USB core. And the USB core
> > layer will manage synchronization itself.
> > 
> > Then the last 2 patches have used the API.
> > 
> > I have tested uvcvideo driver. But I haven't tested stk1160 driver as I
> > don't have such boards. @Ezequiel Garcia, @Dafna Hirschfeld do you have
> > time to test it? Your support on this would be greatly appreciated.
> 
> It seems that patches 1 + 2 are ready for merging now
> (for patch 3 we should probably wait for testing).
> 
> I think that it would be best for both patches 1 + 2 to
> be merged through the USB tree. The changed code in the UVC
> driver is not touched that often so I do not expect any
> conflicts.

Ok, thanks, I'll take them through the USB tree now.

greg k-h

