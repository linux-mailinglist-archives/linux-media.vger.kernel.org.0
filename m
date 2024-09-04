Return-Path: <linux-media+bounces-17549-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3552796B792
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 11:59:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2330B23133
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 09:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076CA1CEEBC;
	Wed,  4 Sep 2024 09:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jY+qpoQc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8DE1CEEA2
	for <linux-media@vger.kernel.org>; Wed,  4 Sep 2024 09:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725443937; cv=none; b=swf/Gi4rf29lA5xIhx/vC4JGYSfn0oZOZeRmqN35EueDZX4kSqr5VNhhD4PMXnwXaniJzaMFgBwgPaMdElPV7fhdSi7ZBmj2wvP8KprJYXeBS0ehfxr1g4M12QkHvLEo0UqmjnIr3ewHlddLBHAcC+gfVaBxBOx+fFHCrarK9ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725443937; c=relaxed/simple;
	bh=FJ2Fo9DL1043gErlcSskU8TfqjfFGx+kZXzxQbfqQbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KZ1dYLrJ1ttyB0vp247N2fwJEp9Y4GAiz7pmetcvyvX4+WwgxTVJf8K0BBnei+Me+sIFv+lR/dtDssiF1liGtf/Q+2n3rt/7h0fg7AU84fdWAhLRBGwUX9HLkCHx7juj5/wd51rdPGK3QOxMHZqEMCiga5OmCuRscImUTUPuD2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jY+qpoQc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 715772E3;
	Wed,  4 Sep 2024 11:57:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725443861;
	bh=FJ2Fo9DL1043gErlcSskU8TfqjfFGx+kZXzxQbfqQbI=;
	h=From:To:Cc:Subject:Date:From;
	b=jY+qpoQcGzBlHCxASWQpy5A8racF378F3MuiNFMHyVlLEPWdd9/QA/HwVk1iaSdZK
	 BCi59wFe8NgsI/yKoPBtq0q3erxo2Yud5N38WuRgU+5/mYOobD61/IL4BkgwFlL6QT
	 P7JEfPEzkWEvMpVs5Df6tEEuOX+S1qwW3epY7nJA=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v5 0/4] media: pisp-be: Split jobs creation and scheduling
Date: Wed,  4 Sep 2024 11:58:31 +0200
Message-ID: <20240904095836.344833-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4->v5:
- Use appropriate locking constructs:
  - spin_lock_irq() for pispbe_prepare_job() called from non irq context
  - spin_lock_irqsave() for pispbe_schedule() called from irq context
  - Remove hw_lock from ready_queue accesses in stop_streaming and
    start_streaming
  - Fix trivial indentation mistake in 4/4

v3->v4:
- Expand commit message in 2/4 to explain why removing validation in schedule()
  is safe
- Drop ready_lock spinlock
- Use non _irqsave version of safe_guard(spinlock
- Support !CONFIG_PM in 4/4 by calling the enable/disable routines directly
  and adjust pm_runtime usage as suggested by Laurent

v2->v3:
- Mark pispbe_runtime_resume() as __maybe_unused
- Add fixes tags where appropriate

v1->v2:
- Add two patches to address Laurent's comments separately
- use scoped_guard() when possible
- Add patch to fix runtime_pm imbalance

Currently the 'pispbe_schedule()' function does two things:

1) Tries to assemble a job by inspecting all the video node queues
   to make sure all the required buffers are available
2) Submit the job to the hardware

The pispbe_schedule() function is called at:

- video device start_streaming() time
- video device qbuf() time
- irq handler

As assembling a job requires inspecting all queues, it is a rather
time consuming operation which is better not run in IRQ context.

To avoid executing the time consuming job creation in interrupt
context, split the job creation and job scheduling in two distinct
operations. When a well-formed job is created, append it to the
newly introduced 'pispbe->job_queue' where it will be dequeued from
by the scheduling routine.

At start_streaming() and qbuf() time immediately try to schedule a job
if one has been created as the irq handler routine is only called when
a job has completed, and we can't solely rely on it for scheduling new
jobs.

Jacopo Mondi (4):
  media: pisp_be: Drop reference to non-existing function
  media: pisp_be: Remove config validation from schedule()
  media: pisp_be: Split jobs creation and scheduling
  media: pisp_be: Fix pm_runtime underrun in probe

 .../platform/raspberrypi/pisp_be/pisp_be.c    | 202 +++++++++---------
 1 file changed, 96 insertions(+), 106 deletions(-)

--
2.46.0


