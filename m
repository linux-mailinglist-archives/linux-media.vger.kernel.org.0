Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D35BB37864
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 17:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729276AbfFFPp1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 11:45:27 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59086 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729185AbfFFPp0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jun 2019 11:45:26 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 45BCC285341
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Pawel Osciak <pawel@osciak.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jean-Christophe Trotin <jean-christophe.trotin@st.com>
Subject: [PATCH 4/5] media: sti: Use vb2_get_buffer
Date:   Thu,  6 Jun 2019 12:44:25 -0300
Message-Id: <20190606154426.6899-5-ezequiel@collabora.com>
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

Cc: Jean-Christophe Trotin <jean-christophe.trotin@st.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/platform/sti/hva/hva-v4l2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/sti/hva/hva-v4l2.c b/drivers/media/platform/sti/hva/hva-v4l2.c
index c42623dccfd6..64004d15a9c9 100644
--- a/drivers/media/platform/sti/hva/hva-v4l2.c
+++ b/drivers/media/platform/sti/hva/hva-v4l2.c
@@ -566,6 +566,7 @@ static int hva_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 		 */
 		struct vb2_queue *vq;
 		struct hva_stream *stream;
+		struct vb2_buffer *vb2_buf;
 
 		vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, buf->type);
 
@@ -575,7 +576,8 @@ static int hva_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 			return -EINVAL;
 		}
 
-		stream = (struct hva_stream *)vq->bufs[buf->index];
+		vb2_buf = vb2_get_buffer(vq, buf->index);
+		stream = to_hva_stream(to_vb2_v4l2_buffer(vb2_buf));
 		stream->bytesused = buf->bytesused;
 	}
 
-- 
2.20.1

