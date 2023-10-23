Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EAA77D36AC
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 14:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233322AbjJWMdU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 08:33:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233161AbjJWMdT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 08:33:19 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16F581A4
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 05:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698064397; x=1729600397;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7Iv11Vf82OBhKjdTzBF7RDMBKinJxkhNrNeck567Omw=;
  b=QJ3kshBz7nZVXWqREenXbFp8v1Lx2XK0R23sS2kqZ4TZ3tnA93gzFqt+
   69MXSt1TRUkrqzUEtdCqjJEFvEn3yIm2brhDk/seBq9V6lBRQWwZ0ahBU
   sOza+JxZpRxAh4OeAmdNWMT1jrhw85lhkjMa/1VNLrDpiestFPjaU387P
   CotxpyqQ84SKLAqisF2Q7DXiqvspcRaDnpT7W/WWhNuy3dUG/QyY3RElY
   PeYIDuk1Sr/bTcukd4j+AHDhR4oMYJsvFonT1lP4+LPRYbyJ2XZlj79Qc
   aRpdTzLP9khU8msjeqbKyLo6yBr39TriSqDtwn/fMdGDUgZNfvKrl6P7y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="386645048"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="386645048"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 05:33:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="761728895"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="761728895"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 05:33:14 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 7282912035C;
        Mon, 23 Oct 2023 15:33:11 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: [PATCH v2 2/6] media: v4l: subdev: Rename sub-device state information access functions
Date:   Mon, 23 Oct 2023 15:33:04 +0300
Message-Id: <20231023123308.782592-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231023123308.782592-1-sakari.ailus@linux.intel.com>
References: <20231023123308.782592-1-sakari.ailus@linux.intel.com>
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

Rename the sub-devices state information access functions, removing
"_stream" from them. This makes them shorter and so more convenient to
use. No other sets of functions will be needed to access this information.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ds90ub913.c                 |  3 +-
 drivers/media/i2c/ds90ub953.c                 |  3 +-
 drivers/media/i2c/ds90ub960.c                 | 12 ++++----
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c | 10 +++----
 drivers/media/v4l2-core/v4l2-subdev.c         | 27 +++++++++---------
 include/media/v4l2-subdev.h                   | 28 ++++++++++---------
 6 files changed, 40 insertions(+), 43 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 8e9ebed09f64..8bb6be956780 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -424,8 +424,7 @@ static int ub913_set_fmt(struct v4l2_subdev *sd,
 	}
 
 	/* Set sink format */
-	fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
-						  format->stream);
+	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
 	if (!fmt)
 		return -EINVAL;
 
diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 644022312833..4eb08e3a31c7 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -558,8 +558,7 @@ static int ub953_set_fmt(struct v4l2_subdev *sd,
 		return v4l2_subdev_get_fmt(sd, state, format);
 
 	/* Set sink format */
-	fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
-						  format->stream);
+	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
 	if (!fmt)
 		return -EINVAL;
 
diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index b8f3e5ca03ef..1d1476098c92 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -2451,9 +2451,8 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 		if (rx_data[nport].num_streams > 2)
 			return -EPIPE;
 
-		fmt = v4l2_subdev_state_get_stream_format(state,
-							  route->sink_pad,
-							  route->sink_stream);
+		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
+						   route->sink_stream);
 		if (!fmt)
 			return -EPIPE;
 
@@ -2842,8 +2841,8 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 			const struct ub960_format_info *ub960_fmt;
 			struct v4l2_mbus_framefmt *fmt;
 
-			fmt = v4l2_subdev_state_get_stream_format(state, pad,
-								  route->source_stream);
+			fmt = v4l2_subdev_state_get_format(state, pad,
+							   route->source_stream);
 
 			if (!fmt) {
 				ret = -EINVAL;
@@ -2891,8 +2890,7 @@ static int ub960_set_fmt(struct v4l2_subdev *sd,
 	if (!ub960_find_format(format->format.code))
 		format->format.code = ub960_formats[0].code;
 
-	fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
-						  format->stream);
+	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
 	if (!fmt)
 		return -EINVAL;
 
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index 792f031e032a..9401261eb239 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -58,7 +58,7 @@ static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
 		return -EINVAL;
 	}
 
-	fmt = v4l2_subdev_state_get_stream_format(state, port, 0);
+	fmt = v4l2_subdev_state_get_format(state, port, 0);
 	if (!fmt)
 		return -EINVAL;
 
