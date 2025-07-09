Return-Path: <linux-media+bounces-37220-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B54F9AFF19F
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 21:16:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A939F3A15ED
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 19:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0998E23FC41;
	Wed,  9 Jul 2025 19:16:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A430621FF3C;
	Wed,  9 Jul 2025 19:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752088584; cv=none; b=e78g0EtqZDKwE7kCzOwmnQkHeyGCTiHK4/tW34/P7jJ2fmVdm02AyuFCwNbdRBe5kmKDVkK4q6s98fosc7rlppLPdmPjWjGTVyCFNpU0abt1pqgN/WhS8F2Q+MO/W1bOorfYF1g68cVIWtkj4rZ3QEDP2WYHSmP2G47WOKDtdxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752088584; c=relaxed/simple;
	bh=xprPjO6fSDQrn5IflhrAvPtrAlZpHjzgFei+/4LvAyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lKjsDxOtTBuiFQM0m1T3xL800FmwPZXQURLBifspHJWF0PkIxOYfblbO8LtfkRpoULm+ueqqocl1y8Mp7WzrzwTERGvho8z+booh8osFJextaNZD7DU7QPFPwWtJf7IJzQTIaF9+0ohf1cfk6ASMUIhI2TDV5P6zXYYfXg2tyLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18DBFC4CEEF;
	Wed,  9 Jul 2025 19:16:21 +0000 (UTC)
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
Subject: [PATCH 1/5] media: renesas: rcar_drif: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  9 Jul 2025 21:16:07 +0200
Message-ID: <ad032c66fc32dddf3a5590a5939792c1139a554c.1752088108.git.geert+renesas@glider.be>
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

Convert the Renesas Digital Radio Interface driver from
SIMPLE_DEV_PM_OPS() to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().
This lets us drop the __maybe_unused annotations from its suspend and
resume callbacks, and reduces kernel size in case CONFIG_PM or
CONFIG_PM_SLEEP is disabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/media/platform/renesas/rcar_drif.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/platform/renesas/rcar_drif.c
index fc8b6bbef793c64e..0f0c5844e22ea86c 100644
--- a/drivers/media/platform/renesas/rcar_drif.c
+++ b/drivers/media/platform/renesas/rcar_drif.c
@@ -1446,18 +1446,18 @@ static void rcar_drif_remove(struct platform_device *pdev)
 }
 
 /* FIXME: Implement suspend/resume support */
-static int __maybe_unused rcar_drif_suspend(struct device *dev)
+static int rcar_drif_suspend(struct device *dev)
 {
 	return 0;
 }
 
-static int __maybe_unused rcar_drif_resume(struct device *dev)
+static int rcar_drif_resume(struct device *dev)
 {
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(rcar_drif_pm_ops, rcar_drif_suspend,
-			 rcar_drif_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(rcar_drif_pm_ops, rcar_drif_suspend,
+				rcar_drif_resume);
 
 static const struct of_device_id rcar_drif_of_table[] = {
 	{ .compatible = "renesas,rcar-gen3-drif" },
@@ -1470,7 +1470,7 @@ static struct platform_driver rcar_drif_driver = {
 	.driver = {
 		.name = RCAR_DRIF_DRV_NAME,
 		.of_match_table = rcar_drif_of_table,
-		.pm = &rcar_drif_pm_ops,
+		.pm = pm_sleep_ptr(&rcar_drif_pm_ops),
 		},
 	.probe = rcar_drif_probe,
 	.remove = rcar_drif_remove,
-- 
2.43.0


