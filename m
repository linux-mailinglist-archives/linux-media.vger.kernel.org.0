Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDF4236DA12
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240386AbhD1Oxr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:53:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:36312 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240281AbhD1Oxa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D39F46144E;
        Wed, 28 Apr 2021 14:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=XfZSeMotNFyXbfT608pw1ECU5JJkssXPopFyWbltzaE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gQMN97eC7BEDIz1pxwojfxcjha4oPcG+hRlJfly/9mEn3EVUjF6A17eUhRaUV4Av6
         9llNqcINPObifS7R+KKJzcq9sElWMQUcLuEgUGm4dEcPAo7WPuTsJBo8FAKaKUj9Hk
         VsE0m0+uaGwgEcNcCKy4FE+EybZisDq15Xlqw+m72JjyXstPa88Kj6is8ypDBGKPdI
         X5k3QuLFiBcmGJ+6I0pWZTX0FzZ3AimINfu9/sQCxIkKFaooCIrQkh6kuh/y12/DqV
         q/M582iW3kDaTv+n6EwJSHs1PeakpZmbEzfwaSOI0e14HbJuwkIcKyqgVAiYfHvp5V
         b2Ttn7u9UJXRw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYP-001Dq4-RV; Wed, 28 Apr 2021 16:52:41 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v4 10/79] media: mdk-mdp: fix pm_runtime_get_sync() usage count
Date:   Wed, 28 Apr 2021 16:51:31 +0200
Message-Id: <39851c54046fa0d63f34549803df3388361828b7.1619621413.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pm_runtime_get_sync() internally increments the
dev->power.usage_count without decrementing it, even on errors.
Replace it by the new pm_runtime_resume_and_get(), introduced by:
commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
in order to properly decrement the usage counter and avoid memory
leaks.

While here, fix the return contition of mtk_mdp_m2m_start_streaming(),
as it doesn't make any sense to return 0 if the PM runtime failed
to resume.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
index ace4528cdc5e..f14779e7596e 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
@@ -391,12 +391,12 @@ static int mtk_mdp_m2m_start_streaming(struct vb2_queue *q, unsigned int count)
 	struct mtk_mdp_ctx *ctx = q->drv_priv;
 	int ret;
 
-	ret = pm_runtime_get_sync(&ctx->mdp_dev->pdev->dev);
+	ret = pm_runtime_resume_and_get(&ctx->mdp_dev->pdev->dev);
 	if (ret < 0)
-		mtk_mdp_dbg(1, "[%d] pm_runtime_get_sync failed:%d",
+		mtk_mdp_dbg(1, "[%d] pm_runtime_resume_and_get failed:%d",
 			    ctx->id, ret);
 
-	return 0;
+	return ret;
 }
 
 static void *mtk_mdp_m2m_buf_remove(struct mtk_mdp_ctx *ctx,
-- 
2.30.2

