Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 241D434E83C
	for <lists+linux-media@lfdr.de>; Tue, 30 Mar 2021 15:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231960AbhC3NCC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Mar 2021 09:02:02 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:15108 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232095AbhC3NBj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Mar 2021 09:01:39 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F8qKL0SFHz1BFPK;
        Tue, 30 Mar 2021 20:59:34 +0800 (CST)
Received: from huawei.com (10.175.103.91) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.498.0; Tue, 30 Mar 2021
 21:01:33 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <mchehab@kernel.org>
Subject: [PATCH -next] media: i2c: ov5648: fix wrong pointer passed to IS_ERR() and PTR_ERR()
Date:   Tue, 30 Mar 2021 21:04:46 +0800
Message-ID: <20210330130446.1053644-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

IS_ERR() and PTR_ERR() use wrong pointer, it should be
sensor->dovdd, fix it.

Fixes: e43ccb0a045f ("media: i2c: Add support for the OV5648 image sensor")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/media/i2c/ov5648.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
index dfe38ab8224d..db6f626f92fb 100644
--- a/drivers/media/i2c/ov5648.c
+++ b/drivers/media/i2c/ov5648.c
@@ -2494,9 +2494,9 @@ static int ov5648_probe(struct i2c_client *client)
 
 	/* DOVDD: digital I/O */
 	sensor->dovdd = devm_regulator_get(dev, "dovdd");
-	if (IS_ERR(sensor->dvdd)) {
+	if (IS_ERR(sensor->dovdd)) {
 		dev_err(dev, "cannot get DOVDD (digital I/O) regulator\n");
-		ret = PTR_ERR(sensor->dvdd);
+		ret = PTR_ERR(sensor->dovdd);
 		goto error_endpoint;
 	}
 
-- 
2.25.1

