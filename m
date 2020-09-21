Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11E4E272503
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 15:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727308AbgIUNNJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 09:13:09 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:13803 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727317AbgIUNK0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 09:10:26 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 9545376C8ACC50B6BD60;
        Mon, 21 Sep 2020 21:10:23 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Mon, 21 Sep 2020 21:10:12 +0800
From:   Qinglang Miao <miaoqinglang@huawei.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Qinglang Miao" <miaoqinglang@huawei.com>
Subject: [PATCH -next] media: ngene: simplify the return expression of eeprom_write_ushort()
Date:   Mon, 21 Sep 2020 21:10:37 +0800
Message-ID: <20200921131037.92158-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplify the return expression.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/media/pci/ngene/ngene-cards.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/pci/ngene/ngene-cards.c b/drivers/media/pci/ngene/ngene-cards.c
index 8bfb3d8ea..7dbc21e1a 100644
--- a/drivers/media/pci/ngene/ngene-cards.c
+++ b/drivers/media/pci/ngene/ngene-cards.c
@@ -934,15 +934,11 @@ static int eeprom_read_ushort(struct i2c_adapter *adapter, u16 tag, u16 *data)
 
 static int eeprom_write_ushort(struct i2c_adapter *adapter, u16 tag, u16 data)
 {
-	int stat;
 	u8 buf[2];
 
 	buf[0] = data >> 8;
 	buf[1] = data & 0xff;
-	stat = WriteEEProm(adapter, tag, 2, buf);
-	if (stat)
-		return stat;
-	return 0;
+	return WriteEEProm(adapter, tag, 2, buf);
 }
 
 static s16 osc_deviation(void *priv, s16 deviation, int flag)
-- 
2.23.0

