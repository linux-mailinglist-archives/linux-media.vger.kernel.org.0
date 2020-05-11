Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB49E1CD438
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 10:50:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729180AbgEKIt6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 04:49:58 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:36900 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728562AbgEKIt5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 04:49:57 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id BB63AB93F3FEEFD6C057;
        Mon, 11 May 2020 16:49:53 +0800 (CST)
Received: from linux-ibm.site (10.175.102.37) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Mon, 11 May 2020 16:49:45 +0800
From:   Xiongfeng Wang <wangxiongfeng2@huawei.com>
To:     <ezequiel@vanguardiasur.com.ar>, <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <wangxiongfeng2@huawei.com>
Subject: [PATCH] [media] tw686x: add a missing newline when printing parameter 'dma_mode'
Date:   Mon, 11 May 2020 16:43:46 +0800
Message-ID: <1589186626-17243-1-git-send-email-wangxiongfeng2@huawei.com>
X-Mailer: git-send-email 1.7.12.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.102.37]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When I cat module parameter 'dma_mode' by sysfs, it displays as follows.
It is better to add a newline for easy reading.

[root@hulk-202 ~]# cat /sys/module/tw686x/parameters/dma_mode
memcpy[root@hulk-202 ~]#

Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>
---
 drivers/media/pci/tw686x/tw686x-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/tw686x/tw686x-core.c b/drivers/media/pci/tw686x/tw686x-core.c
index 74ae4f0..bfc61da 100644
--- a/drivers/media/pci/tw686x/tw686x-core.c
+++ b/drivers/media/pci/tw686x/tw686x-core.c
@@ -71,7 +71,7 @@ static const char *dma_mode_name(unsigned int mode)
 
 static int tw686x_dma_mode_get(char *buffer, const struct kernel_param *kp)
 {
-	return sprintf(buffer, "%s", dma_mode_name(dma_mode));
+	return sprintf(buffer, "%s\n", dma_mode_name(dma_mode));
 }
 
 static int tw686x_dma_mode_set(const char *val, const struct kernel_param *kp)
-- 
1.7.12.4

