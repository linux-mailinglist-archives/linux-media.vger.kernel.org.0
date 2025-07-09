Return-Path: <linux-media+bounces-37222-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C506AFF1A2
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 21:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 222391891602
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 19:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0B72405E1;
	Wed,  9 Jul 2025 19:16:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF8521D00D;
	Wed,  9 Jul 2025 19:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752088590; cv=none; b=ZcILXyR8WjOOJS2emvHyNMh/HG8ri1Mo3OwuWxweA0erfnkESGrefx1HQQVhWf6JnxHsJizfDi9L0cZkbmm2MDPY4RqPtSRVE54kfo7/GHnBNGLRXohu+H4IPoVDpqeYgw+SjnTj4heM2YJgEYGjeqx3zPTI3USVJwesVYfSKus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752088590; c=relaxed/simple;
	bh=mA5oJ/FB0ZKzy0GCw++UPAiPNIN53oAvgBcQCtqaws0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kWYwKlBKkgyYP+uXsmH6p7l9MhKOBK87p4/cshKAvptNKq4yfgM3LPw15PuuiBDWhl4fTibpVnSJhNwQh7j6NPmhMJxgwvMn6BEdx95X+nSDlpu2/HdPu677OfUunitg2k1c5IYPCzyj2DFcAJVqjOFVwnISPMUswLCUsAx+aHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84E05C4CEF4;
	Wed,  9 Jul 2025 19:16:27 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/5] media: renesas: fdp1: Convert to RUNTIME_PM_OPS()
Date: Wed,  9 Jul 2025 21:16:09 +0200
Message-ID: <4402553df11f87a53cd70c95e35966963a4132df.1752088108.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752088108.git.geert+renesas@glider.be>
References: <cover.1752088108.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Renesas Fine Display Processor driver from
SET_RUNTIME_PM_OPS() to RUNTIME_PM_OPS() and pm_ptr().  This lets us
drop the __maybe_unused annotations from its runtime suspend and resume
callbacks, and reduces kernel size in case CONFIG_PM is disabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/media/platform/renesas/rcar_fdp1.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar_fdp1.c b/drivers/media/platform/renesas/rcar_fdp1.c
index 5d453a7a89889fa3..a40e48a7078f11b6 100644
--- a/drivers/media/platform/renesas/rcar_fdp1.c
+++ b/drivers/media/platform/renesas/rcar_fdp1.c
@@ -2409,7 +2409,7 @@ static void fdp1_remove(struct platform_device *pdev)
 	rcar_fcp_put(fdp1->fcp);
 }
 
-static int __maybe_unused fdp1_pm_runtime_suspend(struct device *dev)
+static int fdp1_pm_runtime_suspend(struct device *dev)
 {
 	struct fdp1_dev *fdp1 = dev_get_drvdata(dev);
 
@@ -2418,7 +2418,7 @@ static int __maybe_unused fdp1_pm_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused fdp1_pm_runtime_resume(struct device *dev)
+static int fdp1_pm_runtime_resume(struct device *dev)
 {
 	struct fdp1_dev *fdp1 = dev_get_drvdata(dev);
 
@@ -2429,9 +2429,7 @@ static int __maybe_unused fdp1_pm_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops fdp1_pm_ops = {
-	SET_RUNTIME_PM_OPS(fdp1_pm_runtime_suspend,
-			   fdp1_pm_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(fdp1_pm_runtime_suspend, fdp1_pm_runtime_resume, NULL)
 };
 
 static const struct of_device_id fdp1_dt_ids[] = {
@@ -2446,7 +2444,7 @@ static struct platform_driver fdp1_pdrv = {
 	.driver		= {
 		.name	= DRIVER_NAME,
 		.of_match_table = fdp1_dt_ids,
-		.pm	= &fdp1_pm_ops,
+		.pm	= pm_ptr(&fdp1_pm_ops),
 	},
 };
 
-- 
2.43.0


