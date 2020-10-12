Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B00628C3A2
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 23:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731847AbgJLVAF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 17:00:05 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49824 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731635AbgJLU65 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 16:58:57 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aratiu)
        with ESMTPSA id CCE311F44C34
From:   Adrian Ratiu <adrian.ratiu@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Mark Brown <broonie@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fruehberger Peter <Peter.Fruehberger@de.bosch.com>,
        kuhanh.murugasen.krishnan@intel.com,
        Daniel Vetter <daniel@ffwll.ch>, kernel@collabora.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 05/18] media: hantro: prepare clocks before variant inits are run
Date:   Mon, 12 Oct 2020 23:59:44 +0300
Message-Id: <20201012205957.889185-6-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012205957.889185-1-adrian.ratiu@collabora.com>
References: <20201012205957.889185-1-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The fundamental idea is: clocks are prepared in the driver probe() then
each use-case will enable/disable them as needed.

Some variants like imx8mq need to have the clocks enabled during the
HW init phase, so they will benefit from having the clocks prepared
before the variant init callback to avoid duing a full prepare_enable/
unprepare_disable, so move the clk prepare a bit earlier.

Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
 drivers/staging/media/hantro/hantro_drv.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index c2ea54552ce9..3734efa80a7e 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -813,22 +813,22 @@ static int hantro_probe(struct platform_device *pdev)
 		}
 	}
 
+	ret = clk_bulk_prepare(vpu->variant->num_clocks, vpu->clocks);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to prepare clocks\n");
+		return ret;
+	}
+
 	ret = vpu->variant->init(vpu);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to init VPU hardware\n");
-		return ret;
+		goto err_clk_unprepare;
 	}
 
 	pm_runtime_set_autosuspend_delay(vpu->dev, 100);
 	pm_runtime_use_autosuspend(vpu->dev);
 	pm_runtime_enable(vpu->dev);
 
-	ret = clk_bulk_prepare(vpu->variant->num_clocks, vpu->clocks);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to prepare clocks\n");
-		return ret;
-	}
-
 	ret = v4l2_device_register(&pdev->dev, &vpu->v4l2_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register v4l2 device\n");
-- 
2.28.0

