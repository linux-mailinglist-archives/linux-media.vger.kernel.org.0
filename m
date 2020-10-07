Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71899285B1B
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728115AbgJGIq7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:46:59 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57052 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727960AbgJGIqI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:08 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 99656634C90
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:19 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 052/106] ccs: Remove unnecessary delays from power-up sequence
Date:   Wed,  7 Oct 2020 11:45:05 +0300
Message-Id: <20201007084557.25843-45-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SMIA nor CCS need these delays; remove them.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 94661275d599..8bf42fc222c1 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1309,14 +1309,12 @@ static int ccs_power_on(struct device *dev)
 		dev_err(dev, "failed to enable vana regulator\n");
 		return rval;
 	}
-	usleep_range(1000, 1000);
 
 	rval = clk_prepare_enable(sensor->ext_clk);
 	if (rval < 0) {
 		dev_dbg(dev, "failed to enable xclk\n");
 		goto out_xclk_fail;
 	}
-	usleep_range(1000, 1000);
 
 	gpiod_set_value(sensor->reset, 0);
 	gpiod_set_value(sensor->xshutdown, 1);
-- 
2.27.0

