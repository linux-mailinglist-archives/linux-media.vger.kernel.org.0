Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCD8D453EC9
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 04:07:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231303AbhKQDKQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 22:10:16 -0500
Received: from smtpbg703.qq.com ([203.205.195.89]:55318 "EHLO
        smtpproxy21.qq.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S230442AbhKQDKP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 22:10:15 -0500
X-QQ-mid: bizesmtp45t1637118419tjhgm2pv
Received: from localhost.localdomain (unknown [124.126.19.250])
        by esmtp6.qq.com (ESMTP) with 
        id ; Wed, 17 Nov 2021 11:06:58 +0800 (CST)
X-QQ-SSF: 01400000002000B0G000B00A0000000
X-QQ-FEAT: 3PKW8dpHG1uxsM0STKbxz3PvRuJYsjCOYrW7FJkPsypT4SmoJ74mrkloWIU5W
        Py3+85MlgYGphqtZ0odHuXtprpjoIbpzDa7ia2ET8OMOlBbBF+ieDOymuq6bmLDUnc2MKM9
        lAYs8GMDwinUpzqoI7eycGH+9O6f6hA1hhh7ixuT+1KSz2alJXRLA/nu2mOlL20WR9GE/Ho
        E1CVfKx7Yf7rTXFSCIuqL4Wpn03LJjEhI1ZmqeeHyBs0+2shjV0O3R0YGnI6HpwI8cH6Sdu
        XdgQ7pEw/n52ldJZ4DBQGF9VDbTEef4npxDGKufqMxIez2ymv6UTgLu9aVb01iyDI74cqoY
        Fv66eW9L8I0eFawRrD6xDeabzONAjvbqEL5SA60F4SDpW7G898=
X-QQ-GoodBg: 2
From:   zhaoxiao <zhaoxiao@uniontech.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhaoxiao <zhaoxiao@uniontech.com>
Subject: [PATCH] media: dib9000: Fix the warning by min()
Date:   Wed, 17 Nov 2021 11:06:56 +0800
Message-Id: <20211117030656.14984-1-zhaoxiao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix following coccicheck warning:
drivers/media/dvb-frontends/dib9000.c:261:10-11: WARNING opportunity for min()
drivers/media/dvb-frontends/dib9000.c:345:10-11: WARNING opportunity for min()

Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
---
 drivers/media/dvb-frontends/dib9000.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/dib9000.c b/drivers/media/dvb-frontends/dib9000.c
index 04d92d614279..914ca820c174 100644
--- a/drivers/media/dvb-frontends/dib9000.c
+++ b/drivers/media/dvb-frontends/dib9000.c
@@ -258,7 +258,7 @@ static int dib9000_read16_attr(struct dib9000_state *state, u16 reg, u8 *b, u32
 		state->i2c_write_buffer[0] |= (1 << 4);
 
 	do {
-		l = len < chunk_size ? len : chunk_size;
+		l = min(len, chunk_size);
 		state->msg[1].len = l;
 		state->msg[1].buf = b;
 		ret = i2c_transfer(state->i2c.i2c_adap, state->msg, 2) != 2 ? -EREMOTEIO : 0;
@@ -342,7 +342,7 @@ static int dib9000_write16_attr(struct dib9000_state *state, u16 reg, const u8 *
 		state->i2c_write_buffer[0] |= (1 << 4);
 
 	do {
-		l = len < chunk_size ? len : chunk_size;
+		l = min(len, chunk_size);
 		state->msg[0].len = l + 2;
 		memcpy(&state->i2c_write_buffer[2], buf, l);
 
-- 
2.20.1



