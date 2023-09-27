Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0294C7B0A4E
	for <lists+linux-media@lfdr.de>; Wed, 27 Sep 2023 18:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbjI0QdF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 12:33:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231781AbjI0QdD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 12:33:03 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86E459C
        for <linux-media@vger.kernel.org>; Wed, 27 Sep 2023 09:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695832382; x=1727368382;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fKrqt/oVHxujyEDtQ/2VaWPFvNlfU4S6H9l/Pn0mQsY=;
  b=SkGR/9wLM3JHP5ec8QfDrhb4qNdUIE69wnpQlCzsSBtO4XOl1CXGS3Zk
   R+lL2CMzI9EF/Dba5fCgpXPz/d+17PtlLZkj2nPZQ/rOaG7SxmSmyNMGl
   fzOrs0+3hlJq4MWACSXevzQ3I12ojnY/3hUMWL2kv6zjYaDi50YY6MOMy
   l0s+XcpIK5ueuz1rWXeBEtNPCTFWOiDXbMfNOoa2EBkcU2ptJrsViEO3z
   y32poVhlgmJj6ST2+twoceqvonv9sXX2MAPAS1UF7XcDSBA96kCUNJWaQ
   j7gRbhfIbuFMQifsvwTazXzv/6e9L1afaeTgaECvWZc1HNeqf9XmOkXNh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="381771263"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="381771263"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 09:33:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="892665771"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="892665771"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 09:31:51 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id EAD5411F967;
        Wed, 27 Sep 2023 19:32:54 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v5 12/26] media: v4l: subdev: Add helpers for format, crop and compose pointers
Date:   Wed, 27 Sep 2023 19:31:58 +0300
Message-Id: <20230927163212.402025-13-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927163212.402025-1-sakari.ailus@linux.intel.com>
References: <20230927163212.402025-1-sakari.ailus@linux.intel.com>
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

Add a helper for obtaining format, crop and compose pointers. These are
convenient for drivers, independently of the driver uses streams or not.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 54 ++++++++++++++++++++++----
 include/media/v4l2-subdev.h           | 56 +++++++++++++++++++++++++++
 2 files changed, 102 insertions(+), 8 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index d295a4e87b66..854f9d4db923 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1573,19 +1573,57 @@ v4l2_subdev_init_stream_configs(struct v4l2_subdev_stream_configs *stream_config
 	return 0;
 }
 
+struct v4l2_mbus_framefmt
+*v4l2_subdev_get_fmt_ptr(struct v4l2_subdev *sd,
+			 struct v4l2_subdev_state *state, unsigned int pad,
+			 unsigned int stream)
+{
+	if (sd->flags & V4L2_SUBDEV_FL_STREAMS)
+		return v4l2_subdev_state_get_stream_format(state, pad, stream);
+
+	if (pad < sd->entity.num_pads && stream == 0)
+		return v4l2_subdev_get_pad_format(sd, state, pad);
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_get_fmt_ptr);
+
+struct v4l2_rect
+*v4l2_subdev_get_crop_ptr(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_state *state, unsigned int pad,
+			  unsigned int stream)
+{
+	if (sd->flags & V4L2_SUBDEV_FL_STREAMS)
+		return v4l2_subdev_state_get_stream_crop(state, pad, stream);
+
+	if (pad < sd->entity.num_pads && stream == 0)
+		return v4l2_subdev_get_pad_crop(sd, state, pad);
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_get_crop_ptr);
+
+struct v4l2_rect
+*v4l2_subdev_get_compose_ptr(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state, unsigned int pad,
+			     unsigned int stream)
+{
+	if (sd->flags & V4L2_SUBDEV_FL_STREAMS)
+		return v4l2_subdev_state_get_stream_compose(state, pad, stream);
+
+	if (pad < sd->entity.num_pads && stream == 0)
+		return v4l2_subdev_get_pad_compose(sd, state, pad);
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_get_compose_ptr);
+
 int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
 			struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt;
 
-	if (sd->flags & V4L2_SUBDEV_FL_STREAMS)
-		fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
-							  format->stream);
-	else if (format->pad < sd->entity.num_pads && format->stream == 0)
-		fmt = v4l2_subdev_get_pad_format(sd, state, format->pad);
-	else
-		fmt = NULL;
-
+	fmt = v4l2_subdev_get_fmt_ptr(sd, state, format->pad, format->stream);
 	if (!fmt)
 		return -EINVAL;
 
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 5f59ff0796b7..7c34243ffed9 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1479,6 +1479,62 @@ v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
 
 #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 
+/**
+ * v4l2_subdev_get_fmt_ptr - Obtain a pointer to V4L2 sub-device format for pad
+ *			     and stream
+ * @sd: subdevice
+ * @state: subdevice state
+ * @pad: the pad on the sub-device
+ * @stream: stream in the pad
+ *
+ * For given pad and stream, obtain a pointer to the mbus format from the
+ * sub-device.
+ *
+ * Returns NULL if the format is not found or the parameters are invalid.
+ */
+struct v4l2_mbus_framefmt *
+v4l2_subdev_get_fmt_ptr(struct v4l2_subdev *sd,
+			struct v4l2_subdev_state *state, unsigned int pad,
+			unsigned int stream);
+
+/**
+ * v4l2_subdev_get_crop_ptr - Obtain a pointer to V4L2 sub-device crop
+ *			      rectangle for pad and stream
+ * @sd: subdevice
+ * @state: subdevice state
+ * @pad: the pad on the sub-device
+ * @stream: stream in the pad
+ *
+ * For given pad and stream, obtain a pointer to the crop selection rectangle
+ * from the sub-device.
+ *
+ * Returns NULL if the selection rectangle is not found or the parameters are
+ * invalid.
+ */
+struct v4l2_rect *
+v4l2_subdev_get_crop_ptr(struct v4l2_subdev *sd,
+			 struct v4l2_subdev_state *state, unsigned int pad,
+			 unsigned int stream);
+
+/**
+ * v4l2_subdev_get_compose_ptr - Obtain a pointer to V4L2 sub-device compose
+ *				 rectangle for pad and stream
+ * @sd: subdevice
+ * @state: subdevice state
+ * @pad: the pad on the sub-device
+ * @stream: stream in the pad
+ *
+ * For given pad and stream, obtain a pointer to the compose selection rectangle
+ * from the sub-device.
+ *
+ * Returns NULL if the selection rectangle is not found or the parameters are
+ * invalid.
+ */
+struct v4l2_rect *
+v4l2_subdev_get_compose_ptr(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *state, unsigned int pad,
+			    unsigned int stream);
+
 /**
  * v4l2_subdev_get_fmt() - Fill format based on state
  * @sd: subdevice
-- 
2.39.2

