Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30B5211CFB0
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 15:23:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729672AbfLLOX3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 09:23:29 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:48243 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729567AbfLLOX3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 09:23:29 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1ifPNH-0000ol-UH; Thu, 12 Dec 2019 15:23:27 +0100
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de
Subject: [PATCH] media: coda: avoid hardware lockups with more than 13 capture buffers
Date:   Thu, 12 Dec 2019 15:23:27 +0100
Message-Id: <20191212142327.7269-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When decoding using the CODA internal rotator (for example NV12
capture), currently the value vb2_buf.index + CODA_MAX_FRAMEBUFFERS (19)
is written into the DEC_PIC_ROT_INDEX register. At least with firmware
version 3.1.1 this causes CODA hangups as soon as the register value
reaches 32. Instead, always write CODA_MAX_FRAMEBUFFERS.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-bit.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
index 00c7bed3dd57..fd37414c6fbd 100644
--- a/drivers/media/platform/coda/coda-bit.c
+++ b/drivers/media/platform/coda/coda-bit.c
@@ -2165,16 +2165,21 @@ static int coda_prepare_decode(struct coda_ctx *ctx)
 	} else {
 		if (dev->devtype->product == CODA_960) {
 			/*
-			 * The CODA960 seems to have an internal list of
-			 * buffers with 64 entries that includes the
-			 * registered frame buffers as well as the rotator
-			 * buffer output.
-			 *
-			 * ROT_INDEX needs to be < 0x40, but >
-			 * ctx->num_internal_frames.
+			 * It was previously assumed that the CODA960 has an
+			 * internal list of 64 buffer entries that contains
+			 * both the registered internal frame buffers as well
+			 * as the rotator buffer output, and that the ROT_INDEX
+			 * register must be set to a value between the last
+			 * internal frame buffers' index and 64.
+			 * At least on firmware version 3.1.1 it turns out that
+			 * setting ROT_INDEX to any value >= 32 causes CODA
+			 * hangups that it can not recover from with the SRC VPU
+			 * reset.
+			 * It does appear to work however, to just set it to a
+			 * fixed value in the [ctx->num_internal_frames, 31]
+			 * range, for example CODA_MAX_FRAMEBUFFERS.
 			 */
-			coda_write(dev,
-				   CODA_MAX_FRAMEBUFFERS + dst_buf->vb2_buf.index,
+			coda_write(dev, CODA_MAX_FRAMEBUFFERS,
 				   CODA9_CMD_DEC_PIC_ROT_INDEX);
 
 			reg_addr = CODA9_CMD_DEC_PIC_ROT_ADDR_Y;
-- 
2.20.1

