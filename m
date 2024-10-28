Return-Path: <linux-media+bounces-20431-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB059B34ED
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 16:31:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33D08281708
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 15:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 219CC1DE3B4;
	Mon, 28 Oct 2024 15:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I+73oouv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0030E1DD54D
	for <linux-media@vger.kernel.org>; Mon, 28 Oct 2024 15:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730129418; cv=none; b=AQ4I0HAfdxdCbD8LxHvqh0NJ44Y/U1O/RTci5uVKvK7SstEBXfdyhD9zmJU6RiWU1pW76l+ZWKAOB42/+fSxS8Duu8lPjHt7P4vOEQAsYvr2mrglbNBEgLRfemKlgIg47kBmTClg0m+bskyYDsh0bGMgSQvggy7iXsJJ+oE5JgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730129418; c=relaxed/simple;
	bh=/6Bcj0CPEUpTetdghXBMkQBN5vHJHRw+yJI9qQfbVDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tm22U9VU6gFuqXm/SpOLLwkcy/APvWQ/WuTGWhLVP/q9dUvTjTw1Xyr+A8kmm1IwFffLq+R90vlwjRIMbPNfeUpe9vuVEgCKIm6cBEf+cocRqWMof9Jt3qr4Ve9Q0P0sS9wvbxNij0NaAjITQhIAKxp+wsKgGqck4Xj4uT0NLSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I+73oouv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-59-111.net.vodafone.it [5.90.59.111])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B3DF91AFB;
	Mon, 28 Oct 2024 16:30:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730129405;
	bh=/6Bcj0CPEUpTetdghXBMkQBN5vHJHRw+yJI9qQfbVDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I+73oouv5/YjFLjXkHISCWjde46eiZBgA+BQJ8x78XJjNSTtqajldC1smQ+/c8jiC
	 YBx/UqS7PchhvUddtN+yv1D9vITiZ2gjjYSP+YdrGD2D8fdYsJYK3re9XxNKmwjj0w
	 nYzdfM+1Td4pk9dkbU7Opf3louwFG04/RHqqX/kc=
Date: Mon, 28 Oct 2024 16:30:02 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	"open list:ROCKCHIP ISP V1 DRIVER" <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, 
	"open list:ROCKCHIP ISP V1 DRIVER" <linux-rockchip@lists.infradead.org>, Adam Pigg <adam@piggz.co.uk>
Subject: Re: [PATCH v2] media: rkisp1: Reduce min_queued_buffers to 0
Message-ID: <ncxqnajjdty456w6wsk5sonjuk3e2uzvcse7bdmmmmk4lop5i2@73vuqxkol4nr>
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

Hi Hans

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

I suspected so :)

>
> And is the RKISP1_MIN_BUFFERS_NEEDED define still needed after this change?

No, and this patch removes it in facts

 -#define RKISP1_MIN_BUFFERS_NEEDED 3
 -

>
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

Yeah, I've read the discussion between you and Tomi and it seemed like
a good time to re-send this patch.

>
> My RFC suggests improvements in the uAPI. With that in place you can use CREATE_BUFS in
> libcamera to get much better control over how many buffers should be allocated.
>

In my understanding min_queued_buffers identifies how many buffers
should be queued before calling start_streaming, and this comes
directly from an hw/driver requirement. This doesn't mean that at
least min_queue_buffers should be queued at all the times during
streaming, at least, I don't see how and where videobuf2 enforces
this. Or does it ?

If the above is correct, then the number of buffers to be queued
during streaming is, in my opinion, less an hw/driver requirement but
more an application decision. As you said an application should be good with
3 buffers (one queued, one currently being written to, one to be
consumed by the application), but in very specific cases where an
application retains the buffer for longer, for whatever reason, it
might need a larger number of queued buffers to provide the DMA
engines a space where to write data without them being discarded (to
scratch buffers or discarded by the DMA engine itself, if the HW
supports that). Or maybe an application is fine to drop frames and
only queue buffers sporadically (if the HW supports that ofc).

For libcamera, and for this specific platform in particular, we're
going to base new developments on the assumption that
min_queued_buffers == 0, and it would be more convenient for use to be
able to access its value from userspace to identify if we're running
on a kernel with or without this patch being applied.

Thanks
  j

> Regards,
>
> 	Hans
>
> >  	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> >  	q->lock = &node->vlock;
> >  	q->dev = cap->rkisp1->dev;
> > --
> > 2.47.0
> >
> >
>

