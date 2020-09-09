Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4EF262DFB
	for <lists+linux-media@lfdr.de>; Wed,  9 Sep 2020 13:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729129AbgIILhm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Sep 2020 07:37:42 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:32860 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729621AbgIILgl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Sep 2020 07:36:41 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 2B942C9497287A881891;
        Wed,  9 Sep 2020 19:20:18 +0800 (CST)
Received: from kernelci-master.huawei.com (10.175.101.6) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Wed, 9 Sep 2020 19:20:11 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Hulk Robot <hulkci@huawei.com>, Jonathan Corbet <corbet@lwn.net>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Lubomir Rintel <lkundrak@v3.sk>
CC:     Wei Yongjun <weiyongjun1@huawei.com>, <linux-media@vger.kernel.org>
Subject: [PATCH -next] media: marvell-ccic: mmp: mark PM functions as __maybe_unused
Date:   Wed, 9 Sep 2020 19:29:21 +0800
Message-ID: <20200909112921.5116-1-weiyongjun1@huawei.com>
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

The suspend/resume functions have no callers depending on
configuration, so they must be marked __maybe_unused to
avoid these harmless warnings:

drivers/media/platform/marvell-ccic/mmp-driver.c:347:12: warning:
 'mmpcam_resume' defined but not used [-Wunused-function]
  347 | static int mmpcam_resume(struct device *dev)
      |            ^~~~~~~~~~~~~
drivers/media/platform/marvell-ccic/mmp-driver.c:338:12: warning:
 'mmpcam_suspend' defined but not used [-Wunused-function]
  338 | static int mmpcam_suspend(struct device *dev)
      |            ^~~~~~~~~~~~~~

Fixes: 55cd34524aa3 ("media: marvell-ccic: add support for runtime PM")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/media/platform/marvell-ccic/mmp-driver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/marvell-ccic/mmp-driver.c b/drivers/media/platform/marvell-ccic/mmp-driver.c
index c4b28a00a3a2..cd902b180669 100644
--- a/drivers/media/platform/marvell-ccic/mmp-driver.c
+++ b/drivers/media/platform/marvell-ccic/mmp-driver.c
@@ -335,7 +335,7 @@ static int mmpcam_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int mmpcam_suspend(struct device *dev)
+static int __maybe_unused mmpcam_suspend(struct device *dev)
 {
 	struct mmp_camera *cam = dev_get_drvdata(dev);
 
@@ -344,7 +344,7 @@ static int mmpcam_suspend(struct device *dev)
 	return 0;
 }
 
-static int mmpcam_resume(struct device *dev)
+static int __maybe_unused mmpcam_resume(struct device *dev)
 {
 	struct mmp_camera *cam = dev_get_drvdata(dev);
 

