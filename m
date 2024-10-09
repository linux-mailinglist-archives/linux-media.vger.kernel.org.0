Return-Path: <linux-media+bounces-19306-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F689966AA
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 12:11:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C55C3B28644
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 10:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98A1D18E754;
	Wed,  9 Oct 2024 10:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="W4V6s/SD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6822118D640
	for <linux-media@vger.kernel.org>; Wed,  9 Oct 2024 10:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728468563; cv=none; b=j8Okdsi89Ut12Z1Owcl2ir5PQGONUO8fCGIbZYkyuJ01vpGReLg9X6NEDU4x3KwESsScSgJ8lUI5+mrqmCjfZ7kwpXRumKLf6T3LhCDOYTiP2e5MPZexFwtwsy2bI7D+EfCwP1sw/Uc7jhpL5DC9KsMZPUppREarg5Jri9PYkAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728468563; c=relaxed/simple;
	bh=R0deO1PuUCOsvLd+O2V7gIeSTjfe/xHeqe/OYbo8vuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jQ9OBM44SCqgOCzVZ21Qg14c06I9Pqd/CXOHYElTWo85DPUROt6aB51f4I0wQfFDENuyHHe+Pq8z2fixx7PiJ27bG407mYxjeEEH2nahx1BZ2tIPmHdIOiUDuUU2mmqQLP7r96SBIklIHaYkex6gym+/5z1Nwx8Pjvvd4oH0WsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=W4V6s/SD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-91-176-76.net.vodafone.it [5.91.176.76])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9ECB2EC;
	Wed,  9 Oct 2024 12:07:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728468462;
	bh=R0deO1PuUCOsvLd+O2V7gIeSTjfe/xHeqe/OYbo8vuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W4V6s/SDBU6ysOccsYfwmsSXFd8F7lZnxGQ5bqdeuXxzooZUJ0CgEVg+j8BkbTG1g
	 9Xqs5/BHRXL49CCygl7ITPuwmGUHOkZ+QQUtLHZshGfu6VQLc5B9B5SDUmmhI3V4ok
	 qJCzBJh1L7Vz/KkWU+brs8XD7RMttZR1Tlgn1j1o=
Date: Wed, 9 Oct 2024 12:09:15 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, "open list:ROCKCHIP ISP V1 DRIVER" <linux-media@vger.kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	"open list:ROCKCHIP ISP V1 DRIVER" <linux-rockchip@lists.infradead.org>, Adam Pigg <adam@piggz.co.uk>
Subject: Re: [PATCH] media: rkisp1: Reduce min_queued_buffers to 1
Message-ID: <as7oeoasnwxlkmpcnrt4v7zb7mbvm2rvwlehdcs34axv5whoyf@cheyd7cxtw7u>
References: <20241007124225.63463-1-jacopo.mondi@ideasonboard.com>
 <20241007135532.GB6403@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241007135532.GB6403@pendragon.ideasonboard.com>

Hi Laurent

On Mon, Oct 07, 2024 at 04:55:32PM GMT, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Mon, Oct 07, 2024 at 02:42:24PM +0200, Jacopo Mondi wrote:
> > There apparently is no reason to require 3 queued buffers to call
> > streamon() for the RkISP1 as the driver operates with a scratch buffer
> > where frames can be directed to if there's no available buffer provided
> > by userspace.
> >
> > Reduce the number of required buffers to 1 to allow applications to
> > operate with a single queued buffer.
> >
> > Tested with libcamera, by operating with a single capture a request. The
>
> s/capture a/capture/
>
> > same request (and associated capture buffer) gets recycled once
> > completed. This of course causes a frame rate drop but doesn't hinder
> > operations.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >
> > Adam,
> >    a few months ago you were exercizing your pinhole app with a single capture
> > request for StillCapture operations and you got the video device to hang because
> > no enough buffers where provided.
> >
> > This small change should be enough to unblock you. Could you maybe give it a
> > spin if you're still working on this ?
> >
> > Thanks
> >    j
> > ---
> >
> >  drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > index 2bddb4fa8a5c..34adaecdee54 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > @@ -35,8 +35,6 @@
> >  #define RKISP1_SP_DEV_NAME	RKISP1_DRIVER_NAME "_selfpath"
> >  #define RKISP1_MP_DEV_NAME	RKISP1_DRIVER_NAME "_mainpath"
> >
> > -#define RKISP1_MIN_BUFFERS_NEEDED 3
> > -
> >  enum rkisp1_plane {
> >  	RKISP1_PLANE_Y	= 0,
> >  	RKISP1_PLANE_CB	= 1,
> > @@ -1563,7 +1561,7 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
> >  	q->ops = &rkisp1_vb2_ops;
> >  	q->mem_ops = &vb2_dma_contig_memops;
> >  	q->buf_struct_size = sizeof(struct rkisp1_buffer);
> > -	q->min_queued_buffers = RKISP1_MIN_BUFFERS_NEEDED;
> > +	q->min_queued_buffers = 1;
>
> min_queued_buffers controls two things in vb2:
>
> - It controls the minimum number of buffers that can be allocated, by
>   setting
>
>         if (q->min_reqbufs_allocation < q->min_queued_buffers + 1)
>                 q->min_reqbufs_allocation = q->min_queued_buffers + 1;
>
>   in vb2_core_queue_init(). Note that this ony impacts the
>   VIDIOC_REQBUFS ioctl, VIDIOC_CREATE_BUFS can still allocate a lower
>   number of buffers.
>
> - It delays the .start_streaming() call until min_queued_buffers buffers
>   have been queued.
>
> This patch brings a clear improvement as it allows operating with a
> single buffer. Ideally though, it would be nice to set
> min_queued_buffers to 0, so that .start_streaming() gets called
> synchronously with VIDIOC_STREAMON. Otherwise stream start errors can be
> reported later, at VIDIOC_QBUF time.
>
> I expect going for 0 will require more changes in the driver, so I'm
> fine merging this patch as-is as a first step.

Well well well, I tried setting it to 0 and not provide any buffer to
the video device.

I see the number of interrupts received from the rkisp1 driver
increase with a frequency compatible with the frame rate, so it might
be possible that things work without modifications.

I'll keep digging

>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> >  	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> >  	q->lock = &node->vlock;
> >  	q->dev = cap->rkisp1->dev;
>
> --
> Regards,
>
> Laurent Pinchart

