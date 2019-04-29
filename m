Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F58BE780
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2019 18:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728855AbfD2QRh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Apr 2019 12:17:37 -0400
Received: from vps-vb.mhejs.net ([37.28.154.113]:56322 "EHLO vps-vb.mhejs.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728846AbfD2QRg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Apr 2019 12:17:36 -0400
Received: from MUA
        by vps-vb.mhejs.net with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <mail@maciej.szmigiero.name>)
        id 1hL8yE-0002q5-Bc; Mon, 29 Apr 2019 18:17:34 +0200
From:   "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
To:     Michael Krufky <mkrufky@linuxtv.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Andy Walls <awalls@md.metrocast.net>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH v12 5/8] cx25840: set_fmt operation should clamp out-of-range picture sizes
Date:   Mon, 29 Apr 2019 18:16:56 +0200
Message-Id: <c9e732fcdcfd64252a5d128ada3357af866a2a3e.1556554056.git.mail@maciej.szmigiero.name>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1556554056.git.mail@maciej.szmigiero.name>
References: <cover.1556554056.git.mail@maciej.szmigiero.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According to V4L2 API set_fmt subdev operation should not return an error
on out-of-range picture sizes, the values should be clamped instead to the
supported range.

The cx25840 datasheet says that the chip is capable of scaling down the
picture width and height, respectively, 16 and 8 times.
These values agree with what the old implementation enforced.

Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
---
 drivers/media/i2c/cx25840/cx25840-core.c | 59 ++++++++++++++++--------
 1 file changed, 40 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i2c/cx25840/cx25840-core.c
index f03bd637b795..371ac6bb265a 100644
--- a/drivers/media/i2c/cx25840/cx25840-core.c
+++ b/drivers/media/i2c/cx25840/cx25840-core.c
@@ -1702,7 +1702,8 @@ static int cx25840_set_fmt(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *fmt = &format->format;
 	struct cx25840_state *state = to_state(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int HSC, VSC, Vsrc, Hsrc, filter, Vlines;
+	u32 HSC, VSC, Vsrc, Hsrc, Vadd;
+	int filter;
 	int is_50Hz = !(state->std & V4L2_STD_525_60);
 
 	if (format->pad || fmt->code != MEDIA_BUS_FMT_FIXED)
@@ -1727,28 +1728,46 @@ static int cx25840_set_fmt(struct v4l2_subdev *sd,
 		Hsrc |= (cx25840_read(client, 0x471) & 0xf0) >> 4;
 	}
 
-	Vlines = fmt->height;
-	if (!state->generic_mode)
-		Vlines += is_50Hz ? 4 : 7;
+	if (!state->generic_mode) {
+		Vadd = is_50Hz ? 4 : 7;
 
-	/*
-	 * We keep 1 margin for the Vsrc < Vlines check since the
-	 * cx23888 reports a Vsrc of 486 instead of 487 for the NTSC
-	 * height. Without that margin the cx23885 fails in this
-	 * check.
-	 */
-	if ((fmt->width == 0) || (Vlines == 0) ||
-	    (fmt->width * 16 < Hsrc) || (Hsrc < fmt->width) ||
-	    (Vlines * 8 < Vsrc) || (Vsrc + 1 < Vlines)) {
-		v4l_err(client, "%dx%d is not a valid size!\n",
-				fmt->width, fmt->height);
-		return -ERANGE;
+		/*
+		 * cx23888 in 525-line mode is programmed for 486 active lines
+		 * while other chips use 487 active lines.
+		 *
+		 * See reg 0x428 bits [21:12] in cx23888_std_setup() vs
+		 * vactive in cx25840_std_setup().
+		 */
+		if (is_cx23888(state) && !is_50Hz)
+			Vadd--;
+	} else
+		Vadd = 0;
+
+	if (Hsrc == 0 ||
+	    Vsrc <= Vadd) {
+		v4l_err(client,
+			"chip reported picture size (%u x %u) is far too small\n",
+			(unsigned int)Hsrc, (unsigned int)Vsrc);
+		/*
+		 * that's the best we can do since the output picture
+		 * size is completely unknown in this case
+		 */
+		return -EINVAL;
 	}
+
+	fmt->width = clamp(fmt->width, (Hsrc + 15) / 16, Hsrc);
+
+	if (Vadd * 8 >= Vsrc)
+		fmt->height = clamp(fmt->height, (u32)1, Vsrc - Vadd);
+	else
+		fmt->height = clamp(fmt->height, (Vsrc - Vadd * 8 + 7) / 8,
+				    Vsrc - Vadd);
+
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
 		return 0;
 
 	HSC = (Hsrc * (1 << 20)) / fmt->width - (1 << 20);
-	VSC = (1 << 16) - (Vsrc * (1 << 9) / Vlines - (1 << 9));
+	VSC = (1 << 16) - (Vsrc * (1 << 9) / (fmt->height + Vadd) - (1 << 9));
 	VSC &= 0x1fff;
 
 	if (fmt->width >= 385)
@@ -1760,8 +1779,10 @@ static int cx25840_set_fmt(struct v4l2_subdev *sd,
 	else
 		filter = 3;
 
-	v4l_dbg(1, cx25840_debug, client, "decoder set size %dx%d -> scale  %ux%u\n",
-			fmt->width, fmt->height, HSC, VSC);
+	v4l_dbg(1, cx25840_debug, client,
+		"decoder set size %u x %u with scale %x x %x\n",
+		(unsigned int)fmt->width, (unsigned int)fmt->height,
+		(unsigned int)HSC, (unsigned int)VSC);
 
 	/* HSCALE=HSC */
 	if (is_cx23888(state)) {
