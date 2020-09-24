Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76942276B99
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 10:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbgIXIRB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 04:17:01 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:39868 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727089AbgIXIRB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 04:17:01 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 93799F34A5210270DB07;
        Thu, 24 Sep 2020 16:16:59 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Thu, 24 Sep 2020
 16:16:49 +0800
From:   Yu Kuai <yukuai3@huawei.com>
To:     <rick.chang@mediatek.com>, <bin.liu@mediatek.com>,
        <mchehab@kernel.org>, <matthias.bgg@gmail.com>,
        <tfiga@chromium.org>, <xia.jiang@mediatek.com>,
        <hverkuil-cisco@xs4all.nl>
CC:     <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <yukuai3@huawei.com>,
        <yi.zhang@huawei.com>
Subject: [PATCH 1/3] media: platform: add missing put_device() call in mtk_jpeg_clk_init()
Date:   Thu, 24 Sep 2020 16:17:53 +0800
Message-ID: <20200924081753.1060917-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

if of_find_device_by_node() succeed, mtk_jpeg_clk_init() doesn't have
a corresponding put_device(). Thus add put_device() to fix the exception
handling for this function implementation.

Fixes: 648372a87cee("media: platform: Change the call functions of getting/enable/disable the jpeg's clock")
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 227245ccaedc..106543391c46 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -1306,6 +1306,7 @@ static int mtk_jpeg_clk_init(struct mtk_jpeg_dev *jpeg)
 				jpeg->variant->clks);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to get jpeg clock:%d\n", ret);
+		put_device(&pdev->dev);
 		return ret;
 	}
 
-- 
2.25.4

