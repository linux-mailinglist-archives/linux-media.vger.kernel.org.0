Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A33F9399B61
	for <lists+linux-media@lfdr.de>; Thu,  3 Jun 2021 09:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbhFCHTm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Jun 2021 03:19:42 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:7080 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbhFCHTm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Jun 2021 03:19:42 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Fwcby58nNzYq8j;
        Thu,  3 Jun 2021 15:15:10 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 15:17:55 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 15:17:55 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] media: i2c: use DEVICE_ATTR_RO() helper macro
Date:   Thu, 3 Jun 2021 15:17:50 +0800
Message-ID: <20210603071750.11594-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
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
 drivers/media/i2c/ccs/ccs-core.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index a349189a38dbb9c..de47670dac78c24 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2669,8 +2669,7 @@ static int ccs_get_skip_top_lines(struct v4l2_subdev *subdev, u32 *lines)
  */
 
 static ssize_t
-ccs_sysfs_nvm_read(struct device *dev, struct device_attribute *attr,
-		   char *buf)
+nvm_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct v4l2_subdev *subdev = i2c_get_clientdata(to_i2c_client(dev));
 	struct i2c_client *client = v4l2_get_subdevdata(subdev);
@@ -2700,11 +2699,10 @@ ccs_sysfs_nvm_read(struct device *dev, struct device_attribute *attr,
 	 */
 	return rval;
 }
-static DEVICE_ATTR(nvm, S_IRUGO, ccs_sysfs_nvm_read, NULL);
+static DEVICE_ATTR_RO(nvm);
 
 static ssize_t
-ccs_sysfs_ident_read(struct device *dev, struct device_attribute *attr,
-		     char *buf)
+ident_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct v4l2_subdev *subdev = i2c_get_clientdata(to_i2c_client(dev));
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
@@ -2719,8 +2717,7 @@ ccs_sysfs_ident_read(struct device *dev, struct device_attribute *attr,
 				minfo->smia_manufacturer_id, minfo->model_id,
 				minfo->revision_number) + 1;
 }
-
-static DEVICE_ATTR(ident, S_IRUGO, ccs_sysfs_ident_read, NULL);
+static DEVICE_ATTR_RO(ident);
 
 /* -----------------------------------------------------------------------------
  * V4L2 subdev core operations
-- 
2.26.0.106.g9fadedd


