Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BCFB369F4F
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233588AbhDXGqr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:46:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:35760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232649AbhDXGqN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D03361585;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=eeb2tTMTeECwFCJsmdUEhrGisH5F5adY0i6Xu5Zdqhg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D7m1+/YgiC8xIlMj7VWQHrs6KgWbpS1N8LJsp0D6XVY9HeH1QzcoilCL/b5uQkYAQ
         oydnV4l4azslz8/ThhPR9qtwZ/427FYUCr/ElFFIkRn2jKl5txOY3rR2YpGsWXhPOt
         pr23rFa6b3esb67KfLE6OG9aZG78cqfLOulOKYy70/4mVxYJ4Y5bBOjsrXbL7u0wdS
         /FUFi9+ar03rkwidUt8goZYedmocf6LN/LYg87ig72ECKRLc0bynMkoCiFlLHjtqFD
         v39wAgySVnGb1J8Pqgjf6qpjReJ4+fjRUUaEJ7rQMA8I+lf9AdO+6gwDe51OCsYXiE
         xMuQr36IffuIA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2l-004JeX-Bw; Sat, 24 Apr 2021 08:45:31 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 17/78] staging: media: vde: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:44:27 +0200
Message-Id: <0eeb886803679cd908cb4576d35b2314993abd2c.1619191723.git.mchehab+huawei@kernel.org>
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
 drivers/staging/media/tegra-vde/vde.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
index 28845b5bafaf..8936f140a246 100644
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
@@ -1069,8 +1071,8 @@ static int tegra_vde_probe(struct platform_device *pdev)
 	 * power-cycle it in order to put hardware into a predictable lower
 	 * power state.
 	 */
-	pm_runtime_get_sync(dev);
-	pm_runtime_put(dev);
+	if (pm_runtime_resume_and_get(dev) >= 0)
+		pm_runtime_put(dev);
 
 	return 0;
 
@@ -1088,8 +1090,9 @@ static int tegra_vde_remove(struct platform_device *pdev)
 {
 	struct tegra_vde *vde = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
+	int ret;
 
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 
@@ -1097,7 +1100,8 @@ static int tegra_vde_remove(struct platform_device *pdev)
 	 * Balance RPM state, the VDE power domain is left ON and hardware
 	 * is clock-gated. It's safe to reboot machine now.
 	 */
-	pm_runtime_put_noidle(dev);
+	if (ret >= 0)
+		pm_runtime_put_noidle(dev);
 	clk_disable_unprepare(vde->clk);
 
 	misc_deregister(&vde->miscdev);
-- 
2.30.2

