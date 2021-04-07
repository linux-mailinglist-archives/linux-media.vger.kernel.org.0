Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 756D6356E87
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 16:27:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348448AbhDGO1v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 10:27:51 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:15951 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348416AbhDGO1u (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Apr 2021 10:27:50 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FFmrl4Mt4zrdGY;
        Wed,  7 Apr 2021 22:25:27 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Wed, 7 Apr 2021 22:27:27 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        "Hulk Robot" <hulkci@huawei.com>
Subject: [PATCH -next] media: omap3isp: Fix missing unlock in isp_subdev_notifier_complete()
Date:   Wed, 7 Apr 2021 14:37:33 +0000
Message-ID: <20210407143733.1608806-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the missing unlock before return from function
isp_subdev_notifier_complete() in the init error
handling case.

Fixes: ba689d933361 ("media: omap3isp: Acquire graph mutex for graph traversal")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/media/platform/omap3isp/isp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/omap3isp/isp.c b/drivers/media/platform/omap3isp/isp.c
index 53025c8c7531..20f59c59ff8a 100644
--- a/drivers/media/platform/omap3isp/isp.c
+++ b/drivers/media/platform/omap3isp/isp.c
@@ -2037,8 +2037,10 @@ static int isp_subdev_notifier_complete(struct v4l2_async_notifier *async)
 	mutex_lock(&isp->media_dev.graph_mutex);
 
 	ret = media_entity_enum_init(&isp->crashed, &isp->media_dev);
-	if (ret)
+	if (ret) {
+		mutex_unlock(&isp->media_dev.graph_mutex);
 		return ret;
+	}
 
 	list_for_each_entry(sd, &v4l2_dev->subdevs, list) {
 		if (sd->notifier != &isp->notifier)

