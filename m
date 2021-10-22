Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD6E437328
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 09:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232377AbhJVH40 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 03:56:26 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:55127 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232382AbhJVH4T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 03:56:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634889242; x=1666425242;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9AEfk4Ejtyle8LNhVaGLs0EoD420ZJuqh72yczV22pU=;
  b=HWHfPGyXrkSn+3eK87RTPpK7jgnYF8O2ha9aBo10z9g79FsV2xJrobd7
   YeRIBscmyLMCkoMxtNi9QpV2V5cQxTaksuSGCA6woZ/1IrJNG4eMrR6FL
   hKyu/ZAYNCiHZwX5WZeLxot5kgNq8K+h4AszSEA0Ijg2y8i9pA9tgqBWs
   z0IFnjbGjl17r1VFmveROHyniKrMf9eEmqTwgSnGfbm4vLmCNhnN34VQ2
   eS9jiCqLtBKBCkycKyKyDO6VNj34+/AFTgZISVPAYF5t2IUk0KySpGQor
   V7uSltb2PosSruUFFJQXKGShNrPhrv4QuaHwZN9esnOSIqaBf+NBvT2lU
   A==;
IronPort-SDR: eZ3SVDXYda8Pkor056Yqhx4z8RqWfohHzN7IQ7kHx051DV4H48kIe/SAxTo+gI8ZEDXym3TbgT
 Vl2L8ZZ+WLEIw520cVoEKpun4KXMv4RbVRTqNL1VMAf3JLPz7AbeShi0VypzTCovP7Mm+0IBgb
 L6tiUCh0c5KY8ULcTLUTqBc6lLkApUFlJOULpNS80LP11jsO6e2ZFeiY60XwPk/NPEnWvzvhMh
 GGSbUfcA24ZUpHKQgAfLENYtN9ZTmhg24Y+sRIcWUB8N8OIgcmSVOeYQOzrDEzA1XLMBQhqsrB
 pQpi9vkubN1ZeORmLQ8cfpCv
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; 
   d="scan'208";a="134007190"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Oct 2021 00:54:01 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 22 Oct 2021 00:54:01 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 22 Oct 2021 00:53:58 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <jacopo@jmondi.org>, <laurent.pinchart@ideasonboard.com>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 05/21] media: atmel: atmel-isc: split the clock code into separate source file
Date:   Fri, 22 Oct 2021 10:52:31 +0300
Message-ID: <20211022075247.518880-6-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022075247.518880-1-eugen.hristev@microchip.com>
References: <20211022075247.518880-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The atmel-isc-base is getting crowded. Split the clock functions into
atmel-isc-clk.c.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/Makefile         |   2 +-
 drivers/media/platform/atmel/atmel-isc-base.c | 294 ----------------
 drivers/media/platform/atmel/atmel-isc-clk.c  | 316 ++++++++++++++++++
 3 files changed, 317 insertions(+), 295 deletions(-)
 create mode 100644 drivers/media/platform/atmel/atmel-isc-clk.c

diff --git a/drivers/media/platform/atmel/Makefile b/drivers/media/platform/atmel/Makefile
index 39f0a7eba702..1f6fe7427769 100644
--- a/drivers/media/platform/atmel/Makefile
+++ b/drivers/media/platform/atmel/Makefile
@@ -3,7 +3,7 @@ atmel-isc-objs = atmel-sama5d2-isc.o
 atmel-xisc-objs = atmel-sama7g5-isc.o
 
 obj-$(CONFIG_VIDEO_ATMEL_ISI) += atmel-isi.o
-obj-$(CONFIG_VIDEO_ATMEL_ISC_BASE) += atmel-isc-base.o
+obj-$(CONFIG_VIDEO_ATMEL_ISC_BASE) += atmel-isc-base.o atmel-isc-clk.o
 obj-$(CONFIG_VIDEO_ATMEL_ISC) += atmel-isc.o
 obj-$(CONFIG_VIDEO_ATMEL_XISC) += atmel-xisc.o
 obj-$(CONFIG_VIDEO_MICROCHIP_CSI2DC) += microchip-csi2dc.o
diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index ebf264b980f9..f532fd03e807 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -8,9 +8,6 @@
  * Author: Eugen Hristev <eugen.hristev@microchip.com>
  *
  */
-
-#include <linux/clk.h>
-#include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
@@ -100,297 +97,6 @@ static inline void isc_reset_awb_ctrls(struct isc_device *isc)
 	}
 }
 
-static int isc_wait_clk_stable(struct clk_hw *hw)
-{
-	struct isc_clk *isc_clk = to_isc_clk(hw);
-	struct regmap *regmap = isc_clk->regmap;
-	unsigned long timeout = jiffies + usecs_to_jiffies(1000);
-	unsigned int status;
-
-	while (time_before(jiffies, timeout)) {
-		regmap_read(regmap, ISC_CLKSR, &status);
-		if (!(status & ISC_CLKSR_SIP))
-			return 0;
-
-		usleep_range(10, 250);
-	}
-
-	return -ETIMEDOUT;
-}
-
-static int isc_clk_prepare(struct clk_hw *hw)
-{
-	struct isc_clk *isc_clk = to_isc_clk(hw);
-	int ret;
-
-	ret = pm_runtime_resume_and_get(isc_clk->dev);
-	if (ret < 0)
-		return ret;
-
-	return isc_wait_clk_stable(hw);
-}
-
-static void isc_clk_unprepare(struct clk_hw *hw)
-{
-	struct isc_clk *isc_clk = to_isc_clk(hw);
-
-	isc_wait_clk_stable(hw);
-
-	pm_runtime_put_sync(isc_clk->dev);
-}
-
-static int isc_clk_enable(struct clk_hw *hw)
-{
-	struct isc_clk *isc_clk = to_isc_clk(hw);
-	u32 id = isc_clk->id;
-	struct regmap *regmap = isc_clk->regmap;
-	unsigned long flags;
-	unsigned int status;
-
-	dev_dbg(isc_clk->dev, "ISC CLK: %s, id = %d, div = %d, parent id = %d\n",
-		__func__, id, isc_clk->div, isc_clk->parent_id);
-
-	spin_lock_irqsave(&isc_clk->lock, flags);
-	regmap_update_bits(regmap, ISC_CLKCFG,
-			   ISC_CLKCFG_DIV_MASK(id) | ISC_CLKCFG_SEL_MASK(id),
-			   (isc_clk->div << ISC_CLKCFG_DIV_SHIFT(id)) |
-			   (isc_clk->parent_id << ISC_CLKCFG_SEL_SHIFT(id)));
-
-	regmap_write(regmap, ISC_CLKEN, ISC_CLK(id));
-	spin_unlock_irqrestore(&isc_clk->lock, flags);
-
-	regmap_read(regmap, ISC_CLKSR, &status);
-	if (status & ISC_CLK(id))
-		return 0;
-	else
-		return -EINVAL;
-}
-
-static void isc_clk_disable(struct clk_hw *hw)
-{
-	struct isc_clk *isc_clk = to_isc_clk(hw);
-	u32 id = isc_clk->id;
-	unsigned long flags;
-
-	spin_lock_irqsave(&isc_clk->lock, flags);
-	regmap_write(isc_clk->regmap, ISC_CLKDIS, ISC_CLK(id));
-	spin_unlock_irqrestore(&isc_clk->lock, flags);
-}
-
-static int isc_clk_is_enabled(struct clk_hw *hw)
-{
-	struct isc_clk *isc_clk = to_isc_clk(hw);
-	u32 status;
-	int ret;
-
-	ret = pm_runtime_resume_and_get(isc_clk->dev);
-	if (ret < 0)
-		return 0;
-
-	regmap_read(isc_clk->regmap, ISC_CLKSR, &status);
-
-	pm_runtime_put_sync(isc_clk->dev);
-
-	return status & ISC_CLK(isc_clk->id) ? 1 : 0;
-}
-
-static unsigned long
-isc_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
-{
-	struct isc_clk *isc_clk = to_isc_clk(hw);
-
-	return DIV_ROUND_CLOSEST(parent_rate, isc_clk->div + 1);
-}
-
-static int isc_clk_determine_rate(struct clk_hw *hw,
-				   struct clk_rate_request *req)
-{
-	struct isc_clk *isc_clk = to_isc_clk(hw);
-	long best_rate = -EINVAL;
-	int best_diff = -1;
-	unsigned int i, div;
-
-	for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
-		struct clk_hw *parent;
-		unsigned long parent_rate;
-
-		parent = clk_hw_get_parent_by_index(hw, i);
-		if (!parent)
-			continue;
-
-		parent_rate = clk_hw_get_rate(parent);
-		if (!parent_rate)
-			continue;
-
-		for (div = 1; div < ISC_CLK_MAX_DIV + 2; div++) {
-			unsigned long rate;
-			int diff;
-
-			rate = DIV_ROUND_CLOSEST(parent_rate, div);
-			diff = abs(req->rate - rate);
-
-			if (best_diff < 0 || best_diff > diff) {
-				best_rate = rate;
-				best_diff = diff;
-				req->best_parent_rate = parent_rate;
-				req->best_parent_hw = parent;
-			}
-
-			if (!best_diff || rate < req->rate)
-				break;
-		}
-
-		if (!best_diff)
-			break;
-	}
-
-	dev_dbg(isc_clk->dev,
-		"ISC CLK: %s, best_rate = %ld, parent clk: %s @ %ld\n",
-		__func__, best_rate,
-		__clk_get_name((req->best_parent_hw)->clk),
-		req->best_parent_rate);
-
-	if (best_rate < 0)
-		return best_rate;
-
-	req->rate = best_rate;
-
-	return 0;
-}
-
-static int isc_clk_set_parent(struct clk_hw *hw, u8 index)
-{
-	struct isc_clk *isc_clk = to_isc_clk(hw);
-
-	if (index >= clk_hw_get_num_parents(hw))
-		return -EINVAL;
-
-	isc_clk->parent_id = index;
-
-	return 0;
-}
-
-static u8 isc_clk_get_parent(struct clk_hw *hw)
-{
-	struct isc_clk *isc_clk = to_isc_clk(hw);
-
-	return isc_clk->parent_id;
-}
-
-static int isc_clk_set_rate(struct clk_hw *hw,
-			     unsigned long rate,
-			     unsigned long parent_rate)
-{
-	struct isc_clk *isc_clk = to_isc_clk(hw);
-	u32 div;
-
-	if (!rate)
-		return -EINVAL;
-
-	div = DIV_ROUND_CLOSEST(parent_rate, rate);
-	if (div > (ISC_CLK_MAX_DIV + 1) || !div)
-		return -EINVAL;
-
-	isc_clk->div = div - 1;
-
-	return 0;
-}
-
-static const struct clk_ops isc_clk_ops = {
-	.prepare	= isc_clk_prepare,
-	.unprepare	= isc_clk_unprepare,
-	.enable		= isc_clk_enable,
-	.disable	= isc_clk_disable,
-	.is_enabled	= isc_clk_is_enabled,
-	.recalc_rate	= isc_clk_recalc_rate,
-	.determine_rate	= isc_clk_determine_rate,
-	.set_parent	= isc_clk_set_parent,
-	.get_parent	= isc_clk_get_parent,
-	.set_rate	= isc_clk_set_rate,
-};
-
-static int isc_clk_register(struct isc_device *isc, unsigned int id)
-{
-	struct regmap *regmap = isc->regmap;
-	struct device_node *np = isc->dev->of_node;
-	struct isc_clk *isc_clk;
-	struct clk_init_data init;
-	const char *clk_name = np->name;
-	const char *parent_names[3];
-	int num_parents;
-
-	if (id == ISC_ISPCK && !isc->ispck_required)
-		return 0;
-
-	num_parents = of_clk_get_parent_count(np);
-	if (num_parents < 1 || num_parents > 3)
-		return -EINVAL;
-
-	if (num_parents > 2 && id == ISC_ISPCK)
-		num_parents = 2;
-
-	of_clk_parent_fill(np, parent_names, num_parents);
-
-	if (id == ISC_MCK)
-		of_property_read_string(np, "clock-output-names", &clk_name);
-	else
-		clk_name = "isc-ispck";
-
-	init.parent_names	= parent_names;
-	init.num_parents	= num_parents;
-	init.name		= clk_name;
-	init.ops		= &isc_clk_ops;
-	init.flags		= CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE;
-
-	isc_clk = &isc->isc_clks[id];
-	isc_clk->hw.init	= &init;
-	isc_clk->regmap		= regmap;
-	isc_clk->id		= id;
-	isc_clk->dev		= isc->dev;
-	spin_lock_init(&isc_clk->lock);
-
-	isc_clk->clk = clk_register(isc->dev, &isc_clk->hw);
-	if (IS_ERR(isc_clk->clk)) {
-		dev_err(isc->dev, "%s: clock register fail\n", clk_name);
-		return PTR_ERR(isc_clk->clk);
-	} else if (id == ISC_MCK)
-		of_clk_add_provider(np, of_clk_src_simple_get, isc_clk->clk);
-
-	return 0;
-}
-
-int isc_clk_init(struct isc_device *isc)
-{
-	unsigned int i;
-	int ret;
-
-	for (i = 0; i < ARRAY_SIZE(isc->isc_clks); i++)
-		isc->isc_clks[i].clk = ERR_PTR(-EINVAL);
-
-	for (i = 0; i < ARRAY_SIZE(isc->isc_clks); i++) {
-		ret = isc_clk_register(isc, i);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(isc_clk_init);
-
-void isc_clk_cleanup(struct isc_device *isc)
-{
-	unsigned int i;
-
-	of_clk_del_provider(isc->dev->of_node);
-
-	for (i = 0; i < ARRAY_SIZE(isc->isc_clks); i++) {
-		struct isc_clk *isc_clk = &isc->isc_clks[i];
-
-		if (!IS_ERR(isc_clk->clk))
-			clk_unregister(isc_clk->clk);
-	}
-}
-EXPORT_SYMBOL_GPL(isc_clk_cleanup);
 
 static int isc_queue_setup(struct vb2_queue *vq,
 			    unsigned int *nbuffers, unsigned int *nplanes,
diff --git a/drivers/media/platform/atmel/atmel-isc-clk.c b/drivers/media/platform/atmel/atmel-isc-clk.c
new file mode 100644
index 000000000000..d650caade396
--- /dev/null
+++ b/drivers/media/platform/atmel/atmel-isc-clk.c
@@ -0,0 +1,316 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Microchip Image Sensor Controller (ISC) common clock driver setup
+ *
+ * Copyright (C) 2016-2019 Microchip Technology, Inc.
+ *
+ * Author: Songjun Wu
+ * Author: Eugen Hristev <eugen.hristev@microchip.com>
+ *
+ */
+#include <linux/clk.h>
+#include <linux/clkdev.h>
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "atmel-isc-regs.h"
+#include "atmel-isc.h"
+
+static int isc_wait_clk_stable(struct clk_hw *hw)
+{
+	struct isc_clk *isc_clk = to_isc_clk(hw);
+	struct regmap *regmap = isc_clk->regmap;
+	unsigned long timeout = jiffies + usecs_to_jiffies(1000);
+	unsigned int status;
+
+	while (time_before(jiffies, timeout)) {
+		regmap_read(regmap, ISC_CLKSR, &status);
+		if (!(status & ISC_CLKSR_SIP))
+			return 0;
+
+		usleep_range(10, 250);
+	}
+
+	return -ETIMEDOUT;
+}
+
+static int isc_clk_prepare(struct clk_hw *hw)
+{
+	struct isc_clk *isc_clk = to_isc_clk(hw);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(isc_clk->dev);
+	if (ret < 0)
+		return ret;
+
+	return isc_wait_clk_stable(hw);
+}
+
+static void isc_clk_unprepare(struct clk_hw *hw)
+{
+	struct isc_clk *isc_clk = to_isc_clk(hw);
+
+	isc_wait_clk_stable(hw);
+
+	pm_runtime_put_sync(isc_clk->dev);
+}
+
+static int isc_clk_enable(struct clk_hw *hw)
+{
+	struct isc_clk *isc_clk = to_isc_clk(hw);
+	u32 id = isc_clk->id;
+	struct regmap *regmap = isc_clk->regmap;
+	unsigned long flags;
+	unsigned int status;
+
+	dev_dbg(isc_clk->dev, "ISC CLK: %s, id = %d, div = %d, parent id = %d\n",
+		__func__, id, isc_clk->div, isc_clk->parent_id);
+
+	spin_lock_irqsave(&isc_clk->lock, flags);
+	regmap_update_bits(regmap, ISC_CLKCFG,
+			   ISC_CLKCFG_DIV_MASK(id) | ISC_CLKCFG_SEL_MASK(id),
+			   (isc_clk->div << ISC_CLKCFG_DIV_SHIFT(id)) |
+			   (isc_clk->parent_id << ISC_CLKCFG_SEL_SHIFT(id)));
+
+	regmap_write(regmap, ISC_CLKEN, ISC_CLK(id));
+	spin_unlock_irqrestore(&isc_clk->lock, flags);
+
+	regmap_read(regmap, ISC_CLKSR, &status);
+	if (status & ISC_CLK(id))
+		return 0;
+	else
+		return -EINVAL;
+}
+
+static void isc_clk_disable(struct clk_hw *hw)
+{
+	struct isc_clk *isc_clk = to_isc_clk(hw);
+	u32 id = isc_clk->id;
+	unsigned long flags;
+
+	spin_lock_irqsave(&isc_clk->lock, flags);
+	regmap_write(isc_clk->regmap, ISC_CLKDIS, ISC_CLK(id));
+	spin_unlock_irqrestore(&isc_clk->lock, flags);
+}
+
+static int isc_clk_is_enabled(struct clk_hw *hw)
+{
+	struct isc_clk *isc_clk = to_isc_clk(hw);
+	u32 status;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(isc_clk->dev);
+	if (ret < 0)
+		return 0;
+
+	regmap_read(isc_clk->regmap, ISC_CLKSR, &status);
+
+	pm_runtime_put_sync(isc_clk->dev);
+
+	return status & ISC_CLK(isc_clk->id) ? 1 : 0;
+}
+
+static unsigned long
+isc_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct isc_clk *isc_clk = to_isc_clk(hw);
+
+	return DIV_ROUND_CLOSEST(parent_rate, isc_clk->div + 1);
+}
+
+static int isc_clk_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
+{
+	struct isc_clk *isc_clk = to_isc_clk(hw);
+	long best_rate = -EINVAL;
+	int best_diff = -1;
+	unsigned int i, div;
+
+	for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
+		struct clk_hw *parent;
+		unsigned long parent_rate;
+
+		parent = clk_hw_get_parent_by_index(hw, i);
+		if (!parent)
+			continue;
+
+		parent_rate = clk_hw_get_rate(parent);
+		if (!parent_rate)
+			continue;
+
+		for (div = 1; div < ISC_CLK_MAX_DIV + 2; div++) {
+			unsigned long rate;
+			int diff;
+
+			rate = DIV_ROUND_CLOSEST(parent_rate, div);
+			diff = abs(req->rate - rate);
+
+			if (best_diff < 0 || best_diff > diff) {
+				best_rate = rate;
+				best_diff = diff;
+				req->best_parent_rate = parent_rate;
+				req->best_parent_hw = parent;
+			}
+
+			if (!best_diff || rate < req->rate)
+				break;
+		}
+
+		if (!best_diff)
+			break;
+	}
+
+	dev_dbg(isc_clk->dev,
+		"ISC CLK: %s, best_rate = %ld, parent clk: %s @ %ld\n",
+		__func__, best_rate,
+		__clk_get_name((req->best_parent_hw)->clk),
+		req->best_parent_rate);
+
+	if (best_rate < 0)
+		return best_rate;
+
+	req->rate = best_rate;
+
+	return 0;
+}
+
+static int isc_clk_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct isc_clk *isc_clk = to_isc_clk(hw);
+
+	if (index >= clk_hw_get_num_parents(hw))
+		return -EINVAL;
+
+	isc_clk->parent_id = index;
+
+	return 0;
+}
+
+static u8 isc_clk_get_parent(struct clk_hw *hw)
+{
+	struct isc_clk *isc_clk = to_isc_clk(hw);
+
+	return isc_clk->parent_id;
+}
+
+static int isc_clk_set_rate(struct clk_hw *hw,
+			    unsigned long rate,
+			    unsigned long parent_rate)
+{
+	struct isc_clk *isc_clk = to_isc_clk(hw);
+	u32 div;
+
+	if (!rate)
+		return -EINVAL;
+
+	div = DIV_ROUND_CLOSEST(parent_rate, rate);
+	if (div > (ISC_CLK_MAX_DIV + 1) || !div)
+		return -EINVAL;
+
+	isc_clk->div = div - 1;
+
+	return 0;
+}
+
+static const struct clk_ops isc_clk_ops = {
+	.prepare	= isc_clk_prepare,
+	.unprepare	= isc_clk_unprepare,
+	.enable		= isc_clk_enable,
+	.disable	= isc_clk_disable,
+	.is_enabled	= isc_clk_is_enabled,
+	.recalc_rate	= isc_clk_recalc_rate,
+	.determine_rate	= isc_clk_determine_rate,
+	.set_parent	= isc_clk_set_parent,
+	.get_parent	= isc_clk_get_parent,
+	.set_rate	= isc_clk_set_rate,
+};
+
+static int isc_clk_register(struct isc_device *isc, unsigned int id)
+{
+	struct regmap *regmap = isc->regmap;
+	struct device_node *np = isc->dev->of_node;
+	struct isc_clk *isc_clk;
+	struct clk_init_data init;
+	const char *clk_name = np->name;
+	const char *parent_names[3];
+	int num_parents;
+
+	if (id == ISC_ISPCK && !isc->ispck_required)
+		return 0;
+
+	num_parents = of_clk_get_parent_count(np);
+	if (num_parents < 1 || num_parents > 3)
+		return -EINVAL;
+
+	if (num_parents > 2 && id == ISC_ISPCK)
+		num_parents = 2;
+
+	of_clk_parent_fill(np, parent_names, num_parents);
+
+	if (id == ISC_MCK)
+		of_property_read_string(np, "clock-output-names", &clk_name);
+	else
+		clk_name = "isc-ispck";
+
+	init.parent_names	= parent_names;
+	init.num_parents	= num_parents;
+	init.name		= clk_name;
+	init.ops		= &isc_clk_ops;
+	init.flags		= CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE;
+
+	isc_clk = &isc->isc_clks[id];
+	isc_clk->hw.init	= &init;
+	isc_clk->regmap		= regmap;
+	isc_clk->id		= id;
+	isc_clk->dev		= isc->dev;
+	spin_lock_init(&isc_clk->lock);
+
+	isc_clk->clk = clk_register(isc->dev, &isc_clk->hw);
+	if (IS_ERR(isc_clk->clk)) {
+		dev_err(isc->dev, "%s: clock register fail\n", clk_name);
+		return PTR_ERR(isc_clk->clk);
+	} else if (id == ISC_MCK) {
+		of_clk_add_provider(np, of_clk_src_simple_get, isc_clk->clk);
+	}
+
+	return 0;
+}
+
+int isc_clk_init(struct isc_device *isc)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < ARRAY_SIZE(isc->isc_clks); i++)
+		isc->isc_clks[i].clk = ERR_PTR(-EINVAL);
+
+	for (i = 0; i < ARRAY_SIZE(isc->isc_clks); i++) {
+		ret = isc_clk_register(isc, i);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(isc_clk_init);
+
+void isc_clk_cleanup(struct isc_device *isc)
+{
+	unsigned int i;
+
+	of_clk_del_provider(isc->dev->of_node);
+
+	for (i = 0; i < ARRAY_SIZE(isc->isc_clks); i++) {
+		struct isc_clk *isc_clk = &isc->isc_clks[i];
+
+		if (!IS_ERR(isc_clk->clk))
+			clk_unregister(isc_clk->clk);
+	}
+}
+EXPORT_SYMBOL_GPL(isc_clk_cleanup);
-- 
2.25.1

