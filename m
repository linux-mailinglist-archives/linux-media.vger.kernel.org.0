Return-Path: <linux-media+bounces-34217-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22602AD005E
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 12:29:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A7E93B12D0
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 10:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3530A2874FC;
	Fri,  6 Jun 2025 10:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vY5ufT6Y"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BCE286D48;
	Fri,  6 Jun 2025 10:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749205774; cv=none; b=Ygct07elApVtFQgjlLljN1Uq5/6p6aal4gl6MmSpYn0+yX1bmy7SuHbL9u114s8J+2e9HAJGNkj8FGRiN99wLN+zPHZ4W0JsPjb3DhtvBtiasHcA/e08RJAtuu4yT3AbIcIWfZntnQdXPuEeFeX91wRJjFs/O/Y6cDf4J62WS9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749205774; c=relaxed/simple;
	bh=txbxer0KAPdPC189YbZbWLopsJnSLNb/anti8PSwHIM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HHkJDnoaYLSfy6aGsBegyY7jr2WTAr/qhngHlkaNRNs5Gm4hWREdZCprvpYTaOrGea+Ks2mgUxVqV4I1mgNytVDQUbKiWRdH5hz70A5l8RvkU9NvV9JAT8HdK0kLmpx5BkCHBb0hWAVHWawsikWtyC4mh45PrsyCdf+oxVHRL6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vY5ufT6Y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92ECB11DD;
	Fri,  6 Jun 2025 12:29:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749205766;
	bh=txbxer0KAPdPC189YbZbWLopsJnSLNb/anti8PSwHIM=;
	h=From:Subject:Date:To:Cc:From;
	b=vY5ufT6YH5BJ6+pQUGtxa6/DA4Tfymt4RXZJ0AiPdAoJZRZwjsxpsK3xpFASk1rrG
	 MLYLifH1qAqT6blZ8hDkzZPYPH/Wt1AFZmugkmhPtZ3mGksLeGPDaztoo3n34qUR1+
	 gg1fj/+AmO1/PxzDCvOxiagjJikOuqtckwItaADw=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v7 0/4] media: pisp-be: Split jobs creation and scheduling
Date: Fri, 06 Jun 2025 12:29:20 +0200
Message-Id: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-0-46169f0622b7@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAADDQmgC/5WNQQqDMBBFryJZd0qibYpd9R7FRXRGnaJJyIi0i
 Hdv6g0Kf/M+n/82JZSYRN2LTSVaWTj4DLdTobrR+YGAMbMqdXnRdaUhssSWYHbsJ/YEEide4BV
 agbzH3A2wWjBX7IwlY6hyKp/FRD2/D9GzyTyyLCF9Du9qf+3fihwNtkKr+xrR6P7BSE6Cb4NLe
 O7CrJp937+VDhfn4wAAAA==
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
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3076;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=txbxer0KAPdPC189YbZbWLopsJnSLNb/anti8PSwHIM=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoQsMIO75DdqfQ/t8A6NKKf9eAFUOd+N9w6nemF
 8qPNi9sQJuJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaELDCAAKCRByNAaPFqFW
 PBGID/0Ut910UF1VVZnqZg7XfAARRO10t1TXpcUMY9GBM+jh+2JRp6sYkAC7IhQRlb70AENym/Q
 wekFzbnB92U5VLc7PL8oD/hHOkIWiXt5nARfjf4MYHFfZ+hA59lDu/U2E3bT0c43GTyVwDWdamD
 3uFZKvhpp3iTwbH0CjCnTAesJZms9O/buNaXiuVOew3bWW6t8s255iXY8I4mlGXjoSD+1J9cEsj
 5ZExVW/edUKPHRnUnpLFyCFe2Q+ybisjmjClCUq0F+5LkXjB0kxT+1eoJopcC+VnX4O15izPdpF
 xrBWgyuoQnyK0bQfCt7c/QT3o5arCVdEl9SYRapPYsusKqNwoJtWRSFjybnjPNKTTOTEd77dU2W
 qpJB1qB500vzbTdc/tmwBlSU5LIkdgI2u6dDsSzGGOBAy/dC1R7nQsfrRFO9a/rnXzeN+IQWiar
 xH47zSFqsUC4Wx32ATkGUXybko/dhBVdS9W2D0i3lyjc539EDJFW9Vj9yK0da4o7uJ5Q7gU5Xn2
 U9pcqfiIRBNm6TAY4JlRN5QUKCKooJbGKkKyUs9G0AdJFuuWu4U2Mdg9LtaHLwxdgkta5DDcWj0
 hhdpVJXNXX0+8I+OqRtrztwIJOikHyiqq8vG8SKBzbyw35PiJme8zSVTxXNFSmzywaD8z02x/8u
 2xXElPRfUFiRAMQ==
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
 .../media/platform/raspberrypi/pisp_be/pisp_be.c   | 187 ++++++++++-----------
 2 files changed, 90 insertions(+), 98 deletions(-)
---
base-commit: 5e1ff2314797bf53636468a97719a8222deca9ae
change-id: 20240930-pispbe-mainline-split-jobs-handling-v6-15dc16e11e3a

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


