Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD0B3CF6D3
	for <lists+linux-media@lfdr.de>; Tue, 20 Jul 2021 11:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235711AbhGTIs4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Jul 2021 04:48:56 -0400
Received: from mail.ispras.ru ([83.149.199.84]:48080 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235301AbhGTIsF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Jul 2021 04:48:05 -0400
Received: from hellwig.intra.ispras.ru (unknown [83.149.199.249])
        by mail.ispras.ru (Postfix) with ESMTPS id 4165B40D3BFF;
        Tue, 20 Jul 2021 09:28:29 +0000 (UTC)
From:   Evgeny Novikov <novikov@ispras.ru>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Evgeny Novikov <novikov@ispras.ru>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        dingsenjie <dingsenjie@yulong.com>,
        Allen Pais <allen.lkml@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
Subject: [PATCH] media: ttusb-dec: avoid release of non-acquired mutex
Date:   Tue, 20 Jul 2021 12:28:27 +0300
Message-Id: <20210720092827.13346-1-novikov@ispras.ru>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ttusb_dec_send_command() invokes mutex_lock_interruptible() that can
fail but then it releases the non-acquired mutex. The patch fixes that.

Found by Linux Driver Verification project (linuxtesting.org).

Fixes: dba328bab4c6 ("media: ttusb-dec: cleanup an error handling logic")
Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
---
 drivers/media/usb/ttusb-dec/ttusb_dec.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/ttusb-dec/ttusb_dec.c b/drivers/media/usb/ttusb-dec/ttusb_dec.c
index bfda46a36dc5..38822cedd93a 100644
--- a/drivers/media/usb/ttusb-dec/ttusb_dec.c
+++ b/drivers/media/usb/ttusb-dec/ttusb_dec.c
@@ -327,7 +327,7 @@ static int ttusb_dec_send_command(struct ttusb_dec *dec, const u8 command,
 	result = mutex_lock_interruptible(&dec->usb_mutex);
 	if (result) {
 		printk("%s: Failed to lock usb mutex.\n", __func__);
-		goto err;
+		goto err_free;
 	}
 
 	b[0] = 0xaa;
@@ -349,7 +349,7 @@ static int ttusb_dec_send_command(struct ttusb_dec *dec, const u8 command,
 	if (result) {
 		printk("%s: command bulk message failed: error %d\n",
 		       __func__, result);
-		goto err;
+		goto err_mutex_unlock;
 	}
 
 	result = usb_bulk_msg(dec->udev, dec->result_pipe, b,
@@ -358,7 +358,7 @@ static int ttusb_dec_send_command(struct ttusb_dec *dec, const u8 command,
 	if (result) {
 		printk("%s: result bulk message failed: error %d\n",
 		       __func__, result);
-		goto err;
+		goto err_mutex_unlock;
 	} else {
 		if (debug) {
 			printk(KERN_DEBUG "%s: result: %*ph\n",
@@ -371,9 +371,9 @@ static int ttusb_dec_send_command(struct ttusb_dec *dec, const u8 command,
 			memcpy(cmd_result, &b[4], b[3]);
 	}
 
-err:
+err_mutex_unlock:
 	mutex_unlock(&dec->usb_mutex);
-
+err_free:
 	kfree(b);
 	return result;
 }
-- 
2.26.2

