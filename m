Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 642818F96E
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 05:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbfHPD0t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 23:26:49 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4718 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726166AbfHPD0t (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 23:26:49 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 77234D9A6B661025B2AD;
        Fri, 16 Aug 2019 11:26:41 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Fri, 16 Aug 2019
 11:26:32 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <sakari.ailus@linux.intel.com>,
        <laurent.pinchart@ideasonboard.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>
CC:     <yi.zhang@huawei.com>, <zhengbin13@huawei.com>
Subject: [PATCH] media: mc-device.c: fix memleak in media_device_register_entity
Date:   Fri, 16 Aug 2019 11:33:02 +0800
Message-ID: <1565926382-91620-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In media_device_register_entity, if media_graph_walk_init fails,
need to free the previously memory.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/media/mc/mc-device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index e19df51..939be00 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -632,6 +632,7 @@ int __must_check media_device_register_entity(struct media_device *mdev,
 		 */
 		ret = media_graph_walk_init(&new, mdev);
 		if (ret) {
+			__media_device_unregister_entity(entity);
 			mutex_unlock(&mdev->graph_mutex);
 			return ret;
 		}
--
2.7.4

