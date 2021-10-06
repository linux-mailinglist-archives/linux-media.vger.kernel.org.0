Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10D2D423780
	for <lists+linux-media@lfdr.de>; Wed,  6 Oct 2021 07:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231985AbhJFFcN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 6 Oct 2021 01:32:13 -0400
Received: from ni.piap.pl ([195.187.100.5]:43094 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229579AbhJFFcM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Oct 2021 01:32:12 -0400
From:   Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH v2 REPOST] TDA1997x: replace video detection routine
Date:   Wed, 06 Oct 2021 07:30:19 +0200
Message-ID: <m35yuaoh3o.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The TDA1997x (HDMI receiver) driver currently uses a specific video
format detection scheme. The frame (or field in interlaced mode), line
and HSync pulse durations are compared to those of known, standard video
modes. If a match is found, the mode is assumed to be detected,
otherwise -ERANGE is returned (then possibly ignored). This means that:
- another mode with similar timings will be detected incorrectly
  (e.g. 2x faster clock and lines twice as long)
- non-standard modes will not work.

This patch replaces this scheme with a direct read of geometry
registers. This way all modes recognized by the chip are supported.

In interlaced modes, the code assumes the V sync signal has the same
duration for both fields. While this may be not necessarily true,
I can't see any way to get the "other" V sync width. This is most
probably harmless.

All tests have been performed on Gateworks' Ventana GW54xx board, with
a TDA19971 chip.

Signed-off-by: Krzysztof Hałasa <khalasa@piap.pl>
Tested-By: Tim Harvey <tharvey@gateworks.com>

---
This version extracts H and V sync polarities of the incoming signal and
matches the parameters against the standard video modes.

1/1000 pixel clock tolerance had to be increased to 1/500 because the
1/1.001 (NTSC-like) pixclk and frame rate reduction already caused
1/1000 deviation, and there was no room for further difference.

diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index e155d45ce658..d62873cb9d45 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -1092,67 +1092,82 @@ tda1997x_detect_std(struct tda1997x_state *state,
 		    struct v4l2_dv_timings *timings)
 {
 	struct v4l2_subdev *sd = &state->sd;
-	u32 vper;
-	u16 hper;
-	u16 hsper;
-	int i;
 
 	/*
 	 * Read the FMT registers
-	 *   REG_V_PER: Period of a frame (or two fields) in MCLK(27MHz) cycles
-	 *   REG_H_PER: Period of a line in MCLK(27MHz) cycles
-	 *   REG_HS_WIDTH: Period of horiz sync pulse in MCLK(27MHz) cycles
+	 *   REG_V_PER: Period of a frame (or field) in MCLK (27MHz) cycles
+	 *   REG_H_PER: Period of a line in MCLK (27MHz) cycles
+	 *   REG_HS_WIDTH: Period of horiz sync pulse in MCLK (27MHz) cycles
 	 */
-	vper = io_read24(sd, REG_V_PER) & MASK_VPER;
-	hper = io_read16(sd, REG_H_PER) & MASK_HPER;
-	hsper = io_read16(sd, REG_HS_WIDTH) & MASK_HSWIDTH;
-	v4l2_dbg(1, debug, sd, "Signal Timings: %u/%u/%u\n", vper, hper, hsper);
+	u32 vper, vsync_pos;
+	u16 hper, hsync_pos, hsper, interlaced;
+	u16 htot, hact, hfront, hsync, hback;
+	u16 vtot, vact, vfront1, vfront2, vsync, vback1, vback2;
 
 	if (!state->input_detect[0] && !state->input_detect[1])
 		return -ENOLINK;
 
-	for (i = 0; v4l2_dv_timings_presets[i].bt.width; i++) {
-		const struct v4l2_bt_timings *bt;
-		u32 lines, width, _hper, _hsper;
-		u32 vmin, vmax, hmin, hmax, hsmin, hsmax;
-		bool vmatch, hmatch, hsmatch;
-
-		bt = &v4l2_dv_timings_presets[i].bt;
-		width = V4L2_DV_BT_FRAME_WIDTH(bt);
-		lines = V4L2_DV_BT_FRAME_HEIGHT(bt);
-		_hper = (u32)bt->pixelclock / width;
-		if (bt->interlaced)
-			lines /= 2;
-		/* vper +/- 0.7% */
-		vmin = ((27000000 / 1000) * 993) / _hper * lines;
-		vmax = ((27000000 / 1000) * 1007) / _hper * lines;
-		/* hper +/- 1.0% */
-		hmin = ((27000000 / 100) * 99) / _hper;
-		hmax = ((27000000 / 100) * 101) / _hper;
-		/* hsper +/- 2 (take care to avoid 32bit overflow) */
-		_hsper = 27000 * bt->hsync / ((u32)bt->pixelclock/1000);
-		hsmin = _hsper - 2;
-		hsmax = _hsper + 2;
-
-		/* vmatch matches the framerate */
-		vmatch = ((vper <= vmax) && (vper >= vmin)) ? 1 : 0;
-		/* hmatch matches the width */
-		hmatch = ((hper <= hmax) && (hper >= hmin)) ? 1 : 0;
-		/* hsmatch matches the hswidth */
-		hsmatch = ((hsper <= hsmax) && (hsper >= hsmin)) ? 1 : 0;
-		if (hmatch && vmatch && hsmatch) {
-			v4l2_print_dv_timings(sd->name, "Detected format: ",
-					      &v4l2_dv_timings_presets[i],
-					      false);
-			if (timings)
-				*timings = v4l2_dv_timings_presets[i];
-			return 0;
-		}
-	}
+	vper = io_read24(sd, REG_V_PER);
+	hper = io_read16(sd, REG_H_PER);
+	hsper = io_read16(sd, REG_HS_WIDTH);
+	vsync_pos = vper & MASK_VPER_SYNC_POS;
+	hsync_pos = hper & MASK_HPER_SYNC_POS;
+	interlaced = hsper & MASK_HSWIDTH_INTERLACED;
+	vper &= MASK_VPER;
+	hper &= MASK_HPER;
+	hsper &= MASK_HSWIDTH;
+	v4l2_dbg(1, debug, sd, "Signal Timings: %u/%u/%u\n", vper, hper, hsper);
 
-	v4l_err(state->client, "no resolution match for timings: %d/%d/%d\n",
-		vper, hper, hsper);
-	return -ERANGE;
+	htot = io_read16(sd, REG_FMT_H_TOT);
+	hact = io_read16(sd, REG_FMT_H_ACT);
+	hfront = io_read16(sd, REG_FMT_H_FRONT);
+	hsync = io_read16(sd, REG_FMT_H_SYNC);
+	hback = io_read16(sd, REG_FMT_H_BACK);
+
+	vtot = io_read16(sd, REG_FMT_V_TOT);
+	vact = io_read16(sd, REG_FMT_V_ACT);
+	vfront1 = io_read(sd, REG_FMT_V_FRONT_F1);
+	vfront2 = io_read(sd, REG_FMT_V_FRONT_F2);
+	vsync = io_read(sd, REG_FMT_V_SYNC);
+	vback1 = io_read(sd, REG_FMT_V_BACK_F1);
+	vback2 = io_read(sd, REG_FMT_V_BACK_F2);
+
+	v4l2_dbg(1, debug, sd, "Geometry: H %u %u %u %u %u Sync%c  V %u %u %u %u %u %u %u Sync%c\n",
+		 htot, hact, hfront, hsync, hback, hsync_pos ? '+' : '-',
+		 vtot, vact, vfront1, vfront2, vsync, vback1, vback2, vsync_pos ? '+' : '-');
+
+	if (!timings)
+		return 0;
+
+	timings->type = V4L2_DV_BT_656_1120;
+	timings->bt.width = hact;
+	timings->bt.hfrontporch = hfront;
+	timings->bt.hsync = hsync;
+	timings->bt.hbackporch = hback;
+	timings->bt.height = vact;
+	timings->bt.vfrontporch = vfront1;
+	timings->bt.vsync = vsync;
+	timings->bt.vbackporch = vback1;
+	timings->bt.interlaced = interlaced ? V4L2_DV_INTERLACED : V4L2_DV_PROGRESSIVE;
+	timings->bt.polarities = vsync_pos ? V4L2_DV_VSYNC_POS_POL : 0;
+	timings->bt.polarities |= hsync_pos ? V4L2_DV_HSYNC_POS_POL : 0;
+
+	timings->bt.pixelclock = (u64)htot * vtot * 27000000;
+	if (interlaced) {
+		timings->bt.il_vfrontporch = vfront2;
+		timings->bt.il_vsync = timings->bt.vsync;
+		timings->bt.il_vbackporch = vback2;
+		do_div(timings->bt.pixelclock, vper * 2 /* full frame */);
+	} else {
+		timings->bt.il_vfrontporch = 0;
+		timings->bt.il_vsync = 0;
+		timings->bt.il_vbackporch = 0;
+		do_div(timings->bt.pixelclock, vper);
+	}
+	v4l2_find_dv_timings_cap(timings, &tda1997x_dv_timings_cap,
+				 (u32)timings->bt.pixelclock / 500, NULL, NULL);
+	v4l2_print_dv_timings(sd->name, "Detected format: ", timings, false);
+	return 0;
 }
 
 /* some sort of errata workaround for chip revision 0 (N1) */
diff --git a/drivers/media/i2c/tda1997x_regs.h b/drivers/media/i2c/tda1997x_regs.h
index d9b3daada07d..115371ba33f0 100644
--- a/drivers/media/i2c/tda1997x_regs.h
+++ b/drivers/media/i2c/tda1997x_regs.h
@@ -117,9 +117,12 @@
 #define REG_CURPAGE_00H		0xFF
 
 #define MASK_VPER		0x3fffff
+#define MASK_VPER_SYNC_POS	0x800000
 #define MASK_VHREF		0x3fff
 #define MASK_HPER		0x0fff
+#define MASK_HPER_SYNC_POS	0x8000
 #define MASK_HSWIDTH		0x03ff
+#define MASK_HSWIDTH_INTERLACED	0x8000
 
 /* HPD Detection */
 #define DETECT_UTIL		BIT(7)	/* utility of HDMI level */

-- 
Krzysztof "Chris" Hałasa

Sieć Badawcza Łukasiewicz
Przemysłowy Instytut Automatyki i Pomiarów PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
