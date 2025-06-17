Return-Path: <linux-media+bounces-35083-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5981BADCE51
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 15:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EACEB174715
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 13:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C71E2DE213;
	Tue, 17 Jun 2025 13:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WAvECyDL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D391A5B94;
	Tue, 17 Jun 2025 13:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750168458; cv=none; b=Z9jXF5oQLLDZfT5STHRYl4boSlcQbzO9q2Tyd9n008iV13TQyMcdn81Xzu+9LB+nTkUumA0yS2quH/qjUUEAprseCBNdmM505w+xFxT4qz/2ElxckJU3YcKHEX7NvBu+SoZXL0yw7oIyjQRYuiRkJyu6k2lmR1a79hDqUgaWKdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750168458; c=relaxed/simple;
	bh=B/wEmXo11hHDhNREcS4lqaU0yYVoIybs/I7Ns51Y4+M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H28AD5XiC7z1BSm5bZiefkezDhz3OUzixIqwVVjPhmsbiF7fnEzBhh2rFcwVIyHD4XICom+sU6Hn/aJwWxlizLhac5/21yQyXLYZPgZ3We2yjgd70PXeD7XjFrcHEZxgYF/uqqNc2sdrjqa9mlx188Ws4GDNAptNUMW+f80Kc1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WAvECyDL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2D04496;
	Tue, 17 Jun 2025 15:54:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750168441;
	bh=B/wEmXo11hHDhNREcS4lqaU0yYVoIybs/I7Ns51Y4+M=;
	h=From:Subject:Date:To:Cc:From;
	b=WAvECyDLej6YB7Nr4p0QgtBBRxa3K6a8PYUVHYK/w4XRp1nCFS/leQE1oLMfmx7C6
	 2NO9fCZzZr7jwPg8zwxLcxIuURp3EqejLFM13KY4G9S8qJFSk3PrcOdqK8dxXVXKUt
	 k4yyR3dZev9TEUzCY+wY29ho8BujKibPRu3wVnyQ=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v8 0/4] media: pisp-be: Split jobs creation and scheduling
Date: Tue, 17 Jun 2025 15:53:58 +0200
Message-Id: <20250617-pispbe-mainline-split-jobs-handling-v6-v8-0-e58ae199c17d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHZzUWgC/5WQS27DMAxEr2JoHQaSHNNxVr1H0YU+dMIillzJN
 VoEuXuZBNl10QLcDD9vMLyoSoWpqkNzUYVWrpyTiP2mUeHk0pGAo2hltd3podUwc509weQ4nTk
 R1PnMC7xnX0H2o/SOsCKYLgaDZAy1TglsLjTy193o9U30ieuSy/fdd8Vb998WUhqwjajHIUajx
 xeO5GpOPrsStyFP6ua09k96p1Hjn+m90HdocBg1Wuv7X+jXR7BCH5/yuOWRTnlXCWQ+8XJoAnX
 BBRy8pSgH1x9xanC/cQEAAA==
X-Change-ID: 20240930-pispbe-mainline-split-jobs-handling-v6-15dc16e11e3a
To: Naushir Patuck <naush@raspberrypi.com>, 
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3441;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=B/wEmXo11hHDhNREcS4lqaU0yYVoIybs/I7Ns51Y4+M=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoUXOEd2UE0FPDI8aSMq8syacdaXOZA70wDaGAV
 xPcb1e5pGiJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaFFzhAAKCRByNAaPFqFW
 PGOPEACz4XPp+Za3n5vtxK5vkPtlAdFtUwLUul0BsIZH27YgM3HPfWmSdZP+IV4I1E3jjAQbN32
 PjhHVIOwwCG9KhYi0PZ2STEeBWaWP7yEKHityfcT34cQ0+QWGUOpNB2H43OfGzPiuhScURQvmlB
 ZV9u5wLo4zaNw38NGol/0wOfS9+X0f26GmPn55GRcEHDlXlYZuXsBynV0kuOAR4D/FUXyhCOiX3
 6sWogEtan7vlxobx4CBJhjNMcpaaSwt3BeGdW9lOiftRNh1gv0ZeTNhnV+2u28pke24EM60YQPc
 ONYI0YI0n5cy+8SAtyXV3LR40eWiEitrif8KMGMVVQF9CcYx1wJApZvM0eVrnVPbXY1quE3LKa5
 meI1xRralp1R+vBwieOmg2JoxTrpUpwTv2fWJsCC1eBI+ijDAKl/YWC8BidowXZySMEEyMzTx/A
 HBzwSKiCos+RSHm6wJFNevD+YSQZLVr+/JZzaUJUnkInJZh7+DPipKdRx7aPOKeR3WbAYlKJCmp
 nHxcuOa0rpgZpgoxe/1sAD58XxH54HlOH1/ncTkLuW2qcEVDHJ/rRkURnAW+GTnUwg7YIgPstPf
 kq4LFduraVORkh/wvsHvGWsnX2hqCOBm9c1+OjqL2YSsBPOW3ipOAM9pEBOfakfnECTO3hGMhE2
 A2BrsvE5ltBuMKw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

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

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Changes in v8:
- Use automatic release of *job in pispbe_prepare_job()
- Use temporary list to release jobs without holding the main driver
  lock
- Collect tags
- Rebased on rpi-6.6.y: https://github.com/raspberrypi/linux/pull/6905
- Link to v7: https://lore.kernel.org/r/20250606-pispbe-mainline-split-jobs-handling-v6-v7-0-46169f0622b7@ideasonboard.com

Changes in v7:
- Rebased on media-committers/next
- Fix lockdep warning by using the proper spinlock_irq() primitive in
  pispbe_prepare_job() which can race with the IRQ handler
- Link to v6: https://lore.kernel.org/r/20240930-pispbe-mainline-split-jobs-handling-v6-v6-0-63d60f9dd10f@ideasonboard.com

v5->v6:
- Make the driver depend on PM
  - Simplify the probe() routine by using pm_runtime_
  - Remove suspend call from remove()

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

---
Jacopo Mondi (4):
      media: pisp_be: Drop reference to non-existing function
      media: pisp_be: Remove config validation from schedule()
      media: pisp_be: Split jobs creation and scheduling
      media: pisp_be: Fix pm_runtime underrun in probe

 drivers/media/platform/raspberrypi/pisp_be/Kconfig |   1 +
 .../media/platform/raspberrypi/pisp_be/pisp_be.c   | 196 ++++++++++-----------
 2 files changed, 98 insertions(+), 99 deletions(-)
---
base-commit: ce5cac69b2edac3e3246fee03e8f4c2a1075238b
change-id: 20240930-pispbe-mainline-split-jobs-handling-v6-15dc16e11e3a

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


