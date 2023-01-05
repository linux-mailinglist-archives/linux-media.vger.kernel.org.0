Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE32265EE67
	for <lists+linux-media@lfdr.de>; Thu,  5 Jan 2023 15:10:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233429AbjAEOKd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Jan 2023 09:10:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234081AbjAENt1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Jan 2023 08:49:27 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1AD94F113
        for <linux-media@vger.kernel.org>; Thu,  5 Jan 2023 05:47:41 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pDQah-0003Qn-Vi; Thu, 05 Jan 2023 14:47:32 +0100
Received: from [2a0a:edc0:0:900:1d::48] (helo=litschi)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mtr@pengutronix.de>)
        id 1pDQag-0040LR-Jx; Thu, 05 Jan 2023 14:47:30 +0100
Received: from mtr by litschi with local (Exim 4.94.2)
        (envelope-from <mtr@pengutronix.de>)
        id 1pDQaf-000FVM-Jn; Thu, 05 Jan 2023 14:47:29 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 5/8] media: imx-pxp: disable LUT block
Date:   Thu,  5 Jan 2023 14:47:26 +0100
Message-Id: <20230105134729.59542-6-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230105134729.59542-1-m.tretter@pengutronix.de>
References: <20230105134729.59542-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The LUT block is always configured in bypass mode.

Take it entirely out of the pipeline by disabling it and routing the
data path around the LUT.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/nxp/imx-pxp.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index 6ffd07cda965..1d649b9cadad 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -737,11 +737,10 @@ static u32 pxp_data_path_ctrl0(struct pxp_ctx *ctx)
 	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX13_SEL(3);
 	/* Select Rotation */
 	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX12_SEL(0);
-	/* Select LUT */
-	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX11_SEL(0);
+	/* Bypass LUT */
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX11_SEL(1);
 	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX10_SEL(3);
-	/* Select MUX8 for LUT */
-	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX9_SEL(1);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX9_SEL(3);
 	/* Select CSC 2 */
 	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX8_SEL(0);
 	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX7_SEL(3);
@@ -966,7 +965,7 @@ static int pxp_start(struct pxp_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
 	/* ungate, enable PS/AS/OUT and PXP operation */
 	writel(BM_PXP_CTRL_IRQ_ENABLE, dev->mmio + HW_PXP_CTRL_SET);
 	writel(BM_PXP_CTRL_ENABLE | BM_PXP_CTRL_ENABLE_CSC2 |
-	       BM_PXP_CTRL_ENABLE_LUT | BM_PXP_CTRL_ENABLE_ROTATE0 |
+	       BM_PXP_CTRL_ENABLE_ROTATE0 |
 	       BM_PXP_CTRL_ENABLE_PS_AS_OUT, dev->mmio + HW_PXP_CTRL_SET);
 
 	return 0;
-- 
2.30.2

