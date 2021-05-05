Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 862A53737D6
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 11:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232753AbhEEJnZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 05:43:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:48666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232450AbhEEJnR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 05:43:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 745C861442;
        Wed,  5 May 2021 09:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620207739;
        bh=jUOSb8B9UNKJb4CE+kKLFa5IDIlxTUV4my+V18i70ck=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pvz3y1mbOSUJt0QSW0upnvSm2Y3anXrjyUxdYZ3k0aLlwT4LaZaNha8HUW0mZdlbr
         Q92lXHYKY4fS8BRySZyoX2vBkayQSyKr1O67BmOX9WrmpLGEdgs+v27T1qsYyrdg0P
         CJvdWltm/ibL4jPbaO08LScm2ScyAxPJLuE68I18mwCFd7qPAsvv373PqBq95774I0
         df+q6EMijreBjWVwxEN3nFk5n7BzdAYBTmHypk52NiqahPgJs6i5IiUVdWqdFWTGrh
         tL6RYsE4S4sCgs0nhiUobH/14oMJrduz1/UelMcpaAT6K32ktvObSS9SPb36egAAJB
         SnyiNSbFfXJ/g==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1leE2r-00AHwg-C1; Wed, 05 May 2021 11:42:17 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH 18/25] media: mtk-vcodec: fix PM runtime get logic
Date:   Wed,  5 May 2021 11:42:08 +0200
Message-Id: <b8d69ce52e4e455aa8c6e629e215a52847c7c9e0.1620207353.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620207353.git.mchehab+huawei@kernel.org>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently, the driver just assumes that PM runtime logic
succeded resuming the device.

That may not be the case, as pm_runtime_get_sync()
can fail (but keeping the usage count incremented).

Replace the code to use pm_runtime_resume_and_get(),
and letting it return the error code.

This way, if mtk_vcodec_dec_pw_on() fails, the logic
under fops_vcodec_open() will do the right thing and
return an error, instead of just assuming that the
device is ready to be used.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 4 +++-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c  | 8 +++++---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h  | 2 +-
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 147dfef1638d..f87dc47d9e63 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -126,7 +126,9 @@ static int fops_vcodec_open(struct file *file)
 	mtk_vcodec_dec_set_default_params(ctx);
 
 	if (v4l2_fh_is_singular(&ctx->fh)) {
-		mtk_vcodec_dec_pw_on(&dev->pm);
+		ret = mtk_vcodec_dec_pw_on(&dev->pm);
+		if (ret < 0)
+			goto err_load_fw;
 		/*
 		 * Does nothing if firmware was already loaded.
 		 */
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
index ddee7046ce42..6038db96f71c 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
@@ -88,13 +88,15 @@ void mtk_vcodec_release_dec_pm(struct mtk_vcodec_dev *dev)
 	put_device(dev->pm.larbvdec);
 }
 
-void mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
+int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
 {
 	int ret;
 
-	ret = pm_runtime_get_sync(pm->dev);
+	ret = pm_runtime_resume_and_get(pm->dev);
 	if (ret)
-		mtk_v4l2_err("pm_runtime_get_sync fail %d", ret);
+		mtk_v4l2_err("pm_runtime_resume_and_get fail %d", ret);
+
+	return ret;
 }
 
 void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm)
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
index 872d8bf8cfaf..280aeaefdb65 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
@@ -12,7 +12,7 @@
 int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *dev);
 void mtk_vcodec_release_dec_pm(struct mtk_vcodec_dev *dev);
 
-void mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm);
+int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm);
 void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm);
 void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm);
 void mtk_vcodec_dec_clock_off(struct mtk_vcodec_pm *pm);
-- 
2.30.2

