Return-Path: <linux-media+bounces-37094-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51956AFC8B9
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 12:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF30A1BC4D73
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 10:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE0B2DE213;
	Tue,  8 Jul 2025 10:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U6PsdwUO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA792DCF74;
	Tue,  8 Jul 2025 10:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751971290; cv=none; b=VtIAj0FMpmernwllx/hQRAg+/i7MJnm6BCUkLnSwh2gXCmDD2h/PQn7eqy51/IMDLDZ39iJx2VD08agcp6DfBCfQAPRXyIHxeAVIgxz/40mpZe6elHx2cb2i68waYEIYIatDUOhQAOxQcTFFZ9NRTnZCTqDmeuG082VRbrDgmMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751971290; c=relaxed/simple;
	bh=N1RgivZg2OuBkITWbDCoQ3+nocE4wejuSYIZUHxvQ1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nTmLJF3of6wHwr+KSjwBNnSJ+vz0QvePdk78BsQY6hrymzpJnVRoJuN5mxxN8xkpr71UzqS0Q4KBQlfe9GFEQT4gafPNP/JZWMfeHnweh3tdwpcHniwIBx6yYqvTr67daLkEokVSTqW1QJRvDD5N7CyNdOMvHo+5QwuhZsfQX6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=U6PsdwUO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-136-241.net.vodafone.it [5.90.136.241])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77105524E;
	Tue,  8 Jul 2025 12:40:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751971247;
	bh=N1RgivZg2OuBkITWbDCoQ3+nocE4wejuSYIZUHxvQ1c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=U6PsdwUO2N9eWrwe2aX/2JWGkhwSQ6nVZejdI42BfI/Cca6fR6U7L/CnuYOpDYu1A
	 0E1pY0BmlISBsy5vCMrdH7OJprlEZjNxm2nwqLjA6CS2WeW0E6cEEuyKtB0iOA8MrM
	 lx0Aq8LvVuEIivdPNSdgQJQIae2Np6BpLUTn26Zc=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 08 Jul 2025 12:40:54 +0200
Subject: [PATCH 7/8] media: amlogic-c3: Use v4l2-params for validation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-extensible-parameters-validation-v1-7-9fc27c9c728c@ideasonboard.com>
References: <20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com>
In-Reply-To: <20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=17633;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=N1RgivZg2OuBkITWbDCoQ3+nocE4wejuSYIZUHxvQ1c=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBobPXACHC8/wG8qYjXEa/Ww6QH/bnp7Zuu0vU6v
 4wgW0JeH2CJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaGz1wAAKCRByNAaPFqFW
 PJW8EACJ/cmyIcoiGcT/DMeJ9bHXgq4Cnodx12oNlg9uwKFEBZnLS7vH99DxUeQiKWaDQV4A3tN
 xUR5i0MA8mSgYU4z9Q/E4Ruxdpf4kCV6fYWDMhXW9ylMjqHDn9ANHHb10EyOnsxqAJ/C0FbzKRC
 GKUzINU+5j5NIgbU0Dk+pKm+uRqNi3ntnrN9mSawFVZDxSJEj6ZCfgPentT7cxcAVVp+PQrLzas
 R8PWLlQuZ502tk698JubwUNxKOuwixKqxpcippwu5X/MQrShh1PDVlYf6A1sNuS8lswSFp72jQN
 zbNNuNfuMkUTSM2s+FMEywQdSLPRiuJEHmtmNNuuhZfe5yMkScgK0cqGT3OXOMhbYLnRwQfe3Sf
 7eX/TlJIel8I8XPynpkJB+m5K07w7EXyeMeWL1lu933vYiMy9lcuiYHiv/liSpHaTGF1UF/1tuE
 f1dDClM9MdMcXasWbW7DUjFe8P/8be8AVcuycr3JFdfMaZP+bBAC8ynpjTzNWez72D5MdElUxwB
 LWu+Ga07GBKYTUUj65Wj72eCw8JiAMyeNdHCqlaKRLwFPGmrWX4Qg22czDkQ+pVqWFBjOBESBRp
 hjagVuDLCQOc3FsMmJXvTgy0yK71bqQdrUtHgkipOOfQ4uLtmOvIDd9+7eG3JANda2TZqqsdAuC
 WZnoAwl+uHEC2nA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Convert c3-ispa-params.c to use the new types fro block handlers
