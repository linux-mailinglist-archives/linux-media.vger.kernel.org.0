Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66F4A27ECA0
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731022AbgI3P3M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:12 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44648 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731007AbgI3P3L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:11 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 9537B634CE6
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:51 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 061/100] ccs-pll: Avoid overflow in pre-PLL divisor lower bound search
Date:   Wed, 30 Sep 2020 18:28:19 +0300
Message-Id: <20200930152858.8471-62-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The external clock frequency times the PLL multiplier may exceed the value
range of 32-bit unsigned integers. Instead perform the same calculation y
using two divisions.

The result has some potential to be different, but that's ok: this number
is used to limit the range of pre-PLL divisors to find optimal values. So
the effect of the rare case of a different result here would mean an
invalid pre-PLL divisor is tried. That will be found out a little later in
any case.

Also guard against dividing by zero if the external clock frequency is
higher than the maximum OP PLL output clock --- a rather improbable case.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 53dd440668ed..c132edc6a06a 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -40,6 +40,11 @@ static inline uint32_t is_one_or_even(uint32_t a)
 	return 1;
 }
 
+static inline uint32_t one_or_more(uint32_t a)
+{
+	return a ?: 1;
+}
+
 static int bounds_check(struct device *dev, uint32_t val,
 			uint32_t min, uint32_t max, char *str)
 {
@@ -458,8 +463,10 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	min_op_pre_pll_clk_div =
 		max_t(uint16_t, min_op_pre_pll_clk_div,
 		      clk_div_even_up(
-			      DIV_ROUND_UP(mul * pll->ext_clk_freq_hz,
-					   op_lim_fr->max_pll_op_clk_freq_hz)));
+			      mul /
+			      one_or_more(
+				      DIV_ROUND_UP(op_lim_fr->max_pll_op_clk_freq_hz,
+						   pll->ext_clk_freq_hz))));
 	dev_dbg(dev, "pll_op check: min / max op_pre_pll_clk_div: %u / %u\n",
 		min_op_pre_pll_clk_div, max_op_pre_pll_clk_div);
 
-- 
2.27.0

