Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C01BD263F62
	for <lists+linux-media@lfdr.de>; Thu, 10 Sep 2020 10:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730136AbgIJIJx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Sep 2020 04:09:53 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:39658 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726381AbgIJIJr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Sep 2020 04:09:47 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id A747E8E7DDE25C71BF4E;
        Thu, 10 Sep 2020 16:09:45 +0800 (CST)
Received: from localhost (10.174.179.108) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Thu, 10 Sep 2020
 16:09:39 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <corbet@lwn.net>, <mchehab@kernel.org>, <lkundrak@v3.sk>,
        <hverkuil-cisco@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] media: marvell-ccic: Fix -Wunused-function warnings
Date:   Thu, 10 Sep 2020 16:09:33 +0800
Message-ID: <20200910080933.40684-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.108]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If CONFIG_PM is n, gcc warns:

drivers/media/platform/marvell-ccic/mmp-driver.c:347:12: warning: ‘mmpcam_resume’ defined but not used [-Wunused-function]
 static int mmpcam_resume(struct device *dev)
            ^~~~~~~~~~~~~
drivers/media/platform/marvell-ccic/mmp-driver.c:338:12: warning: ‘mmpcam_suspend’ defined but not used [-Wunused-function]
 static int mmpcam_suspend(struct device *dev)
            ^~~~~~~~~~~~~~
drivers/media/platform/marvell-ccic/mmp-driver.c:324:12: warning: ‘mmpcam_runtime_suspend’ defined but not used [-Wunused-function]
 static int mmpcam_runtime_suspend(struct device *dev)
            ^~~~~~~~~~~~~~~~~~~~~~
drivers/media/platform/marvell-ccic/mmp-driver.c:310:12: warning: ‘mmpcam_runtime_resume’ defined but not used [-Wunused-function]
 static int mmpcam_runtime_resume(struct device *dev)
            ^~~~~~~~~~~~~~~~~~~~~

Mark them as __maybe_unused to fix this.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/media/platform/marvell-ccic/mmp-driver.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/marvell-ccic/mmp-driver.c b/drivers/media/platform/marvell-ccic/mmp-driver.c
index c4b28a00a3a2..032fdddbbecc 100644
--- a/drivers/media/platform/marvell-ccic/mmp-driver.c
+++ b/drivers/media/platform/marvell-ccic/mmp-driver.c
@@ -307,7 +307,7 @@ static int mmpcam_platform_remove(struct platform_device *pdev)
  * Suspend/resume support.
  */
 
-static int mmpcam_runtime_resume(struct device *dev)
+static int __maybe_unused mmpcam_runtime_resume(struct device *dev)
 {
 	struct mmp_camera *cam = dev_get_drvdata(dev);
 	struct mcam_camera *mcam = &cam->mcam;
@@ -321,7 +321,7 @@ static int mmpcam_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int mmpcam_runtime_suspend(struct device *dev)
+static int __maybe_unused mmpcam_runtime_suspend(struct device *dev)
 {
 	struct mmp_camera *cam = dev_get_drvdata(dev);
 	struct mcam_camera *mcam = &cam->mcam;
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
 
-- 
2.17.1


