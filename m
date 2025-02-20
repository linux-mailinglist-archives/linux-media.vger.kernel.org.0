Return-Path: <linux-media+bounces-26504-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AFEA3E103
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 17:40:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A445170D2C
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 16:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F6520FAB9;
	Thu, 20 Feb 2025 16:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="thGJhTqp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDB920D4E2
	for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 16:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740069543; cv=none; b=FY5djQpHBDCTttUigJQeYaM2r+b/cRK8x0FaL43LYUGamIruSmaC6hRCcPtJpz7RKsva+8b1vQ6PwvXXO4xi7wS6muDpfsfWJjxKMsZ9MKmdM/6T8OPYOJBs5e/6XdIlPJ3ZGgHkpMFYWy37VPV5+tx8T6qgYbQ/AyTobkuyjOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740069543; c=relaxed/simple;
	bh=NpVgzpSt57PVSSkjzpDrh/DNf40mgZQJo1PiwYskYnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R75OirESNwjPHJWe6Q9NnI0dbH9AAaAiB95OinhsZavzljSvMol9Ku2xCsae7mbvh+f/DHrzQwGjIPnt+1S7NaFParQGT2FuaiOb7KMT02Efcn+/kZHwSgp76rLKJBdiGp17E6+RfMHXA94VmWpxf9mmZSxqgEEx8+rY39cnFaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=thGJhTqp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 953EC1193;
	Thu, 20 Feb 2025 17:37:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740069456;
	bh=NpVgzpSt57PVSSkjzpDrh/DNf40mgZQJo1PiwYskYnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=thGJhTqpVso78UUSwsWxI3jeLjd1QKzweP9dbUPIc/pZo6sbf4MsyA+VeBGnVMUes
	 ei9Z6MzF6dMOhJwa3/+tQjMueCtvudqzmsS8/NnMLA7pyQu1aoeOLVQGwl8pAldMqz
	 VE8mHbA9Y4abWBgVTohhqAIwSQZ7mf5dnfmRhUMM=
Date: Thu, 20 Feb 2025 18:38:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	"open list:ROCKCHIP ISP V1 DRIVER" <linux-media@vger.kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	"open list:ROCKCHIP ISP V1 DRIVER" <linux-rockchip@lists.infradead.org>,
	Adam Pigg <adam@piggz.co.uk>
Subject: Re: [PATCH v3] media: rkisp1: Remove min_queued_buffers
Message-ID: <20250220163844.GI20111@pendragon.ideasonboard.com>
References: <20241029082117.55385-1-jacopo.mondi@ideasonboard.com>
 <tpdzxkug5gtive7h4tvl6jn5r7ybb3dby7ajfuwmzigphhlkin@geirq67p6dww>
 <0d8d204f-c9b1-4152-a041-10d21f94af56@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0d8d204f-c9b1-4152-a041-10d21f94af56@xs4all.nl>

On Thu, Feb 20, 2025 at 04:33:28PM +0100, Hans Verkuil wrote:
> On 2/20/25 15:22, Jacopo Mondi wrote:
> > On Tue, Oct 29, 2024 at 09:21:16AM +0100, Jacopo Mondi wrote:
> >> There apparently is no reason to require 3 queued buffers for RkISP1,
> >> as the driver operates with a scratch buffer where data can be
> >> directed to if there's no available buffer provided by userspace.
> >>
> >> Reduce the number of required buffers to 0 by removing the
> >> initialization of min_queued_buffers, to allow applications to operate
> >> by queueing capture buffers on-demand.
> >>
> >> Tested with libcamera, by operating with a single capture request. The
> >> same request (and the associated capture buffer) gets recycled once
> >> completed. This of course causes a frame rate drop but doesn't hinder
> >> operations.
> >>
> >> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > 
> > I just noticed v2 of this series:
> > media: rkisp1: Reduce min_queued_buffers to 1
> > 
> > has been collected instead of this v3.
> > 
> > And I noticed because a user complained to me about this.
> > 
> > Now, I can provide an update based on the now merged v2, not a big
> > deal, but this depresses me a bit as the discussion about
> > implementing multi-commiter model is apparently (again) stalled.
> > 
> > I know, sh*t happens (TM) and hiccups are expected in the process,
> > we all make mistakes and I'm not even sure through which path the
> > patch has been collected, but I could have handled this one easily,
> > and instead what we have is:
> > 
> > 1) an unhappy user that will likely have to wait for the next release
> > 2) me having to send an additional (rather trivial) patch
> > 3) Someone will have to review, collect, PR etc etc
> > 
> > (and I'm not even mentioning this patch is 3 lines)
> > 
> > Issues like this one seems to be considered a fact of life we decided
> > is fine to live with, while every possible corner case of the proposed
> > multi-committer model is analyzed with great concern like we're
> > trading a perfect model for something that has to be equally perfect.
> > 
> > And while I agree the biggest reason for the proverbial v4l2 slow pace
> > is the reviewers scarcity and the limited maintainers bandwidth, now
> > that we have everything in place to reduce the system clogginess
> > it still seems we're not all sold for it. I really don't get it, sorry.
> 
> The main gitlab blocker is that we need a merge bot. Ricardo said in the
> last meeting that he hopes to have that in a month. The other blocker is
> of course the gitlab freedesktop migration to another provider.
> 
> Without a merge bot even with just two committers Mauro and myself are
> frequently stepping on each others toes, so that really is needed. Heck, if
> I have two CI pipelines in flight, I'm stepping on my own toes! Hopefully a
> merge bot should fix this issue.
> 
> Otherwise it is going quite well on the gitlab front.
> 
> The other is the "Document the new media-committer's model" series. I
> think Laurent scared Mauro off with his last set of comments.

I think there may be less fundamental disagreements that one may fear,
and that part of the trouble is caused by misunderstandings. E-mail
communication makes it worse, I'd like to reiterate an invitation to
discuss this in a video call. Decisions will still be made on the list,
with everybody involved, but explaining our positions live will I think
improve mutual understanding.

> >> ---
> >> v2->v3:
> >> - Remove min_queued_buffers initialization
> >>
> >> v1->v2:
> >> The first version of this patch set min_queued_buffers to 1, but setting it
> >> to 0 doesn't compromise operations and it's even better as it allows application
> >> to queue buffers to the capture devices on-demand. If a buffer is not provided
> >> to the DMA engines, image data gets directed to the driver's internal scratch
> >> buffer.
> >> ---
> >>  drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 3 ---
> >>  1 file changed, 3 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> >> index 2bddb4fa8a5c..2f0c610e74b9 100644
> >> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> >> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> >> @@ -35,8 +35,6 @@
> >>  #define RKISP1_SP_DEV_NAME	RKISP1_DRIVER_NAME "_selfpath"
> >>  #define RKISP1_MP_DEV_NAME	RKISP1_DRIVER_NAME "_mainpath"
> >>
> >> -#define RKISP1_MIN_BUFFERS_NEEDED 3
> >> -
> >>  enum rkisp1_plane {
> >>  	RKISP1_PLANE_Y	= 0,
> >>  	RKISP1_PLANE_CB	= 1,
> >> @@ -1563,7 +1561,6 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
> >>  	q->ops = &rkisp1_vb2_ops;
> >>  	q->mem_ops = &vb2_dma_contig_memops;
> >>  	q->buf_struct_size = sizeof(struct rkisp1_buffer);
> >> -	q->min_queued_buffers = RKISP1_MIN_BUFFERS_NEEDED;
> >>  	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> >>  	q->lock = &node->vlock;
> >>  	q->dev = cap->rkisp1->dev;

-- 
Regards,

Laurent Pinchart

