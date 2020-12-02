Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E49802CC4B6
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 19:12:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389352AbgLBSLc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 13:11:32 -0500
Received: from retiisi.eu ([95.216.213.190]:33494 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728979AbgLBSL2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 13:11:28 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 7FD18634C93;
        Wed,  2 Dec 2020 20:08:31 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 09/38] ccs-pll: Use the BIT macro
Date:   Wed,  2 Dec 2020 20:06:12 +0200
Message-Id: <20201202180641.17401-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
References: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the BIT macro for setting individual bits.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.h b/drivers/media/i2c/ccs-pll.h
index 1b8d36068c7d..3ad4e6524ab6 100644
--- a/drivers/media/i2c/ccs-pll.h
+++ b/drivers/media/i2c/ccs-pll.h
@@ -12,13 +12,16 @@
 #ifndef CCS_PLL_H
 #define CCS_PLL_H
 
+#include <linux/bits.h>
+
 /* CSI-2 or CCP-2 */
 #define CCS_PLL_BUS_TYPE_CSI2_DPHY				0x00
 #define CCS_PLL_BUS_TYPE_CSI2_CPHY				0x01
 
+/* Old SMIA and implementation specific flags */
 /* op pix clock is for all lanes in total normally */
-#define CCS_PLL_FLAG_OP_PIX_CLOCK_PER_LANE			(1 << 0)
-#define CCS_PLL_FLAG_NO_OP_CLOCKS				(1 << 1)
+#define CCS_PLL_FLAG_OP_PIX_CLOCK_PER_LANE			BIT(0)
+#define CCS_PLL_FLAG_NO_OP_CLOCKS				BIT(1)
 
 /**
  * struct ccs_pll_branch_fr - CCS PLL configuration (front)
-- 
2.27.0

