Return-Path: <linux-media+bounces-41781-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6292DB440BB
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 17:33:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AAAC5A1DE4
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 15:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B654526CE25;
	Thu,  4 Sep 2025 15:33:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5738C26A0EB;
	Thu,  4 Sep 2025 15:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757000019; cv=none; b=ERvkW2e93+HyyTH7RmxMEyG05T3drwW/hfpoyIwNmNMavE5iRMLVpPmpF7MfRLJW8P6Bi3YiLr6sF5d3+b+1NXXmNHVwMOX0gw0xqFN1JYvA9lMEj1brOG5Orzb3ykZzrEmeKaJgmBbGmyn/0DXwaD4IhzP3tLb0+iX/b4QoH0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757000019; c=relaxed/simple;
	bh=Wu9L5dltCQ5Na+Ble7lIKboKpfQGWeh1HcAlnXWYovQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d+421nKKgr7TY3WWPhbSIgR7NiJYyy8ao5UkfQjbRlRFafX2vPU3QxJVNqbMmckw7isZkjb5ICXXN6zfgcwK62CY1HZVTvATwKE7c2FbaQY4JEkcwt2U18qsgo7D0NCitawBpMD7wm8UjZKZ7o0eFuhQLgU8ho1UnP4RQWS9PQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E72C4CEF1;
	Thu,  4 Sep 2025 15:33:37 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] media: rcar_jpu: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Thu,  4 Sep 2025 17:33:34 +0200
Message-ID: <240d566d0c77b6db21f7e6f8dab50a46e68f4f4d.1756999968.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Renesas JPEG Processing Unit driver from an open-coded
dev_pm_ops structure to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().
This lets us drop the check for CONFIG_PM_SLEEP, and reduces kernel size
in case CONFIG_PM or CONFIG_PM_SLEEP is disabled, while increasing build
coverage.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/media/platform/renesas/rcar_jpu.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar_jpu.c b/drivers/media/platform/renesas/rcar_jpu.c
index 920df067f4f44412..fba9fac6145b1edf 100644
--- a/drivers/media/platform/renesas/rcar_jpu.c
+++ b/drivers/media/platform/renesas/rcar_jpu.c
@@ -1701,7 +1701,6 @@ static void jpu_remove(struct platform_device *pdev)
 	v4l2_device_unregister(&jpu->v4l2_dev);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int jpu_suspend(struct device *dev)
 {
 	struct jpu *jpu = dev_get_drvdata(dev);
@@ -1725,11 +1724,8 @@ static int jpu_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static const struct dev_pm_ops jpu_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(jpu_suspend, jpu_resume)
-};
+static DEFINE_SIMPLE_DEV_PM_OPS(jpu_pm_ops, jpu_suspend, jpu_resume);
 
 static struct platform_driver jpu_driver = {
 	.probe = jpu_probe,
@@ -1737,7 +1733,7 @@ static struct platform_driver jpu_driver = {
 	.driver = {
 		.of_match_table = jpu_dt_ids,
 		.name = DRV_NAME,
-		.pm = &jpu_pm_ops,
+		.pm = pm_sleep_ptr(&jpu_pm_ops),
 	},
 };
 
-- 
2.43.0


