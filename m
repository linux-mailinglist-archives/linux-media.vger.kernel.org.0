Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52F3F369F55
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237327AbhDXGqx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:46:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:35772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233122AbhDXGqO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 576E661625;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=29dlXhk6dfH+e+FLSh4QvzO2Qlv5HDysHp3akNDzvhw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JZ1lJmlV0lfb+3SDV2UTpmqQfyU5LTjhoRqwNsbEBA7AdIM1Gyob1SF+7GxmJhpeM
         ydJ6WcwDhwlGascRxGQJ8KKnkt4ARlpzYwOrHfCUNtEXJRGlAucjxOk9wbCH9c8IWr
         cUe1/Fgw+gE0+MwJrVxSWalhH7gam4x5o9CDsmXLiw6yMcMhK7Nrete+lsK/+GF7io
         fFwEHSfzHy3PLKJlO9AUto6pmgIgRa0470RiQjHeCvlFHbAe+1SCvgpzOpPj3HY3m2
         554i6Bsa79mo/Tcd1qlc670t35mW30ewMTGx45YYgdciBxwyoa6BI2foONKhi3VJyN
         dHrT9iK1n1nzQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2m-004JgT-He; Sat, 24 Apr 2021 08:45:32 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH 57/78] media: exynos4-is: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:45:07 +0200
Message-Id: <091915bb1cbec13b566d129f85ae229fcb92e2e4.1619191723.git.mchehab+huawei@kernel.org>
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
 drivers/media/platform/exynos4-is/fimc-capture.c   | 6 ++----
 drivers/media/platform/exynos4-is/fimc-is.c        | 3 ++-
 drivers/media/platform/exynos4-is/fimc-isp-video.c | 3 +--
 drivers/media/platform/exynos4-is/fimc-isp.c       | 7 +++----
 drivers/media/platform/exynos4-is/fimc-lite.c      | 5 +++--
 drivers/media/platform/exynos4-is/fimc-m2m.c       | 2 +-
 drivers/media/platform/exynos4-is/media-dev.c      | 8 +++-----
 drivers/media/platform/exynos4-is/mipi-csis.c      | 5 ++---
 8 files changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/fimc-capture.c b/drivers/media/platform/exynos4-is/fimc-capture.c
index 13c838d3f947..0da36443173c 100644
--- a/drivers/media/platform/exynos4-is/fimc-capture.c
+++ b/drivers/media/platform/exynos4-is/fimc-capture.c
@@ -478,11 +478,9 @@ static int fimc_capture_open(struct file *file)
 		goto unlock;
 
 	set_bit(ST_CAPT_BUSY, &fimc->state);
-	ret = pm_runtime_get_sync(&fimc->pdev->dev);
-	if (ret < 0) {
-		pm_runtime_put_sync(&fimc->pdev->dev);
+	ret = pm_runtime_resume_and_get(&fimc->pdev->dev);
+	if (ret < 0)
 		goto unlock;
-	}
 
 	ret = v4l2_fh_open(file);
 	if (ret) {
diff --git a/drivers/media/platform/exynos4-is/fimc-is.c b/drivers/media/platform/exynos4-is/fimc-is.c
index 972d9601d236..bca35866cc74 100644
--- a/drivers/media/platform/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/exynos4-is/fimc-is.c
@@ -828,7 +828,7 @@ static int fimc_is_probe(struct platform_device *pdev)
 			goto err_irq;
 	}
 
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
 		goto err_pm;
 
@@ -862,6 +862,7 @@ static int fimc_is_probe(struct platform_device *pdev)
 	fimc_is_unregister_subdevs(is);
 err_pm:
 	pm_runtime_put_noidle(dev);
+err_suspend:
 	if (!pm_runtime_enabled(dev))
 		fimc_is_runtime_suspend(dev);
 err_irq:
diff --git a/drivers/media/platform/exynos4-is/fimc-isp-video.c b/drivers/media/platform/exynos4-is/fimc-isp-video.c
index 612b9872afc8..8d9dc597deaa 100644
--- a/drivers/media/platform/exynos4-is/fimc-isp-video.c
+++ b/drivers/media/platform/exynos4-is/fimc-isp-video.c
@@ -275,7 +275,7 @@ static int isp_video_open(struct file *file)
 	if (ret < 0)
 		goto unlock;
 
-	ret = pm_runtime_get_sync(&isp->pdev->dev);
+	ret = pm_runtime_resume_and_get(&isp->pdev->dev);
 	if (ret < 0)
 		goto rel_fh;
 
@@ -293,7 +293,6 @@ static int isp_video_open(struct file *file)
 	if (!ret)
 		goto unlock;
 rel_fh:
-	pm_runtime_put_noidle(&isp->pdev->dev);
 	v4l2_fh_release(file);
 unlock:
 	mutex_unlock(&isp->video_lock);
