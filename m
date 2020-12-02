Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F88B2CC4AD
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 19:12:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728935AbgLBSLY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 13:11:24 -0500
Received: from retiisi.eu ([95.216.213.190]:33472 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728677AbgLBSLX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 13:11:23 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id E41FA634C87;
        Wed,  2 Dec 2020 20:08:30 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 01/38] ccs-pll: Don't use div_u64 to divide a 32-bit number
Date:   Wed,  2 Dec 2020 20:06:04 +0200
Message-Id: <20201202180641.17401-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
References: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

pll->pll_op_clk_freq is a 32-bit number. It does not need div_u64 to
divide it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 0d57bac1599a..1cfe6cf7e51c 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -445,7 +445,7 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *limits,
 		min_pre_pll_clk_div, max_pre_pll_clk_div);
 
 	i = gcd(pll->pll_op_clk_freq_hz, pll->ext_clk_freq_hz);
-	mul = div_u64(pll->pll_op_clk_freq_hz, i);
+	mul = pll->pll_op_clk_freq_hz / i;
 	div = pll->ext_clk_freq_hz / i;
 	dev_dbg(dev, "mul %u / div %u\n", mul, div);
 
-- 
2.27.0

