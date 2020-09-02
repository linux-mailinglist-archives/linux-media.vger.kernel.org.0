Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F1B425B10B
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 18:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728746AbgIBQNx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 12:13:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:53932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728281AbgIBQK4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 12:10:56 -0400
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F0E5A21582;
        Wed,  2 Sep 2020 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599063046;
        bh=MAam3szAvyQjlLkEQdoK5/MrRc6oip9fFC54zFOdGNA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sHvO+/fkSkVARvG1XOXU+M3HD+f0y6SgRHkfLSx8v73wfnmnM4zeK5oZt+2IM2zp0
         pb/6gW5TtMHWB8xCLAXiU2lAHd1mgM7QgEXpgQbRCs0bIkkFNZjPjFtNGe1IjUffwl
         Hdol4IbSkXK99JphCsUwq29eW1SpWRYtlfVnYabQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kDVLQ-000tAd-6l; Wed, 02 Sep 2020 18:10:44 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 21/38] media: dvb-ttusb-budget: don't use stack for USB transfers
Date:   Wed,  2 Sep 2020 18:10:24 +0200
Message-Id: <214db6f0cc80506ac2ade13475e1f359ae1ff7b4.1599062230.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599062230.git.mchehab+huawei@kernel.org>
References: <cover.1599062230.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As reported by smatch:

    drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:311 ttusb_boot_dsp() error: doing dma on the stack (b)
    drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:321 ttusb_boot_dsp() error: doing dma on the stack (b)
    drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:330 ttusb_boot_dsp() error: doing dma on the stack (b)
    drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:351 ttusb_set_channel() error: doing dma on the stack (b)
    drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:361 ttusb_del_channel() error: doing dma on the stack (b)
    drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:412 ttusb_init_controller() error: doing dma on the stack (b0)
    drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:416 ttusb_init_controller() error: doing dma on the stack (b1)
    drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:422 ttusb_init_controller() error: doing dma on the stack (b2)
    drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:425 ttusb_init_controller() error: doing dma on the stack (b3)
    drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:430 ttusb_init_controller() error: doing dma on the stack (get_version)

This driver still uses the USB stack for DMA transfers,
which is broken for a long time. I almost dropped this driver,
as there's a high chance that nobody is using it with upstream
Kernels, as we didn't receive any bug reports.

As fixing this won't be hard, I ended opting to fix.

While here, I dropped an ugly hack that implemented read via
a separate function that was just doing a memcpy().

It should be noticed that, during the init phase, there's
a "b4" register that were never initialized, as its buffer
were used just to store the results of "b3" initialization.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/usb/ttusb-budget/dvb-ttusb-budget.c | 83 +++++++------------
 1 file changed, 30 insertions(+), 53 deletions(-)

diff --git a/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c b/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c
index 4e56ff83566b..2582a62184fd 100644
--- a/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c
+++ b/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c
@@ -72,6 +72,9 @@ DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);
 #define TTUSB_REV_2_2	0x22
 #define TTUSB_BUDGET_NAME "ttusb_stc_fw"
 
+#define MAX_SEND	0x28
+#define MAX_RCV		0x20
+
 /*
  *  since we're casting (struct ttusb*) <-> (struct dvb_demux*) around
  *  the dvb_demux field must be the first in struct!!
@@ -119,87 +122,72 @@ struct ttusb {
 	int cc;			/* MuxCounter - will increment on EVERY MUX PACKET */
 	/* (including stuffing. yes. really.) */
 
-	u8 last_result[32];
+	u8 send_buf[MAX_SEND];
+	u8 last_result[MAX_RCV];
 
 	int revision;
 
 	struct dvb_frontend* fe;
 };
 
-/* ugly workaround ... don't know why it's necessary to read */
-/* all result codes. */
-
-static int ttusb_cmd(struct ttusb *ttusb,
-	      const u8 * data, int len, int needresult)
+static int ttusb_cmd(struct ttusb *ttusb, u8 *data, int len, int len_result)
 {
 	int actual_len;
 	int err;
-	int i;
-
-	if (debug >= 3) {
-		printk(KERN_DEBUG ">");
-		for (i = 0; i < len; ++i)
-			printk(KERN_CONT " %02x", data[i]);
-		printk(KERN_CONT "\n");
-	}
 
 	if (mutex_lock_interruptible(&ttusb->semusb) < 0)
 		return -EAGAIN;
 
+	if (debug >= 3)
+		printk(KERN_DEBUG "> %*ph\n", len, data);
+
+	memcpy(data, ttusb->send_buf, len);
+
 	err = usb_bulk_msg(ttusb->dev, ttusb->bulk_out_pipe,
-			   (u8 *) data, len, &actual_len, 1000);
+			   ttusb->send_buf, len, &actual_len, 1000);
 	if (err != 0) {
 		dprintk("%s: usb_bulk_msg(send) failed, err == %i!\n",
 			__func__, err);
-		mutex_unlock(&ttusb->semusb);
-		return err;
+		goto err;
 	}
 	if (actual_len != len) {
+		err = -EIO;
 		dprintk("%s: only wrote %d of %d bytes\n", __func__,
 			actual_len, len);
-		mutex_unlock(&ttusb->semusb);
-		return -1;
+		goto err;
 	}
 
 	err = usb_bulk_msg(ttusb->dev, ttusb->bulk_in_pipe,
-			   ttusb->last_result, 32, &actual_len, 1000);
+			   ttusb->last_result, MAX_RCV, &actual_len, 1000);
 
 	if (err != 0) {
 		printk("%s: failed, receive error %d\n", __func__,
 		       err);
-		mutex_unlock(&ttusb->semusb);
-		return err;
+		goto err;
 	}
 
 	if (debug >= 3) {
 		actual_len = ttusb->last_result[3] + 4;
-		printk(KERN_DEBUG "<");
-		for (i = 0; i < actual_len; ++i)
-			printk(KERN_CONT " %02x", ttusb->last_result[i]);
-		printk(KERN_CONT "\n");
+		printk(KERN_DEBUG "< %*ph\n", actual_len, ttusb->last_result);
 	}
 
