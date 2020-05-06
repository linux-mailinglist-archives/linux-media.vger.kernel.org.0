Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6E4F1C725C
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 16:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728854AbgEFOBq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 10:01:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727084AbgEFOBq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 10:01:46 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 828B4C061A0F
        for <linux-media@vger.kernel.org>; Wed,  6 May 2020 07:01:46 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id CBA40C6372; Wed,  6 May 2020 15:01:44 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 1/2] media: gpio-ir-tx: improve precision of transmitted signal due to scheduling
Date:   Wed,  6 May 2020 15:01:43 +0100
Message-Id: <20200506140144.19778-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

usleep_range() may take longer than the max argument due to scheduling,
especially under load. This is causing random errors in the transmitted
IR. Remove the usleep_range() in favour of busy-looping with udelay().

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/gpio-ir-tx.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/rc/gpio-ir-tx.c b/drivers/media/rc/gpio-ir-tx.c
index 18ca12d78314c..66703989ae185 100644
--- a/drivers/media/rc/gpio-ir-tx.c
+++ b/drivers/media/rc/gpio-ir-tx.c
@@ -79,13 +79,8 @@ static int gpio_ir_tx(struct rc_dev *dev, unsigned int *txbuf,
 			// space
 			edge = ktime_add_us(edge, txbuf[i]);
 			delta = ktime_us_delta(edge, ktime_get());
-			if (delta > 10) {
-				spin_unlock_irqrestore(&gpio_ir->lock, flags);
-				usleep_range(delta, delta + 10);
-				spin_lock_irqsave(&gpio_ir->lock, flags);
-			} else if (delta > 0) {
+			if (delta > 0)
 				udelay(delta);
-			}
 		} else {
 			// pulse
 			ktime_t last = ktime_add_us(edge, txbuf[i]);
-- 
2.26.2

