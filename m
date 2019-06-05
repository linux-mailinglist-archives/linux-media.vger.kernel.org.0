Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2508E35D68
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 15:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727852AbfFENAe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 09:00:34 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:18084 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727601AbfFENAe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 Jun 2019 09:00:34 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 5444C141E15664E96DBB;
        Wed,  5 Jun 2019 21:00:31 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Wed, 5 Jun 2019 21:00:21 +0800
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
To:     Mike Isely <isely@pobox.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH] media: pvrusb2: fix null-ptr-deref in class_unregister()
Date:   Wed, 5 Jun 2019 21:08:20 +0800
Message-ID: <20190605130820.19306-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The class_ptr will be NULL if pvr2_sysfs_class_create() fails
in pvr_init(), when call pvr2_sysfs_class_destroy(), it will
lead to null-ptr-deref, fix it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 drivers/media/usb/pvrusb2/pvrusb2-sysfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-sysfs.c b/drivers/media/usb/pvrusb2/pvrusb2-sysfs.c
index 7bc6d090358e..b6c6b314fadc 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-sysfs.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-sysfs.c
@@ -802,7 +802,8 @@ struct pvr2_sysfs_class *pvr2_sysfs_class_create(void)
 void pvr2_sysfs_class_destroy(struct pvr2_sysfs_class *clp)
 {
 	pvr2_sysfs_trace("Unregistering pvr2_sysfs_class id=%p", clp);
-	class_unregister(&clp->class);
+	if (clp)
+		class_unregister(&clp->class);
 }
 
 
-- 
2.20.1

