Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4270D2321EC
	for <lists+linux-media@lfdr.de>; Wed, 29 Jul 2020 17:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727098AbgG2PtX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jul 2020 11:49:23 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:8294 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726365AbgG2PtX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jul 2020 11:49:23 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 947B91F0596D060985ED;
        Wed, 29 Jul 2020 23:49:20 +0800 (CST)
Received: from kernelci-master.huawei.com (10.175.101.6) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Wed, 29 Jul 2020 23:49:13 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Hulk Robot <hulkci@huawei.com>,
        Oded Gabbay <oded.gabbay@gmail.com>,
        "Arnd Bergmann" <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Omer Shpigelman <oshpigelman@habana.ai>,
        "Tomer Tayar" <ttayar@habana.ai>, Ofir Bitton <obitton@habana.ai>
CC:     Wei Yongjun <weiyongjun1@huawei.com>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH -next] habanalabs: remove unused but set variable 'ctx_asid'
Date:   Wed, 29 Jul 2020 23:59:02 +0800
Message-ID: <20200729155902.33976-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Gcc report warning as follows:

drivers/misc/habanalabs/common/command_submission.c:373:6: warning:
 variable 'ctx_asid' set but not used [-Wunused-but-set-variable]
  373 |  int ctx_asid, rc;
      |      ^~~~~~~~

This variable is not used in function cs_timedout(), this commit
remove it to fix the warning.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 .../misc/habanalabs/common/command_submission.c    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/misc/habanalabs/common/command_submission.c b/drivers/misc/habanalabs/common/command_submission.c
index e096532c0e48..b9840e368eb5 100644
--- a/drivers/misc/habanalabs/common/command_submission.c
+++ b/drivers/misc/habanalabs/common/command_submission.c
@@ -370,7 +370,7 @@ static void cs_do_release(struct kref *ref)
 static void cs_timedout(struct work_struct *work)
 {
 	struct hl_device *hdev;
-	int ctx_asid, rc;
+	int rc;
 	struct hl_cs *cs = container_of(work, struct hl_cs,
 						 work_tdr.work);
 	rc = cs_get_unless_zero(cs);
@@ -386,7 +386,6 @@ static void cs_timedout(struct work_struct *work)
 	cs->timedout = true;
 
 	hdev = cs->ctx->hdev;
-	ctx_asid = cs->ctx->asid;
 
 	dev_err(hdev->dev,
 		"Command submission %llu has not finished in time!\n",

