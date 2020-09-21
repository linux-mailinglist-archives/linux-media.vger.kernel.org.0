Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24792271CFA
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 10:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbgIUIDV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 04:03:21 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:13786 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726334AbgIUIC0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 04:02:26 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id B541EF959A893D63AD73;
        Mon, 21 Sep 2020 16:02:24 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Mon, 21 Sep 2020
 16:02:14 +0800
From:   Liu Shixin <liushixin2@huawei.com>
To:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Liu Shixin <liushixin2@huawei.com>
Subject: [PATCH -next] media: anysee: simplify the return expression of anysee_ci_* function
Date:   Mon, 21 Sep 2020 16:24:38 +0800
Message-ID: <20200921082438.2591513-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplify the return expression.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/media/usb/dvb-usb-v2/anysee.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/anysee.c b/drivers/media/usb/dvb-usb-v2/anysee.c
index 89a1b204b90c..aa45b5d263f6 100644
--- a/drivers/media/usb/dvb-usb-v2/anysee.c
+++ b/drivers/media/usb/dvb-usb-v2/anysee.c
@@ -1171,14 +1171,9 @@ static int anysee_ci_write_attribute_mem(struct dvb_ca_en50221 *ci, int slot,
 	int addr, u8 val)
 {
 	struct dvb_usb_device *d = ci->data;
-	int ret;
 	u8 buf[] = {CMD_CI, 0x03, 0x40 | addr >> 8, addr & 0xff, 0x00, 1, val};
 
-	ret = anysee_ctrl_msg(d, buf, sizeof(buf), NULL, 0);
-	if (ret)
-		return ret;
-
-	return 0;
+	return anysee_ctrl_msg(d, buf, sizeof(buf), NULL, 0);
 }
 
 static int anysee_ci_read_cam_control(struct dvb_ca_en50221 *ci, int slot,
@@ -1200,14 +1195,9 @@ static int anysee_ci_write_cam_control(struct dvb_ca_en50221 *ci, int slot,
 	u8 addr, u8 val)
 {
 	struct dvb_usb_device *d = ci->data;
-	int ret;
 	u8 buf[] = {CMD_CI, 0x05, 0x40, addr, 0x00, 1, val};
 
-	ret = anysee_ctrl_msg(d, buf, sizeof(buf), NULL, 0);
-	if (ret)
-		return ret;
-
-	return 0;
+	return anysee_ctrl_msg(d, buf, sizeof(buf), NULL, 0);
 }
 
 static int anysee_ci_slot_reset(struct dvb_ca_en50221 *ci, int slot)
@@ -1252,13 +1242,8 @@ static int anysee_ci_slot_shutdown(struct dvb_ca_en50221 *ci, int slot)
 static int anysee_ci_slot_ts_enable(struct dvb_ca_en50221 *ci, int slot)
 {
 	struct dvb_usb_device *d = ci->data;
-	int ret;
 
-	ret = anysee_wr_reg_mask(d, REG_IOD, (0 << 1), 0x02);
-	if (ret)
-		return ret;
-
-	return 0;
+	return anysee_wr_reg_mask(d, REG_IOD, (0 << 1), 0x02);
 }
 
 static int anysee_ci_poll_slot_status(struct dvb_ca_en50221 *ci, int slot,
-- 
2.25.1

