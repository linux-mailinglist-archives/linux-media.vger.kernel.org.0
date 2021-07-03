Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABC783BA91A
	for <lists+linux-media@lfdr.de>; Sat,  3 Jul 2021 17:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbhGCPGe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Jul 2021 11:06:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbhGCPGc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Jul 2021 11:06:32 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3FF7C061762
        for <linux-media@vger.kernel.org>; Sat,  3 Jul 2021 08:03:57 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 8EEF9C6463; Sat,  3 Jul 2021 16:03:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1625324634; bh=P6xVqJEtZXUQUcfH/NycFTfFg5EZ8EQ7aBwcJwV4TIg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=RVPHkjSZkZK52/BBECEFxKWFcUeA0onBekQqnYriRC8027fnLGXYlPi58JJ1BMIVw
         HX9rp2OG5kNaqw8YM7i5S3+kC/T1zhFDnQG7Wwo7Yxv8f1/DLuHvLl0xhY72D8HJ4Q
         asINyK9fu0Z2x+tV3Cq+AdfNZOcaQUd0MF7wzIpEekvD6tL3KKg8KIzuh/pwhUZB+o
         9KGrwUmNJzmK2GIkJ6BimN8/3zIKIOwlZM0k9k6OZQb/0nW9pZYkLT/7v05nogNgN7
         sdPKLhaEJHOgErPWoPYX6xGzkuz9Y1yveri3MvQr0FfdncSUJfj5K8ZonUScRA+pCl
         MvZc/ePuBduNg==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH 3/4] media: rc-loopback: send carrier reports
Date:   Sat,  3 Jul 2021 16:03:53 +0100
Message-Id: <db49c07dd25e147d43cb4dffdb37dcb25b3a75a8.1625324530.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1625324530.git.sean@mess.org>
References: <cover.1625324530.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When carrier reports are enabled, send them over loopback.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/rc-loopback.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/rc-loopback.c b/drivers/media/rc/rc-loopback.c
index 164a20fe1e75..f1db8c46e1da 100644
--- a/drivers/media/rc/rc-loopback.c
+++ b/drivers/media/rc/rc-loopback.c
@@ -111,8 +111,16 @@ static int loop_tx_ir(struct rc_dev *dev, unsigned *txbuf, unsigned count)
 	for (i = 0; i < count; i++) {
 		rawir.pulse = i % 2 ? false : true;
 		rawir.duration = txbuf[i];
-		if (rawir.duration)
-			ir_raw_event_store_with_filter(dev, &rawir);
+
+		ir_raw_event_store_with_filter(dev, &rawir);
+	}
+
+	if (lodev->carrierreport) {
+		rawir.pulse = false;
+		rawir.carrier_report = true;
+		rawir.carrier = lodev->txcarrier;
+
+		ir_raw_event_store(dev, &rawir);
 	}
 
 	/* Fake a silence long enough to cause us to go idle */
-- 
2.31.1

