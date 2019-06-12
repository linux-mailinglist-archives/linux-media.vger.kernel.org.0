Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 846B342139
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 11:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437585AbfFLJmM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 05:42:12 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:55703 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437405AbfFLJmM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 05:42:12 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hazli-0005ur-Fx; Wed, 12 Jun 2019 11:42:10 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>, kernel@pengutronix.de
Subject: [PATCH v7] media: hantro: Add support for MPEG-2 decoding on RK3328
Date:   Wed, 12 Jun 2019 11:42:08 +0200
Message-Id: <20190612094208.20221-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jonas Karlman <jonas@kwiboo.se>

Add necessary bits to support MPEG2 decoding on RK3328.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes since v6 [1]:
- Rebased onto Hantro rename series [2]

[1] https://patchwork.linuxtv.org/patch/56402/
[2] https://patchwork.linuxtv.org/cover/56825/
---
 drivers/staging/media/hantro/Kconfig         |  2 +-
 drivers/staging/media/hantro/hantro_drv.c    |  1 +
 drivers/staging/media/hantro/rk3399_vpu_hw.c | 17 +++++++++++++++++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/Kconfig b/drivers/staging/media/hantro/Kconfig
index e0627ce454fc..99aed9a5b0b9 100644
--- a/drivers/staging/media/hantro/Kconfig
+++ b/drivers/staging/media/hantro/Kconfig
@@ -28,4 +28,4 @@ config VIDEO_HANTRO_ROCKCHIP
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
 	default y
 	help
-	  Enable support for RK3288 and RK3399 SoCs.
+	  Enable support for RK3288, RK3328, and RK3399 SoCs.
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index af26672b4538..1187a6ca68be 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -417,6 +417,7 @@ static const struct v4l2_file_operations hantro_fops = {
 static const struct of_device_id of_hantro_match[] = {
 #ifdef CONFIG_VIDEO_HANTRO_ROCKCHIP
 	{ .compatible = "rockchip,rk3399-vpu", .data = &rk3399_vpu_variant, },
+	{ .compatible = "rockchip,rk3328-vpu", .data = &rk3328_vpu_variant, },
 	{ .compatible = "rockchip,rk3288-vpu", .data = &rk3288_vpu_variant, },
 #endif
 #ifdef CONFIG_VIDEO_HANTRO_IMX8M
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw.c b/drivers/staging/media/hantro/rk3399_vpu_hw.c
index 5718f8063542..f8400e49bc50 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw.c
@@ -184,3 +184,20 @@ const struct hantro_variant rk3399_vpu_variant = {
 	.clk_names = rk3399_clk_names,
 	.num_clocks = ARRAY_SIZE(rk3399_clk_names)
 };
+
+static const struct hantro_irq rk3328_irqs[] = {
+	{ "vdpu", rk3399_vdpu_irq },
+};
+
+const struct hantro_variant rk3328_vpu_variant = {
+	.dec_offset = 0x400,
+	.dec_fmts = rk3399_vpu_dec_fmts,
+	.num_dec_fmts = ARRAY_SIZE(rk3399_vpu_dec_fmts),
+	.codec = HANTRO_MPEG2_DECODER,
+	.codec_ops = rk3399_vpu_codec_ops,
+	.irqs = rk3328_irqs,
+	.num_irqs = ARRAY_SIZE(rk3328_irqs),
+	.init = rk3399_vpu_hw_init,
+	.clk_names = rk3399_clk_names,
+	.num_clocks = ARRAY_SIZE(rk3399_clk_names),
+};
-- 
2.20.1