defined in v4l2-params.h and use the new helpers from v4l2-params.c
to remove boilerplate code from the driver.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/platform/amlogic/c3/isp/c3-isp-params.c  | 272 ++++++++-------------
 1 file changed, 103 insertions(+), 169 deletions(-)

diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
index c80667dd766210d2b2e1ee60c8254a5814b9d81b..9555a657fd93e89c846df029af9de2745d2a5d7c 100644
--- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
@@ -9,64 +9,25 @@
 
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mc.h>
+#include <media/v4l2-params.h>
 #include <media/videobuf2-vmalloc.h>
 
 #include "c3-isp-common.h"
 #include "c3-isp-regs.h"
 
-/*
- * union c3_isp_params_block - Generalisation of a parameter block
- *
- * This union allows the driver to treat a block as a generic struct to this
- * union and safely access the header and block-specific struct without having
- * to resort to casting. The header member is accessed first, and the type field
- * checked which allows the driver to determine which of the other members
- * should be used.
- *
- * @header:		The shared header struct embedded as the first member
- *			of all the possible other members. This member would be
- *			accessed first and the type field checked to determine
- *			which of the other members should be accessed.
- * @awb_gains:		For header.type == C3_ISP_PARAMS_BLOCK_AWB_GAINS
- * @awb_cfg:		For header.type == C3_ISP_PARAMS_BLOCK_AWB_CONFIG
- * @ae_cfg:		For header.type == C3_ISP_PARAMS_BLOCK_AE_CONFIG
- * @af_cfg:		For header.type == C3_ISP_PARAMS_BLOCK_AF_CONFIG
- * @pst_gamma:		For header.type == C3_ISP_PARAMS_BLOCK_PST_GAMMA
- * @ccm:		For header.type == C3_ISP_PARAMS_BLOCK_CCM
- * @csc:		For header.type == C3_ISP_PARAMS_BLOCK_CSC
- * @blc:		For header.type == C3_ISP_PARAMS_BLOCK_BLC
- */
-union c3_isp_params_block {
-	struct c3_isp_params_block_header header;
-	struct c3_isp_params_awb_gains awb_gains;
-	struct c3_isp_params_awb_config awb_cfg;
-	struct c3_isp_params_ae_config ae_cfg;
-	struct c3_isp_params_af_config af_cfg;
-	struct c3_isp_params_pst_gamma pst_gamma;
-	struct c3_isp_params_ccm ccm;
-	struct c3_isp_params_csc csc;
-	struct c3_isp_params_blc blc;
-};
-
-typedef void (*c3_isp_block_handler)(struct c3_isp_device *isp,
-				     const union c3_isp_params_block *block);
-
-struct c3_isp_params_handler {
-	size_t size;
-	c3_isp_block_handler handler;
-};
-
 #define to_c3_isp_params_buffer(vbuf) \
 	container_of(vbuf, struct c3_isp_params_buffer, vb)
 
 /* Hardware configuration */
 
-static void c3_isp_params_cfg_awb_gains(struct c3_isp_device *isp,
-					const union c3_isp_params_block *block)
+static void c3_isp_params_cfg_awb_gains(void *dev,
+					const struct v4l2_params_block *block)
 {
-	const struct c3_isp_params_awb_gains *awb_gains = &block->awb_gains;
+	const struct c3_isp_params_awb_gains *awb_gains =
+		(const struct c3_isp_params_awb_gains *)block;
+	struct c3_isp_device *isp = dev;
 
-	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
+	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
 		c3_isp_update_bits(isp, ISP_TOP_BEO_CTRL,
 				   ISP_TOP_BEO_CTRL_WB_EN_MASK,
 				   ISP_TOP_BEO_CTRL_WB_DIS);
@@ -89,7 +50,7 @@ static void c3_isp_params_cfg_awb_gains(struct c3_isp_device *isp,
 			   ISP_LSWB_WB_GAIN2_IR_GAIN_MASK,
 			   ISP_LSWB_WB_GAIN2_IR_GAIN(awb_gains->gb_gain));
 
-	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
+	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
 		c3_isp_update_bits(isp, ISP_TOP_BEO_CTRL,
 				   ISP_TOP_BEO_CTRL_WB_EN_MASK,
 				   ISP_TOP_BEO_CTRL_WB_EN);
@@ -151,12 +112,14 @@ static void c3_isp_params_awb_cood(struct c3_isp_device *isp,
 			     ISP_AWB_IDX_DATA_VIDX_DATA(cfg->vert_coord[i]));
 }
 
