Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC1D93AB3E9
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 14:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231668AbhFQMrL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 08:47:11 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:7472 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230473AbhFQMrK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 08:47:10 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G5MBg4fkKzZgDg;
        Thu, 17 Jun 2021 20:42:03 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 17 Jun 2021 20:45:00 +0800
Received: from huawei.com (10.175.127.227) by dggpeml500020.china.huawei.com
 (7.185.36.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 17 Jun
 2021 20:44:59 +0800
From:   Baokun Li <libaokun1@huawei.com>
To:     <libaokun1@huawei.com>, <mchehab@kernel.org>,
        <sakari.ailus@linux.intel.com>, <gregkh@linuxfoundation.org>,
        <andriy.shevchenko@linux.intel.com>, <kaixuxia@tencent.com>,
        <gustavoars@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC:     <weiyongjun1@huawei.com>, <yuehaibing@huawei.com>,
        <yangjihong1@huawei.com>, <yukuai3@huawei.com>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next v5] media: staging: atomisp: use list_splice_init in atomisp_compat_css20.c
Date:   Thu, 17 Jun 2021 20:53:57 +0800
Message-ID: <20210617125357.675562-1-libaokun1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Using list_splice_init() instead of entire while-loops
in atomisp_compat_css20.c.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Baokun Li <libaokun1@huawei.com>
---
V1->V2:
	CC mailist
V2->V3:
        Using list_move_tail() -> Using list_splice_init()
V3->V4:
        Remove redundant 'asd->'
V4->V5:
        Add the version information for 'V3->V4:'

 .../media/atomisp/pci/atomisp_compat_css20.c  | 35 +++----------------
 1 file changed, 5 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index f60198bb8a1a..7831bdac96ff 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -2144,42 +2144,17 @@ void atomisp_css_stop(struct atomisp_sub_device *asd,
 	}
 
 	/* move stats buffers to free queue list */
-	while (!list_empty(&asd->s3a_stats_in_css)) {
-		s3a_buf = list_entry(asd->s3a_stats_in_css.next,
-				     struct atomisp_s3a_buf, list);
-		list_del(&s3a_buf->list);
-		list_add_tail(&s3a_buf->list, &asd->s3a_stats);
-	}
-	while (!list_empty(&asd->s3a_stats_ready)) {
-		s3a_buf = list_entry(asd->s3a_stats_ready.next,
-				     struct atomisp_s3a_buf, list);
-		list_del(&s3a_buf->list);
-		list_add_tail(&s3a_buf->list, &asd->s3a_stats);
-	}
+	list_splice_init(&asd->s3a_stats_in_css, &asd->s3a_stats);
+	list_splice_init(&asd->s3a_stats_ready, &asd->s3a_stats);
 
 	spin_lock_irqsave(&asd->dis_stats_lock, irqflags);
-	while (!list_empty(&asd->dis_stats_in_css)) {
-		dis_buf = list_entry(asd->dis_stats_in_css.next,
-				     struct atomisp_dis_buf, list);
-		list_del(&dis_buf->list);
-		list_add_tail(&dis_buf->list, &asd->dis_stats);
-	}
+	list_splice_init(&asd->dis_stats_in_css, &asd->dis_stats);
 	asd->params.dis_proj_data_valid = false;
 	spin_unlock_irqrestore(&asd->dis_stats_lock, irqflags);
 
 	for (i = 0; i < ATOMISP_METADATA_TYPE_NUM; i++) {
-		while (!list_empty(&asd->metadata_in_css[i])) {
-			md_buf = list_entry(asd->metadata_in_css[i].next,
-					    struct atomisp_metadata_buf, list);
-			list_del(&md_buf->list);
-			list_add_tail(&md_buf->list, &asd->metadata[i]);
-		}
-		while (!list_empty(&asd->metadata_ready[i])) {
-			md_buf = list_entry(asd->metadata_ready[i].next,
-					    struct atomisp_metadata_buf, list);
-			list_del(&md_buf->list);
-			list_add_tail(&md_buf->list, &asd->metadata[i]);
-		}
+		list_splice_init(&asd->metadata_in_css[i], &asd->metadata[i]);
+		list_splice_init(&asd->metadata_ready[i], &asd->metadata[i]);
 	}
 
 	atomisp_flush_params_queue(&asd->video_out_capture);
-- 
2.31.1

