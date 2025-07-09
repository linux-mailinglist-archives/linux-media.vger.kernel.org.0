Return-Path: <linux-media+bounces-37221-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5E7AFF1A0
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 21:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8641B565FB4
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 19:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D501E23B63D;
	Wed,  9 Jul 2025 19:16:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7869B21D00D;
	Wed,  9 Jul 2025 19:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752088587; cv=none; b=rjflbdXE64kT1Dn00H3enxSbDj2BK8XZ5AvYSMnUhCzRV2TYYJkI97MrbZSssB+oKThNthmzJI8uH76k4qsD2GmjblXHJbMqBbvwCcwTBCLO2tGbaMDFrYapCJMexkRavw5vDJerfmvqHEy6RFCnmPkmSb8oErRkjj3XnChjpVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752088587; c=relaxed/simple;
	bh=Yo8mkwrG9IX++/J5itWoKUfdHHmoXZQcRCkaHBN4Ee4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hb2CUKqwCVYsTVKPrM0Lp5JwNqQc6lN7POuyrn58HjUQewEYGoZc2QYZ+VhEGw10HRYKJp8w8w9C8wrgR0waccBu/dx9n3Hv82ibbNjcokGfF9QY67vCzgntbM79pMmzpFlrq/XfJtacj2tF6KbvpKr8jHJakzkLWLjVVaCdJZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C97D4C4CEEF;
	Wed,  9 Jul 2025 19:16:24 +0000 (UTC)
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
Subject: [PATCH 2/5] media: renesas: rcar-vin: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  9 Jul 2025 21:16:08 +0200
Message-ID: <21c38e1fc0c8383d8d723b61f00f37d4003e0de9.1752088108.git.geert+renesas@glider.be>
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

Convert the Renesas R-Car Video Input driver from SIMPLE_DEV_PM_OPS() to
DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().  This lets us drop the
__maybe_unused annotations from its suspend and resume callbacks, and
reduces kernel size in case CONFIG_PM or CONFIG_PM_SLEEP is disabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index f73729f59671be20..100105b620e31e58 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -849,7 +849,7 @@ static int rvin_isp_init(struct rvin_dev *vin)
  * Suspend / Resume
  */
 
-static int __maybe_unused rvin_suspend(struct device *dev)
+static int rvin_suspend(struct device *dev)
 {
 	struct rvin_dev *vin = dev_get_drvdata(dev);
 
@@ -861,7 +861,7 @@ static int __maybe_unused rvin_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rvin_resume(struct device *dev)
+static int rvin_resume(struct device *dev)
 {
 	struct rvin_dev *vin = dev_get_drvdata(dev);
 
@@ -1276,13 +1276,13 @@ static void rcar_vin_remove(struct platform_device *pdev)
 	rvin_dma_unregister(vin);
 }
 
-static SIMPLE_DEV_PM_OPS(rvin_pm_ops, rvin_suspend, rvin_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(rvin_pm_ops, rvin_suspend, rvin_resume);
 
 static struct platform_driver rcar_vin_driver = {
 	.driver = {
 		.name = "rcar-vin",
 		.suppress_bind_attrs = true,
-		.pm = &rvin_pm_ops,
+		.pm = pm_sleep_ptr(&rvin_pm_ops),
 		.of_match_table = rvin_of_id_table,
 	},
 	.probe = rcar_vin_probe,
-- 
2.43.0


