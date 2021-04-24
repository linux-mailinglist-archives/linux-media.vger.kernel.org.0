Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE4A4369F89
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:48:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244236AbhDXGsH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:48:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:35796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233271AbhDXGqd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C56B56193A;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246734;
        bh=IASdiN+9/AmiaDBWxGxldIhDXuTHq+MikfucyZPKlwo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QGVXq0zEfEkZQuXyLnQNSlYiPuhq9yLF2nh/YSKCwzW17oE6HLAGe321i0gSkurNY
         +32Ae6lvlNPsCyMDg9bkXmFigFu+mytnPNfTpraZiKpB2fFpzGkpOTNvnp9CNGNdL4
         cZyyU/Z+WWKgxmmFXOoafLtxOf6PqkqatrgYcmb1oh+axYc5AGW5WHV3NTCWobgiWY
         B/Xnx8gEkLknLgmmWJXtrhTkKWcLPVGvtUGxMvccVUVGRsheHeum4a8hyoTxYfRtMK
         htz7EuxlQWiIVLN2f8QU0V8jFkDjpum5M36HqMLz3JcdjSMO5/0YiwK+W13DsuImFG
         uBLtwOY2pqeVQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2n-004Ji2-EV; Sat, 24 Apr 2021 08:45:33 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH 76/78] media: sun4i_v4l2: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:45:26 +0200
Message-Id: <19ff6114784154d1ce289b01bd22230a37b77a98.1619191723.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619191723.git.mchehab+huawei@kernel.org>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
index 4785faddf630..ed6ec41b9c2d 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
@@ -206,9 +206,9 @@ static int sun4i_csi_open(struct file *file)
 	if (ret)
 		return ret;
 
-	ret = pm_runtime_get_sync(csi->dev);
+	ret = pm_runtime_resume_and_get(csi->dev);
 	if (ret < 0)
-		goto err_pm_put;
+		goto err_unlock;
 
 	ret = v4l2_pipeline_pm_get(&csi->vdev.entity);
 	if (ret)
@@ -225,8 +225,7 @@ static int sun4i_csi_open(struct file *file)
 err_pipeline_pm_put:
 	v4l2_pipeline_pm_put(&csi->vdev.entity);
 
-err_pm_put:
-	pm_runtime_put(csi->dev);
+err_unlock:
 	mutex_unlock(&csi->lock);
 
 	return ret;
-- 
2.30.2

