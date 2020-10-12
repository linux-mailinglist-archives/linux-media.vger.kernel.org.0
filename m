Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F44528C3A5
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 23:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732012AbgJLVAE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 17:00:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731693AbgJLU66 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 16:58:58 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85667C0613D2;
        Mon, 12 Oct 2020 13:58:58 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aratiu)
        with ESMTPSA id 046F91F44C3A
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
Subject: [PATCH 07/18] regmap: mmio: add config option to allow relaxed MMIO accesses
Date:   Mon, 12 Oct 2020 23:59:46 +0300
Message-Id: <20201012205957.889185-8-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012205957.889185-1-adrian.ratiu@collabora.com>
References: <20201012205957.889185-1-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On some platforms (eg armv7 due to the CONFIG_ARM_DMA_MEM_BUFFERABLE)
MMIO R/W operations always add memory barriers which can increase load,
decrease battery life or in general reduce performance unnecessarily
on devices which access a lot of configuration registers and where
ordering does not matter (eg. media accelerators like the Verisilicon /
Hantro video decoders).

Drivers used to call the relaxed MMIO variants directly but since they
are now accessing the MMIO registers via regmaps (to compensate for
for different VPU HW reg layouts via regmap fields), there is a need
for a relaxed API / config to preserve their existing behaviour.

Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
 drivers/base/regmap/regmap-mmio.c | 34 +++++++++++++++++++++++++++----
 include/linux/regmap.h            |  5 +++++
 2 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/base/regmap/regmap-mmio.c b/drivers/base/regmap/regmap-mmio.c
index af967d8f975e..21193ef2a923 100644
--- a/drivers/base/regmap/regmap-mmio.c
+++ b/drivers/base/regmap/regmap-mmio.c
@@ -16,6 +16,7 @@
 struct regmap_mmio_context {
 	void __iomem *regs;
 	unsigned val_bytes;
+	bool relaxed_mmio;
 
 	bool attached_clk;
 	struct clk *clk;
@@ -72,14 +73,20 @@ static void regmap_mmio_write8(struct regmap_mmio_context *ctx,
 				unsigned int reg,
 				unsigned int val)
 {
-	writeb(val, ctx->regs + reg);
+	if (ctx->relaxed_mmio)
+		writeb_relaxed(val, ctx->regs + reg);
+	else
+		writeb(val, ctx->regs + reg);
 }
 
 static void regmap_mmio_write16le(struct regmap_mmio_context *ctx,
 				  unsigned int reg,
 				  unsigned int val)
 {
-	writew(val, ctx->regs + reg);
+	if (ctx->relaxed_mmio)
+		writew_relaxed(val, ctx->regs + reg);
+	else
+		writew(val, ctx->regs + reg);
 }
 
 static void regmap_mmio_write16be(struct regmap_mmio_context *ctx,
@@ -93,7 +100,10 @@ static void regmap_mmio_write32le(struct regmap_mmio_context *ctx,
 				  unsigned int reg,
 				  unsigned int val)
 {
-	writel(val, ctx->regs + reg);
+	if (ctx->relaxed_mmio)
+		writel_relaxed(val, ctx->regs + reg);
+	else
+		writel(val, ctx->regs + reg);
 }
 
 static void regmap_mmio_write32be(struct regmap_mmio_context *ctx,
@@ -108,7 +118,10 @@ static void regmap_mmio_write64le(struct regmap_mmio_context *ctx,
 				  unsigned int reg,
 				  unsigned int val)
 {
-	writeq(val, ctx->regs + reg);
+	if (ctx->relaxed_mmio)
+		writeq_relaxed(val, ctx->regs + reg);
+	else
+		writeq(val, ctx->regs + reg);
 }
 #endif
 
@@ -134,12 +147,18 @@ static int regmap_mmio_write(void *context, unsigned int reg, unsigned int val)
 static unsigned int regmap_mmio_read8(struct regmap_mmio_context *ctx,
 				      unsigned int reg)
 {
+	if (ctx->relaxed_mmio)
+		return readb_relaxed(ctx->regs + reg);
+
 	return readb(ctx->regs + reg);
 }
 
 static unsigned int regmap_mmio_read16le(struct regmap_mmio_context *ctx,
 				         unsigned int reg)
 {
+	if (ctx->relaxed_mmio)
+		return readw_relaxed(ctx->regs + reg);
+
 	return readw(ctx->regs + reg);
 }
 
@@ -152,6 +171,9 @@ static unsigned int regmap_mmio_read16be(struct regmap_mmio_context *ctx,
 static unsigned int regmap_mmio_read32le(struct regmap_mmio_context *ctx,
 				         unsigned int reg)
 {
+	if (ctx->relaxed_mmio)
+		return readl_relaxed(ctx->regs + reg);
+
 	return readl(ctx->regs + reg);
 }
 
@@ -165,6 +187,9 @@ static unsigned int regmap_mmio_read32be(struct regmap_mmio_context *ctx,
 static unsigned int regmap_mmio_read64le(struct regmap_mmio_context *ctx,
 				         unsigned int reg)
 {
+	if (ctx->relaxed_mmio)
+		return readq_relaxed(ctx->regs + reg);
+
 	return readq(ctx->regs + reg);
 }
 #endif
@@ -237,6 +262,7 @@ static struct regmap_mmio_context *regmap_mmio_gen_context(struct device *dev,
 
 	ctx->regs = regs;
 	ctx->val_bytes = config->val_bits / 8;
+	ctx->relaxed_mmio = config->use_relaxed_mmio;
 	ctx->clk = ERR_PTR(-ENODEV);
 
 	switch (regmap_get_val_endian(dev, &regmap_mmio, config)) {
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index e7834d98207f..126fe700d1d8 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -315,6 +315,10 @@ typedef void (*regmap_unlock)(void *);
  *                   masks are used.
  * @zero_flag_mask: If set, read_flag_mask and write_flag_mask are used even
  *                   if they are both empty.
+ * @use_relaxed_mmio: If set, MMIO R/W operations will not use memory barriers.
+ *                    This can avoid load on devices which don't require strict
+ *                    orderings, but drivers should carefully add any explicit
+ *                    memory barriers when they may require them.
  * @use_single_read: If set, converts the bulk read operation into a series of
  *                   single read operations. This is useful for a device that
  *                   does not support  bulk read.
@@ -388,6 +392,7 @@ struct regmap_config {
 
 	bool use_single_read;
 	bool use_single_write;
+	bool use_relaxed_mmio;
 	bool can_multi_write;
 
 	enum regmap_endian reg_format_endian;
-- 
2.28.0

