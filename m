Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1625935137E
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 12:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234345AbhDAK2I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 06:28:08 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:14666 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234118AbhDAK1v (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 06:27:51 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F9zlv6ZfRzmcYy;
        Thu,  1 Apr 2021 18:23:07 +0800 (CST)
Received: from huawei.com (10.175.103.91) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Thu, 1 Apr 2021
 18:25:43 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <mchehab@kernel.org>, <bparrot@ti.com>
Subject: [PATCH -next] media: ti-vpe: csc: remove redundant dev_err call in csc_create()
Date:   Thu, 1 Apr 2021 18:28:50 +0800
Message-ID: <20210401102850.1555368-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is an error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/media/platform/ti-vpe/csc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/csc.c b/drivers/media/platform/ti-vpe/csc.c
index f4e0cf72d1cf..ff15bc589f1b 100644
--- a/drivers/media/platform/ti-vpe/csc.c
+++ b/drivers/media/platform/ti-vpe/csc.c
@@ -267,10 +267,8 @@ struct csc_data *csc_create(struct platform_device *pdev, const char *res_name)
 	}
 
 	csc->base = devm_ioremap_resource(&pdev->dev, csc->res);
-	if (IS_ERR(csc->base)) {
-		dev_err(&pdev->dev, "failed to ioremap\n");
+	if (IS_ERR(csc->base))
 		return ERR_CAST(csc->base);
-	}
 
 	return csc;
 }
-- 
2.25.1

