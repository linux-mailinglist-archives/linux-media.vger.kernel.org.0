Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E596628C37F
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 22:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731722AbgJLU7A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 16:59:00 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49802 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730339AbgJLU64 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 16:58:56 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aratiu)
        with ESMTPSA id 984B81F44C2C
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
Subject: [PATCH 03/18] media: hantro: make G1_REG_SOFT_RESET Rockchip specific
Date:   Mon, 12 Oct 2020 23:59:42 +0300
Message-Id: <20201012205957.889185-4-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012205957.889185-1-adrian.ratiu@collabora.com>
References: <20201012205957.889185-1-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This register is not documented in either the G1 or VC8000D register
maps and on VC8000D there is a conflict because at the same offset the
VPU IP defines another register with a very different meaning.

What likely happened is the HW integrator which uses only the G1 IP
core added some reset/control logic at the end of the VPU map, so
it makes sense to make this register RK-specific.

Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
 drivers/staging/media/hantro/hantro_g1_regs.h | 1 -
 drivers/staging/media/hantro/rk3288_vpu_hw.c  | 4 +++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g1_regs.h b/drivers/staging/media/hantro/hantro_g1_regs.h
index 073b64cbe295..a482a2ba6dfe 100644
--- a/drivers/staging/media/hantro/hantro_g1_regs.h
+++ b/drivers/staging/media/hantro/hantro_g1_regs.h
@@ -315,7 +315,6 @@
 #define     G1_REG_REF_BUF_CTRL2_REFBU2_THR(x)		(((x) & 0xfff) << 19)
 #define     G1_REG_REF_BUF_CTRL2_REFBU2_PICID(x)	(((x) & 0x1f) << 14)
 #define     G1_REG_REF_BUF_CTRL2_APF_THRESHOLD(x)	(((x) & 0x3fff) << 0)
-#define G1_REG_SOFT_RESET				0x194
 
 /* Post-processor registers. */
 #define G1_REG_PP_INTERRUPT		G1_SWREG(60)
diff --git a/drivers/staging/media/hantro/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
index 7b299ee3e93d..4ad578b1236e 100644
--- a/drivers/staging/media/hantro/rk3288_vpu_hw.c
+++ b/drivers/staging/media/hantro/rk3288_vpu_hw.c
@@ -13,6 +13,8 @@
 #include "hantro_g1_regs.h"
 #include "hantro_h1_regs.h"
 
+#define VDPU_REG_SOFT_RESET 0x194
+
 #define RK3288_ACLK_MAX_FREQ (400 * 1000 * 1000)
 
 /*
@@ -167,7 +169,7 @@ static void rk3288_vpu_dec_reset(struct hantro_ctx *ctx)
 
 	vdpu_write(vpu, G1_REG_INTERRUPT_DEC_IRQ_DIS, G1_REG_INTERRUPT);
 	vdpu_write(vpu, G1_REG_CONFIG_DEC_CLK_GATE_E, G1_REG_CONFIG);
-	vdpu_write(vpu, 1, G1_REG_SOFT_RESET);
+	vdpu_write(vpu, 1, VDPU_REG_SOFT_RESET);
 }
 
 /*
-- 
2.28.0

