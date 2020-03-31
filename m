Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00928199E4D
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 20:45:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbgCaSp3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 14:45:29 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48708 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726209AbgCaSp2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 14:45:28 -0400
Received: from localhost.localdomain (unknown [IPv6:2a02:810a:1140:6758:982b:112f:3e03:c20d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 615172912F0;
        Tue, 31 Mar 2020 19:45:26 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
Subject: [PATCH v3] media: vimc: add vimc_ent_type struct for the callbacks of entities
Date:   Tue, 31 Mar 2020 20:45:15 +0200
Message-Id: <20200331184515.15734-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since each vimc entity type is defined by the
callbacks implementation, it is a good idea to
add a struct to hold these callbacks.

Each vimc entity then declare its type in the file for
the entity.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
This is v3 of the last patch from the patchset "media: vimc: various fixes"
changes from v1: declare the callbacks implementations as static
changes from v2: fix checkpatch issue "Alignment should match open parenthesis"

 drivers/media/platform/vimc/vimc-capture.c | 14 +++++---
 drivers/media/platform/vimc/vimc-common.h  | 42 +++++++++++-----------
 drivers/media/platform/vimc/vimc-core.c    | 38 +++++++-------------
 drivers/media/platform/vimc/vimc-debayer.c | 11 ++++--
 drivers/media/platform/vimc/vimc-scaler.c  | 11 ++++--
 drivers/media/platform/vimc/vimc-sensor.c  | 11 ++++--
 6 files changed, 67 insertions(+), 60 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
index 8bafbf90cbf5..5315c201314c 100644
--- a/drivers/media/platform/vimc/vimc-capture.c
+++ b/drivers/media/platform/vimc/vimc-capture.c
@@ -325,7 +325,7 @@ static const struct media_entity_operations vimc_cap_mops = {
 	.link_validate		= vimc_vdev_link_validate,
 };
 
-void vimc_cap_release(struct vimc_ent_device *ved)
+static void vimc_cap_release(struct vimc_ent_device *ved)
 {
 	struct vimc_cap_device *vcap =
 		container_of(ved, struct vimc_cap_device, ved);
@@ -334,7 +334,7 @@ void vimc_cap_release(struct vimc_ent_device *ved)
 	kfree(vcap);
 }
 
-void vimc_cap_unregister(struct vimc_ent_device *ved)
+static void vimc_cap_unregister(struct vimc_ent_device *ved)
 {
 	struct vimc_cap_device *vcap =
 		container_of(ved, struct vimc_cap_device, ved);
@@ -382,8 +382,8 @@ static void *vimc_cap_process_frame(struct vimc_ent_device *ved,
 	return NULL;
 }
 
-struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
-				     const char *vcfg_name)
+static struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
+					    const char *vcfg_name)
 {
 	struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
 	const struct vimc_pix_map *vpix;
@@ -478,3 +478,9 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 
 	return ERR_PTR(ret);
 }
+
+struct vimc_ent_type vimc_cap_type = {
+	.add = vimc_cap_add,
+	.unregister = vimc_cap_unregister,
+	.release = vimc_cap_release
+};
diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
index 40a58f1cb18f..b2fa3b793916 100644
--- a/drivers/media/platform/vimc/vimc-common.h
+++ b/drivers/media/platform/vimc/vimc-common.h
@@ -120,24 +120,35 @@ struct vimc_device {
 };
 
 /**
- * struct vimc_ent_config	Structure which describes individual
- *				configuration for each entity
+ * struct vimc_ent_type		Structure for the callbacks of the entity types
+ *
  *
- * @name			entity name
  * @add				initializes and registers
  *					vimc entity - called from vimc-core
  * @unregister			unregisters vimc entity - called from vimc-core
  * @release			releases vimc entity - called from the v4l2_dev
  *					release callback
  */
-struct vimc_ent_config {
-	const char *name;
+struct vimc_ent_type {
 	struct vimc_ent_device *(*add)(struct vimc_device *vimc,
 				       const char *vcfg_name);
 	void (*unregister)(struct vimc_ent_device *ved);
 	void (*release)(struct vimc_ent_device *ved);
 };
 
+/**
+ * struct vimc_ent_config	Structure which describes individual
+ *				configuration for each entity
+ *
+ * @name			entity name
+ * @type			contain the callbacks of this entity type
+ *
+ */
+struct vimc_ent_config {
+	const char *name;
+	struct vimc_ent_type *type;
+};
+
 /**
  * vimc_is_source - returns true if the entity has only source pads
  *
@@ -146,23 +157,10 @@ struct vimc_ent_config {
  */
 bool vimc_is_source(struct media_entity *ent);
 
-/* prototypes for vimc_ent_config hooks */
-struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
-				     const char *vcfg_name);
-void vimc_cap_unregister(struct vimc_ent_device *ved);
-void vimc_cap_release(struct vimc_ent_device *ved);
-
-struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
-				     const char *vcfg_name);
-void vimc_deb_release(struct vimc_ent_device *ved);
-
-struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
-				     const char *vcfg_name);
-void vimc_sca_release(struct vimc_ent_device *ved);
-
-struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
-				     const char *vcfg_name);
-void vimc_sen_release(struct vimc_ent_device *ved);
+extern struct vimc_ent_type vimc_sen_type;
+extern struct vimc_ent_type vimc_deb_type;
+extern struct vimc_ent_type vimc_sca_type;
+extern struct vimc_ent_type vimc_cap_type;
 
 /**
  * vimc_pix_map_by_index - get vimc_pix_map struct by its index
diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
index edac998f58d5..11210aaa2551 100644
--- a/drivers/media/platform/vimc/vimc-core.c
+++ b/drivers/media/platform/vimc/vimc-core.c
@@ -47,52 +47,40 @@ struct vimc_pipeline_config {
 static struct vimc_ent_config ent_config[] = {
 	{
 		.name = "Sensor A",
-		.add = vimc_sen_add,
-		.release = vimc_sen_release,
+		.type = &vimc_sen_type
 	},
 	{
 		.name = "Sensor B",
-		.add = vimc_sen_add,
-		.release = vimc_sen_release,
+		.type = &vimc_sen_type
 	},
 	{
 		.name = "Debayer A",
-		.add = vimc_deb_add,
-		.release = vimc_deb_release,
+		.type = &vimc_deb_type
 	},
 	{
 		.name = "Debayer B",
-		.add = vimc_deb_add,
-		.release = vimc_deb_release,
+		.type = &vimc_deb_type
 	},
 	{
 		.name = "Raw Capture 0",
-		.add = vimc_cap_add,
-		.unregister = vimc_cap_unregister,
-		.release = vimc_cap_release,
+		.type = &vimc_cap_type
 	},
 	{
 		.name = "Raw Capture 1",
-		.add = vimc_cap_add,
-		.unregister = vimc_cap_unregister,
-		.release = vimc_cap_release,
+		.type = &vimc_cap_type
 	},
 	{
 		/* TODO: change this to vimc-input when it is implemented */
 		.name = "RGB/YUV Input",
