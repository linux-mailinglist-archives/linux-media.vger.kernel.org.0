Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F59D7A62AA
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 14:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232193AbjISMUV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 08:20:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231937AbjISMUE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 08:20:04 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3007DCC0
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 05:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695125958; x=1726661958;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WzjlkB3WlPA+Zgzq9Or2UFud53dJ/TyuIxvuUbOGiRQ=;
  b=QVr0qFBhqw3rV2uG9/iiSCI349zmBjqi8FQMDd3JflfJwYBbn6sfUkTE
   HmMsGf4SVKv5cBrZp24RIeXa5GcLFzD+L/ROSNB3Amtc7quKPOkqvff8d
   DHA8EOC9N8dOvsU1MTInfDDUH+YCiGaIjif/YFzz3Y8vrtfx5PPPBzJSV
   Q45ewAfkmABCuO0+i+cqsgM8QlCzWqlyRHY3At1FGuQG/zSuyLy+gUM6/
   C+yvgjA2bTlapFZBhen6j+KHGmQFVfDARg4nSqqVxtlwCcg28Ta4LJWtr
   SAuMAHjyNZ+q1ly65EGNqG+SXwu1RZCjlyigJPjyK94Givkk7x8lXpYYC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="466251032"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="466251032"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 05:17:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811701639"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="811701639"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 05:17:46 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id E1A5C121380;
        Tue, 19 Sep 2023 15:17:42 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v3 10/12] media: v4l: subdev: Clear frame descriptor before get_frame_desc
Date:   Tue, 19 Sep 2023 15:17:26 +0300
Message-Id: <20230919121728.126781-11-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230919121728.126781-1-sakari.ailus@linux.intel.com>
References: <20230919121728.126781-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_FILL_THIS_FORM_SHORT autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Clear frame descriptor before calling transmitter's get_frame_desc() op.
Also remove the corresponding memset() calls from drivers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub913.c              | 2 --
 drivers/media/i2c/ds90ub953.c              | 2 --
 drivers/media/i2c/ds90ub960.c              | 2 --
 drivers/media/platform/nxp/imx-mipi-csis.c | 2 --
 drivers/media/v4l2-core/v4l2-subdev.c      | 9 +++++++++
 5 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 4bfa3b3cf619..8e9ebed09f64 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -362,8 +362,6 @@ static int ub913_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	if (ret)
 		return ret;
 
-	memset(fd, 0, sizeof(*fd));
-
 	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
 
 	state = v4l2_subdev_lock_and_get_active_state(sd);
diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index dc394e22a42c..644022312833 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -499,8 +499,6 @@ static int ub953_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	if (ret)
 		return ret;
 
-	memset(fd, 0, sizeof(*fd));
-
 	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
 
 	state = v4l2_subdev_lock_and_get_active_state(sd);
diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 8ba5750f5a23..b8f3e5ca03ef 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -2786,8 +2786,6 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	if (!ub960_pad_is_source(priv, pad))
 		return -EINVAL;
 
-	memset(fd, 0, sizeof(*fd));
-
 	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
 
 	state = v4l2_subdev_lock_and_get_active_state(&priv->sd);
diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 16f19a640130..aac9cffe503c 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1114,8 +1114,6 @@ static int mipi_csis_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
 	fd->num_entries = 1;
 
-	memset(entry, 0, sizeof(*entry));
-
 	entry->flags = 0;
 	entry->pixelcode = csis_fmt->code;
 	entry->bus.csi2.vc = 0;
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index b92348ad61f6..7b087be3ff4f 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -306,6 +306,14 @@ static int call_set_selection(struct v4l2_subdev *sd,
 	       sd->ops->pad->set_selection(sd, state, sel);
 }
 
+static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+			       struct v4l2_mbus_frame_desc *fd)
+{
+	memset(fd, 0, sizeof(*fd));
+
+	return sd->ops->pad->get_frame_desc(sd, pad, fd);
+}
+
 static inline int check_edid(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_edid *edid)
 {
@@ -431,6 +439,7 @@ static const struct v4l2_subdev_pad_ops v4l2_subdev_call_pad_wrappers = {
 	.set_edid		= call_set_edid,
 	.dv_timings_cap		= call_dv_timings_cap,
 	.enum_dv_timings	= call_enum_dv_timings,
+	.get_frame_desc		= call_get_frame_desc,
 	.get_mbus_config	= call_get_mbus_config,
 };
 
-- 
2.39.2

