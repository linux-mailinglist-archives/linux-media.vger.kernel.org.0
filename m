Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D980CE437
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 15:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727861AbfJGNuN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 09:50:13 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58424 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727769AbfJGNuM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 09:50:12 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id D788A28D6F4
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, andre.almeida@collabora.com,
        skhan@linuxfoundation.org, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com
Subject: [PATCH v3 5/5] media: vimc: remove the helper function vimc_ent_sd_unregister
Date:   Mon,  7 Oct 2019 15:50:03 +0200
Message-Id: <20191007135003.28287-5-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191007135003.28287-1-dafna.hirschfeld@collabora.com>
References: <20191007135003.28287-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

since this function only calls v4l2_device_unregister_subdev,
it is pointless.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Acked-by: Helen Koike <helen.koike@collabora.com>
---
 drivers/media/platform/vimc/vimc-common.c  |  5 -----
 drivers/media/platform/vimc/vimc-common.h  | 12 ------------
 drivers/media/platform/vimc/vimc-debayer.c |  2 +-
 drivers/media/platform/vimc/vimc-scaler.c  |  2 +-
 drivers/media/platform/vimc/vimc-sensor.c  |  2 +-
 5 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
index 999bc353fb10..67b53dc1849d 100644
--- a/drivers/media/platform/vimc/vimc-common.c
+++ b/drivers/media/platform/vimc/vimc-common.c
@@ -421,8 +421,3 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
 }
 EXPORT_SYMBOL_GPL(vimc_ent_sd_register);
 
-void vimc_ent_sd_unregister(struct vimc_ent_device *ved, struct v4l2_subdev *sd)
-{
-	v4l2_device_unregister_subdev(sd);
-}
-EXPORT_SYMBOL_GPL(vimc_ent_sd_unregister);
diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
index 698db7c07645..af5b1166dc1f 100644
--- a/drivers/media/platform/vimc/vimc-common.h
+++ b/drivers/media/platform/vimc/vimc-common.h
@@ -251,18 +251,6 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
 			 const struct v4l2_subdev_internal_ops *sd_int_ops,
 			 const struct v4l2_subdev_ops *sd_ops);
 
-/**
- * vimc_ent_sd_unregister - cleanup and unregister a subdev node
- *
- * @ved:	the vimc_ent_device struct to be cleaned up
- * @sd:		the v4l2_subdev struct to be unregistered
- *
- * Helper function cleanup and unregister the struct vimc_ent_device and struct
- * v4l2_subdev which represents a subdev node in the topology
- */
-void vimc_ent_sd_unregister(struct vimc_ent_device *ved,
-			    struct v4l2_subdev *sd);
-
 /**
  * vimc_link_validate - validates a media link
  *
diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
index e1bad6713cde..4e5316c671e0 100644
--- a/drivers/media/platform/vimc/vimc-debayer.c
+++ b/drivers/media/platform/vimc/vimc-debayer.c
@@ -491,7 +491,7 @@ void vimc_deb_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
 	struct vimc_deb_device *vdeb;
 
 	vdeb = container_of(ved, struct vimc_deb_device, ved);
-	vimc_ent_sd_unregister(ved, &vdeb->sd);
+	v4l2_device_unregister_subdev(&vdeb->sd);
 }
 
 struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
index 1982bc089af5..4fe2ba578652 100644
--- a/drivers/media/platform/vimc/vimc-scaler.c
+++ b/drivers/media/platform/vimc/vimc-scaler.c
@@ -350,7 +350,7 @@ void vimc_sca_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
 	struct vimc_sca_device *vsca;
 
 	vsca = container_of(ved, struct vimc_sca_device, ved);
-	vimc_ent_sd_unregister(ved, &vsca->sd);
+	v4l2_device_unregister_subdev(&vsca->sd);
 }
 
 struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
index 63fe024ccea5..14838362d871 100644
--- a/drivers/media/platform/vimc/vimc-sensor.c
+++ b/drivers/media/platform/vimc/vimc-sensor.c
@@ -305,7 +305,7 @@ void vimc_sen_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
 	struct vimc_sen_device *vsen;
 
 	vsen = container_of(ved, struct vimc_sen_device, ved);
-	vimc_ent_sd_unregister(ved, &vsen->sd);
+	v4l2_device_unregister_subdev(&vsen->sd);
 }
 
 /* Image Processing Controls */
-- 
2.20.1

