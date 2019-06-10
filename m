Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AFE03BDE2
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2019 22:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388363AbfFJUzr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jun 2019 16:55:47 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59308 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388135AbfFJUzr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jun 2019 16:55:47 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id E4F9028414D
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Pawel Osciak <pawel@osciak.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Rick Chang <rick.chang@mediatek.com>,
        Bin Liu <bin.liu@mediatek.com>
Subject: [PATCH v2 2/5] media: mtk-jpeg: Use vb2_get_buffer
Date:   Mon, 10 Jun 2019 17:55:23 -0300
Message-Id: <20190610205526.2629-3-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190610205526.2629-1-ezequiel@collabora.com>
References: <20190610205526.2629-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the newly introduced vb2_get_buffer API and avoid
accessing buffers in the queue directly.

Cc: Rick Chang <rick.chang@mediatek.com>
Cc: Bin Liu <bin.liu@mediatek.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 3b199662cb34..f8f808abada1 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -526,7 +526,7 @@ static int mtk_jpeg_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 		return -EINVAL;
 	}
 
-	vb = vq->bufs[buf->index];
+	vb = vb2_get_buffer(vq, buf->index);
 	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(vb);
 	jpeg_src_buf->flags = (buf->m.planes[0].bytesused == 0) ?
 		MTK_JPEG_BUF_FLAGS_LAST_FRAME : MTK_JPEG_BUF_FLAGS_INIT;
-- 
2.20.1

