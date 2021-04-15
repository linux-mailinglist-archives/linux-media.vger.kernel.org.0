Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80EF835FF0F
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 02:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbhDOAtt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 20:49:49 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:46717 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbhDOAtr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 20:49:47 -0400
X-Originating-IP: 24.194.32.49
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 9A9D020006;
        Thu, 15 Apr 2021 00:49:23 +0000 (UTC)
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH] staging: media: atomisp: Use goto instead of return in ia_css_init()
Date:   Wed, 14 Apr 2021 20:51:04 -0400
Message-Id: <20210415005106.530914-8-vrzh@vrzh.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415005106.530914-1-vrzh@vrzh.net>
References: <20210415005106.530914-1-vrzh@vrzh.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace multiple return statements with goto in ia_css_init(), matching
other functions.

Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 45 +++++++++-------------
 1 file changed, 19 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index bb752d47457c..4e3ef68014ec 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -1695,10 +1695,8 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
 	my_css.flush     = flush_func;
 
 	err = ia_css_rmgr_init();
-	if (err) {
-		IA_CSS_LEAVE_ERR(err);
-		return err;
-	}
+	if (err)
+		goto ERR;
 
 	IA_CSS_LOG("init: %d", my_css_save_initialized);
 
@@ -1730,27 +1728,23 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
 	gpio_reg_store(GPIO0_ID, _gpio_block_reg_do_0, 0);
 
 	err = ia_css_refcount_init(REFCOUNT_SIZE);
-	if (err) {
-		IA_CSS_LEAVE_ERR(err);
-		return err;
-	}
+	if (err)
+		goto ERR;
+
 	err = sh_css_params_init();
-	if (err) {
-		IA_CSS_LEAVE_ERR(err);
-		return err;
-	}
+	if (err)
+		goto ERR;
+
 	if (fw) {
 		ia_css_unload_firmware(); /* in case we already had firmware loaded */
 		err = sh_css_load_firmware(dev, fw->data, fw->bytes);
-		if (err) {
-			IA_CSS_LEAVE_ERR(err);
-			return err;
-		}
+		if (err)
+			goto ERR;
+
 		err = ia_css_binary_init_infos();
-		if (err) {
-			IA_CSS_LEAVE_ERR(err);
-			return err;
-		}
+		if (err)
+			goto ERR;
+
 		fw_explicitly_loaded = false;
 #ifndef ISP2401
 		my_css_save.loaded_fw = (struct ia_css_fw *)fw;
@@ -1760,10 +1754,8 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
 		return -EINVAL;
 
 	err = ia_css_spctrl_load_fw(SP0_ID, &spctrl_cfg);
-	if (err) {
-		IA_CSS_LEAVE_ERR(err);
-		return err;
-	}
+	if (err)
+		goto ERR;
 
 #if WITH_PC_MONITORING
 	if (!thread_alive) {
@@ -1774,8 +1766,8 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
 	}
 #endif
 	if (!sh_css_hrt_system_is_idle()) {
-		IA_CSS_LEAVE_ERR(-EBUSY);
-		return -EBUSY;
+		err = -EBUSY;
+		goto ERR;
 	}
 	/* can be called here, queuing works, but:
 	   - when sp is started later, it will wipe queued items
@@ -1801,6 +1793,7 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
 
 	sh_css_params_map_and_store_default_gdc_lut();
 
+ERR:
 	IA_CSS_LEAVE_ERR(err);
 	return err;
 }
-- 
2.31.1

