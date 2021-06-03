Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB7D3399B34
	for <lists+linux-media@lfdr.de>; Thu,  3 Jun 2021 09:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbhFCHEW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Jun 2021 03:04:22 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3397 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbhFCHEW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Jun 2021 03:04:22 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FwcF72cGZz5xKV;
        Thu,  3 Jun 2021 14:58:51 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 15:02:36 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 15:02:36 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] media: imon: use DEVICE_ATTR_RW() helper macro
Date:   Thu, 3 Jun 2021 15:02:30 +0800
Message-ID: <20210603070230.11332-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
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
 drivers/media/rc/imon.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index a7962ca2ac8e3da..2ca4e86c7b9f1d7 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -780,7 +780,7 @@ static int send_set_imon_clock(struct imon_context *ictx,
 /*
  * These are the sysfs functions to handle the association on the iMON 2.4G LT.
  */
-static ssize_t show_associate_remote(struct device *d,
+static ssize_t associate_remote_show(struct device *d,
 				     struct device_attribute *attr,
 				     char *buf)
 {
@@ -800,7 +800,7 @@ static ssize_t show_associate_remote(struct device *d,
 	return strlen(buf);
 }
 
-static ssize_t store_associate_remote(struct device *d,
+static ssize_t associate_remote_store(struct device *d,
 				      struct device_attribute *attr,
 				      const char *buf, size_t count)
 {
@@ -822,7 +822,7 @@ static ssize_t store_associate_remote(struct device *d,
 /*
  * sysfs functions to control internal imon clock
  */
-static ssize_t show_imon_clock(struct device *d,
+static ssize_t imon_clock_show(struct device *d,
 			       struct device_attribute *attr, char *buf)
 {
 	struct imon_context *ictx = dev_get_drvdata(d);
@@ -848,7 +848,7 @@ static ssize_t show_imon_clock(struct device *d,
 	return len;
 }
 
-static ssize_t store_imon_clock(struct device *d,
+static ssize_t imon_clock_store(struct device *d,
 				struct device_attribute *attr,
 				const char *buf, size_t count)
 {
@@ -895,11 +895,8 @@ static ssize_t store_imon_clock(struct device *d,
 }
 
 
-static DEVICE_ATTR(imon_clock, S_IWUSR | S_IRUGO, show_imon_clock,
-		   store_imon_clock);
-
-static DEVICE_ATTR(associate_remote, S_IWUSR | S_IRUGO, show_associate_remote,
-		   store_associate_remote);
+static DEVICE_ATTR_RW(imon_clock);
+static DEVICE_ATTR_RW(associate_remote);
 
 static struct attribute *imon_display_sysfs_entries[] = {
 	&dev_attr_imon_clock.attr,
-- 
2.26.0.106.g9fadedd