@@ -281,8 +281,7 @@ static int mxc_isi_crossbar_set_fmt(struct v4l2_subdev *sd,
 	 * Set the format on the sink stream and propagate it to the source
 	 * streams.
 	 */
-	sink_fmt = v4l2_subdev_state_get_stream_format(state, fmt->pad,
-						       fmt->stream);
+	sink_fmt = v4l2_subdev_state_get_format(state, fmt->pad, fmt->stream);
 	if (!sink_fmt)
 		return -EINVAL;
 
@@ -296,8 +295,9 @@ static int mxc_isi_crossbar_set_fmt(struct v4l2_subdev *sd,
 		    route->sink_stream != fmt->stream)
 			continue;
 
-		source_fmt = v4l2_subdev_state_get_stream_format(state, route->source_pad,
-								 route->source_stream);
+		source_fmt = v4l2_subdev_state_get_format(state,
+							  route->source_pad,
+							  route->source_stream);
 		if (!source_fmt)
 			return -EINVAL;
 
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 955ee9a6c91f..9c267aaef56b 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -177,7 +177,7 @@ static int check_state(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
 {
 	if (sd->flags & V4L2_SUBDEV_FL_STREAMS) {
 #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
-		if (!v4l2_subdev_state_get_stream_format(state, pad, stream))
+		if (!v4l2_subdev_state_get_format(state, pad, stream))
 			return -EINVAL;
 		return 0;
 #else
@@ -1581,8 +1581,8 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
 	struct v4l2_mbus_framefmt *fmt;
 
 	if (sd->flags & V4L2_SUBDEV_FL_STREAMS)
-		fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
-							  format->stream);
+		fmt = v4l2_subdev_state_get_format(state, format->pad,
+						   format->stream);
 	else if (format->pad < sd->entity.num_pads && format->stream == 0)
 		fmt = v4l2_subdev_get_pad_format(sd, state, format->pad);
 	else
@@ -1678,8 +1678,8 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
 EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing_with_fmt);
 
 struct v4l2_mbus_framefmt *
-v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
-				    unsigned int pad, u32 stream)
+v4l2_subdev_state_get_format(struct v4l2_subdev_state *state, unsigned int pad,
+			     u32 stream)
 {
 	struct v4l2_subdev_stream_configs *stream_configs;
 	unsigned int i;
@@ -1709,11 +1709,11 @@ v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
 
 	return NULL;
 }
-EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_stream_format);
+EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_format);
 
 struct v4l2_rect *
-v4l2_subdev_state_get_stream_crop(struct v4l2_subdev_state *state,
-				  unsigned int pad, u32 stream)
+v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
+			   u32 stream)
 {
 	struct v4l2_subdev_stream_configs *stream_configs;
 	unsigned int i;
@@ -1743,11 +1743,11 @@ v4l2_subdev_state_get_stream_crop(struct v4l2_subdev_state *state,
 
 	return NULL;
 }
-EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_stream_crop);
+EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_crop);
 
 struct v4l2_rect *
-v4l2_subdev_state_get_stream_compose(struct v4l2_subdev_state *state,
-				     unsigned int pad, u32 stream)
+v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state, unsigned int pad,
+			      u32 stream)
 {
 	struct v4l2_subdev_stream_configs *stream_configs;
 	unsigned int i;
@@ -1777,7 +1777,7 @@ v4l2_subdev_state_get_stream_compose(struct v4l2_subdev_state *state,
 
 	return NULL;
 }
-EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_stream_compose);
+EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_compose);
 
 int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
 					  u32 pad, u32 stream, u32 *other_pad,
@@ -1823,8 +1823,7 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
 	if (ret)
 		return NULL;
 
-	return v4l2_subdev_state_get_stream_format(state, other_pad,
-						   other_stream);
+	return v4l2_subdev_state_get_format(state, other_pad, other_stream);
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_opposite_stream_format);
 
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 6a02a565035c..71cb35133b4a 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1542,7 +1542,7 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
 				     const struct v4l2_mbus_framefmt *fmt);
 
 /**
- * v4l2_subdev_state_get_stream_format() - Get pointer to a stream format
+ * v4l2_subdev_state_get_format() - Get pointer to a stream format
  * @state: subdevice state
  * @pad: pad id
  * @stream: stream id
@@ -1550,14 +1550,15 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
  * This returns a pointer to &struct v4l2_mbus_framefmt for the given pad +
  * stream in the subdev state.
  *
- * If the state does not contain the given pad + stream, NULL is returned.
+ * For stream-unaware drivers the format for the corresponding pad is returned.
+ * If the pad does not exist, NULL is returned.
  */
 struct v4l2_mbus_framefmt *
-v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
-				    unsigned int pad, u32 stream);
+v4l2_subdev_state_get_format(struct v4l2_subdev_state *state, unsigned int pad,
+			     u32 stream);
 
 /**
- * v4l2_subdev_state_get_stream_crop() - Get pointer to a stream crop rectangle
+ * v4l2_subdev_state_get_crop() - Get pointer to a stream crop rectangle
  * @state: subdevice state
  * @pad: pad id
  * @stream: stream id
@@ -1565,15 +1566,15 @@ v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
  * This returns a pointer to crop rectangle for the given pad + stream in the
  * subdev state.
  *
- * If the state does not contain the given pad + stream, NULL is returned.
+ * For stream-unaware drivers the crop rectangle for the corresponding pad is
+ * returned. If the pad does not exist, NULL is returned.
  */
 struct v4l2_rect *
-v4l2_subdev_state_get_stream_crop(struct v4l2_subdev_state *state,
-				  unsigned int pad, u32 stream);
+v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
+			   u32 stream);
 
 /**
- * v4l2_subdev_state_get_stream_compose() - Get pointer to a stream compose
- *					    rectangle
+ * v4l2_subdev_state_get_compose() - Get pointer to a stream compose rectangle
  * @state: subdevice state
  * @pad: pad id
  * @stream: stream id
@@ -1581,11 +1582,12 @@ v4l2_subdev_state_get_stream_crop(struct v4l2_subdev_state *state,
  * This returns a pointer to compose rectangle for the given pad + stream in the
  * subdev state.
  *
- * If the state does not contain the given pad + stream, NULL is returned.
+ * For stream-unaware drivers the compose rectangle for the corresponding pad is
+ * returned. If the pad does not exist, NULL is returned.
  */
 struct v4l2_rect *
-v4l2_subdev_state_get_stream_compose(struct v4l2_subdev_state *state,
-				     unsigned int pad, u32 stream);
+v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state, unsigned int pad,
+			      u32 stream);
 
 /**
  * v4l2_subdev_routing_find_opposite_end() - Find the opposite stream
-- 
2.39.2

