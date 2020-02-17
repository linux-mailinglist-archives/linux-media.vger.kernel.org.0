Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9594F1615DC
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2020 16:14:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728457AbgBQPOL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Feb 2020 10:14:11 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42277 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727926AbgBQPOD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Feb 2020 10:14:03 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1j3i5x-0005W9-45; Mon, 17 Feb 2020 16:14:01 +0100
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1j3i5w-0001a6-9X; Mon, 17 Feb 2020 16:14:00 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 06/18] media: allegro: fix calculation of CPB size
Date:   Mon, 17 Feb 2020 16:13:46 +0100
Message-Id: <20200217151358.5695-7-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200217151358.5695-1-m.tretter@pengutronix.de>
References: <20200217151358.5695-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cpb_size is given in kilobytes, but the bitrate is given in bits per
second. Therefore, the calculation of the initial removal delay and the
cpb size for the firmware were wrong.

Convert the bitrate to kilobytes before calculating the cpb size in 90
kHz units for sending it to the firmware. Also reuse the result for the
initial removal delay, to make it obvious that we are setting the
initial removal delay to the maximum value.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/staging/media/allegro-dvt/allegro-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index b04ded8ae06b..383a5fe07d64 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -5,6 +5,7 @@
  * Allegro DVT video encoder driver
  */
 
+#include <linux/bits.h>
 #include <linux/firmware.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -1094,12 +1095,11 @@ static int allegro_mcu_send_create_channel(struct allegro_dev *dev,
 
 	msg.rate_control_mode =
 		v4l2_bitrate_mode_to_mcu_mode(channel->bitrate_mode);
-	/* Shall be ]0;cpb_size in 90 kHz units]. Use maximum value. */
-	msg.initial_rem_delay =
-		((channel->cpb_size * 1000) / channel->bitrate_peak) * 90000;
 	/* Encoder expects cpb_size in units of a 90 kHz clock. */
 	msg.cpb_size =
-		((channel->cpb_size * 1000) / channel->bitrate_peak) * 90000;
+		(channel->cpb_size * 90000) / (channel->bitrate_peak / 1000 / BITS_PER_BYTE);
+	/* Shall be ]0;cpb_size in 90 kHz units]. Use maximum value. */
+	msg.initial_rem_delay = msg.cpb_size;
 	msg.framerate = 25;
 	msg.clk_ratio = 1000;
 	msg.target_bitrate = channel->bitrate;
-- 
2.20.1

