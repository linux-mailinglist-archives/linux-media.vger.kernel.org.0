Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8B9634E18F
	for <lists+linux-media@lfdr.de>; Tue, 30 Mar 2021 08:53:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbhC3GxG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Mar 2021 02:53:06 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:15818 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbhC3Gwl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Mar 2021 02:52:41 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4F8g7Z2Cbcz93dl;
        Tue, 30 Mar 2021 14:50:34 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Tue, 30 Mar 2021 14:52:31 +0800
From:   Hao Fang <fanghao11@huawei.com>
To:     <mchehab+huawei@kernel.org>, <mchehab@kernel.org>, <sean@mess.org>
CC:     <linux-media@vger.kernel.org>, <yanguoxiong@huawei.com>,
        <linux-kernel@vger.kernel.org>, <prime.zeng@hisilicon.com>,
        <fanghao11@huawei.com>
Subject: [PATCH] media: rc: ir-hix5hd2: use the correct HiSilicon copyright
Date:   Tue, 30 Mar 2021 14:50:00 +0800
Message-ID: <1617087000-18137-1-git-send-email-fanghao11@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

s/Hisilicon/HiSilicon/g.
It should use capital S, according to
https://www.hisilicon.com/en/terms-of-use.

Signed-off-by: Hao Fang <fanghao11@huawei.com>
---
 drivers/media/rc/ir-hix5hd2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/ir-hix5hd2.c b/drivers/media/rc/ir-hix5hd2.c
index 0ffc275..4609fb4 100644
--- a/drivers/media/rc/ir-hix5hd2.c
+++ b/drivers/media/rc/ir-hix5hd2.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2014 Linaro Ltd.
- * Copyright (c) 2014 Hisilicon Limited.
+ * Copyright (c) 2014 HiSilicon Limited.
  */
 
 #include <linux/clk.h>
-- 
2.8.1

