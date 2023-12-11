Return-Path: <linux-media+bounces-2106-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4554380CD04
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 15:07:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2D601F2134A
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 14:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8ABD4878A;
	Mon, 11 Dec 2023 14:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QckOqAZY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3502F30E0
	for <linux-media@vger.kernel.org>; Mon, 11 Dec 2023 06:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702303633; x=1733839633;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Tbs2aUUKbCvYGJUY/jUQO9ZqhEn09NnTn5bfEh3WSfw=;
  b=QckOqAZYttASPAgugmlbX5OPnjFNaVn62bMiTTYqtJmP2T8GexWJaZRW
   UJ7e0uaIBEjlIYQBr4VMAJewoiJYwwtviDekwOYsFPmWHPU51nwtoID73
   4Dyfx6VY2cp0j5kVSJdUBga9bEEu/uEZgs7m1lU+25zuQVkLPH6bIVGWG
   dpqBLPzZWxu7HkGJqGCDAzK8H6tFqUd+j10BucApoLBeJGTzECIieaPtr
   hhnTOSPmShIMJm9dILqgBxov9dXA5QKwsTuBnD77s/xfCBo7MM7zS+XXG
   0GgNcc1DWZXHN0OzSkINUe0gwO4uwjKaqjJyMQd+ld4WO+GwHZibQVF2j
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="393523849"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="393523849"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 06:07:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="863795250"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="863795250"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 06:07:04 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 01DBF11FC35;
	Mon, 11 Dec 2023 16:07:00 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/4] media: imx334: Use v4l2_link_frequencies_to_bitmap helper
Date: Mon, 11 Dec 2023 16:06:56 +0200
Message-Id: <20231211140658.366268-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231211140658.366268-1-sakari.ailus@linux.intel.com>
References: <20231211140658.366268-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the v4l2_link_frequencies_to_bitmap() helper to figure out which
driver-supported link frequencies can be used on a given system.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx334.c | 41 ++++++++++++--------------------------
 1 file changed, 13 insertions(+), 28 deletions(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 6725b3e2a73e..76b88bbcb40a 100644
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
 
@@ -1157,26 +1157,11 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
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
+	ret = v4l2_link_frequencies_to_bitmap(imx334->dev,
+					      bus_cfg.link_frequencies,
+					      bus_cfg.nr_of_link_frequencies,
+					      link_freq, ARRAY_SIZE(link_freq),
+					      &imx334->link_freq_bitmap);
 
 done_endpoint_free:
 	v4l2_fwnode_endpoint_free(&bus_cfg);
@@ -1310,8 +1295,8 @@ static int imx334_init_controls(struct imx334 *imx334)
 	imx334->link_freq_ctrl = v4l2_ctrl_new_int_menu(ctrl_hdlr,
 							&imx334_ctrl_ops,
 							V4L2_CID_LINK_FREQ,
-							__fls(imx334->menu_skip_mask),
-							__ffs(imx334->menu_skip_mask),
+							__fls(imx334->link_freq_bitmap),
+							__ffs(imx334->link_freq_bitmap),
 							link_freq);
 
 	if (imx334->link_freq_ctrl)
@@ -1386,7 +1371,7 @@ static int imx334_probe(struct i2c_client *client)
 	}
 
 	/* Set default mode to max resolution */
-	imx334->cur_mode = &supported_modes[__ffs(imx334->menu_skip_mask)];
+	imx334->cur_mode = &supported_modes[__ffs(imx334->link_freq_bitmap)];
 	imx334->cur_code = imx334_mbus_codes[0];
 	imx334->vblank = imx334->cur_mode->vblank;
 
-- 
2.39.2


