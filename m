Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 584BB27EC94
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731050AbgI3P3O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:14 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44664 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731025AbgI3P3O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:14 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 52DF9634CA3
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:52 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 071/100] ccs-pll: Add sanity checks
Date:   Wed, 30 Sep 2020 18:28:29 +0300
Message-Id: <20200930152858.8471-72-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
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
index 84f1735b8df5..1a4fccfc1158 100644
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

