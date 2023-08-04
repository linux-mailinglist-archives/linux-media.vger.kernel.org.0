Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D78FC76F84D
	for <lists+linux-media@lfdr.de>; Fri,  4 Aug 2023 05:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233746AbjHDDQp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 23:16:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233894AbjHDDPf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 23:15:35 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75D194EDD
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 20:14:14 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RH9hS5zQ9ztRmS;
        Fri,  4 Aug 2023 11:10:48 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 11:14:12 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <j.neuschaefer@gmx.net>, <u.kleine-koenig@pengutronix.de>,
        <linux-media@vger.kernel.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next 2/3] media: radio-wl1273: Remove an unnecessary ternary operator
Date:   Fri, 4 Aug 2023 11:13:22 +0800
Message-ID: <20230804031323.2105187-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230804031323.2105187-1-ruanjinjie@huawei.com>
References: <20230804031323.2105187-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is a ternary operator, the true or false judgement of which
is unnecessary in C language semantics.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/media/radio/radio-wl1273.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/radio/radio-wl1273.c b/drivers/media/radio/radio-wl1273.c
index e8166eac9efe..f6b98c304b72 100644
--- a/drivers/media/radio/radio-wl1273.c
+++ b/drivers/media/radio/radio-wl1273.c
@@ -1020,7 +1020,7 @@ static int wl1273_fm_set_rds(struct wl1273_device *radio, unsigned int new_mode)
 	}
 
 	if (!r)
-		radio->rds_on = (new_mode == WL1273_RDS_ON) ? true : false;
+		radio->rds_on = new_mode == WL1273_RDS_ON;
 
 	return r;
 }
-- 
2.34.1

