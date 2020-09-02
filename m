Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 947CF25B125
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 18:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728723AbgIBQNu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 12:13:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:53892 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728337AbgIBQK5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 12:10:57 -0400
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 955EA221E9;
        Wed,  2 Sep 2020 16:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599063046;
        bh=ygOrs9/TbmE/SLDVqbxZuGdRzrY5tz+l2wQYXOLaHX8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qcn81GzS9uljGnPISviBx4p4SjOF+payyjuLCy1wTyowFB7aCMFHOqjuxeweKGsiO
         nXOkOG6H0hgBrP7lqlvedRme68Vp1opIap5GqEIcGCrhdbzp6+6wIGReqIgHMIrKNE
         O93L+9GzlzfxcfKY/fxb6PFSiFje3vfyppMhQ8mA=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kDVLQ-000tBD-OK; Wed, 02 Sep 2020 18:10:44 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Colin Ian King <colin.king@canonical.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 33/38] media: atomisp: reorder functions at pixelgen_private.h
Date:   Wed,  2 Sep 2020 18:10:36 +0200
Message-Id: <0e922e4d1f89b430585cb774fd92f00d4eb734d8.1599062230.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599062230.git.mchehab+huawei@kernel.org>
References: <cover.1599062230.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reorder functions in order to declare before usage.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../css_2401_system/host/pixelgen_private.h   | 73 ++++++++++---------
 1 file changed, 37 insertions(+), 36 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h b/drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h
index 4faa519219ee..1c7938d8ccb5 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h
@@ -20,6 +20,43 @@
 #include "device_access.h"	/* ia_css_device_load_uint32 */
 #include "assert_support.h" /* assert */
 
+/*****************************************************
+ *
+ * Device level interface (DLI).
+ *
+ *****************************************************/
+/**
+ * @brief Load the register value.
+ * Refer to "pixelgen_public.h" for details.
+ */
+STORAGE_CLASS_PIXELGEN_C hrt_data pixelgen_ctrl_reg_load(
+    const pixelgen_ID_t ID,
+    const hrt_address reg)
+{
+	assert(ID < N_PIXELGEN_ID);
+	assert(PIXELGEN_CTRL_BASE[ID] != (hrt_address) - 1);
+	return ia_css_device_load_uint32(PIXELGEN_CTRL_BASE[ID] + reg * sizeof(
+					     hrt_data));
+}
+
+/**
+ * @brief Store a value to the register.
+ * Refer to "pixelgen_ctrl_public.h" for details.
+ */
+STORAGE_CLASS_PIXELGEN_C void pixelgen_ctrl_reg_store(
+    const pixelgen_ID_t ID,
+    const hrt_address reg,
+    const hrt_data value)
+{
+	assert(ID < N_PIXELGEN_ID);
+	assert(PIXELGEN_CTRL_BASE[ID] != (hrt_address)-1);
+
+	ia_css_device_store_uint32(PIXELGEN_CTRL_BASE[ID] + reg * sizeof(hrt_data),
+				   value);
+}
+
+/* end of DLI */
+
 /*****************************************************
  *
  * Native command interface (NCI).
@@ -144,40 +181,4 @@ STORAGE_CLASS_PIXELGEN_C void pixelgen_ctrl_dump_state(
 }
 
 /* end of NCI */
-/*****************************************************
- *
- * Device level interface (DLI).
- *
- *****************************************************/
-/**
- * @brief Load the register value.
- * Refer to "pixelgen_public.h" for details.
- */
-STORAGE_CLASS_PIXELGEN_C hrt_data pixelgen_ctrl_reg_load(
-    const pixelgen_ID_t ID,
-    const hrt_address reg)
-{
-	assert(ID < N_PIXELGEN_ID);
-	assert(PIXELGEN_CTRL_BASE[ID] != (hrt_address) - 1);
-	return ia_css_device_load_uint32(PIXELGEN_CTRL_BASE[ID] + reg * sizeof(
-					     hrt_data));
-}
-
-/**
- * @brief Store a value to the register.
- * Refer to "pixelgen_ctrl_public.h" for details.
- */
-STORAGE_CLASS_PIXELGEN_C void pixelgen_ctrl_reg_store(
-    const pixelgen_ID_t ID,
-    const hrt_address reg,
-    const hrt_data value)
-{
-	assert(ID < N_PIXELGEN_ID);
-	assert(PIXELGEN_CTRL_BASE[ID] != (hrt_address)-1);
-
-	ia_css_device_store_uint32(PIXELGEN_CTRL_BASE[ID] + reg * sizeof(hrt_data),
-				   value);
-}
-
-/* end of DLI */
 #endif /* __PIXELGEN_PRIVATE_H_INCLUDED__ */
-- 
2.26.2

