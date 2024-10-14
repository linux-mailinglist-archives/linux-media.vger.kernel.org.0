Return-Path: <linux-media+bounces-19610-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AC90599CF93
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 16:56:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D320B24320
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 14:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 323491C2DA1;
	Mon, 14 Oct 2024 14:53:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A581BD01F;
	Mon, 14 Oct 2024 14:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728917593; cv=none; b=DTT8yAB3l1k4yYNPJlWntGfcuImf+TNudt2yFewz1AUjk3OpJdA1OX35UFck9vH0g0U/jO5OKbd0FnTkUXR+TVRoAwgmrleE74858TM2PDpQKOnipxkODN8rDEqWbsH/oAqL5W4afZyGYzeuApTQCRI1RvXecw31JUNCcWuKbYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728917593; c=relaxed/simple;
	bh=4WN5+kUXjbscC490H4bkuCDvJ0XVi5fXOk7laSU9qks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sSxlnulMKPiGOJHBTZhBY9cY01eZs9Cy/64RCHRPgHQA9W0E6kW+Z2gne+XbxQyjBQf4MGBDs7VAgjbVWPX5rRY+bEPkNjpkJRVkr5J7g/x61w0KETgV+zCLtzbGbNirgFhHk96QsGyV8XVsk75aPzVrz3h875DZSEOCAPLTJLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5A3BC4CEC7;
	Mon, 14 Oct 2024 14:53:12 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
Date: Mon, 14 Oct 2024 16:52:41 +0200
Subject: [PATCH v2] media: v4l2-core: v4l2-dv-timings: check cvt/gtf result
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241014-timings-v2-1-8af779113b03@xs4all.nl>
X-B4-Tracking: v=1; b=H4sIADgwDWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIxNDA0MT3ZLM3My89GJdi1QjI8NEY2MTc9NkJaDqgqLUtMwKsEnRsbW1AII
 Erx5ZAAAA
X-Change-ID: 20241014-timings-8e221a33475c
To: linux-media@vger.kernel.org
Cc: stable@vger.kernel.org, 
 syzbot+a828133770f62293563e@syzkaller.appspotmail.com
X-Mailer: b4 0.14.2

The v4l2_detect_cvt/gtf functions should check the result against the
timing capabilities: these functions calculate the timings, so if they
are out of bounds, they should be rejected.

To do this, add the struct v4l2_dv_timings_cap as argument to those
functions.

This required updates to the adv7604 and adv7842 drivers since the
prototype of these functions has now changed. The timings struct
that is passed to v4l2_detect_cvt/gtf in those two drivers is filled
with the timings detected by the hardware.

The vivid driver was also updated, but an additional check was added:
the width and height specified by VIDIOC_S_DV_TIMINGS has to match the
calculated result, otherwise something went wrong. Note that vivid
*emulates* hardware, so all the values passed to the v4l2_detect_cvt/gtf
functions came from the timings struct that was filled by userspace
and passed on to the driver via VIDIOC_S_DV_TIMINGS. So these fields
can contain random data. Both the constraints check via
struct v4l2_dv_timings_cap and the additional width/height check
ensure that the resulting timings are sane and not messed up by the
v4l2_detect_cvt/gtf calculations.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Fixes: 2576415846bc ("[media] v4l2: move dv-timings related code to v4l2-dv-timings.c")
Cc: stable@vger.kernel.org
Reported-by: syzbot+a828133770f62293563e@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-media/000000000000013050062127830a@google.com/
---
Changes since v1:
- Improve the commit message
- Drop a spurious newline change
---
 drivers/media/i2c/adv7604.c                      |   5 +-
 drivers/media/i2c/adv7842.c                      |  13 +--
 drivers/media/test-drivers/vivid/vivid-vid-cap.c |  15 ++-
 drivers/media/v4l2-core/v4l2-dv-timings.c        | 132 ++++++++++++-----------
 include/media/v4l2-dv-timings.h                  |  18 ++--
 5 files changed, 107 insertions(+), 76 deletions(-)

diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 3184a2fa15322caa2a8eb415bea14312690b839c..4504909d95bce5f242e66b00be50ecb3ef2b896c 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -1408,12 +1408,13 @@ static int stdi2dv_timings(struct v4l2_subdev *sd,
 	if (v4l2_detect_cvt(stdi->lcf + 1, hfreq, stdi->lcvs, 0,
 			(stdi->hs_pol == '+' ? V4L2_DV_HSYNC_POS_POL : 0) |
 			(stdi->vs_pol == '+' ? V4L2_DV_VSYNC_POS_POL : 0),
-			false, timings))
+			false, adv76xx_get_dv_timings_cap(sd, -1), timings))
 		return 0;
 	if (v4l2_detect_gtf(stdi->lcf + 1, hfreq, stdi->lcvs,
 			(stdi->hs_pol == '+' ? V4L2_DV_HSYNC_POS_POL : 0) |
 			(stdi->vs_pol == '+' ? V4L2_DV_VSYNC_POS_POL : 0),
-			false, state->aspect_ratio, timings))
+			false, state->aspect_ratio,
+			adv76xx_get_dv_timings_cap(sd, -1), timings))
 		return 0;
 
 	v4l2_dbg(2, debug, sd,
diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index e445699da85b70b711edda79ba4bbcea0161914f..3c9e613af0ceba4062c854581ee981e1fc2d0b6a 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -1434,14 +1434,15 @@ static int stdi2dv_timings(struct v4l2_subdev *sd,
 	}
 
 	if (v4l2_detect_cvt(stdi->lcf + 1, hfreq, stdi->lcvs, 0,
-			(stdi->hs_pol == '+' ? V4L2_DV_HSYNC_POS_POL : 0) |
-			(stdi->vs_pol == '+' ? V4L2_DV_VSYNC_POS_POL : 0),
-			false, timings))
+			    (stdi->hs_pol == '+' ? V4L2_DV_HSYNC_POS_POL : 0) |
+			    (stdi->vs_pol == '+' ? V4L2_DV_VSYNC_POS_POL : 0),
+			    false, adv7842_get_dv_timings_cap(sd), timings))
 		return 0;
 	if (v4l2_detect_gtf(stdi->lcf + 1, hfreq, stdi->lcvs,
-			(stdi->hs_pol == '+' ? V4L2_DV_HSYNC_POS_POL : 0) |
-			(stdi->vs_pol == '+' ? V4L2_DV_VSYNC_POS_POL : 0),
-			false, state->aspect_ratio, timings))
+			    (stdi->hs_pol == '+' ? V4L2_DV_HSYNC_POS_POL : 0) |
+			    (stdi->vs_pol == '+' ? V4L2_DV_VSYNC_POS_POL : 0),
+			    false, state->aspect_ratio,
+			    adv7842_get_dv_timings_cap(sd), timings))
 		return 0;
 
 	v4l2_dbg(2, debug, sd,
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
index 69620e0a35a02fb210529a1d652abf915b4445af..68318af9f0d0a97335307cef22476b8651a98891 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
@@ -1459,12 +1459,19 @@ static bool valid_cvt_gtf_timings(struct v4l2_dv_timings *timings)
 	h_freq = (u32)bt->pixelclock / total_h_pixel;
 
 	if (bt->standards == 0 || (bt->standards & V4L2_DV_BT_STD_CVT)) {
+		struct v4l2_dv_timings cvt = {};
+
 		if (v4l2_detect_cvt(total_v_lines, h_freq, bt->vsync, bt->width,
-				    bt->polarities, bt->interlaced, timings))
+				    bt->polarities, bt->interlaced,
+				    &vivid_dv_timings_cap, &cvt) &&
+		    cvt.bt.width == bt->width && cvt.bt.height == bt->height) {
+			*timings = cvt;
 			return true;
+		}
 	}
 
 	if (bt->standards == 0 || (bt->standards & V4L2_DV_BT_STD_GTF)) {
+		struct v4l2_dv_timings gtf = {};
 		struct v4l2_fract aspect_ratio;
 
 		find_aspect_ratio(bt->width, bt->height,
@@ -1472,8 +1479,12 @@ static bool valid_cvt_gtf_timings(struct v4l2_dv_timings *timings)
 				  &aspect_ratio.denominator);
 		if (v4l2_detect_gtf(total_v_lines, h_freq, bt->vsync,
 				    bt->polarities, bt->interlaced,
-				    aspect_ratio, timings))
+				    aspect_ratio, &vivid_dv_timings_cap,
+				    &gtf) &&
+		    gtf.bt.width == bt->width && gtf.bt.height == bt->height) {
+			*timings = gtf;
 			return true;
+		}
 	}
 	return false;
 }
