Return-Path: <linux-media+bounces-41782-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C37C2B440BD
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 17:34:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 663B24811BD
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 15:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5E7274B37;
	Thu,  4 Sep 2025 15:34:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27731271479
	for <linux-media@vger.kernel.org>; Thu,  4 Sep 2025 15:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757000056; cv=none; b=R2OAK/MyGI/teDjms+5JwJcvR7Ukbx/p1qiDn52lmTjRIIUVSt1B/MxZAvTgc4KtdxxrcZkLLID7+ztgDAqxgoc286EDbCfrGMv0KIC7VtdQKDRVEqkPwioMNNK/5sWItJlV58lIN9QCXs0MpAHp+VXW5YC6cCLW4dUDHn+dCtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757000056; c=relaxed/simple;
	bh=qcVnFvOCimGtPQ6uqGw9ZVm1BqHwJ34A7O0zdXpfyVs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nyc2C9g5FBM7te9WI0/wF9vAIzjWf/OK1iD8UlYu8msiKpH9YvRXlIQAfs+R1M+x4/OWwMze0ZYW8UzshCZgs3UJccZ8rY0RfAJZpBeg5NOooqBPNa3jZelYbGaq55CWj+JUXcBfyXgHwICSB+kqnjmoLe25hAi6zbPLsyH2478=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DC48C4CEF1;
	Thu,  4 Sep 2025 15:34:13 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Ming Qian <ming.qian@nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] media: amphion: Remove dummy PM handling
Date: Thu,  4 Sep 2025 17:34:09 +0200
Message-ID: <0829592627e599edd611e603ad420b3e5c752f89.1757000029.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 63d00be69348fda4 ("PM: runtime: Allow unassigned
->runtime_suspend|resume callbacks"), unassigned
.runtime_{suspend,resume}() callbacks are treated the same as dummy
callbacks that just return zero.
Unassigned system sleep callbacks were always treated the same as dummy
callbacks that just return zero.

As the driver has no other PM callbacks than dummy callbacks, all PM
handling can be removed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
---
 drivers/media/platform/amphion/vpu_drv.c | 26 ------------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_drv.c b/drivers/media/platform/amphion/vpu_drv.c
index efbfd2652721f010..2cca61f41beae146 100644
--- a/drivers/media/platform/amphion/vpu_drv.c
+++ b/drivers/media/platform/amphion/vpu_drv.c
@@ -175,31 +175,6 @@ static void vpu_remove(struct platform_device *pdev)
 	mutex_destroy(&vpu->lock);
 }
 
-static int __maybe_unused vpu_runtime_resume(struct device *dev)
-{
-	return 0;
-}
-
-static int __maybe_unused vpu_runtime_suspend(struct device *dev)
-{
-	return 0;
-}
-
-static int __maybe_unused vpu_resume(struct device *dev)
-{
-	return 0;
-}
-
-static int __maybe_unused vpu_suspend(struct device *dev)
-{
-	return 0;
-}
-
-static const struct dev_pm_ops vpu_pm_ops = {
-	SET_RUNTIME_PM_OPS(vpu_runtime_suspend, vpu_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(vpu_suspend, vpu_resume)
-};
-
 static struct vpu_resources imx8qxp_res = {
 	.plat_type = IMX8QXP,
 	.mreg_base = 0x40000000,
@@ -231,7 +206,6 @@ static struct platform_driver amphion_vpu_driver = {
 	.driver = {
 		.name = "amphion-vpu",
 		.of_match_table = vpu_dt_match,
-		.pm = &vpu_pm_ops,
 	},
 };
 
-- 
2.43.0


