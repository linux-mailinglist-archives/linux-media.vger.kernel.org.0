Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1369A285AE4
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbgJGIqQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:46:16 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57070 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728015AbgJGIqN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:13 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id CEEF4634CE8
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:20 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 070/106] ccs-pll: Use explicit 32-bit unsigned type
Date:   Wed,  7 Oct 2020 11:45:21 +0300
Message-Id: <20201007084557.25843-61-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use uint32_t instead of unsigned int for a variable that contains
explicitly 32-bit numbers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index b23e959000a4..d33a2575329c 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -177,7 +177,7 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	uint32_t more_mul_factor;
 	uint32_t min_vt_div, max_vt_div, vt_div;
 	uint32_t min_sys_div, max_sys_div;
-	unsigned int i;
+	uint32_t i;
 
 	/*
 	 * Get pre_pll_clk_div so that our pll_op_clk_freq_hz won't be
@@ -406,7 +406,7 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	uint16_t max_op_pre_pll_clk_div;
 	uint32_t lane_op_clock_ratio;
 	uint32_t mul, div;
-	unsigned int i;
+	uint32_t i;
 	int rval = -EINVAL;
 
 	if (pll->flags & CCS_PLL_FLAG_NO_OP_CLOCKS) {
-- 
2.27.0

