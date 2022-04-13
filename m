Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E6694FF4EB
	for <lists+linux-media@lfdr.de>; Wed, 13 Apr 2022 12:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbiDMKju (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Apr 2022 06:39:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235093AbiDMKjL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Apr 2022 06:39:11 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A5FF583A9
        for <linux-media@vger.kernel.org>; Wed, 13 Apr 2022 03:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649846199; x=1681382199;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1/MSL4hoeZaDKB+FIbGypsJQ4YWjpno6vaw7mE3wNgo=;
  b=n2l4CflkBmsJ2Kv7qwO/gfH0w/NFwlMqjPY0oP4dkDOPb53qhUxrZTZg
   rbEHR4JYUYX1yc2fRhr80Wp6Pa7oImUGgEj905S1gr72BOxOS7Wu51Txx
   T5O0DyFsdFyxsyE0ygnfTnW1I5pZskhRx5hf1ds+50LjxxzDQOk7rz0Va
   eGL4Adg/fGxFjx0PFu+C9hM73FPoQS5hmnczlKCIdpVWxv+5f5HzB5pqn
   VIFouzrvXQtGj6txFbLNuSahVpl3SndRmvnhbAGTdca6qd5og6mEW5be7
   3OuvX9FiO1/XmdS7KPmKP6Odj49CyOQsnzHdb89ehqO7u5lZmOz6Q8zwO
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="242569080"
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="242569080"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 03:36:39 -0700
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="559703228"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 03:36:38 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 3EC0120316;
        Wed, 13 Apr 2022 13:36:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1neaNY-002bug-0u; Wed, 13 Apr 2022 13:37:40 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
Subject: [PATCH 1/1] staging: media: ipu3-imgu: Request specific firmware binary
Date:   Wed, 13 Apr 2022 13:37:39 +0300
Message-Id: <20220413103739.622349-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Primarily request a specific revision of the IPU3 firmware that the driver
is known to work with,
irci_irci_ecr-master_20161208_0213_20170112_1500.bin. Some distros only
ship this while others provide a symlink called ipu3-fw.bin, which the
driver only requested previously.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/staging/media/ipu3/ipu3-css-fw.c | 4 +++-
 drivers/staging/media/ipu3/ipu3-css-fw.h | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css-fw.c b/drivers/staging/media/ipu3/ipu3-css-fw.c
index 981693eed8155..2b659b0ccca14 100644
--- a/drivers/staging/media/ipu3/ipu3-css-fw.c
+++ b/drivers/staging/media/ipu3/ipu3-css-fw.c
@@ -117,7 +117,9 @@ int imgu_css_fw_init(struct imgu_css *css)
 	unsigned int i, j, binary_nr;
 	int r;
 
-	r = request_firmware(&css->fw, IMGU_FW_NAME, css->dev);
+	r = request_firmware(&css->fw, IMGU_FW_NAME_20161208, css->dev);
+	if (r == -ENOENT)
+		r = request_firmware(&css->fw, IMGU_FW_NAME, css->dev);
 	if (r)
 		return r;
 
diff --git a/drivers/staging/media/ipu3/ipu3-css-fw.h b/drivers/staging/media/ipu3/ipu3-css-fw.h
index c0bc57fd678a7..f9403da757851 100644
--- a/drivers/staging/media/ipu3/ipu3-css-fw.h
+++ b/drivers/staging/media/ipu3/ipu3-css-fw.h
@@ -6,7 +6,9 @@
 
 /******************* Firmware file definitions *******************/
 
-#define IMGU_FW_NAME			"intel/ipu3-fw.bin"
+#define IMGU_FW_NAME		"intel/ipu3-fw.bin"
+#define IMGU_FW_NAME_20161208	\
+	"intel/irci_irci_ecr-master_20161208_0213_20170112_1500.bin"
 
 typedef u32 imgu_fw_ptr;
 
-- 
2.30.2

