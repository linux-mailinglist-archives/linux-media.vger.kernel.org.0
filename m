Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38E94512B6A
	for <lists+linux-media@lfdr.de>; Thu, 28 Apr 2022 08:21:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243600AbiD1GYK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Apr 2022 02:24:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243824AbiD1GYD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Apr 2022 02:24:03 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F267D692A7;
        Wed, 27 Apr 2022 23:20:49 -0700 (PDT)
Received: from dggpeml500026.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Kplq56cyczhYmg;
        Thu, 28 Apr 2022 14:20:33 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 dggpeml500026.china.huawei.com (7.185.36.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 28 Apr 2022 14:20:47 +0800
From:   Yuanzheng Song <songyuanzheng@huawei.com>
To:     <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
        <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Yuanzheng Song <songyuanzheng@huawei.com>
Subject: [PATCH] dma-buf: add the name field to the table header
Date:   Thu, 28 Apr 2022 06:39:24 +0000
Message-ID: <20220428063924.3570409-1-songyuanzheng@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500026.china.huawei.com (7.185.36.106)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

'cat /sys/kernel/debug/dma_buf/bufinfo' will print the Dma-buf
Objects' information when the CONFIG_DEBUG_FS=y.
However, the printed table header information does not contain
the name field. So we need to add the name field to the table
header and use the '<none>' to replace the empty buf_obj->name.

Signed-off-by: Yuanzheng Song <songyuanzheng@huawei.com>
---
 drivers/dma-buf/dma-buf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 79795857be3e..a2f9a1815e38 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1351,7 +1351,7 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 		return ret;
 
 	seq_puts(s, "\nDma-buf Objects:\n");
-	seq_printf(s, "%-8s\t%-8s\t%-8s\t%-8s\texp_name\t%-8s\n",
+	seq_printf(s, "%-8s\t%-8s\t%-8s\t%-8s\texp_name\t%-8s\tname\n",
 		   "size", "flags", "mode", "count", "ino");
 
 	list_for_each_entry(buf_obj, &db_list.head, list_node) {
@@ -1368,7 +1368,7 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 				file_count(buf_obj->file),
 				buf_obj->exp_name,
 				file_inode(buf_obj->file)->i_ino,
-				buf_obj->name ?: "");
+				buf_obj->name ?: "<none>");
 		spin_unlock(&buf_obj->name_lock);
 
 		dma_resv_describe(buf_obj->resv, s);
-- 
2.25.1

