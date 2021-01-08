Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43D022EEF86
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 10:25:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728121AbhAHJY3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 04:24:29 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:10120 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727416AbhAHJY3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 04:24:29 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DByLf2NRzz15qrL;
        Fri,  8 Jan 2021 17:22:50 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Fri, 8 Jan 2021 17:23:40 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH v2 -next] media: dvbsky: convert comma to semicolon
Date:   Fri, 8 Jan 2021 17:24:24 +0800
Message-ID: <20210108092424.19419-1-zhengyongjun3@huawei.com>
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
 drivers/media/usb/dvb-usb-v2/dvbsky.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/dvbsky.c b/drivers/media/usb/dvb-usb-v2/dvbsky.c
index 0d9657f7f29d..689829f1b52a 100644
--- a/drivers/media/usb/dvb-usb-v2/dvbsky.c
+++ b/drivers/media/usb/dvb-usb-v2/dvbsky.c
@@ -287,8 +287,8 @@ static int dvbsky_s960_attach(struct dvb_usb_adapter *adap)
 	m88ds3103_pdata.ts_clk = 16000;
 	m88ds3103_pdata.ts_clk_pol = 0;
 	m88ds3103_pdata.agc = 0x99;
-	m88ds3103_pdata.lnb_hv_pol = 1,
-	m88ds3103_pdata.lnb_en_pol = 1,
+	m88ds3103_pdata.lnb_hv_pol = 1;
+	m88ds3103_pdata.lnb_en_pol = 1;
 
 	state->i2c_client_demod = dvb_module_probe("m88ds3103", NULL,
 						   &d->i2c_adap,
@@ -383,15 +383,15 @@ static int dvbsky_s960c_attach(struct dvb_usb_adapter *adap)
 	struct sp2_config sp2_config = {};
 
 	/* attach demod */
-	m88ds3103_pdata.clk = 27000000,
-	m88ds3103_pdata.i2c_wr_max = 33,
-	m88ds3103_pdata.clk_out = 0,
-	m88ds3103_pdata.ts_mode = M88DS3103_TS_CI,
-	m88ds3103_pdata.ts_clk = 10000,
-	m88ds3103_pdata.ts_clk_pol = 1,
-	m88ds3103_pdata.agc = 0x99,
-	m88ds3103_pdata.lnb_hv_pol = 0,
-	m88ds3103_pdata.lnb_en_pol = 1,
+	m88ds3103_pdata.clk = 27000000;
+	m88ds3103_pdata.i2c_wr_max = 33;
+	m88ds3103_pdata.clk_out = 0;
+	m88ds3103_pdata.ts_mode = M88DS3103_TS_CI;
+	m88ds3103_pdata.ts_clk = 10000;
+	m88ds3103_pdata.ts_clk_pol = 1;
+	m88ds3103_pdata.agc = 0x99;
+	m88ds3103_pdata.lnb_hv_pol = 0;
+	m88ds3103_pdata.lnb_en_pol = 1;
 
 	state->i2c_client_demod = dvb_module_probe("m88ds3103", NULL,
 						   &d->i2c_adap,
-- 
2.22.0

