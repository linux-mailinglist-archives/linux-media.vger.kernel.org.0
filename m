Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D431954E6A4
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 18:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378039AbiFPQFY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 12:05:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378056AbiFPQFV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 12:05:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A01047AFE
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 09:05:20 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0370FBAC;
        Thu, 16 Jun 2022 18:05:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655395513;
        bh=bgubHmggbrvTsLqwBe7Y6wtg/PSfpTcmOn7GZDOwDME=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=T84Dk98x+VbV2YVVPizLwX2OfZTHsYkFH3KEh1zDS0Ao5xmMaxKsP0XsN2eef7uEP
         K+x3A34Yu4PIYQ/kLPU0eRJmvHJyEgcPVc6XUkCgggBu5R/2NZjYYMwz1GSYlRJCjL
         x8SB4NT8vCnOCV/S6+eqggvd5KbJfR0dr6lD48RU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Florian Sylvestre <fsylvestre@baylibre.com>
Subject: [PATCH 3/3] media: rockchip: rkisp1: Define macros for DPCC configurations in UAPI
Date:   Thu, 16 Jun 2022 19:04:56 +0300
Message-Id: <20220616160456.21549-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616160456.21549-1-laurent.pinchart@ideasonboard.com>
References: <20220616160456.21549-1-laurent.pinchart@ideasonboard.com>
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

Extend the UAPI rkisp1-config.h header with macros for all DPCC
configuration fields. While at it, clarify of fix issues in the DPCC
documentation.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-regs.h    |  1 -
 include/uapi/linux/rkisp1-config.h            | 77 +++++++++++++++----
 2 files changed, 61 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
index dc01f968c19d..a931f7216e9b 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
@@ -620,7 +620,6 @@
 /* DPCC */
 #define RKISP1_CIF_ISP_DPCC_MODE_DPCC_ENABLE		BIT(0)
 #define RKISP1_CIF_ISP_DPCC_MODE_GRAYSCALE_MODE		BIT(1)
-#define RKISP1_CIF_ISP_DPCC_MODE_STAGE1_ENABLE		BIT(2)
 #define RKISP1_CIF_ISP_DPCC_OUTPUT_MODE_MASK		GENMASK(3, 0)
 #define RKISP1_CIF_ISP_DPCC_SET_USE_MASK		GENMASK(3, 0)
 #define RKISP1_CIF_ISP_DPCC_METHODS_SET_MASK		0x00001f1f
diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
index 583ca0d9a79d..730673ecc63d 100644
--- a/include/uapi/linux/rkisp1-config.h
+++ b/include/uapi/linux/rkisp1-config.h
@@ -117,7 +117,46 @@
 /*
  * Defect Pixel Cluster Correction
  */
