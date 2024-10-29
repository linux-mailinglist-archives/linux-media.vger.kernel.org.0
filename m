Return-Path: <linux-media+bounces-20518-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 878C49B483F
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 12:29:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BE3F282FF4
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 11:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C6E205124;
	Tue, 29 Oct 2024 11:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Hyp3I+tf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FE11DED5A
	for <linux-media@vger.kernel.org>; Tue, 29 Oct 2024 11:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730201388; cv=none; b=nUILefKp7bhGcELLOkRMcCCici8hH9nRealuh5hsBJ4lR45F1gY30tGGdRWz31SzZk7QQqE0CEco5784XQ/+lx2Xo3EqsQxIOC8j8L2fFt4jcRIMhiSn7ndGUZCrg1L07FRRWWfPs8BKTxRPi3iskMtL61DHwX/MKhH/7baE+r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730201388; c=relaxed/simple;
	bh=lxEaz9zefDj/aMT9+pxqqU4ButtnS0rBn6cwmMQYqaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gfq+VZeLekrHxMAU/Cgm5ffjZvQzq5R9ol2vfYhBk4ZVxHBVh8KK41fWSqXPaidrNYeIAV7YZZdIlnFN/HnztGdFJI76QkVxKtJlfLG7IEJeVQMx+GJIl+jLo3Nq6NZ7j3D3rwkP+v1iDWeNnIhKX6phwBqmaUjJhlm076kzvgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Hyp3I+tf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3388DAF;
	Tue, 29 Oct 2024 12:29:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730201382;
	bh=lxEaz9zefDj/aMT9+pxqqU4ButtnS0rBn6cwmMQYqaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hyp3I+tfpgji+te1tB8y4IuN6AP/h3BBi/P6yFtx0CB42Br25C1TlEtYnFvMf8YIc
	 647CrdI57zVI41fUVuPDLN3IltBhpkXHd3CPS6g0OUyZcQXcm9/XYrs9k1X9cWjuA/
	 2hjIyO3XmBdhEa+NykvcSis6t1K7OEMvHmviMEVE=
Date: Tue, 29 Oct 2024 13:29:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	"open list:ROCKCHIP ISP V1 DRIVER" <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	"open list:ROCKCHIP ISP V1 DRIVER" <linux-rockchip@lists.infradead.org>,
	Adam Pigg <adam@piggz.co.uk>
Subject: Re: [PATCH v3] media: rkisp1: Remove min_queued_buffers
Message-ID: <20241029112938.GK22600@pendragon.ideasonboard.com>
References: <20241029082117.55385-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241029082117.55385-1-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Tue, Oct 29, 2024 at 09:21:16AM +0100, Jacopo Mondi wrote:
> There apparently is no reason to require 3 queued buffers for RkISP1,
> as the driver operates with a scratch buffer where data can be
> directed to if there's no available buffer provided by userspace.
> 
> Reduce the number of required buffers to 0 by removing the
> initialization of min_queued_buffers, to allow applications to operate
> by queueing capture buffers on-demand.
> 
> Tested with libcamera, by operating with a single capture request. The
> same request (and the associated capture buffer) gets recycled once
> completed. This of course causes a frame rate drop but doesn't hinder
> operations.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v2->v3:
> - Remove min_queued_buffers initialization
> 
> v1->v2:
> The first version of this patch set min_queued_buffers to 1, but setting it
> to 0 doesn't compromise operations and it's even better as it allows application
> to queue buffers to the capture devices on-demand. If a buffer is not provided
> to the DMA engines, image data gets directed to the driver's internal scratch
> buffer.
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index 2bddb4fa8a5c..2f0c610e74b9 100644
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
> @@ -1563,7 +1561,6 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
>  	q->ops = &rkisp1_vb2_ops;
>  	q->mem_ops = &vb2_dma_contig_memops;
>  	q->buf_struct_size = sizeof(struct rkisp1_buffer);
> -	q->min_queued_buffers = RKISP1_MIN_BUFFERS_NEEDED;
>  	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>  	q->lock = &node->vlock;
>  	q->dev = cap->rkisp1->dev;

-- 
Regards,

Laurent Pinchart

