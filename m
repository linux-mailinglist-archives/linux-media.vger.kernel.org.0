Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C84D7285AEA
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728067AbgJGIqU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:46:20 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57072 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728031AbgJGIqP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:15 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id AACDB634CF9
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:21 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 082/106] ccs-pll: Print relevant information on PLL tree
Date:   Wed,  7 Oct 2020 11:45:33 +0300
Message-Id: <20201007084557.25843-73-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Print information on PLL tree configuration based on the flags. This also
adds support for printing dual PLL trees, and better separates between OP
and VT PLL trees.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 85 ++++++++++++++++++++++++++++---------
 1 file changed, 66 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index e879c03a3d3b..43735f6d0bb2 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -56,28 +56,75 @@ static int bounds_check(struct device *dev, uint32_t val,
 	return -EINVAL;
 }
 
-static void print_pll(struct device *dev, struct ccs_pll *pll)
+#define PLL_OP 1
+#define PLL_VT 2
+
+static const char *pll_string(unsigned int which)
 {
-	dev_dbg(dev, "pre_pll_clk_div\t%u\n",  pll->vt_fr.pre_pll_clk_div);
-	dev_dbg(dev, "pll_multiplier \t%u\n",  pll->vt_fr.pll_multiplier);
-	if (!(pll->flags & CCS_PLL_FLAG_NO_OP_CLOCKS)) {
-		dev_dbg(dev, "op_sys_clk_div \t%u\n", pll->op_bk.sys_clk_div);
-		dev_dbg(dev, "op_pix_clk_div \t%u\n", pll->op_bk.pix_clk_div);
+	switch (which) {
+	case PLL_OP:
+		return "op";
+	case PLL_VT:
+		return "vt";
 	}
-	dev_dbg(dev, "vt_sys_clk_div \t%u\n",  pll->vt_bk.sys_clk_div);
-	dev_dbg(dev, "vt_pix_clk_div \t%u\n",  pll->vt_bk.pix_clk_div);
-
-	dev_dbg(dev, "ext_clk_freq_hz \t%u\n", pll->ext_clk_freq_hz);
-	dev_dbg(dev, "pll_ip_clk_freq_hz \t%u\n", pll->vt_fr.pll_ip_clk_freq_hz);
-	dev_dbg(dev, "pll_op_clk_freq_hz \t%u\n", pll->vt_fr.pll_op_clk_freq_hz);
-	if (!(pll->flags & CCS_PLL_FLAG_NO_OP_CLOCKS)) {
-		dev_dbg(dev, "op_sys_clk_freq_hz \t%u\n",
-			pll->op_bk.sys_clk_freq_hz);
-		dev_dbg(dev, "op_pix_clk_freq_hz \t%u\n",
-			pll->op_bk.pix_clk_freq_hz);
+
+	return NULL;
+}
+
+#define PLL_FL(f) CCS_PLL_FLAG_##f
+
+static void print_pll(struct device *dev, struct ccs_pll *pll)
+{
+	const struct {
+		struct ccs_pll_branch_fr *fr;
+		struct ccs_pll_branch_bk *bk;
+		unsigned int which;
+	} branches[] = {
+		{ &pll->vt_fr, &pll->vt_bk, PLL_VT },
+		{ NULL, &pll->op_bk, PLL_OP }
+	}, *br;
+	unsigned int i;
+
+	dev_dbg(dev, "ext_clk_freq_hz\t\t%u\n", pll->ext_clk_freq_hz);
+
+	for (i = 0, br = branches; i < ARRAY_SIZE(branches); i++, br++) {
+		const char *s = pll_string(br->which);
+
+		if (br->which == PLL_VT) {
+			dev_dbg(dev, "%s_pre_pll_clk_div\t\t%u\n",  s,
+				br->fr->pre_pll_clk_div);
+			dev_dbg(dev, "%s_pll_multiplier\t\t%u\n",  s,
+				br->fr->pll_multiplier);
+
+			dev_dbg(dev, "%s_pll_ip_clk_freq_hz\t%u\n", s,
+				br->fr->pll_ip_clk_freq_hz);
+			dev_dbg(dev, "%s_pll_op_clk_freq_hz\t%u\n", s,
+				br->fr->pll_op_clk_freq_hz);
+		}
+
+		if (!(pll->flags & CCS_PLL_FLAG_NO_OP_CLOCKS) ||
+		    br->which == PLL_VT) {
+			dev_dbg(dev, "%s_sys_clk_div\t\t%u\n",  s,
+				br->bk->sys_clk_div);
+			dev_dbg(dev, "%s_pix_clk_div\t\t%u\n", s,
+				br->bk->pix_clk_div);
+
+			dev_dbg(dev, "%s_sys_clk_freq_hz\t%u\n", s,
+				br->bk->sys_clk_freq_hz);
+			dev_dbg(dev, "%s_pix_clk_freq_hz\t%u\n", s,
+				br->bk->pix_clk_freq_hz);
+		}
 	}
-	dev_dbg(dev, "vt_sys_clk_freq_hz \t%u\n", pll->vt_bk.sys_clk_freq_hz);
-	dev_dbg(dev, "vt_pix_clk_freq_hz \t%u\n", pll->vt_bk.pix_clk_freq_hz);
+
+	dev_dbg(dev, "flags%s%s%s%s%s%s\n",
+		pll->flags & PLL_FL(LANE_SPEED_MODEL) ? " lane-speed" : "",
+		pll->flags & PLL_FL(LINK_DECOUPLED) ? " link-decoupled" : "",
+		pll->flags & PLL_FL(EXT_IP_PLL_DIVIDER) ?
+		" ext-ip-pll-divider" : "",
+		pll->flags & PLL_FL(FLEXIBLE_OP_PIX_CLK_DIV) ?
+		" flexible-op-pix-div" : "",
+		pll->flags & PLL_FL(FIFO_DERATING) ? " fifo-derating" : "",
+		pll->flags & PLL_FL(FIFO_OVERRATING) ? " fifo-overrating" : "");
 }
 
 static int check_all_bounds(struct device *dev,
-- 
2.27.0

