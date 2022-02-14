Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 938474B5A1D
	for <lists+linux-media@lfdr.de>; Mon, 14 Feb 2022 19:43:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234027AbiBNSm5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Feb 2022 13:42:57 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:55950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238276AbiBNSm4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Feb 2022 13:42:56 -0500
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A720A6A06C
        for <linux-media@vger.kernel.org>; Mon, 14 Feb 2022 10:42:38 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id A628A1C0009;
        Mon, 14 Feb 2022 18:42:27 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     slongerbeam@gmail.com, p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        martin.kepplinger@puri.sm, rmfrfs@gmail.com,
        xavier.roumegue@oss.nxp.com, alexander.stein@ew.tq-group.com,
        dorota.czaplejewicz@puri.sm
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH 3/8] staging: media: imx: Add more compatible strings
Date:   Mon, 14 Feb 2022 19:43:13 +0100
Message-Id: <20220214184318.409208-4-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220214184318.409208-1-jacopo@jmondi.org>
References: <20220214184318.409208-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The imx7-media-csi driver controls the CSI (CMOS Sensor Interface)
peripheral available on several SoC of different generations.

The current situation when it comes to compatible strings is rather
confused:
- Bindings document imx6ul, imx7 and imx8mm
- Driver supports imx6ul, imx7 and imx8mq
- The IMX8MM and IMX8MQ DTS use the correct compatible strings with a
  fallback to the generic "imx7-csi" identifier:
  arch/arm64/boot/dts/freescale/imx8mq.dtsi: compatible = "fsl,imx8mq-csi",
  arch/arm64/boot/dts/freescale/imx8mm.dtsi: compatible = "fsl,imx8mm-csi",

Tidy-up the situation by adding the IMX8MQ compatible string to the
bindings documentation andathe IMX8MM identifier to the driver, to allow
to distinguish the SoC the CSI peripheral is integrated on in the
following patches.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml | 1 +
 drivers/staging/media/imx/imx7-media-csi.c                | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml b/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
index 4f7b78265336..0f1505d85111 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
@@ -21,6 +21,7 @@ properties:
           - fsl,imx7-csi
           - fsl,imx6ul-csi
       - items:
+          - const: fsl,imx8mq-csi
           - const: fsl,imx8mm-csi
           - const: fsl,imx7-csi
 
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 32311fc0e2a4..59100e409709 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -162,6 +162,7 @@
 enum imx_csi_model {
 	IMX7_CSI_IMX7 = 0,
 	IMX7_CSI_IMX8MQ,
+	IMX7_CSI_IMX8MM,
 };
 
 struct imx7_csi {
@@ -1277,6 +1278,7 @@ static int imx7_csi_remove(struct platform_device *pdev)
 
 static const struct of_device_id imx7_csi_of_match[] = {
 	{ .compatible = "fsl,imx8mq-csi", .data = (void *)IMX7_CSI_IMX8MQ },
+	{ .compatible = "fsl,imx8mm-csi", .data = (void *)IMX7_CSI_IMX8MM },
 	{ .compatible = "fsl,imx7-csi", .data = (void *)IMX7_CSI_IMX7 },
 	{ .compatible = "fsl,imx6ul-csi", .data = (void *)IMX7_CSI_IMX7 },
 	{ },
-- 
2.35.0

