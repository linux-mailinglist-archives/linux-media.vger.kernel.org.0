Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38BFF369F5E
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237422AbhDXGrC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:47:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:35726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229682AbhDXGqP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 617BF61629;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=RRNI/XcWNU/RuS+rdQ4ZLEgZbvA4GIVDsHd+QWsqIF0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=or0k9a+J3ADO8YB/0DbxauzYDJZNi/nOzh9IW/q3WdpTEYIt55ZpVzqtWOWdKflrR
         ZRO/qkj4HHU6ijkhCPWH/g2HsF8iLnxsQAkljinBGBzMqcy2I9WU7RywaZn7csL6gP
         Dw/ZcPCL8yLN1YmrsYY49RLwdMbQf8hAxAFfoZfqFg4zVDYPxP2PRzagCORNEynRjh
         9E5HDkNjHaWZ1nx6O1+7A3pCoKZvlt2m6XAPgS9qyk0bh0XtYOkr0ahCuWyrUZeKJ1
         ebUae87vtPECEN2fnmUNQZBEGcvCBG236hOzpMPPxanaF3UTzPyxdyk57ThMNr4K5v
         hMhEHmW0ZRyPA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2m-004JgW-Il; Sat, 24 Apr 2021 08:45:32 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH 58/78] media: exynos-gsc: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:45:08 +0200
Message-Id: <9c7d683907b9f9cf4a99f57f978671ec7f5a1dbc.1619191723.git.mchehab+huawei@kernel.org>
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
 drivers/media/platform/exynos-gsc/gsc-core.c | 3 +--
 drivers/media/platform/exynos-gsc/gsc-m2m.c  | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/exynos-gsc/gsc-core.c b/drivers/media/platform/exynos-gsc/gsc-core.c
index 9f41c2e7097a..9d5841194f6b 100644
--- a/drivers/media/platform/exynos-gsc/gsc-core.c
+++ b/drivers/media/platform/exynos-gsc/gsc-core.c
@@ -1210,7 +1210,7 @@ static int gsc_remove(struct platform_device *pdev)
 	struct gsc_dev *gsc = platform_get_drvdata(pdev);
 	int i;
 
-	pm_runtime_get_sync(&pdev->dev);
+	pm_runtime_resume_and_get(&pdev->dev);
 
 	gsc_unregister_m2m_device(gsc);
 	v4l2_device_unregister(&gsc->v4l2_dev);
@@ -1219,7 +1219,6 @@ static int gsc_remove(struct platform_device *pdev)
 	for (i = 0; i < gsc->num_clocks; i++)
 		clk_disable_unprepare(gsc->clock[i]);
 
-	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
 	dev_dbg(&pdev->dev, "%s driver unloaded\n", pdev->name);
diff --git a/drivers/media/platform/exynos-gsc/gsc-m2m.c b/drivers/media/platform/exynos-gsc/gsc-m2m.c
index 27a3c92c73bc..09551e96ac15 100644
--- a/drivers/media/platform/exynos-gsc/gsc-m2m.c
+++ b/drivers/media/platform/exynos-gsc/gsc-m2m.c
@@ -58,7 +58,7 @@ static int gsc_m2m_start_streaming(struct vb2_queue *q, unsigned int count)
 	struct gsc_ctx *ctx = q->drv_priv;
 	int ret;
 
-	ret = pm_runtime_get_sync(&ctx->gsc_dev->pdev->dev);
+	ret = pm_runtime_resume_and_get(&ctx->gsc_dev->pdev->dev);
 	return ret > 0 ? 0 : ret;
 }
 
-- 
2.30.2

