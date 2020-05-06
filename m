Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99BD81C6EA1
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 12:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729174AbgEFKmZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 06:42:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725824AbgEFKmZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 06:42:25 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2BC4C061A0F
        for <linux-media@vger.kernel.org>; Wed,  6 May 2020 03:42:24 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 931E7C6372; Wed,  6 May 2020 11:42:22 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/2] media: rc: improve precision of transmitted signal due to scheduling
Date:   Wed,  6 May 2020 11:42:21 +0100
Message-Id: <20200506104222.16188-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

usleep_range() may take longer than the max argument due to scheduling,
especially under load. This is causing random errors in the transmitted
IR. Remove the usleep_range() in favour of busy-looping with ndelay().

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

