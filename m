Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEDE2299A5
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2019 16:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404010AbfEXOF0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 May 2019 10:05:26 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:53279 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403918AbfEXOF0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 May 2019 10:05:26 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.89)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hUAp3-0002Dk-5J; Fri, 24 May 2019 16:05:25 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 01/10] rockchip/vpu: remove unused declarations
Date:   Fri, 24 May 2019 16:04:50 +0200
Message-Id: <20190524140459.4002-2-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190524140459.4002-1-p.zabel@pengutronix.de>
References: <20190524140459.4002-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove unused function and struct declarations from the
rockchip_vpu_common.h header file.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 .../media/rockchip/vpu/rockchip_vpu_common.h  | 25 -------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_common.h b/drivers/staging/media/rockchip/vpu/rockchip_vpu_common.h
index 0b6a3fb1a48e..96948ec49c18 100644
--- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_common.h
+++ b/drivers/staging/media/rockchip/vpu/rockchip_vpu_common.h
@@ -18,31 +18,6 @@
 
 #include "rockchip_vpu.h"
 
-extern const struct v4l2_ioctl_ops rockchip_vpu_enc_ioctl_ops;
-extern const struct vb2_ops rockchip_vpu_enc_src_queue_ops;
-extern const struct vb2_ops rockchip_vpu_enc_dst_queue_ops;
-extern const struct v4l2_ioctl_ops rockchip_vpu_dec_ioctl_ops;
-extern const struct vb2_ops rockchip_vpu_dec_src_queue_ops;
-extern const struct vb2_ops rockchip_vpu_dec_dst_queue_ops;
-
-void rockchip_vpu_buf_queue(struct vb2_buffer *vb);
-int rockchip_vpu_src_queue_setup(struct vb2_queue *vq,
-				 unsigned int *num_buffers,
-				 unsigned int *num_planes,
-				 unsigned int sizes[],
-				 struct device *alloc_devs[]);
-int rockchip_vpu_dst_queue_setup(struct vb2_queue *vq,
-				 unsigned int *num_buffers,
-				 unsigned int *num_planes,
-				 unsigned int sizes[],
-				 struct device *alloc_devs[]);
-void rockchip_vpu_buf_request_complete(struct vb2_buffer *vb);
-int rockchip_vpu_buf_out_validate(struct vb2_buffer *vb);
-int rockchip_vpu_src_buf_prepare(struct vb2_buffer *vb);
-int rockchip_vpu_dst_buf_prepare(struct vb2_buffer *vb);
-int rockchip_vpu_start(struct vb2_queue *q, unsigned int count);
-void rockchip_vpu_stop(struct vb2_queue *q);
-
 void *rockchip_vpu_get_ctrl(struct rockchip_vpu_ctx *ctx, u32 id);
 dma_addr_t rockchip_vpu_get_ref(struct vb2_queue *q, u64 ts);
 
-- 
2.20.1

