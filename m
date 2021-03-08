Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85379330D39
	for <lists+linux-media@lfdr.de>; Mon,  8 Mar 2021 13:20:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbhCHMTr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Mar 2021 07:19:47 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:13072 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbhCHMTZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Mar 2021 07:19:25 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DvHQX5TN7zMkVB;
        Mon,  8 Mar 2021 20:17:08 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Mon, 8 Mar 2021 20:19:12 +0800
From:   'Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>, Antti Palosaari <crope@iki.fi>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Brad Love <brad@nextdimension.cc>
CC:     <linux-media@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        "Hulk Robot" <hulkci@huawei.com>
Subject: [PATCH -next] media: m88ds3103: fix return value check in m88ds3103_probe()
Date:   Mon, 8 Mar 2021 12:28:02 +0000
Message-ID: <20210308122802.2112645-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

In case of error, the function i2c_new_dummy_device() returns
ERR_PTR() and never returns NULL. The NULL test in the return
value check should be replaced with IS_ERR().

Fixes: e6089feca460 ("media: m88ds3103: Add support for ds3103b demod")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/media/dvb-frontends/m88ds3103.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/m88ds3103.c b/drivers/media/dvb-frontends/m88ds3103.c
index cfa4cdde99d8..02e8aa11e36e 100644
--- a/drivers/media/dvb-frontends/m88ds3103.c
+++ b/drivers/media/dvb-frontends/m88ds3103.c
@@ -1904,8 +1904,8 @@ static int m88ds3103_probe(struct i2c_client *client,
 
 		dev->dt_client = i2c_new_dummy_device(client->adapter,
 						      dev->dt_addr);
-		if (!dev->dt_client) {
-			ret = -ENODEV;
+		if (IS_ERR(dev->dt_client)) {
+			ret = PTR_ERR(dev->dt_client);
 			goto err_kfree;
 		}
 	}

