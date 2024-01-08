Return-Path: <linux-media+bounces-3286-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A468268EA
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 08:52:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0AA52820F4
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 07:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A349B9465;
	Mon,  8 Jan 2024 07:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VQLUBmS+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C4C8C01
	for <linux-media@vger.kernel.org>; Mon,  8 Jan 2024 07:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704700350; x=1736236350;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B8/OVJtmDEcgXIiLH9jGocmqv2Nxyy8Q1vmUNOX5+yw=;
  b=VQLUBmS+rJi4QXU3Iv12JIAyQnNmdxS31hXqGu6OHKO0SB5d5B5u+HHW
   YQygYbKubWcZ0pMVfcY7coGlxa4jd+2qiEtigW/ayr2sQJdtpeUoWXrQc
   V8VkSGBjRECEFmkcF/xRMpp9EZyiKBrJlEvT8tvML74KWpbLXjvRtslUn
   +cr2ID+C+x7f53KRIsSaHGpGDx2Gb9PZPSO/6uCps6Yyj93WXkcKdwbob
   p+mNgacfMO8ipUQCS07Qy+9Ipj1HzQlm4xL3cPC5pGIogJJMtbAW5ujYl
   8Wrw+EQJ2Mkcyv9iRIZ5fPWGCtCqZfQ3eIOSncuE7x/fgmj+W3MKqMjLN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="11163903"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="11163903"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 23:52:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="1028325415"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="1028325415"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 23:52:26 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id AD9EE120736;
	Mon,  8 Jan 2024 09:52:23 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 2/4] media: imx334: Use v4l2_link_freq_to_bitmap helper
Date: Mon,  8 Jan 2024 09:52:19 +0200
Message-Id: <20240108075221.15757-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240108075221.15757-1-sakari.ailus@linux.intel.com>
References: <20240108075221.15757-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the v4l2_link_freq_to_bitmap() helper to figure out which
driver-supported link frequencies can be used on a given system.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx334.c | 41 +++++++++++---------------------------
 1 file changed, 12 insertions(+), 29 deletions(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 6725b3e2a73e..40863d87d341 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -136,7 +136,7 @@ struct imx334_mode {
  * @vblank: Vertical blanking in lines
  * @cur_mode: Pointer to current selected sensor mode
  * @mutex: Mutex for serializing sensor controls
- * @menu_skip_mask: Menu skip mask for link_freq_ctrl
+ * @link_freq_bitmap: Menu bitmap for link_freq_ctrl
  * @cur_code: current selected format code
  */
 struct imx334 {
@@ -158,7 +158,7 @@ struct imx334 {
 	u32 vblank;
 	const struct imx334_mode *cur_mode;
 	struct mutex mutex;
-	unsigned long menu_skip_mask;
+	unsigned long link_freq_bitmap;
 	u32 cur_code;
 };
 
@@ -954,9 +954,9 @@ static int imx334_init_state(struct v4l2_subdev *sd,
 	imx334_fill_pad_format(imx334, imx334->cur_mode, &fmt);
 
 	__v4l2_ctrl_modify_range(imx334->link_freq_ctrl, 0,
-				 __fls(imx334->menu_skip_mask),
-				 ~(imx334->menu_skip_mask),
-				 __ffs(imx334->menu_skip_mask));
+				 __fls(imx334->link_freq_bitmap),
+				 ~(imx334->link_freq_bitmap),
+				 __ffs(imx334->link_freq_bitmap));
 
 	mutex_unlock(&imx334->mutex);
 
@@ -1112,7 +1112,6 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
 	};
 	struct fwnode_handle *ep;
 	unsigned long rate;
-	unsigned int i, j;
 	int ret;
 
 	if (!fwnode)
@@ -1157,26 +1156,10 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
 		goto done_endpoint_free;
 	}
 
-	if (!bus_cfg.nr_of_link_frequencies) {
-		dev_err(imx334->dev, "no link frequencies defined");
-		ret = -EINVAL;
-		goto done_endpoint_free;
-	}
-
-	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++) {
-		for (j = 0; j < ARRAY_SIZE(link_freq); j++) {
-			if (bus_cfg.link_frequencies[i] == link_freq[j]) {
-				set_bit(j, &imx334->menu_skip_mask);
-				break;
-			}
-		}
-
-		if (j == ARRAY_SIZE(link_freq)) {
-			ret = dev_err_probe(imx334->dev, -EINVAL,
-					    "no supported link freq found\n");
-			goto done_endpoint_free;
-		}
-	}
+	ret = v4l2_link_freq_to_bitmap(imx334->dev, bus_cfg.link_frequencies,
+				       bus_cfg.nr_of_link_frequencies,
+				       link_freq, ARRAY_SIZE(link_freq),
+				       &imx334->link_freq_bitmap);
 
 done_endpoint_free:
 	v4l2_fwnode_endpoint_free(&bus_cfg);
@@ -1310,8 +1293,8 @@ static int imx334_init_controls(struct imx334 *imx334)
 	imx334->link_freq_ctrl = v4l2_ctrl_new_int_menu(ctrl_hdlr,
 							&imx334_ctrl_ops,
 							V4L2_CID_LINK_FREQ,
-							__fls(imx334->menu_skip_mask),
-							__ffs(imx334->menu_skip_mask),
+							__fls(imx334->link_freq_bitmap),
+							__ffs(imx334->link_freq_bitmap),
 							link_freq);
 
 	if (imx334->link_freq_ctrl)
@@ -1386,7 +1369,7 @@ static int imx334_probe(struct i2c_client *client)
 	}
 
 	/* Set default mode to max resolution */
-	imx334->cur_mode = &supported_modes[__ffs(imx334->menu_skip_mask)];
+	imx334->cur_mode = &supported_modes[__ffs(imx334->link_freq_bitmap)];
 	imx334->cur_code = imx334_mbus_codes[0];
 	imx334->vblank = imx334->cur_mode->vblank;
 
-- 
2.39.2


