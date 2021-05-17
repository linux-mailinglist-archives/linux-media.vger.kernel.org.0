Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A728382C88
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 14:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237106AbhEQMuj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 08:50:39 -0400
Received: from mail.ispras.ru ([83.149.199.84]:47958 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231591AbhEQMuj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 08:50:39 -0400
Received: from hellwig.intra.ispras.ru (unknown [10.10.2.182])
        by mail.ispras.ru (Postfix) with ESMTPS id 167104076B58;
        Mon, 17 May 2021 12:49:21 +0000 (UTC)
From:   Evgeny Novikov <novikov@ispras.ru>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Evgeny Novikov <novikov@ispras.ru>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        ldv-project@linuxtesting.org
Subject: [PATCH] media: v4l: cadence: Handle errors of clk_prepare_enable()
Date:   Mon, 17 May 2021 15:49:18 +0300
Message-Id: <20210517124918.18641-1-novikov@ispras.ru>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Handle errors of clk_prepare_enable() in csi2tx_get_resources().

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
---
 drivers/media/platform/cadence/cdns-csi2tx.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2tx.c b/drivers/media/platform/cadence/cdns-csi2tx.c
index e4d08acfbb49..765ae408970a 100644
--- a/drivers/media/platform/cadence/cdns-csi2tx.c
+++ b/drivers/media/platform/cadence/cdns-csi2tx.c
@@ -436,6 +436,7 @@ static int csi2tx_get_resources(struct csi2tx_priv *csi2tx,
 	struct resource *res;
 	unsigned int i;
 	u32 dev_cfg;
+	int ret;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	csi2tx->base = devm_ioremap_resource(&pdev->dev, res);
@@ -454,7 +455,12 @@ static int csi2tx_get_resources(struct csi2tx_priv *csi2tx,
 		return PTR_ERR(csi2tx->esc_clk);
 	}
 
-	clk_prepare_enable(csi2tx->p_clk);
+	ret = clk_prepare_enable(csi2tx->p_clk);
+	if (ret) {
+		dev_err(&pdev->dev, "Couldn't prepare and enable p_clk\n");
+		return ret;
+	}
+
 	dev_cfg = readl(csi2tx->base + CSI2TX_DEVICE_CONFIG_REG);
 	clk_disable_unprepare(csi2tx->p_clk);
 
-- 
2.26.2

