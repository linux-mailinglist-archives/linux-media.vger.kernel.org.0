Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CBE2157E01
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2020 15:58:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727941AbgBJO6r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Feb 2020 09:58:47 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:41419 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727347AbgBJO6r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Feb 2020 09:58:47 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1j1AWK-0002c7-P2; Mon, 10 Feb 2020 14:58:44 +0000
From:   Colin King <colin.king@canonical.com>
To:     Malcolm Priestley <tvboxspy@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: lmedm04: remove redundant assignment to variable gate
Date:   Mon, 10 Feb 2020 14:58:44 +0000
Message-Id: <20200210145844.438478-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable gate is being initialized and also checked and re-assigned
with values that are never read as it is being re-assigned later in a
for-loop with a new value.  The assignments are redundant and can be
removed.

Addresses Coverity ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/dvb-usb-v2/lmedm04.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/lmedm04.c b/drivers/media/usb/dvb-usb-v2/lmedm04.c
index 62d3566bf7ee..fd8b42bb9a84 100644
--- a/drivers/media/usb/dvb-usb-v2/lmedm04.c
+++ b/drivers/media/usb/dvb-usb-v2/lmedm04.c
@@ -486,13 +486,10 @@ static int lme2510_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 	static u8 obuf[64], ibuf[64];
 	int i, read, read_o;
 	u16 len;
-	u8 gate = st->i2c_gate;
+	u8 gate;
 
 	mutex_lock(&d->i2c_mutex);
 
-	if (gate == 0)
-		gate = 5;
-
 	for (i = 0; i < num; i++) {
 		read_o = msg[i].flags & I2C_M_RD;
 		read = i + 1 < num && msg[i + 1].flags & I2C_M_RD;
-- 
2.25.0

