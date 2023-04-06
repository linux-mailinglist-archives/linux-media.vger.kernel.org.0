Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C2CD6D9EE7
	for <lists+linux-media@lfdr.de>; Thu,  6 Apr 2023 19:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239286AbjDFRgC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Apr 2023 13:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239223AbjDFRf6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Apr 2023 13:35:58 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54960AF0A
        for <linux-media@vger.kernel.org>; Thu,  6 Apr 2023 10:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680802535; x=1712338535;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=cx4hJ5DRhTiFqQAPxUDHiiimx5je5rn1rrZ/kTHSHJY=;
  b=dOkNncmcpvWLPunCH8gqrnCy1iN/Nm0zdi49TTkODbRVYB/KXThaibOG
   PbYHvY40w1aAdgazt1KlcMxLRSUz2mnudUBMHOfgRfygQIuzd8Omb//Kr
   eN1ABS8mjjFPm9udX0xlFwch5hEloXB8asQr/aYjw00Vncr4s9Kcnf77j
   LGyIr/pIV1KDrVG0zwu6M6rNSbCVZfVzOpjXviUzMzsskq4/g1SGcYtF5
   BPH8rASE6Q/AGVsv4JG4FPvXiB4mtuHBxN08TJJvLaul1spI5LwxqHVVG
   nImLGpCO9pDVUao6Laank3ujYjm/yfPCqblgQTiPkcpjjQOkUWFD7v0tu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="370629611"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="370629611"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 10:34:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="664558662"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="664558662"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 10:34:32 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id C41331228AB
        for <linux-media@vger.kernel.org>; Thu,  6 Apr 2023 20:34:30 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/4] media: ccs: Support 16-bit sensor revision number register
Date:   Thu,  6 Apr 2023 20:34:25 +0300
Message-Id: <20230406173428.19855-2-sakari.ailus@linux.intel.com>
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

