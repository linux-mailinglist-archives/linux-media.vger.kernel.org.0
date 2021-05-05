Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0B3C3737C1
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 11:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232466AbhEEJnR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 05:43:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:48246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232109AbhEEJnQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 05:43:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7FEB613D6;
        Wed,  5 May 2021 09:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620207738;
        bh=mnwOoPbSt3peAjkyotn8X7kUrTzZPsSiyyacWXI13wM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bgfruVEEULYmgG8/EtzRxyrlkAlbXqpxHyLYWRYORK3lTHHwyE7wPJ96drcdorIc1
         D4GndNvQT0xO0M8kqfe9fdMGZ13MftfEJ7aNDQXUnKYnhAxqwIEdivyt2LzNIvHgyG
         kHJIUUIyHL9ZZYkaxLrCB/jUI08u1rsRDK6zvm+J6e+8CUZoomYLuKMeHIxlOx4oa3
         hj57c8Kq3+kCxjge4PuopSuXt+QDkKzP81q4VppzM+6p+GxklFiqhfK0P8dhMUHExH
         Ob4zfKSovQbjxrWNOnQ9cG8JpzDBcP0SS/LqlwzybnI4AsnfAwCYVx0qI5iYi3PNX7
         cjyOBBv8BA+iw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1leE2q-00AHw9-Sx; Wed, 05 May 2021 11:42:16 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH 07/25] media: exynos-gsc: don't resume at remove time
Date:   Wed,  5 May 2021 11:41:57 +0200
Message-Id: <f90e4f9b1dbc71f2a598f057a93dffc69fa3850d.1620207353.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620207353.git.mchehab+huawei@kernel.org>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
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

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/exynos-gsc/gsc-core.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/exynos-gsc/gsc-core.c b/drivers/media/platform/exynos-gsc/gsc-core.c
index 9f41c2e7097a..f49f3322f835 100644
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
 
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		for (i = 0; i < gsc->num_clocks; i++)
+			clk_disable_unprepare(gsc->clock[i]);
+
+	pm_runtime_set_suspended(&pdev->dev);
+
 	dev_dbg(&pdev->dev, "%s driver unloaded\n", pdev->name);
 	return 0;
 }
-- 
2.30.2

