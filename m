Return-Path: <linux-media+bounces-1478-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B37D5800CD5
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 15:05:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E52CF1C20F68
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 14:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED963D3BF;
	Fri,  1 Dec 2023 14:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qbcU8xmd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78E0F1B2;
	Fri,  1 Dec 2023 06:05:10 -0800 (PST)
Received: from pyrite.hamster-moth.ts.net (h175-177-049-156.catv02.itscom.jp [175.177.49.156])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 177711AC0;
	Fri,  1 Dec 2023 15:04:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701439472;
	bh=ZafNoeEiTkEMR2Mskz+/jeQsiJ1/6DAgbgEgbXTgowE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qbcU8xmdrlGoFSKZSapRmFb5mN6wxgBgyBtw3jGhhvjuWlMyiSa3xr/86Uw8GAyc3
	 jIgWdDs+AnUSdDqrBDx5zx+kJJbVg37eWM/B0SEUXZCpvuJIzKJAp3bW01smF0ezfB
	 X4PgbnegCsiBOt1IpV5NOnpwqyloJ4o4C13LJLlM=
From: Paul Elder <paul.elder@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Cc: laurent.pinchart@ideasonboard.com,
	kieran.bingham@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com,
	Paul Elder <paul.elder@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 4/4] media: rkisp1: debug: Consolidate counter debugfs files
Date: Fri,  1 Dec 2023 23:04:33 +0900
Message-Id: <20231201140433.2126011-5-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231201140433.2126011-1-paul.elder@ideasonboard.com>
References: <20231201140433.2126011-1-paul.elder@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Consolidate all the debugfs files that were each a single counter into a
single "counters" file.

While at it, reset the counters at stream on time to make it easier for
to interpret the values in userspace.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

---
New in v2

 .../platform/rockchip/rkisp1/rkisp1-capture.c |  2 +
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  4 ++
 .../platform/rockchip/rkisp1/rkisp1-debug.c   | 69 ++++++++++++-------
 3 files changed, 50 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index c6d7e01c8949..67b2e94dfd67 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -1030,6 +1030,8 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
 	struct media_entity *entity = &cap->vnode.vdev.entity;
 	int ret;
 
+	rkisp1_debug_reset_counters(cap->rkisp1);
+
 	mutex_lock(&cap->rkisp1->stream_lock);
 
 	ret = video_device_pipeline_start(&cap->vnode.vdev, &cap->rkisp1->pipe);
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index be69173958a4..789259fb304a 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -599,9 +599,13 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1);
 void rkisp1_params_unregister(struct rkisp1_device *rkisp1);
 
 #if IS_ENABLED(CONFIG_DEBUG_FS)
+void rkisp1_debug_reset_counters(struct rkisp1_device *rkisp1);
 void rkisp1_debug_init(struct rkisp1_device *rkisp1);
 void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1);
 #else
+static inline void rkisp1_debug_reset_counters(struct rkisp1_device *rkisp1)
+{
+}
 static inline void rkisp1_debug_init(struct rkisp1_device *rkisp1)
 {
 }
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
index 79cda589d935..4358ed1367ed 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
@@ -25,6 +25,11 @@ struct rkisp1_debug_register {
 	const char * const name;
 };
 
+struct rkisp1_debug_counter {
+	const char * const name;
+	unsigned long *value;
+};
+
 #define RKISP1_DEBUG_REG(name)		{ RKISP1_CIF_##name, 0, #name }
 #define RKISP1_DEBUG_SHD_REG(name) { \
 	RKISP1_CIF_##name, RKISP1_CIF_##name##_SHD, #name \
@@ -191,6 +196,43 @@ static int rkisp1_debug_input_status_show(struct seq_file *m, void *p)
 }
 DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_input_status);
 
