Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 149AB3756FF
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235694AbhEFP2T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:28:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:41092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235581AbhEFP1z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:27:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E75AD613E8;
        Thu,  6 May 2021 15:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314800;
        bh=OywYIi5a3XqVfdfwDSr/a7KsGKnino28d76Xjqz0XV4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D751wvuiOPx9QcShg2gaxNRgYh+dHvLZyhMhCqiu2X0Z7Y4obIHDESjR3pBMlyDoM
         wXo9pzZlE7LXN4Zb48UBzaocIUcSIUwWkPsnZhfpxat3KNf0RiBDFkp55QHiG7TV2r
         6Zg3uFxV+pm8Y36nykGAi8W3WuKWhm6r4XUl8Wi7Tm6E8slZtCFen7dFndqFRKXJt9
         CAeyyU+wAHuwXHCPgUfhqsHGFT/2HaWNSA5nR7291aQxKSFoJwq8RdheqQWe6aYfin
         VDar0eost/MTF3s9IK34NCvn0wqvYVO03tfXLI7L1Z4x10RN90yXyxKvAK6zl+HWMs
         l2gQbj91OoC6A==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1left7-000SBL-QF; Thu, 06 May 2021 17:26:05 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: [PATCH v5 05/25] staging: media: tegra-vde: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:25:43 +0200
Message-Id: <a1230241a83a6abcd27b91edcafee1685232f81e.1620314616.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620314616.git.mchehab+huawei@kernel.org>
References: <cover.1620314616.git.mchehab+huawei@kernel.org>
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
 drivers/staging/media/tegra-vde/vde.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
index 28845b5bafaf..e025b69776f2 100644
--- a/drivers/staging/media/tegra-vde/vde.c
+++ b/drivers/staging/media/tegra-vde/vde.c
@@ -775,9 +775,9 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
 	if (ret)
 		goto release_dpb_frames;
 
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
-		goto put_runtime_pm;
+		goto unlock;
 
 	/*
 	 * We rely on the VDE registers reset value, otherwise VDE
@@ -843,6 +843,8 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
 put_runtime_pm:
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
+
+unlock:
 	mutex_unlock(&vde->lock);
 
 release_dpb_frames:
@@ -1069,11 +1071,19 @@ static int tegra_vde_probe(struct platform_device *pdev)
 	 * power-cycle it in order to put hardware into a predictable lower
 	 * power state.
 	 */
-	pm_runtime_get_sync(dev);
+	if (pm_runtime_resume_and_get(dev) < 0)
+		goto err_pm_runtime;
+
 	pm_runtime_put(dev);
 
 	return 0;
 
+err_pm_runtime:
+	misc_deregister(&vde->miscdev);
+
+	pm_runtime_dont_use_autosuspend(dev);
+	pm_runtime_disable(dev);
+
 err_deinit_iommu:
 	tegra_vde_iommu_deinit(vde);
 
@@ -1089,7 +1099,12 @@ static int tegra_vde_remove(struct platform_device *pdev)
 	struct tegra_vde *vde = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 
+	/*
+	 * As it increments RPM usage_count even on errors, we don't need to
+	 * check the returned code here.
+	 */
 	pm_runtime_get_sync(dev);
+
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 
-- 
2.30.2