diff --git a/drivers/media/v4l2-core/v4l2-dv-timings.c b/drivers/media/v4l2-core/v4l2-dv-timings.c
index 39b5fc1807c409a4cc7421edc6b7ed2b5c1452e1..d26edf157e640001569a5779ee24abffa8be09b7 100644
--- a/drivers/media/v4l2-core/v4l2-dv-timings.c
+++ b/drivers/media/v4l2-core/v4l2-dv-timings.c
@@ -481,25 +481,28 @@ EXPORT_SYMBOL_GPL(v4l2_calc_timeperframe);
  * @polarities - the horizontal and vertical polarities (same as struct
  *		v4l2_bt_timings polarities).
  * @interlaced - if this flag is true, it indicates interlaced format
- * @fmt - the resulting timings.
+ * @cap - the v4l2_dv_timings_cap capabilities.
+ * @timings - the resulting timings.
  *
  * This function will attempt to detect if the given values correspond to a
  * valid CVT format. If so, then it will return true, and fmt will be filled
  * in with the found CVT timings.
  */
-bool v4l2_detect_cvt(unsigned frame_height,
-		     unsigned hfreq,
-		     unsigned vsync,
-		     unsigned active_width,
+bool v4l2_detect_cvt(unsigned int frame_height,
+		     unsigned int hfreq,
+		     unsigned int vsync,
+		     unsigned int active_width,
 		     u32 polarities,
 		     bool interlaced,
-		     struct v4l2_dv_timings *fmt)
+		     const struct v4l2_dv_timings_cap *cap,
+		     struct v4l2_dv_timings *timings)
 {
-	int  v_fp, v_bp, h_fp, h_bp, hsync;
-	int  frame_width, image_height, image_width;
+	struct v4l2_dv_timings t = {};
+	int v_fp, v_bp, h_fp, h_bp, hsync;
+	int frame_width, image_height, image_width;
 	bool reduced_blanking;
 	bool rb_v2 = false;
-	unsigned pix_clk;
+	unsigned int pix_clk;
 
 	if (vsync < 4 || vsync > 8)
 		return false;
@@ -625,36 +628,39 @@ bool v4l2_detect_cvt(unsigned frame_height,
 		h_fp = h_blank - hsync - h_bp;
 	}
 
-	fmt->type = V4L2_DV_BT_656_1120;
-	fmt->bt.polarities = polarities;
-	fmt->bt.width = image_width;
-	fmt->bt.height = image_height;
-	fmt->bt.hfrontporch = h_fp;
-	fmt->bt.vfrontporch = v_fp;
-	fmt->bt.hsync = hsync;
-	fmt->bt.vsync = vsync;
-	fmt->bt.hbackporch = frame_width - image_width - h_fp - hsync;
+	t.type = V4L2_DV_BT_656_1120;
+	t.bt.polarities = polarities;
+	t.bt.width = image_width;
+	t.bt.height = image_height;
+	t.bt.hfrontporch = h_fp;
+	t.bt.vfrontporch = v_fp;
+	t.bt.hsync = hsync;
+	t.bt.vsync = vsync;
+	t.bt.hbackporch = frame_width - image_width - h_fp - hsync;
 
 	if (!interlaced) {
-		fmt->bt.vbackporch = frame_height - image_height - v_fp - vsync;
-		fmt->bt.interlaced = V4L2_DV_PROGRESSIVE;
+		t.bt.vbackporch = frame_height - image_height - v_fp - vsync;
+		t.bt.interlaced = V4L2_DV_PROGRESSIVE;
 	} else {
-		fmt->bt.vbackporch = (frame_height - image_height - 2 * v_fp -
+		t.bt.vbackporch = (frame_height - image_height - 2 * v_fp -
 				      2 * vsync) / 2;
-		fmt->bt.il_vbackporch = frame_height - image_height - 2 * v_fp -
-					2 * vsync - fmt->bt.vbackporch;
-		fmt->bt.il_vfrontporch = v_fp;
-		fmt->bt.il_vsync = vsync;
-		fmt->bt.flags |= V4L2_DV_FL_HALF_LINE;
-		fmt->bt.interlaced = V4L2_DV_INTERLACED;
+		t.bt.il_vbackporch = frame_height - image_height - 2 * v_fp -
+					2 * vsync - t.bt.vbackporch;
+		t.bt.il_vfrontporch = v_fp;
+		t.bt.il_vsync = vsync;
+		t.bt.flags |= V4L2_DV_FL_HALF_LINE;
+		t.bt.interlaced = V4L2_DV_INTERLACED;
 	}
 
-	fmt->bt.pixelclock = pix_clk;
-	fmt->bt.standards = V4L2_DV_BT_STD_CVT;
+	t.bt.pixelclock = pix_clk;
+	t.bt.standards = V4L2_DV_BT_STD_CVT;
 
 	if (reduced_blanking)
-		fmt->bt.flags |= V4L2_DV_FL_REDUCED_BLANKING;
+		t.bt.flags |= V4L2_DV_FL_REDUCED_BLANKING;
 
+	if (!v4l2_valid_dv_timings(&t, cap, NULL, NULL))
+		return false;
+	*timings = t;
 	return true;
 }
 EXPORT_SYMBOL_GPL(v4l2_detect_cvt);
@@ -699,22 +705,25 @@ EXPORT_SYMBOL_GPL(v4l2_detect_cvt);
  *		image height, so it has to be passed explicitly. Usually
  *		the native screen aspect ratio is used for this. If it
  *		is not filled in correctly, then 16:9 will be assumed.
- * @fmt - the resulting timings.
+ * @cap - the v4l2_dv_timings_cap capabilities.
+ * @timings - the resulting timings.
  *
  * This function will attempt to detect if the given values correspond to a
  * valid GTF format. If so, then it will return true, and fmt will be filled
  * in with the found GTF timings.
  */
-bool v4l2_detect_gtf(unsigned frame_height,
-		unsigned hfreq,
-		unsigned vsync,
-		u32 polarities,
-		bool interlaced,
-		struct v4l2_fract aspect,
-		struct v4l2_dv_timings *fmt)
+bool v4l2_detect_gtf(unsigned int frame_height,
+		     unsigned int hfreq,
+		     unsigned int vsync,
+		     u32 polarities,
+		     bool interlaced,
+		     struct v4l2_fract aspect,
+		     const struct v4l2_dv_timings_cap *cap,
+		     struct v4l2_dv_timings *timings)
 {
+	struct v4l2_dv_timings t = {};
 	int pix_clk;
-	int  v_fp, v_bp, h_fp, hsync;
+	int v_fp, v_bp, h_fp, hsync;
 	int frame_width, image_height, image_width;
 	bool default_gtf;
 	int h_blank;
@@ -783,36 +792,39 @@ bool v4l2_detect_gtf(unsigned frame_height,
 
 	h_fp = h_blank / 2 - hsync;
 
-	fmt->type = V4L2_DV_BT_656_1120;
-	fmt->bt.polarities = polarities;
-	fmt->bt.width = image_width;
-	fmt->bt.height = image_height;
-	fmt->bt.hfrontporch = h_fp;
-	fmt->bt.vfrontporch = v_fp;
-	fmt->bt.hsync = hsync;
-	fmt->bt.vsync = vsync;
-	fmt->bt.hbackporch = frame_width - image_width - h_fp - hsync;
+	t.type = V4L2_DV_BT_656_1120;
+	t.bt.polarities = polarities;
+	t.bt.width = image_width;
+	t.bt.height = image_height;
+	t.bt.hfrontporch = h_fp;
+	t.bt.vfrontporch = v_fp;
+	t.bt.hsync = hsync;
+	t.bt.vsync = vsync;
+	t.bt.hbackporch = frame_width - image_width - h_fp - hsync;
 
 	if (!interlaced) {
-		fmt->bt.vbackporch = frame_height - image_height - v_fp - vsync;
-		fmt->bt.interlaced = V4L2_DV_PROGRESSIVE;
+		t.bt.vbackporch = frame_height - image_height - v_fp - vsync;
+		t.bt.interlaced = V4L2_DV_PROGRESSIVE;
 	} else {
-		fmt->bt.vbackporch = (frame_height - image_height - 2 * v_fp -
+		t.bt.vbackporch = (frame_height - image_height - 2 * v_fp -
 				      2 * vsync) / 2;
-		fmt->bt.il_vbackporch = frame_height - image_height - 2 * v_fp -
-					2 * vsync - fmt->bt.vbackporch;
-		fmt->bt.il_vfrontporch = v_fp;
-		fmt->bt.il_vsync = vsync;
-		fmt->bt.flags |= V4L2_DV_FL_HALF_LINE;
-		fmt->bt.interlaced = V4L2_DV_INTERLACED;
+		t.bt.il_vbackporch = frame_height - image_height - 2 * v_fp -
+					2 * vsync - t.bt.vbackporch;
+		t.bt.il_vfrontporch = v_fp;
+		t.bt.il_vsync = vsync;
+		t.bt.flags |= V4L2_DV_FL_HALF_LINE;
+		t.bt.interlaced = V4L2_DV_INTERLACED;
 	}
 
-	fmt->bt.pixelclock = pix_clk;
-	fmt->bt.standards = V4L2_DV_BT_STD_GTF;
+	t.bt.pixelclock = pix_clk;
+	t.bt.standards = V4L2_DV_BT_STD_GTF;
 
 	if (!default_gtf)
-		fmt->bt.flags |= V4L2_DV_FL_REDUCED_BLANKING;
+		t.bt.flags |= V4L2_DV_FL_REDUCED_BLANKING;
 
+	if (!v4l2_valid_dv_timings(&t, cap, NULL, NULL))
+		return false;
+	*timings = t;
 	return true;
 }
 EXPORT_SYMBOL_GPL(v4l2_detect_gtf);
diff --git a/include/media/v4l2-dv-timings.h b/include/media/v4l2-dv-timings.h
index 13830411bd6c486e863b01a2ae3ebf91235c5f67..ff07dc6b103c6bfff4bb600e466d70b3d8fad578 100644
--- a/include/media/v4l2-dv-timings.h
+++ b/include/media/v4l2-dv-timings.h
@@ -147,15 +147,18 @@ void v4l2_print_dv_timings(const char *dev_prefix, const char *prefix,
  * @polarities: the horizontal and vertical polarities (same as struct
  *		v4l2_bt_timings polarities).
  * @interlaced: if this flag is true, it indicates interlaced format
+ * @cap: the v4l2_dv_timings_cap capabilities.
  * @fmt: the resulting timings.
  *
  * This function will attempt to detect if the given values correspond to a
  * valid CVT format. If so, then it will return true, and fmt will be filled
  * in with the found CVT timings.
  */
-bool v4l2_detect_cvt(unsigned frame_height, unsigned hfreq, unsigned vsync,
-		unsigned active_width, u32 polarities, bool interlaced,
-		struct v4l2_dv_timings *fmt);
+bool v4l2_detect_cvt(unsigned int frame_height, unsigned int hfreq,
+		     unsigned int vsync, unsigned int active_width,
+		     u32 polarities, bool interlaced,
+		     const struct v4l2_dv_timings_cap *cap,
+		     struct v4l2_dv_timings *fmt);
 
 /**
  * v4l2_detect_gtf - detect if the given timings follow the GTF standard
@@ -171,15 +174,18 @@ bool v4l2_detect_cvt(unsigned frame_height, unsigned hfreq, unsigned vsync,
  *		image height, so it has to be passed explicitly. Usually
  *		the native screen aspect ratio is used for this. If it
  *		is not filled in correctly, then 16:9 will be assumed.
+ * @cap: the v4l2_dv_timings_cap capabilities.
  * @fmt: the resulting timings.
  *
  * This function will attempt to detect if the given values correspond to a
  * valid GTF format. If so, then it will return true, and fmt will be filled
  * in with the found GTF timings.
  */
-bool v4l2_detect_gtf(unsigned frame_height, unsigned hfreq, unsigned vsync,
-		u32 polarities, bool interlaced, struct v4l2_fract aspect,
-		struct v4l2_dv_timings *fmt);
+bool v4l2_detect_gtf(unsigned int frame_height, unsigned int hfreq,
+		     unsigned int vsync, u32 polarities, bool interlaced,
+		     struct v4l2_fract aspect,
+		     const struct v4l2_dv_timings_cap *cap,
+		     struct v4l2_dv_timings *fmt);
 
 /**
  * v4l2_calc_aspect_ratio - calculate the aspect ratio based on bytes

---
base-commit: bcd4f091cf1ea7184d813afc115af82ac9326b25
change-id: 20241014-timings-8e221a33475c

Best regards,
-- 
Hans Verkuil <hverkuil@xs4all.nl>


