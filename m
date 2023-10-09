Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2F1C7BDAA8
	for <lists+linux-media@lfdr.de>; Mon,  9 Oct 2023 14:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346449AbjJIMFk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 08:05:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346447AbjJIMFh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 08:05:37 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB89694
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 05:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696853136; x=1728389136;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8unoJ2CF6b7ZuIxRpKSJzquoipvjGCHV6k77AhsjWdU=;
  b=YN1FruR8EzptWMf5iY1EWLgDhpucPlvcE7XCzDRGBLhKDiBEFWro9Pus
   yynmEA+jXBeH3D+z3jgL0tuAi5fwDgXjCA8StUDZV5JIHGuZ1m8DYMwIl
   CLZVuC3mfe26UrSUEU+Y17nuP49LSmvzGP0+Yw1dtiGpdoslZ/VAEh0uu
   Mlni+o+iu/G4vGhPkrwl98gtJFXwDzMKPk7msK6dSPVCctUN0H6NPLX/w
   M3MlunkAJrjHYkAYPOzMNNekELZuY3a4RI5MBP+4FafFhcWIO3bzGYuhX
   CoYQ0qS+ZC0FSwWVNLodgUTiCkIxZoc7f/L/fWOasgL157lITQ+NLFvvk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="2725509"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="2725509"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 05:05:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="869216202"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="869216202"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 05:05:33 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 47BB01206B6;
        Mon,  9 Oct 2023 15:05:29 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com
Subject: [PATCH 3/4] media: ccs: Rework initialising sub-device state
Date:   Mon,  9 Oct 2023 15:05:24 +0300
Message-Id: <20231009120525.202957-4-sakari.ailus@linux.intel.com>
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

Initialise sub-device state in init_cfg callback using ccs_propagate() to
the extent it covers of the initialisation. This fixes a bug where the
driver configuration was incorrectly initialised.

Fixes: 4b05b1baae3e ("media: ccs: Use sub-device active state")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 47 ++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 2abfd5932e02..6589b0d84e06 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2075,6 +2075,7 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
 	struct v4l2_rect *comp, *crops[CCS_PADS];
+	struct v4l2_mbus_framefmt *fmt;
 
 	ccs_get_crop_compose(subdev, sd_state, crops, &comp);
 
@@ -2096,6 +2097,9 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 		fallthrough;
 	case V4L2_SEL_TGT_COMPOSE:
 		*crops[CCS_PAD_SRC] = *comp;
+		fmt = v4l2_subdev_get_pad_format(subdev, sd_state, CCS_PAD_SRC);
+		fmt->width = comp->width;
+		fmt->height = comp->height;
 		if (which == V4L2_SUBDEV_FORMAT_ACTIVE && ssd == sensor->src)
 			sensor->src_src = *crops[CCS_PAD_SRC];
 		break;
@@ -3003,31 +3007,40 @@ static int ccs_init_cfg(struct v4l2_subdev *sd,
 {
 	struct ccs_subdev *ssd = to_ccs_subdev(sd);
 	struct ccs_sensor *sensor = ssd->sensor;
-	unsigned int i;
+	unsigned int pad = ssd == sensor->pixel_array ?
+		CCS_PA_PAD_SRC : CCS_PAD_SINK;
+	struct v4l2_mbus_framefmt *fmt =
+		v4l2_subdev_get_pad_format(sd, sd_state, pad);
+	struct v4l2_rect *crop =
+		v4l2_subdev_get_pad_crop(sd, sd_state, pad);
 
 	mutex_lock(&sensor->mutex);
 
-	for (i = 0; i < ssd->npads; i++) {
-		struct v4l2_mbus_framefmt *fmt =
-			v4l2_subdev_get_pad_format(sd, sd_state, i);
-		struct v4l2_rect *crop =
-			v4l2_subdev_get_pad_crop(sd, sd_state, i);
-		struct v4l2_rect *comp;
-
-		ccs_get_native_size(ssd, crop);
+	ccs_get_native_size(ssd, crop);
 
-		fmt->width = crop->width;
-		fmt->height = crop->height;
-		fmt->code = sensor->internal_csi_format->code;
-		fmt->field = V4L2_FIELD_NONE;
+	fmt->width = crop->width;
+	fmt->height = crop->height;
+	fmt->code = sensor->internal_csi_format->code;
+	fmt->field = V4L2_FIELD_NONE;
 
-		if (ssd == sensor->pixel_array)
-			continue;
+	if (ssd == sensor->pixel_array) {
+		if (v4l2_subdev_state_whence(sd, sd_state) ==
+		    V4L2_SUBDEV_FORMAT_ACTIVE)
+			sensor->pa_src = *crop;
 
-		comp = v4l2_subdev_get_pad_compose(sd, sd_state, i);
-		*comp = *crop;
+		mutex_unlock(&sensor->mutex);
+		return 0;
 	}
 
+	fmt = v4l2_subdev_get_pad_format(sd, sd_state, CCS_PAD_SRC);
+	fmt->code = ssd == sensor->src ?
+		sensor->csi_format->code : sensor->internal_csi_format->code;
+	fmt->field = V4L2_FIELD_NONE;
+
+	ccs_propagate(sd, sd_state,
+		      v4l2_subdev_state_whence(sd, sd_state),
+		      V4L2_SEL_TGT_CROP);
+
 	mutex_unlock(&sensor->mutex);
 
 	return 0;
-- 
2.39.2

