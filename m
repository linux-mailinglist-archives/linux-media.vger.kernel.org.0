Return-Path: <linux-media+bounces-26477-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2305FA3DCA6
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 15:26:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CB1116C5E4
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 14:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADCB31C174A;
	Thu, 20 Feb 2025 14:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="payuqkAA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6619C1FBEB7
	for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 14:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740061371; cv=none; b=BhJ06Tu/BF5tfFqPucd7nE+vk6dr/3wa/79auhr5hScbTQfp8yoQHNKW3mctf3WQFmNYSVHafsr1dSXO0mN4zpO8kaJPECoAoKfLA0rblqBztayp1wol1mRBmjAyEQuZzee2n4ABIIl9p4WrTpzMVdFvT5E7D446J2zV2Wuv6+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740061371; c=relaxed/simple;
	bh=TcejpippJvjB50Kl5Qm/rwfhSvi7Iulh9ai/h009ukc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q62ZU9j8RwrUwRZDmds6xIoY8J+qil77o8ATGTpffazhbX12aiX4VJWpdEMd/r1MStIflBdrIzJ+xfLklS/A9t6PdQq/HDwDZWx1mITvgHK9NduAgH4BQleT0AR5bCJ0EOICylgAQo4RfoV56ezBcp29t3a82wg99UNQFjgSols=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=payuqkAA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB9FCE79;
	Thu, 20 Feb 2025 15:21:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740061283;
	bh=TcejpippJvjB50Kl5Qm/rwfhSvi7Iulh9ai/h009ukc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=payuqkAAtWWczRzdmnXi39IuAkNpxmSo6+SPm34hetntVxyKQw68ZNSK7le16kGze
	 T4vBTvDaoUtdsghW0w7MXifJi8A5NLUvLwLE6theIHh5go39a+ZBqDLBrXqO94hBZD
	 fR+4+nBlSTAVVHMvjxbBqZjMq5WboGdhVF0JpoAM=
Date: Thu, 20 Feb 2025 15:22:44 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	"open list:ROCKCHIP ISP V1 DRIVER" <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, 
	"open list:ROCKCHIP ISP V1 DRIVER" <linux-rockchip@lists.infradead.org>, Adam Pigg <adam@piggz.co.uk>
Subject: Re: [PATCH v3] media: rkisp1: Remove min_queued_buffers
Message-ID: <tpdzxkug5gtive7h4tvl6jn5r7ybb3dby7ajfuwmzigphhlkin@geirq67p6dww>
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

Hello

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

I just noticed v2 of this series:
media: rkisp1: Reduce min_queued_buffers to 1

has been collected instead of this v3.

And I noticed because a user complained to me about this.

Now, I can provide an update based on the now merged v2, not a big
deal, but this depresses me a bit as the discussion about
implementing multi-commiter model is apparently (again) stalled.

I know, sh*t happens (TM) and hiccups are expected in the process,
we all make mistakes and I'm not even sure through which path the
patch has been collected, but I could have handled this one easily,
and instead what we have is:

1) an unhappy user that will likely have to wait for the next release
2) me having to send an additional (rather trivial) patch
3) Someone will have to review, collect, PR etc etc

(and I'm not even mentioning this patch is 3 lines)

Issues like this one seems to be considered a fact of life we decided
is fine to live with, while every possible corner case of the proposed
multi-committer model is analyzed with great concern like we're
trading a perfect model for something that has to be equally perfect.

And while I agree the biggest reason for the proverbial v4l2 slow pace
is the reviewers scarcity and the limited maintainers bandwidth, now
that we have everything in place to reduce the system clogginess
it still seems we're not all sold for it. I really don't get it, sorry.


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
> --
> 2.47.0
>
>

