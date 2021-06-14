Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A11F3A656F
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 13:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236134AbhFNLiA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 07:38:00 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58260 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235888AbhFNLf7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 07:35:59 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 396C55E99;
        Mon, 14 Jun 2021 13:24:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623669847;
        bh=G7Vf0Pj/hW2bpB0JTOfWOzNd4U+LmtjrcKCJ8VJ1dds=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=G2C63dU8N3YcHjjaqcWsGsNJMrigPvtNw08AEz79zfU+M17LDFVk9+n9aw7Sc1thY
         qc0xlrn8KUOE1seKHWZjaUnfUh/KeNw1WYM4mSs6TwWVuq9+hTQp935cUnPofqUtyS
         ulqPmBOzV9KqaZhw3dOefE/MS4IigBr6esp5/wM4=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 13/35] media: ti-vpe: cal: clean up CAL_CSI2_VC_IRQ_* macros
Date:   Mon, 14 Jun 2021 14:23:23 +0300
Message-Id: <20210614112345.2032435-14-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
References: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The macros related to CAL_CSI2_VC_IRQ can be handled better by having
the VC number as a macro parameter.

Note that the macros are not used anywhere yet, so no other changes are
needed.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal_regs.h | 30 +++++-------------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal_regs.h b/drivers/media/platform/ti-vpe/cal_regs.h
index 94cb4f329cf3..7eeceeeb303e 100644
--- a/drivers/media/platform/ti-vpe/cal_regs.h
+++ b/drivers/media/platform/ti-vpe/cal_regs.h
@@ -406,30 +406,12 @@
 #define CAL_CSI2_TIMING_STOP_STATE_X16_IO1_MASK		BIT(14)
 #define CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK		BIT(15)
 
-#define CAL_CSI2_VC_IRQ_FS_IRQ_0_MASK			BIT(0)
-#define CAL_CSI2_VC_IRQ_FE_IRQ_0_MASK			BIT(1)
-#define CAL_CSI2_VC_IRQ_LS_IRQ_0_MASK			BIT(2)
-#define CAL_CSI2_VC_IRQ_LE_IRQ_0_MASK			BIT(3)
-#define CAL_CSI2_VC_IRQ_CS_IRQ_0_MASK			BIT(4)
-#define CAL_CSI2_VC_IRQ_ECC_CORRECTION0_IRQ_0_MASK	BIT(5)
-#define CAL_CSI2_VC_IRQ_FS_IRQ_1_MASK			BIT(8)
-#define CAL_CSI2_VC_IRQ_FE_IRQ_1_MASK			BIT(9)
-#define CAL_CSI2_VC_IRQ_LS_IRQ_1_MASK			BIT(10)
-#define CAL_CSI2_VC_IRQ_LE_IRQ_1_MASK			BIT(11)
-#define CAL_CSI2_VC_IRQ_CS_IRQ_1_MASK			BIT(12)
-#define CAL_CSI2_VC_IRQ_ECC_CORRECTION0_IRQ_1_MASK	BIT(13)
-#define CAL_CSI2_VC_IRQ_FS_IRQ_2_MASK			BIT(16)
-#define CAL_CSI2_VC_IRQ_FE_IRQ_2_MASK			BIT(17)
-#define CAL_CSI2_VC_IRQ_LS_IRQ_2_MASK			BIT(18)
-#define CAL_CSI2_VC_IRQ_LE_IRQ_2_MASK			BIT(19)
-#define CAL_CSI2_VC_IRQ_CS_IRQ_2_MASK			BIT(20)
-#define CAL_CSI2_VC_IRQ_ECC_CORRECTION0_IRQ_2_MASK	BIT(21)
-#define CAL_CSI2_VC_IRQ_FS_IRQ_3_MASK			BIT(24)
-#define CAL_CSI2_VC_IRQ_FE_IRQ_3_MASK			BIT(25)
-#define CAL_CSI2_VC_IRQ_LS_IRQ_3_MASK			BIT(26)
-#define CAL_CSI2_VC_IRQ_LE_IRQ_3_MASK			BIT(27)
-#define CAL_CSI2_VC_IRQ_CS_IRQ_3_MASK			BIT(28)
-#define CAL_CSI2_VC_IRQ_ECC_CORRECTION0_IRQ_3_MASK	BIT(29)
+#define CAL_CSI2_VC_IRQ_FS_IRQ_MASK(n)			BIT(0 + ((n) * 8))
+#define CAL_CSI2_VC_IRQ_FE_IRQ_MASK(n)			BIT(1 + ((n) * 8))
+#define CAL_CSI2_VC_IRQ_LS_IRQ_MASK(n)			BIT(2 + ((n) * 8))
+#define CAL_CSI2_VC_IRQ_LE_IRQ_MASK(n)			BIT(3 + ((n) * 8))
+#define CAL_CSI2_VC_IRQ_CS_IRQ_MASK(n)			BIT(4 + ((n) * 8))
+#define CAL_CSI2_VC_IRQ_ECC_CORRECTION_IRQ_MASK(n)	BIT(5 + ((n) * 8))
 
 #define CAL_CSI2_CTX_DT_MASK		GENMASK(5, 0)
 #define CAL_CSI2_CTX_VC_MASK		GENMASK(7, 6)
-- 
2.25.1

