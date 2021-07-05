Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 948223BC2B0
	for <lists+linux-media@lfdr.de>; Mon,  5 Jul 2021 20:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbhGESeN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Jul 2021 14:34:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbhGESeM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Jul 2021 14:34:12 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67663C06175F
        for <linux-media@vger.kernel.org>; Mon,  5 Jul 2021 11:31:35 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 8E87CC646F; Mon,  5 Jul 2021 19:31:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1625509893; bh=UcGZek/WfFgoCf8+Aa7RAKh0mW6E5iFPgKBa/FK+I6k=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=staYy7KJM/whFvu6jVrYLwnoloRVZ5v8rgeG9xp1n5Pu23Qp2Xoi4FdHRaBDVOFFb
         ocXAHeO3A8On2pbOeVBkOb9F4+u8zt+uKx1lSgncSOV19rz4VPr0ryOPTvJfrzZYh6
         zzcfBIOyC2AU4va+O3tyRU8yAO70dS1wYpt2j0RRqc2nlZEwMo6udsc1U1/4SWx7fR
         XuzbuZLefWvKrn07FjLiwYPOPtHq0zAy9mTS77TOJJSC1TrRzoxRRoVu3nnSZxZ6tS
         YjXhO8XvIrSGhZ0x1xckT9H8GCt11IjVXf+RWvN+t1Ugg3jhKYCasGgplLTDF1N02H
         V/s+9JTegg42Q==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 3/5] media: rc-loopback: send carrier reports
Date:   Mon,  5 Jul 2021 19:31:30 +0100
Message-Id: <1ba0550091184d566d9a4539377a637bf5a06f78.1625509803.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1625509803.git.sean@mess.org>
References: <cover.1625509803.git.sean@mess.org>
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
index 5adfbb6989ee..67782dd7ee4d 100644
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

