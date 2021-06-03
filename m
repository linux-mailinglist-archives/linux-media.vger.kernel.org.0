Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0F41399B3A
	for <lists+linux-media@lfdr.de>; Thu,  3 Jun 2021 09:06:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbhFCHIG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Jun 2021 03:08:06 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3398 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbhFCHIG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Jun 2021 03:08:06 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FwcKQ5S8Kz67n9;
        Thu,  3 Jun 2021 15:02:34 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 15:06:20 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 15:06:19 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-media <linux-media@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] media: exynos4-is: use DEVICE_ATTR_RW() helper macro
Date:   Thu, 3 Jun 2021 15:06:13 +0800
Message-ID: <20210603070613.11385-1-thunder.leizhen@huawei.com>
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

Use DEVICE_ATTR_RW() helper macro instead of DEVICE_ATTR(), which is
simpler and more readable.

Due to the names of the read and write functions of the sysfs attribute is
normalized, there is a natural association.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/media/platform/exynos4-is/media-dev.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index 3b8a24bb724c8e9..fa648721eaab9a5 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -1238,8 +1238,8 @@ static const struct media_device_ops fimc_md_ops = {
 	.link_notify = fimc_md_link_notify,
 };
 
-static ssize_t fimc_md_sysfs_show(struct device *dev,
-				  struct device_attribute *attr, char *buf)
+static ssize_t subdev_conf_mode_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
 {
 	struct fimc_md *fmd = dev_get_drvdata(dev);
 
@@ -1249,9 +1249,9 @@ static ssize_t fimc_md_sysfs_show(struct device *dev,
 	return strscpy(buf, "V4L2 video node only API (vid-dev)\n", PAGE_SIZE);
 }
 
-static ssize_t fimc_md_sysfs_store(struct device *dev,
-				   struct device_attribute *attr,
-				   const char *buf, size_t count)
+static ssize_t subdev_conf_mode_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t count)
 {
 	struct fimc_md *fmd = dev_get_drvdata(dev);
 	bool subdev_api;
@@ -1278,8 +1278,7 @@ static ssize_t fimc_md_sysfs_store(struct device *dev,
  *  sub-dev - for media controller API, subdevs must be configured in user
  *  space before starting streaming.
  */
-static DEVICE_ATTR(subdev_conf_mode, S_IWUSR | S_IRUGO,
-		   fimc_md_sysfs_show, fimc_md_sysfs_store);
+static DEVICE_ATTR_RW(subdev_conf_mode);
 
 static int cam_clk_prepare(struct clk_hw *hw)
 {
-- 
2.26.0.106.g9fadedd


