Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8CF436C296
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235716AbhD0KPF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:15:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:35166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235412AbhD0KOf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 88BAA61002;
        Tue, 27 Apr 2021 10:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518431;
        bh=uJQR0czm+DeAW2PWQeBvZ4Rvzd+S5i8+90myFebensI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NiQvYMF7OEWPJzkJcicJ7WcKvB0H3GERIgYfA5qd0WtSjnaR0/nAV3hMCadwmEBnt
         4Q0sn828e2ClzSrXWAtUuIDkwINCzefQc5ICV1bguILEAdRR66cv/1jXdl9aEvRcRD
         Bhx8pj/CKQr/EPlPqWchTGcwCLeQnx+qsO71Obg5pOpy0+39ert3POkP7ii32N1zeU
         XveXVnKAn9x/663ekqaHhQLsC16Ik7jDuulgkWxnbnMOCpwuwSCaBDoZ6iUKIiOLGH
         xkHRvRXlm6NGdmEAOPXnHv5P+44UCyanuBFz0MRONQIWQyeh8mwCBCsqWRTqxDSKDW
         SKrNb8oYv9xlQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKiy-000j57-LA; Tue, 27 Apr 2021 12:13:48 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Jacob Chen <jacob-chen@iotwrt.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [PATCH v2 11/79] media: rga-buf: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:12:38 +0200
Message-Id: <a0c6f5de9bbc9c28d2c39878a99a147cff95b3e9.1619518193.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619518193.git.mchehab+huawei@kernel.org>
References: <cover.1619518193.git.mchehab+huawei@kernel.org>
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
 drivers/media/platform/rockchip/rga/rga-buf.c | 3 +--
 drivers/media/platform/rockchip/rga/rga.c     | 4 +++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index bf9a75b75083..81508ed5abf3 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -79,9 +79,8 @@ static int rga_buf_start_streaming(struct vb2_queue *q, unsigned int count)
 	struct rockchip_rga *rga = ctx->rga;
 	int ret;
 
-	ret = pm_runtime_get_sync(rga->dev);
+	ret = pm_runtime_resume_and_get(rga->dev);
 	if (ret < 0) {
-		pm_runtime_put_noidle(rga->dev);
 		rga_buf_return_buffers(q, VB2_BUF_STATE_QUEUED);
 		return ret;
 	}
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 9d122429706e..bf3fd71ec3af 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -866,7 +866,9 @@ static int rga_probe(struct platform_device *pdev)
 		goto unreg_video_dev;
 	}
 
-	pm_runtime_get_sync(rga->dev);
+	ret = pm_runtime_resume_and_get(rga->dev);
+	if (ret < 0)
+		goto unreg_video_dev;
 
 	rga->version.major = (rga_read(rga, RGA_VERSION_INFO) >> 24) & 0xFF;
 	rga->version.minor = (rga_read(rga, RGA_VERSION_INFO) >> 20) & 0x0F;
-- 
2.30.2

