Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 189332CC4BA
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 19:15:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387616AbgLBSMu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 13:12:50 -0500
Received: from retiisi.eu ([95.216.213.190]:33496 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729012AbgLBSMt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 13:12:49 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 9D4C4634CBD;
        Wed,  2 Dec 2020 20:08:32 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 22/38] ccs-pll: Add sanity checks
Date:   Wed,  2 Dec 2020 20:06:25 +0200
Message-Id: <20201202180641.17401-23-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
References: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add sanity checks for fields that could cause division by zero.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index e3a6493fd601..420d2c4d7b2c 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -421,6 +421,15 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 		pll->vt_lanes = 1;
 	}
 
+	if (!pll->op_lanes || !pll->vt_lanes || !pll->bits_per_pixel ||
+	    !pll->ext_clk_freq_hz || !pll->link_freq || !pll->scale_m ||
+	    !op_lim_fr->min_pll_ip_clk_freq_hz ||
+	    !op_lim_fr->max_pll_ip_clk_freq_hz ||
+	    !op_lim_fr->min_pll_op_clk_freq_hz ||
+	    !op_lim_fr->max_pll_op_clk_freq_hz ||
+	    !op_lim_bk->max_sys_clk_div || !op_lim_fr->max_pll_multiplier)
+		return -EINVAL;
+
 	/*
 	 * Make sure op_pix_clk_div will be integer --- unless flexible
 	 * op_pix_clk_div is supported
-- 
2.27.0

