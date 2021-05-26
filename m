Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 355173911A9
	for <lists+linux-media@lfdr.de>; Wed, 26 May 2021 09:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232053AbhEZH5q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 03:57:46 -0400
Received: from m12-12.163.com ([220.181.12.12]:36656 "EHLO m12-12.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229473AbhEZH5q (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 03:57:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=uZvhg
        Ud0lWZ9cGLKzmaG9kFpDxY0t10Ac6P5wff8Zfs=; b=N6uj8UxySb5y5QgGO81Ad
        YjLAsMs9Ndn/HY4yvVSw2yksAjBV8dtrktUsTGGiPcg0nFtYy7D53F3Q9jGAHiCO
        TgpqWB1RJ6LqmRmV7XNTGICD3YjPdHP3Xa1N2t/H7xYlpG1ztlydpKXmXWgUmGUP
        nx084Ox0VG8V1bGGPxOb1o=
Received: from ubuntu.localdomain (unknown [218.17.89.92])
        by smtp8 (Coremail) with SMTP id DMCowADnvC33_q1gv10qGQ--.3405S2;
        Wed, 26 May 2021 15:55:36 +0800 (CST)
From:   13145886936@163.com
To:     mchehab@kernel.org, sean@mess.org, arnd@arndb.de,
        miaoqinglang@huawei.com, Julia.Lawall@inria.fr,
        gustavoars@kernel.org, oneukum@suse.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        gushengxian <gushengxian@yulong.com>
Subject: [PATCH] media: b2c2-flexcop-usb: revised use of space
Date:   Wed, 26 May 2021 00:55:27 -0700
Message-Id: <20210526075527.302903-1-13145886936@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMCowADnvC33_q1gv10qGQ--.3405S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuF4xZFWkAw13WF4fXr45GFg_yoW5GF4kpF
        Zav3yqyrWUJF4a93sFy3Wku3W7tFZ7KFWrKrW2k3WFgr4fC3WDZa4rG3Wvyry8JFy8u34r
        CrWUXF17Wr4UW37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07b5sqAUUUUU=
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: 5zrdx5xxdq6xppld0qqrwthudrp/1tbiQhieg1aD-CezFQAAsv
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: gushengxian <gushengxian@yulong.com>

The use of space should be standard.

Signed-off-by: gushengxian <gushengxian@yulong.com>
---
 drivers/media/usb/b2c2/flexcop-usb.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/usb/b2c2/flexcop-usb.c b/drivers/media/usb/b2c2/flexcop-usb.c
index 5d38171b7638..ef5d50b8a321 100644
--- a/drivers/media/usb/b2c2/flexcop-usb.c
+++ b/drivers/media/usb/b2c2/flexcop-usb.c
@@ -171,7 +171,7 @@ static int flexcop_usb_v8_memory_req(struct flexcop_usb *fc_usb,
 	return ret;
 }
 
-#define bytes_left_to_read_on_page(paddr,buflen) \
+#define bytes_left_to_read_on_page(paddr, buflen) \
 	((V8_MEMORY_PAGE_SIZE - (paddr & V8_MEMORY_PAGE_MASK)) > buflen \
 	 ? buflen : (V8_MEMORY_PAGE_SIZE - (paddr & V8_MEMORY_PAGE_MASK)))
 
@@ -179,11 +179,11 @@ static int flexcop_usb_memory_req(struct flexcop_usb *fc_usb,
 		flexcop_usb_request_t req, flexcop_usb_mem_page_t page_start,
 		u32 addr, int extended, u8 *buf, u32 len)
 {
-	int i,ret = 0;
+	int i, ret = 0;
 	u16 wMax;
 	u32 pagechunk = 0;
 
-	switch(req) {
+	switch (req) {
 	case B2C2_USB_READ_V8_MEM:
 		wMax = USB_MEM_READ_MAX;
 		break;
@@ -341,8 +341,8 @@ static void flexcop_usb_process_frame(struct flexcop_usb *fc_usb,
 		b = fc_usb->tmp_buffer;
 		l = fc_usb->tmp_buffer_length;
 	} else {
-		b=buffer;
-		l=buffer_length;
+		b = buffer;
+		l = buffer_length;
 	}
 
 	while (l >= 190) {
@@ -368,7 +368,7 @@ static void flexcop_usb_process_frame(struct flexcop_usb *fc_usb,
 		}
 	}
 
-	if (l>0)
+	if (l > 0)
 		memcpy(fc_usb->tmp_buffer, b, l);
 	fc_usb->tmp_buffer_length = l;
 }
@@ -399,7 +399,7 @@ static void flexcop_usb_urb_complete(struct urb *urb)
 		urb->iso_frame_desc[i].status = 0;
 		urb->iso_frame_desc[i].actual_length = 0;
 	}
-	usb_submit_urb(urb,GFP_ATOMIC);
+	usb_submit_urb(urb, GFP_ATOMIC);
 }
 
 static int flexcop_usb_stream_control(struct flexcop_device *fc, int onoff)
@@ -413,7 +413,7 @@ static void flexcop_usb_transfer_exit(struct flexcop_usb *fc_usb)
 	int i;
 	for (i = 0; i < B2C2_USB_NUM_ISO_URB; i++)
 		if (fc_usb->iso_urb[i] != NULL) {
-			deb_ts("unlinking/killing urb no. %d\n",i);
+			deb_ts("unlinking/killing urb no. %d\n", i);
 			usb_kill_urb(fc_usb->iso_urb[i]);
 			usb_free_urb(fc_usb->iso_urb[i]);
 		}
@@ -483,7 +483,7 @@ static int flexcop_usb_transfer_init(struct flexcop_usb *fc_usb)
 			err("submitting urb %d failed with %d.", i, ret);
 			goto urb_error;
 		}
-		deb_ts("submitted urb no. %d.\n",i);
+		deb_ts("submitted urb no. %d.\n", i);
 	}
 
 	/* SRAM */
-- 
2.25.1


