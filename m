Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2EF57BC73C
	for <lists+linux-media@lfdr.de>; Sat,  7 Oct 2023 13:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343873AbjJGLjN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Oct 2023 07:39:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234148AbjJGLjM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Oct 2023 07:39:12 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 991D3B6
        for <linux-media@vger.kernel.org>; Sat,  7 Oct 2023 04:39:10 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4S2jry2Vg1zNp1k;
        Sat,  7 Oct 2023 19:35:14 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Sat, 7 Oct
 2023 19:39:08 +0800
From:   Jinjie Ruan <ruanjinjie@huawei.com>
To:     <linux-media@vger.kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <ye.xingchen@zte.com.cn>, <mchehab@kernel.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH v2 RESEND] [media] siano: Drop unnecessary error check for debugfs_create_dir/file()
Date:   Sat, 7 Oct 2023 19:38:32 +0800
Message-ID: <20231007113832.3467434-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Both debugfs_create_dir() and debugfs_create_file() return ERR_PTR
and never return NULL.

As Hans suggested, this patch removes the error checking for both
debugfs_create_dir() and debugfs_create_file() in smsdvb_debugfs_create().
This is because the DebugFS kernel API is developed in a way that the
caller can safely ignore the errors that occur during the creation of
DebugFS nodes. The debugfs APIs have a IS_ERR() judge in start_creating()
which can handle it gracefully. So these checks are unnecessary.

And as Hans pointed out, it's much better to first allocate debug_data
before calling debugfs_create_dir, which need not to clean anything up in
that case.

Fixes: 503efe5cfc9f ("[media] siano: split debugfs code into a separate file")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
v2:
- Remove the err check instead of using IS_ERR to replace NULL check.
- Allocate debug_data before calling debugfs_create_dir().
- Update the commit message and title.
- Add suggested-by.
---
 drivers/media/common/siano/smsdvb-debugfs.c | 22 ++++++---------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/media/common/siano/smsdvb-debugfs.c b/drivers/media/common/siano/smsdvb-debugfs.c
index e0beefd80d7b..73990e469df9 100644
--- a/drivers/media/common/siano/smsdvb-debugfs.c
+++ b/drivers/media/common/siano/smsdvb-debugfs.c
@@ -353,31 +353,21 @@ static const struct file_operations debugfs_stats_ops = {
 int smsdvb_debugfs_create(struct smsdvb_client_t *client)
 {
 	struct smscore_device_t *coredev = client->coredev;
-	struct dentry *d;
 	struct smsdvb_debugfs *debug_data;
 
 	if (!smsdvb_debugfs_usb_root || !coredev->is_usb_device)
 		return -ENODEV;
 
-	client->debugfs = debugfs_create_dir(coredev->devpath,
-					     smsdvb_debugfs_usb_root);
-	if (IS_ERR_OR_NULL(client->debugfs)) {
-		pr_info("Unable to create debugfs %s directory.\n",
-			coredev->devpath);
-		return -ENODEV;
-	}
-
-	d = debugfs_create_file("stats", S_IRUGO | S_IWUSR, client->debugfs,
-				client, &debugfs_stats_ops);
-	if (!d) {
-		debugfs_remove(client->debugfs);
-		return -ENOMEM;
-	}
-
 	debug_data = kzalloc(sizeof(*client->debug_data), GFP_KERNEL);
 	if (!debug_data)
 		return -ENOMEM;
 
+	client->debugfs = debugfs_create_dir(coredev->devpath,
+					     smsdvb_debugfs_usb_root);
+
+	debugfs_create_file("stats", S_IRUGO | S_IWUSR, client->debugfs,
+			    client, &debugfs_stats_ops);
+
 	client->debug_data        = debug_data;
 	client->prt_dvb_stats     = smsdvb_print_dvb_stats;
 	client->prt_isdb_stats    = smsdvb_print_isdb_stats;
-- 
2.34.1

