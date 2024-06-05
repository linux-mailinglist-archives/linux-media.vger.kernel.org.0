Return-Path: <linux-media+bounces-12557-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F6B8FC4AD
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 09:37:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31AA328335B
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 07:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD4618C331;
	Wed,  5 Jun 2024 07:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ci4l3vaB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7FB6A03F
	for <linux-media@vger.kernel.org>; Wed,  5 Jun 2024 07:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717573029; cv=none; b=P/hP38HysVHGaK6k4x903hTgxjkyedGbxmLBDlNZwnyK2ksUIfVHe3dkkQZL5wtce1n41zYHZwWZlKDgRRnp1zBQZ9c2OFWf+IQ0iRKl9Sbmya2dp87fick4nVY5GWnOTgnczltDpLxuRCFHbBU0Ol2QaL3vIdGfSgvmUe3vYuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717573029; c=relaxed/simple;
	bh=Vw49JEx7wiDqa5BGHv69x0BydtTEhspsjRxMReU/+rY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pPcvuTVmErE7FqwZ/V+IeGwrDWJesOOG465QcCMrmdZlCFnPEc+ILskZFNuKhXSGSR5pZoYeKtpv3f2YN4lTiA2lWS5O7VLWik8e115ld5qg4hcSNFk70GVkX8zz+NPcvOfrCYHkV4H5HpJKg00AjbuG4hWV6WgRY8bpOU1a7cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ci4l3vaB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B07AAEA2;
	Wed,  5 Jun 2024 09:36:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717573016;
	bh=Vw49JEx7wiDqa5BGHv69x0BydtTEhspsjRxMReU/+rY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ci4l3vaB6L/5qEKLBgak8iUQZ08JZ5AdXI9+lD5jh6EXuifCBObWH26l/4ST511AW
	 43V4Gf32eqkg3ZEBF34aJOa3oRq0YgJYvE2mP1KBh8TAU9LkR92Ifcx2eFunPMr50R
	 wsI3Lo6vd7uZzSJa1deNakJEwyZUDfU66bu4WKVI=
Date: Wed, 5 Jun 2024 09:37:01 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Sakari Ailus <sakari.ailus@iki.fi>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [RFC 0/3] media: videobuf2: Allow driver to override
 vb2_queue.buf_ops
Message-ID: <r3xmeidoe462onnhh4oetc23kyxy5ohymema6ry2w7haqmv6de@zef57ojr7deg>
References: <20240603152548.107158-1-jacopo.mondi@ideasonboard.com>
 <20240605064909.GB879@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240605064909.GB879@pendragon.ideasonboard.com>

Hi Laurent

On Wed, Jun 05, 2024 at 09:49:09AM GMT, Laurent Pinchart wrote:
> Hi Jacopo,
>
> On Mon, Jun 03, 2024 at 05:25:44PM +0200, Jacopo Mondi wrote:
> > Hello
> >
> >   I have the need to allocate a scratch buffer to mirror the content of the
> > vb2_buffer planes (more detail on this on request).
> >
> > The allocation of such 'scratch' buffer should ideally be done once, at buffer
> > creation time (and released at buffer release time ?)
> >
> > Looking at the videobuf2 framework implementation I noticed that the ideal entry
> > point for this would be vb2_queue.buf_ops.init_buffer, which is called in the
> > __vb2_queue_alloc() call path.
> >
> > I have noticed that the vb2_queue.buf_ops members seems to be there to be made
> > overridable by drivers, but are instead:
> >
> > 1) unconditionally set by the framework in vb2_queue_init_name()
> > 2) the core helpers are not exported
> >
> > hence I was wondering if this is the result some half-baked attempt to make
> > them ovverridable or the possibility of override them was instead deprecated.
> > As I found no traces of this in the log, I thought it was easier to send an
> > RFC.
> >
> > I also checked what other entry points I could have used to allocate backing
> > memory for a buffer, and I have considered vb2_queue.vb2_ops.buf_init which
> > is however called in the vb2_req_prepare() call path (I'm not using the request
> > API atm) or in the VIDIOC_PREPARE_BUF call path, which requires ad-hoc
> > instrumentation in user space (something I would like to avoid if possibile).
> >
> > What do you think ?
>
> I've been thinking more about this. I wonder if you could use
> .buf_init() for your use case. It's called in three places:
>
> - __vb2_queue_alloc()

This is only called

        if (memory == VB2_MEMORY_MMAP)

and I originally considered it a non viable solution, as it only
supports the MMAP use case. Now that I thought about it a few more
seconds, I realized that MMAP it's the only actual use case where
memory is allocated by the driver and thus the only memory management
method that makes sense to pair with buf_init

> - __prepare_userptr()
> - __prepare_dmabuf()

These, if I'm not mistaken are in VIDIOC_PREPARE_BUF call

>
> As your scratch buffer needs are limited to the ISP parameters queue,
> which should use MMAP only, I think .buf_init() would be just fine.
>

Probably so, I'll give it a go

Thanks!

> > Jacopo Mondi (3):
> >   media: videobuf2: WARN if !vb2_queue.buf_ops
> >   media: Allow drivers to overwrite vb2_queue.buf_ops
> >   media: rkisp1-params: Override vb2_queue.buf_ops
> >
> >  .../media/common/videobuf2/videobuf2-core.c   | 12 ++++---
> >  .../media/common/videobuf2/videobuf2-v4l2.c   | 34 +++++++++++--------
> >  .../platform/rockchip/rkisp1/rkisp1-params.c  | 18 +++++++++-
> >  include/media/videobuf2-core.h                |  7 ++++
> >  include/media/videobuf2-v4l2.h                |  8 +++++
> >  5 files changed, 60 insertions(+), 19 deletions(-)
>
> --
> Regards,
>
> Laurent Pinchart

