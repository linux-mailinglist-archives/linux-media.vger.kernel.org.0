Return-Path: <linux-media+bounces-16871-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4206960369
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 09:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80A661F23892
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 07:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D35B0156F4C;
	Tue, 27 Aug 2024 07:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lon5Wo+i"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593FC1553B7
	for <linux-media@vger.kernel.org>; Tue, 27 Aug 2024 07:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724744436; cv=none; b=F8MI6JcK3xQoCiQh8IHZ3ajSWu/eTn2Gjy9nE+q9AJolvOqo/NzrD6hNIzmnRgB2Dc3OZBYZ9thWADiiO76gvbOCetRPJoYbc9eNpSwIxPrTtWvCG2PoqDl6zP5myZMBZjf4P30HmUf/N5wBUr82M8jWRFN4DiuKE9GDW7hkshY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724744436; c=relaxed/simple;
	bh=TptycIWSdUtfe1qYo6cf70fh5CqdC7AMLPFzeXqycZw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BVuZP1FwbjpabUWPoPlz3doN5Lc+lPgNUglsyeXEWQydYVz1V84tXi44d1q9uZjDP9OlGHc5KKuVv1hZRTLqnReBP4Biyij9aHv5LnxJFBsZpjUylKDn1Rdx6bhlMZaFHXWzD6pUSYqf3zNIZ0PnKf+HtWcpr+/boiZJkCwo/DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lon5Wo+i; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-141-165.net.vodafone.it [5.90.141.165])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5DC959FF;
	Tue, 27 Aug 2024 09:39:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724744360;
	bh=TptycIWSdUtfe1qYo6cf70fh5CqdC7AMLPFzeXqycZw=;
	h=From:To:Cc:Subject:Date:From;
	b=lon5Wo+iKoqRqG8SBrjwB1qvdXnAmtvDa18N1Ag6TQdtscY9vNm2as8wpylTtujVL
	 ZnBdLjMtHP7o+kGepPe+l1j70sVTwblLL9Vj6MmUWEpXjxxeQkGkw6RG1r2mbDIogv
	 zg6vlM7dOlTJ38mlIL+TfPd0we0C1lujYprPyYdQ=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 0/4] media: pisp-be: Split jobs creation and scheduling
Date: Tue, 27 Aug 2024 09:40:14 +0200
Message-ID: <20240827074018.534354-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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


Jacopo Mondi (4):
  media: pisp_be: Drop reference to non-existing function
  media: pisp_be: Remove config validation from schedule()
  media: pisp-be: Split jobs creation and scheduling
  media: pisp_be: Fix pm_runtime underrun in probe

 .../platform/raspberrypi/pisp_be/pisp_be.c    | 171 ++++++++++--------
 1 file changed, 93 insertions(+), 78 deletions(-)

--
2.45.2


