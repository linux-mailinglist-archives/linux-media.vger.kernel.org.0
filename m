Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A35A5222440
	for <lists+linux-media@lfdr.de>; Thu, 16 Jul 2020 15:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728854AbgGPNtA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 09:49:00 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:7771 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728093AbgGPNs7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 09:48:59 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 444E759714EF947306CC;
        Thu, 16 Jul 2020 21:48:57 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.238) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Thu, 16 Jul 2020
 21:48:47 +0800
Subject: [PATCH -next v2] media: tuners: reduce stack usage in
 mxl5005s_reconfigure
From:   Bixuan Cui <cuibixuan@huawei.com>
To:     <linux-next@vger.kernel.org>, <mchehab@kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <john.wanghui@huawei.com>
References: <20200716171742.45621-1-cuibixuan@huawei.com>
Message-ID: <7b3e9680-9a39-45d3-44c2-85b374df4a19@huawei.com>
Date:   Thu, 16 Jul 2020 21:48:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200716171742.45621-1-cuibixuan@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.238]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the warning: [-Werror=-Wframe-larger-than=]

drivers/media/tuners/mxl5005s.c: In function 'mxl5005s_reconfigure':
drivers/media/tuners/mxl5005s.c:3953:1:
warning: the frame size of 1152 bytes is larger than 1024 bytes

Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
---
 drivers/media/tuners/mxl5005s.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/media/tuners/mxl5005s.c b/drivers/media/tuners/mxl5005s.c
index 1c07e2225fb3..f6e82a8e7d37 100644
--- a/drivers/media/tuners/mxl5005s.c
+++ b/drivers/media/tuners/mxl5005s.c
@@ -3926,15 +3926,26 @@ static int mxl5005s_reconfigure(struct dvb_frontend *fe, u32 mod_type,
 	u32 bandwidth)
 {
 	struct mxl5005s_state *state = fe->tuner_priv;
-
-	u8 AddrTable[MXL5005S_REG_WRITING_TABLE_LEN_MAX];
-	u8 ByteTable[MXL5005S_REG_WRITING_TABLE_LEN_MAX];
+	u8 *AddrTable;
+	u8 *ByteTable;
 	int TableLen;

 	dprintk(1, "%s(type=%d, bw=%d)\n", __func__, mod_type, bandwidth);

 	mxl5005s_reset(fe);

+	AddrTable = kcalloc(MXL5005S_REG_WRITING_TABLE_LEN_MAX, sizeof(u8),
+			    GFP_KERNEL);
+	if (!AddrTable)
+		return -ENOMEM;
+
+	ByteTable = kcalloc(MXL5005S_REG_WRITING_TABLE_LEN_MAX, sizeof(u8),
+			    GFP_KERNEL);
+	if (!ByteTable) {
+		kfree(AddrTable);
+		return -ENOMEM;
+	}
+
 	/* Tuner initialization stage 0 */
 	MXL_GetMasterControl(ByteTable, MC_SYNTH_RESET);
 	AddrTable[0] = MASTER_CONTROL_ADDR;
@@ -3949,6 +3960,9 @@ static int mxl5005s_reconfigure(struct dvb_frontend *fe, u32 mod_type,

 	mxl5005s_writeregs(fe, AddrTable, ByteTable, TableLen);

+	kfree(AddrTable);
+	kfree(ByteTable);
+
 	return 0;
 }

--
2.17.1


.



