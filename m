Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D47E47BEE1A
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 00:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378871AbjJIWJR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 18:09:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378885AbjJIWJQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 18:09:16 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4044A6
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 15:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696889353; x=1728425353;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z2/kj9VPKDSWf50h0Ub2vphEwmDcBMduOifQK2YlvZk=;
  b=lo8CaHiU0z5IShqMLKk9l94DLCfJuF47jbs7WLjMw3qMpEQsxNxLFnqM
   GzP4zzIurPSExU2p4/UZwr1uKybVhKSGDM3aM/POSJUWonmrv8+HI90+X
   HyYz9HhM5qaH2y5LbtRlj9blF58JhqN80HE9MOL43XCBQyOTOYPhTN07n
   PGR89L54RfC0R0hN65MMZHg9qpIJoDi4LW07m4v+nJJ6i5xP9q3uqu/Wp
   sVdfDBSbU36ZUxyvJ+K6OrW2MdNCMsj4qWei/hTO5KvyozAlDuWde3b+X
   +vvXUko8smcoUghx+F9k5m2nnHNlAP4BdYaFzaldz7mkNsE6fLNbX0Siw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="388123391"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="388123391"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 15:09:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="782647388"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="782647388"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 15:09:12 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id AC3E91209F6;
        Tue, 10 Oct 2023 01:09:09 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com
Subject: [PATCH v2 4/4] media: ccs: Fix a (harmless) lockdep warning
Date:   Tue, 10 Oct 2023 01:09:06 +0300
Message-Id: <20231009220906.221303-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009220906.221303-1-sakari.ailus@linux.intel.com>
References: <20231009220906.221303-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l2_subdev_init_finalize() is a macro that creates an unique lockdep
key and name. As the CCS driver initialises all three of its sub-devices
using the same call site, this creates a lockdep warning. Address it.

Fixes: 4b05b1baae3e ("media: ccs: Use sub-device active state")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 6589b0d84e06..2b3b712d60b5 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2955,7 +2955,9 @@ static void ccs_cleanup(struct ccs_sensor *sensor)
 
 static int ccs_init_subdev(struct ccs_sensor *sensor,
 			   struct ccs_subdev *ssd, const char *name,
-			   unsigned short num_pads, u32 function)
+			   unsigned short num_pads, u32 function,
+			   const char *lock_name,
+			   struct lock_class_key *lock_key)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	int rval;
@@ -2993,7 +2995,7 @@ static int ccs_init_subdev(struct ccs_sensor *sensor,
 		return rval;
 	}
 
-	rval = v4l2_subdev_init_finalize(&ssd->sd);
+	rval = __v4l2_subdev_init_finalize(&ssd->sd, lock_name, lock_key);
 	if (rval) {
 		media_entity_cleanup(&ssd->sd.entity);
 		return rval;
@@ -3208,6 +3210,8 @@ static int ccs_firmware_name(struct i2c_client *client,
 
 static int ccs_probe(struct i2c_client *client)
 {
+	static struct lock_class_key pixel_array_lock_key, binner_lock_key,
+		scaler_lock_key;
 	const struct ccs_device *ccsdev = device_get_match_data(&client->dev);
 	struct ccs_sensor *sensor;
 	const struct firmware *fw;
@@ -3491,15 +3495,18 @@ static int ccs_probe(struct i2c_client *client)
 	}
 
 	rval = ccs_init_subdev(sensor, sensor->scaler, " scaler", 2,
-			       MEDIA_ENT_F_PROC_VIDEO_SCALER);
+			       MEDIA_ENT_F_PROC_VIDEO_SCALER,
+			       "ccs scaler mutex", &scaler_lock_key);
 	if (rval)
 		goto out_cleanup;
 	rval = ccs_init_subdev(sensor, sensor->binner, " binner", 2,
-			       MEDIA_ENT_F_PROC_VIDEO_SCALER);
+			       MEDIA_ENT_F_PROC_VIDEO_SCALER,
+			       "ccs binner mutex", &binner_lock_key);
 	if (rval)
 		goto out_cleanup;
 	rval = ccs_init_subdev(sensor, sensor->pixel_array, " pixel_array", 1,
-			       MEDIA_ENT_F_CAM_SENSOR);
+			       MEDIA_ENT_F_CAM_SENSOR, "ccs pixel array mutex",
+			       &pixel_array_lock_key);
 	if (rval)
 		goto out_cleanup;
 
-- 
2.39.2

