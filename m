Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17F5F36C3AB
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:29:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238374AbhD0K3M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:29:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:48146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237224AbhD0K2S (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8CA386141F;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=TKtKuWw4arj9gE1QW5A97zHnmgQIngfUHjaR8gvLIr8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rUr3XgQuedmLRMxjU5/vIt9xq3JpbinPSkcPt7Dz1Nr7mpIwQU54XeKkV2+9fauMg
         UtwDc1uiaw4jUHBLclcuWpvNy7kKe/oIedeoS5hRLUKpLKCyQ0pFkMvOQH22vWhCTR
         gtT9bNbpZuSJNag3ObXD/ra+CB3+kP2q9tBhMoTJfZscEh7B/A9HY42AXeKkfBYKgT
         ZEZHvMbEEJq8/S9BMQAIv+ptY+MyDDODXUxs8X31QH1/1dLZixmyRieoCnXGGo8gXe
         eJ1mFW1Si0KDKVNyKkvCfk/+hPAIwPie8MgfkJ91EGfb7sG8jysDUPg4Tus9jmR/DI
         izVJtK3Pm7u9A==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvy-000o2G-Hs; Tue, 27 Apr 2021 12:27:14 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 63/79] media: exynos-gsc: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:53 +0200
Message-Id: <5a8d3ca13956feb5e611cb1fe08195966be5edf2.1619519080.git.mchehab+huawei@kernel.org>
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

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/exynos-gsc/gsc-m2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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

