Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 358EF3CD0D7
	for <lists+linux-media@lfdr.de>; Mon, 19 Jul 2021 11:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235752AbhGSIuB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 04:50:01 -0400
Received: from ni.piap.pl ([195.187.100.5]:57502 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235404AbhGSIuA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 04:50:00 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        by ni.piap.pl (Postfix) with ESMTPSA id 13121C3F2A56;
        Mon, 19 Jul 2021 11:30:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 13121C3F2A56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1626687036; bh=tYejPLr4cQaX0JJwAOgMRLk4zY9ZXBp4p9ccof3zDUI=;
        h=From:To:Cc:Subject:Date:From;
        b=LLbe+hkNHZHxTUN75mkf1KDYS4zHk9Nh57JY5Elg/rBUqyecQLW0CrsVNTNRimHZV
         dp0WQttZjPM0YgOGjlf4ABSRQoVW19EiMXqsAbRlqutY0/yselavYk4yRbH2zXDTZi
         kbi9x6XrcokuFVTksmmKdl9gyg7JpbWVN87J5K5k=
From:   Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH REPOST] TDA1997x: replace video detection routine
Date:   Mon, 19 Jul 2021 11:30:35 +0200
Message-ID: <m3k0lmejlw.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Rule-ID: 1
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Lua-Profiles: 165074 [Jul 19 2021]
X-KLMS-AntiSpam-Version: 5.9.20.0
X-KLMS-AntiSpam-Envelope-From: khalasa@piap.pl
X-KLMS-AntiSpam-Rate: 0
X-KLMS-AntiSpam-Status: not_detected
X-KLMS-AntiSpam-Method: none
X-KLMS-AntiSpam-Auth: dkim=pass header.d=piap.pl
X-KLMS-AntiSpam-Info: LuaCore: 448 448 71fb1b37213ce9a885768d4012c46ac449c77b17, {Tracking_from_exist}, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;piap.pl:7.1.1;t19.piap.pl:7.1.1
X-MS-Exchange-Organization-SCL: -1
X-KLMS-AntiSpam-Interceptor-Info: scan successful
X-KLMS-AntiPhishing: Clean, bases: 2021/07/19 08:27:00
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, bases: 2021/07/19 04:09:00 #16925305
X-KLMS-AntiVirus-Status: Clean, skipped
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

I propose to replace this scheme with a direct read of geometry
registers. This way all modes recognized by the chip will be supported.

How does this change look like from the user's perspective?

v4l2-ctl -d $(media-ctl -e "tda19971 2-0048") --query-dv-timings

Original code - known mode:           Patched:
Active width: 1152                    Active width: 1152
Active height: 864		      Active height: 864
Total width: 1600		      Total width: 1600
Total height: 900		      Total height: 900
Frame format: progressive	      Frame format: progressive
Polarities: +vsync +hsync	      Polarities: -vsync -hsync
Pixelclock: 108000000 Hz (75.00 FPS)  Pixelclock: 107998200 Hz (75.00 FPS)
Horizontal frontporch: 64	      Horizontal frontporch: 64
Horizontal sync: 128		      Horizontal sync: 128
Horizontal backporch: 256	      Horizontal backporch: 256
Vertical frontporch: 1		      Vertical frontporch: 1
Vertical sync: 3		      Vertical sync: 3
Vertical backporch: 32		      Vertical backporch: 32
Standards: DMT			      Standards:
Flags:				      Flags:

Original code - "unknown" mode:       Patched:
Active width: 0                       Active width: 1400
Active height: 0		      Active height: 1050
Total width: 0			      Total width: 1560
Total height: 0			      Total height: 1080
Frame format: progressive	      Frame format: progressive
Polarities: -vsync -hsync	      Polarities: -vsync -hsync
Pixelclock: 0 Hz		      Pixelclock: 79998593 Hz (47.48 FPS)
Horizontal frontporch: 0	      Horizontal frontporch: 48
Horizontal sync: 0		      Horizontal sync: 32
Horizontal backporch: 0		      Horizontal backporch: 80
Vertical frontporch: 0		      Vertical frontporch: 3
Vertical sync: 0		      Vertical sync: 4
Vertical backporch: 0		      Vertical backporch: 23
Standards:			      Standards:
Flags:				      Flags:

In the kernel logs - original code:
Signal Timings: 360006/399/31
Detected format: 1152x864p75.00 (1600x900)

