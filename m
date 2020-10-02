Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3150281AF9
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 20:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387806AbgJBSmf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 14:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbgJBSme (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 14:42:34 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C97BC0613D0
        for <linux-media@vger.kernel.org>; Fri,  2 Oct 2020 11:42:34 -0700 (PDT)
Received: from guri.fritz.box (p200300c7cf13ec00987cfa6c93a91dfa.dip0.t-ipconnect.de [IPv6:2003:c7:cf13:ec00:987c:fa6c:93a9:1dfa])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 46ABB29B258;
        Fri,  2 Oct 2020 19:42:32 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH 3/6] media: staging: rkisp1: initialize buffer lists only on probe
Date:   Fri,  2 Oct 2020 20:42:19 +0200
Message-Id: <20201002184222.7094-4-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201002184222.7094-1-dafna.hirschfeld@collabora.com>
References: <20201002184222.7094-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The buffer lists of stats and params entities
are initialized in queue_setup callback with
'INIT_LIST_HEAD'. It is enough to initialize
the lists only upon registration.
For the stats entity the list is already
initialize upon registration.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-params.c | 4 +---
 drivers/staging/media/rkisp1/rkisp1-stats.c  | 4 ----
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
index cb9f3332a9a0..aa758f8c2264 100644
--- a/drivers/staging/media/rkisp1/rkisp1-params.c
+++ b/drivers/staging/media/rkisp1/rkisp1-params.c
@@ -1420,8 +1420,6 @@ static int rkisp1_params_vb2_queue_setup(struct vb2_queue *vq,
 					 unsigned int sizes[],
 					 struct device *alloc_devs[])
 {
-	struct rkisp1_params *params = vq->drv_priv;
-
 	*num_buffers = clamp_t(u32, *num_buffers,
 			       RKISP1_ISP_PARAMS_REQ_BUFS_MIN,
 			       RKISP1_ISP_PARAMS_REQ_BUFS_MAX);
@@ -1430,7 +1428,6 @@ static int rkisp1_params_vb2_queue_setup(struct vb2_queue *vq,
 
 	sizes[0] = sizeof(struct rkisp1_params_cfg);
 
-	INIT_LIST_HEAD(&params->params);
 	return 0;
 }
 
@@ -1545,6 +1542,7 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
 
 	params->rkisp1 = rkisp1;
 	mutex_init(&node->vlock);
+	INIT_LIST_HEAD(&params->params);
 	spin_lock_init(&params->config_lock);
 
 	strscpy(vdev->name, RKISP1_PARAMS_DEV_NAME, sizeof(vdev->name));
diff --git a/drivers/staging/media/rkisp1/rkisp1-stats.c b/drivers/staging/media/rkisp1/rkisp1-stats.c
index 51c64f75fe29..c58ae52b8a98 100644
--- a/drivers/staging/media/rkisp1/rkisp1-stats.c
+++ b/drivers/staging/media/rkisp1/rkisp1-stats.c
@@ -94,8 +94,6 @@ static int rkisp1_stats_vb2_queue_setup(struct vb2_queue *vq,
 					unsigned int sizes[],
 					struct device *alloc_devs[])
 {
-	struct rkisp1_stats *stats = vq->drv_priv;
-
 	*num_planes = 1;
 
 	*num_buffers = clamp_t(u32, *num_buffers, RKISP1_ISP_STATS_REQ_BUFS_MIN,
@@ -103,8 +101,6 @@ static int rkisp1_stats_vb2_queue_setup(struct vb2_queue *vq,
 
 	sizes[0] = sizeof(struct rkisp1_stat_buffer);
 
-	INIT_LIST_HEAD(&stats->stat);
-
 	return 0;
 }
 
-- 
2.17.1

