Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF0EE225670
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 06:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbgGTEN5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 00:13:57 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:47528 "EHLO cstnet.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725263AbgGTEN4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 00:13:56 -0400
Received: from localhost (unknown [159.226.5.99])
        by APP-01 (Coremail) with SMTP id qwCowACXi9j2GRVfckTkAQ--.24694S2;
        Mon, 20 Jul 2020 12:13:43 +0800 (CST)
From:   Xu Wang <vulab@iscas.ac.cn>
To:     mchehab@kernel.org, sean@mess.org, vulab@iscas.ac.cn,
        oneukum@suse.com, yangyingliang@huawei.com, johan@kernel.org,
        colin.king@canonical.com, linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH] media: b2bc: remove needless check before usb_free_coherent()
Date:   Mon, 20 Jul 2020 04:13:41 +0000
Message-Id: <20200720041341.7506-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: qwCowACXi9j2GRVfckTkAQ--.24694S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKFWrZw4UGr47GFWfKryfZwb_yoWftrg_XF
        Z3urnrXF1DWF15Kr1UK3yFyryq9ayxWr1kXF4ayFZ5GF1Iyw1Yvr9FywsrJr1DCFZ8XFW8
        W3s8JF48Aw40kjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbaxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
        1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUtVWrXwAv7VCY1x0262k0Y48FwI0_Jr0_Gr1lYx0Ex4A2jsIE14
        v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67II
        x4CEVc8vx2IErcIFxwCY02Avz4vE14v_Gryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
        0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
        zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
        4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j
        6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
        BIdaVFxhVjvjDU0xZFpf9x0JU4T5dUUUUU=
X-Originating-IP: [159.226.5.99]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCAEDA18J9gI5SQABsa
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

usb_free_coherent() is safe with NULL addr and this check is
not required.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 drivers/media/usb/b2c2/flexcop-usb.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/usb/b2c2/flexcop-usb.c b/drivers/media/usb/b2c2/flexcop-usb.c
index 198ddfb8d2b1..c2cf1927c814 100644
--- a/drivers/media/usb/b2c2/flexcop-usb.c
+++ b/drivers/media/usb/b2c2/flexcop-usb.c
@@ -419,10 +419,7 @@ static void flexcop_usb_transfer_exit(struct flexcop_usb *fc_usb)
 			usb_free_urb(fc_usb->iso_urb[i]);
 		}
 
-	if (fc_usb->iso_buffer != NULL)
-		usb_free_coherent(fc_usb->udev,
-			fc_usb->buffer_size, fc_usb->iso_buffer,
-			fc_usb->dma_addr);
+	usb_free_coherent(fc_usb->udev, fc_usb->buffer_size, fc_usb->iso_buffer, fc_usb->dma_addr);
 }
 
 static int flexcop_usb_transfer_init(struct flexcop_usb *fc_usb)
-- 
2.17.1

