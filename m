Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CDB828C37E
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 22:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731627AbgJLU64 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 16:58:56 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49772 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729460AbgJLU64 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 16:58:56 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aratiu)
        with ESMTPSA id 6294E1F44C2A
From:   Adrian Ratiu <adrian.ratiu@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Mark Brown <broonie@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fruehberger Peter <Peter.Fruehberger@de.bosch.com>,
        kuhanh.murugasen.krishnan@intel.com,
        Daniel Vetter <daniel@ffwll.ch>, kernel@collabora.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/18] media: hantro: document all int reg bits up to vc8000
Date:   Mon, 12 Oct 2020 23:59:40 +0300
Message-Id: <20201012205957.889185-2-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012205957.889185-1-adrian.ratiu@collabora.com>
References: <20201012205957.889185-1-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These do not all strictly belong to the g1 core and even the majority
of previously documented bits were not used (yet) by the driver irq
handlers, but it's still very useful to have an overview of all IRQs,
especially since starting with core versions vc8000 and later the irq
bits previously used by G1 and G2 have been merged at the same address.

Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
 drivers/staging/media/hantro/hantro_g1_regs.h | 39 +++++++++++++------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g1_regs.h b/drivers/staging/media/hantro/hantro_g1_regs.h
index c1756e3d5391..80ff297f6f68 100644
--- a/drivers/staging/media/hantro/hantro_g1_regs.h
+++ b/drivers/staging/media/hantro/hantro_g1_regs.h
@@ -13,17 +13,34 @@
 
 /* Decoder registers. */
 #define G1_REG_INTERRUPT				0x004
-#define     G1_REG_INTERRUPT_DEC_PIC_INF		BIT(24)
-#define     G1_REG_INTERRUPT_DEC_TIMEOUT		BIT(18)
-#define     G1_REG_INTERRUPT_DEC_SLICE_INT		BIT(17)
-#define     G1_REG_INTERRUPT_DEC_ERROR_INT		BIT(16)
-#define     G1_REG_INTERRUPT_DEC_ASO_INT		BIT(15)
-#define     G1_REG_INTERRUPT_DEC_BUFFER_INT		BIT(14)
-#define     G1_REG_INTERRUPT_DEC_BUS_INT		BIT(13)
-#define     G1_REG_INTERRUPT_DEC_RDY_INT		BIT(12)
-#define     G1_REG_INTERRUPT_DEC_IRQ			BIT(8)
-#define     G1_REG_INTERRUPT_DEC_IRQ_DIS		BIT(4)
-#define     G1_REG_INTERRUPT_DEC_E			BIT(0)
+/* Interrupt bits. Some are present in:
+ *    - all core versions (">= g1")
+ *    - g1, missing in g2, but added back starting with vc8000d ("not in g2")
+ *    - vc8000d and later (">= vc8000d")
+ */
+#define     G1_REG_INTERRUPT_DEC_PIC_INF		BIT(24) /* not in g2 */
+#define     G1_REG_INTERRUPT_DEC_TILE_INT		BIT(23) /* >= vc8000d */
+#define     G1_REG_INTERRUPT_DEC_LINE_CNT_INT		BIT(22) /* >= vc8000d */
+#define     G1_REG_INTERRUPT_DEC_EXT_TIMEOUT_INT	BIT(21) /* >= vc8000d */
+#define     G1_REG_INTERRUPT_DEC_NO_SLICE_INT		BIT(20) /* >= vc8000d */
+#define     G1_REG_INTERRUPT_DEC_LAST_SLICE_INT		BIT(19) /* >= vc8000d */
+#define     G1_REG_INTERRUPT_DEC_TIMEOUT		BIT(18) /* >= g1 */
+#define     G1_REG_INTERRUPT_DEC_SLICE_INT		BIT(17) /* not in g2 */
+#define     G1_REG_INTERRUPT_DEC_ERROR_INT		BIT(16) /* >= g1 */
+#define     G1_REG_INTERRUPT_DEC_ASO_INT		BIT(15) /* not in g2 */
+#define     G1_REG_INTERRUPT_DEC_BUFFER_INT		BIT(14) /* >= g1 */
+#define     G1_REG_INTERRUPT_DEC_BUS_INT		BIT(13) /* >= g1 */
+#define     G1_REG_INTERRUPT_DEC_RDY_INT		BIT(12) /* >= g1 */
+#define     G1_REG_INTERRUPT_DEC_ABORT_INT		BIT(11) /* >= g2 */
+#define     G1_REG_INTERRUPT_DEC_IRQ			BIT(8) /* >= g1 */
+#define     G1_REG_INTERRUPT_DEC_TILE_INT_E		BIT(7) /* >= vc8000d */
+#define     G1_REG_INTERRUPT_DEC_SELF_RESET_DIS		BIT(6) /* >= vc8000d */
+#define     G1_REG_INTERRUPT_DEC_ABORT_E		BIT(5) /* >= vc8000d */
+#define     G1_REG_INTERRUPT_DEC_IRQ_DIS		BIT(4) /* >= g1 */
+#define     G1_REG_INTERRUPT_DEC_TIMEOUT_SOURCE		BIT(3) /* >= vc8000d */
+#define     G1_REG_INTERRUPT_DEC_BUS_INT_DIS		BIT(2) /* >= vc8000d */
+#define     G1_REG_INTERRUPT_DEC_STRM_CORRUPTED		BIT(1) /* >= vc8000d */
+#define     G1_REG_INTERRUPT_DEC_E			BIT(0) /* >= g1 */
 #define G1_REG_CONFIG					0x008
 #define     G1_REG_CONFIG_DEC_AXI_RD_ID(x)		(((x) & 0xff) << 24)
 #define     G1_REG_CONFIG_DEC_TIMEOUT_E			BIT(23)
-- 
2.28.0

