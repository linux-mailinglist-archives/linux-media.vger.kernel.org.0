Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F10237865
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 17:45:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729242AbfFFPpa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 11:45:30 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59092 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729185AbfFFPp3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jun 2019 11:45:29 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 52A1328533F
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Pawel Osciak <pawel@osciak.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 5/5] media: rockchip: Use vb2_get_buffer
Date:   Thu,  6 Jun 2019 12:44:26 -0300
Message-Id: <20190606154426.6899-6-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606154426.6899-1-ezequiel@collabora.com>
References: <20190606154426.6899-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the newly introduced vb2_get_buffer API and avoid
accessing buffers in the queue directly.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c b/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
index b94ff97451db..ad17e04e701a 100644
--- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
+++ b/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
@@ -45,12 +45,15 @@ void *rockchip_vpu_get_ctrl(struct rockchip_vpu_ctx *ctx, u32 id)
 
 dma_addr_t rockchip_vpu_get_ref(struct vb2_queue *q, u64 ts)
 {
+	struct vb2_buffer *buf;
 	int index;
 
 	index = vb2_find_timestamp(q, ts, 0);
-	if (index >= 0)
-		return vb2_dma_contig_plane_dma_addr(q->bufs[index], 0);
-	return 0;
+	if (index < 0)
+		return 0;
+
+	buf = vb2_get_buffer(q, index);
+	return vb2_dma_contig_plane_dma_addr(buf, 0);
 }
 
 static int
-- 
2.20.1

