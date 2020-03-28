Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 196D2196452
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2020 08:53:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgC1HxF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Mar 2020 03:53:05 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40984 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbgC1HxE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Mar 2020 03:53:04 -0400
Received: from localhost.localdomain (unknown [IPv6:2a02:810a:1140:6758:90b5:2774:1094:333f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 96EC2297D7F;
        Sat, 28 Mar 2020 07:53:03 +0000 (GMT)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
Subject: [PATCH 3/5] media: vimc: keep the error value when adding an entity fails
Date:   Sat, 28 Mar 2020 08:52:52 +0100
Message-Id: <20200328075254.4616-4-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200328075254.4616-1-dafna.hirschfeld@collabora.com>
References: <20200328075254.4616-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently when the 'add' callback of an entity fails, a
NULL is returned. This hides the error code of the failure
and always returns -EINVAL.

Replace return NULL with return ERR_PTR(ret) to improve debugging.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/vimc/vimc-capture.c |  4 ++--
 drivers/media/platform/vimc/vimc-core.c    | 11 +++++++----
 drivers/media/platform/vimc/vimc-debayer.c |  4 ++--
 drivers/media/platform/vimc/vimc-scaler.c  |  4 ++--
 drivers/media/platform/vimc/vimc-sensor.c  |  4 ++--
 5 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
index 23e740c1c5c0..8bafbf90cbf5 100644
--- a/drivers/media/platform/vimc/vimc-capture.c
+++ b/drivers/media/platform/vimc/vimc-capture.c
@@ -395,7 +395,7 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 	/* Allocate the vimc_cap_device struct */
 	vcap = kzalloc(sizeof(*vcap), GFP_KERNEL);
 	if (!vcap)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	/* Initialize the media entity */
 	vcap->vdev.entity.name = vcfg_name;
@@ -476,5 +476,5 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 err_free_vcap:
 	kfree(vcap);
 
-	return NULL;
+	return ERR_PTR(ret);
 }
diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
index dab01cbc31d2..edac998f58d5 100644
--- a/drivers/media/platform/vimc/vimc-core.c
+++ b/drivers/media/platform/vimc/vimc-core.c
@@ -187,12 +187,15 @@ static int vimc_add_subdevs(struct vimc_device *vimc)
 			vimc->pipe_cfg->ents[i].name);
 		vimc->ent_devs[i] = vimc->pipe_cfg->ents[i].add(vimc,
 					vimc->pipe_cfg->ents[i].name);
-		if (!vimc->ent_devs[i]) {
-			dev_err(vimc->mdev.dev, "add new entity for %s\n",
-				vimc->pipe_cfg->ents[i].name);
+		if (IS_ERR(vimc->ent_devs[i])) {
+			int err = PTR_ERR(vimc->ent_devs[i]);
+
+			dev_err(vimc->mdev.dev, "adding entity %s failed (%d)\n",
+				vimc->pipe_cfg->ents[i].name, err);
+			vimc->ent_devs[i] = NULL;
 			vimc_unregister_subdevs(vimc);
 			vimc_release_subdevs(vimc);
-			return -EINVAL;
+			return err;
 		}
 	}
 	return 0;
diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
index baf6bf9f65b5..d591b6a6bcf0 100644
--- a/drivers/media/platform/vimc/vimc-debayer.c
+++ b/drivers/media/platform/vimc/vimc-debayer.c
@@ -532,7 +532,7 @@ struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
 	/* Allocate the vdeb struct */
 	vdeb = kzalloc(sizeof(*vdeb), GFP_KERNEL);
 	if (!vdeb)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	/* Create controls: */
 	v4l2_ctrl_handler_init(&vdeb->hdl, 2);
@@ -577,5 +577,5 @@ struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
 err_free_vdeb:
 	kfree(vdeb);
 
-	return NULL;
+	return ERR_PTR(ret);
 }
diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
index 7521439747c5..6ea05dcebc31 100644
--- a/drivers/media/platform/vimc/vimc-scaler.c
+++ b/drivers/media/platform/vimc/vimc-scaler.c
@@ -483,7 +483,7 @@ struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
 	/* Allocate the vsca struct */
 	vsca = kzalloc(sizeof(*vsca), GFP_KERNEL);
 	if (!vsca)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	/* Initialize ved and sd */
 	vsca->pads[0].flags = MEDIA_PAD_FL_SINK;
@@ -495,7 +495,7 @@ struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
 				   vsca->pads, &vimc_sca_ops);
 	if (ret) {
 		kfree(vsca);
-		return NULL;
+		return ERR_PTR(ret);
 	}
 
 	vsca->ved.process_frame = vimc_sca_process_frame;
diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
index 92daee58209e..24ce5b70b97e 100644
--- a/drivers/media/platform/vimc/vimc-sensor.c
+++ b/drivers/media/platform/vimc/vimc-sensor.c
@@ -317,7 +317,7 @@ struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
 	/* Allocate the vsen struct */
 	vsen = kzalloc(sizeof(*vsen), GFP_KERNEL);
 	if (!vsen)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	v4l2_ctrl_handler_init(&vsen->hdl, 4);
 
@@ -372,5 +372,5 @@ struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
 err_free_vsen:
 	kfree(vsen);
 
-	return NULL;
+	return ERR_PTR(ret);
 }
-- 
2.17.1