-static void c3_isp_params_cfg_awb_config(struct c3_isp_device *isp,
-					 const union c3_isp_params_block *block)
+static void c3_isp_params_cfg_awb_config(void *dev,
+					 const struct v4l2_params_block *block)
 {
-	const struct c3_isp_params_awb_config *awb_cfg = &block->awb_cfg;
+	const struct c3_isp_params_awb_config *awb_cfg =
+		(const struct c3_isp_params_awb_config *)block;
+	struct c3_isp_device *isp = dev;
 
-	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
+	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
 		c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
 				   ISP_TOP_3A_STAT_CRTL_AWB_STAT_EN_MASK,
 				   ISP_TOP_3A_STAT_CRTL_AWB_STAT_DIS);
@@ -205,7 +168,7 @@ static void c3_isp_params_cfg_awb_config(struct c3_isp_device *isp,
 	c3_isp_params_awb_wt(isp, awb_cfg);
 	c3_isp_params_awb_cood(isp, awb_cfg);
 
-	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
+	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
 		c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
 				   ISP_TOP_3A_STAT_CRTL_AWB_STAT_EN_MASK,
 				   ISP_TOP_3A_STAT_CRTL_AWB_STAT_EN);
@@ -268,12 +231,14 @@ static void c3_isp_params_ae_cood(struct c3_isp_device *isp,
 			     ISP_AE_IDX_DATA_VIDX_DATA(cfg->vert_coord[i]));
 }
 
-static void c3_isp_params_cfg_ae_config(struct c3_isp_device *isp,
-					const union c3_isp_params_block *block)
+static void c3_isp_params_cfg_ae_config(void *dev,
+					const struct v4l2_params_block *block)
 {
-	const struct c3_isp_params_ae_config *ae_cfg = &block->ae_cfg;
+	const struct c3_isp_params_ae_config *ae_cfg =
+		(const struct c3_isp_params_ae_config *)block;
+	struct c3_isp_device *isp = dev;
 
-	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
+	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
 		c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
 				   ISP_TOP_3A_STAT_CRTL_AE_STAT_EN_MASK,
 				   ISP_TOP_3A_STAT_CRTL_AE_STAT_DIS);
@@ -303,7 +268,7 @@ static void c3_isp_params_cfg_ae_config(struct c3_isp_device *isp,
 	c3_isp_params_ae_wt(isp, ae_cfg);
 	c3_isp_params_ae_cood(isp, ae_cfg);
 
-	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
+	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
 		c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
 				   ISP_TOP_3A_STAT_CRTL_AE_STAT_EN_MASK,
 				   ISP_TOP_3A_STAT_CRTL_AE_STAT_EN);
@@ -326,12 +291,14 @@ static void c3_isp_params_af_cood(struct c3_isp_device *isp,
 			     ISP_AF_IDX_DATA_VIDX_DATA(cfg->vert_coord[i]));
 }
 
-static void c3_isp_params_cfg_af_config(struct c3_isp_device *isp,
-					const union c3_isp_params_block *block)
+static void c3_isp_params_cfg_af_config(void *dev,
+					const struct v4l2_params_block *block)
 {
-	const struct c3_isp_params_af_config *af_cfg = &block->af_cfg;
+	const struct c3_isp_params_af_config *af_cfg =
+		(const struct c3_isp_params_af_config *)block;
+	struct c3_isp_device *isp = dev;
 
-	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
+	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
 		c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
 				   ISP_TOP_3A_STAT_CRTL_AF_STAT_EN_MASK,
 				   ISP_TOP_3A_STAT_CRTL_AF_STAT_DIS);