-	if (!needresult)
-		mutex_unlock(&ttusb->semusb);
-	return 0;
-}
+	if (len_result)
+		memcpy(ttusb->send_buf, ttusb->last_result, len_result);
 
-static int ttusb_result(struct ttusb *ttusb, u8 * data, int len)
-{
-	memcpy(data, ttusb->last_result, len);
+err:
 	mutex_unlock(&ttusb->semusb);
-	return 0;
+	return err;
 }
 
 static int ttusb_i2c_msg(struct ttusb *ttusb,
 		  u8 addr, u8 * snd_buf, u8 snd_len, u8 * rcv_buf,
 		  u8 rcv_len)
 {
-	u8 b[0x28];
+	u8 b[MAX_SEND];
 	u8 id = ++ttusb->c;
 	int i, err;
 
-	if (snd_len > 0x28 - 7 || rcv_len > 0x20 - 7)
+	if (snd_len > MAX_SEND - 7 || rcv_len > MAX_RCV - 7)
 		return -EINVAL;
 
 	b[0] = 0xaa;
@@ -213,13 +201,11 @@ static int ttusb_i2c_msg(struct ttusb *ttusb,
 	for (i = 0; i < snd_len; i++)
 		b[7 + i] = snd_buf[i];
 
-	err = ttusb_cmd(ttusb, b, snd_len + 7, 1);
+	err = ttusb_cmd(ttusb, b, snd_len + 7, MAX_RCV);
 
 	if (err)
 		return -EREMOTEIO;
 
-	err = ttusb_result(ttusb, b, 0x20);
-
 	/* check if the i2c transaction was successful */
 	if ((snd_len != b[5]) || (rcv_len != b[6])) return -EREMOTEIO;
 
@@ -400,8 +386,6 @@ static int ttusb_init_controller(struct ttusb *ttusb)
 	/* i2c write read: 5 bytes, addr 0x10, 0x02 bytes write, 1 bytes read. */
 	u8 b3[] =
 	    { 0xaa, ++ttusb->c, 0x31, 5, 0x10, 0x02, 0x01, 0x00, 0x1e };
-	u8 b4[] =
-	    { 0x55, ttusb->c, 0x31, 4, 0x10, 0x02, 0x01, 0x00, 0x1e };
 
 	u8 get_version[] = { 0xaa, ++ttusb->c, 0x17, 5, 0, 0, 0, 0, 0 };
 	u8 get_dsp_version[0x20] =
@@ -422,15 +406,11 @@ static int ttusb_init_controller(struct ttusb *ttusb)
 	if ((err = ttusb_cmd(ttusb, b2, sizeof(b2), 0)))
 		return err;
 
-	if ((err = ttusb_cmd(ttusb, b3, sizeof(b3), 1)))
+	if ((err = ttusb_cmd(ttusb, b3, sizeof(b3), 0)))
 		return err;
 
-	err = ttusb_result(ttusb, b4, sizeof(b4));
-
-	if ((err = ttusb_cmd(ttusb, get_version, sizeof(get_version), 1)))
-		return err;
-
-	if ((err = ttusb_result(ttusb, get_version, sizeof(get_version))))
+	if ((err = ttusb_cmd(ttusb, get_version,
+			     sizeof(get_version), sizeof(get_version))))
 		return err;
 
 	dprintk("%s: stc-version: %c%c%c%c%c\n", __func__,
@@ -451,14 +431,11 @@ static int ttusb_init_controller(struct ttusb *ttusb)
 			   (get_version[8] - '0');
 
 	err =
-	    ttusb_cmd(ttusb, get_dsp_version, sizeof(get_dsp_version), 1);
+	    ttusb_cmd(ttusb, get_dsp_version,
+		      sizeof(get_dsp_version), sizeof(get_dsp_version));
 	if (err)
 		return err;
 
-	err =
-	    ttusb_result(ttusb, get_dsp_version, sizeof(get_dsp_version));
-	if (err)
-		return err;
 	printk("%s: dsp-version: %c%c%c\n", __func__,
 	       get_dsp_version[4], get_dsp_version[5], get_dsp_version[6]);
 	return 0;
-- 
2.26.2

