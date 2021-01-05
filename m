Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 537B12EA7C0
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 10:39:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728081AbhAEJi7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 04:38:59 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:40657 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727796AbhAEJi7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 04:38:59 -0500
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 6768E60010;
        Tue,  5 Jan 2021 09:38:16 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH] media: i2c: ov5648/ov8865: Minor cosmetic fixes
Date:   Tue,  5 Jan 2021 10:38:03 +0100
Message-Id: <20210105093803.5247-1-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This solves a few minor cosmetic issues picked up by checkpatch for
the OV5648 and OV8865 drivers.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/media/i2c/ov5648.c | 2 +-
 drivers/media/i2c/ov8865.c | 7 +++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
index 609aa67b54ce..752a2e035c49 100644
--- a/drivers/media/i2c/ov5648.c
+++ b/drivers/media/i2c/ov5648.c
@@ -496,7 +496,7 @@
 	container_of(s, struct ov5648_sensor, subdev)
 
 #define ov5648_ctrl_subdev(c) \
-	(&container_of(c->handler, struct ov5648_sensor, ctrls.handler)->subdev)
+	(&container_of((c)->handler, struct ov5648_sensor, ctrls.handler)->subdev)
 
 /* Data structures */
 
diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index fda5a55979aa..704d75b601e3 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -223,7 +223,6 @@
 #define OV8865_FORMAT2_FLIP_HORZ_SENSOR_EN	BIT(1)
 #define OV8865_FORMAT2_SYNC_HBIN_EN		BIT(0)
 
-
 #define OV8865_INC_Y_ODD_REG			0x382a
 #define OV8865_INC_Y_ODD(v)			((v) & GENMASK(4, 0))
 #define OV8865_INC_Y_EVEN_REG			0x382b
@@ -460,7 +459,7 @@
 	container_of(s, struct ov8865_sensor, subdev)
 
 #define ov8865_ctrl_subdev(c) \
-	(&container_of(c->handler, struct ov8865_sensor, ctrls.handler)->subdev)
+	(&container_of((c)->handler, struct ov8865_sensor, ctrls.handler)->subdev)
 
 /* Data structures */
 
@@ -1598,8 +1597,8 @@ static int ov8865_mode_pll1_configure(struct ov8865_sensor *sensor,
 		return ret;
 
 	ret = ov8865_update_bits(sensor, OV8865_PCLK_SEL_REG,
-			   OV8865_PCLK_SEL_PCLK_DIV_MASK,
-			   OV8865_PCLK_SEL_PCLK_DIV(config->pclk_div));
+				 OV8865_PCLK_SEL_PCLK_DIV_MASK,
+				 OV8865_PCLK_SEL_PCLK_DIV(config->pclk_div));
 	if (ret)
 		return ret;
 
-- 
2.29.2

