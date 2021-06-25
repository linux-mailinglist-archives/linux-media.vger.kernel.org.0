Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A78FC3B3EF5
	for <lists+linux-media@lfdr.de>; Fri, 25 Jun 2021 10:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbhFYIZt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Jun 2021 04:25:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbhFYIZr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Jun 2021 04:25:47 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8F80C06175F
        for <linux-media@vger.kernel.org>; Fri, 25 Jun 2021 01:23:26 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id DFA031F40AC3
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH 1/2] media: rkisp1: remove field 'vaddr' from 'rkisp1_buffer'
Date:   Fri, 25 Jun 2021 11:23:08 +0300
Message-Id: <20210625082309.24944-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210625082309.24944-1-dafna.hirschfeld@collabora.com>
References: <20210625082309.24944-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The virtual address can be accessed using vb2_plane_vaddr
therefore there is no need to save it in an extra field in
'rkisp1_buffer'. Remove it.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-common.h | 6 +-----
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 3 +--
 drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c  | 6 ++----
 3 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 038c303a8aed..bb73f4e17b66 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -156,15 +156,11 @@ struct rkisp1_vdev_node {
  * @vb:		vb2 buffer
  * @queue:	entry of the buffer in the queue
  * @buff_addr:	dma addresses of each plane, used only by the capture devices: selfpath, mainpath
- * @vaddr:	virtual address for buffers used by params and stats devices
  */
 struct rkisp1_buffer {
 	struct vb2_v4l2_buffer vb;
 	struct list_head queue;
-	union {
-		u32 buff_addr[VIDEO_MAX_PLANES];
-		void *vaddr;
-	};
+	u32 buff_addr[VIDEO_MAX_PLANES];
 };
 
 /*
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index 529c6e21815f..8fa5b0abf1f9 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -1143,7 +1143,7 @@ static void rkisp1_params_apply_params_cfg(struct rkisp1_params *params,
 	cur_buf = list_first_entry(&params->params,
 				   struct rkisp1_buffer, queue);
 
-	new_params = (struct rkisp1_params_cfg *)(cur_buf->vaddr);
+	new_params = (struct rkisp1_params_cfg *)vb2_plane_vaddr(&cur_buf->vb.vb2_buf, 0);
 
 	rkisp1_isp_isr_other_config(params, new_params);
 	rkisp1_isp_isr_meas_config(params, new_params);
@@ -1382,7 +1382,6 @@ static void rkisp1_params_vb2_buf_queue(struct vb2_buffer *vb)
 	struct vb2_queue *vq = vb->vb2_queue;
 	struct rkisp1_params *params = vq->drv_priv;
 
-	params_buf->vaddr = vb2_plane_vaddr(vb, 0);
 	spin_lock_irq(&params->config_lock);
 	list_add_tail(&params_buf->queue, &params->params);
 	spin_unlock_irq(&params->config_lock);
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
index c1d07a2e8839..e88bdd612d71 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
@@ -112,7 +112,6 @@ static void rkisp1_stats_vb2_buf_queue(struct vb2_buffer *vb)
 	struct vb2_queue *vq = vb->vb2_queue;
 	struct rkisp1_stats *stats_dev = vq->drv_priv;
 
-	stats_buf->vaddr = vb2_plane_vaddr(vb, 0);
 
 	spin_lock_irq(&stats_dev->lock);
 	list_add_tail(&stats_buf->queue, &stats_dev->stat);
@@ -305,9 +304,8 @@ rkisp1_stats_send_measurement(struct rkisp1_stats *stats, u32 isp_ris)
 	if (!cur_buf)
 		return;
 
-	cur_stat_buf =
-		(struct rkisp1_stat_buffer *)(cur_buf->vaddr);
-
+	cur_stat_buf = (struct rkisp1_stat_buffer *)
+			vb2_plane_vaddr(&cur_buf->vb.vb2_buf, 0);
 	if (isp_ris & RKISP1_CIF_ISP_AWB_DONE)
 		rkisp1_stats_get_awb_meas(stats, cur_stat_buf);
 
-- 
2.17.1

