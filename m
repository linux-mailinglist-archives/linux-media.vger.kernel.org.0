Return-Path: <linux-media+bounces-37224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6ECAFF1A4
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 21:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B76B165E88
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 19:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A62B9241662;
	Wed,  9 Jul 2025 19:16:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA4A21D00D;
	Wed,  9 Jul 2025 19:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752088595; cv=none; b=ubfrfkPCuCZiC4P4m93++T8uGPai15Mc8Zz4fFCwxAIlNhvvXbwSIRRGRG37vIaF+xoqc/PXfzBU6ktCQJD/XvghBGpDvFx8vCHkKleMu0LjA48cge8hZ0TK3TlByMNQ/Kmu5gqtQep7nLTl8vDxnnaqNUtEb6nRIOLu+pZ17aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752088595; c=relaxed/simple;
	bh=41hN8NTdGB4I+pESBM5z8FrvtwgyLVopG5wAPcyZj8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u3+K9K/fK2C1+jDbMtq8eT5mMAy9cryYTplI6xBonrtYN4MugabB91BpdbovgECwOPPZ3YOVe535CRUJU9AG+cwGbpCrAOeGCdr2IAhU4oXl2bkyhiveJS1O8lwJTusieOnYbkF4fWbi/BLyz2cJcCwDiSvfwJxLvyqYzrdttMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC804C4CEF4;
	Wed,  9 Jul 2025 19:16:32 +0000 (UTC)
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
Subject: [PATCH 5/5] media: renesas: vsp1: Convert to SYSTEM_SLEEP/RUNTIME_PM_OPS()
Date: Wed,  9 Jul 2025 21:16:11 +0200
Message-ID: <7de021d90e524ef740d6d59a899fb9a34fbf5247.1752088108.git.geert+renesas@glider.be>
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

Convert the Renesas VSP1 Video Processing Engine driver from
SET_SYSTEM_SLEEP_PM_OPS() and SET_RUNTIME_PM_OPS() to
SYSTEM_SLEEP_PM_OPS(), RUNTIME_PM_OPS(), and pm_ptr().  This lets us
drop the __maybe_unused annotations from its various suspend and resume
callbacks, and reduces kernel size in case CONFIG_PM is disabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/media/platform/renesas/vsp1/vsp1_drv.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index b8d06e88c4757317..6c64657fc4f3366f 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
@@ -618,7 +618,7 @@ void vsp1_device_put(struct vsp1_device *vsp1)
  * Power Management
  */
 
-static int __maybe_unused vsp1_pm_suspend(struct device *dev)
+static int vsp1_pm_suspend(struct device *dev)
 {
 	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
 
@@ -634,7 +634,7 @@ static int __maybe_unused vsp1_pm_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused vsp1_pm_resume(struct device *dev)
+static int vsp1_pm_resume(struct device *dev)
 {
 	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
 
@@ -650,7 +650,7 @@ static int __maybe_unused vsp1_pm_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused vsp1_pm_runtime_suspend(struct device *dev)
+static int vsp1_pm_runtime_suspend(struct device *dev)
 {
 	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
 
@@ -660,7 +660,7 @@ static int __maybe_unused vsp1_pm_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused vsp1_pm_runtime_resume(struct device *dev)
+static int vsp1_pm_runtime_resume(struct device *dev)
 {
 	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
 	int ret;
@@ -693,8 +693,8 @@ static int __maybe_unused vsp1_pm_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops vsp1_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(vsp1_pm_suspend, vsp1_pm_resume)
-	SET_RUNTIME_PM_OPS(vsp1_pm_runtime_suspend, vsp1_pm_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(vsp1_pm_suspend, vsp1_pm_resume)
+	RUNTIME_PM_OPS(vsp1_pm_runtime_suspend, vsp1_pm_runtime_resume, NULL)
 };
 
 /* -----------------------------------------------------------------------------
@@ -1042,7 +1042,7 @@ static struct platform_driver vsp1_platform_driver = {
 	.remove		= vsp1_remove,
 	.driver		= {
 		.name	= "vsp1",
-		.pm	= &vsp1_pm_ops,
+		.pm	= pm_ptr(&vsp1_pm_ops),
 		.of_match_table = vsp1_of_match,
 	},
 };
-- 
2.43.0


