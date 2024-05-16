Return-Path: <linux-media+bounces-11525-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C6E8C7533
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 13:27:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 019ED1C20FCE
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 11:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5E31459FA;
	Thu, 16 May 2024 11:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DazUIU2R"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7704B1459E7;
	Thu, 16 May 2024 11:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715858852; cv=none; b=TCqacHq6oYveFSEUlQhjOH7QYOiboX9CCVn2AFOS9MFRqe6dPqLC0uzR0Ro5ICdApYkZh/uK8P0ELZeL3fYe8AlQrpRwQnovmsbepERk3Ko9J+ieoP7BWjx3/gGvumnEXccfBPxiyuvewK8g1Fqc6LSWPZzoSH3Z76//CVcKg/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715858852; c=relaxed/simple;
	bh=XWllrDJgXCsAZy9Z5sDYfrb6ed2DyF9I1Pdx9ZRRR5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJNZBe533gsuE5zK6DyAZQPb5jfhofPrdxaW6p7aInruPJb/OrqW9Q2qSCUIS4oSDSYhr7zGpzBaS/pumOwzQSU6frnQtP0Sd3xVkfrPnpRsP/eAuSbi1QpOe4nnI1qUVxq4k6s0KBwPGHntBwICsg1mp/8f/WgEwGJF2YWFmKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DazUIU2R; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F16227C;
	Thu, 16 May 2024 13:27:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715858840;
	bh=XWllrDJgXCsAZy9Z5sDYfrb6ed2DyF9I1Pdx9ZRRR5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DazUIU2RgiGQFEFJXxUSK4kgQ7916AjDz6UDMMDf0sUg66jj5Ief2/k3l4SiOJY1T
	 rnHjgLlRS6wvNnIMFzrdrSkJHjaCdyXVUCwUf8P5s0pkAOp2ewDQr3QjnyAWqL8z+l
	 1Zj0EfYQsxWsbAn5eGUALpLIoiKGKibN5/TJpyPQ=
Date: Thu, 16 May 2024 14:27:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: nicolas.dufresne@collabora.corp-partner.google.com
Cc: Maxime Ripard <mripard@redhat.com>,
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
	Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
Message-ID: <20240516112720.GA12714@pendragon.ideasonboard.com>
References: <d2a512b2-e6b1-4675-b406-478074bbbe95@linaro.org>
 <Zjpmu_Xj6BPdkDPa@phenom.ffwll.local>
 <20240507183613.GB20390@pendragon.ideasonboard.com>
 <4f59a9d78662831123cc7e560218fa422e1c5eca.camel@collabora.com>
 <Zjs5eM-rRoh6WYYu@phenom.ffwll.local>
 <20240513-heretic-didactic-newt-1d6daf@penduick>
 <20240513083417.GA18630@pendragon.ideasonboard.com>
 <c4db22ad94696ed22282bf8dad15088d94ade5d6.camel@collabora.com>
 <20240514204223.GN32013@pendragon.ideasonboard.com>
 <a3428b0c352c24d43a2d458d41819fbf4b6cce0f.camel@collabora.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3428b0c352c24d43a2d458d41819fbf4b6cce0f.camel@collabora.corp-partner.google.com>

Hi Nicolas,

On Wed, May 15, 2024 at 01:43:58PM -0400, nicolas.dufresne@collabora.corp-partner.google.com wrote:
> Le mardi 14 mai 2024 à 23:42 +0300, Laurent Pinchart a écrit :
> > > You'll hit the same limitation as we hit in GStreamer, which is that KMS driver
> > > only offer allocation for render buffers and most of them are missing allocators
> > > for YUV buffers, even though they can import in these formats. (kms allocators,
> > > except dumb, which has other issues, are format aware).
> > 
> > My experience on Arm platforms is that the KMS drivers offer allocation
> > for scanout buffers, not render buffers, and mostly using the dumb
> > allocator API. If the KMS device can scan out YUV natively, YUV buffer
> > allocation should be supported. Am I missing something here ?
> 
> There is two APIs, Dumb is the legacy allocation API, only used by display

Is it legacy only ? I understand the dumb buffers API to be officially
supported, to allocate scanout buffers suitable for software rendering.

> drivers indeed, and the API does not include a pixel format or a modifier. The
> allocation of YUV buffer has been made through a small hack, 
> 
>   bpp = number of bits per component (of luma plane if multiple planes)
>   width = width
>   height = height * X
> 
> Where X will vary, "3 / 2" is used for 420 subsampling, "2" for 422 and "3" for
> 444. It is far from idea, requires deep knowledge of each formats in the
> application

I'm not sure I see that as an issue, but our experiences and uses cases
may vary :-)

> and cannot allocate each planes seperatly.

For semi-planar or planar formats, unless I'm mistaken, you can either
allocate a single buffer and use it with appropriate offsets when
constructing your framebuffer (with DRM_IOCTL_MODE_ADDFB2), or allocate
one buffer per plane.

> The second is to use the driver specific allocation API. This is then abstracted
> by GBM. This allows allocating render buffers with notably modifiers and/or use
> cases. But no support for YUV formats or multi-planar formats.

GBM is the way to go for render buffers indeed. It has been designed
with only graphics buffer management use cases in mind, so it's
unfortunately not an option as a generic allocator, at least in its
current form.

-- 
Regards,

Laurent Pinchart

