Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D89BF6DB17C
	for <lists+linux-media@lfdr.de>; Fri,  7 Apr 2023 19:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbjDGRTB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Apr 2023 13:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbjDGRS4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Apr 2023 13:18:56 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81B6F4C3A
        for <linux-media@vger.kernel.org>; Fri,  7 Apr 2023 10:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680887930; x=1712423930;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=cx4hJ5DRhTiFqQAPxUDHiiimx5je5rn1rrZ/kTHSHJY=;
  b=ZmN2j8L4PEhRHNRkbQ6xSZBy5PKBYXgYSQCFT8eKJkgPUReA7+YSBWV0
   kNdVzyCE/yk+nkDSBp9qxYLxKUe362ZUoNipRkSwUR1hot4KYphgc9oO5
   RRelLOn3lsCSfpvCCv1EkZny/H7KMkRZ3k8WJzbsvHP5fuzWAPkgN5ptt
   2sOcAvYCyAKV7Ug8AEmdYJoDPM+AUKMYmdKgixJ6NjykucAo4DjTSNsbV
   nkBK3DJ4kS87lSD4Jsjbwob3K3dsDxCZGcn7d5ZygVDqRr6LdBxpbtSHq
   7yBAteNLb4gPVg+UMJieTVVa1Msx8DV0x/iOsb+GkT4w9XY1CW0Cc0EOn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="341782430"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="341782430"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 10:18:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="752103584"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="752103584"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 10:18:48 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id F32CE120CF4
        for <linux-media@vger.kernel.org>; Fri,  7 Apr 2023 20:09:33 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 1/4] media: ccs: Support 16-bit sensor revision number register
Date:   Fri,  7 Apr 2023 20:09:28 +0300
Message-Id: <20230407170931.30842-2-sakari.ailus@linux.intel.com>
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

Read 16-bit sensor revision number if the 8-bit register has value 0.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index daee36c1f545..4adb2da34066 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2834,6 +2834,10 @@ static int ccs_identify_module(struct ccs_sensor *sensor)
 		rval = ccs_read_addr_8only(sensor,
 					   CCS_R_SENSOR_REVISION_NUMBER,
 					   &minfo->sensor_revision_number);
+	if (!rval && !minfo->sensor_revision_number)
+		rval = ccs_read_addr_8only(sensor,
+					   CCS_R_SENSOR_REVISION_NUMBER_16,
+					   &minfo->sensor_revision_number);
 	if (!rval)
 		rval = ccs_read_addr_8only(sensor,
 					   CCS_R_SENSOR_FIRMWARE_VERSION,
@@ -2876,7 +2880,7 @@ static int ccs_identify_module(struct ccs_sensor *sensor)
 			minfo->sensor_model_id);
 
 	dev_dbg(&client->dev,
-		"sensor revision 0x%2.2x firmware version 0x%2.2x\n",
+		"sensor revision 0x%4.4x firmware version 0x%2.2x\n",
 		minfo->sensor_revision_number, minfo->sensor_firmware_version);
 
 	if (minfo->ccs_version) {
-- 
2.30.2

