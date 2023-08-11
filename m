Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE0407785A3
	for <lists+linux-media@lfdr.de>; Fri, 11 Aug 2023 04:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231617AbjHKCuV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Aug 2023 22:50:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231603AbjHKCuU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Aug 2023 22:50:20 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FDF52D60
        for <linux-media@vger.kernel.org>; Thu, 10 Aug 2023 19:50:20 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RMSt92Km4z1L9Kn;
        Fri, 11 Aug 2023 10:49:05 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 11 Aug
 2023 10:50:17 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <TheSven73@gmail.com>, <gregkh@linuxfoundation.org>,
        <mripard@kernel.org>, <paul.kocialkowski@bootlin.com>,
        <mchehab@kernel.org>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
        <samuel@sholland.org>, <linux-staging@lists.linux.dev>,
        <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-sunxi@lists.linux.dev>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next 2/2] media: staging: media: sunxi: cedrus: Remove redundant of_match_ptr()
Date:   Fri, 11 Aug 2023 10:49:45 +0800
Message-ID: <20230811024945.2256437-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230811024945.2256437-1-ruanjinjie@huawei.com>
References: <20230811024945.2256437-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver depends on CONFIG_OF, it is not necessary to use
of_match_ptr() here.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 8e248d4a0aec..f52df6836045 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -708,7 +708,7 @@ static struct platform_driver cedrus_driver = {
 	.remove_new	= cedrus_remove,
 	.driver		= {
 		.name		= CEDRUS_NAME,
-		.of_match_table	= of_match_ptr(cedrus_dt_match),
+		.of_match_table	= cedrus_dt_match,
 		.pm		= &cedrus_dev_pm_ops,
 	},
 };
-- 
2.34.1

