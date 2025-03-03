Return-Path: <linux-media+bounces-27376-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A99A4C642
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:10:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E7777A9020
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276F5235375;
	Mon,  3 Mar 2025 16:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cp6NskWy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4542218851;
	Mon,  3 Mar 2025 16:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741017830; cv=none; b=OtCdAJyOttwgx9NhZVXupxJ81jX6xDHlKfkdmumR4TQkG6ofiIfTGA8RL+6DvqKMXJLq7MoGdRIIcRCLjXEj8tfPMTU3PKzS03n+CF/g37VFjae/kc+5gYvZ8bSy7846SuMAOmZthuzCpkXEjldn/jguy27NGxe+erPdTnC+y1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741017830; c=relaxed/simple;
	bh=zZPbJRVbcv3vSObeofkVZ/Xpu8cPwCJC/Sr7IjprMaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HzYCtighIarjem3YlPz5tgCU75fhrZRa/WJXveEKvEO3uLDjsOT92PA6FWZXn1DsdWWzaE55D+Ruj+scT6TsT6596WeDCNySvJ3044LRsCbjz+C70g7dCHV53IfMiGtxnIa1HsDwQrCAojv1buQ+B7QiL271U0rFuKIk51PYlmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cp6NskWy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:8872:6fe4:6987:313:70cc])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4FF822A;
	Mon,  3 Mar 2025 17:02:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1741017736;
	bh=zZPbJRVbcv3vSObeofkVZ/Xpu8cPwCJC/Sr7IjprMaY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cp6NskWyzosAENt6Nv9ZT/HxRWWqCdzL0fizFndoGPqa2vmMpRG0hap+wOy9JWGiK
	 U7rYxi5ee5Gu/43ZeJfPvoR/ctxVOBRC2OrSvxXoWy8oe5lLsjyu/H6CIwsxVeXZCM
	 O4yqGXrlYQWY9X391vR+EJ7zLb15ND5zBOmjknV8=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 03 Mar 2025 21:32:20 +0530
Subject: [PATCH v3 17/19] media: i2c: ds90ub953: Move reg defines to a
 header file
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-b4-ub9xx-err-handling-v3-17-7d178796a2b9@ideasonboard.com>
References: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
In-Reply-To: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Devarsh Thakkar <devarsht@ti.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7898;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=4hyGHzLF7tBxcUAYN2w6HvfNNMkRys4uf6IgSl7J+9w=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnxdKAJSKGx8opZc0uDkQQbykpYCB+qfBO9wf57
 FVNX+tt0J6JAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ8XSgAAKCRBD3pH5JJpx
 RUjNEACmSH6KZ0/C90uPfGGSjBgJj3sqdrVZ44NjYLWk+nTMkS1w1BUKiu3+iSda9seru5RNhiD
 X5JejmfinfDUcI7BdHGzAPSozUR/wzdsetSxHLHFNjBbIu+ogrIW3mujpKN6pF/bf9fC1I1/rBa
 cCesNzIzCOAmSLqVoBN/o0adQ2hB08lO7jRWmTIQMQl5BY65XCA/WaFQQ9bP4vzFanOtgKIVti6
 j+q9hG+kQiWAtWBf3U5O9FUJ0NeO2NwYUNHiybeOjb1hl8w0uBr9WZyly+cqOVrrq951dHlPfZt
 i3OG3GWzU0RYSD5sP0x8lheNaxgQEWkwcNndxkkVw7g4q0OB5eqBp7gOT8vApys9R91YlPYyRK2
 2oJeUUWk5a9QUj6d+JsBJoXW2t90d1Vght/uRFowdZbGOXPcxvmCefkU/OMsfsp6kE7ZfElET3D
 X1bckwYQwlqphn/hxQ/Tt1+0QR/H3yi+6ra4gjGTr/OiFQFGi4R1oJPtbuX+DQpJNUcVhC7yyLZ
 k3/wqezJsWqkV4zTZyg2ghpYf7YwNxZ621jDDmlF4DliBFNlctQzHv/dQx45E9wo9BhNfh1jY0k
 ZuvzbSgk07mxcE0roJm1sg1U76aGYCMYLQvWtnrlpKdk67S81l1UE+Y5I0Vi+xx40I9AYkHHJJe
 uIwsjoj7Wj0HPkg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Move UB953 register defines to a header file. This is done so that the
deserializer driver can access the defines, and do some early
serializer configuration.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ds90ub953.c | 89 +---------------------------------------
 drivers/media/i2c/ds90ub953.h | 95 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+), 87 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index a5c23e94f4eab5896a2114cfdf2e5f68cde77568..c305b4e03e07798b6526ff2423811f3f7d5bdac8 100644
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
index 0000000000000000000000000000000000000000..8bb28f0daee96044a7bf838a680e506af4f70f10
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
2.48.1


