Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCA0E48EC2A
	for <lists+linux-media@lfdr.de>; Fri, 14 Jan 2022 16:04:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238287AbiANPD5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jan 2022 10:03:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235774AbiANPD4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jan 2022 10:03:56 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55128C061574
        for <linux-media@vger.kernel.org>; Fri, 14 Jan 2022 07:03:56 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 8290C101C30; Fri, 14 Jan 2022 15:03:53 +0000 (UTC)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc:     Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 2/2] media: mtk-cir: remove superfluous ir_raw_event_reset()
Date:   Fri, 14 Jan 2022 15:03:53 +0000
Message-Id: <20220114150353.195192-2-sean@mess.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220114150353.195192-1-sean@mess.org>
References: <20220114150353.195192-1-sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This IR receiver has two limitations:

1) Any IR pulse or space longer than 12ms will be truncated 12ms

2) Any pulses/spaces after the first 68 are lost

ir_raw_event_reset() won't help here. If the IR cannot be decoded, any
decoder should reset itself, and if it does not, this is a bug in the
decoder.

Cc: Sean Wang <sean.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/mtk-cir.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/media/rc/mtk-cir.c b/drivers/media/rc/mtk-cir.c
index 746d43fdc17a..255f8a116b59 100644
--- a/drivers/media/rc/mtk-cir.c
+++ b/drivers/media/rc/mtk-cir.c
@@ -209,19 +209,18 @@ static irqreturn_t mtk_ir_irq(int irqno, void *dev_id)
 	struct ir_raw_event rawir = {};
 
 	/*
-	 * Reset decoder state machine explicitly is required
-	 * because 1) the longest duration for space MTK IR hardware
-	 * could record is not safely long. e.g  12ms if rx resolution
-	 * is 46us by default. There is still the risk to satisfying
-	 * every decoder to reset themselves through long enough
-	 * trailing spaces and 2) the IRQ handler guarantees that
-	 * start of IR message is always contained in and starting
-	 * from register mtk_chkdata_reg(ir, i).
+	 * Each pulse and space is encoded as a single byte, each byte
+	 * alternating between pulse and space. If a pulse or space is longer
+	 * than can be encoded in a single byte, it is encoded as the maximum
+	 * value 0xff.
+	 *
+	 * If a space is longer ok_count (about 23ms), the value is encoded
+	 * as zero, and all following values are zero. Any IR that follows
+	 * will be presented in the next interrupt.
+	 *
+	 * If there are more than 68 (=MTK_CHKDATA_SZ * 4) pulses and spaces,
+	 * then the only the first 68 will be presented; the rest is lost.
 	 */
-	ir_raw_event_reset(ir->rc);
-
-	/* First message must be pulse */
-	rawir.pulse = false;
 
 	/* Handle all pulse and space IR controller captures */
 	for (i = 0 ; i < MTK_CHKDATA_SZ ; i++) {
-- 
2.34.1

