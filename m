Return-Path: <linux-media+bounces-37223-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2781BAFF1A8
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 21:17:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 622727B6F00
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 19:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66BFF23717C;
	Wed,  9 Jul 2025 19:16:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDC221D00D;
	Wed,  9 Jul 2025 19:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752088594; cv=none; b=XDmdjuK4Qi0TbGLtbPjIZDWHeGwUS1CHA9zvTRl2xtD5hxA/6R4C4tO2mYPztNr8DNT+wDXNx9AGS5T5+MOgWzFDWZx8pnp4LWRskkVHU14Cum8MuIfKT0O7h+wcKRRYiRoe+zvI75bJhJ+PXOVEKedzuukQXQP1cNpnL0ZJSQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752088594; c=relaxed/simple;
	bh=upq33m7ERdQ6y0Wc2g5fE/p5Ify29NtqzL2UQuJre8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pWtKjaLbwtRsiOUJx9FcFV/kqfXH4Ja+L3H9SsngO+PG3NGii7CUArkMqjlUwZCtm9piWI6JlqwmC8eMtYjhdLTOFrDZQvUL0myf+sc2Tcuu2vMuNYSvvX7T8fQlSzHMompiXilZvjMIFBO9mjTzc2X5HM8jHBrJ5+v2ah2IKvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DD4EC4CEF0;
	Wed,  9 Jul 2025 19:16:30 +0000 (UTC)
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
Subject: [PATCH 4/5] media: renesas: ceu: Convert to RUNTIME_PM_OPS()
Date: Wed,  9 Jul 2025 21:16:10 +0200
Message-ID: <7073c5a5a4c89b9244a2e39829cfff585380d1c6.1752088108.git.geert+renesas@glider.be>
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

Convert the Renesas Capture Engine Unit driver from SET_RUNTIME_PM_OPS()
to RUNTIME_PM_OPS() and pm_ptr().  This lets us drop the __maybe_unused
annotations from its runtime suspend and resume callbacks, and reduces
kernel size in case CONFIG_PM is disabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/media/platform/renesas/renesas-ceu.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/renesas-ceu.c b/drivers/media/platform/renesas/renesas-ceu.c
index 8cceafe491b1bec6..deed49d0fb10e0d7 100644
--- a/drivers/media/platform/renesas/renesas-ceu.c
+++ b/drivers/media/platform/renesas/renesas-ceu.c
@@ -1048,7 +1048,7 @@ static int ceu_init_mbus_fmt(struct ceu_device *ceudev)
 /*
  * ceu_runtime_resume() - soft-reset the interface and turn sensor power on.
  */
-static int __maybe_unused ceu_runtime_resume(struct device *dev)
+static int ceu_runtime_resume(struct device *dev)
 {
 	struct ceu_device *ceudev = dev_get_drvdata(dev);
 	struct v4l2_subdev *v4l2_sd = ceudev->sd->v4l2_sd;
@@ -1064,7 +1064,7 @@ static int __maybe_unused ceu_runtime_resume(struct device *dev)
  * ceu_runtime_suspend() - disable capture and interrupts and soft-reset.
  *			   Turn sensor power off.
  */
-static int __maybe_unused ceu_runtime_suspend(struct device *dev)
+static int ceu_runtime_suspend(struct device *dev)
 {
 	struct ceu_device *ceudev = dev_get_drvdata(dev);
 	struct v4l2_subdev *v4l2_sd = ceudev->sd->v4l2_sd;
@@ -1709,15 +1709,13 @@ static void ceu_remove(struct platform_device *pdev)
 }
 
 static const struct dev_pm_ops ceu_pm_ops = {
-	SET_RUNTIME_PM_OPS(ceu_runtime_suspend,
-			   ceu_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(ceu_runtime_suspend, ceu_runtime_resume, NULL)
 };
 
 static struct platform_driver ceu_driver = {
 	.driver		= {
 		.name	= DRIVER_NAME,
-		.pm	= &ceu_pm_ops,
+		.pm	= pm_ptr(&ceu_pm_ops),
 		.of_match_table = of_match_ptr(ceu_of_match),
 	},
 	.probe		= ceu_probe,
-- 
2.43.0


