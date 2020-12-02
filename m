Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9577E2CC4B3
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 19:12:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387711AbgLBSLb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 13:11:31 -0500
Received: from retiisi.eu ([95.216.213.190]:33490 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728969AbgLBSL3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 13:11:29 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 595B6634C91;
        Wed,  2 Dec 2020 20:08:31 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 07/38] ccs-pll: Move the flags field down, away from 8-bit fields
Date:   Wed,  2 Dec 2020 20:06:10 +0200
Message-Id: <20201202180641.17401-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
References: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This way the struct will use less memory, with better packing and no waste
due to unsigned long.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs-pll.h b/drivers/media/i2c/ccs-pll.h
index d06a80c4fc52..1d908b23c934 100644
--- a/drivers/media/i2c/ccs-pll.h
+++ b/drivers/media/i2c/ccs-pll.h
@@ -40,12 +40,12 @@ struct ccs_pll {
 	struct {
 		uint8_t lanes;
 	} csi2;
-	unsigned long flags;
 	uint8_t binning_horizontal;
 	uint8_t binning_vertical;
 	uint8_t scale_m;
 	uint8_t scale_n;
 	uint8_t bits_per_pixel;
+	uint16_t flags;
 	uint32_t link_freq;
 	uint32_t ext_clk_freq_hz;
 
-- 
2.27.0

