Return-Path: <linux-media+bounces-5098-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA8D853997
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 19:12:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F8391C21860
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 18:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54F3605CE;
	Tue, 13 Feb 2024 18:12:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D1C604D8;
	Tue, 13 Feb 2024 18:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707847966; cv=none; b=na4ZbBLvNDy0WXqIAL8NneOgvGqM2jm1c9PT6RA7U2WWaEsA5NF0jOLANnCgzh9qhvpOQfSjoIZrEIajgFF/IsA9ilJxhJVG4oAQ1g7kgJEMwbn5vI4aXtUgl7KYXmSPBIiT4FyGvcf2aTaDWElkCf/ui7RGNbmGcpyMHCn04ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707847966; c=relaxed/simple;
	bh=0fvM5roz8y+nVTfpTgy8paFT8Je1tMhdPRxLtdKu1Ds=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=II53laa+7ZSygr2xrPpdq1wqhhy4qQ1+5eecpg6k4+LIrWUH8VDbqJSJkb8SnCav+8/5Mvzu2e199HoSppuRjMdfglLaCLbZ9EDFeRIxAmTU+ppgq0ilh7DiV+rvxCMovmckPL9NqiCotvgt2NxIURRz4O8wm57Co82SQxjZtHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,157,1705330800"; 
   d="scan'208";a="197718669"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 14 Feb 2024 03:12:43 +0900
Received: from localhost.localdomain (unknown [10.226.93.58])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id E033340617B1;
	Wed, 14 Feb 2024 03:12:39 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v3 1/5] media: platform: rzg2l-cru: rzg2l-csi2: Switch to RUNTIME_PM_OPS()
Date: Tue, 13 Feb 2024 18:12:29 +0000
Message-Id: <20240213181233.242316-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240213181233.242316-1-biju.das.jz@bp.renesas.com>
References: <20240213181233.242316-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the old SET_RUNTIME_PM_OPS() helpers with its modern alternative
RUNTIME_PM_OPS(). The usage of pm_ptr and RUNTIME_PM_OPS() allows the
compiler to see where it's used but still drop the dead code. After this
we can get rid of the unnecessary '__maybe_unused' annotations on PM
functions.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v2->v3:
 * Added Rb tag from Laurent.
v1->v2:
 * Updated commit description.
 * Aligned RUNTIME_PM_OPS() macro.
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index d20f4eff93a4..e00d9379dd2c 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -834,7 +834,7 @@ static void rzg2l_csi2_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-static int __maybe_unused rzg2l_csi2_pm_runtime_suspend(struct device *dev)
+static int rzg2l_csi2_pm_runtime_suspend(struct device *dev)
 {
 	struct rzg2l_csi2 *csi2 = dev_get_drvdata(dev);
 
@@ -843,7 +843,7 @@ static int __maybe_unused rzg2l_csi2_pm_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rzg2l_csi2_pm_runtime_resume(struct device *dev)
+static int rzg2l_csi2_pm_runtime_resume(struct device *dev)
 {
 	struct rzg2l_csi2 *csi2 = dev_get_drvdata(dev);
 
@@ -851,7 +851,8 @@ static int __maybe_unused rzg2l_csi2_pm_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rzg2l_csi2_pm_ops = {
-	SET_RUNTIME_PM_OPS(rzg2l_csi2_pm_runtime_suspend, rzg2l_csi2_pm_runtime_resume, NULL)
+	RUNTIME_PM_OPS(rzg2l_csi2_pm_runtime_suspend,
+		       rzg2l_csi2_pm_runtime_resume, NULL)
 };
 
 static const struct of_device_id rzg2l_csi2_of_table[] = {
@@ -865,7 +866,7 @@ static struct platform_driver rzg2l_csi2_pdrv = {
 	.driver	= {
 		.name = "rzg2l-csi2",
 		.of_match_table = rzg2l_csi2_of_table,
-		.pm = &rzg2l_csi2_pm_ops,
+		.pm = pm_ptr(&rzg2l_csi2_pm_ops),
 	},
 };
 
-- 
2.25.1