-		.add = vimc_sen_add,
-		.release = vimc_sen_release,
+		.type = &vimc_sen_type
 	},
 	{
 		.name = "Scaler",
-		.add = vimc_sca_add,
-		.release = vimc_sca_release,
+		.type = &vimc_sca_type
 	},
 	{
 		.name = "RGB/YUV Capture",
-		.add = vimc_cap_add,
-		.unregister = vimc_cap_unregister,
-		.release = vimc_cap_release,
+		.type = &vimc_cap_type
 	},
 };
 
@@ -166,7 +154,7 @@ static void vimc_release_subdevs(struct vimc_device *vimc)
 
 	for (i = 0; i < vimc->pipe_cfg->num_ents; i++)
 		if (vimc->ent_devs[i])
-			vimc->pipe_cfg->ents[i].release(vimc->ent_devs[i]);
+			vimc->pipe_cfg->ents[i].type->release(vimc->ent_devs[i]);
 }
 
 static void vimc_unregister_subdevs(struct vimc_device *vimc)
@@ -174,8 +162,8 @@ static void vimc_unregister_subdevs(struct vimc_device *vimc)
 	unsigned int i;
 
 	for (i = 0; i < vimc->pipe_cfg->num_ents; i++)
-		if (vimc->ent_devs[i] && vimc->pipe_cfg->ents[i].unregister)
-			vimc->pipe_cfg->ents[i].unregister(vimc->ent_devs[i]);
+		if (vimc->ent_devs[i] && vimc->pipe_cfg->ents[i].type->unregister)
+			vimc->pipe_cfg->ents[i].type->unregister(vimc->ent_devs[i]);
 }
 
 static int vimc_add_subdevs(struct vimc_device *vimc)
