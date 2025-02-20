Return-Path: <linux-media+bounces-26502-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56487A3E0F3
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 17:38:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB859189C225
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 16:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D492120C028;
	Thu, 20 Feb 2025 16:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B/UqhAKm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD301FECBF
	for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 16:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740069311; cv=none; b=dG18x/YjTYeaXfXr3+GvgzsIuiIaz6gkKay7bcIso6+AkT+Ra/2U2TGaKIa/OZufWNaeVeF368D0NiGoP7drc1wSDkDd0p4mP0tHfP/8LmrBC7l4fFK8zIP+UpfS8mYsY7F7QfXFcfw4/m0GDsHuOrD83P+qzLYsIpLkQmgDwJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740069311; c=relaxed/simple;
	bh=zYvZFtJYuH7jTAvD2LyhcQ+co++hJOau6r0M1ch8Q08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPhTNaH3KzbWbvYuxZ9jo35YSsFsRntgNGN12NbpvgGSzehRSKi0w07L7l2WuvBOcdV7JiUvowx8zUGABzWTaKq4ExdOj6+MFt3Mr5GsgVkRHlVSbs1+MR2P6IuGY+1e/U1D/e6rC4oQGDf5Ai2uls7jxsLKAKomFGujnd10X4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B/UqhAKm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 638AE74C;
	Thu, 20 Feb 2025 17:33:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740069218;
	bh=zYvZFtJYuH7jTAvD2LyhcQ+co++hJOau6r0M1ch8Q08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B/UqhAKmvfhxwvp95BRvU1owLQ3VVZA0zxdPG/dzpbs0vBrVKI7PqGN5wZxbt3Akp
	 idyPF2Lmz2diXiQP0P7D95XbKRV0w/0Sm0OFqFZwuGPL+741xAa1omWAm43qeiueYa
	 HO+6NHb3oB7DhgRXlFA0wdOJN5aYSqAd3eLHiZOI=
Date: Thu, 20 Feb 2025 18:34:46 +0200
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
Message-ID: <20250220163446.GH20111@pendragon.ideasonboard.com>
References: <20241029082117.55385-1-jacopo.mondi@ideasonboard.com>
 <tpdzxkug5gtive7h4tvl6jn5r7ybb3dby7ajfuwmzigphhlkin@geirq67p6dww>
 <67af5601-922b-4683-9e5f-ccf4fd757dbb@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <67af5601-922b-4683-9e5f-ccf4fd757dbb@xs4all.nl>

On Thu, Feb 20, 2025 at 04:39:59PM +0100, Hans Verkuil wrote:
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
> 
> Did you mark your v2 as Superseded in patchwork when you posted the v3?
> I marked your v1 and v2 as Superseded today when I was cleaning up patchwork,
> so I know you didn't :-)
> 
> When I post a new version I always mark the old one as Superseded, exactly
> to prevent such things from happening.

That won't be possible in all cases, not all patch submitters have
patchwork accounts.

In libcamera we use a patchwork bot to automatically mark series as
superseded. It doesn't do a perfect job, but it considerably reduces the
maintenance work. Could we do the same ?

> Also, more people should help keep patchwork clean. I think I am usually the
> person who is doing this, but this is a collective responsibility.
> 
> Part of the job description for someone with commit rights is actually to
> keep patchwork clean.

I think that requiring committers to update the patchwork state of
patches they merge is fine, the additional work is offset by the ability
to commit patches directly.

I don't think it would have helped in the case of patches submitted by
non-committers. Even if I had merged this change myself, I missed
Jacopo's v3 on the list, and I would have probably equally missed it in
patchwork without v2 being marked as superseded.

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
> > 
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

