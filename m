Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB6946916F
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 16:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391559AbfGOO3W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 10:29:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:40628 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403792AbfGOO3W (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 10:29:22 -0400
Received: from sasha-vm.mshome.net (unknown [73.61.17.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3DD11205ED;
        Mon, 15 Jul 2019 14:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563200961;
        bh=2d++jWA5F2wqyXwd1xJyeuRJZ96v7j10ERMTWAmBEGk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KgxX05oO6nACy83bTjuCBmpQc4yrDfH0nPMPL73W9xk8AbttzADjQRgFgsGgL8kDY
         301njCxlVbc2tmXj7AFoT5LI/kdVAW7QiEhrGoGHmXl1ax8TZmK1EL/Ytl5CDAUz6R
         6ZoZTPzUVHlXCoV2nYkaPmPNf1jvrg9hvWHNUiQE=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Lubomir Rintel <lkundrak@v3.sk>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 011/105] media: marvell-ccic: fix DMA s/g desc number calculation
Date:   Mon, 15 Jul 2019 10:27:05 -0400
Message-Id: <20190715142839.9896-11-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715142839.9896-1-sashal@kernel.org>
References: <20190715142839.9896-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Lubomir Rintel <lkundrak@v3.sk>

[ Upstream commit 0c7aa32966dab0b8a7424e1b34c7f206817953ec ]

The commit d790b7eda953 ("[media] vb2-dma-sg: move dma_(un)map_sg here")
left dma_desc_nent unset. It previously contained the number of DMA
descriptors as returned from dma_map_sg().

We can now (since the commit referred to above) obtain the same value from
the sg_table and drop dma_desc_nent altogether.

Tested on OLPC XO-1.75 machine. Doesn't affect the OLPC XO-1's Cafe
driver, since that one doesn't do DMA.

[mchehab+samsung@kernel.org: fix a checkpatch warning]

Fixes: d790b7eda953 ("[media] vb2-dma-sg: move dma_(un)map_sg here")
Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/marvell-ccic/mcam-core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/marvell-ccic/mcam-core.c b/drivers/media/platform/marvell-ccic/mcam-core.c
index 7b7250b1cff8..4ecb94860aa4 100644
--- a/drivers/media/platform/marvell-ccic/mcam-core.c
+++ b/drivers/media/platform/marvell-ccic/mcam-core.c
@@ -200,7 +200,6 @@ struct mcam_vb_buffer {
 	struct list_head queue;
 	struct mcam_dma_desc *dma_desc;	/* Descriptor virtual address */
 	dma_addr_t dma_desc_pa;		/* Descriptor physical address */
-	int dma_desc_nent;		/* Number of mapped descriptors */
 };
 
 static inline struct mcam_vb_buffer *vb_to_mvb(struct vb2_v4l2_buffer *vb)
@@ -608,9 +607,11 @@ static void mcam_dma_contig_done(struct mcam_camera *cam, int frame)
 static void mcam_sg_next_buffer(struct mcam_camera *cam)
 {
 	struct mcam_vb_buffer *buf;
+	struct sg_table *sg_table;
 
 	buf = list_first_entry(&cam->buffers, struct mcam_vb_buffer, queue);
 	list_del_init(&buf->queue);
+	sg_table = vb2_dma_sg_plane_desc(&buf->vb_buf.vb2_buf, 0);
 	/*
 	 * Very Bad Not Good Things happen if you don't clear
 	 * C1_DESC_ENA before making any descriptor changes.
@@ -618,7 +619,7 @@ static void mcam_sg_next_buffer(struct mcam_camera *cam)
 	mcam_reg_clear_bit(cam, REG_CTRL1, C1_DESC_ENA);
 	mcam_reg_write(cam, REG_DMA_DESC_Y, buf->dma_desc_pa);
 	mcam_reg_write(cam, REG_DESC_LEN_Y,
-			buf->dma_desc_nent*sizeof(struct mcam_dma_desc));
+			sg_table->nents * sizeof(struct mcam_dma_desc));
 	mcam_reg_write(cam, REG_DESC_LEN_U, 0);
 	mcam_reg_write(cam, REG_DESC_LEN_V, 0);
 	mcam_reg_set_bit(cam, REG_CTRL1, C1_DESC_ENA);
-- 
2.20.1

