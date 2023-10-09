Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6147E7BEE19
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 00:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378869AbjJIWJQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 18:09:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378865AbjJIWJP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 18:09:15 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76C48C5
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 15:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696889353; x=1728425353;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8unoJ2CF6b7ZuIxRpKSJzquoipvjGCHV6k77AhsjWdU=;
  b=M5nANJxq5XAai8JRLLv5tWoxweGLGzvNuvLGJasvm+FhQV+2LIjKArNX
   deXUzlcmhyseFp6jtZ0/N1Lf8N59NtDF2KasOQYe4FcmM1yj1TP/xju+x
   gaMPUTLBHSNf8gRujYhi3mcigeC6eSX2cvmSYvkUV9bfX3u5aPqgJUg+7
   9KzUZqceYNBISeQ5SLiTtzBVBBWgn7HgPROtV0AWh20PqXBcIjOzfjg0V
   8nm/HwsPPofzAxGfPmi76Nr+vH+ECzVL/fDCvjoJuu62/WeFASvqiL5k1
   /I6lYNcr4hKITnh53m57ap6zWAeB5uIBXliu3sX3wjkpbBTxtuAHFs/aW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="388123384"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="388123384"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 15:09:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="782647387"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="782647387"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 15:09:11 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id E74881209E7;
        Tue, 10 Oct 2023 01:09:08 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com
Subject: [PATCH v2 3/4] media: ccs: Rework initialising sub-device state
Date:   Tue, 10 Oct 2023 01:09:05 +0300
Message-Id: <20231009220906.221303-4-sakari.ailus@linux.intel.com>
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

