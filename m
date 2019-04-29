Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF07E77A
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2019 18:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728802AbfD2QRU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Apr 2019 12:17:20 -0400
Received: from vps-vb.mhejs.net ([37.28.154.113]:56206 "EHLO vps-vb.mhejs.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728481AbfD2QRT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Apr 2019 12:17:19 -0400
Received: from MUA
        by vps-vb.mhejs.net with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <mail@maciej.szmigiero.name>)
        id 1hL8xv-0002pK-V2; Mon, 29 Apr 2019 18:17:15 +0200
From:   "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
To:     Michael Krufky <mkrufky@linuxtv.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Andy Walls <awalls@md.metrocast.net>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH v12 2/8] cx25840: g_std operation really implements querystd operation
Date:   Mon, 29 Apr 2019 18:16:53 +0200
Message-Id: <9490ba236364690f582815c125b3e5208a4778a2.1556554056.git.mail@maciej.szmigiero.name>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1556554056.git.mail@maciej.szmigiero.name>
References: <cover.1556554056.git.mail@maciej.szmigiero.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

cx25840 driver g_std operation queries the currently detected video signal,
however this is what querystd operation should do, so let's rename the
handler.

None of the existing cx25840 driver users ever called the g_std operation,
one of them calls querystd on each of its subdevs but then the result is
only used to implement VIDIOC_QUERYSTD (as it should).

Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
---
 drivers/media/i2c/cx25840/cx25840-core.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i2c/cx25840/cx25840-core.c
index 0bf30222cf93..2bcaf239b0d2 100644
--- a/drivers/media/i2c/cx25840/cx25840-core.c
+++ b/drivers/media/i2c/cx25840/cx25840-core.c
@@ -1772,7 +1772,7 @@ static int cx25840_s_stream(struct v4l2_subdev *sd, int enable)
 }
 
 /* Query the current detected video format */
-static int cx25840_g_std(struct v4l2_subdev *sd, v4l2_std_id *std)
+static int cx25840_querystd(struct v4l2_subdev *sd, v4l2_std_id *std)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 
@@ -1800,8 +1800,9 @@ static int cx25840_g_std(struct v4l2_subdev *sd, v4l2_std_id *std)
 	u32 fmt = (cx25840_read4(client, 0x40c) >> 8) & 0xf;
 	*std = stds[ fmt ];
 
-	v4l_dbg(1, cx25840_debug, client, "g_std fmt = %x, v4l2_std_id = 0x%x\n",
-		fmt, (unsigned int)stds[ fmt ]);
+	v4l_dbg(1, cx25840_debug, client,
+		"querystd fmt = %x, v4l2_std_id = 0x%x\n",
+		fmt, (unsigned int)stds[fmt]);
 
 	return 0;
 }
@@ -5081,7 +5082,7 @@ static const struct v4l2_subdev_audio_ops cx25840_audio_ops = {
 
 static const struct v4l2_subdev_video_ops cx25840_video_ops = {
 	.s_std = cx25840_s_std,
-	.g_std = cx25840_g_std,
+	.querystd = cx25840_querystd,
 	.s_routing = cx25840_s_video_routing,
 	.s_stream = cx25840_s_stream,
 	.g_input_status = cx25840_g_input_status,
