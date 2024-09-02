Return-Path: <linux-media+bounces-17342-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB537968622
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 13:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69AA4284504
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 11:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF68185938;
	Mon,  2 Sep 2024 11:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tLSP3rbf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002D313B58D
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 11:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725276262; cv=none; b=eGXw1MtVmOe7GRjFCxZfJW6Ai0T5wkVwSwEp2AoIC/aVWb8eIUFQgqNC29R0p8816WWihdb7HySqB2zhyTS2vx6v8GLCAN2XJaCrt+Yz0OF+2jSaf+D1Tt9dk7cQA8yLeVkokOX7wEZhFBUOD3zjAZoExZENUhkaaN+pOEEn0KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725276262; c=relaxed/simple;
	bh=XmSZ4CQG7NsLD/pverK/n34l/wuVLJbeKK7sDjI/XVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nQgUfX3uduqdvKTy27KqehHdVCuXc2UWhiaObw+8Pcj8HG5Cl38qmijKHSP1ykhe86jy+ibQQeez5kQJs+Ci/DYDeaCjyInFkTqzE4adV3hGimJaJ1jOGJOzbNQBrmY41BO1b6VI3NsFyRtJMwILwIzUp7bofXpkU1fUO3aZ14A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tLSP3rbf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-54-22.net.vodafone.it [5.90.54.22])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4429720;
	Mon,  2 Sep 2024 13:23:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725276188;
	bh=XmSZ4CQG7NsLD/pverK/n34l/wuVLJbeKK7sDjI/XVQ=;
	h=From:To:Cc:Subject:Date:From;
	b=tLSP3rbfmgvUOphafaGneAVNR0Hpnb+0l0pw9BNLfs0Z8FsBwhPHWRnCYyS20OmQl
	 QjgcFVu7q5Kjiu6qf1f4IPkEMmZQcHydw6HzS+9Jh+uekXugXvbjske2AvxoS//nl4
	 cJe4zK6FDJ17K0uicLqq2qib5bWDDy/Vi0eLUmNU=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v4 0/4] media: pisp-be: Split jobs creation and scheduling
Date: Mon,  2 Sep 2024 13:24:02 +0200
Message-ID: <20240902112408.493201-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
  media: pisp-be: Split jobs creation and scheduling
  media: pisp_be: Fix pm_runtime underrun in probe

 .../platform/raspberrypi/pisp_be/pisp_be.c    | 190 +++++++++---------
 1 file changed, 93 insertions(+), 97 deletions(-)

--
2.45.2


