Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E51E22115
	for <lists+linux-media@lfdr.de>; Sat, 18 May 2019 03:08:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728046AbfERBH6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 May 2019 21:07:58 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:16512 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728024AbfERBH5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 May 2019 21:07:57 -0400
X-Halon-ID: 5d5e763e-7909-11e9-8d05-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [89.233.230.99])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 5d5e763e-7909-11e9-8d05-005056917f90;
        Sat, 18 May 2019 03:07:54 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org
Cc:     libcamera-devel@lists.libcamera.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: [PATCH 3/3] vimc: Join pipeline if one already exists
Date:   Sat, 18 May 2019 03:07:44 +0200
Message-Id: <20190518010744.15195-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190518010744.15195-1-niklas.soderlund+renesas@ragnatech.se>
References: <20190518010744.15195-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A sensor which is running is already part of a pipeline and trying to
start a new pipeline is not possible. This prevents two capture devices
connected to the same sensor from running at the same time.

Instead of failing to start the second capture device allow it to join
the already running pipeline by looking it up at the sensor. This allows
two (or more) capture devices to independently be started and stopped
while still being connected to the same sensor.

Signed-off-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
---
 drivers/media/platform/vimc/vimc-capture.c | 35 +++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
index e7d0fc2228a6f0c1..f9eb1e327e311b4a 100644
--- a/drivers/media/platform/vimc/vimc-capture.c
+++ b/drivers/media/platform/vimc/vimc-capture.c
@@ -264,16 +264,49 @@ static void vimc_cap_return_all_buffers(struct vimc_cap_device *vcap,
 	spin_unlock(&vcap->qlock);
 }
 
+static struct media_entity *vimc_cap_get_sensor(struct vimc_cap_device *vcap)
+{
+	struct media_entity *entity = &vcap->vdev.entity;
+	struct media_device *mdev = entity->graph_obj.mdev;
+	struct media_graph graph;
+
+	mutex_lock(&mdev->graph_mutex);
+	if (media_graph_walk_init(&graph, mdev)) {
+		mutex_unlock(&mdev->graph_mutex);
+		return NULL;
+	}
+
+	media_graph_walk_start(&graph, entity);
+
+	while ((entity = media_graph_walk_next(&graph)))
+		if (entity->function == MEDIA_ENT_F_CAM_SENSOR)
+			break;
+
+	mutex_unlock(&mdev->graph_mutex);
+
+	media_graph_walk_cleanup(&graph);
+
+	return entity;
+}
+
 static int vimc_cap_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
 	struct vimc_cap_device *vcap = vb2_get_drv_priv(vq);
 	struct media_entity *entity = &vcap->vdev.entity;
+	struct media_pipeline *pipe = NULL;
+	struct media_entity *sensorent;
 	int ret;
 
 	vcap->sequence = 0;
 
 	/* Start the media pipeline */
-	ret = media_pipeline_start(entity, &vcap->stream.pipe);
+	sensorent = vimc_cap_get_sensor(vcap);
+	if (sensorent && sensorent->pipe)
+		pipe = sensorent->pipe;
+	else
+		pipe = &vcap->stream.pipe;
+
+	ret = media_pipeline_start(entity, pipe);
 	if (ret) {
 		vimc_cap_return_all_buffers(vcap, VB2_BUF_STATE_QUEUED);
 		return ret;
-- 
2.21.0

