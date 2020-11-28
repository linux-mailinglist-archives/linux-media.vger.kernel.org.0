Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECA892C74D5
	for <lists+linux-media@lfdr.de>; Sat, 28 Nov 2020 23:23:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388399AbgK1Vth (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Nov 2020 16:49:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727756AbgK1SRx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Nov 2020 13:17:53 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8A3AC0254A9
        for <linux-media@vger.kernel.org>; Sat, 28 Nov 2020 08:57:33 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id ACEA8C6399; Sat, 28 Nov 2020 16:57:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1606582648; bh=eAqe23DYmkptbH79ILXAJKq17HBlOB1iYajsLyc8gD8=;
        h=From:To:Cc:Subject:Date:From;
        b=MGrYyjNDp6kG3pvgtidigf/SH8eueh4HVoni8/bl7dHYzTpcWYQ3vMAytTvTog40E
         ilyF95Mp63QSB7VrseRDL8O8scmo4SxFy4/sLgl8jinW8GN/dq6VDSOvLxeQGIvZU1
         8zLFrflN+b9yQpR5ZqsnNU4/icj64JmcUneZMqkrpKi+LmsSkYjh2WG1AtRoIFoYLO
         8VTpm6tGW4eDK+3V9/nNxNZc/9fj19awTll2EBv+eSlcIwxtdKp09HqMaZZ9d7U61Z
         SiApLlCtSRBtVu0vcWaHHeyKhwDb8p97Frxyz3Bhf28DpF77ACU4mzfGV0kCuNmIzQ
         q7M5tehVpaRNA==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH] media: mtk-cir: fix calculation of chk period
Date:   Sat, 28 Nov 2020 16:57:28 +0000
Message-Id: <20201128165728.29756-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since commit 528222d853f9 ("media: rc: harmonize infrared durations to
microseconds"), the calculation of the chk period is wrong. As a result,
all reported IR will have incorrect timings.

Now that the calculations are done in microseconds rather than nanoseconds,
we can fold the calculations in a simpler form with less rounding error.

Cc: Frank Wunderlich <frank-w@public-files.de>
Fixes: 528222d853f9 ("media: rc: harmonize infrared durations to microseconds")
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/mtk-cir.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/rc/mtk-cir.c b/drivers/media/rc/mtk-cir.c
index 5051a5e5244b..cdfb1eded306 100644
--- a/drivers/media/rc/mtk-cir.c
+++ b/drivers/media/rc/mtk-cir.c
@@ -151,15 +151,12 @@ static inline u32 mtk_chk_period(struct mtk_ir *ir)
 {
 	u32 val;
 
-	/* Period of raw software sampling in ns */
-	val = DIV_ROUND_CLOSEST(1000000000ul,
-				clk_get_rate(ir->bus) / ir->data->div);
-
 	/*
 	 * Period for software decoder used in the
 	 * unit of raw software sampling
 	 */
-	val = DIV_ROUND_CLOSEST(MTK_IR_SAMPLE, val);
+	val = DIV_ROUND_CLOSEST(MTK_IR_SAMPLE * clk_get_rate(ir->bus),
+				USEC_PER_SEC * ir->data->div);
 
 	dev_dbg(ir->dev, "@pwm clk  = \t%lu\n",
 		clk_get_rate(ir->bus) / ir->data->div);
-- 
2.28.0

