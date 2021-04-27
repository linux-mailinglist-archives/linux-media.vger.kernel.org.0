Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEA8836C2EA
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237304AbhD0KQp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:16:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:34780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236134AbhD0KPO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:15:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5E020611ED;
        Tue, 27 Apr 2021 10:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518435;
        bh=ef7IZ30lWjyFTV9EZRM5TkDA3zgk8AfGs9/mdIqlXQw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RB3Q5l/+RxAU8Jsd4tjtOWG3kz+K+KNeI0F0TYSc68vmC/Y9CU7c+TXrc6Js29jDr
         nRymjCPnKpJo4cDfNU7p4MMKKKZ7JewDJzQ/1XC/TB45YnTBJW6fQgdohfcitDLNIW
         Y+4h8BajogEp6yBzVlSt99afe7ZS3/CIR9zhRqJ6FK6t9B/0TAK227JqwSrZwqrj2I
         KC/DvyHDzx3OTOY7OnUsV3L7YTy5JNpMG4bmBdewOuUyMD9lEFFVe68kStsGuMDwDD
         K9APVYPUfpZGgv4vStvVCYZeXcWcloWaRAP+SLfTF3GL7YMCgrLsz/TGJ6PJ378ysJ
         c3HR51tTcDLVg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKj2-000j8M-BJ; Tue, 27 Apr 2021 12:13:52 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 78/79] media: rcar-vin: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:13:45 +0200
Message-Id: <9ebf042135b50dedc6e1f654e4c8487602645d29.1619518193.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619518193.git.mchehab+huawei@kernel.org>
References: <cover.1619518193.git.mchehab+huawei@kernel.org>
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
 drivers/media/platform/rcar-vin/rcar-csi2.c | 6 ++++++
 drivers/media/platform/rcar-vin/rcar-dma.c  | 6 ++----
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 6 ++----
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index e06cd512aba2..ce8e84f9e3d9 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -408,6 +408,12 @@ static void rcsi2_enter_standby(struct rcar_csi2 *priv)
 
 static void rcsi2_exit_standby(struct rcar_csi2 *priv)
 {
+	/*
+	 * The code at rcsi2_enter_standby() assumes
+	 * inconditionally that PM runtime usage count was
+	 * incremented. So, it shouldn't use pm_runtime_resume_and_get()
+	 * here.
+	 */
 	pm_runtime_get_sync(priv->dev);
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

