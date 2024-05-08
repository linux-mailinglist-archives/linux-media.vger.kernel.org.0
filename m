Return-Path: <linux-media+bounces-11178-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 327308C0691
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 23:51:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55DCA1C21008
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 21:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C9361327FE;
	Wed,  8 May 2024 21:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K8gt/jer"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508A312DDA7;
	Wed,  8 May 2024 21:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715205078; cv=none; b=iiYeGYeZ+DGD/XuYAaEUL8XcRgdS7kUdQp/cs0B1OiurvrAz2jkxHUM0ynNocTsJ+4r6UhUhSQ1NMZ1g5hYDW6K11w6HwPwYspluqB9qJb2aUrXB+pj/tJE5+0lf4a/RPqVMrWKqpz38VMs57KoxIxk4RSKnzuzO8RexB6y8kS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715205078; c=relaxed/simple;
	bh=IdgHgaZdPcCXFSJGhhONFbwqejjGF4oKLW1+TyIjdGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QH7h8I8Ah4fLF7n+jjx41wXCMAVK2sJ4u1Rsj6MHh/fuqYvzp/gjIfYBS1S6NesWbdg49LE8UrNk9PXKbEUmuM9AvqwsByAUMbNBwWsDvrM+hdM57B+rPxjljbsE0wSPnY7BTRkFS+lnHpyo2kGf11inj7Oubfe8+9mrPc2e/HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K8gt/jer; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EAD5916D4;
	Wed,  8 May 2024 23:51:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715205072;
	bh=IdgHgaZdPcCXFSJGhhONFbwqejjGF4oKLW1+TyIjdGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K8gt/jeri0bkXEDe3kXbJ7A0PhkdE0GTmUVOr1cZWm/xQqOUM8l2aRy5P5oCOB8zp
	 pu0k/PidVMCYjfxZy70PN0pzgULxqT3UqKF7dJJcEFSBgKCLTdMQKXkNdsykFUBggZ
	 PN4pnMgaieoRRUxFKddxdt+nJpP7kLaKYlSynubo=
Date: Thu, 9 May 2024 00:51:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Lennart Poettering <mzxreary@0pointer.de>,
	Robert Mader <robert.mader@collabora.com>,
	Sebastien Bacher <sebastien.bacher@canonical.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	linaro-mm-sig@lists.linaro.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Milan Zamazal <mzamazal@redhat.com>,
	Maxime Ripard <mripard@redhat.com>,
	Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
Message-ID: <20240508215106.GA24860@pendragon.ideasonboard.com>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <ojduxo54lpcbfg2wfuhqhy7k3phncamtklh65z7gvttcwztmhk@zkifewcy4ovi>
 <3c0c7e7e-1530-411b-b7a4-9f13e0ff1f9e@redhat.com>
 <e7ilwp3vc32xze3iu2ejgqlgz44codsktnvyiufjhuf2zxcnnf@tnwzgzoxvbg2>
 <d2a512b2-e6b1-4675-b406-478074bbbe95@linaro.org>
 <Zjpmu_Xj6BPdkDPa@phenom.ffwll.local>
 <20240507183613.GB20390@pendragon.ideasonboard.com>
 <4f59a9d78662831123cc7e560218fa422e1c5eca.camel@collabora.com>
 <Zjs5eM-rRoh6WYYu@phenom.ffwll.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zjs5eM-rRoh6WYYu@phenom.ffwll.local>

On Wed, May 08, 2024 at 10:36:08AM +0200, Daniel Vetter wrote:
> On Tue, May 07, 2024 at 04:07:39PM -0400, Nicolas Dufresne wrote:
> > Le mardi 07 mai 2024 à 21:36 +0300, Laurent Pinchart a écrit :
> > > Shorter term, we have a problem to solve, and the best option we have
> > > found so far is to rely on dma-buf heaps as a backend for the frame
> > > buffer allocatro helper in libcamera for the use case described above.
> > > This won't work in 100% of the cases, clearly. It's a stop-gap measure
> > > until we can do better.
> > 
> > Considering the security concerned raised on this thread with dmabuf heap
> > allocation not be restricted by quotas, you'd get what you want quickly with
> > memfd + udmabuf instead (which is accounted already).
> > 
> > It was raised that distro don't enable udmabuf, but as stated there by Hans, in
> > any cases distro needs to take action to make the softISP works. This
> > alternative is easy and does not interfere in anyway with your future plan or
> > the libcamera API. You could even have both dmabuf heap (for Raspbian) and the
> > safer memfd+udmabuf for the distro with security concerns.
> > 
> > And for the long term plan, we can certainly get closer by fixing that issue
> > with accounting. This issue also applied to v4l2 io-ops, so it would be nice to
> > find common set of helpers to fix these exporters.
> 
> Yeah if this is just for softisp, then memfd + udmabuf is also what I was
> about to suggest. Not just as a stopgap, but as the real official thing.

Long term I still want a centralized memory allocator, at which point
libcamera should stop allocating buffers at all.

> udmabuf does kinda allow you to pin memory, but we can easily fix that by
> adding the right accounting and then either let mlock rlimits or cgroups
> kernel memory limits enforce good behavior.

-- 
Regards,

Laurent Pinchart

