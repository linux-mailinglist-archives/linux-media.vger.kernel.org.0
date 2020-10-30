Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B43629FA96
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 02:29:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgJ3B2r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 21:28:47 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:6669 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbgJ3B2q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 21:28:46 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CMl7v207Bz15N5L;
        Fri, 30 Oct 2020 09:28:43 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Fri, 30 Oct 2020 09:28:34 +0800
From:   Qinglang Miao <miaoqinglang@huawei.com>
To:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Qinglang Miao" <miaoqinglang@huawei.com>
Subject: [PATCH] media: usb: dvb-usb-v2: zd1301: fix missing platform_device_unregister()
Date:   Fri, 30 Oct 2020 09:34:25 +0800
Message-ID: <20201030013425.54041-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the missing platform_device_unregister() before return
from zd1301_frontend_attach in the error handling case when
pdev->dev.driver is empty.

There's an error handling route named err_platform_device_unregister
, so just reuse it.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/media/usb/dvb-usb-v2/zd1301.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb-v2/zd1301.c b/drivers/media/usb/dvb-usb-v2/zd1301.c
index ba2c1b0d3..72aa6a9a9 100644
--- a/drivers/media/usb/dvb-usb-v2/zd1301.c
+++ b/drivers/media/usb/dvb-usb-v2/zd1301.c
@@ -150,7 +150,7 @@ static int zd1301_frontend_attach(struct dvb_usb_adapter *adap)
 	}
 	if (!pdev->dev.driver) {
 		ret = -ENODEV;
-		goto err;
+		goto err_platform_device_unregister;
 	}
 	if (!try_module_get(pdev->dev.driver->owner)) {
 		ret = -ENODEV;
-- 
2.23.0

