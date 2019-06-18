Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 598F44AE97
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2019 01:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbfFRXNq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 19:13:46 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36588 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbfFRXNq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 19:13:46 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 250AD2639EC
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hans.verkuil@cisco.com>, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH] media: hantro: Use vb2_get_buffer
Date:   Tue, 18 Jun 2019 20:12:37 -0300
Message-Id: <20190618231237.27466-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <12f39255-bae4-0382-740e-4de4802c374d@xs4all.nl>
References: <12f39255-bae4-0382-740e-4de4802c374d@xs4all.nl>
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
 drivers/staging/media/hantro/hantro_drv.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 1d3af881d088..c3665f0e87a2 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -45,12 +45,14 @@ void *hantro_get_ctrl(struct hantro_ctx *ctx, u32 id)
 
 dma_addr_t hantro_get_ref(struct vb2_queue *q, u64 ts)
 {
+	struct vb2_buffer *buf;
 	int index;
 
 	index = vb2_find_timestamp(q, ts, 0);
-	if (index >= 0)
-		return vb2_dma_contig_plane_dma_addr(q->bufs[index], 0);
-	return 0;
+	if (index < 0)
+		return 0;
+	buf = vb2_get_buffer(q, index);
+	return vb2_dma_contig_plane_dma_addr(buf, 0);
 }
 
 static int
-- 
2.20.1

