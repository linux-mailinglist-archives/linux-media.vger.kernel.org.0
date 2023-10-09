Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEAE37BDAA6
	for <lists+linux-media@lfdr.de>; Mon,  9 Oct 2023 14:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346444AbjJIMFi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 08:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346449AbjJIMFh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 08:05:37 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBBA2AB
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 05:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696853136; x=1728389136;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z2/kj9VPKDSWf50h0Ub2vphEwmDcBMduOifQK2YlvZk=;
  b=cX+fm7gnZSWN6WvHCx1NBRBaabD4ISIMfNxEeXj/eYjhWMFMkKP+K8qQ
   fMuqfP+Ds4HV1q3zo0kGF1yRoAxDrDYzz9sarv4hYIPIXYU3LUfy437oT
   hTIQN+J6B+xTCRAMW8eCj0opecN7VrbznJ01G2/ovSYy5UPdDJydfi3mt
   0knFIdbQ/QJ6pNIxp9flN64xMzv3HgQyWFIIatzzixs7WckBsvIDgsmXU
   PfZv8aSWYqIVKKfUIfbs+1Vu4HYxJFoxQlGr3pg1MANdjV8vk1VRA6+3W
   DgSh2jLmuTtwWMiQhTXGKAOv1VWfwYPl1E9ZzGgjsa90xlhX2CLI7Nh+S
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="2725511"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="2725511"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 05:05:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="869216203"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="869216203"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 05:05:33 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 01CD11206C3;
        Mon,  9 Oct 2023 15:05:29 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com
Subject: [PATCH 4/4] media: ccs: Fix a (harmless) lockdep warning
Date:   Mon,  9 Oct 2023 15:05:25 +0300
Message-Id: <20231009120525.202957-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009120525.202957-1-sakari.ailus@linux.intel.com>
References: <20231009120525.202957-1-sakari.ailus@linux.intel.com>
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

