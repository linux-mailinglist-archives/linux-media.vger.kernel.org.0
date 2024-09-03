Return-Path: <linux-media+bounces-17462-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D3F969A76
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 12:43:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CFF41C236A4
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 10:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8AA1B9849;
	Tue,  3 Sep 2024 10:42:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC161A3AA3
	for <linux-media@vger.kernel.org>; Tue,  3 Sep 2024 10:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725360161; cv=none; b=BiODHyNpwSBo4VQcO4mQmssx2IGX6pnzqO5T1yE3xcOE9z6ZEfWG3Y+K8nAQ+RG/R+NGfUQO5jsd8RIRm8ZxbpU9300T4UVbLJzO0z2j8W1kaK0CzCby2lRfvLTYtMNK14utzVfrNZRoxT60uAooDOZH3jIu3NHiytA8j3/h5k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725360161; c=relaxed/simple;
	bh=ca9rfR75q3lBIkXVNGybWbPKxF/vXRj0MkBn2pTFsMU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=cNTv+1EdVZYOmF2jAHHP8sIJv9ZcJHm1Tey+hxgQAk9JkS709Y80YlHaVBVEDoawHozQx1lJpsomZJUDn7aujR47ozhe43P/RJpUeDesx7LKQq8jyEUI+kEF4DNyFQEiujSzLeEbAhMbFls0ZRfBlIzFycaaPqreXJhswYriCE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF40BC4CEC4;
	Tue,  3 Sep 2024 10:42:39 +0000 (UTC)
Message-ID: <d11c0993-d0cd-46a6-a60f-d3dcccd8523d@xs4all.nl>
Date: Tue, 3 Sep 2024 12:42:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Edward Adam Davis <eadavis@qq.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: v4l2-core: v4l2-dv-timings: check cvt/gtf result
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The v4l2_detect_cvt/gtf functions should check the result against the
timing capabilities: these functions calculate the timings, so if they
are out of bounds, they should be rejected.

Add the struct v4l2_dv_timings_cap as argument to those functions.

This required updates to the adv7604 and adv7842 drivers.

The vivid driver was also updated, but an additional check was added:
the width and height specified by VIDIOC_S_DV_TIMINGS has to match the
calculated result, otherwise something went wrong. Note that vivid
emulates hardware, so all the values passed to the v4l2_detect_cvt/gtf
functions came from the timings struct itself.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: 2576415846bc ("[media] v4l2: move dv-timings related code to v4l2-dv-timings.c")
Cc: <stable@vger.kernel.org>
Reported-by: syzbot+a828133770f62293563e@syzkaller.appspotmail.com
---
 drivers/media/i2c/adv7604.c                   |   5 +-
 drivers/media/i2c/adv7842.c                   |  13 +-
 .../media/test-drivers/vivid/vivid-vid-cap.c  |  16 ++-
 drivers/media/v4l2-core/v4l2-dv-timings.c     | 132 ++++++++++--------
 include/media/v4l2-dv-timings.h               |  18 ++-
 5 files changed, 108 insertions(+), 76 deletions(-)

diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 48230d5109f0..a415fb1655ce 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -1405,12 +1405,13 @@ static int stdi2dv_timings(struct v4l2_subdev *sd,
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
index 014fc913225c..61ea7393066d 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -1431,14 +1431,15 @@ static int stdi2dv_timings(struct v4l2_subdev *sd,
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
index 69620e0a35a0..3a59020820da 100644
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
@@ -1485,6 +1496,7 @@ int vivid_vid_cap_s_dv_timings(struct file *file, void *_fh,

 	if (!vivid_is_hdmi_cap(dev))
 		return -ENODATA;
+
 	if (!v4l2_find_dv_timings_cap(timings, &vivid_dv_timings_cap,
 				      0, NULL, NULL) &&
 	    !valid_cvt_gtf_timings(timings))
diff --git a/drivers/media/v4l2-core/v4l2-dv-timings.c b/drivers/media/v4l2-core/v4l2-dv-timings.c
index 942d0005c55e..2cf5dcee0ce8 100644
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
index 8fa963326bf6..c64096b5c782 100644
--- a/include/media/v4l2-dv-timings.h
+++ b/include/media/v4l2-dv-timings.h
@@ -146,15 +146,18 @@ void v4l2_print_dv_timings(const char *dev_prefix, const char *prefix,
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
@@ -170,15 +173,18 @@ bool v4l2_detect_cvt(unsigned frame_height, unsigned hfreq, unsigned vsync,
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
-- 
2.43.0


