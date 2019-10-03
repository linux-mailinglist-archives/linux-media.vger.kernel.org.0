Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79DDFC9C9C
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 12:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729578AbfJCKpI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 06:45:08 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39422 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729560AbfJCKpI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 06:45:08 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 1A0B028FA9C
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, andre.almeida@collabora.com,
        skhan@linuxfoundation.org, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com
Subject: [PATCH v2 4/5] media: vimc: move media_entity_cleanup to release callbacks
Date:   Thu,  3 Oct 2019 12:44:08 +0200
Message-Id: <20191003104409.15756-5-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191003104409.15756-1-dafna.hirschfeld@collabora.com>
References: <20191003104409.15756-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

according to the docs, this function must be called during
the cleanup phase after unregistering the entity.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Acked-by: Helen Koike <helen.koike@collabora.com>
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

