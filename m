Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68E2C777791
	for <lists+linux-media@lfdr.de>; Thu, 10 Aug 2023 13:53:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234630AbjHJLx3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Aug 2023 07:53:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233954AbjHJLx2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Aug 2023 07:53:28 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D67491
        for <linux-media@vger.kernel.org>; Thu, 10 Aug 2023 04:53:28 -0700 (PDT)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RM4wg5KLMzcdMW
        for <linux-media@vger.kernel.org>; Thu, 10 Aug 2023 19:49:55 +0800 (CST)
Received: from huawei.com (10.67.175.31) by dggpemm500024.china.huawei.com
 (7.185.36.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 19:53:25 +0800
From:   GUO Zihua <guozihua@huawei.com>
To:     <p.zabel@pengutronix.de>
CC:     <linux-media@vger.kernel.org>
Subject: [PATCH -next] media: coda: Remove duplicated include
Date:   Thu, 10 Aug 2023 19:53:02 +0800
Message-ID: <20230810115302.21911-1-guozihua@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.175.31]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500024.china.huawei.com (7.185.36.203)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove duplicated include of linux/of.h. Resolves checkincludes message.

Signed-off-by: GUO Zihua <guozihua@huawei.com>
---
 drivers/media/platform/chips-media/coda-common.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/coda-common.c b/drivers/media/platform/chips-media/coda-common.c
index 4c7608f1b98d..cc4892129aaf 100644
--- a/drivers/media/platform/chips-media/coda-common.c
+++ b/drivers/media/platform/chips-media/coda-common.c
@@ -25,7 +25,6 @@
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/videodev2.h>
-#include <linux/of.h>
 #include <linux/ratelimit.h>
 #include <linux/reset.h>
 
-- 
2.17.1

