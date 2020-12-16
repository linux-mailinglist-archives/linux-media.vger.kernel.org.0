Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 210802DC131
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 14:26:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbgLPNZn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 08:25:43 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9218 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725879AbgLPNZn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 08:25:43 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cwwnk29LyzkqW3;
        Wed, 16 Dec 2020 21:24:10 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Wed, 16 Dec 2020 21:24:49 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <crope@iki.fi>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] usb: dvb-usb-v2: convert comma to semicolon
Date:   Wed, 16 Dec 2020 21:25:21 +0800
Message-ID: <20201216132521.15423-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace a comma between expression statements by a semicolon.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
index 91460e4d0c30..3952cc534b4a 100644
--- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
+++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
@@ -955,7 +955,7 @@ static int rtl2832u_frontend_attach(struct dvb_usb_adapter *adap)
 			struct mn88472_config mn88472_config = {};
 
 			mn88472_config.fe = &adap->fe[1];
-			mn88472_config.i2c_wr_max = 22,
+			mn88472_config.i2c_wr_max = 22;
 			strscpy(info.type, "mn88472", I2C_NAME_SIZE);
 			mn88472_config.xtal = 20500000;
 			mn88472_config.ts_mode = SERIAL_TS_MODE;
@@ -980,7 +980,7 @@ static int rtl2832u_frontend_attach(struct dvb_usb_adapter *adap)
 			struct mn88473_config mn88473_config = {};
 
 			mn88473_config.fe = &adap->fe[1];
-			mn88473_config.i2c_wr_max = 22,
+			mn88473_config.i2c_wr_max = 22;
 			strscpy(info.type, "mn88473", I2C_NAME_SIZE);
 			info.addr = 0x18;
 			info.platform_data = &mn88473_config;
-- 
2.22.0

