Return-Path: <linux-media+bounces-18770-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D767989CD5
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 10:33:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 509201C21952
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 08:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B1517AE1C;
	Mon, 30 Sep 2024 08:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YuIuN1jy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EDF11CA9
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 08:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727685204; cv=none; b=dxTszMnRQU/UVBM7iW+vcKn3hk4jxod2k9PcH4sucQem2NJP2azsIEf2wW8KdC3wRqQf1Z56efZacIcvDBBXmjWaL5VkAx5UPfLefXKh3XzqDYVCAPuubuK0NrRtGSWtyw/EI0uIW2Rr/iyLzljvN5As4gOFQIMyszLpYbOTepk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727685204; c=relaxed/simple;
	bh=88Xp6ZeRTqplgAVR2xCmkqnxt9M2uHr9gEXHiThXKl8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HgZDBTKOrznWjXPOZjoMR7FBc5SJDnrQWvE0XfebbRpbCdNpYpKtYEZFUTlyo5XNSosvhvxZS6rsjINGcq1mELlc66y8k6HfQyhdCj4Nx2ZFrs8z1XcvbyuspJNmRcWXG1XF9zktBfNOG7n7Ta7ZtkT5vpjVqBj04tYlaQ0AKfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YuIuN1jy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from fedora.local (unknown [95.131.45.214])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63E4439F;
	Mon, 30 Sep 2024 10:31:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727685110;
	bh=88Xp6ZeRTqplgAVR2xCmkqnxt9M2uHr9gEXHiThXKl8=;
	h=From:Subject:Date:To:Cc:From;
	b=YuIuN1jygv2FWWAT5yQkfKrXNvVDbXzkwZnWdFdnG9OhfmRlrYTHx9a8+mRW5HzZJ
	 9+qhMLjpNIOa5P4F6PDYvwrL78zzdA9yvGM9Kxm8e/w7O1xBAA8/U9UxSA3n9Rmajq
	 hOGOpw5TbI2H26THafFtoKyGzsCABWX4qgXrfSNA=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v6 0/4] media: pisp-be: Split jobs creation and scheduling
Date: Mon, 30 Sep 2024 10:32:56 +0200
Message-Id: <20240930-pispbe-mainline-split-jobs-handling-v6-v6-0-63d60f9dd10f@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADhi+mYC/x2N0QqDMBAEf0XuuQeJ1kD7K6UP0az2io0hJ1IQ/
 71HH2cZdg5SVIHSvTmoYheVNRuES0PjK+YZLMmYWtde3a1zXETLAP5EyYtksJZFNn6vg7L5yba
 Z98C+T6MP8B5dJDsrFZN8/6HH8zx/eI7lb3gAAAA=
X-Change-ID: 20240930-pispbe-mainline-split-jobs-handling-v6-15dc16e11e3a
To: Naushir Patuck <naush@raspberrypi.com>, 
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2762;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=88Xp6ZeRTqplgAVR2xCmkqnxt9M2uHr9gEXHiThXKl8=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBm+mJP+GNDOLdU+0TUKpBDU3wC7rVN4STgSh/99
 hglrjyAkyKJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZvpiTwAKCRByNAaPFqFW
 PJlNEAClXDOXmA+XNLXXXzPllxLT0n7dbPtRzIeap5nyR1xq8IZlfldbpcpWRibMLsxxEfRsj7g
 A+zbSob90LSJjW+Mn0uc1tatz+9Ks8FW3WKHlh7BJoips6rwhZ3IPrPCKZJbzexPk+GahIN+42P
 fubALe8oE8X06eQVfUbJjSBzdILLfuXN7sUOSQ9HzmteHuJdIWxeK+xc/hmRFnV/FR1o/PcRR5c
 xDSQU5rP3F2vnqEvbf4Ccf0EiTQ27+ohJclAX8vNh4lxttHGtTfthFvKw+x7msSJdWmbUZuWxsN
 7pVELpBO2nNHgvhxSc34eFc5FJZ7Eiq23PZXD/bVxX7y25FKhWAYfJxPXLEfhoruYJNlUeZqp36
 2eoyBtRwaU3JL0RmIIC39sPqn/k1hJj6ogZpjFaflWFST6LDLI1YteU+4YgUDUbTncqPbkvqT5Q
 HI6zRe+3Uev7np683geYMEmWv+2WfT5+EoH2A62D+RR8Q6Vvxt2lCnTLlpCuRI4w2NPNxJijZvv
 fzrdUIfEG8eFIttuQVTbk8S9kxM+vgmEgMjdNpn2QdsIigIZ51YlABZbWbapIXtTvkFnmi7oI2/
 wgz+QFNFsrLhjzhrJlfDQP3VLbV34bK5mccJJwRcfunLOwIKD7f6xFDmWirAoqJfV06yHTtaTox
 feh4/DISmu88/OQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

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
Jacopo Mondi (4):
      media: pisp_be: Drop reference to non-existing function
      media: pisp_be: Remove config validation from schedule()
      media: pisp_be: Split jobs creation and scheduling
      media: pisp_be: Fix pm_runtime underrun in probe

 drivers/media/platform/raspberrypi/pisp_be/Kconfig |   1 +
 .../media/platform/raspberrypi/pisp_be/pisp_be.c   | 183 ++++++++++-----------
 2 files changed, 88 insertions(+), 96 deletions(-)
---
base-commit: 81ee62e8d09ee3c7107d11c8bbfd64073ab601ad
change-id: 20240930-pispbe-mainline-split-jobs-handling-v6-15dc16e11e3a

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


