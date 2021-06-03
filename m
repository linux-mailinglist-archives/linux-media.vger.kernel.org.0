Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADCBA399B49
	for <lists+linux-media@lfdr.de>; Thu,  3 Jun 2021 09:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbhFCHMC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Jun 2021 03:12:02 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:4290 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbhFCHMB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Jun 2021 03:12:01 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4FwcNq4WPTz1BHRR;
        Thu,  3 Jun 2021 15:05:31 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 15:10:15 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 15:10:15 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] media: bttv: use DEVICE_ATTR_RO() helper macro
Date:   Thu, 3 Jun 2021 15:10:09 +0800
Message-ID: <20210603071009.11438-1-thunder.leizhen@huawei.com>
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
 drivers/media/pci/bt8xx/bttv-driver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index 1f62a9d8ea1d323..e2e77b335c1523e 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -170,14 +170,14 @@ MODULE_VERSION(BTTV_VERSION);
 /* ----------------------------------------------------------------------- */
 /* sysfs                                                                   */
 
-static ssize_t show_card(struct device *cd,
+static ssize_t card_show(struct device *cd,
 			 struct device_attribute *attr, char *buf)
 {
 	struct video_device *vfd = to_video_device(cd);
 	struct bttv *btv = video_get_drvdata(vfd);
 	return sprintf(buf, "%d\n", btv ? btv->c.type : UNSET);
 }
-static DEVICE_ATTR(card, S_IRUGO, show_card, NULL);
+static DEVICE_ATTR_RO(card);
 
 /* ----------------------------------------------------------------------- */
 /* dvb auto-load setup                                                     */
-- 
2.26.0.106.g9fadedd


