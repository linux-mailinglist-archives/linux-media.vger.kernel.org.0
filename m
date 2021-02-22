Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A56F932144D
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 11:45:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbhBVKoP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 05:44:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbhBVKoN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 05:44:13 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B87F4C06174A
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 02:43:33 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 098C5C6393; Mon, 22 Feb 2021 10:43:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1613990610; bh=lmMYNznl6D0+LunOyyy1KSGWzpeWkdSrQcJgqfO0yKA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=cCwjTUKNqib1AM5bXRXgvxT9uM0Lyy7XOKU9zJQP/JRbQS8DCkwxQHeWBEbeRkWSR
         Dya82+/VhurUzT9Pht6aNhsBR22i8L4xgMztHDR+Gi9zpUaGgeu3mXW86dzGJhW5ld
         tvD9VRjDXjAkFdF7HtcOxWPBF1Pwz4aXdjfPOaMRrYAfpS08NzJW1M4zz9Jmg6GeG2
         ZazsmDIgaWTGTrJgglpSfV9w6CzbHCMlhf0KQTVWfLeLyfB+6z378z/WxmIJbDZrC9
         TYCi8crpaVk+BRju7Tm3XtBD0eEieGqsYMJpwZesGbv+EsXfzZYysa+vmqSaSGtJ8s
         FeAUb46mNd1rw==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, Matthias Reichl <hias@horus.com>,
        =?UTF-8?q?Juan=20Jes=C3=BAs=20Garc=C3=ADa=20de=20Soria?= 
        <skandalfo@gmail.com>
Subject: [PATCH 1/6] media: ite-cir: remove unused fields
Date:   Mon, 22 Feb 2021 10:43:24 +0000
Message-Id: <b511c7e41f8cc72bf504ac2f1c89a19981b97370.1613989288.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1613989288.git.sean@mess.org>
References: <cover.1613989288.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These fields are not referenced anywhere.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/ite-cir.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/rc/ite-cir.h b/drivers/media/rc/ite-cir.h
index 4954470448a7..dfdc26ba976c 100644
--- a/drivers/media/rc/ite-cir.h
+++ b/drivers/media/rc/ite-cir.h
@@ -111,14 +111,12 @@ struct ite_dev_params {
 struct ite_dev {
 	struct pnp_dev *pdev;
 	struct rc_dev *rdev;
-	struct ir_raw_event rawir;
 
 	/* sync data */
 	spinlock_t lock;
 	bool in_use, transmitting;
 
 	/* transmit support */
-	int tx_fifo_allowance;
 	wait_queue_head_t tx_queue, tx_ended;
 
 	/* hardware I/O settings */
-- 
2.29.2

