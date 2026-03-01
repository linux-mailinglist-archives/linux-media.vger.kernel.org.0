Return-Path: <linux-media+bounces-53876-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCh+E2WVo2l7HQUAu9opvQ
	(envelope-from <linux-media+bounces-53876-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:24:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C77B31CA77E
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:24:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F21030B6D71
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B3E8257ACF;
	Sun,  1 Mar 2026 01:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MplvO9E7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7983025F98A;
	Sun,  1 Mar 2026 01:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772327947; cv=none; b=CVPuMUTxtTHdf2w213AVUqESN+DByd9Ne97JzRZ3vPpDdns2TFvlSzs/S3rjpXLZl0L5cIhJ8r1iqUlEI0g4hubSEUMaihkd1txmOje9PluNRU+7ato+kIT56Lgk7+JrjtFqVsAwqy4B/9R4Hvaj0TT3kqabB6j591yYhf854xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772327947; c=relaxed/simple;
	bh=liU7yQJ0B+D/PkDcFxJSoLnVpiIGZcdo5HqqQh6x6ns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TvaSqZ3W6TEVfnSoApEBudzaSyL9QWw2fjMZ1Ryzvhg8WxdmvI7uZVrPRD606erj2txbtRwh3dvWVsDdt1upwzZONzWlXnqdmUz2YySk/2lunjs3wyJTtwpMud4FPaBwUqSg+421mhIws8vF37vXY/+AapMGGde6uR+qYANhnTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MplvO9E7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA51AC19421;
	Sun,  1 Mar 2026 01:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772327947;
	bh=liU7yQJ0B+D/PkDcFxJSoLnVpiIGZcdo5HqqQh6x6ns=;
	h=From:To:Cc:Subject:Date:From;
	b=MplvO9E7+f6zZgQrGFa0dHyz+EYXQg6/8U1Pjqrzt8q7Y7ftXoHv9uJIVwcKebHU8
	 CG/4qu3fOn2y2rOorKzm+OCnn3ULuIHjQqLDFV+atbgcLFhnq0ejQOY0qnDYWBaJxS
	 ONKS3nH2Hm06iHsH8ZVLIP5OFo8Z8KrZ+qIyx7D8gRx4FUNlnkS2gYjesZRUcRTwc2
	 L0GTNomZzl+7zfW2sP59Gu3ikCn0qg/5/5kPF5Z7DcEsVEgI8x4iW1vPE8qZxvuKUL
	 ssfKAndE5b9IQT15r8PdZCynnzSJ3KV5EdFz3oSXrb1ZBImGOrffc3YgyepWPJStAT
	 o7jxU8A39GKzQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	xulin.sun@windriver.com
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: chips-media: wave5: Fix device cleanup order to prevent kernel panic" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:19:05 -0500
Message-ID: <20260301011905.1673655-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-53876-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,windriver.com:email]
X-Rspamd-Queue-Id: C77B31CA77E
X-Rspamd-Action: no action

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From b74cedac643b02aefa7da881b58a3792859d9748 Mon Sep 17 00:00:00 2001
From: Xulin Sun <xulin.sun@windriver.com>
Date: Thu, 4 Dec 2025 17:41:53 +0800
Subject: [PATCH] media: chips-media: wave5: Fix device cleanup order to
 prevent kernel panic

Move video device unregistration to the beginning of the remove function
to ensure all video operations are stopped before cleaning up the worker
thread and disabling PM runtime. This prevents hardware register access
after the device has been powered down.

In polling mode, the hrtimer periodically triggers
wave5_vpu_timer_callback() which queues work to the kthread worker.
The worker executes wave5_vpu_irq_work_fn() which reads hardware
registers via wave5_vdi_read_register().

The original cleanup order disabled PM runtime and powered down hardware
before unregistering video devices. When autosuspend triggers and powers
off the hardware, the video devices are still registered and the worker
thread can still be triggered by the hrtimer, causing it to attempt
reading registers from powered-off hardware. This results in a bus error
(synchronous external abort) and kernel panic.

This causes random kernel panics during encoding operations:

  Internal error: synchronous external abort: 0000000096000010
    [#1] PREEMPT SMP
  Modules linked in: wave5 rpmsg_ctrl rpmsg_char ...
  CPU: 0 UID: 0 PID: 1520 Comm: vpu_irq_thread
    Tainted: G   M    W
  pc : wave5_vdi_read_register+0x10/0x38 [wave5]
  lr : wave5_vpu_irq_work_fn+0x28/0x60 [wave5]
  Call trace:
   wave5_vdi_read_register+0x10/0x38 [wave5]
   kthread_worker_fn+0xd8/0x238
   kthread+0x104/0x120
   ret_from_fork+0x10/0x20
  Code: aa1e03e9 d503201f f9416800 8b214000 (b9400000)
  ---[ end trace 0000000000000000 ]---
  Kernel panic - not syncing: synchronous external abort:
    Fatal exception

Fixes: 9707a6254a8a ("media: chips-media: wave5: Add the v4l2 layer")
Cc: stable@vger.kernel.org
Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index 0bcd48df49d0f..77d6c934d0b9d 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -351,6 +351,10 @@ static void wave5_vpu_remove(struct platform_device *pdev)
 {
 	struct vpu_device *dev = dev_get_drvdata(&pdev->dev);
 
+	wave5_vpu_enc_unregister_device(dev);
+	wave5_vpu_dec_unregister_device(dev);
+	v4l2_device_unregister(&dev->v4l2_dev);
+
 	if (dev->irq < 0) {
 		hrtimer_cancel(&dev->hrtimer);
 		kthread_cancel_work_sync(&dev->work);
@@ -364,9 +368,6 @@ static void wave5_vpu_remove(struct platform_device *pdev)
 	mutex_destroy(&dev->hw_lock);
 	reset_control_assert(dev->resets);
 	clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
-	wave5_vpu_enc_unregister_device(dev);
-	wave5_vpu_dec_unregister_device(dev);
-	v4l2_device_unregister(&dev->v4l2_dev);
 	wave5_vdi_release(&pdev->dev);
 	ida_destroy(&dev->inst_ida);
 }
-- 
2.51.0





