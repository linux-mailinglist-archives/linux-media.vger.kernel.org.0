Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 360E6776EBA
	for <lists+linux-media@lfdr.de>; Thu, 10 Aug 2023 05:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231303AbjHJDra (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Aug 2023 23:47:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231483AbjHJDr2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Aug 2023 23:47:28 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CD9A2108
        for <linux-media@vger.kernel.org>; Wed,  9 Aug 2023 20:47:27 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RLt7s11SBzNmsD;
        Thu, 10 Aug 2023 11:43:53 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 11:47:21 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <mirela.rabulea@nxp.com>, <linux-imx@nxp.com>,
        <mchehab@kernel.org>, <shawnguo@kernel.org>,
        <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <laurent.pinchart@ideasonboard.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next v2 2/2] media: nxp: Remove a redundant dev_err() for platform_get_irq()
Date:   Thu, 10 Aug 2023 11:46:41 +0800
Message-ID: <20230810034641.1384352-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810034641.1384352-1-ruanjinjie@huawei.com>
References: <20230810034641.1384352-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
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

There is no need to call the dev_err() function directly to print a custom
message when handling an error from platform_get_irq() function as
it is going to display an appropriate error message in case of a failure.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
v2:
- Update the commit title.
- Split into 2 patches.
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
index c4454aa1cb34..65d20e9bae69 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
@@ -791,7 +791,6 @@ int mxc_isi_pipe_init(struct mxc_isi_dev *isi, unsigned int id)
 
 	irq = platform_get_irq(to_platform_device(isi->dev), id);
 	if (irq < 0) {
-		dev_err(pipe->isi->dev, "Failed to get IRQ (%d)\n", irq);
 		ret = irq;
 		goto error;
 	}
-- 
2.34.1

