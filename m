Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4379265EC8
	for <lists+linux-media@lfdr.de>; Fri, 11 Sep 2020 13:32:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725817AbgIKL3v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Sep 2020 07:29:51 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:11819 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725776AbgIKL2v (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Sep 2020 07:28:51 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 99CD1B578675154FD8E9;
        Fri, 11 Sep 2020 19:27:27 +0800 (CST)
Received: from localhost (10.174.179.108) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Fri, 11 Sep 2020
 19:27:19 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <corbet@lwn.net>, <mchehab@kernel.org>, <lkundrak@v3.sk>,
        <hverkuil-cisco@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH v2 -next] media: marvell-ccic: Fix -Wunused-function warnings
Date:   Fri, 11 Sep 2020 19:27:07 +0800
Message-ID: <20200911112707.32232-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
In-Reply-To: <20200910080933.40684-1-yuehaibing@huawei.com>
References: <20200910080933.40684-1-yuehaibing@huawei.com>
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
v2: Adjust based on https://lore.kernel.org/linux-media/20200909112921.5116-1-weiyongjun1@huawei.com/
---
 drivers/media/platform/marvell-ccic/mmp-driver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/marvell-ccic/mmp-driver.c b/drivers/media/platform/marvell-ccic/mmp-driver.c
index c4b28a00a3a2..c046a0ff3b85 100644
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
-- 
2.17.1


