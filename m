Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04D294DE956
	for <lists+linux-media@lfdr.de>; Sat, 19 Mar 2022 17:31:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243653AbiCSQc7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Mar 2022 12:32:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243655AbiCSQc7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Mar 2022 12:32:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43F8423F9D4
        for <linux-media@vger.kernel.org>; Sat, 19 Mar 2022 09:31:37 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 466DB2A51;
        Sat, 19 Mar 2022 17:31:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647707491;
        bh=+I21XNPnxfBFcrpJBAdDAPtZrSNDC7LAAxQbMXt9Tcc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qzB6UzGAgX4y0AyOK3IsOSO1SoTLiQZf9Nfuk3VdiUTif0/qVmJW748ly7ImJCDYt
         E9GjkwddWJj06okP1H2EQGjiUvb+3f6a1b88IO8T2uH8bkQ1Xsu/SXo1LHb+iZbnTn
         9PgIaYrcRz1I3eUkZ9SvhyWOwOJozIlmPSUc6hA0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v3 09/17] media: rkisp1: regs: Rename CCL, ICCL and IRCL registers with VI_ prefix
Date:   Sat, 19 Mar 2022 18:30:52 +0200
Message-Id: <20220319163100.3083-10-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220319163100.3083-1-laurent.pinchart@ideasonboard.com>
References: <20220319163100.3083-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75 autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The documentation names the CCL, ICCL and IRCL registers with a VI_
prefix, like the VI_ID and VI_DPCL registers. Fix the macro names
accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 19 +++---
 .../platform/rockchip/rkisp1/rkisp1-params.c  |  8 +--
 .../platform/rockchip/rkisp1/rkisp1-regs.h    | 60 +++++++++----------
 3 files changed, 44 insertions(+), 43 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index f84e53b60ee1..e8abb57fb728 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -523,20 +523,21 @@ static void rkisp1_isp_stop(struct rkisp1_device *rkisp1)
 	readx_poll_timeout(readl, rkisp1->base_addr + RKISP1_CIF_ISP_RIS,
 			   val, val & RKISP1_CIF_ISP_OFF, 20, 100);
 	rkisp1_write(rkisp1,
-		     RKISP1_CIF_IRCL_MIPI_SW_RST | RKISP1_CIF_IRCL_ISP_SW_RST,
-		     RKISP1_CIF_IRCL);
-	rkisp1_write(rkisp1, 0x0, RKISP1_CIF_IRCL);
+		     RKISP1_CIF_VI_IRCL_MIPI_SW_RST |
+		     RKISP1_CIF_VI_IRCL_ISP_SW_RST,
+		     RKISP1_CIF_VI_IRCL);
+	rkisp1_write(rkisp1, 0x0, RKISP1_CIF_VI_IRCL);
 }
 
 static void rkisp1_config_clk(struct rkisp1_device *rkisp1)
 {
-	u32 val = RKISP1_CIF_ICCL_ISP_CLK | RKISP1_CIF_ICCL_CP_CLK |
-		  RKISP1_CIF_ICCL_MRSZ_CLK | RKISP1_CIF_ICCL_SRSZ_CLK |
-		  RKISP1_CIF_ICCL_JPEG_CLK | RKISP1_CIF_ICCL_MI_CLK |
-		  RKISP1_CIF_ICCL_IE_CLK | RKISP1_CIF_ICCL_MIPI_CLK |
-		  RKISP1_CIF_ICCL_DCROP_CLK;
+	u32 val = RKISP1_CIF_VI_ICCL_ISP_CLK | RKISP1_CIF_VI_ICCL_CP_CLK |
+		  RKISP1_CIF_VI_ICCL_MRSZ_CLK | RKISP1_CIF_VI_ICCL_SRSZ_CLK |
+		  RKISP1_CIF_VI_ICCL_JPEG_CLK | RKISP1_CIF_VI_ICCL_MI_CLK |
+		  RKISP1_CIF_VI_ICCL_IE_CLK | RKISP1_CIF_VI_ICCL_MIPI_CLK |
+		  RKISP1_CIF_VI_ICCL_DCROP_CLK;
 
-	rkisp1_write(rkisp1, val, RKISP1_CIF_ICCL);
+	rkisp1_write(rkisp1, val, RKISP1_CIF_VI_ICCL);
 
 	/* ensure sp and mp can run at the same time in V12 */
 	if (rkisp1->media_dev.hw_revision == RKISP1_V12) {
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index d41823c861ca..7a172d47d475 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -1058,8 +1058,8 @@ static void rkisp1_ie_config(struct rkisp1_params *params,
 static void rkisp1_ie_enable(struct rkisp1_params *params, bool en)
 {
 	if (en) {
-		rkisp1_param_set_bits(params, RKISP1_CIF_ICCL,
-				      RKISP1_CIF_ICCL_IE_CLK);
+		rkisp1_param_set_bits(params, RKISP1_CIF_VI_ICCL,
+				      RKISP1_CIF_VI_ICCL_IE_CLK);
 		rkisp1_write(params->rkisp1, RKISP1_CIF_IMG_EFF_CTRL_ENABLE,
 			     RKISP1_CIF_IMG_EFF_CTRL);
 		rkisp1_param_set_bits(params, RKISP1_CIF_IMG_EFF_CTRL,
@@ -1067,8 +1067,8 @@ static void rkisp1_ie_enable(struct rkisp1_params *params, bool en)
 	} else {
 		rkisp1_param_clear_bits(params, RKISP1_CIF_IMG_EFF_CTRL,
 					RKISP1_CIF_IMG_EFF_CTRL_ENABLE);
-		rkisp1_param_clear_bits(params, RKISP1_CIF_ICCL,
-					RKISP1_CIF_ICCL_IE_CLK);
+		rkisp1_param_clear_bits(params, RKISP1_CIF_VI_ICCL,
+					RKISP1_CIF_VI_ICCL_IE_CLK);
 	}
 }
 
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
index 9e786de23480..4e2b73227e61 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
@@ -210,7 +210,7 @@
 #define RKISP1_CIF_MI_XTD_FMT_CTRL_SP_CB_CR_SWAP	BIT(1)
 #define RKISP1_CIF_MI_XTD_FMT_CTRL_DMA_CB_CR_SWAP	BIT(2)
 
-/* CCL */
+/* VI_CCL */
 #define RKISP1_CIF_CCL_CIF_CLK_DIS			BIT(2)
 /* VI_ISP_CLK_CTRL */
 #define RKISP1_CIF_CLK_CTRL_ISP_RAW			BIT(0)
@@ -241,32 +241,32 @@
 #define RKISP1_CIF_CLK_CTRL_RSZS			BIT(25)
 #define RKISP1_CIF_CLK_CTRL_MIPI			BIT(26)
 #define RKISP1_CIF_CLK_CTRL_MARVINMI			BIT(27)
-/* ICCL */
-#define RKISP1_CIF_ICCL_ISP_CLK				BIT(0)
-#define RKISP1_CIF_ICCL_CP_CLK				BIT(1)
-#define RKISP1_CIF_ICCL_RES_2				BIT(2)
-#define RKISP1_CIF_ICCL_MRSZ_CLK			BIT(3)
-#define RKISP1_CIF_ICCL_SRSZ_CLK			BIT(4)
-#define RKISP1_CIF_ICCL_JPEG_CLK			BIT(5)
-#define RKISP1_CIF_ICCL_MI_CLK				BIT(6)
-#define RKISP1_CIF_ICCL_RES_7				BIT(7)
-#define RKISP1_CIF_ICCL_IE_CLK				BIT(8)
-#define RKISP1_CIF_ICCL_SIMP_CLK			BIT(9)
-#define RKISP1_CIF_ICCL_SMIA_CLK			BIT(10)
-#define RKISP1_CIF_ICCL_MIPI_CLK			BIT(11)
-#define RKISP1_CIF_ICCL_DCROP_CLK			BIT(12)
-/* IRCL */
-#define RKISP1_CIF_IRCL_ISP_SW_RST			BIT(0)
-#define RKISP1_CIF_IRCL_CP_SW_RST			BIT(1)
-#define RKISP1_CIF_IRCL_YCS_SW_RST			BIT(2)
-#define RKISP1_CIF_IRCL_MRSZ_SW_RST			BIT(3)
-#define RKISP1_CIF_IRCL_SRSZ_SW_RST			BIT(4)
-#define RKISP1_CIF_IRCL_JPEG_SW_RST			BIT(5)
-#define RKISP1_CIF_IRCL_MI_SW_RST			BIT(6)
-#define RKISP1_CIF_IRCL_CIF_SW_RST			BIT(7)
-#define RKISP1_CIF_IRCL_IE_SW_RST			BIT(8)
-#define RKISP1_CIF_IRCL_SI_SW_RST			BIT(9)
-#define RKISP1_CIF_IRCL_MIPI_SW_RST			BIT(11)
+/* VI_ICCL */
+#define RKISP1_CIF_VI_ICCL_ISP_CLK			BIT(0)
+#define RKISP1_CIF_VI_ICCL_CP_CLK			BIT(1)
+#define RKISP1_CIF_VI_ICCL_RES_2			BIT(2)
+#define RKISP1_CIF_VI_ICCL_MRSZ_CLK			BIT(3)
+#define RKISP1_CIF_VI_ICCL_SRSZ_CLK			BIT(4)
+#define RKISP1_CIF_VI_ICCL_JPEG_CLK			BIT(5)
+#define RKISP1_CIF_VI_ICCL_MI_CLK			BIT(6)
+#define RKISP1_CIF_VI_ICCL_RES_7			BIT(7)
+#define RKISP1_CIF_VI_ICCL_IE_CLK			BIT(8)
+#define RKISP1_CIF_VI_ICCL_SIMP_CLK			BIT(9)
+#define RKISP1_CIF_VI_ICCL_SMIA_CLK			BIT(10)
+#define RKISP1_CIF_VI_ICCL_MIPI_CLK			BIT(11)
+#define RKISP1_CIF_VI_ICCL_DCROP_CLK			BIT(12)
+/* VI_IRCL */
+#define RKISP1_CIF_VI_IRCL_ISP_SW_RST			BIT(0)
+#define RKISP1_CIF_VI_IRCL_CP_SW_RST			BIT(1)
+#define RKISP1_CIF_VI_IRCL_YCS_SW_RST			BIT(2)
+#define RKISP1_CIF_VI_IRCL_MRSZ_SW_RST			BIT(3)
+#define RKISP1_CIF_VI_IRCL_SRSZ_SW_RST			BIT(4)
+#define RKISP1_CIF_VI_IRCL_JPEG_SW_RST			BIT(5)
+#define RKISP1_CIF_VI_IRCL_MI_SW_RST			BIT(6)
+#define RKISP1_CIF_VI_IRCL_CIF_SW_RST			BIT(7)
+#define RKISP1_CIF_VI_IRCL_IE_SW_RST			BIT(8)
+#define RKISP1_CIF_VI_IRCL_SI_SW_RST			BIT(9)
+#define RKISP1_CIF_VI_IRCL_MIPI_SW_RST			BIT(11)
 
 /* C_PROC_CTR */
 #define RKISP1_CIF_C_PROC_CTR_ENABLE			BIT(0)
@@ -687,11 +687,11 @@
 /*                            CIF Registers                            */
 /* =================================================================== */
 #define RKISP1_CIF_CTRL_BASE			0x00000000
-#define RKISP1_CIF_CCL				(RKISP1_CIF_CTRL_BASE + 0x00000000)
+#define RKISP1_CIF_VI_CCL			(RKISP1_CIF_CTRL_BASE + 0x00000000)
 #define RKISP1_CIF_VI_ID			(RKISP1_CIF_CTRL_BASE + 0x00000008)
 #define RKISP1_CIF_VI_ISP_CLK_CTRL_V12		(RKISP1_CIF_CTRL_BASE + 0x0000000C)
-#define RKISP1_CIF_ICCL				(RKISP1_CIF_CTRL_BASE + 0x00000010)
-#define RKISP1_CIF_IRCL				(RKISP1_CIF_CTRL_BASE + 0x00000014)
+#define RKISP1_CIF_VI_ICCL			(RKISP1_CIF_CTRL_BASE + 0x00000010)
+#define RKISP1_CIF_VI_IRCL			(RKISP1_CIF_CTRL_BASE + 0x00000014)
 #define RKISP1_CIF_VI_DPCL			(RKISP1_CIF_CTRL_BASE + 0x00000018)
 
 #define RKISP1_CIF_IMG_EFF_BASE			0x00000200
-- 
Regards,

Laurent Pinchart

