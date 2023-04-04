Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 991FF6D6D38
	for <lists+linux-media@lfdr.de>; Tue,  4 Apr 2023 21:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235844AbjDDTdS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Apr 2023 15:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236075AbjDDTdP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Apr 2023 15:33:15 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7918C2111
        for <linux-media@vger.kernel.org>; Tue,  4 Apr 2023 12:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680636793; x=1712172793;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6EjCmsez9n0w4tHMCRBt57ckAMYU5T4XyhMcsBrQMqI=;
  b=YSp7ME9k0IT6cdcpEdIgcu1WUXmg+PyYiYOaD8dAae+Mjqf319GrMjBl
   CtGyQRJUEaulycXzSCJXmIwNxEzkocpTQygWBxn4/O10+nUrYlLaLC+/a
   OBpHIM1V6ekU6eX16hh6pVs2EEj6APtE0M7ft4hltlx6fp1XyYx465DH9
   TnYcVo5006Fj0cthGn6LqKj8cZmaHokovExSPaAs8nDKAunlqSezBJE/7
   AlK2J0Epbw8Y2oN4FUV/l1C5ooNOFAMU8g/4SAo2NFLMqDjxeGbnuD9ri
   lDE1CFHTK/BO2K0GuAylLJl5dRbva8dUX44IiCHYGInH/1RR908Gape6P
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="370104297"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; 
   d="scan'208";a="370104297"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 12:33:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="689009506"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; 
   d="scan'208";a="689009506"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 12:33:12 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id A9526122E26;
        Tue,  4 Apr 2023 22:23:49 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     jacopo.mondi@ideasonboard.com
Subject: [PATCH v2 2/2] media: ccs: Add V4L2 controls from properties
Date:   Tue,  4 Apr 2023 22:23:47 +0300
Message-Id: <20230404192347.1798323-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230404192347.1798323-1-sakari.ailus@linux.intel.com>
References: <20230404192347.1798323-1-sakari.ailus@linux.intel.com>
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

Add V4L2 controls (currently CAMERA_SENSOR_ROTATION and
CAMERA_SENSOR_ORIENTATION) from properties.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index d44d3a44166f..daee36c1f545 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -796,14 +796,24 @@ static const struct v4l2_ctrl_ops ccs_ctrl_ops = {
 static int ccs_init_controls(struct ccs_sensor *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
+	struct v4l2_fwnode_device_properties props;
 	int rval;
 
-	rval = v4l2_ctrl_handler_init(&sensor->pixel_array->ctrl_handler, 17);
+	rval = v4l2_ctrl_handler_init(&sensor->pixel_array->ctrl_handler, 19);
 	if (rval)
 		return rval;
 
 	sensor->pixel_array->ctrl_handler.lock = &sensor->mutex;
 
+	rval = v4l2_fwnode_device_parse(&client->dev, &props);
+	if (rval)
+		return rval;
+
+	rval = v4l2_ctrl_new_fwnode_properties(&sensor->pixel_array->ctrl_handler,
+					       &ccs_ctrl_ops, &props);
+	if (rval)
+		return rval;
+
 	switch (CCS_LIM(sensor, ANALOG_GAIN_CAPABILITY)) {
 	case CCS_ANALOG_GAIN_CAPABILITY_GLOBAL: {
 		struct {
@@ -3181,7 +3191,6 @@ static int ccs_get_hwconfig(struct ccs_sensor *sensor, struct device *dev)
 	struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = V4L2_MBUS_UNKNOWN };
 	struct fwnode_handle *ep;
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
-	u32 rotation;
 	unsigned int i;
 	int rval;
 
-- 
2.30.2

