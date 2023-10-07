Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B49F07BC61F
	for <lists+linux-media@lfdr.de>; Sat,  7 Oct 2023 10:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234165AbjJGIo3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Oct 2023 04:44:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234147AbjJGIo2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Oct 2023 04:44:28 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43540CA
        for <linux-media@vger.kernel.org>; Sat,  7 Oct 2023 01:44:24 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4S2dzG24c5zNpCp;
        Sat,  7 Oct 2023 16:40:26 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Sat, 7 Oct
 2023 16:44:20 +0800
From:   Jinjie Ruan <ruanjinjie@huawei.com>
To:     <linux-media@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>,
        Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jammy Huang <jammy_huang@aspeedtech.com>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH v2] media: aspeed: Drop unnecessary error check for debugfs_create_file()
Date:   Sat, 7 Oct 2023 16:43:39 +0800
Message-ID: <20231007084339.3160130-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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

debugfs_create_file() return ERR_PTR and never return NULL.

When calling debugfs functions, there is no need to ever check the
return value. The function can work or not, but the code logic should
never do something different based on this.

Fixes: 52fed10ad756 ("media: aspeed: add debugfs")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
v2:
- Remove the err check instead of using IS_ERR to replace NULL check.
- Add suggested-by.
- Update the commit title and message.
---
 drivers/media/platform/aspeed/aspeed-video.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index a9c2c69b2ed9..d08aa7f73d4f 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -1970,22 +1970,15 @@ static void aspeed_video_debugfs_remove(struct aspeed_video *video)
 	debugfs_entry = NULL;
 }
 
-static int aspeed_video_debugfs_create(struct aspeed_video *video)
+static void aspeed_video_debugfs_create(struct aspeed_video *video)
 {
 	debugfs_entry = debugfs_create_file(DEVICE_NAME, 0444, NULL,
 					    video,
 					    &aspeed_video_debugfs_fops);
-	if (!debugfs_entry)
-		aspeed_video_debugfs_remove(video);
-
-	return !debugfs_entry ? -EIO : 0;
 }
 #else
 static void aspeed_video_debugfs_remove(struct aspeed_video *video) { }
-static int aspeed_video_debugfs_create(struct aspeed_video *video)
-{
-	return 0;
-}
+static void aspeed_video_debugfs_create(struct aspeed_video *video) { }
 #endif /* CONFIG_DEBUG_FS */
 
 static int aspeed_video_setup_video(struct aspeed_video *video)
@@ -2198,9 +2191,7 @@ static int aspeed_video_probe(struct platform_device *pdev)
 		return rc;
 	}
 
-	rc = aspeed_video_debugfs_create(video);
-	if (rc)
-		dev_err(video->dev, "debugfs create failed\n");
+	aspeed_video_debugfs_create(video);
 
 	return 0;
 }
-- 
2.34.1

