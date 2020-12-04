Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5146D2CE98E
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 09:28:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729051AbgLDI2A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 03:28:00 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:8644 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbgLDI2A (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Dec 2020 03:28:00 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CnQm946M3z15XJb;
        Fri,  4 Dec 2020 16:26:49 +0800 (CST)
Received: from compute.localdomain (10.175.112.70) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Fri, 4 Dec 2020 16:27:10 +0800
From:   Zhang Changzhong <zhangchangzhong@huawei.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     Zhang Changzhong <zhangchangzhong@huawei.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: smiapp: Fix error return code in smiapp_probe()
Date:   Fri, 4 Dec 2020 16:30:44 +0800
Message-ID: <1607070645-32758-1-git-send-email-zhangchangzhong@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.70]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix to return a negative error code from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: de10c1619c48 ("[media] smiapp: Get clock rate if it's not available through DT")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhang Changzhong <zhangchangzhong@huawei.com>
---
 drivers/media/i2c/smiapp/smiapp-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index 6fc0680..45394b9 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -2892,7 +2892,7 @@ static int smiapp_probe(struct i2c_client *client)
 				dev_err(&client->dev,
 					"can't set clock freq, asked for %u but got %lu\n",
 					sensor->hwcfg->ext_clk, rate);
-				return rval;
+				return -EINVAL;
 			}
 		} else {
 			sensor->hwcfg->ext_clk = clk_get_rate(sensor->ext_clk);
-- 
2.9.5

