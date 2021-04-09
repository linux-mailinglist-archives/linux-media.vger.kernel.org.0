Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7536F35924B
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 04:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233069AbhDIC5b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 22:57:31 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:16104 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232662AbhDIC53 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Apr 2021 22:57:29 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGjRC5GNLz1BGNM;
        Fri,  9 Apr 2021 10:55:03 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.175) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Fri, 9 Apr 2021 10:57:05 +0800
From:   Lu Jialin <lujialin4@huawei.com>
To:     <lujialin4@huawei.com>,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Xiu Jianfeng" <xiujianfeng@huawei.com>,
        Xiang Yang <xiangyang3@huawei.com>,
        "Wang Weiyang" <wangweiyang2@huawei.com>,
        Cui GaoSheng <cuigaosheng1@huawei.com>,
        Gong Ruiqi <gongruiqi1@huawei.com>
Subject: [PATCH -next] media: s3c-camif: fix PM reference leak in s3c_camif_open()
Date:   Fri, 9 Apr 2021 10:57:09 +0800
Message-ID: <20210409025709.181908-1-lujialin4@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.174.175]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

pm_runtime_get_sync will increment pm usage counter even it failed.
Forgetting to putting operation will result in reference leak here.
Fix it by replacing it with pm_runtime_resume_and_get to keep usage
counter balanced.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Lu Jialin <lujialin4@huawei.com>
---
 drivers/media/platform/s3c-camif/camif-capture.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/s3c-camif/camif-capture.c b/drivers/media/platform/s3c-camif/camif-capture.c
index 9ca49af29542..62241ec3b978 100644
--- a/drivers/media/platform/s3c-camif/camif-capture.c
+++ b/drivers/media/platform/s3c-camif/camif-capture.c
@@ -547,7 +547,7 @@ static int s3c_camif_open(struct file *file)
 	if (ret < 0)
 		goto unlock;
 
-	ret = pm_runtime_get_sync(camif->dev);
+	ret = pm_runtime_resume_and_get(camif->dev);
 	if (ret < 0)
 		goto err_pm;
 

