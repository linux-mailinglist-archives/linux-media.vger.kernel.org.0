Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1B386DB17F
	for <lists+linux-media@lfdr.de>; Fri,  7 Apr 2023 19:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbjDGRTD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Apr 2023 13:19:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbjDGRS6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Apr 2023 13:18:58 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CCAC7EFD
        for <linux-media@vger.kernel.org>; Fri,  7 Apr 2023 10:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680887936; x=1712423936;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=EGAnERw9wu6igTvBuTfIcoLxjvuZfNqDfYfVy72b5KY=;
  b=LW7RzLejbfROPnWm1ndzQV1NKgnZu9p68ywgxQyl9y3bSPldK/qgHr/V
   V+rixsTCPS97oAe9C3aI1l2vTOAiZXpgEpJuORxmx8xjeR+qVJwZEE4Ol
   +OnsE+xl8W2HlhjpQ5qCa44ucxZqqDrgpo4gD87pkJf+A5OivI1AfJicn
   5tlmRZ2RvljNSD2jt5M3PDCArTRehN9XUw6q2X0J1ml8Ayz3q9O93kHuk
   7Ex4Q0Au/YRucx+SaTvY+ByZj95nUswIKLlrRgyvUSW6/wMRVnGce8EjG
   NYkl68ljXAsmF26p8kKwaAf8yDBZSruGpDxUlM6Q8rqDNvEYaW/9gnpTc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="341782432"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="341782432"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 10:18:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="752103581"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="752103581"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 10:18:48 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 710D9120D2F
        for <linux-media@vger.kernel.org>; Fri,  7 Apr 2023 20:09:34 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 2/4] media: ccs: Apply module manufacturer hack on non-CCS devices only
Date:   Fri,  7 Apr 2023 20:09:29 +0300
Message-Id: <20230407170931.30842-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230407170931.30842-1-sakari.ailus@linux.intel.com>
References: <20230407170931.30842-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
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

