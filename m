Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A65D3822FB
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 05:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234182AbhEQDKb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 May 2021 23:10:31 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3703 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231658AbhEQDK3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 May 2021 23:10:29 -0400
Received: from dggems702-chm.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fk3tr2TLmz16QC0;
        Mon, 17 May 2021 11:06:28 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggems702-chm.china.huawei.com (10.3.19.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 11:09:10 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 17 May
 2021 11:09:10 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <fabien.dessenne@foss.st.com>, <mchehab@kernel.org>
Subject: [PATCH -next] media: bdisp: remove redundant dev_err call in bdisp_probe()
Date:   Mon, 17 May 2021 11:11:23 +0800
Message-ID: <20210517031123.2963029-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/sti/bdisp/bdisp-v4l2.c b/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
index 85288da9d2ae..6413cd279125 100644
--- a/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
+++ b/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
@@ -1318,7 +1318,6 @@ static int bdisp_probe(struct platform_device *pdev)
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	bdisp->regs = devm_ioremap_resource(dev, res);
 	if (IS_ERR(bdisp->regs)) {
-		dev_err(dev, "failed to get regs\n");
 		ret = PTR_ERR(bdisp->regs);
 		goto err_wq;
 	}
-- 
2.25.1

