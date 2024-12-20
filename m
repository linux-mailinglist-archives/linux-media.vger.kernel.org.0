Return-Path: <linux-media+bounces-23854-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8E79F901A
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 11:20:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 732DD1614C1
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 10:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34451BFDEC;
	Fri, 20 Dec 2024 10:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ihsJCp/Z"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE7D1A8402
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 10:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734690034; cv=none; b=tc1KuGZw4m4uuc5xEEGWIsTx0XLBSgSaiuvHepWV+DkQXU5B6QnLfE2DEdfoLZmxCiioucA9PrhGAZRf4MG4tFXHU2GiGfEEC/k3a05vQnRlRdFvGapgqOAuDK3qwYP5AE+K1r4un/bhN6o8fb7BUsrOZCYxo9rK4WXJ0HBfNQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734690034; c=relaxed/simple;
	bh=wHktl834fyhrs5AfmVJXxsgy7g+Q/au1W9Q/A1dKsu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=choLWp2b1dqRepKqe50uGDZq7QxLtV/JQ2shgcdZvOTuo+Eg6CjNf+SmpN9z9JVWL8CYxZM4HhVQ3LIVvvBoqBnBq0Jtftb/Ie/4051bvct6cOIV1mdfGhKJiXoXeSLMtXNmhdLS8GveMF2pWLtkS0Kmm5Fk5AYyexM1PM506Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ihsJCp/Z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E8247E2;
	Fri, 20 Dec 2024 11:19:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734689990;
	bh=wHktl834fyhrs5AfmVJXxsgy7g+Q/au1W9Q/A1dKsu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ihsJCp/ZgD1J1GL0hl6H8+NUY+3ZuA9IaU/AUSwxyw4L2qm8S0PuO91X3QdeobQ7a
	 hSag81X5skFWVaSwA93BA+3zAtMgr0OukkVvFaoLhobDKoDiunpSDOG31EoGJaP2rn
	 kQpVV2Yed+XCiixliK26t2ObcuSkAAjzwjgzolzU=
Date: Fri, 20 Dec 2024 11:20:26 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Naushir Patuck <naush@raspberrypi.com>, 
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>, David Plowman <david.plowman@raspberrypi.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v6 0/4] media: pisp-be: Split jobs creation and scheduling
Message-ID: <ltrgoziuxkks7vscyoinkkx7gm4rv6qipd3nukickldu7oxwdc@4w36h2oeogd7>
References: <20240930-pispbe-mainline-split-jobs-handling-v6-v6-0-63d60f9dd10f@ideasonboard.com>
 <vzfp4rjxes3k7cnu532elmcb5yevfylhwx4vgjg7exa6vw5b6u@tvgfntlurtdx>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <vzfp4rjxes3k7cnu532elmcb5yevfylhwx4vgjg7exa6vw5b6u@tvgfntlurtdx>

Hi

On Mon, Oct 14, 2024 at 08:55:00AM +0200, Jacopo Mondi wrote:
> Hi,
>   gentle ping as I wish this to go in for v6.13

    gentle ping as I wish this to go in for v6.14

>
> On Mon, Sep 30, 2024 at 10:32:56AM GMT, Jacopo Mondi wrote:
> > v5->v6:
> > - Make the driver depend on PM
> >   - Simplify the probe() routine by using pm_runtime_
> >   - Remove suspend call from remove()
> >
> > v4->v5:
> > - Use appropriate locking constructs:
> >   - spin_lock_irq() for pispbe_prepare_job() called from non irq context
> >   - spin_lock_irqsave() for pispbe_schedule() called from irq context
> >   - Remove hw_lock from ready_queue accesses in stop_streaming and
> >     start_streaming
> >   - Fix trivial indentation mistake in 4/4
> >
> > v3->v4:
> > - Expand commit message in 2/4 to explain why removing validation in schedule()
> >   is safe
> > - Drop ready_lock spinlock
> > - Use non _irqsave version of safe_guard(spinlock
> > - Support !CONFIG_PM in 4/4 by calling the enable/disable routines directly
> >   and adjust pm_runtime usage as suggested by Laurent
> >
> > v2->v3:
> > - Mark pispbe_runtime_resume() as __maybe_unused
> > - Add fixes tags where appropriate
> >
> > v1->v2:
> > - Add two patches to address Laurent's comments separately
> > - use scoped_guard() when possible
> > - Add patch to fix runtime_pm imbalance
> >
> > Currently the 'pispbe_schedule()' function does two things:
> >
> > 1) Tries to assemble a job by inspecting all the video node queues
> >    to make sure all the required buffers are available
> > 2) Submit the job to the hardware
> >
> > The pispbe_schedule() function is called at:
> >
> > - video device start_streaming() time
> > - video device qbuf() time
> > - irq handler
> >
> > As assembling a job requires inspecting all queues, it is a rather
> > time consuming operation which is better not run in IRQ context.
> >
> > To avoid executing the time consuming job creation in interrupt
> > context, split the job creation and job scheduling in two distinct
> > operations. When a well-formed job is created, append it to the
> > newly introduced 'pispbe->job_queue' where it will be dequeued from
> > by the scheduling routine.
> >
> > At start_streaming() and qbuf() time immediately try to schedule a job
> > if one has been created as the irq handler routine is only called when
> > a job has completed, and we can't solely rely on it for scheduling new
> > jobs.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> > Jacopo Mondi (4):
> >       media: pisp_be: Drop reference to non-existing function
> >       media: pisp_be: Remove config validation from schedule()
> >       media: pisp_be: Split jobs creation and scheduling
> >       media: pisp_be: Fix pm_runtime underrun in probe
> >
> >  drivers/media/platform/raspberrypi/pisp_be/Kconfig |   1 +
> >  .../media/platform/raspberrypi/pisp_be/pisp_be.c   | 183 ++++++++++-----------
> >  2 files changed, 88 insertions(+), 96 deletions(-)
> > ---
> > base-commit: 81ee62e8d09ee3c7107d11c8bbfd64073ab601ad
> > change-id: 20240930-pispbe-mainline-split-jobs-handling-v6-15dc16e11e3a
> >
> > Best regards,
> > --
> > Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >
> >
>