@@ -351,20 +318,22 @@ static void c3_isp_params_cfg_af_config(struct c3_isp_device *isp,
 
 	c3_isp_params_af_cood(isp, af_cfg);
 
-	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
+	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
 		c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
 				   ISP_TOP_3A_STAT_CRTL_AF_STAT_EN_MASK,
 				   ISP_TOP_3A_STAT_CRTL_AF_STAT_EN);
 }
 
-static void c3_isp_params_cfg_pst_gamma(struct c3_isp_device *isp,
-					const union c3_isp_params_block *block)
+static void c3_isp_params_cfg_pst_gamma(void *dev,
+					const struct v4l2_params_block *block)
 {
-	const struct c3_isp_params_pst_gamma *gm = &block->pst_gamma;
+	const struct c3_isp_params_pst_gamma *gm =
+		(const struct c3_isp_params_pst_gamma *)block;
+	struct c3_isp_device *isp = dev;
 	unsigned int base;
 	unsigned int i;
 
-	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
+	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
 		c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
 				   ISP_TOP_BED_CTRL_PST_GAMMA_EN_MASK,
 				   ISP_TOP_BED_CTRL_PST_GAMMA_DIS);
@@ -393,19 +362,21 @@ static void c3_isp_params_cfg_pst_gamma(struct c3_isp_device *isp,
 		}
 	}
 
-	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
+	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
 		c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
 				   ISP_TOP_BED_CTRL_PST_GAMMA_EN_MASK,
 				   ISP_TOP_BED_CTRL_PST_GAMMA_EN);
 }
 
 /* Configure 3 x 3 ccm matrix */
-static void c3_isp_params_cfg_ccm(struct c3_isp_device *isp,
-				  const union c3_isp_params_block *block)
+static void c3_isp_params_cfg_ccm(void *dev,
+				  const struct v4l2_params_block *block)
 {
-	const struct c3_isp_params_ccm *ccm = &block->ccm;
+	const struct c3_isp_params_ccm *ccm =
+		(const struct c3_isp_params_ccm *)block;
+	struct c3_isp_device *isp = dev;
 
-	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
+	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
 		c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
 				   ISP_TOP_BED_CTRL_CCM_EN_MASK,
 				   ISP_TOP_BED_CTRL_CCM_DIS);
@@ -442,19 +413,21 @@ static void c3_isp_params_cfg_ccm(struct c3_isp_device *isp,
 			   ISP_CCM_MTX_22_23_RS_MTX_22_MASK,
 			   ISP_CCM_MTX_22_23_RS_MTX_22(ccm->matrix[2][2]));
 
-	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
+	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
 		c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
 				   ISP_TOP_BED_CTRL_CCM_EN_MASK,
 				   ISP_TOP_BED_CTRL_CCM_EN);
 }
 
 /* Configure color space conversion matrix parameters */
-static void c3_isp_params_cfg_csc(struct c3_isp_device *isp,
-				  const union c3_isp_params_block *block)
+static void c3_isp_params_cfg_csc(void *dev,
+				  const struct v4l2_params_block *block)
 {
-	const struct c3_isp_params_csc *csc = &block->csc;
+	const struct c3_isp_params_csc *csc =
+		(const struct c3_isp_params_csc *)block;
+	struct c3_isp_device *isp = dev;
 
-	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
+	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
 		c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
 				   ISP_TOP_BED_CTRL_CM0_EN_MASK,
 				   ISP_TOP_BED_CTRL_CM0_DIS);
@@ -491,19 +464,21 @@ static void c3_isp_params_cfg_csc(struct c3_isp_device *isp,
 			   ISP_CM0_COEF22_OUP_OFST0_MTX_22_MASK,
 			   ISP_CM0_COEF22_OUP_OFST0_MTX_22(csc->matrix[2][2]));
 
-	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
+	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
 		c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
 				   ISP_TOP_BED_CTRL_CM0_EN_MASK,
 				   ISP_TOP_BED_CTRL_CM0_EN);
 }
 
 /* Set blc offset of each color channel */
-static void c3_isp_params_cfg_blc(struct c3_isp_device *isp,
-				  const union c3_isp_params_block *block)
+static void c3_isp_params_cfg_blc(void *dev,
+				  const struct v4l2_params_block *block)
 {
-	const struct c3_isp_params_blc *blc = &block->blc;
+	const struct c3_isp_params_blc *blc =
+		(const struct c3_isp_params_blc *)block;
+	struct c3_isp_device *isp = dev;
 
-	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
+	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
 		c3_isp_update_bits(isp, ISP_TOP_BEO_CTRL,
 				   ISP_TOP_BEO_CTRL_BLC_EN_MASK,
 				   ISP_TOP_BEO_CTRL_BLC_DIS);
@@ -517,13 +492,13 @@ static void c3_isp_params_cfg_blc(struct c3_isp_device *isp,
 		     ISP_LSWB_BLC_OFST1_GB_OFST(blc->gb_ofst) |
 		     ISP_LSWB_BLC_OFST1_B_OFST(blc->b_ofst));
 
-	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
+	if (block->flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
 		c3_isp_update_bits(isp, ISP_TOP_BEO_CTRL,
 				   ISP_TOP_BEO_CTRL_BLC_EN_MASK,
 				   ISP_TOP_BEO_CTRL_BLC_EN);
 }
 
-static const struct c3_isp_params_handler c3_isp_params_handlers[] = {
+static const struct v4l2_params_handler c3_isp_params_handlers[] = {
 	[C3_ISP_PARAMS_BLOCK_AWB_GAINS] = {
 		.size = sizeof(struct c3_isp_params_awb_gains),
 		.handler = c3_isp_params_cfg_awb_gains,
@@ -568,16 +543,16 @@ static void c3_isp_params_cfg_blocks(struct c3_isp_params *params)
 
 	/* Walk the list of parameter blocks and process them */
 	while (block_offset < config->data_size) {
-		const struct c3_isp_params_handler *block_handler;
-		const union c3_isp_params_block *block;
+		const struct v4l2_params_handler *block_handler;
+		const struct v4l2_params_block *block;
 
-		block = (const union c3_isp_params_block *)
+		block = (const struct v4l2_params_block *)
 			 &config->data[block_offset];
 
-		block_handler = &c3_isp_params_handlers[block->header.type];
+		block_handler = &c3_isp_params_handlers[block->type];
 		block_handler->handler(params->isp, block);
 
-		block_offset += block->header.size;
+		block_offset += block->size;
 	}
 }
 
@@ -766,31 +741,49 @@ static void c3_isp_params_vb2_buf_queue(struct vb2_buffer *vb)
 	list_add_tail(&buf->list, &params->pending);
 }
 
+static int
+c3_isp_params_validate_buffer(struct device *dev,
+			      const struct v4l2_params_buffer *buffer)
+{
+	/* Only v0 is supported at the moment */
+	if (buffer->version != C3_ISP_PARAMS_BUFFER_V0) {
+		dev_dbg(dev, "Invalid params buffer version: %u\n",
+			buffer->version);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int
+c3_isp_params_validate_block(struct device *dev,
+			     const struct v4l2_params_block *block)
+{
+	if ((block->flags & (C3_ISP_PARAMS_BLOCK_FL_ENABLE |
+			     C3_ISP_PARAMS_BLOCK_FL_DISABLE)) ==
+	    (C3_ISP_PARAMS_BLOCK_FL_ENABLE | C3_ISP_PARAMS_BLOCK_FL_DISABLE)) {
+		dev_dbg(dev, "Invalid parameters block flags\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int c3_isp_params_vb2_buf_prepare(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct c3_isp_params_buffer *buf = to_c3_isp_params_buffer(vbuf);
 	struct c3_isp_params *params = vb2_get_drv_priv(vb->vb2_queue);
-	struct c3_isp_params_cfg *cfg = buf->cfg;
 	struct c3_isp_params_cfg *usr_cfg = vb2_plane_vaddr(vb, 0);
 	size_t payload_size = vb2_get_plane_payload(vb, 0);
-	size_t header_size = offsetof(struct c3_isp_params_cfg, data);
-	size_t block_offset = 0;
-	size_t cfg_size;
-
-	/* Payload size can't be greater than the destination buffer size */
-	if (payload_size > params->vfmt.fmt.meta.buffersize) {
-		dev_dbg(params->isp->dev,
-			"Payload size is too large: %zu\n", payload_size);
-		return -EINVAL;
-	}
+	struct c3_isp_params_cfg *cfg = buf->cfg;
+	int ret;
 
-	/* Payload size can't be smaller than the header size */
-	if (payload_size < header_size) {
-		dev_dbg(params->isp->dev,
-			"Payload size is too small: %zu\n", payload_size);
-		return -EINVAL;
-	}
+	ret = v4l2_params_buffer_validate(params->isp->dev, vb,
+					  params->vfmt.fmt.meta.buffersize,
+					  c3_isp_params_validate_buffer);
+	if (ret)
+		return ret;
 
 	/*
 	 * Use the internal scratch buffer to avoid userspace modifying
@@ -798,70 +791,11 @@ static int c3_isp_params_vb2_buf_prepare(struct vb2_buffer *vb)
 	 */
 	memcpy(cfg, usr_cfg, payload_size);
 
-	/* Only v0 is supported at the moment */
-	if (cfg->version != C3_ISP_PARAMS_BUFFER_V0) {
-		dev_dbg(params->isp->dev,
-			"Invalid params buffer version: %u\n", cfg->version);
-		return -EINVAL;
-	}
-
-	/* Validate the size reported in the parameter buffer header */
-	cfg_size = header_size + cfg->data_size;
-	if (cfg_size != payload_size) {
-		dev_dbg(params->isp->dev,
-			"Data size %zu and payload size %zu are different\n",
-			cfg_size, payload_size);
-		return -EINVAL;
-	}
-
-	/* Walk the list of parameter blocks and validate them */
-	cfg_size = cfg->data_size;
-	while (cfg_size >= sizeof(struct c3_isp_params_block_header)) {
-		const struct c3_isp_params_block_header *block;
-		const struct c3_isp_params_handler *handler;
-
-		block = (struct c3_isp_params_block_header *)
-			&cfg->data[block_offset];
-
-		if (block->type >= ARRAY_SIZE(c3_isp_params_handlers)) {
-			dev_dbg(params->isp->dev,
-				"Invalid params block type\n");
-			return -EINVAL;
-		}
-
-		if (block->size > cfg_size) {
-			dev_dbg(params->isp->dev,
-				"Block size is greater than cfg size\n");
-			return -EINVAL;
-		}
-
-		if ((block->flags & (C3_ISP_PARAMS_BLOCK_FL_ENABLE |
-				     C3_ISP_PARAMS_BLOCK_FL_DISABLE)) ==
-		    (C3_ISP_PARAMS_BLOCK_FL_ENABLE |
-		     C3_ISP_PARAMS_BLOCK_FL_DISABLE)) {
-			dev_dbg(params->isp->dev,
-				"Invalid parameters block flags\n");
-			return -EINVAL;
-		}
-
-		handler = &c3_isp_params_handlers[block->type];
-		if (block->size != handler->size) {
-			dev_dbg(params->isp->dev,
-				"Invalid params block size\n");
-			return -EINVAL;
-		}
-
-		block_offset += block->size;
-		cfg_size -= block->size;
-	}
-
-	if (cfg_size) {
-		dev_dbg(params->isp->dev,
-			"Unexpected data after the params buffer end\n");
-		return -EINVAL;
-	}
-
-	return 0;
+	return v4l2_params_blocks_validate(params->isp->dev,
+					   (struct v4l2_params_buffer *)cfg,
+					   c3_isp_params_handlers,
+					   ARRAY_SIZE(c3_isp_params_handlers),
+					   c3_isp_params_validate_block);
 }
 
 static int c3_isp_params_vb2_buf_init(struct vb2_buffer *vb)

-- 
2.49.0


