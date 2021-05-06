Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 835FE3756EC
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235637AbhEFP2K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:28:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:40884 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235572AbhEFP1y (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:27:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1DDF76196A;
        Thu,  6 May 2021 15:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314784;
        bh=oIZOpIBwHVlxuxb+tCGyZiRaE6QdZqQvQMPRN2jFRlM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ntpQ8FKKSJlYAsJZTCOuH7ldiQm0MPXlRmH8jpLDdcbWgWcUYdA+MORhShscEpkHC
         ap7SMCycuucfepxEhkhF86Zg5cIb0pyGCsEzL9qKYDGPAHaZaa90bXXNbj59DzJqok
         hNA4cs+gJ9Fjrez1JROHsVM/aTvWwjlmoL4hSa4TANTBOR2NL2rMvSHs4K4Mwozu9g
         P2/Duj9FHqnvFRJfESCy03w9LstJHAeena9F4K/CHkZiWMPVCKgeXzByw2OwE7VfUr
         Grz4EwcYfifJS4b3H0DG3zVgUliGAbT6Ye7aR4Sybbk9RwclRh8UFQps7Gi8JzB4g7
         AIXWSEAoE6bzQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1left8-000SCZ-ED; Thu, 06 May 2021 17:26:06 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v5 24/25] media: rcar-vin: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:26:02 +0200
Message-Id: <9d28be9ebbf8343b6a7ed9c84b27d0cfa3b4d243.1620314616.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620314616.git.mchehab+huawei@kernel.org>
References: <cover.1620314616.git.mchehab+huawei@kernel.org>
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
index e06cd512aba2..99bf814eb2a7 100644
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
+	return 0;
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

