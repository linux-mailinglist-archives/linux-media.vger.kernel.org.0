Return-Path: <linux-media+bounces-19531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A2199C072
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 08:55:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50CB01F21DB1
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 06:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A8B145346;
	Mon, 14 Oct 2024 06:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CMO6wETw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD9536B
	for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 06:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728888907; cv=none; b=Ri0J8ejv2n45eHleLEbFS9yNvF0d3R+INgfpeY3fS0WgM5SGk6mHZiVwuGTv+TMelPH64wlVoy3wYzKpUCIriE5Dt5D6iIF/E8NQk6TeYZEvNI4pWfXei+LmRJuImx0zDwyVORj5a54+8iIRGzF06chTecKhzDA0qimxCxO57X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728888907; c=relaxed/simple;
	bh=s8EiQV68LwK5V0F28nOhH3hJCVtwb1CHvQ6YMO4LtLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YkWfQK8Aj8KsdzXJpzpQ2G1JxB1TIOake+6E8tbhCpdtoWEnUNZqv4LyPre4aIjLwC/cXG96FUC+mqc8k7B26RFBFHU4z9RdPbytpkogY+DJXPetS1tnNkDw5btjwmOIeInd57Jlqyy9S3hbK52/KUG/MjkC7TgjErI26zSd1tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CMO6wETw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [5.77.95.224])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 646C78BE;
	Mon, 14 Oct 2024 08:53:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728888803;
	bh=s8EiQV68LwK5V0F28nOhH3hJCVtwb1CHvQ6YMO4LtLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CMO6wETwPHyAf4FcXO9ZgitTlJyOsS84nUjwoCwS/nUnW/Q8Bv65FYyr83O14zPcG
	 xAroqBhW8pm5vpMOEBQU0qPQIR3i+hfS6s+qi/goOaZHopaon+YkAlL4yQCynZ1mJd
	 3+zfmX348Hl+xavN72L3/RJKbRYCmpxsrbgCWZvo=
Date: Mon, 14 Oct 2024 08:55:00 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Naushir Patuck <naush@raspberrypi.com>, 
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>, David Plowman <david.plowman@raspberrypi.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v6 0/4] media: pisp-be: Split jobs creation and scheduling
Message-ID: <vzfp4rjxes3k7cnu532elmcb5yevfylhwx4vgjg7exa6vw5b6u@tvgfntlurtdx>
References: <20240930-pispbe-mainline-split-jobs-handling-v6-v6-0-63d60f9dd10f@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240930-pispbe-mainline-split-jobs-handling-v6-v6-0-63d60f9dd10f@ideasonboard.com>

Hi,
  gentle ping as I wish this to go in for v6.13

On Mon, Sep 30, 2024 at 10:32:56AM GMT, Jacopo Mondi wrote:
> v5->v6:
> - Make the driver depend on PM
>   - Simplify the probe() routine by using pm_runtime_
>   - Remove suspend call from remove()
>
> v4->v5:
> - Use appropriate locking constructs:
>   - spin_lock_irq() for pispbe_prepare_job() called from non irq context
>   - spin_lock_irqsave() for pispbe_schedule() called from irq context
>   - Remove hw_lock from ready_queue accesses in stop_streaming and
>     start_streaming
>   - Fix trivial indentation mistake in 4/4
>
> v3->v4:
> - Expand commit message in 2/4 to explain why removing validation in schedule()
>   is safe
> - Drop ready_lock spinlock
> - Use non _irqsave version of safe_guard(spinlock
> - Support !CONFIG_PM in 4/4 by calling the enable/disable routines directly
>   and adjust pm_runtime usage as suggested by Laurent
>
> v2->v3:
> - Mark pispbe_runtime_resume() as __maybe_unused
> - Add fixes tags where appropriate
>
> v1->v2:
> - Add two patches to address Laurent's comments separately
> - use scoped_guard() when possible
> - Add patch to fix runtime_pm imbalance
>
> Currently the 'pispbe_schedule()' function does two things:
>
> 1) Tries to assemble a job by inspecting all the video node queues
>    to make sure all the required buffers are available
> 2) Submit the job to the hardware
>
> The pispbe_schedule() function is called at:
>
> - video device start_streaming() time
> - video device qbuf() time
> - irq handler
>
> As assembling a job requires inspecting all queues, it is a rather
> time consuming operation which is better not run in IRQ context.
>
> To avoid executing the time consuming job creation in interrupt
> context, split the job creation and job scheduling in two distinct
> operations. When a well-formed job is created, append it to the
> newly introduced 'pispbe->job_queue' where it will be dequeued from
> by the scheduling routine.
>
> At start_streaming() and qbuf() time immediately try to schedule a job
> if one has been created as the irq handler routine is only called when
> a job has completed, and we can't solely rely on it for scheduling new
> jobs.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
> Jacopo Mondi (4):
>       media: pisp_be: Drop reference to non-existing function
>       media: pisp_be: Remove config validation from schedule()
>       media: pisp_be: Split jobs creation and scheduling
>       media: pisp_be: Fix pm_runtime underrun in probe
>
>  drivers/media/platform/raspberrypi/pisp_be/Kconfig |   1 +
>  .../media/platform/raspberrypi/pisp_be/pisp_be.c   | 183 ++++++++++-----------
>  2 files changed, 88 insertions(+), 96 deletions(-)
> ---
> base-commit: 81ee62e8d09ee3c7107d11c8bbfd64073ab601ad
> change-id: 20240930-pispbe-mainline-split-jobs-handling-v6-15dc16e11e3a
>
> Best regards,
> --
> Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>
>

