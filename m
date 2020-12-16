Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3DA92DC12D
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 14:25:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbgLPNYd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 08:24:33 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9623 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726433AbgLPNYd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 08:24:33 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cwwmf23ywz15cT2;
        Wed, 16 Dec 2020 21:23:14 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Wed, 16 Dec 2020 21:23:43 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <isely@pobox.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] usb: pvrusb2: convert comma to semicolon
Date:   Wed, 16 Dec 2020 21:24:16 +0800
Message-ID: <20201216132416.15314-1-zhengyongjun3@huawei.com>
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
 drivers/media/usb/pvrusb2/pvrusb2-devattr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-devattr.c b/drivers/media/usb/pvrusb2/pvrusb2-devattr.c
index 1fcf63218885..d1b984ec757d 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-devattr.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-devattr.c
@@ -594,7 +594,7 @@ static int pvr2_lgdt3306a_attach(struct pvr2_dvb_adapter *adap)
 	lgdt3306a_config.mpeg_mode = LGDT3306A_MPEG_PARALLEL;
 	lgdt3306a_config.tpclk_edge = LGDT3306A_TPCLK_FALLING_EDGE;
 	lgdt3306a_config.tpvalid_polarity = LGDT3306A_TP_VALID_LOW;
-	lgdt3306a_config.xtalMHz = 25, /* demod clock MHz; 24/25 supported */
+	lgdt3306a_config.xtalMHz = 25; /* demod clock MHz; 24/25 supported */
 
 	adap->i2c_client_demod[0] = dvb_module_probe("lgdt3306a", NULL,
 						     &adap->channel.hdw->i2c_adap,
-- 
2.22.0

