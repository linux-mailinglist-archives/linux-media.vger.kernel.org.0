Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E22E3A9A65
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 14:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232951AbhFPMay (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 08:30:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:49304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232623AbhFPMaq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 08:30:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F401613D3;
        Wed, 16 Jun 2021 12:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623846520;
        bh=qiN1R/jymLRTb35TqMu2Vqi01KiKSp/t9ibnV3ARPpY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CKAJ8xCB6m+t0PmJyd97NrWc8V/6eSVq0EvSS0idBcB1dSYcQuv3qV2r4s/z+9pR8
         SswpRbBTTn9KRYiDFVzF6loRCeVjJKGqnbDDM3AIEvB89qLiKvs2ftP5+k7iPBDpLF
         t0S7VmTsqg+GbW9676pPmMYTRvYuX5JM31DHPDXymfn4G9gJMvn6fuNOLZf7EdBcx6
         NgaHfLa8+yNaJc7Pp+HgeulYPZwP8CSBK+moq3jl9Hb2SNNnDNZ/noQmzdJrzWhIMz
         k++YoTrA26R4ygZNP5YVcTmV94cya5mxjR0ucHFtmtCrE1OYxTo/poKIzC1quKj57C
         bBNL8nLYRMWCw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1ltUes-004oiv-FW; Wed, 16 Jun 2021 14:28:38 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Allen Pais <allen.lkml@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Romain Perier <romain.perier@gmail.com>,
        dingsenjie <dingsenjie@yulong.com>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH 09/11] media: ttusb-dec: cleanup an error handling logic
Date:   Wed, 16 Jun 2021 14:28:35 +0200
Message-Id: <9d098284e97a5687f857671d1aa8e5716658d50a.1623846327.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623846327.git.mchehab+huawei@kernel.org>
References: <cover.1623846327.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplify the logic at ttusb_dec_send_command().

Besides avoiding some code duplication, as a side effect,
this could remove this false positive return with spatch:

	drivers/media/usb/ttusb-dec/ttusb_dec.c:380 ttusb_dec_send_command() warn: inconsistent returns '&dec->usb_mutex'.
	  Locked on  : 330
	  Unlocked on: 354,365,380

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/usb/ttusb-dec/ttusb_dec.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/media/usb/ttusb-dec/ttusb_dec.c b/drivers/media/usb/ttusb-dec/ttusb_dec.c
index a852ee5f7ac9..bfda46a36dc5 100644
--- a/drivers/media/usb/ttusb-dec/ttusb_dec.c
+++ b/drivers/media/usb/ttusb-dec/ttusb_dec.c
@@ -324,10 +324,10 @@ static int ttusb_dec_send_command(struct ttusb_dec *dec, const u8 command,
 	if (!b)
 		return -ENOMEM;
 
-	if ((result = mutex_lock_interruptible(&dec->usb_mutex))) {
-		kfree(b);
+	result = mutex_lock_interruptible(&dec->usb_mutex);
+	if (result) {
 		printk("%s: Failed to lock usb mutex.\n", __func__);
-		return result;
+		goto err;
 	}
 
 	b[0] = 0xaa;
@@ -349,9 +349,7 @@ static int ttusb_dec_send_command(struct ttusb_dec *dec, const u8 command,
 	if (result) {
 		printk("%s: command bulk message failed: error %d\n",
 		       __func__, result);
-		mutex_unlock(&dec->usb_mutex);
-		kfree(b);
-		return result;
+		goto err;
 	}
 
 	result = usb_bulk_msg(dec->udev, dec->result_pipe, b,
@@ -360,9 +358,7 @@ static int ttusb_dec_send_command(struct ttusb_dec *dec, const u8 command,
 	if (result) {
 		printk("%s: result bulk message failed: error %d\n",
 		       __func__, result);
-		mutex_unlock(&dec->usb_mutex);
-		kfree(b);
-		return result;
+		goto err;
 	} else {
 		if (debug) {
 			printk(KERN_DEBUG "%s: result: %*ph\n",
@@ -373,12 +369,13 @@ static int ttusb_dec_send_command(struct ttusb_dec *dec, const u8 command,
 			*result_length = b[3];
 		if (cmd_result && b[3] > 0)
 			memcpy(cmd_result, &b[4], b[3]);
-
-		mutex_unlock(&dec->usb_mutex);
-
-		kfree(b);
-		return 0;
 	}
+
+err:
+	mutex_unlock(&dec->usb_mutex);
+
+	kfree(b);
+	return result;
 }
 
 static int ttusb_dec_get_stb_state (struct ttusb_dec *dec, unsigned int *mode,
-- 
2.31.1

