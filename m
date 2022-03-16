Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1576A4DADB6
	for <lists+linux-media@lfdr.de>; Wed, 16 Mar 2022 10:47:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354957AbiCPJsr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Mar 2022 05:48:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349355AbiCPJsq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Mar 2022 05:48:46 -0400
Received: from hillosipuli.retiisi.eu (retiisi.eu [95.216.213.190])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C050C6548B
        for <linux-media@vger.kernel.org>; Wed, 16 Mar 2022 02:47:32 -0700 (PDT)
Received: from lanttu.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::c1:2])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id AD975634C91
        for <linux-media@vger.kernel.org>; Wed, 16 Mar 2022 11:47:29 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 2/2] media: ccs: Use unsigned int as index to an array
Date:   Wed, 16 Mar 2022 11:45:25 +0200
Message-Id: <20220316094525.53664-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220316094525.53664-1-sakari.ailus@linux.intel.com>
References: <20220316094525.53664-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use an unsigned int to index an array instead of a signed one.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 547e18b6b4c4..55bd303f0e18 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3183,7 +3183,7 @@ static int ccs_get_hwconfig(struct ccs_sensor *sensor, struct device *dev)
 	struct fwnode_handle *ep;
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	u32 rotation;
-	int i;
+	unsigned int i;
 	int rval;
 
 	ep = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0,
@@ -3261,7 +3261,7 @@ static int ccs_get_hwconfig(struct ccs_sensor *sensor, struct device *dev)
 
 	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++) {
 		hwcfg->op_sys_clock[i] = bus_cfg.link_frequencies[i];
-		dev_dbg(dev, "freq %d: %lld\n", i, hwcfg->op_sys_clock[i]);
+		dev_dbg(dev, "freq %u: %lld\n", i, hwcfg->op_sys_clock[i]);
 	}
 
 	v4l2_fwnode_endpoint_free(&bus_cfg);
-- 
2.30.2