+static int rkisp1_debug_counters_show(struct seq_file *m, void *p)
+{
+	struct rkisp1_device *rkisp1 = m->private;
+	struct rkisp1_debug *debug = &rkisp1->debug;
+
+	const struct rkisp1_debug_counter counters[] = {
+		{ "data_loss", &debug->data_loss },
+		{ "outform_size_err", &debug->outform_size_error },
+		{ "img_stabilization_size_error", &debug->img_stabilization_size_error },
+		{ "inform_size_error", &debug->inform_size_error },
+		{ "irq_delay", &debug->irq_delay },
+		{ "mipi_error", &debug->mipi_error },
+		{ "stats_error", &debug->stats_error },
+		{ "mp_stop_timeout", &debug->stop_timeout[RKISP1_MAINPATH] },
+		{ "sp_stop_timeout", &debug->stop_timeout[RKISP1_SELFPATH] },
+		{ "mp_frame_drop", &debug->frame_drop[RKISP1_MAINPATH] },
+		{ "sp_frame_drop", &debug->frame_drop[RKISP1_SELFPATH] },
+		{ "complete_frames", &debug->complete_frames },
+		{ /* Sentinel */ },
+	};
+
+	const struct rkisp1_debug_counter *counter = counters;
+
+	for (; counter->name; ++counter)
+		seq_printf(m, "%s: %lu\n", counter->name, *counter->value);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_counters);
+
+void rkisp1_debug_reset_counters(struct rkisp1_device *rkisp1)
+{
+	struct dentry *debugfs_dir = rkisp1->debug.debugfs_dir;
+	memset(&rkisp1->debug, 0, sizeof(rkisp1->debug));
+	rkisp1->debug.debugfs_dir = debugfs_dir;
+}
+
 void rkisp1_debug_init(struct rkisp1_device *rkisp1)
 {
 	struct rkisp1_debug *debug = &rkisp1->debug;
@@ -198,31 +240,8 @@ void rkisp1_debug_init(struct rkisp1_device *rkisp1)
 
 	debug->debugfs_dir = debugfs_create_dir(dev_name(rkisp1->dev), NULL);
 
-	debugfs_create_ulong("data_loss", 0444, debug->debugfs_dir,
-			     &debug->data_loss);
-	debugfs_create_ulong("outform_size_err", 0444,  debug->debugfs_dir,
-			     &debug->outform_size_error);
-	debugfs_create_ulong("img_stabilization_size_error", 0444,
-			     debug->debugfs_dir,
-			     &debug->img_stabilization_size_error);
-	debugfs_create_ulong("inform_size_error", 0444,  debug->debugfs_dir,
-			     &debug->inform_size_error);
-	debugfs_create_ulong("irq_delay", 0444,  debug->debugfs_dir,
-			     &debug->irq_delay);
-	debugfs_create_ulong("mipi_error", 0444, debug->debugfs_dir,
-			     &debug->mipi_error);
-	debugfs_create_ulong("stats_error", 0444, debug->debugfs_dir,
-			     &debug->stats_error);
-	debugfs_create_ulong("mp_stop_timeout", 0444, debug->debugfs_dir,
-			     &debug->stop_timeout[RKISP1_MAINPATH]);
-	debugfs_create_ulong("sp_stop_timeout", 0444, debug->debugfs_dir,
-			     &debug->stop_timeout[RKISP1_SELFPATH]);
-	debugfs_create_ulong("mp_frame_drop", 0444, debug->debugfs_dir,
-			     &debug->frame_drop[RKISP1_MAINPATH]);
-	debugfs_create_ulong("sp_frame_drop", 0444, debug->debugfs_dir,
-			     &debug->frame_drop[RKISP1_SELFPATH]);
-	debugfs_create_ulong("complete_frames", 0444, debug->debugfs_dir,
-			     &debug->complete_frames);
+	debugfs_create_file("counters", 0444, debug->debugfs_dir, rkisp1,
+			    &rkisp1_debug_counters_fops);
 	debugfs_create_file("input_status", 0444, debug->debugfs_dir, rkisp1,
 			    &rkisp1_debug_input_status_fops);
 
-- 
2.39.2


