Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4119E63BE90
	for <lists+linux-media@lfdr.de>; Tue, 29 Nov 2022 12:05:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232788AbiK2LFh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Nov 2022 06:05:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232609AbiK2LFG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Nov 2022 06:05:06 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2679A64558
        for <linux-media@vger.kernel.org>; Tue, 29 Nov 2022 03:02:04 -0800 (PST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NLzss1gtLzRpYr;
        Tue, 29 Nov 2022 19:01:21 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 29 Nov 2022 19:01:59 +0800
From:   Gaosheng Cui <cuigaosheng1@huawei.com>
To:     <bparrot@ti.com>, <mchehab@kernel.org>,
        <laurent.pinchart@ideasonboard.com>, <hverkuil-cisco@xs4all.nl>,
        <cuigaosheng1@huawei.com>
CC:     <linux-media@vger.kernel.org>
Subject: [PATCH] media: ti: cal: fix possible memory leak in cal_ctx_create()
Date:   Tue, 29 Nov 2022 19:01:59 +0800
Message-ID: <20221129110159.1541522-1-cuigaosheng1@huawei.com>
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

The memory of ctx is allocated in cal_ctx_create(), but it will
not be freed when cal_ctx_v4l2_init() fails, so add kfree() when
cal_ctx_v4l2_init() fails to fix it.

Fixes: d68a94e98a89 ("media: ti-vpe: cal: Split video device initialization and registration")
Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/media/platform/ti/cal/cal.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
index 56b61c0583cf..1236215ec70e 100644
--- a/drivers/media/platform/ti/cal/cal.c
+++ b/drivers/media/platform/ti/cal/cal.c
@@ -1050,8 +1050,10 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
 	ctx->cport = inst;
 
 	ret = cal_ctx_v4l2_init(ctx);
-	if (ret)
+	if (ret) {
+		kfree(ctx);
 		return NULL;
+	}
 
 	return ctx;
 }
-- 
2.25.1

