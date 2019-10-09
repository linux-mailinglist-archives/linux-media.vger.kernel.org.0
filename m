Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33B03D11DF
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 16:59:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731452AbfJIO7Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 10:59:16 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3286 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730955AbfJIO7O (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Oct 2019 10:59:14 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 25AF3D43A3EF4571F92A;
        Wed,  9 Oct 2019 22:59:11 +0800 (CST)
Received: from linux-ibm.site (10.175.102.37) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Wed, 9 Oct 2019 22:59:04 +0800
From:   zhong jiang <zhongjiang@huawei.com>
To:     <mchehab@kernel.org>, <sean@mess.org>, <hansverk@cisco.com>,
        <daniel.vetter@ffwll.ch>
CC:     <linux-media@vger.kernel.org>, <zhongjiang@huawei.com>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/4] media: dvb-frontends: Use DIV_ROUND_CLOSEST directly to make it readable
Date:   Wed, 9 Oct 2019 22:55:22 +0800
Message-ID: <1570632925-14926-2-git-send-email-zhongjiang@huawei.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <1570632925-14926-1-git-send-email-zhongjiang@huawei.com>
References: <1570632925-14926-1-git-send-email-zhongjiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.102.37]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The kernel.h macro DIV_ROUND_CLOSEST performs the computation (x + d/2)/d
but is perhaps more readable.

Signed-off-by: zhong jiang <zhongjiang@huawei.com>
---
 drivers/media/dvb-frontends/mt312.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/media/dvb-frontends/mt312.c b/drivers/media/dvb-frontends/mt312.c
index 7cae7d6..5c4090c 100644
--- a/drivers/media/dvb-frontends/mt312.c
+++ b/drivers/media/dvb-frontends/mt312.c
@@ -135,11 +135,6 @@ static inline int mt312_writereg(struct mt312_state *state,
 	return mt312_write(state, reg, &tmp, 1);
 }
 
-static inline u32 mt312_div(u32 a, u32 b)
-{
-	return (a + (b / 2)) / b;
-}
-
 static int mt312_reset(struct mt312_state *state, const u8 full)
 {
 	return mt312_writereg(state, RESET, full ? 0x80 : 0x40);
@@ -187,7 +182,7 @@ static int mt312_get_symbol_rate(struct mt312_state *state, u32 *sr)
 		monitor = (buf[0] << 8) | buf[1];
 
 		dprintk("sr(auto) = %u\n",
-		       mt312_div(monitor * 15625, 4));
+			DIV_ROUND_CLOSEST(monitor * 15625, 4));
 	} else {
 		ret = mt312_writereg(state, MON_CTRL, 0x05);
 		if (ret < 0)
@@ -291,10 +286,11 @@ static int mt312_initfe(struct dvb_frontend *fe)
 	}
 
 	/* SYS_CLK */
-	buf[0] = mt312_div(state->xtal * state->freq_mult * 2, 1000000);
+	buf[0] = DIV_ROUND_CLOSEST(state->xtal *
+				state->freq_mult * 2, 1000000);
 
 	/* DISEQC_RATIO */
-	buf[1] = mt312_div(state->xtal, 22000 * 4);
+	buf[1] = DIV_ROUND_CLOSEST(state->xtal, 22000 * 4);
 
 	ret = mt312_write(state, SYS_CLK, buf, sizeof(buf));
 	if (ret < 0)
@@ -610,7 +606,7 @@ static int mt312_set_frontend(struct dvb_frontend *fe)
 	}
 
 	/* sr = (u16)(sr * 256.0 / 1000000.0) */
-	sr = mt312_div(p->symbol_rate * 4, 15625);
+	sr = DIV_ROUND_CLOSEST(p->symbol_rate * 4, 15625);
 
 	/* SYM_RATE */
 	buf[0] = (sr >> 8) & 0x3f;
-- 
1.7.12.4

