Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 858EE2C7454
	for <lists+linux-media@lfdr.de>; Sat, 28 Nov 2020 23:19:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388642AbgK1Vtm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Nov 2020 16:49:42 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:9068 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730044AbgK1Sfo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Nov 2020 13:35:44 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CjnSL2skKzLv0D;
        Sat, 28 Nov 2020 18:15:30 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Sat, 28 Nov 2020 18:15:49 +0800
From:   Qinglang Miao <miaoqinglang@huawei.com>
To:     Hyun Kwon <hyun.kwon@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
CC:     <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Qinglang Miao <miaoqinglang@huawei.com>
Subject: [PATCH 3/3] media: xilinx: fix error return code in xvip_graph_init
Date:   Sat, 28 Nov 2020 18:20:02 +0800
Message-ID: <20201128102002.95402-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix to return a negative error code(-ENODEV) from the error
handling case instead of 0, as done elsewhere in this function.

Fixes: df3305156f98 ("[media] v4l: xilinx: Add Xilinx Video IP core")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/media/platform/xilinx/xilinx-vipp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
index cc2856efe..9cab2f77f 100644
--- a/drivers/media/platform/xilinx/xilinx-vipp.c
+++ b/drivers/media/platform/xilinx/xilinx-vipp.c
@@ -525,6 +525,7 @@ static int xvip_graph_init(struct xvip_composite_device *xdev)
 
 	if (list_empty(&xdev->notifier.asd_list)) {
 		dev_err(xdev->dev, "no subdev found in graph\n");
+		ret = -ENODEV;
 		goto done;
 	}
 
-- 
2.23.0

