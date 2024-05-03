Return-Path: <linux-media+bounces-10656-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B268BA5B8
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 05:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 380741F24695
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 03:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31BB51C6A7;
	Fri,  3 May 2024 03:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LmqM2XZE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B714D29E
	for <linux-media@vger.kernel.org>; Fri,  3 May 2024 03:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714706726; cv=none; b=GVGmsrSjMaagmF1wJkUSWRLJUZB/DqipvJUvz9aG2M7u6D8LFCoi7JvBtMepdczDhpBM/ztqj2olOdgHA8Yw/0HqCDhp3SvpvNetSZIwgVBeu0TwamQgpH9T7hjm/taiVm0Fw3Pt2FN5Uiw4WDujCJSDB1qvWlMK82oCijjf4lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714706726; c=relaxed/simple;
	bh=RwvUTSBoElEeB3YGdvKXaVjd7aHzJgqQGkDcIimjPK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fIX+ACHUiBb+I8w9Avl9xYSYydaMN9swOuKoU/uCVT6y1eR+OlOPrURG41NEGeheGfxLS5K3EvEdgQgM/XEgsPmO9G6TqLc+jHUQt0ie+SvQ2cR7Y1nXrvWfZIV4l7KKxnlHUSALDo7sWWQ5401fOAU2M3fMlFpWh5OLxlwbiFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LmqM2XZE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 468F2593;
	Fri,  3 May 2024 05:24:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714706663;
	bh=RwvUTSBoElEeB3YGdvKXaVjd7aHzJgqQGkDcIimjPK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LmqM2XZEyO1A2jLrQdH+ljVIeA5rkWEwRq2L7mKYfDrczUoKmqpmBVDD+MkC94zQ7
	 IZoJccWHxhYCNzkRwLawBpM9IbBkEr6ogmAX9sWAtbYDfYrVGT5dnsWOq1hwJEKGhC
	 nMKsiGVdNHqXfZF1xd/vPV3JOciWPg3FuI0jp354=
Date: Fri, 3 May 2024 06:25:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: Discuss the multi-core media scheduler
Message-ID: <20240503032514.GM4959@pendragon.ideasonboard.com>
References: <3F80AC0D-DCAA-4EDE-BF58-BB1369C7EDCA@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3F80AC0D-DCAA-4EDE-BF58-BB1369C7EDCA@collabora.com>

Hi Daniel,

On Sun, Apr 28, 2024 at 03:26:35PM -0300, Daniel Almeida wrote:
> Hi everyone,
> 
> There seems to be a few unsolved problems in the mem2mem framework, one of
> which is the lack of support for architectures with multiple heterogeneous
> cores. For example, it is currently impossible to describe Mediatek's LAT and
> CORE cores to the framework as two independent units to be scheduled. This means
> that, at all times, one unit is idle while the other one is working.
> 
> I know that this is not the only problem with m2m, but it is where I'd like to
> start the discussion. Feel free to add your own requirements to the thread.

I'll add a comment, which doesn't solve your problem, but is possibly
still relevant.

We have a need to serve multiple clients and schedule them with
memory-to-memory ISPs. Those devices don't use the M2M framework, as
they have more than just one input and one output queue, and need to
handle formats and selection rectangles in addition to controls and
buffer queues. A few out-of-tree drivers currently create multiple
"virtual" device instances to address this need. I don't like this
solution much, as it creates a lot of video devices, and sets an
arbitrary bound to the number of clients.

We're instead considering solving the issue by exposing the ability to
submit a job through the media controller device. Similarly to the M2M
framework, we would use multiple opens with one file handle per client.
This is similar to the request API, but instead of setting per-request
parameters through video devices and subdevs, we would pass them all in
one go through the media controller device.

At this point we don't foresee the need to support multi-core ISPs, but
there's clearly a need for scheduling multiple clients.

> My proposed solution is to add a new iteration of mem2mem, which I have named
> the Multi-core Media Scheduler for the lack of a better term.
> 
> Please note that I will use the terms input/output queues in place of
> output/capture for the sake of readability.
> 
> -------------------------------------------------------------------------------
> 
> The basic idea is to have a core as the basic entity to be scheduled, with its
> own input and output VB2 queues. This default will be identical to what we have
> today in m2m.
> 
>  input        output
> <----- core ----->
> 
> In all cases, this will be the only interface that the framework will expose to
> the outside world. The complexity to handle multiple cores will be hidden from
> callers. This will also allow us to keep the implementation compatible with
> the current mem2mem interfaces, which expose only two queues.
> 
> To support multiple cores, each core can connect to another core to establish a
> data dependency, in which case, they will communicate through a new type of
> queue, here described as "shared".
> 
>  input           shared         output
> <----- core0 -------> core1 ------>
> 
> This arrangement is basically an extension of the mem2mem idea, like so:
> 
> mem2mem2mem2mem
> 
> ...with as many links as there are cores.
> 
> The key idea is that now, cores can be scheduled independently through a call
> to schedule(core_number, work) to indicate that they should start processing
> the work. They can also be marked as idle independently through a
> job_done(core_number) call.
> 
> It will be the driver's responsibility to describe the pipeline to the
> framework, indicating how cores are connected. The driver will also have to
> implement the logic for schedule() and job_done() for a given core.
> 
> Queuing buffers into the framework's input queue will push the work into the
> pipeline. Whenever a job is done, the framework will push the job into the
> queue that is shared with the downstream core and attempt to schedule it. It
> will also attempt to pull a workitem from the upstream queue.
> 
> When the job is processed by the last core in the pipeline, it will be marked
> as done and pushed into the framework's output queue.
> 
> At all times, a buffer should have an owner, and the framework will ensure that
> cores cannot touch buffers belonging to other cores.
> 
> This workflow can be expanded to account for a group of identical cores, here
> denoted as "clusters". In such a case, each core will have its own input and
> output queues:
> 
>  input      output           input      output      output 
> <---- core0 ----->          <---- core1 ---->     ------->
>                                     <---- core2 ---->
>                                     input      output
> 
> Ideally, the framework will dispatch work from the output queue with the most
> amount of items to the input queue with the least amount of items to balance
> the load. This way, clusters and cores can compose to describe complex
> architectures.
> 
> Of course, this is a rough sketch, and there are lots of unexplained minutiae to
> sort out, but I hope that the general idea is enough to get a discussion going.

-- 
Regards,

Laurent Pinchart

