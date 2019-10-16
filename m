Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E769D8BC7
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 10:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391536AbfJPIxc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 04:53:32 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:60290 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726640AbfJPIxb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 04:53:31 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 6F41C6A52E32BD6B3D7B;
        Wed, 16 Oct 2019 16:53:28 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Wed, 16 Oct 2019
 16:53:17 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <laurent.pinchart@ideasonboard.com>, <mchehab@kernel.org>,
        <gregkh@linuxfoundation.org>
CC:     <linux-media@vger.kernel.org>, <devel@driverdev.osuosl.org>,
        <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] staging: media: omap4iss: use devm_platform_ioremap_resource() to simplify code
Date:   Wed, 16 Oct 2019 16:51:36 +0800
Message-ID: <20191016085136.22812-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/staging/media/omap4iss/iss.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
index 1a966cb..6fb60b5 100644
--- a/drivers/staging/media/omap4iss/iss.c
+++ b/drivers/staging/media/omap4iss/iss.c
@@ -908,11 +908,7 @@ static int iss_map_mem_resource(struct platform_device *pdev,
 				struct iss_device *iss,
 				enum iss_mem_resources res)
 {
-	struct resource *mem;
-
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, res);
-
-	iss->regs[res] = devm_ioremap_resource(iss->dev, mem);
+	iss->regs[res] = devm_platform_ioremap_resource(pdev, res);
 
 	return PTR_ERR_OR_ZERO(iss->regs[res]);
 }
-- 
2.7.4


