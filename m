Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDED416780C
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2020 09:46:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730461AbgBUIpl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Feb 2020 03:45:41 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:42819 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729731AbgBUIph (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Feb 2020 03:45:37 -0500
Received: from tschai.fritz.box ([46.9.235.248])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 53wBjunHFPKvK53wFjhWPI; Fri, 21 Feb 2020 09:45:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582274735; bh=6r3JdgwIE2PSKQiGn/76VxWQeu7sf1Oyj29zt6+NQFw=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=CD/x78icKF/m8De7t/EBrdJKxlSA461gK0xxcmJhEPbDlXB7OOotv+vVUdqEW99M0
         OzHw9sUfHXzBY2m8tWM3kirNAnqfaWlscUbhT6BxV8pOJF8fLK3kr6QF6YTcwYlYdN
         2xg+U4wGDBndA7MNOe71xLaW47Rm2b2Krh5pkiHCmURMw6ySHTfyTvTnJkz/tUMwk2
         WNS1OP2g6dAIcZEcvxESIlC/2Zpilu4iaqtsAXElCrg8x9GoYR9Edpn84okt6YfbMN
         Sm7yWCSReWIFjZMsaGBhto7yJR897LUk94KM7APiTTFqlqeOyyToxsgY5EsXEqlczP
         U75V+It1gJK0A==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH 1/9] mtk-vcodec: drop VB2_USERPTR
Date:   Fri, 21 Feb 2020 09:45:23 +0100
Message-Id: <20200221084531.576156-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200221084531.576156-1-hverkuil-cisco@xs4all.nl>
References: <20200221084531.576156-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfAjnkLiP7q4gZpqplTpKO1fI2iBbMeQqXKDivYFuayAtK838oEK2l/w7lRMJCTMEnYgxY3oatVhS7EIvQ5k6wuKVuM+AgLt+sWUGhSm8h1c85bacquQJ
 La1mzHvPUThJhvxp4DbeWijT4sjk+MVbD4hL64WkyK3N7ExcLR4+6czkr9xhqlXm5Y2q189fe+0kmURrEfjzTt4os+u6kEmC0swWuvJB9/PGEl40COs+yBEh
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index d469ff6464b2..910228922791 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -1274,13 +1274,8 @@ int mtk_vcodec_enc_queue_init(void *priv, struct vb2_queue *src_vq,
 	struct mtk_vcodec_ctx *ctx = priv;
 	int ret;
 
-	/* Note: VB2_USERPTR works with dma-contig because mt8173
-	 * support iommu
-	 * https://patchwork.kernel.org/patch/8335461/
-	 * https://patchwork.kernel.org/patch/7596181/
-	 */
 	src_vq->type		= V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
-	src_vq->io_modes	= VB2_DMABUF | VB2_MMAP | VB2_USERPTR;
+	src_vq->io_modes	= VB2_DMABUF | VB2_MMAP;
 	src_vq->drv_priv	= ctx;
 	src_vq->buf_struct_size = sizeof(struct mtk_video_enc_buf);
 	src_vq->ops		= &mtk_venc_vb2_ops;
@@ -1294,7 +1289,7 @@ int mtk_vcodec_enc_queue_init(void *priv, struct vb2_queue *src_vq,
 		return ret;
 
 	dst_vq->type		= V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
-	dst_vq->io_modes	= VB2_DMABUF | VB2_MMAP | VB2_USERPTR;
+	dst_vq->io_modes	= VB2_DMABUF | VB2_MMAP;
 	dst_vq->drv_priv	= ctx;
 	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
 	dst_vq->ops		= &mtk_venc_vb2_ops;
-- 
2.25.0