@@ -185,7 +173,7 @@ static int vimc_add_subdevs(struct vimc_device *vimc)
 	for (i = 0; i < vimc->pipe_cfg->num_ents; i++) {
 		dev_dbg(vimc->mdev.dev, "new entity for %s\n",
 			vimc->pipe_cfg->ents[i].name);
-		vimc->ent_devs[i] = vimc->pipe_cfg->ents[i].add(vimc,
+		vimc->ent_devs[i] = vimc->pipe_cfg->ents[i].type->add(vimc,
 					vimc->pipe_cfg->ents[i].name);
 		if (IS_ERR(vimc->ent_devs[i])) {
 			int err = PTR_ERR(vimc->ent_devs[i]);
diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
index d591b6a6bcf0..d10aee9f84c4 100644
--- a/drivers/media/platform/vimc/vimc-debayer.c
+++ b/drivers/media/platform/vimc/vimc-debayer.c
@@ -494,7 +494,7 @@ static const struct v4l2_ctrl_ops vimc_deb_ctrl_ops = {
 	.s_ctrl = vimc_deb_s_ctrl,
 };
 
-void vimc_deb_release(struct vimc_ent_device *ved)
+static void vimc_deb_release(struct vimc_ent_device *ved)
 {
 	struct vimc_deb_device *vdeb =
 		container_of(ved, struct vimc_deb_device, ved);
@@ -522,8 +522,8 @@ static const struct v4l2_ctrl_config vimc_deb_ctrl_mean_win_size = {
 	.def = 3,
 };
 
-struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
-				     const char *vcfg_name)
+static struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
+					    const char *vcfg_name)
 {
 	struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
 	struct vimc_deb_device *vdeb;
@@ -579,3 +579,8 @@ struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
 
 	return ERR_PTR(ret);
 }
+
+struct vimc_ent_type vimc_deb_type = {
+	.add = vimc_deb_add,
+	.release = vimc_deb_release
+};
diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
index 6ea05dcebc31..465b906b7497 100644
--- a/drivers/media/platform/vimc/vimc-scaler.c
+++ b/drivers/media/platform/vimc/vimc-scaler.c
@@ -464,7 +464,7 @@ static void *vimc_sca_process_frame(struct vimc_ent_device *ved,
 	return vsca->src_frame;
 };
 
-void vimc_sca_release(struct vimc_ent_device *ved)
+static void vimc_sca_release(struct vimc_ent_device *ved)
 {
 	struct vimc_sca_device *vsca =
 		container_of(ved, struct vimc_sca_device, ved);
@@ -473,8 +473,8 @@ void vimc_sca_release(struct vimc_ent_device *ved)
 	kfree(vsca);
 }
 
-struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
-				     const char *vcfg_name)
+static struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
+					    const char *vcfg_name)
 {
 	struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
 	struct vimc_sca_device *vsca;
@@ -509,3 +509,8 @@ struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
 
 	return &vsca->ved;
 }
+
+struct vimc_ent_type vimc_sca_type = {
+	.add = vimc_sca_add,
+	.release = vimc_sca_release
+};
diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
index 24ce5b70b97e..228120b3a6dd 100644
--- a/drivers/media/platform/vimc/vimc-sensor.c
+++ b/drivers/media/platform/vimc/vimc-sensor.c
@@ -279,7 +279,7 @@ static const struct v4l2_ctrl_ops vimc_sen_ctrl_ops = {
 	.s_ctrl = vimc_sen_s_ctrl,
 };
 
-void vimc_sen_release(struct vimc_ent_device *ved)
+static void vimc_sen_release(struct vimc_ent_device *ved)
 {
 	struct vimc_sen_device *vsen =
 		container_of(ved, struct vimc_sen_device, ved);
@@ -307,8 +307,8 @@ static const struct v4l2_ctrl_config vimc_sen_ctrl_test_pattern = {
 	.qmenu = tpg_pattern_strings,
 };
 
-struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
-				     const char *vcfg_name)
+static struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
+					    const char *vcfg_name)
 {
 	struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
 	struct vimc_sen_device *vsen;
@@ -374,3 +374,8 @@ struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
 
 	return ERR_PTR(ret);
 }
+
+struct vimc_ent_type vimc_sen_type = {
+	.add = vimc_sen_add,
+	.release = vimc_sen_release
+};
-- 
2.17.1

