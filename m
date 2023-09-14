Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7297A79F90F
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 05:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234366AbjINDvq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Sep 2023 23:51:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234321AbjINDvm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Sep 2023 23:51:42 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 832381BE5
        for <linux-media@vger.kernel.org>; Wed, 13 Sep 2023 20:51:38 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RmNcL5nZhz1N7rt;
        Thu, 14 Sep 2023 11:49:38 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 14 Sep
 2023 11:51:36 +0800
From:   Jinjie Ruan <ruanjinjie@huawei.com>
To:     <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <ye.xingchen@zte.com.cn>, <linux-media@vger.kernel.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH 2/2] media: siano: Fix the missing err path in smsdvb_debugfs_create()
Date:   Thu, 14 Sep 2023 11:50:35 +0800
Message-ID: <20230914035035.3765754-3-ruanjinjie@huawei.com>
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

If kzalloc() fails in smsdvb_debugfs_create(), the dir and file which
is created by debugfs_create_dir() and debugfs_create_file() is
not freed. So use debugfs_remove_recursive() to free them.

Fixes: 503efe5cfc9f ("[media] siano: split debugfs code into a separate file")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/media/common/siano/smsdvb-debugfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/common/siano/smsdvb-debugfs.c b/drivers/media/common/siano/smsdvb-debugfs.c
index 16d3b9ab31c5..38b25e88ce57 100644
--- a/drivers/media/common/siano/smsdvb-debugfs.c
+++ b/drivers/media/common/siano/smsdvb-debugfs.c
@@ -375,8 +375,10 @@ int smsdvb_debugfs_create(struct smsdvb_client_t *client)
 	}
 
 	debug_data = kzalloc(sizeof(*client->debug_data), GFP_KERNEL);
-	if (!debug_data)
+	if (!debug_data) {
+		debugfs_remove_recursive(client->debugfs);
 		return -ENOMEM;
+	}
 
 	client->debug_data        = debug_data;
 	client->prt_dvb_stats     = smsdvb_print_dvb_stats;
-- 
2.34.1

