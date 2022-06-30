Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2D75626AD
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 01:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232132AbiF3XLg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 19:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232085AbiF3XLe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 19:11:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D000759255
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 16:11:25 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91410E7B;
        Fri,  1 Jul 2022 01:08:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656630489;
        bh=GKNkOsmaDUAra13o+i06bdJmJT/ZL4BhjMtclARPSXU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BCG6ThtztIDCHfr+cyZChMu42Jj3F4uWQkeKLnALI6U7Hapnk+eMY1QtfqPRkk92n
         OhkZQAGGmcSooDrCpIFkFC7+8El/ZHDJpBPYheqCpayNY2oFz6tMglA4Sx3Q2Q1+Mn
         2bFlMn63pA4hiQPDbaYID/2W8A35ZyMDY0yaSYW4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v2 48/55] media: rkisp1: Add match data for i.MX8MP ISP
Date:   Fri,  1 Jul 2022 02:07:06 +0300
Message-Id: <20220630230713.10580-49-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Paul Elder <paul.elder@ideasonboard.com>

Add match data to the rkisp1 driver to match the i.MX8MP ISP.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-dev.c     | 22 +++++++++++++++++++
 include/uapi/linux/rkisp1-config.h            |  3 +++
 2 files changed, 25 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index f2475c6235ea..a41f89807dd7 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -496,6 +496,24 @@ static const struct rkisp1_info rk3399_isp_info = {
 	.features = RKISP1_FEATURE_MIPI_CSI2,
 };
 
+static const char * const imx8mp_isp_clks[] = {
+	"isp",
+	"hclk",
+	"aclk",
+};
+
+static const struct rkisp1_isr_data imx8mp_isp_isrs[] = {
+	{ NULL, rkisp1_isr },
+};
+
+static const struct rkisp1_info imx8mp_isp_info = {
+	.clks = imx8mp_isp_clks,
+	.clk_size = ARRAY_SIZE(imx8mp_isp_clks),
+	.isrs = imx8mp_isp_isrs,
+	.isr_size = ARRAY_SIZE(imx8mp_isp_isrs),
+	.isp_ver = IMX8MP_V10,
+};
+
 static const struct of_device_id rkisp1_of_match[] = {
 	{
 		.compatible = "rockchip,px30-cif-isp",
@@ -505,6 +523,10 @@ static const struct of_device_id rkisp1_of_match[] = {
 		.compatible = "rockchip,rk3399-cif-isp",
 		.data = &rk3399_isp_info,
 	},
+	{
+		.compatible = "fsl,imx8mp-isp",
+		.data = &imx8mp_isp_info,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, rkisp1_of_match);
diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
index 583ca0d9a79d..40677d47825c 100644
--- a/include/uapi/linux/rkisp1-config.h
+++ b/include/uapi/linux/rkisp1-config.h
@@ -140,12 +140,15 @@
  * @RKISP1_V11: declared in the original vendor code, but not used
  * @RKISP1_V12: used at least in rk3326 and px30
  * @RKISP1_V13: used at least in rk1808
+ * @IMX8MP_V10: used in at least imx8mp
  */
 enum rkisp1_cif_isp_version {
 	RKISP1_V10 = 10,
 	RKISP1_V11,
 	RKISP1_V12,
 	RKISP1_V13,
+	/* TODO Choose a better version for this */
+	IMX8MP_V10,
 };
 
 enum rkisp1_cif_isp_histogram_mode {
-- 
Regards,

Laurent Pinchart

