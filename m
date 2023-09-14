Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68B3479F8E8
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 05:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234139AbjINDca (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Sep 2023 23:32:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229876AbjINDc3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Sep 2023 23:32:29 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A9091BE4
        for <linux-media@vger.kernel.org>; Wed, 13 Sep 2023 20:32:25 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RmN9B73nlzVkVq;
        Thu, 14 Sep 2023 11:29:34 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 14 Sep
 2023 11:32:23 +0800
From:   Jinjie Ruan <ruanjinjie@huawei.com>
To:     <linux-media@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>,
        Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jammy Huang <jammy_huang@aspeedtech.com>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH] media: aspeed: Fix the NULL vs IS_ERR() bug for debugfs_create_file()
Date:   Thu, 14 Sep 2023 11:31:35 +0800
Message-ID: <20230914033135.3760727-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since debugfs_create_file() returns ERR_PTR and never NULL, use IS_ERR() to
check the return value.

And so return the err code based on IS_ERR instead of checking NULL.

Fixes: 52fed10ad756 ("media: aspeed: add debugfs")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/media/platform/aspeed/aspeed-video.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index a9c2c69b2ed9..f4e624c13d3b 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -1975,10 +1975,12 @@ static int aspeed_video_debugfs_create(struct aspeed_video *video)
 	debugfs_entry = debugfs_create_file(DEVICE_NAME, 0444, NULL,
 					    video,
 					    &aspeed_video_debugfs_fops);
-	if (!debugfs_entry)
+	if (IS_ERR(debugfs_entry)) {
 		aspeed_video_debugfs_remove(video);
+		return -EIO;
+	}
 
-	return !debugfs_entry ? -EIO : 0;
+	return 0;
 }
 #else
 static void aspeed_video_debugfs_remove(struct aspeed_video *video) { }
-- 
2.34.1

