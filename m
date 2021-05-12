Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F58937B8FD
	for <lists+linux-media@lfdr.de>; Wed, 12 May 2021 11:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230352AbhELJVr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 May 2021 05:21:47 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:2640 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230118AbhELJVq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 May 2021 05:21:46 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Fg8NK47D6zld9V;
        Wed, 12 May 2021 17:18:25 +0800 (CST)
Received: from huawei.com (10.175.103.91) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.498.0; Wed, 12 May 2021
 17:20:31 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <laurent.pinchart@ideasonboard.com>, <mchehab@kernel.org>
Subject: [PATCH -next] media: omap3isp: add missing unlock on error in isp_subdev_notifier_complete()
Date:   Wed, 12 May 2021 17:23:01 +0800
Message-ID: <20210512092301.4124736-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the missing unlock before return from isp_subdev_notifier_complete()
in the error handling case.

Fixes: ba689d933361 ("media: omap3isp: Acquire graph mutex for graph traversal")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
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
-- 
2.25.1