Signal Timings: 568630/525/9
no resolution match for timings: 568630/525/9

Patched:
Signal Timings: 360006/399/31
Geometry: 1600 1152 64 128 256   900 864 1 0 3 32 0
Detected format: 1152x864p74.99 (1600x900)

Signal Timings: 568646/525/9
Geometry: 1560 1400 48 32 80   1080 1050 3 0 4 23 0
Detected format: 1400x1050p47.48 (1560x1080)

Note the differences. The original code uses values in
v4l2_dv_timings_presets[], while with the patch it reads the data from
the chip. Thus 108000000 Hz changes into (this time) 107998200 Hz.

Also, the flags. This is HDMI receiver, so I don't exactly think H and V
sync signals have any polarity (they are symbols embedded in the HDMI
stream).
I don't know if the "VESA Discrete Monitor Timings" (DMT) flag makes any
difference.

The code assumes the V sync signal has the same duration for both
fields. While this may be not necessarily true, I can't see any way to
get the "other" V sync width. This is most probably harmless.

I have checked the register values in interlaced mode, but currently
can't test such a setup (I only have remote access to a device working
in interlaced mode). Perhaps this will change in time.

All tests have been performed on Gateworks' Ventana GW54xx board, with
a TDA19971 chip.

Signed-off-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>
---
... also testing UTF-8 path :-)

Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -1092,66 +1094,71 @@ tda1997x_detect_std(struct tda1997x_state *state,
 		    struct v4l2_dv_timings *timings)
 {
 	struct v4l2_subdev *sd =3D &state->sd;
-	u32 vper;
-	u16 hper;
-	u16 hsper;
-	int i;
=20
 	/*
 	 * Read the FMT registers
-	 *   REG_V_PER: Period of a frame (or two fields) in MCLK(27MHz) cycles
-	 *   REG_H_PER: Period of a line in MCLK(27MHz) cycles
-	 *   REG_HS_WIDTH: Period of horiz sync pulse in MCLK(27MHz) cycles
+	 *   REG_V_PER: Period of a frame (or field) in MCLK (27MHz) cycles
+	 *   REG_H_PER: Period of a line in MCLK (27MHz) cycles
+	 *   REG_HS_WIDTH: Period of horiz sync pulse in MCLK (27MHz) cycles
 	 */
-	vper =3D io_read24(sd, REG_V_PER) & MASK_VPER;
-	hper =3D io_read16(sd, REG_H_PER) & MASK_HPER;
-	hsper =3D io_read16(sd, REG_HS_WIDTH) & MASK_HSWIDTH;
+	u32 vper =3D io_read24(sd, REG_V_PER) & MASK_VPER;
+	u16 hper =3D io_read16(sd, REG_H_PER) & MASK_HPER;
+	u16 hswidth =3D io_read16(sd, REG_HS_WIDTH);
+	u16 hsper =3D hswidth & MASK_HSWIDTH;
+	u16 htot, hact, hfront, hsync, hback;
+	u16 vtot, vact, vfront1, vfront2, vsync, vback1, vback2;
+
 	v4l2_dbg(1, debug, sd, "Signal Timings: %u/%u/%u\n", vper, hper, hsper);
 	if (!vper || !hper || !hsper)
 		return -ENOLINK;
=20
-	for (i =3D 0; v4l2_dv_timings_presets[i].bt.width; i++) {
-		const struct v4l2_bt_timings *bt;
-		u32 lines, width, _hper, _hsper;
-		u32 vmin, vmax, hmin, hmax, hsmin, hsmax;
-		bool vmatch, hmatch, hsmatch;
-
-		bt =3D &v4l2_dv_timings_presets[i].bt;
-		width =3D V4L2_DV_BT_FRAME_WIDTH(bt);
-		lines =3D V4L2_DV_BT_FRAME_HEIGHT(bt);
-		_hper =3D (u32)bt->pixelclock / width;
-		if (bt->interlaced)
-			lines /=3D 2;
-		/* vper +/- 0.7% */
-		vmin =3D ((27000000 / 1000) * 993) / _hper * lines;
-		vmax =3D ((27000000 / 1000) * 1007) / _hper * lines;
-		/* hper +/- 1.0% */
-		hmin =3D ((27000000 / 100) * 99) / _hper;
-		hmax =3D ((27000000 / 100) * 101) / _hper;
-		/* hsper +/- 2 (take care to avoid 32bit overflow) */
-		_hsper =3D 27000 * bt->hsync / ((u32)bt->pixelclock/1000);
-		hsmin =3D _hsper - 2;
-		hsmax =3D _hsper + 2;
-
-		/* vmatch matches the framerate */
-		vmatch =3D ((vper <=3D vmax) && (vper >=3D vmin)) ? 1 : 0;
-		/* hmatch matches the width */
-		hmatch =3D ((hper <=3D hmax) && (hper >=3D hmin)) ? 1 : 0;
-		/* hsmatch matches the hswidth */
-		hsmatch =3D ((hsper <=3D hsmax) && (hsper >=3D hsmin)) ? 1 : 0;
-		if (hmatch && vmatch && hsmatch) {
-			v4l2_print_dv_timings(sd->name, "Detected format: ",
-					      &v4l2_dv_timings_presets[i],
-					      false);
-			if (timings)
-				*timings =3D v4l2_dv_timings_presets[i];
-			return 0;
-		}
+	htot =3D io_read16(sd, REG_FMT_H_TOT);
+	hact =3D io_read16(sd, REG_FMT_H_ACT);
+	hfront =3D io_read16(sd, REG_FMT_H_FRONT);
+	hsync =3D io_read16(sd, REG_FMT_H_SYNC);
+	hback =3D io_read16(sd, REG_FMT_H_BACK);
+
+	vtot =3D io_read16(sd, REG_FMT_V_TOT);
+	vact =3D io_read16(sd, REG_FMT_V_ACT);
+	vfront1 =3D io_read(sd, REG_FMT_V_FRONT_F1);
+	vfront2 =3D io_read(sd, REG_FMT_V_FRONT_F2);
+	vsync =3D io_read(sd, REG_FMT_V_SYNC);
+	vback1 =3D io_read(sd, REG_FMT_V_BACK_F1);
+	vback2 =3D io_read(sd, REG_FMT_V_BACK_F2);
+
+	v4l2_dbg(1, debug, sd, "Geometry: %u %u %u %u %u   %u %u %u %u %u %u %u\n=
",
+		 htot, hact, hfront, hsync, hback,
+		 vtot, vact, vfront1, vfront2, vsync, vback1, vback2);
+
+	if (!timings)
+		return 0;
+
+	timings->type =3D V4L2_DV_BT_656_1120;
+	timings->bt.width =3D hact;
+	timings->bt.hfrontporch =3D hfront;
+	timings->bt.hsync =3D hsync;
+	timings->bt.hbackporch =3D hback;
+	timings->bt.height =3D vact;
+	timings->bt.vfrontporch =3D vfront1;
+	timings->bt.vsync =3D vsync;
+	timings->bt.vbackporch =3D vback1;
+	timings->bt.interlaced =3D hswidth & MASK_HSWIDTH_INTERLACED ?
+		V4L2_DV_INTERLACED : V4L2_DV_PROGRESSIVE;
+
+	timings->bt.pixelclock =3D (u64)htot * vtot * 27000000;
+	if (timings->bt.interlaced =3D=3D V4L2_DV_INTERLACED) {
+		timings->bt.il_vfrontporch =3D vfront2;
+		timings->bt.il_vsync =3D timings->bt.vsync;
+		timings->bt.il_vbackporch =3D vback2;
+		do_div(timings->bt.pixelclock, vper * 2 /* full frame */);
+	} else {
+		timings->bt.il_vfrontporch =3D 0;
+		timings->bt.il_vsync =3D 0;
+		timings->bt.il_vbackporch =3D 0;
+		do_div(timings->bt.pixelclock, vper);
 	}
-
-	v4l_err(state->client, "no resolution match for timings: %d/%d/%d\n",
-		vper, hper, hsper);
-	return -ERANGE;
+	v4l2_print_dv_timings(sd->name, "Detected format: ", timings, false);
+	return 0;
 }
=20
 /* some sort of errata workaround for chip revision 0 (N1) */
--- a/drivers/media/i2c/tda1997x_regs.h
+++ b/drivers/media/i2c/tda1997x_regs.h
@@ -120,6 +120,7 @@
 #define MASK_VHREF		0x3fff
 #define MASK_HPER		0x0fff
 #define MASK_HSWIDTH		0x03ff
+#define MASK_HSWIDTH_INTERLACED	0x8000
=20
 /* HPD Detection */
 #define DETECT_UTIL		BIT(7)	/* utility of HDMI level */
