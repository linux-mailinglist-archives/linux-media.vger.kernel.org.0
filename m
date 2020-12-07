Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86CFB2D1C01
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 22:25:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbgLGVZO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 16:25:14 -0500
Received: from retiisi.eu ([95.216.213.190]:34656 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727007AbgLGVZN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Dec 2020 16:25:13 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 1E84B634CBF;
        Mon,  7 Dec 2020 23:23:14 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 24/24] Revert "media: ccs-pll: Fix MODULE_LICENSE"
Date:   Mon,  7 Dec 2020 23:15:30 +0200
Message-Id: <20201207211530.21180-25-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
References: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This reverts commit b3c0115e34adcabe12fce8845e24ca6f04c1554e.

As per Documentation/process/license-rules.rst "GPL v2" exists only for
historical reasons and has the same meaning as "GPL". So revert this
patch.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 530085693a56..aeb87ba6fe37 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -883,4 +883,4 @@ EXPORT_SYMBOL_GPL(ccs_pll_calculate);
 
 MODULE_AUTHOR("Sakari Ailus <sakari.ailus@linux.intel.com>");
 MODULE_DESCRIPTION("Generic MIPI CCS/SMIA/SMIA++ PLL calculator");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
-- 
2.29.2

