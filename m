Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4720A399B50
	for <lists+linux-media@lfdr.de>; Thu,  3 Jun 2021 09:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbhFCHOn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Jun 2021 03:14:43 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3521 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhFCHOn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Jun 2021 03:14:43 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FwcVC6Q9KzYnDn;
        Thu,  3 Jun 2021 15:10:11 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 15:12:57 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 15:12:56 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] media: mc-device.c: use DEVICE_ATTR_RO() helper macro
Date:   Thu, 3 Jun 2021 15:12:49 +0800
Message-ID: <20210603071249.11491-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use DEVICE_ATTR_RO() helper macro instead of DEVICE_ATTR(), which is
simpler and more readable.

Due to the name of the read function of the sysfs attribute is normalized,
there is a natural association.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/media/mc/mc-device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index 9e56d2ad6b94b5a..cf5e459b1d96269 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -556,7 +556,7 @@ static const struct media_file_operations media_device_fops = {
  * sysfs
  */
 
-static ssize_t show_model(struct device *cd,
+static ssize_t model_show(struct device *cd,
 			  struct device_attribute *attr, char *buf)
 {
 	struct media_devnode *devnode = to_media_devnode(cd);
@@ -565,7 +565,7 @@ static ssize_t show_model(struct device *cd,
 	return sprintf(buf, "%.*s\n", (int)sizeof(mdev->model), mdev->model);
 }
 
-static DEVICE_ATTR(model, S_IRUGO, show_model, NULL);
+static DEVICE_ATTR_RO(model);
 
 /* -----------------------------------------------------------------------------
  * Registration/unregistration
-- 
2.26.0.106.g9fadedd


