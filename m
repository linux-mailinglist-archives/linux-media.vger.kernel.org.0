Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB45979F90C
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 05:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234197AbjINDvh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Sep 2023 23:51:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbjINDvf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Sep 2023 23:51:35 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B466D99
        for <linux-media@vger.kernel.org>; Wed, 13 Sep 2023 20:51:31 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RmNZB1q2QzGpsl;
        Thu, 14 Sep 2023 11:47:46 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 14 Sep
 2023 11:51:29 +0800
From:   Jinjie Ruan <ruanjinjie@huawei.com>
To:     <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <ye.xingchen@zte.com.cn>, <linux-media@vger.kernel.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH 1/2] media: siano: Fix the NULL vs IS_ERR() bug for debugfs_create_file()
Date:   Thu, 14 Sep 2023 11:50:34 +0800
Message-ID: <20230914035035.3765754-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230914035035.3765754-1-ruanjinjie@huawei.com>
References: <20230914035035.3765754-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since debugfs_create_file() returns ERR_PTR and never NULL, use IS_ERR() to
check the return value.

Fixes: 503efe5cfc9f ("[media] siano: split debugfs code into a separate file")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/media/common/siano/smsdvb-debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/common/siano/smsdvb-debugfs.c b/drivers/media/common/siano/smsdvb-debugfs.c
index e0beefd80d7b..16d3b9ab31c5 100644
--- a/drivers/media/common/siano/smsdvb-debugfs.c
+++ b/drivers/media/common/siano/smsdvb-debugfs.c
@@ -369,7 +369,7 @@ int smsdvb_debugfs_create(struct smsdvb_client_t *client)
 
 	d = debugfs_create_file("stats", S_IRUGO | S_IWUSR, client->debugfs,
 				client, &debugfs_stats_ops);
-	if (!d) {
+	if (IS_ERR(d)) {
 		debugfs_remove(client->debugfs);
 		return -ENOMEM;
 	}
-- 
2.34.1

