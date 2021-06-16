Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB9D43A9A62
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 14:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232915AbhFPMax (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 08:30:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:49300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232543AbhFPMaq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 08:30:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9825D613C1;
        Wed, 16 Jun 2021 12:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623846520;
        bh=6esczEUC+IAp1wiH2+5uojr1T2m2zz+t/CuNq/KViCQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=K4zuMsVGPMOi3SVQn90yWK7XUuLc/v436/GjGpW7KhK3WcvVWEnZmDMFSbBmvxCS3
         vxgHiHl/GdHe1JRORqirVkCgFAy4EvHkl2o/UZtwznki4ChPk92vAkzc3TsoyGf4Xp
         mHnCrH16I58Fn2bw0+MppGVKqI4Zybs1oI5vGa6mwhn6We0KYW1SmgSXBehLOuTXwy
         KvmuPtVL8+swAgQ7dWnKzuGb1ymso+zhybCXODvn0QLs/uVP5vD6MyoVAVa/poACl0
         FnRx0vNVCbdEhIedt2lBU6nKm31yt2h34usvCVmkZzNV7366Ri/R/Ap21CeNVXsQyr
         py0l8vtepZnzQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1ltUes-004oj3-Hz; Wed, 16 Jun 2021 14:28:38 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH 11/11] media: xilinx: simplify get fourcc logic
Date:   Wed, 16 Jun 2021 14:28:37 +0200
Message-Id: <bc012d0e221659d0a937e5bf8a9c0e449e5f3609.1623846327.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623846327.git.mchehab+huawei@kernel.org>
References: <cover.1623846327.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Right now, there are two calls for xvip_get_format_by_fourcc().
If the first one fails, it is called again in order to pick
the first available format: V4L2_PIX_FMT_YUYV.

This ends by producing a smatch warnings:
	drivers/media/platform/xilinx/xilinx-dma.c:555 __xvip_dma_try_format() error: 'info' dereferencing possible ERR_PTR()
	drivers/media/platform/xilinx/xilinx-dma.c: drivers/media/platform/xilinx/xilinx-dma.c:664 xvip_dma_init() error: 'dma->fmtinfo' dereferencing possible ERR_PTR()

as it is hard for an static analyzer to ensure that calling
xvip_get_format_by_fourcc(XVIP_DMA_DEF_FORMAT) won't return an
error.

So, better to optimize the logic, ensuring that the function
will never return an error.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/xilinx/xilinx-dma.c | 5 +----
 drivers/media/platform/xilinx/xilinx-vip.c | 6 +++---
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
index 2a56201cb853..338c3661d809 100644
--- a/drivers/media/platform/xilinx/xilinx-dma.c
+++ b/drivers/media/platform/xilinx/xilinx-dma.c
@@ -26,7 +26,6 @@
 #include "xilinx-vip.h"
 #include "xilinx-vipp.h"
 
-#define XVIP_DMA_DEF_FORMAT		V4L2_PIX_FMT_YUYV
 #define XVIP_DMA_DEF_WIDTH		1920
 #define XVIP_DMA_DEF_HEIGHT		1080
 
@@ -549,8 +548,6 @@ __xvip_dma_try_format(struct xvip_dma *dma, struct v4l2_pix_format *pix,
 	 * requested format isn't supported.
 	 */
 	info = xvip_get_format_by_fourcc(pix->pixelformat);
-	if (IS_ERR(info))
-		info = xvip_get_format_by_fourcc(XVIP_DMA_DEF_FORMAT);
 
 	pix->pixelformat = info->fourcc;
 	pix->field = V4L2_FIELD_NONE;
@@ -660,7 +657,7 @@ int xvip_dma_init(struct xvip_composite_device *xdev, struct xvip_dma *dma,
 	INIT_LIST_HEAD(&dma->queued_bufs);
 	spin_lock_init(&dma->queued_lock);
 
-	dma->fmtinfo = xvip_get_format_by_fourcc(XVIP_DMA_DEF_FORMAT);
+	dma->fmtinfo = xvip_get_format_by_fourcc(V4L2_PIX_FMT_YUYV);
 	dma->format.pixelformat = dma->fmtinfo->fourcc;
 	dma->format.colorspace = V4L2_COLORSPACE_SRGB;
 	dma->format.field = V4L2_FIELD_NONE;
diff --git a/drivers/media/platform/xilinx/xilinx-vip.c b/drivers/media/platform/xilinx/xilinx-vip.c
index 6ad61b08a31a..a4eb57683411 100644
--- a/drivers/media/platform/xilinx/xilinx-vip.c
+++ b/drivers/media/platform/xilinx/xilinx-vip.c
@@ -70,8 +70,8 @@ EXPORT_SYMBOL_GPL(xvip_get_format_by_code);
  * @fourcc: the format 4CC
  *
  * Return: a pointer to the format information structure corresponding to the
- * given V4L2 format @fourcc, or ERR_PTR if no corresponding format can be
- * found.
+ * given V4L2 format @fourcc. If not found, return a pointer to the first
+ * available format (V4L2_PIX_FMT_YUYV).
  */
 const struct xvip_video_format *xvip_get_format_by_fourcc(u32 fourcc)
 {
@@ -84,7 +84,7 @@ const struct xvip_video_format *xvip_get_format_by_fourcc(u32 fourcc)
 			return format;
 	}
 
-	return ERR_PTR(-EINVAL);
+	return &xvip_video_formats[0];
 }
 EXPORT_SYMBOL_GPL(xvip_get_format_by_fourcc);
 
-- 
2.31.1

