Return-Path: <linux-media+bounces-53872-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPXpIi2Vo2n3HQUAu9opvQ
	(envelope-from <linux-media+bounces-53872-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:23:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E15811CA691
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:23:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 571AA309CCBA
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C2825A2A2;
	Sun,  1 Mar 2026 01:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bJvrMKUa"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78530248F73;
	Sun,  1 Mar 2026 01:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772327932; cv=none; b=a097T1m2df7nQqRzaVQWL8gp1yeUWIb1qqO1uAFSPVR2XRC96q/PPdoqn1UY0yROFsx0EVyiNFgcAUd0ecqxAEc32mVEe2IX66t8ByAr+24ikmrxI5ABgn8R2cPQ3Ly+sAW1foZDEZlKO+J6GYfU+uh3t27XM7cgpWPW//B1RLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772327932; c=relaxed/simple;
	bh=6gZw7WVb894d1jYJFWNZT8XKO1pKRmgSc1LpH3auOMY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eGwwNZ6Z6BvgCeiBmHrEiNj06VzPfU1sBaklyMKEoscTaGnCjJpMtrJJUowyin3RrlEdOVO9/pmKJQNwiV26uBk9q+FHPGiBNVK8K4AvuMZVTtMibJSLo9R+4DFKyfCcbUwAXJ6apOSwMGB/uzDnCh48WmdNf+/K/S+SQnUe8PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bJvrMKUa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC36BC19421;
	Sun,  1 Mar 2026 01:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772327932;
	bh=6gZw7WVb894d1jYJFWNZT8XKO1pKRmgSc1LpH3auOMY=;
	h=From:To:Cc:Subject:Date:From;
	b=bJvrMKUaf1ASLhGxB0p9k1aWGuMMsvjyJGs+mxY6zdvlsjroMtYxndQpZL396RjFv
	 MLJrTFQNy92htm3qliF08pX2jevz6j/05YNXtt7096t5UxMNQzcc7a09ZkJesyjbs8
	 9tWJHQem7bQwaOubfQTiT/+ShRzbjSzry27fUapO3vwMPs4ch0DuRPUqBQLjb86Ion
	 1drTOlp9q3wGSQJnJLM2mFBjoXrGvAVmzAaMKxzEADClNtMmWQzxzioZV3oY3bz98S
	 5GpKmu2VxkvzJzpuRxl3/xP1vkaC/Onvn1i/jz/zNyQyJYV4XIP3qqgDADotaqSbxy
	 jjX4Lthd15kEg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	xulin.sun@windriver.com
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: chips-media: wave5: Fix PM runtime usage count underflow" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:18:50 -0500
Message-ID: <20260301011850.1673301-1-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-53872-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[windriver.com:email,collabora.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E15811CA691
X-Rspamd-Action: no action

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 9cf4452e824c1e2d41c9c0b13cc8a32a0a7dec38 Mon Sep 17 00:00:00 2001
From: Xulin Sun <xulin.sun@windriver.com>
Date: Thu, 4 Dec 2025 17:41:51 +0800
Subject: [PATCH] media: chips-media: wave5: Fix PM runtime usage count
 underflow

Replace pm_runtime_put_sync() with pm_runtime_dont_use_autosuspend() in
the remove path to properly pair with pm_runtime_use_autosuspend() from
probe. This allows pm_runtime_disable() to handle reference count cleanup
correctly regardless of current suspend state.

The driver calls pm_runtime_put_sync() unconditionally in remove, but the
device may already be suspended due to autosuspend configured in probe.
When autosuspend has already suspended the device, the usage count is 0,
and pm_runtime_put_sync() decrements it to -1.

This causes the following warning on module unload:

  ------------[ cut here ]------------
  WARNING: CPU: 1 PID: 963 at kernel/kthread.c:1430
    kthread_destroy_worker+0x84/0x98
  ...
  vdec 30210000.video-codec: Runtime PM usage count underflow!

Fixes: 9707a6254a8a ("media: chips-media: wave5: Add the v4l2 layer")
Cc: stable@vger.kernel.org
Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index e1715d3f43b0d..23aa3ab51a0ef 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -356,7 +356,7 @@ static void wave5_vpu_remove(struct platform_device *pdev)
 		hrtimer_cancel(&dev->hrtimer);
 	}
 
-	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
 	mutex_destroy(&dev->dev_lock);
-- 
2.51.0





