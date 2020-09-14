Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5D92684A3
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 08:14:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbgINGOg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 02:14:36 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:12247 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726003AbgINGOg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 02:14:36 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 0147C93470AE4918D371;
        Mon, 14 Sep 2020 14:14:33 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Mon, 14 Sep 2020 14:14:25 +0800
From:   Qinglang Miao <miaoqinglang@huawei.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Qinglang Miao" <miaoqinglang@huawei.com>
Subject: [PATCH] media: flexcop-usb: remove needless check before usb_free_coherent()
Date:   Mon, 14 Sep 2020 14:15:13 +0800
Message-ID: <20200914061513.3512-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

usb_free_coherent() is safe with NULL addr and this check is
not required.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/media/usb/b2c2/flexcop-usb.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/b2c2/flexcop-usb.c b/drivers/media/usb/b2c2/flexcop-usb.c
index 198ddfb8d..12c0b40be 100644
--- a/drivers/media/usb/b2c2/flexcop-usb.c
+++ b/drivers/media/usb/b2c2/flexcop-usb.c
@@ -419,10 +419,9 @@ static void flexcop_usb_transfer_exit(struct flexcop_usb *fc_usb)
 			usb_free_urb(fc_usb->iso_urb[i]);
 		}
 
-	if (fc_usb->iso_buffer != NULL)
-		usb_free_coherent(fc_usb->udev,
-			fc_usb->buffer_size, fc_usb->iso_buffer,
-			fc_usb->dma_addr);
+	usb_free_coherent(fc_usb->udev, fc_usb->buffer_size,
+			  fc_usb->iso_buffer, fc_usb->dma_addr);
+
 }
 
 static int flexcop_usb_transfer_init(struct flexcop_usb *fc_usb)
-- 
2.25.1

