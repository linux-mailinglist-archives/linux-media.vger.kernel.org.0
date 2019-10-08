Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18C59CF583
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 11:02:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730220AbfJHJCE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 05:02:04 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:42368 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730040AbfJHJCE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Oct 2019 05:02:04 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id B8F742D0AAE7A6725DE1;
        Tue,  8 Oct 2019 17:02:01 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Tue, 8 Oct 2019 17:01:51 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     Wei Yongjun <weiyongjun1@huawei.com>,
        <linux-media@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] media: vimc: Fix error return code in vimc_register_devices()
Date:   Tue, 8 Oct 2019 09:01:33 +0000
Message-ID: <20191008090133.9760-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix to return a negative error code from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: f13d5f361959 ("media: vimc: Collapse component structure into a single monolithic driver")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/media/platform/vimc/vimc-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
index 6e3e5c91ae39..2d20a7c10398 100644
--- a/drivers/media/platform/vimc/vimc-core.c
+++ b/drivers/media/platform/vimc/vimc-core.c
@@ -202,8 +202,10 @@ static int vimc_register_devices(struct vimc_device *vimc)
 	vimc->ent_devs = kmalloc_array(vimc->pipe_cfg->num_ents,
 				       sizeof(*vimc->ent_devs),
 				       GFP_KERNEL);
-	if (!vimc->ent_devs)
+	if (!vimc->ent_devs) {
+		ret = -ENOMEM;
 		goto err_v4l2_unregister;
+	}
 
 	/* Invoke entity config hooks to initialize and register subdevs */
 	ret = vimc_add_subdevs(vimc);



