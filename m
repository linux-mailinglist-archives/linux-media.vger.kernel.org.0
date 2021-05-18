Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3DFA388010
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 20:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244636AbhERS6p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 14:58:45 -0400
Received: from mail.ispras.ru ([83.149.199.84]:35746 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239247AbhERS6o (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 14:58:44 -0400
Received: from hellwig.intra.ispras.ru (unknown [10.10.2.182])
        by mail.ispras.ru (Postfix) with ESMTPS id BBA36407624A;
        Tue, 18 May 2021 18:57:24 +0000 (UTC)
From:   Evgeny Novikov <novikov@ispras.ru>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Evgeny Novikov <novikov@ispras.ru>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        ldv-project@linuxtesting.org
Subject: [PATCH] media: v4l: cadence: Handle errors of clk_prepare_enable()
Date:   Tue, 18 May 2021 21:57:22 +0300
Message-Id: <20210518185722.4944-1-novikov@ispras.ru>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Handle errors of clk_prepare_enable() in csi2rx_get_resources().

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index c68a3eac62cd..f2b4ddd31177 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -282,6 +282,7 @@ static int csi2rx_get_resources(struct csi2rx_priv *csi2rx,
 	struct resource *res;
 	unsigned char i;
 	u32 dev_cfg;
+	int ret;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	csi2rx->base = devm_ioremap_resource(&pdev->dev, res);
@@ -315,7 +316,12 @@ static int csi2rx_get_resources(struct csi2rx_priv *csi2rx,
 		return -EINVAL;
 	}
 
-	clk_prepare_enable(csi2rx->p_clk);
+	ret = clk_prepare_enable(csi2rx->p_clk);
+	if (ret) {
+		dev_err(&pdev->dev, "Couldn't prepare and enable P clock\n");
+		return ret;
+	}
+
 	dev_cfg = readl(csi2rx->base + CSI2RX_DEVICE_CFG_REG);
 	clk_disable_unprepare(csi2rx->p_clk);
 
-- 
2.26.2

