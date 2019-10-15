Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC85D80C5
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 22:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733083AbfJOUNW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 16:13:22 -0400
Received: from valentin-vidic.from.hr ([94.229.67.141]:39569 "EHLO
        valentin-vidic.from.hr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727962AbfJOUNW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 16:13:22 -0400
X-Greylist: delayed 595 seconds by postgrey-1.27 at vger.kernel.org; Tue, 15 Oct 2019 16:13:20 EDT
X-Virus-Scanned: Debian amavisd-new at valentin-vidic.from.hr
Received: by valentin-vidic.from.hr (Postfix, from userid 1000)
        id E1BD43BE3; Tue, 15 Oct 2019 22:03:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
        d=valentin-vidic.from.hr; s=2017; t=1571169799;
        bh=GNW9Czf7yHedMIXjsdbi4/E3nPQNjtWoitMkwGeBl9o=;
        h=From:To:Cc:Subject:Date:From;
        b=c12IzmZmgL7MloSQbPKwaAOioP7OdqFUXrG5GDqBdtCwrldWW16CM/pwvc5c6c+gg
         PLr1D50uYht8OOtNyvEqwgQmUxP+4b/+/BgXknXLwhDuTiEABD56QegzysCZLaQr5A
         b8GfT5MmW1/7Jl84JQr2sHtcQPIO9RFuR+OZNv0oo7PJ7WV6wpBBZtdlOgaPfJvcW1
         YM6zf9nJAsNahA2mq1A99Y7XiDq0W53/xYG3q3l/Ci3n9DKBO7B/kRa4IHT+R6hW5y
         G98M8fb6qVw1pb+CfEbCBPZNLQsO5dYB8uHL4K1qsf5W4R5p2t6HUr2YUlNanmPJyb
         Bp6ekw0Xnc7aw==
From:   Valentin Vidic <vvidic@valentin-vidic.from.hr>
To:     Michael Krufky <mkrufky@linuxtv.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Valentin Vidic <vvidic@valentin-vidic.from.hr>,
        syzbot+98730b985cad4931a552@syzkaller.appspotmail.com
Subject: [PATCH] media: cxusb: fix uninitialized local variable
Date:   Tue, 15 Oct 2019 22:03:15 +0200
Message-Id: <20191015200315.28830-1-vvidic@valentin-vidic.from.hr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make sure ircode does not contain random values if the call to
cxusb_ctrl_msg fails for some reason.

Reported-by: syzbot+98730b985cad4931a552@syzkaller.appspotmail.com
Signed-off-by: Valentin Vidic <vvidic@valentin-vidic.from.hr>
---
 drivers/media/usb/dvb-usb/cxusb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/cxusb.c b/drivers/media/usb/dvb-usb/cxusb.c
index f02fa0a67aa4..afcd88dd96c0 100644
--- a/drivers/media/usb/dvb-usb/cxusb.c
+++ b/drivers/media/usb/dvb-usb/cxusb.c
@@ -519,7 +519,7 @@ static int cxusb_d680_dmb_streaming_ctrl(struct dvb_usb_adapter *adap,
 
 static int cxusb_rc_query(struct dvb_usb_device *d)
 {
-	u8 ircode[4];
+	u8 ircode[4] = { 0 };
 
 	cxusb_ctrl_msg(d, CMD_GET_IR_CODE, NULL, 0, ircode, 4);
 
@@ -531,7 +531,7 @@ static int cxusb_rc_query(struct dvb_usb_device *d)
 
 static int cxusb_bluebird2_rc_query(struct dvb_usb_device *d)
 {
-	u8 ircode[4];
+	u8 ircode[4] = { 0 };
 	struct i2c_msg msg = {
 		.addr = 0x6b,
 		.flags = I2C_M_RD,
@@ -550,7 +550,7 @@ static int cxusb_bluebird2_rc_query(struct dvb_usb_device *d)
 
 static int cxusb_d680_dmb_rc_query(struct dvb_usb_device *d)
 {
-	u8 ircode[2];
+	u8 ircode[2] = { 0 };
 
 	if (cxusb_ctrl_msg(d, 0x10, NULL, 0, ircode, 2) < 0)
 		return 0;
@@ -989,7 +989,7 @@ static int cxusb_dee1601_frontend_attach(struct dvb_usb_adapter *adap)
 
 static int cxusb_dualdig4_frontend_attach(struct dvb_usb_adapter *adap)
 {
-	u8 ircode[4];
+	u8 ircode[4] = { 0 };
 	int i;
 	struct i2c_msg msg = {
 		.addr = 0x6b,
-- 
2.20.1

