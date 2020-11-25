Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD442C363E
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 02:33:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbgKYBbX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 20:31:23 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:7728 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbgKYBbX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 20:31:23 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CgjyQ5jcszkdkj;
        Wed, 25 Nov 2020 09:30:54 +0800 (CST)
Received: from code-website.localdomain (10.175.127.227) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Wed, 25 Nov 2020 09:31:10 +0800
From:   Luo Meng <luomeng12@huawei.com>
To:     <tskd08@gmail.com>, <mchehab@kernel.org>, <luomeng12@huawei.com>,
        <sattnag@aim.com>, <linux-media@vger.kernel.org>
Subject: [PATCH] [media] qm1d1c0042: fix error return code in qm1d1c0042_init()
Date:   Wed, 25 Nov 2020 09:34:37 +0800
Message-ID: <20201125013437.2770811-1-luomeng12@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix to return a negative error code from the error handling case
instead of 0 in function qm1d1c0042_init(), as done elsewhere
in this function.

Fixes: ab4d14528fdf ("[media] em28xx: add support for PLEX PX-BCUD (ISDB-S)")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Luo Meng <luomeng12@huawei.com>
---
 drivers/media/tuners/qm1d1c0042.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/tuners/qm1d1c0042.c b/drivers/media/tuners/qm1d1c0042.c
index 0e26d22f0b26..53aa2558f71e 100644
--- a/drivers/media/tuners/qm1d1c0042.c
+++ b/drivers/media/tuners/qm1d1c0042.c
@@ -343,8 +343,10 @@ static int qm1d1c0042_init(struct dvb_frontend *fe)
 		if (val == reg_initval[reg_index][0x00])
 			break;
 	}
-	if (reg_index >= QM1D1C0042_NUM_REG_ROWS)
+	if (reg_index >= QM1D1C0042_NUM_REG_ROWS) {
+		ret = -EINVAL;
 		goto failed;
+	}
 	memcpy(state->regs, reg_initval[reg_index], QM1D1C0042_NUM_REGS);
 	usleep_range(2000, 3000);
 
-- 
2.25.4

