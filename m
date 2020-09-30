Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44CD127ECFF
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731202AbgI3Pag (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:30:36 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44632 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgI3P3B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:01 -0400
X-Greylist: delayed 2446 seconds by postgrey-1.27 at vger.kernel.org; Wed, 30 Sep 2020 11:29:00 EDT
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 3E27A634C8D
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:46 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 003/100] smiapp: Calculate CCS limit offsets and limit buffer size
Date:   Wed, 30 Sep 2020 18:27:21 +0300
Message-Id: <20200930152858.8471-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Calculate the limit offsets and the size of the limit buffer. CCS limits
are read into this buffer, and the offsets are helpful in accessing the
information in it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/smiapp-core.c | 40 +++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index 105ef29152e8..47e983e9cd87 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -27,6 +27,7 @@
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-device.h>
 
+#include "ccs-limits.h"
 #include "smiapp.h"
 
 #define SMIAPP_ALIGN_DIM(dim, flags)	\
@@ -34,6 +35,11 @@
 	 ? ALIGN((dim), 2)		\
 	 : (dim) & ~1)
 
+struct ccs_limit_offset {
+	u16	lim;
+	u16	info;
+} ccs_limit_offsets[CCS_L_LAST + 1];
+
 /*
  * smiapp_module_idents - supported camera modules
  */
@@ -3166,7 +3172,39 @@ static struct i2c_driver smiapp_i2c_driver = {
 	.id_table = smiapp_id_table,
 };
 
-module_i2c_driver(smiapp_i2c_driver);
+static int smiapp_module_init(void)
+{
+	unsigned int i, l;
+
+	for (i = 0, l = 0; ccs_limits[i].size && l < CCS_L_LAST; i++) {
+		if (!(ccs_limits[i].flags & CCS_L_FL_SAME_REG)) {
+			ccs_limit_offsets[l + 1].lim =
+				ALIGN(ccs_limit_offsets[l].lim +
+				      ccs_limits[i].size,
+				      ccs_reg_width(ccs_limits[i + 1].reg));
+			ccs_limit_offsets[l].info = i;
+			l++;
+		} else {
+			ccs_limit_offsets[l].lim += ccs_limits[i].size;
+		}
+	}
+
+	if (WARN_ON(ccs_limits[i].size))
+		return -EINVAL;
+
+	if (WARN_ON(l != CCS_L_LAST))
+		return -EINVAL;
+
+	return i2c_register_driver(THIS_MODULE, &smiapp_i2c_driver);
+}
+
+static void smiapp_module_cleanup(void)
+{
+	i2c_del_driver(&smiapp_i2c_driver);
+}
+
+module_init(smiapp_module_init);
+module_exit(smiapp_module_cleanup);
 
 MODULE_AUTHOR("Sakari Ailus <sakari.ailus@iki.fi>");
 MODULE_DESCRIPTION("Generic SMIA/SMIA++ camera module driver");
-- 
2.27.0

