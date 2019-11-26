Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 412D0109D88
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 13:08:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728222AbfKZMIf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 07:08:35 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49506 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727637AbfKZMIf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 07:08:35 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 371E9283BA1
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, hverkuil@xs4all.nl,
        dafna3@gmail.com, helen.koike@collabora.com,
        ezequiel@collabora.com, skhan@linuxfoundation.org,
        kernel@collabora.com
Subject: [PATCH v3 1/3] media: vimc: replace vimc->pdev.dev with vimc->mdev.dev
Date:   Tue, 26 Nov 2019 13:08:20 +0100
Message-Id: <20191126120822.11451-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191126120822.11451-1-dafna.hirschfeld@collabora.com>
References: <20191126120822.11451-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

replace 'vimc->pdev.dev' with 'vimc->mdev.dev'
in debug prints and in assignment to
vimc_ent_device.dev. This helps to unify the debug
statements. This will also eliminate the need to use
the pdev field in vimc_device in future patch.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/vimc/vimc-capture.c | 6 +++---
 drivers/media/platform/vimc/vimc-core.c    | 4 ++--
 drivers/media/platform/vimc/vimc-debayer.c | 2 +-
 drivers/media/platform/vimc/vimc-scaler.c  | 2 +-
 drivers/media/platform/vimc/vimc-sensor.c  | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
index 76c015898cfd..9a78bb7826a8 100644
--- a/drivers/media/platform/vimc/vimc-capture.c
+++ b/drivers/media/platform/vimc/vimc-capture.c
@@ -423,7 +423,7 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 
 	ret = vb2_queue_init(q);
 	if (ret) {
-		dev_err(&vimc->pdev.dev, "%s: vb2 queue init failed (err=%d)\n",
+		dev_err(vimc->mdev.dev, "%s: vb2 queue init failed (err=%d)\n",
 			vcfg_name, ret);
 		goto err_clean_m_ent;
 	}
@@ -443,7 +443,7 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 	vcap->ved.ent = &vcap->vdev.entity;
 	vcap->ved.process_frame = vimc_cap_process_frame;
 	vcap->ved.vdev_get_format = vimc_cap_get_format;
-	vcap->ved.dev = &vimc->pdev.dev;
+	vcap->ved.dev = vimc->mdev.dev;
 
 	/* Initialize the video_device struct */
 	vdev = &vcap->vdev;
@@ -462,7 +462,7 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 	/* Register the video_device with the v4l2 and the media framework */
 	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
 	if (ret) {
-		dev_err(&vimc->pdev.dev, "%s: video register failed (err=%d)\n",
+		dev_err(vimc->mdev.dev, "%s: video register failed (err=%d)\n",
 			vcap->vdev.name, ret);
 		goto err_release_queue;
 	}
diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
index 97a272f3350a..51c89fc79d90 100644
--- a/drivers/media/platform/vimc/vimc-core.c
+++ b/drivers/media/platform/vimc/vimc-core.c
@@ -162,12 +162,12 @@ static int vimc_add_subdevs(struct vimc_device *vimc)
 	unsigned int i;
 
 	for (i = 0; i < vimc->pipe_cfg->num_ents; i++) {
-		dev_dbg(&vimc->pdev.dev, "new entity for %s\n",
+		dev_dbg(vimc->mdev.dev, "new entity for %s\n",
 			vimc->pipe_cfg->ents[i].name);
 		vimc->ent_devs[i] = vimc->pipe_cfg->ents[i].add(vimc,
 					vimc->pipe_cfg->ents[i].name);
 		if (!vimc->ent_devs[i]) {
-			dev_err(&vimc->pdev.dev, "add new entity for %s\n",
+			dev_err(vimc->mdev.dev, "add new entity for %s\n",
 				vimc->pipe_cfg->ents[i].name);
 			return -EINVAL;
 		}
diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
index 5d1b67d684bb..34b98b235880 100644
--- a/drivers/media/platform/vimc/vimc-debayer.c
+++ b/drivers/media/platform/vimc/vimc-debayer.c
@@ -569,7 +569,7 @@ struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
 		goto err_free_hdl;
 
 	vdeb->ved.process_frame = vimc_deb_process_frame;
-	vdeb->ved.dev = &vimc->pdev.dev;
+	vdeb->ved.dev = vimc->mdev.dev;
 	vdeb->mean_win_size = vimc_deb_ctrl_mean_win_size.def;
 
 	/* Initialize the frame format */
diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
index 2f88a7d9d67b..ecdbec5824c8 100644
--- a/drivers/media/platform/vimc/vimc-scaler.c
+++ b/drivers/media/platform/vimc/vimc-scaler.c
@@ -379,7 +379,7 @@ struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
 	}
 
 	vsca->ved.process_frame = vimc_sca_process_frame;
-	vsca->ved.dev = &vimc->pdev.dev;
+	vsca->ved.dev = vimc->mdev.dev;
 
 	/* Initialize the frame format */
 	vsca->sink_fmt = sink_fmt_default;
diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
index 32380f504591..9788fe291193 100644
--- a/drivers/media/platform/vimc/vimc-sensor.c
+++ b/drivers/media/platform/vimc/vimc-sensor.c
@@ -370,7 +370,7 @@ struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
 		goto err_free_tpg;
 
 	vsen->ved.process_frame = vimc_sen_process_frame;
-	vsen->ved.dev = &vimc->pdev.dev;
+	vsen->ved.dev = vimc->mdev.dev;
 
 	/* Initialize the frame format */
 	vsen->mbus_format = fmt_default;
-- 
2.20.1

