Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1F6C3756F2
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235649AbhEFP2M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:28:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:40888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235200AbhEFP1y (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:27:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E72E1613C7;
        Thu,  6 May 2021 15:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314800;
        bh=4K87ljT9ixqFdaKF30WMhbJexV0Sw0oEND6zL2GFWyI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lLnjGGdtKuEp8Ae3/TLwodZT6L9J0mJGUVHCcp7oiubnKJP1SN9PJ3SE5sOvTz8H/
         jtqudlwpiO/23UqSTQDZCt3Pxq74xnaA+uOZSx30VRKccvIgAmiR7OvNO41C7iwNCX
         W0nzOB/wuyooRIvmkyzcbQ9DSP6HcVP6KcQ27M8XVL010CcUA/yY/vBCxdYUp3/OfM
         24y8PK3CbqFAx8Q5+64Omd3C05O4QRwUlx1qdkNm1bi5pXwl139s9xdyxK1ATvE6dO
         jBEjXvCS2XTutIlFerMoPnUREcvkAO4FXTnUiw5jxlHJn/6YDUiJtAjCcaB7tzyKh8
         JtYHol86iAkxQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1left7-000SBT-SM; Thu, 06 May 2021 17:26:05 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Jacob Chen <jacob-chen@iotwrt.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [PATCH v5 07/25] media: rockchip/rga: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:25:45 +0200
Message-Id: <ce18a4f9ca1bdcf4c68e77eaa410ec03a6ec8fe2.1620314616.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620314616.git.mchehab+huawei@kernel.org>
References: <cover.1620314616.git.mchehab+huawei@kernel.org>
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

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
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

