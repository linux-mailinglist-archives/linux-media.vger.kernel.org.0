Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC52562D364
	for <lists+linux-media@lfdr.de>; Thu, 17 Nov 2022 07:22:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238829AbiKQGV5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Nov 2022 01:21:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232139AbiKQGV4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Nov 2022 01:21:56 -0500
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8F5030F62
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 22:21:55 -0800 (PST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NCV9J2bx9zJnpN;
        Thu, 17 Nov 2022 14:18:44 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 17 Nov 2022 14:21:53 +0800
From:   Gaosheng Cui <cuigaosheng1@huawei.com>
To:     <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
        <tjmercier@google.com>, <quic_charante@quicinc.com>,
        <cuigaosheng1@huawei.com>
CC:     <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH] dma-buf: Fix possible UAF in dma_buf_export
Date:   Thu, 17 Nov 2022 14:21:52 +0800
Message-ID: <20221117062152.3029018-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Smatch report warning as follows:

drivers/dma-buf/dma-buf.c:681 dma_buf_export() warn:
  '&dmabuf->list_node' not removed from list

If dma_buf_stats_setup() fails in dma_buf_export(), goto err_sysfs
and dmabuf will be freed, but dmabuf->list_node will not be removed
from db_list.head, then list traversal may cause UAF.

Fix by removeing it from db_list.head before free().

Fixes: ef3a6b70507a ("dma-buf: call dma_buf_stats_setup after dmabuf is in valid list")
Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/dma-buf/dma-buf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index b809513b03fe..6848f50226d5 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -675,6 +675,9 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 	return dmabuf;
 
 err_sysfs:
+	mutex_lock(&db_list.lock);
+	list_del(&dmabuf->list_node);
+	mutex_unlock(&db_list.lock);
 	/*
 	 * Set file->f_path.dentry->d_fsdata to NULL so that when
 	 * dma_buf_release() gets invoked by dentry_ops, it exits
-- 
2.25.1

