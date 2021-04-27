Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C085336C37C
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238055AbhD0K2f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:28:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:48150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230341AbhD0K2F (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26551613DC;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=f7qp1inQpFhzLXGKfN6L+okBW8R7Adck1d72J+XCiZM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Nk63xs/U5+H50yDNDVtINBdbnbVjdI0k1ER0vB6Hueg8zEeM20wKRYFpCgZB6IzI6
         4DgCSqWfQuKbb+nAiQOEuJi+2A4CAVyRS+61A0W7pDU4zZmZaMOZg2ld/q0xsLEd5E
         A6PnPJqgPN/61bhxJgGkIJ/mmX4qVJNpH0hSlCDv2hvWNvtwEqBz6IDuhcyYs+h8/p
         mkwJQ+WEp427ZpNOk1w6SEqZtGBTTkf82tdvOKiU4Dtrg+5m24F+LgZIGUdVSqzfrt
         5HLBeRQfWE3CYhPOGIep8lw7SSmxc6CTu56a0PI0XPkjlG37DtPhmlQy2QWc+FKR7V
         oH1idtQg/J8dQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvv-000nzV-3G; Tue, 27 Apr 2021 12:27:11 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 06/79] media: exynos-gsc: don't resume at remove time
Date:   Tue, 27 Apr 2021 12:25:56 +0200
Message-Id: <a561d9eb253076cbcb9debe5fcbd3c949d5023d2.1619519080.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619519080.git.mchehab+huawei@kernel.org>
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
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

So, simplify the code by getting rid of that.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/exynos-gsc/gsc-core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/platform/exynos-gsc/gsc-core.c b/drivers/media/platform/exynos-gsc/gsc-core.c
index 9f41c2e7097a..70e86cdc1012 100644
--- a/drivers/media/platform/exynos-gsc/gsc-core.c
+++ b/drivers/media/platform/exynos-gsc/gsc-core.c
@@ -1210,8 +1210,6 @@ static int gsc_remove(struct platform_device *pdev)
 	struct gsc_dev *gsc = platform_get_drvdata(pdev);
 	int i;
 
-	pm_runtime_get_sync(&pdev->dev);
-
 	gsc_unregister_m2m_device(gsc);
 	v4l2_device_unregister(&gsc->v4l2_dev);
 
@@ -1219,7 +1217,6 @@ static int gsc_remove(struct platform_device *pdev)
 	for (i = 0; i < gsc->num_clocks; i++)
 		clk_disable_unprepare(gsc->clock[i]);
 
-	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
 	dev_dbg(&pdev->dev, "%s driver unloaded\n", pdev->name);
-- 
2.30.2

