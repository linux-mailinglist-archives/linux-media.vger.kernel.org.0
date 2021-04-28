Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAE0836DA3E
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240656AbhD1OzJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:55:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:36356 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240378AbhD1Oxr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A0EE561931;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=ICSqYM0Xgfw9oIMwso+FErzxSuvOpl/fXTNpHffe0xs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fHysyxFZlmuI50E5t4vV98qvOtEriUoU3KMn0yepTurqasR22TQkWKLrnsjN+D8rd
         vLJJLRtpQ+QxAXTyWAjI7+EDodeaq/o8EjSMA6wuZMaKbV2rpRPYyPVVSHM6X1kysc
         2b/Ro7+t0+F7+PNk2/IvalgG1tEOFgrTJP3C1QJMMOtqe+2UACwv3yl4auDzajd2Or
         n5kXLVLfZRTKcTWYX+h8G0jfGNID60M3O9RnJJfZ/G+NPzwx4nJ19AvOmE2NAh3MeO
         bo9FXO4lzTeYiFPAS3M5tDHrt4nXqVgbgcJkhm9qDNJur/30jvLIqbWrOpDFzTfaSg
         YaUni1JsyJ0AQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYS-001Dtc-6h; Wed, 28 Apr 2021 16:52:44 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 77/79] media: rcar-vin: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:52:38 +0200
Message-Id: <c0c8f8b07af20c354b946819f5dcdf9f5129654e.1619621413.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 15 ++++++++++++---
 drivers/media/platform/rcar-vin/rcar-dma.c  |  6 ++----
 drivers/media/platform/rcar-vin/rcar-v4l2.c |  6 ++----
 3 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index e06cd512aba2..436fb17f73ea 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -406,10 +406,17 @@ static void rcsi2_enter_standby(struct rcar_csi2 *priv)
 	pm_runtime_put(priv->dev);
 }
 
-static void rcsi2_exit_standby(struct rcar_csi2 *priv)
+static int rcsi2_exit_standby(struct rcar_csi2 *priv)
 {
-	pm_runtime_get_sync(priv->dev);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(priv->dev);
+	if (ret < 0)
+		return ret;
+
 	reset_control_deassert(priv->rstc);
+
+	return ret;
 }
 
 static int rcsi2_wait_phy_start(struct rcar_csi2 *priv,
@@ -657,7 +664,9 @@ static int rcsi2_start(struct rcar_csi2 *priv)
 {
 	int ret;
 
-	rcsi2_exit_standby(priv);
+	ret = rcsi2_exit_standby(priv);
+	if (ret < 0)
+		return ret;
 
 	ret = rcsi2_start_receiver(priv);
 	if (ret) {
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

