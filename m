Return-Path: <linux-media+bounces-2104-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEC080CD01
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 15:07:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C6CB1C20FC3
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 14:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CFCB48797;
	Mon, 11 Dec 2023 14:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RcMq4jUW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D03F849FA
	for <linux-media@vger.kernel.org>; Mon, 11 Dec 2023 06:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702303627; x=1733839627;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PzzCUQGx5KVk7wA3kz91Yb4mODMfcTmkNSLtR0EGl40=;
  b=RcMq4jUWtFihxgR55vVIUHceIs0BWSU5ViYCKDGBKoT4BHy8aQ2+vr+J
   rXtmAz54/GiPAqkrYbiM80RRQO0c9BfRaoB/XjpmbwShqzVBj1sHqaJHz
   uxuBdIgUizLrZpPafbbZEcbqVOuqO7eAK4GtbRHIyyyF2x+DuMxrcTVvH
   K0bgVizJ4kKJpWZBcjQ/jMbUbAexCto/AQj3Qm9GCUGbqA6BGUMGJD7oI
   sRXNhj9HtV+Qpkk7d7HJhEnETiENyeuOBV+bvLwShStitYk7u5pLbNLD7
   QrK3eRnMp8N7vQyTmQT2tdoySAjB6E/pYK0qBnjtzrx8lvOKOCUEGVP3v
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="393523854"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="393523854"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 06:07:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="863795252"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="863795252"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 06:07:04 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0334911FC43;
	Mon, 11 Dec 2023 16:07:01 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 3/4] media: imx319: Use v4l2_link_frequencies_to_bitmap helper
Date: Mon, 11 Dec 2023 16:06:57 +0200
Message-Id: <20231211140658.366268-4-sakari.ailus@linux.intel.com>
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
 drivers/media/i2c/imx319.c | 53 ++++++++++----------------------------
 1 file changed, 14 insertions(+), 39 deletions(-)

diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c
index e47eff672e0c..3fdda6f7d01a 100644
--- a/drivers/media/i2c/imx319.c
+++ b/drivers/media/i2c/imx319.c
@@ -70,7 +70,7 @@
 #define IMX319_REG_ORIENTATION		0x0101
 
 /* default link frequency and external clock */
-#define IMX319_LINK_FREQ_DEFAULT	482400000
+#define IMX319_LINK_FREQ_DEFAULT	482400000LL
 #define IMX319_EXT_CLK			19200000
 #define IMX319_LINK_FREQ_INDEX		0
 
@@ -107,8 +107,7 @@ struct imx319_mode {
 
 struct imx319_hwcfg {
 	u32 ext_clk;			/* sensor external clk */
-	s64 *link_freqs;		/* CSI-2 link frequencies */
-	unsigned int nr_of_link_freqs;
+	unsigned long link_freq_bitmap;
 };
 
 struct imx319 {
@@ -129,7 +128,6 @@ struct imx319 {
 	const struct imx319_mode *cur_mode;
 
 	struct imx319_hwcfg *hwcfg;
-	s64 link_def_freq;	/* CSI-2 link default frequency */
 
 	/*
 	 * Mutex for serialized access:
@@ -1654,7 +1652,10 @@ static const char * const imx319_test_pattern_menu[] = {
 	"Pseudorandom Sequence (PN9)",
 };
 
-/* supported link frequencies */
+/*
+ * When adding more than the one below, make sure the disallowed ones will
+ * actually be disabled in the LINK_FREQ control.
+ */
 static const s64 link_freq_menu_items[] = {
 	IMX319_LINK_FREQ_DEFAULT,
 };
@@ -2058,7 +2059,7 @@ imx319_set_pad_format(struct v4l2_subdev *sd,
 		*framefmt = fmt->format;
 	} else {
 		imx319->cur_mode = mode;
-		pixel_rate = imx319->link_def_freq * 2 * 4;
+		pixel_rate = IMX319_LINK_FREQ_DEFAULT * 2 * 4;
 		do_div(pixel_rate, 10);
 		__v4l2_ctrl_s_ctrl_int64(imx319->pixel_rate, pixel_rate);
 		/* Update limits and set FPS to default */
@@ -2255,7 +2256,7 @@ static int imx319_init_controls(struct imx319 *imx319)
 		imx319->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	/* pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
-	pixel_rate = imx319->link_def_freq * 2 * 4;
+	pixel_rate = IMX319_LINK_FREQ_DEFAULT * 2 * 4;
 	do_div(pixel_rate, 10);
 	/* By default, PIXEL_RATE is read only */
 	imx319->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx319_ctrl_ops,
@@ -2332,7 +2333,6 @@ static struct imx319_hwcfg *imx319_get_hwcfg(struct device *dev)
 	};
 	struct fwnode_handle *ep;
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
-	unsigned int i;
 	int ret;
 
 	if (!fwnode)
@@ -2364,24 +2364,14 @@ static struct imx319_hwcfg *imx319_get_hwcfg(struct device *dev)
 		goto out_err;
 	}
 
-	dev_dbg(dev, "num of link freqs: %d", bus_cfg.nr_of_link_frequencies);
-	if (!bus_cfg.nr_of_link_frequencies) {
-		dev_warn(dev, "no link frequencies defined");
-		goto out_err;
-	}
-
-	cfg->nr_of_link_freqs = bus_cfg.nr_of_link_frequencies;
-	cfg->link_freqs = devm_kcalloc(dev,
-				       bus_cfg.nr_of_link_frequencies + 1,
-				       sizeof(*cfg->link_freqs), GFP_KERNEL);
-	if (!cfg->link_freqs)
+	ret = v4l2_link_frequencies_to_bitmap(dev, bus_cfg.link_frequencies,
+					      bus_cfg.nr_of_link_frequencies,
+					      link_freq_menu_items,
+					      ARRAY_SIZE(link_freq_menu_items),
+					      &cfg->link_freq_bitmap);
+	if (ret)
 		goto out_err;
 
-	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++) {
-		cfg->link_freqs[i] = bus_cfg.link_frequencies[i];
-		dev_dbg(dev, "link_freq[%d] = %lld", i, cfg->link_freqs[i]);
-	}
-
 	v4l2_fwnode_endpoint_free(&bus_cfg);
 	fwnode_handle_put(ep);
 	return cfg;
@@ -2397,7 +2387,6 @@ static int imx319_probe(struct i2c_client *client)
 	struct imx319 *imx319;
 	bool full_power;
 	int ret;
-	u32 i;
 
 	imx319 = devm_kzalloc(&client->dev, sizeof(*imx319), GFP_KERNEL);
 	if (!imx319)
@@ -2425,20 +2414,6 @@ static int imx319_probe(struct i2c_client *client)
 		goto error_probe;
 	}
 
-	imx319->link_def_freq = link_freq_menu_items[IMX319_LINK_FREQ_INDEX];
-	for (i = 0; i < imx319->hwcfg->nr_of_link_freqs; i++) {
-		if (imx319->hwcfg->link_freqs[i] == imx319->link_def_freq) {
-			dev_dbg(&client->dev, "link freq index %d matched", i);
-			break;
-		}
-	}
-
-	if (i == imx319->hwcfg->nr_of_link_freqs) {
-		dev_err(&client->dev, "no link frequency supported");
-		ret = -EINVAL;
-		goto error_probe;
-	}
-
 	/* Set default mode to max resolution */
 	imx319->cur_mode = &supported_modes[0];
 
-- 
2.39.2


