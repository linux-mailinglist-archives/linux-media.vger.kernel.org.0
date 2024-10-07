Return-Path: <linux-media+bounces-19155-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B23992DF7
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 15:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CF3F1F242BA
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 13:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611901D6195;
	Mon,  7 Oct 2024 13:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ev1k1wtj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470A01D54D3
	for <linux-media@vger.kernel.org>; Mon,  7 Oct 2024 13:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728309341; cv=none; b=KN9zU+o4WwvhfL/jIrCR2qYcYckKch+kubZnmfuujUXhdL9iMff139s+VsHN1Eg4GZaesTc9TG7P5DSiRpruQwGDvXmA0xOvok7lHD4NMbsqnvropNanwYg+n/G+Xa1WcJ1gtHc2Oi11Mk/oomIHNIXTDDmtiYu5rICVfgKWLcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728309341; c=relaxed/simple;
	bh=9JVK802+5ACoKEa0TkByXl7HKF0UgxeNKpNxf+nz1fk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FPB16VYSXQzSRpUcY1k+1jomnnv7+pDjF4eew+UdtBZwTjFSdhTz7jZm9i3N5/Y4TIV7CpO4PIH1UmsBZ64lifjq+Su0RaM/uQcXXvyVAoqxr2tjqKEsuR+eEVP87Hu4EEF5kEM7pPaYEDvNGv+H577XCnoyKpU0KwcGEg87TCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ev1k1wtj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [132.205.230.14])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33DA8D49;
	Mon,  7 Oct 2024 15:54:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728309242;
	bh=9JVK802+5ACoKEa0TkByXl7HKF0UgxeNKpNxf+nz1fk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ev1k1wtjs8OXNuEgxr7ac3wE3KkodxTW1yBfVDXl6KzfSlKw69kcm4g3OHfC/h3wK
	 uHkYa0N3U53hx690tDLsq8gCrG3YycUNGks4ovO0NAHxCmcKe78ZIiJrcZi9BOuwLZ
	 d5rNNW4I9sy4b1CLoUh47swUjYWIVSUUCzqvMZjk=
Date: Mon, 7 Oct 2024 16:55:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	"open list:ROCKCHIP ISP V1 DRIVER" <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	"open list:ROCKCHIP ISP V1 DRIVER" <linux-rockchip@lists.infradead.org>,
	Adam Pigg <adam@piggz.co.uk>
Subject: Re: [PATCH] media: rkisp1: Reduce min_queued_buffers to 1
Message-ID: <20241007135532.GB6403@pendragon.ideasonboard.com>
References: <20241007124225.63463-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241007124225.63463-1-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Mon, Oct 07, 2024 at 02:42:24PM +0200, Jacopo Mondi wrote:
> There apparently is no reason to require 3 queued buffers to call
> streamon() for the RkISP1 as the driver operates with a scratch buffer
> where frames can be directed to if there's no available buffer provided
> by userspace.
> 
> Reduce the number of required buffers to 1 to allow applications to
> operate with a single queued buffer.
> 
> Tested with libcamera, by operating with a single capture a request. The

s/capture a/capture/

> same request (and associated capture buffer) gets recycled once
> completed. This of course causes a frame rate drop but doesn't hinder
> operations.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
> 
> Adam,
>    a few months ago you were exercizing your pinhole app with a single capture
> request for StillCapture operations and you got the video device to hang because
> no enough buffers where provided.
> 	
> This small change should be enough to unblock you. Could you maybe give it a
> spin if you're still working on this ?
> 
> Thanks
>    j
> ---
> 
>  drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index 2bddb4fa8a5c..34adaecdee54 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -35,8 +35,6 @@
>  #define RKISP1_SP_DEV_NAME	RKISP1_DRIVER_NAME "_selfpath"
>  #define RKISP1_MP_DEV_NAME	RKISP1_DRIVER_NAME "_mainpath"
> 
> -#define RKISP1_MIN_BUFFERS_NEEDED 3
> -
>  enum rkisp1_plane {
>  	RKISP1_PLANE_Y	= 0,
>  	RKISP1_PLANE_CB	= 1,
> @@ -1563,7 +1561,7 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
>  	q->ops = &rkisp1_vb2_ops;
>  	q->mem_ops = &vb2_dma_contig_memops;
>  	q->buf_struct_size = sizeof(struct rkisp1_buffer);
> -	q->min_queued_buffers = RKISP1_MIN_BUFFERS_NEEDED;
> +	q->min_queued_buffers = 1;

min_queued_buffers controls two things in vb2:

- It controls the minimum number of buffers that can be allocated, by
  setting

        if (q->min_reqbufs_allocation < q->min_queued_buffers + 1)
                q->min_reqbufs_allocation = q->min_queued_buffers + 1;

  in vb2_core_queue_init(). Note that this ony impacts the
  VIDIOC_REQBUFS ioctl, VIDIOC_CREATE_BUFS can still allocate a lower
  number of buffers.

- It delays the .start_streaming() call until min_queued_buffers buffers
  have been queued.

This patch brings a clear improvement as it allows operating with a
single buffer. Ideally though, it would be nice to set
min_queued_buffers to 0, so that .start_streaming() gets called
synchronously with VIDIOC_STREAMON. Otherwise stream start errors can be
reported later, at VIDIOC_QBUF time.

I expect going for 0 will require more changes in the driver, so I'm
fine merging this patch as-is as a first step.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>  	q->lock = &node->vlock;
>  	q->dev = cap->rkisp1->dev;

-- 
Regards,

Laurent Pinchart