-#define RKISP1_CIF_ISP_DPCC_METHODS_MAX       3
+#define RKISP1_CIF_ISP_DPCC_METHODS_MAX				3
+
+#define RKISP1_CIF_ISP_DPCC_MODE_STAGE1_ENABLE			(1U << 2)
+
+#define RKISP1_CIF_ISP_DPCC_OUTPUT_MODE_STAGE1_INCL_G_CENTER	(1U << 0)
+#define RKISP1_CIF_ISP_DPCC_OUTPUT_MODE_STAGE1_INCL_RB_CENTER	(1U << 1)
+#define RKISP1_CIF_ISP_DPCC_OUTPUT_MODE_STAGE1_G_3X3		(1U << 2)
+#define RKISP1_CIF_ISP_DPCC_OUTPUT_MODE_STAGE1_RB_3X3		(1U << 3)
+
+/* 0-2 for sets 1-3 */
+#define RKISP1_CIF_ISP_DPCC_SET_USE_STAGE1_USE_SET(n)		((n) << 0)
+#define RKISP1_CIF_ISP_DPCC_SET_USE_STAGE1_USE_FIX_SET		(1U << 3)
+
+#define RKISP1_CIF_ISP_DPCC_METHODS_SET_PG_GREEN_ENABLE		(1U << 0)
+#define RKISP1_CIF_ISP_DPCC_METHODS_SET_LC_GREEN_ENABLE		(1U << 1)
+#define RKISP1_CIF_ISP_DPCC_METHODS_SET_RO_GREEN_ENABLE		(1U << 2)
+#define RKISP1_CIF_ISP_DPCC_METHODS_SET_RND_GREEN_ENABLE	(1U << 3)
+#define RKISP1_CIF_ISP_DPCC_METHODS_SET_RG_GREEN_ENABLE		(1U << 4)
+#define RKISP1_CIF_ISP_DPCC_METHODS_SET_PG_RED_BLUE_ENABLE	(1U << 8)
+#define RKISP1_CIF_ISP_DPCC_METHODS_SET_LC_RED_BLUE_ENABLE	(1U << 9)
+#define RKISP1_CIF_ISP_DPCC_METHODS_SET_RO_RED_BLUE_ENABLE	(1U << 10)
+#define RKISP1_CIF_ISP_DPCC_METHODS_SET_RND_RED_BLUE_ENABLE	(1U << 11)
+#define RKISP1_CIF_ISP_DPCC_METHODS_SET_RG_RED_BLUE_ENABLE	(1U << 12)
+
+#define RKISP1_CIF_ISP_DPCC_LINE_THRESH_G(v)			((v) << 0)
+#define RKISP1_CIF_ISP_DPCC_LINE_THRESH_RB(v)			((v) << 8)
+#define RKISP1_CIF_ISP_DPCC_LINE_MAD_FAC_G(v)			((v) << 0)
+#define RKISP1_CIF_ISP_DPCC_LINE_MAD_FAC_RB(v)			((v) << 8)
+#define RKISP1_CIF_ISP_DPCC_PG_FAC_G(v)				((v) << 0)
+#define RKISP1_CIF_ISP_DPCC_PG_FAC_RB(v)			((v) << 8)
+#define RKISP1_CIF_ISP_DPCC_RND_THRESH_G(v)			((v) << 0)
+#define RKISP1_CIF_ISP_DPCC_RND_THRESH_RB(v)			((v) << 8)
+#define RKISP1_CIF_ISP_DPCC_RG_FAC_G(v)				((v) << 0)
+#define RKISP1_CIF_ISP_DPCC_RG_FAC_RB(v)			((v) << 8)
+
+#define RKISP1_CIF_ISP_DPCC_RO_LIMITS_n_G(n, v)			((v) << ((n) * 4))
+#define RKISP1_CIF_ISP_DPCC_RO_LIMITS_n_RB(n, v)		((v) << ((n) * 4 + 2))
+
+#define RKISP1_CIF_ISP_DPCC_RND_OFFS_n_G(n, v)			((v) << ((n) * 4))
+#define RKISP1_CIF_ISP_DPCC_RND_OFFS_n_RB(n, v)			((v) << ((n) * 4 + 2))
 
 /*
  * Denoising pre filter
@@ -249,16 +288,20 @@ struct rkisp1_cif_isp_bls_config {
 };
 
 /**
- * struct rkisp1_cif_isp_dpcc_methods_config - Methods Configuration used by DPCC
+ * struct rkisp1_cif_isp_dpcc_methods_config - DPCC methods set configuration
  *
- * Methods Configuration used by Defect Pixel Cluster Correction
+ * This structure stores the configuration of one set of methods for the DPCC
+ * algorithm. Multiple methods can be selected in each set (independently for
+ * the Green and Red/Blue components) through the @method field, the result is
+ * the logical AND of all enabled methods. The remaining fields set thresholds
+ * and factors for each method.
  *
- * @method: Method enable bits
- * @line_thresh: Line threshold
- * @line_mad_fac: Line MAD factor
- * @pg_fac: Peak gradient factor
- * @rnd_thresh: Rank Neighbor Difference threshold
- * @rg_fac: Rank gradient factor
+ * @method: Method enable bits (RKISP1_CIF_ISP_DPCC_METHODS_SET_*)
+ * @line_thresh: Line threshold (RKISP1_CIF_ISP_DPCC_LINE_THRESH_*)
+ * @line_mad_fac: Line Mean Absolute Difference factor (RKISP1_CIF_ISP_DPCC_LINE_MAD_FAC_*)
+ * @pg_fac: Peak gradient factor (RKISP1_CIF_ISP_DPCC_PG_FAC_*)
+ * @rnd_thresh: Rank Neighbor Difference threshold (RKISP1_CIF_ISP_DPCC_RND_THRESH_*)
+ * @rg_fac: Rank gradient factor (RKISP1_CIF_ISP_DPCC_RG_FAC_*)
  */
 struct rkisp1_cif_isp_dpcc_methods_config {
 	__u32 method;
@@ -272,14 +315,16 @@ struct rkisp1_cif_isp_dpcc_methods_config {
 /**
  * struct rkisp1_cif_isp_dpcc_config - Configuration used by DPCC
  *
- * Configuration used by Defect Pixel Cluster Correction
+ * Configuration used by Defect Pixel Cluster Correction. Three sets of methods
+ * can be configured and selected through the @set_use field. The result is the
+ * logical OR of all enabled sets.
  *
- * @mode: dpcc output mode
- * @output_mode: whether use hard coded methods
- * @set_use: stage1 methods set
- * @methods: methods config
- * @ro_limits: rank order limits
- * @rnd_offs: differential rank offsets for rank neighbor difference
+ * @mode: DPCC mode (RKISP1_CIF_ISP_DPCC_MODE_*)
+ * @output_mode: Interpolation output mode (RKISP1_CIF_ISP_DPCC_OUTPUT_MODE_*)
+ * @set_use: Methods sets selection (RKISP1_CIF_ISP_DPCC_SET_USE_*)
+ * @methods: Methods sets configuration
+ * @ro_limits: Rank order limits (RKISP1_CIF_ISP_DPCC_RO_LIMITS_*)
+ * @rnd_offs: Differential rank offsets for rank neighbor difference (RKISP1_CIF_ISP_DPCC_RND_OFFS_*)
  */
 struct rkisp1_cif_isp_dpcc_config {
 	__u32 mode;
-- 
Regards,

Laurent Pinchart

