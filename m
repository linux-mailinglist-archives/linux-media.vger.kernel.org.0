Return-Path: <linux-media+bounces-20430-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1020E9B34A1
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 16:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 172D81C21DFF
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 15:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872A21DE2CF;
	Mon, 28 Oct 2024 15:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZDIZyYpL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2FC18FDBE
	for <linux-media@vger.kernel.org>; Mon, 28 Oct 2024 15:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730128798; cv=none; b=RnP1r/e8SNmTokcBlSQVaZeCmG1e90ES+tDm3XUnk7opjvpYRpaKYZ7w/QYvCar/rjs5ARGcFh2VcqKCJdM9oZQQGAGIBxasfIzuLvMopAeT38ZGrVBn6FpfE2rJBzKhI4m49FQAZH4N038IPHHJqg6u5XtslXKaOF45koQE9eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730128798; c=relaxed/simple;
	bh=g6orTQC54oYNvbTHJnvWmaykWl9/Id342abfy9t75o0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WYlXfCU/4cB17+IwL0rBFEi/iS37GYsOBecrXfTMTPJfmHtDGDs5m+p/LDoIjHXzOfITB2Bwpmz5rtKDdThGiFo2o9Ms+BMYeCfVnapNjC6b1H2NsA27MPWYTK415YCbvCOVVVvGASQTqsD7pnZxDkvCI1Xpv1E4nRwttqyvLZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZDIZyYpL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E768C743;
	Mon, 28 Oct 2024 16:19:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730128787;
	bh=g6orTQC54oYNvbTHJnvWmaykWl9/Id342abfy9t75o0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZDIZyYpL+BlBwzQQ0ncGTXKmKBMjqHxniNIIrnoEqm6C/+9bdiydvwgI3FCBVPCnJ
	 aPTLJnhzsQij9s1hPVrjwQFSci/g64QRCKp4NnuURgDEdPpDXdYM4lHIqM/aUft+kz
	 sVn+kutn3lzJPNytWbP+njJbD088oOt1emb16MpQ=
Date: Mon, 28 Oct 2024 17:19:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	"open list:ROCKCHIP ISP V1 DRIVER" <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	"open list:ROCKCHIP ISP V1 DRIVER" <linux-rockchip@lists.infradead.org>,
	Adam Pigg <adam@piggz.co.uk>
Subject: Re: [PATCH v2] media: rkisp1: Reduce min_queued_buffers to 0
Message-ID: <20241028151939.GJ24052@pendragon.ideasonboard.com>
References: <20241028143553.36704-1-jacopo.mondi@ideasonboard.com>
 <392682fd-3325-41ab-825d-67cb3de4c7b2@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <392682fd-3325-41ab-825d-67cb3de4c7b2@xs4all.nl>

Hi Hans, Jacopo,

On Mon, Oct 28, 2024 at 04:02:13PM +0100, Hans Verkuil wrote:
> On 28/10/2024 15:35, Jacopo Mondi wrote:
> > There apparently is no reason to require 3 queued buffers to call
> > streamon() for the RkISP1 as the driver operates with a scratch buffer
> > where frames can be directed to if there's no available buffer provided
> > by userspace.
> > 
> > Reduce the number of required buffers to 0 to allow applications to
> > operate by queueing capture buffers on-demand.
> > 
> > Tested with libcamera, by operating with a single capture request. The
> > same request (and associated capture buffer) gets recycled once
> > completed. This of course causes a frame rate drop but doesn't hinder
> > operations.
> > 
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> > The first version of this patch set min_queued_buffers to 1, but setting it
> > to 0 doesn't compromise operations and it's even better as it allows application
> > to queue buffers to the capture devices on-demand. If a buffer is not provided
> > to the DMA engines, image data gets directed to the driver's internal scratch
> > buffer.
> > ---
> >  drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > index 2bddb4fa8a5c..5fcf9731f41b 100644
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
> > +	q->min_queued_buffers = 0;
> 
> You can probably just drop this since the vb2_queue struct is zeroed when it
> is allocated. So no need to set it to 0.
> 
> And is the RKISP1_MIN_BUFFERS_NEEDED define still needed after this change?

Probably not, as the patch drops the define :-)

> Also, see my RFC I posted today:
> 
> https://lore.kernel.org/linux-media/126cd76a-6224-483b-a18d-a3cc89e5ff2d@xs4all.nl/T/#u
> 
> My main concern is that applications that just call VIDIOC_REQBUFS with count = 1
> and expect the driver to change that to a workable value, will, in fact, now just get
> one buffer. And streaming that will cause lots of frame drops.
> 
> It makes sense to leave min_queued_buffers at 0 if a scratch buffer is available,
> but I'm unhappy with the fact that you get a poor experience when REQBUFS(1) is called.

The rkisp1 driver requires a device-specific userspace, so I don't think
we need to care about old and/or dumb applications calling REQBUFS(1).

> My RFC suggests improvements in the uAPI. With that in place you can use CREATE_BUFS in
> libcamera to get much better control over how many buffers should be allocated.
> 
> >  	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> >  	q->lock = &node->vlock;
> >  	q->dev = cap->rkisp1->dev;

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart

