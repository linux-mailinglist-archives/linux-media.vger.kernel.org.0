Return-Path: <linux-media+bounces-25288-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2A2A1B909
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 16:25:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70400188C953
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 15:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F287D224AFA;
	Fri, 24 Jan 2025 15:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BjFsC0dN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4452236FE;
	Fri, 24 Jan 2025 15:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737731931; cv=none; b=UsiKNNOqD/dCNyR9gaD8siKHTbma6Ca6A5N/u/IemVpfbbNI7dP9HnCETPmHNvhGercBe60KpRH3qKVYrfhpLBylg/4eXIirdzM6f5emhvYUr8nvJ2PZSuDZFNJdTc4vSx87yvydOawQ8fdGDr9FwQFq3qas1lHSQleJAB56x4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737731931; c=relaxed/simple;
	bh=ZOGZT4ASeUilNUme935Ep0UKC8sliNAyBw1Q4IvYq/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KRQod1sUFGXu+wwfUUTVc/FYN5qYcR/F+Xe6aqBeEeS/UZBkufz8Di0fe7fVCsfars92xrHvZBLVbmdcYegVRRtgHMdHX+c1HbHe/ZW2fqsJkzxBxrNhyQ2exzelO7fGQB+hjJWvqXATMf/7omp/VFvObMzstBDXdUizIn97rtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BjFsC0dN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A4F24269E;
	Fri, 24 Jan 2025 16:17:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737731840;
	bh=ZOGZT4ASeUilNUme935Ep0UKC8sliNAyBw1Q4IvYq/4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BjFsC0dNcLicSW0YZTAB/jyzeQ5TsC7q5GnzmuZxzgPDAKLDAbH1LF0AKxnlrykvb
	 FVG7UvV4OmmRfmZQ7MXIiZcXo38OTkeVpkvclDpingnjrYXjpGlvo4MVgDcPiOvw+j
	 b200zSIbwfwfvh1xUer2sXFcEouJlwukZ+Av5A2o=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 24 Jan 2025 17:17:57 +0200
Subject: [PATCH v2 20/22] media: i2c: ds90ub953: Move reg defines to a
 header file
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-ub9xx-improvements-v2-20-f7075c99ea20@ideasonboard.com>
References: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
In-Reply-To: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7729;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=ZOGZT4ASeUilNUme935Ep0UKC8sliNAyBw1Q4IvYq/4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnk68yPnLBDiiROLp1blIcUa0TGbhiWSu6fskX/
 FEdXpWy9EOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ5OvMgAKCRD6PaqMvJYe
 9cWGD/wKh491bH01F4LQdln9Xlk+7uHxZZ06hRnWTwODWPXwvTWiJg/pa0y9gQJNGDyBJAwhmqA
 zBe3fKkci+kApX+14yUv3LqpV75d0riw1GRSrkVYY4EkClVTfsm+i2JIYqCzOumVQ2EgARJq+s9
 /1As2FrSUbz7INy+KWso2DJoYmCf+3bcIqZ/DpC0ns6NchjT5iBYxINDotejYh+GhXp0pRqEEQW
 ordNbt0QiTRjZMGLxpGZUzULVQ7xBybz0y6iPpUCEczmMADJcodUg4w7nnzGvY2loFo/Hgwiwtj
 dF2s/clAopjIY/xoqb6fqswq/uMYm+xZgbHm5CJYSL1lwrLKfo+SVo8AtmB04HuYhbHvUzqlayn
 h/FOmKRar3ChjDJN15bS5yL8v7L+qyzq6DSrfaXIqxUYhRs6QTb4HLzWv24Fzns/ooOBwcFiz9U
 yKFSWXuym3DO1LGSia0SFI/RTA5CAaITvY4amMkcHkaJmVCtmWtV4oIwfl4ryvmTStWYO6NRPNF
 j4+mrFd5EsH+YlinFBFVsYyWDQTvwwHxxcDDkm1QgHexh3atdv2TempeRIR9HsSE8CWSH/XNhir
 SDubhgE1Syj45J8sv+tE5WB7MabpDgMnFyVjMOfcb4H7oH6fNi7ScxgfrrZ4usU9TMCtmmSikJi
 LIZ8r75t2GaAI6w==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Move UB953 register defines to a header file. This is done so that the
deserializer driver can access the defines, and do some early
serializer configuration.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub953.c | 89 +---------------------------------------
 drivers/media/i2c/ds90ub953.h | 95 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+), 87 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 4832128dc9c4..64c3866ef1db 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -28,6 +28,8 @@
 #include <media/v4l2-mediabus.h>
 #include <media/v4l2-subdev.h>
 
+#include "ds90ub953.h"
+
 #define UB953_PAD_SINK			0
 #define UB953_PAD_SOURCE		1
 
@@ -35,93 +37,6 @@
 
 #define UB953_DEFAULT_CLKOUT_RATE	25000000UL
 
-#define UB953_REG_RESET_CTL			0x01
-#define UB953_REG_RESET_CTL_DIGITAL_RESET_1	BIT(1)
-#define UB953_REG_RESET_CTL_DIGITAL_RESET_0	BIT(0)
-
-#define UB953_REG_GENERAL_CFG			0x02
-#define UB953_REG_GENERAL_CFG_CONT_CLK		BIT(6)
-#define UB953_REG_GENERAL_CFG_CSI_LANE_SEL_SHIFT	4
-#define UB953_REG_GENERAL_CFG_CSI_LANE_SEL_MASK	GENMASK(5, 4)
-#define UB953_REG_GENERAL_CFG_CRC_TX_GEN_ENABLE	BIT(1)
-#define UB953_REG_GENERAL_CFG_I2C_STRAP_MODE	BIT(0)
-
-#define UB953_REG_MODE_SEL			0x03
-#define UB953_REG_MODE_SEL_MODE_DONE		BIT(3)
-#define UB953_REG_MODE_SEL_MODE_OVERRIDE	BIT(4)
-#define UB953_REG_MODE_SEL_MODE_MASK		GENMASK(2, 0)
-
-#define UB953_REG_CLKOUT_CTRL0			0x06
-#define UB953_REG_CLKOUT_CTRL1			0x07
-
-#define UB953_REG_I2C_CONTROL2			0x0a
-#define UB953_REG_I2C_CONTROL2_SDA_OUTPUT_SETUP_SHIFT	4
-#define UB953_REG_I2C_CONTROL2_BUS_SPEEDUP	BIT(1)
-
-#define UB953_REG_SCL_HIGH_TIME			0x0b
-#define UB953_REG_SCL_LOW_TIME			0x0c
-
-#define UB953_REG_LOCAL_GPIO_DATA		0x0d
-#define UB953_REG_LOCAL_GPIO_DATA_GPIO_RMTEN(n)		BIT(4 + (n))
-#define UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(n)	BIT(0 + (n))
-
-#define UB953_REG_GPIO_INPUT_CTRL		0x0e
-#define UB953_REG_GPIO_INPUT_CTRL_OUT_EN(n)	BIT(4 + (n))
-#define UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(n)	BIT(0 + (n))
-
-#define UB953_REG_BC_CTRL			0x49
-#define UB953_REG_BC_CTRL_CRC_ERR_CLR		BIT(3)
-
-#define UB953_REG_REV_MASK_ID			0x50
-#define UB953_REG_GENERAL_STATUS		0x52
-
-#define UB953_REG_GPIO_PIN_STS			0x53
-#define UB953_REG_GPIO_PIN_STS_GPIO_STS(n)	BIT(0 + (n))
-
-#define UB953_REG_BIST_ERR_CNT			0x54
-#define UB953_REG_CRC_ERR_CNT1			0x55
-#define UB953_REG_CRC_ERR_CNT2			0x56
-
-#define UB953_REG_CSI_ERR_CNT			0x5c
-#define UB953_REG_CSI_ERR_STATUS		0x5d
-#define UB953_REG_CSI_ERR_DLANE01		0x5e
-#define UB953_REG_CSI_ERR_DLANE23		0x5f
-#define UB953_REG_CSI_ERR_CLK_LANE		0x60
-#define UB953_REG_CSI_PKT_HDR_VC_ID		0x61
-#define UB953_REG_PKT_HDR_WC_LSB		0x62
-#define UB953_REG_PKT_HDR_WC_MSB		0x63
-#define UB953_REG_CSI_ECC			0x64
-
-#define UB953_REG_IND_ACC_CTL			0xb0
-#define UB953_REG_IND_ACC_ADDR			0xb1
-#define UB953_REG_IND_ACC_DATA			0xb2
-
-#define UB953_REG_FPD3_RX_ID(n)			(0xf0 + (n))
-#define UB953_REG_FPD3_RX_ID_LEN		6
-
-/* Indirect register blocks */
-#define UB953_IND_TARGET_PAT_GEN		0x00
-#define UB953_IND_TARGET_FPD3_TX		0x01
-#define UB953_IND_TARGET_DIE_ID			0x02
-
-#define UB953_IND_PGEN_CTL			0x01
-#define UB953_IND_PGEN_CTL_PGEN_ENABLE		BIT(0)
-#define UB953_IND_PGEN_CFG			0x02
-#define UB953_IND_PGEN_CSI_DI			0x03
-#define UB953_IND_PGEN_LINE_SIZE1		0x04
-#define UB953_IND_PGEN_LINE_SIZE0		0x05
-#define UB953_IND_PGEN_BAR_SIZE1		0x06
-#define UB953_IND_PGEN_BAR_SIZE0		0x07
-#define UB953_IND_PGEN_ACT_LPF1			0x08
-#define UB953_IND_PGEN_ACT_LPF0			0x09
-#define UB953_IND_PGEN_TOT_LPF1			0x0a
-#define UB953_IND_PGEN_TOT_LPF0			0x0b
-#define UB953_IND_PGEN_LINE_PD1			0x0c
-#define UB953_IND_PGEN_LINE_PD0			0x0d
-#define UB953_IND_PGEN_VBP			0x0e
-#define UB953_IND_PGEN_VFP			0x0f
-#define UB953_IND_PGEN_COLOR(n)			(0x10 + (n)) /* n <= 15 */
-
 /* Note: Only sync mode supported for now */
 enum ub953_mode {
 	/* FPD-Link III CSI-2 synchronous mode */
diff --git a/drivers/media/i2c/ds90ub953.h b/drivers/media/i2c/ds90ub953.h
new file mode 100644
index 000000000000..8bb28f0daee9
--- /dev/null
+++ b/drivers/media/i2c/ds90ub953.h
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __MEDIA_I2C_DS90UB953_H__
+#define __MEDIA_I2C_DS90UB953_H__
+
+#include <linux/types.h>
+
+#define UB953_REG_RESET_CTL			0x01
+#define UB953_REG_RESET_CTL_DIGITAL_RESET_1	BIT(1)
+#define UB953_REG_RESET_CTL_DIGITAL_RESET_0	BIT(0)
+
+#define UB953_REG_GENERAL_CFG			0x02
+#define UB953_REG_GENERAL_CFG_CONT_CLK		BIT(6)
+#define UB953_REG_GENERAL_CFG_CSI_LANE_SEL_SHIFT	4
+#define UB953_REG_GENERAL_CFG_CSI_LANE_SEL_MASK	GENMASK(5, 4)
+#define UB953_REG_GENERAL_CFG_CRC_TX_GEN_ENABLE	BIT(1)
+#define UB953_REG_GENERAL_CFG_I2C_STRAP_MODE	BIT(0)
+
+#define UB953_REG_MODE_SEL			0x03
+#define UB953_REG_MODE_SEL_MODE_DONE		BIT(3)
+#define UB953_REG_MODE_SEL_MODE_OVERRIDE	BIT(4)
+#define UB953_REG_MODE_SEL_MODE_MASK		GENMASK(2, 0)
+
+#define UB953_REG_CLKOUT_CTRL0			0x06
+#define UB953_REG_CLKOUT_CTRL1			0x07
+
+#define UB953_REG_I2C_CONTROL2			0x0a
+#define UB953_REG_I2C_CONTROL2_SDA_OUTPUT_SETUP_SHIFT	4
+#define UB953_REG_I2C_CONTROL2_BUS_SPEEDUP	BIT(1)
+
+#define UB953_REG_SCL_HIGH_TIME			0x0b
+#define UB953_REG_SCL_LOW_TIME			0x0c
+
+#define UB953_REG_LOCAL_GPIO_DATA		0x0d
+#define UB953_REG_LOCAL_GPIO_DATA_GPIO_RMTEN(n)		BIT(4 + (n))
+#define UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(n)	BIT(0 + (n))
+
+#define UB953_REG_GPIO_INPUT_CTRL		0x0e
+#define UB953_REG_GPIO_INPUT_CTRL_OUT_EN(n)	BIT(4 + (n))
+#define UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(n)	BIT(0 + (n))
+
+#define UB953_REG_BC_CTRL			0x49
+#define UB953_REG_BC_CTRL_CRC_ERR_CLR		BIT(3)
+
+#define UB953_REG_REV_MASK_ID			0x50
+#define UB953_REG_GENERAL_STATUS		0x52
+
+#define UB953_REG_GPIO_PIN_STS			0x53
+#define UB953_REG_GPIO_PIN_STS_GPIO_STS(n)	BIT(0 + (n))
+
+#define UB953_REG_BIST_ERR_CNT			0x54
+#define UB953_REG_CRC_ERR_CNT1			0x55
+#define UB953_REG_CRC_ERR_CNT2			0x56
+
+#define UB953_REG_CSI_ERR_CNT			0x5c
+#define UB953_REG_CSI_ERR_STATUS		0x5d
+#define UB953_REG_CSI_ERR_DLANE01		0x5e
+#define UB953_REG_CSI_ERR_DLANE23		0x5f
+#define UB953_REG_CSI_ERR_CLK_LANE		0x60
+#define UB953_REG_CSI_PKT_HDR_VC_ID		0x61
+#define UB953_REG_PKT_HDR_WC_LSB		0x62
+#define UB953_REG_PKT_HDR_WC_MSB		0x63
+#define UB953_REG_CSI_ECC			0x64
+
+#define UB953_REG_IND_ACC_CTL			0xb0
+#define UB953_REG_IND_ACC_ADDR			0xb1
+#define UB953_REG_IND_ACC_DATA			0xb2
+
+#define UB953_REG_FPD3_RX_ID(n)			(0xf0 + (n))
+#define UB953_REG_FPD3_RX_ID_LEN		6
+
+/* Indirect register blocks */
+#define UB953_IND_TARGET_PAT_GEN		0x00
+#define UB953_IND_TARGET_FPD3_TX		0x01
+#define UB953_IND_TARGET_DIE_ID			0x02
+
+#define UB953_IND_PGEN_CTL			0x01
+#define UB953_IND_PGEN_CTL_PGEN_ENABLE		BIT(0)
+#define UB953_IND_PGEN_CFG			0x02
+#define UB953_IND_PGEN_CSI_DI			0x03
+#define UB953_IND_PGEN_LINE_SIZE1		0x04
+#define UB953_IND_PGEN_LINE_SIZE0		0x05
+#define UB953_IND_PGEN_BAR_SIZE1		0x06
+#define UB953_IND_PGEN_BAR_SIZE0		0x07
+#define UB953_IND_PGEN_ACT_LPF1			0x08
+#define UB953_IND_PGEN_ACT_LPF0			0x09
+#define UB953_IND_PGEN_TOT_LPF1			0x0a
+#define UB953_IND_PGEN_TOT_LPF0			0x0b
+#define UB953_IND_PGEN_LINE_PD1			0x0c
+#define UB953_IND_PGEN_LINE_PD0			0x0d
+#define UB953_IND_PGEN_VBP			0x0e
+#define UB953_IND_PGEN_VFP			0x0f
+#define UB953_IND_PGEN_COLOR(n)			(0x10 + (n)) /* n <= 15 */
+
+#endif /* __MEDIA_I2C_DS90UB953_H__ */

-- 
2.43.0


