Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D018399B57
	for <lists+linux-media@lfdr.de>; Thu,  3 Jun 2021 09:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbhFCHRW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Jun 2021 03:17:22 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3399 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbhFCHRV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Jun 2021 03:17:21 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FwcX647KXz68DW;
        Thu,  3 Jun 2021 15:11:50 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 15:15:35 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 15:15:34 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Pavel Machek <pavel@ucw.cz>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] media: i2c: et8ek8: use DEVICE_ATTR_RO() helper macro
Date:   Thu, 3 Jun 2021 15:15:29 +0800
Message-ID: <20210603071529.11544-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
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
 drivers/media/i2c/et8ek8/et8ek8_driver.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c/et8ek8/et8ek8_driver.c
index bb3eac5e005e4c2..fc3a3869a79d1d6 100644
--- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
+++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
@@ -1234,8 +1234,7 @@ static int et8ek8_dev_init(struct v4l2_subdev *subdev)
  * sysfs attributes
  */
 static ssize_t
-et8ek8_priv_mem_read(struct device *dev, struct device_attribute *attr,
-		     char *buf)
+priv_mem_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct v4l2_subdev *subdev = dev_get_drvdata(dev);
 	struct et8ek8_sensor *sensor = to_et8ek8_sensor(subdev);
@@ -1248,7 +1247,7 @@ et8ek8_priv_mem_read(struct device *dev, struct device_attribute *attr,
 
 	return ET8EK8_PRIV_MEM_SIZE;
 }
-static DEVICE_ATTR(priv_mem, 0444, et8ek8_priv_mem_read, NULL);
+static DEVICE_ATTR_RO(priv_mem);
 
 /* --------------------------------------------------------------------------
  * V4L2 subdev core operations
-- 
2.26.0.106.g9fadedd


