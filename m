Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDD8C369F7F
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237185AbhDXGr4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:47:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:36126 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234041AbhDXGqW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B521261932;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=SAhPriNR9qiCUHOpk5nwypqhByAWvaCmyWtxT8wI2LQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AH/aohbJTXkk53XxBSfIIzU/NIkaOH9jjmX2c+i2KMEyJV1KV3/i8PFVJyxAPtGUL
         4Xkyh6U4UyE1ujNE8dVGSkmaSazpLqT37HZoXkQAfB2IaOjDasfMm0CZp1dgsGnOWJ
         5yhiGl0Bv4z72NyVRNZbTSPpZmgHjpezLTzHJRyNXPUVYEzLyfvA2Plnbgo1DdCKkR
         Qy+zlkWuGCjJBZBn1vTW6tqFg4sTVfB1dXVH6JpiYYMf6dPCfQP4GPS0TX7XEoVIeT
         rBXM9LlPw3C91oiKsRuozxBMkFkhAmsVHJeRB0YYGn5RP2YGQhNSmSgH6iOa1PLqLp
         oHZHxmwfBvzhw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2m-004Jh3-T5; Sat, 24 Apr 2021 08:45:32 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 69/78] media: rcar-vin: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:45:19 +0200
Message-Id: <dc7f4bc45cd6be79d19d1a4027fb6f35dfb45a03.1619191723.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619191723.git.mchehab+huawei@kernel.org>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 2 +-
 drivers/media/platform/rcar-vin/rcar-dma.c  | 6 ++----
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 6 ++----
 3 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index e06cd512aba2..85574765a11a 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -408,7 +408,7 @@ static void rcsi2_enter_standby(struct rcar_csi2 *priv)
 
 static void rcsi2_exit_standby(struct rcar_csi2 *priv)
 {
-	pm_runtime_get_sync(priv->dev);
+	pm_runtime_resume_and_get(priv->dev);
 	reset_control_deassert(priv->rstc);
 }
 
diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index f30dafbdf61c..f5f722ab1d4e 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -1458,11 +1458,9 @@ int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel)
 	u32 vnmc;
 	int ret;
 
-	ret = pm_runtime_get_sync(vin->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(vin->dev);
+	ret = pm_runtime_resume_and_get(vin->dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	/* Make register writes take effect immediately. */
 	vnmc = rvin_read(vin, VNMC_REG);
diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 457a65bf6b66..b1e9f86caa5c 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -870,11 +870,9 @@ static int rvin_open(struct file *file)
 	struct rvin_dev *vin = video_drvdata(file);
 	int ret;
 
-	ret = pm_runtime_get_sync(vin->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(vin->dev);
+	ret = pm_runtime_resume_and_get(vin->dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	ret = mutex_lock_interruptible(&vin->lock);
 	if (ret)
-- 
2.30.2

