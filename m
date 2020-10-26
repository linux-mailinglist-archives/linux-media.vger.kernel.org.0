Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40C05298E0F
	for <lists+linux-media@lfdr.de>; Mon, 26 Oct 2020 14:35:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1780193AbgJZNft (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 09:35:49 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3126 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1775549AbgJZNft (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 09:35:49 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CKbSk2Tm2zLpHK;
        Mon, 26 Oct 2020 21:35:50 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Mon, 26 Oct 2020
 21:35:45 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>
Subject: [PATCH -next] [media] dvb: si21xx: Discard unnecessary breaks
Date:   Mon, 26 Oct 2020 21:46:27 +0800
Message-ID: <20201026134627.12173-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The 'break' is unnecessary because of previous
'return', discard it.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/media/dvb-frontends/si21xx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/si21xx.c b/drivers/media/dvb-frontends/si21xx.c
index a116eff417f2..e31eb2c5cc4c 100644
--- a/drivers/media/dvb-frontends/si21xx.c
+++ b/drivers/media/dvb-frontends/si21xx.c
@@ -464,10 +464,8 @@ static int si21xx_set_voltage(struct dvb_frontend *fe, enum fe_sec_voltage volt)
 	switch (volt) {
 	case SEC_VOLTAGE_18:
 		return si21_writereg(state, LNB_CTRL_REG_1, val | 0x40);
-		break;
 	case SEC_VOLTAGE_13:
 		return si21_writereg(state, LNB_CTRL_REG_1, (val & ~0x40));
-		break;
 	default:
 		return -EINVAL;
 	}
-- 
2.17.1

