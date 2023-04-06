Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB6A6D9EE8
	for <lists+linux-media@lfdr.de>; Thu,  6 Apr 2023 19:36:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239393AbjDFRgD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Apr 2023 13:36:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbjDFRf7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Apr 2023 13:35:59 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 010D19768
        for <linux-media@vger.kernel.org>; Thu,  6 Apr 2023 10:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680802537; x=1712338537;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=EGAnERw9wu6igTvBuTfIcoLxjvuZfNqDfYfVy72b5KY=;
  b=eXosQZXreLE0X3LK+WPTqpxVn8q4V9i3XVmoIJ3EpyNy+/Rk6SYLB3Mq
   txlnxu+M4sP6a8FqVpIgf1hhWdgCrmm5f1uCe0nnuCEZGqeDEljoBS/gX
   Py9LVk0WCzootu0E1jPnj3dhH+LpsPZKCqOIVsNdMDWzIISIc/dstLjpK
   UaYY86XIHFGB749LsAitWojmAloFsJBYPOI8dgoSdV16KCxytYqpgekEA
   wjpBDLjgNCuvjAxHuOcAftugrmw1GamIIwS06kLh6x2cPU+YycR9eHA42
   T1hfb4Y0VAQrLSy7Xi0jUvWs9ZJSQhxzSScc5tX/aXE+2LGAsvDU0qukx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="370629616"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="370629616"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 10:34:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="664558668"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="664558668"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 10:34:33 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id AB42D122C27
        for <linux-media@vger.kernel.org>; Thu,  6 Apr 2023 20:34:31 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 2/4] media: ccs: Apply module manufacturer hack on non-CCS devices only
Date:   Thu,  6 Apr 2023 20:34:26 +0300
Message-Id: <20230406173428.19855-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230406173428.19855-1-sakari.ailus@linux.intel.com>
References: <20230406173428.19855-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some modules don't have any model identification information in the
register address space. The driver as a SMIA++ driver attempted to use
sensor information in this case. This workaround is definitely not for CCS
devices.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 4adb2da34066..20c3974f5ac7 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2894,19 +2894,18 @@ static int ccs_identify_module(struct ccs_sensor *sensor)
 			"smia version %2.2d smiapp version %2.2d\n",
 			minfo->smia_version, minfo->smiapp_version);
 		minfo->name = SMIAPP_NAME;
-	}
-
-	/*
-	 * Some modules have bad data in the lvalues below. Hope the
-	 * rvalues have better stuff. The lvalues are module
-	 * parameters whereas the rvalues are sensor parameters.
-	 */
-	if (minfo->sensor_smia_manufacturer_id &&
-	    !minfo->smia_manufacturer_id && !minfo->model_id) {
-		minfo->smia_manufacturer_id =
-			minfo->sensor_smia_manufacturer_id;
-		minfo->model_id = minfo->sensor_model_id;
-		minfo->revision_number = minfo->sensor_revision_number;
+		/*
+		 * Some modules have bad data in the lvalues below. Hope the
+		 * rvalues have better stuff. The lvalues are module
+		 * parameters whereas the rvalues are sensor parameters.
+		 */
+		if (minfo->sensor_smia_manufacturer_id &&
+		    !minfo->smia_manufacturer_id && !minfo->model_id) {
+			minfo->smia_manufacturer_id =
+				minfo->sensor_smia_manufacturer_id;
+			minfo->model_id = minfo->sensor_model_id;
+			minfo->revision_number = minfo->sensor_revision_number;
+		}
 	}
 
 	for (i = 0; i < ARRAY_SIZE(ccs_module_idents); i++) {
-- 
2.30.2

