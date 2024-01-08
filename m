Return-Path: <linux-media+bounces-3338-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D17AC8272E0
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 16:21:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 474591F23959
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 15:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D7B84C63C;
	Mon,  8 Jan 2024 15:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j6KSb8Ow"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA334C3D2
	for <linux-media@vger.kernel.org>; Mon,  8 Jan 2024 15:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704727265; x=1736263265;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B8/OVJtmDEcgXIiLH9jGocmqv2Nxyy8Q1vmUNOX5+yw=;
  b=j6KSb8OwW3YIqXA7jmdGC2dQnYJRkUN5Ftv+H/GypCBmSfy1zTCqWp2z
   rgcHEsweheDCxq464uoWS6C3RxsWY/bHDxIS/1xGpSdjfHRp6CWYDELqv
   HRU1V+l69sBuWxkQ2W/82hneDGFWNsMosRQ/APAco9YCvmX7kiXxyToQw
   Psrj8rT1wm6BJmlC5ddISrDG4h5erWcvWKxABjd/NYwelwMm5U4PxGNvb
   CzOn+ru9ZAmLKEq5Z9/1CH9PesUnK6RCwBdtJF46xefVtlu0hd0r2zuG+
   OQQgPq4u94Q0fL8WFGDnuH4nSbDgleyGliHofckuVRgqp2y5ilhQ+hjOo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="462196579"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; 
   d="scan'208";a="462196579"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 07:18:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="815629112"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; 
   d="scan'208";a="815629112"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 07:18:12 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1437A11FBD1;
	Mon,  8 Jan 2024 17:18:08 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v3 2/4] media: imx334: Use v4l2_link_freq_to_bitmap helper
Date: Mon,  8 Jan 2024 17:18:03 +0200
Message-Id: <20240108151805.55584-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240108151805.55584-1-sakari.ailus@linux.intel.com>
References: <20240108151805.55584-1-sakari.ailus@linux.intel.com>
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


