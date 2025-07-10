Return-Path: <linux-media+bounces-37429-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D60FB00E36
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 23:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2F7B7B3D93
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 21:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01500290D96;
	Thu, 10 Jul 2025 21:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uN7shFZo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD6D28C2B1;
	Thu, 10 Jul 2025 21:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752184397; cv=none; b=VgYgBoYTvTK/ko+GgwJBn5iT4smGzqWThgqfLjMa9o6jbZjXdT+mwB5kOSDf4fg2f+7HvFXQpGXS8ZyzAjTcFNmWSfh/F06W0tfG7ZOmuwv4G7LUiTzWEolctBRVE5a1RCG29MdG7j0BRDVFQ/84XCSKDn9CF1i06MM6fB0fVeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752184397; c=relaxed/simple;
	bh=HdHcUNEwnHO7i+iCXJrbRQoTaOpw3e20BB/FSIxX30I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8psVF/sc3gTyBaJPpmQHKoVnI/lAVUZDF3y9szbz724WbhidyGGcL4Mx93likxl2KkEKPXCxp9q8wihEr9Y0cTSgOGbGupr50dyCG8b3Bm+z4eXu1lBEDcHe8RHMA7JFFX5YAyVvl9hfAlV1NnVdjpqg6mSl6qDjjSNQ0ysyYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uN7shFZo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 24171EFE;
	Thu, 10 Jul 2025 23:52:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752184364;
	bh=HdHcUNEwnHO7i+iCXJrbRQoTaOpw3e20BB/FSIxX30I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uN7shFZoQ7WqWZyO4afhcLdyRJaXpHBb8hzbkYxasCO8v1QaVrbuWky6bcnENVZln
	 f2p9QjA6LfCrrvKF8h59Irl0f95vlz4iv5g7KQMW7alIJHBtwTsRYP+aK2G+kPsBa9
	 lXsKSHNTLVhwpvSJehNCUL0fn6R44ktbih+1GO/g=
Date: Fri, 11 Jul 2025 00:52:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Pavel Machek <pavel@ucw.cz>
Cc: Lucas Stach <l.stach@pengutronix.de>, kraxel@redhat.com,
	vivek.kasireddy@intel.com, dri-devel@lists.freedesktop.org,
	sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	kernel list <linux-kernel@vger.kernel.org>,
	linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
	etnaviv@lists.freedesktop.org, phone-devel@vger.kernel.org
Subject: Re: DMA-BUFs always uncached on arm64, causing poor camera
 performance on Librem 5
Message-ID: <20250710215242.GA16271@pendragon.ideasonboard.com>
References: <aG94uNDrL1MdHJPM@duo.ucw.cz>
 <aecd03f464f25d50f379be405a8596261f247897.camel@pengutronix.de>
 <aG9+j3p0+fdLQZwu@duo.ucw.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aG9+j3p0+fdLQZwu@duo.ucw.cz>

On Thu, Jul 10, 2025 at 10:49:19AM +0200, Pavel Machek wrote:
> Hi!
> 
> > > memcpy() from normal memory is about 2msec/1MB. Unfortunately, for
> > > DMA-BUFs it is 20msec/1MB, and that basically means I can't easily do
> > > 760p video recording. Plus, copying full-resolution photo buffer takes
> > > more than 200msec!
> > > 
> > > There's possibility to do some processing on GPU, and its implemented here:
> > > 
> > > https://gitlab.com/tui/tui/-/tree/master/icam?ref_type=heads
> > > 
> > > but that hits the same problem in the end -- data is in DMA-BUF,
> > > uncached, and takes way too long to copy out.
> > > 
> > > And that's ... wrong. DMA ended seconds ago, complete cache flush
> > > would be way cheaper than copying single frame out, and I still have
> > > to deal with uncached frames.
> > > 
> > > So I have two questions:
> > > 
> > > 1) Is my analysis correct that, no matter how I get frame from v4l and
> > > process it on GPU, I'll have to copy it from uncached memory in the
> > > end?
> > 
> > If you need to touch the buffers using the CPU then you are either
> > stuck with uncached memory or you need to implement bracketed access to
> > do the necessary cache maintenance. Be aware that completely flushing
> > the cache is not really an option, as that would impact other
> > workloads, so you have to flush the cache by walking the virtual
> > address space of the buffer, which may take a significant amount of CPU
> > time.
> 
> What kind of "significant amount of CPU time" are we talking here?
> Millisecond?

It really depends on the platform, the type of cache, and the size of
the buffer. I remember that back in the N900 days a selective cash clean
of a large buffer for full resolution images took several dozens of
milliseconds, possibly close to 100ms. We had to clean the whole D-cache
to make it fast enough, but you can't always do that as Lucas mentioned.

> Bracketed access is fine with me.
> 
> Flushing a cache should be an option. I'm root, there's no other
> significant workload, and copying out the buffer takes 200msec+. There
> are lot of cache flushes that can be done in quarter a second!
> 
> > However, if you are only going to use the buffer with the GPU I see no
> > reason to touch it from the CPU side. Why would you even need to copy
> > the content? After all dma-bufs are meant to enable zero-copy between
> > DMA capable accelerators. You can simply import the V4L2 buffer into a
> > GL texture using EGL_EXT_image_dma_buf_import. Using this path you
> > don't need to bother with the cache at all, as the GPU will directly
> > read the video buffers from RAM.
> 
> Yes, so GPU will read video buffer from RAM, then debayer it, and then
> what? Then I need to store a data into raw file, or use CPU to turn it
> into JPEG file, or maybe run video encoder on it. That are all tasks
> that are done on CPU...

-- 
Regards,

Laurent Pinchart

