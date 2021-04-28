Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D837C36DA07
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240308AbhD1Oxe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:53:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:35918 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240271AbhD1Ox3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C8FBF6144B;
        Wed, 28 Apr 2021 14:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621563;
        bh=gtR1SkTiYJ9WApgVEIkptCtIXyrWDvbS/bAOqzd9AhE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gui+r5mJheRBaT22aO45UqdlZpSqT3zQNryWIJ3tgxQsIurCryHjrbsq/jbdeGMs0
         023zuja4D3XR8G280J5skQNG/R3/UneayZ0i/1mdelWGommQEvO+7uNuPLCYV0PcZt
         bJ+OME3IvhFDTZlsy2/+Unz3JxPpyv1gixe0930RqL5dB4bA3lidAbyXDsC/o4+9Y5
         NzqOEeyHarutwxhTJcGPCVObkCgs1lJUpSxJPIHPUYKMIBqnFsgnOmyBKAs/w5Ave4
         OxHisHh8zhy1bGGNpC0edJXgfLrysSEh7D3j3Bzk4hfi7r2tzmoHEvuAU4vxhqR6c3
         ycWEI0B0NRP+w==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYP-001Dpv-OZ; Wed, 28 Apr 2021 16:52:41 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH v4 07/79] media: exynos-gsc: don't resume at remove time
Date:   Wed, 28 Apr 2021 16:51:28 +0200
Message-Id: <210a2eee928d2ae7aee65e177f20cfb3f00e29ee.1619621413.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Calling pm_runtime_get_sync() at driver's removal time is not
needed, as this will resume PM runtime. Also, the PM runtime
code at pm_runtime_disable() already calls it, if it detects
the need.

So, change the logic in order to disable PM runtime earlier.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/exynos-gsc/gsc-core.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/exynos-gsc/gsc-core.c b/drivers/media/platform/exynos-gsc/gsc-core.c
index 9f41c2e7097a..8b943075c503 100644
--- a/drivers/media/platform/exynos-gsc/gsc-core.c
+++ b/drivers/media/platform/exynos-gsc/gsc-core.c
@@ -1210,18 +1210,19 @@ static int gsc_remove(struct platform_device *pdev)
 	struct gsc_dev *gsc = platform_get_drvdata(pdev);
 	int i;
 
-	pm_runtime_get_sync(&pdev->dev);
-
 	gsc_unregister_m2m_device(gsc);
 	v4l2_device_unregister(&gsc->v4l2_dev);
 
 	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
-	for (i = 0; i < gsc->num_clocks; i++)
-		clk_disable_unprepare(gsc->clock[i]);
 
-	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
+	if (!pm_runtime_status_suspended(dev))
+		for (i = 0; i < gsc->num_clocks; i++)
+			clk_disable_unprepare(gsc->clock[i]);
+
+	pm_runtime_set_suspended(dev);
+
 	dev_dbg(&pdev->dev, "%s driver unloaded\n", pdev->name);
 	return 0;
 }
-- 
2.30.2

