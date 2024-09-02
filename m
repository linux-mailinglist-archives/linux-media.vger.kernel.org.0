Return-Path: <linux-media+bounces-17359-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BFD968961
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 16:05:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4B541F2275B
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 14:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43CB020FAAF;
	Mon,  2 Sep 2024 14:04:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4211201243
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 14:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725285898; cv=none; b=DQWgsjtkyvGJVB85vYpCzcx9XYW/uG7qrVPn/L0JMFuVQRmpS2KwiN4p8oV1QleN/MGecmfsLnoRaD5UlZsrUoM1LT/YYUctKaUGCJeM+6nj0kswZXDKfKiRQcjiA+NqFCVRDCClb8eFh1odCraPT9LB0+4Fev5+suWgbAfz9E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725285898; c=relaxed/simple;
	bh=XGPgfbKsT7IznRyLXUdzXXUETuBBH1ynLiAlO079i6g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TP229nVbgNm+/1C5juJ/ACPwm/pDHjr07DAN1Z9GJlpNY8cfgzFa7zUeRnqxLZtVHptrkOUPx8wvfBJTQcUnY+iH+V/N1z8u2l8jd8BidwRTFWJsfiazMrLMldok1A2YkBQPq7Qh2YRhmO7rdTMHdkZKs/xAI+Hhsp8DlyWf9JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36526C4CEC2;
	Mon,  2 Sep 2024 14:04:57 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Matt Ranostay <matt@ranostay.sg>
Subject: [PATCH 0/9] media: vb2: prepare for vb2_ops_wait_prepare/finish removal
Date: Mon,  2 Sep 2024 16:04:46 +0200
Message-Id: <cover.1725285495.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series sits on top of:
https://patchwork.linuxtv.org/project/linux-media/list/?series=13513

This series makes it possible for drivers to drop the wait_prepare/finish
callbacks if the queue lock pointer is set.

Analyzing the code shows that in a few places the lock is set after the
call to vb2_queue_init, so the first 7 patches move that lock assignment
up.

Then two additional WARN_ONs are added to vb2_queue_init to ensure that
either q->lock is set, or wait_prepare/finish are set.

The last patch will just unlock/lock the queue lock if wait_prepare/finish
isn't set.

Once this is in, we can start dropping the wait_prepare/finish ops in
almost all drivers.

Regards,

	Hans

Hans Verkuil (9):
  media: staging: atomisp: set lock before calling vb2_queue_init()
  media: pwc: set lock before calling vb2_queue_init()
  media: msi2500: set lock before calling vb2_queue_init()
  media: hackrf: set lock before calling vb2_queue_init()
  media: airspy: set lock before calling vb2_queue_init()
  media: rcar_drif.c: set lock before calling vb2_queue_init()
  media: video-i2c: set lock before calling vb2_queue_init()
  media: vb2: vb2_core_queue_init(): sanity check lock and
    wait_prepare/finish
  media: vb2: use lock if wait_prepare/finish are NULL

 .../media/common/videobuf2/videobuf2-core.c   | 21 ++++++++++++++++---
 drivers/media/i2c/video-i2c.c                 |  2 +-
 drivers/media/platform/renesas/rcar_drif.c    |  2 +-
 drivers/media/usb/airspy/airspy.c             |  2 +-
 drivers/media/usb/hackrf/hackrf.c             |  4 ++--
 drivers/media/usb/msi2500/msi2500.c           |  2 +-
 drivers/media/usb/pwc/pwc-if.c                |  2 +-
 .../media/atomisp/pci/atomisp_subdev.c        |  2 +-
 8 files changed, 26 insertions(+), 11 deletions(-)

-- 
2.34.1


