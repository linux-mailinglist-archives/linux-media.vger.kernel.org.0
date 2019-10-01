Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B54CC3C3F
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 18:50:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388153AbfJAQuj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 12:50:39 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43476 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729716AbfJAQug (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 12:50:36 -0400
Received: from localhost.localdomain (unknown [IPv6:2a02:810a:113f:a6c2::a6f9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BA17428ECDF;
        Tue,  1 Oct 2019 17:50:33 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, andre.almeida@collabora.com,
        skhan@linuxfoundation.org, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com
Subject: [PATCH 3/3] media: vimc: move media_entity_cleanup to release callbacks
Date:   Tue,  1 Oct 2019 18:50:22 +0200
Message-Id: <20191001165022.16263-4-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191001165022.16263-1-dafna.hirschfeld@collabora.com>
References: <20191001165022.16263-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

according to the docs, this function must be called during
the cleanup phase after unregistering the entity.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/vimc/vimc-capture.c | 2 +-
 drivers/media/platform/vimc/vimc-common.c  | 1 -
 drivers/media/platform/vimc/vimc-debayer.c | 1 +
 drivers/media/platform/vimc/vimc-scaler.c  | 1 +
 drivers/media/platform/vimc/vimc-sensor.c  | 1 +
 5 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
index 602f80323031..5f353c20e605 100644
--- a/drivers/media/platform/vimc/vimc-capture.c
+++ b/drivers/media/platform/vimc/vimc-capture.c
@@ -330,6 +330,7 @@ static void vimc_cap_release(struct video_device *vdev)
 	struct vimc_cap_device *vcap =
 		container_of(vdev, struct vimc_cap_device, vdev);
 
+	media_entity_cleanup(vcap->ved.ent);
 	vimc_pads_cleanup(vcap->ved.pads);
 	kfree(vcap);
 }
@@ -340,7 +341,6 @@ void vimc_cap_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
 
 	vcap = container_of(ved, struct vimc_cap_device, ved);
 	vb2_queue_release(&vcap->queue);
-	media_entity_cleanup(ved->ent);
 	video_unregister_device(&vcap->vdev);
 }
 
diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
index a3120f4f7a90..999bc353fb10 100644
--- a/drivers/media/platform/vimc/vimc-common.c
+++ b/drivers/media/platform/vimc/vimc-common.c
@@ -423,7 +423,6 @@ EXPORT_SYMBOL_GPL(vimc_ent_sd_register);
 
 void vimc_ent_sd_unregister(struct vimc_ent_device *ved, struct v4l2_subdev *sd)
 {
-	media_entity_cleanup(ved->ent);
 	v4l2_device_unregister_subdev(sd);
 }
 EXPORT_SYMBOL_GPL(vimc_ent_sd_unregister);
diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
index feac47d79449..e1bad6713cde 100644
--- a/drivers/media/platform/vimc/vimc-debayer.c
+++ b/drivers/media/platform/vimc/vimc-debayer.c
@@ -477,6 +477,7 @@ static void vimc_deb_release(struct v4l2_subdev *sd)
 	struct vimc_deb_device *vdeb =
 				container_of(sd, struct vimc_deb_device, sd);
 
+	media_entity_cleanup(vdeb->ved.ent);
 	vimc_pads_cleanup(vdeb->ved.pads);
 	kfree(vdeb);
 }
diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
index a6a3cc5be872..1982bc089af5 100644
--- a/drivers/media/platform/vimc/vimc-scaler.c
+++ b/drivers/media/platform/vimc/vimc-scaler.c
@@ -336,6 +336,7 @@ static void vimc_sca_release(struct v4l2_subdev *sd)
 	struct vimc_sca_device *vsca =
 				container_of(sd, struct vimc_sca_device, sd);
 
+	media_entity_cleanup(vsca->ved.ent);
 	vimc_pads_cleanup(vsca->ved.pads);
 	kfree(vsca);
 }
diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
index ee2306c08569..63fe024ccea5 100644
--- a/drivers/media/platform/vimc/vimc-sensor.c
+++ b/drivers/media/platform/vimc/vimc-sensor.c
@@ -291,6 +291,7 @@ static void vimc_sen_release(struct v4l2_subdev *sd)
 
 	v4l2_ctrl_handler_free(&vsen->hdl);
 	tpg_free(&vsen->tpg);
+	media_entity_cleanup(vsen->ved.ent);
 	vimc_pads_cleanup(vsen->ved.pads);
 	kfree(vsen);
 }
-- 
2.20.1

