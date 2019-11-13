Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 911DEFAA46
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2019 07:37:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbfKMGho (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Nov 2019 01:37:44 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38017 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbfKMGho (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Nov 2019 01:37:44 -0500
Received: by mail-pg1-f194.google.com with SMTP id 15so734253pgh.5;
        Tue, 12 Nov 2019 22:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hBMWNBe+ajGPyroH9xX0CnOxEfxyrNH26XF/4DoPOfI=;
        b=e861HBFaQDhUO0OFaRlI921rTJYFWvqygV2ToxRWlZ1iGhl6xTLV+oe+rcw9zefXe4
         ivCZCMu/5DO2kblI7BKZABJw8VS9iIUvBp7AZFY6ozBwbIC6lHLYFWGSdaJGKA34yEDX
         xEkHpFNQFEIDi+8Ne4mspjIlzNpIkmJolzso8GnZYMxF5ugXJZ0M/uZAeIEiv5w+rkCe
         Bhr2GLEj0uvfxWMrIiAJ2LW9pSVjxzRcUCiKE/C63QmMlt0wSk7eUZJbneYmbDPuWX/j
         M9nnd/Cvt9txjUKHStew8gOh0SWui+6cvIYJyaTi0WS7tJChPizT8whnqtCZzje36iQv
         xV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hBMWNBe+ajGPyroH9xX0CnOxEfxyrNH26XF/4DoPOfI=;
        b=CPJQB4t6i+WD9mKNiBDAF4UMhUUR2NbKLFtnMormq9rO0J0nPObT6WN5/usNy5jYfq
         pnkDc2zTERMtHUiOpRQLRQ1Wa+AJHARDFfMNlORTC2b//u/Lc+WmeEhNR66U5oOWMDi2
         D/Fy1pd8uO3SVypjOJm7eq/OZmaRnGkrCYMl6f0fKTO9r71HKTb3MoU8tYFTvHYWtn6x
         Ea1xh24F+6NAjAeEMniuGM9a4BtpGFk50rtEDBGFkxIn6EuO8YPIEXVZ61Cl5VoXs4HT
         AJ8nJmo6eqjg/wcU0G3kNo2SBxB3+1gpr1kXKaFLLdcuIbIzNjhk3cEj6NsYtX/3jb8f
         QoPw==
X-Gm-Message-State: APjAAAUQwZ+zqQdG5O9C1+SKeSTQ4sGLUd+gLXUlidqLWd1gXIYpOJ3e
        HWY/D4MGH38rdEx3MocVtS8=
X-Google-Smtp-Source: APXvYqy40KGHXqbelELr+lYDHJEuaYs0EaC1n8Pm3xmcoICsDTL2PnlNVDt21bFbKKyTN6JSeOHFKg==
X-Received: by 2002:a63:1323:: with SMTP id i35mr1890724pgl.450.1573627063430;
        Tue, 12 Nov 2019 22:37:43 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id c184sm1411329pfc.159.2019.11.12.22.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 22:37:42 -0800 (PST)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Fabien Dessenne <fabien.dessenne@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] media: bdisp: add missed destroy_workqueue in remove and probe failure
Date:   Wed, 13 Nov 2019 14:37:30 +0800
Message-Id: <20191113063730.8776-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver forgets to call destroy_workqueue when remove and probe fails.
Add the missed calls to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/sti/bdisp/bdisp-v4l2.c b/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
index e90f1ba30574..4c0b36236a38 100644
--- a/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
+++ b/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
@@ -1275,6 +1275,8 @@ static int bdisp_remove(struct platform_device *pdev)
 	if (!IS_ERR(bdisp->clock))
 		clk_unprepare(bdisp->clock);
 
+	destroy_workqueue(bdisp->work_queue);
+
 	dev_dbg(&pdev->dev, "%s driver unloaded\n", pdev->name);
 
 	return 0;
@@ -1318,20 +1320,22 @@ static int bdisp_probe(struct platform_device *pdev)
 	bdisp->regs = devm_ioremap_resource(dev, res);
 	if (IS_ERR(bdisp->regs)) {
 		dev_err(dev, "failed to get regs\n");
-		return PTR_ERR(bdisp->regs);
+		ret = PTR_ERR(bdisp->regs);
+		goto err_wq;
 	}
 
 	bdisp->clock = devm_clk_get(dev, BDISP_NAME);
 	if (IS_ERR(bdisp->clock)) {
 		dev_err(dev, "failed to get clock\n");
-		return PTR_ERR(bdisp->clock);
+		ret = PTR_ERR(bdisp->clock);
+		goto err_wq;
 	}
 
 	ret = clk_prepare(bdisp->clock);
 	if (ret < 0) {
 		dev_err(dev, "clock prepare failed\n");
 		bdisp->clock = ERR_PTR(-EINVAL);
-		return ret;
+		goto err_wq;
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
@@ -1403,7 +1407,8 @@ static int bdisp_probe(struct platform_device *pdev)
 err_clk:
 	if (!IS_ERR(bdisp->clock))
 		clk_unprepare(bdisp->clock);
-
+err_wq:
+	destroy_workqueue(bdisp->work_queue);
 	return ret;
 }
 
-- 
2.23.0