diff --git a/drivers/media/platform/exynos4-is/fimc-isp.c b/drivers/media/platform/exynos4-is/fimc-isp.c
index a77c49b18511..74b49d30901e 100644
--- a/drivers/media/platform/exynos4-is/fimc-isp.c
+++ b/drivers/media/platform/exynos4-is/fimc-isp.c
@@ -304,11 +304,10 @@ static int fimc_isp_subdev_s_power(struct v4l2_subdev *sd, int on)
 	pr_debug("on: %d\n", on);
 
 	if (on) {
-		ret = pm_runtime_get_sync(&is->pdev->dev);
-		if (ret < 0) {
-			pm_runtime_put(&is->pdev->dev);
+		ret = pm_runtime_resume_and_get(&is->pdev->dev);
+		if (ret < 0)
 			return ret;
-		}
+
 		set_bit(IS_ST_PWR_ON, &is->state);
 
 		ret = fimc_is_start_firmware(is);
diff --git a/drivers/media/platform/exynos4-is/fimc-lite.c b/drivers/media/platform/exynos4-is/fimc-lite.c
index fe20af3a7178..4d8b18078ff3 100644
--- a/drivers/media/platform/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/exynos4-is/fimc-lite.c
@@ -469,9 +469,9 @@ static int fimc_lite_open(struct file *file)
 	}
 
 	set_bit(ST_FLITE_IN_USE, &fimc->state);
-	ret = pm_runtime_get_sync(&fimc->pdev->dev);
+	ret = pm_runtime_resume_and_get(&fimc->pdev->dev);
 	if (ret < 0)
-		goto err_pm;
+		goto err_in_use;
 
 	ret = v4l2_fh_open(file);
 	if (ret < 0)
@@ -499,6 +499,7 @@ static int fimc_lite_open(struct file *file)
 	v4l2_fh_release(file);
 err_pm:
 	pm_runtime_put_sync(&fimc->pdev->dev);
+err_in_use:
 	clear_bit(ST_FLITE_IN_USE, &fimc->state);
 unlock:
 	mutex_unlock(&fimc->lock);
diff --git a/drivers/media/platform/exynos4-is/fimc-m2m.c b/drivers/media/platform/exynos4-is/fimc-m2m.c
index c9704a147e5c..7c1eb05c508f 100644
--- a/drivers/media/platform/exynos4-is/fimc-m2m.c
+++ b/drivers/media/platform/exynos4-is/fimc-m2m.c
@@ -75,7 +75,7 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 	struct fimc_ctx *ctx = q->drv_priv;
 	int ret;
 
-	ret = pm_runtime_get_sync(&ctx->fimc_dev->pdev->dev);
+	ret = pm_runtime_resume_and_get(&ctx->fimc_dev->pdev->dev);
 	return ret > 0 ? 0 : ret;
 }
 
diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index 13d192ba4aa6..9346d44a06c2 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -512,11 +512,9 @@ static int fimc_md_register_sensor_entities(struct fimc_md *fmd)
 	if (!fmd->pmf)
 		return -ENXIO;
 
-	ret = pm_runtime_get_sync(fmd->pmf);
-	if (ret < 0) {
-		pm_runtime_put(fmd->pmf);
+	ret = pm_runtime_resume_and_get(fmd->pmf);
+	if (ret < 0)
 		return ret;
-	}
 
 	fmd->num_sensors = 0;
 
@@ -1291,7 +1289,7 @@ static int cam_clk_prepare(struct clk_hw *hw)
 	if (camclk->fmd->pmf == NULL)
 		return -ENODEV;
 
-	ret = pm_runtime_get_sync(camclk->fmd->pmf);
+	ret = pm_runtime_resume_and_get(camclk->fmd->pmf);
 	return ret < 0 ? ret : 0;
 }
 
diff --git a/drivers/media/platform/exynos4-is/mipi-csis.c b/drivers/media/platform/exynos4-is/mipi-csis.c
index 1aac167abb17..a0218237d66b 100644
--- a/drivers/media/platform/exynos4-is/mipi-csis.c
+++ b/drivers/media/platform/exynos4-is/mipi-csis.c
@@ -494,7 +494,7 @@ static int s5pcsis_s_power(struct v4l2_subdev *sd, int on)
 	struct device *dev = &state->pdev->dev;
 
 	if (on)
-		return pm_runtime_get_sync(dev);
+		return pm_runtime_resume_and_get(dev);
 
 	return pm_runtime_put_sync(dev);
 }
@@ -509,9 +509,8 @@ static int s5pcsis_s_stream(struct v4l2_subdev *sd, int enable)
 
 	if (enable) {
 		s5pcsis_clear_counters(state);
-		ret = pm_runtime_get_sync(&state->pdev->dev);
+		ret = pm_runtime_resume_and_get(&state->pdev->dev);
 		if (ret && ret != 1) {
-			pm_runtime_put_noidle(&state->pdev->dev);
 			return ret;
 		}
 	}
-- 
2.30.2

