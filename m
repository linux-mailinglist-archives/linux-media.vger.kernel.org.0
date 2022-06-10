Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9709B545966
	for <lists+linux-media@lfdr.de>; Fri, 10 Jun 2022 03:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239375AbiFJBB0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jun 2022 21:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231230AbiFJBBZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jun 2022 21:01:25 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A808F506DB
        for <linux-media@vger.kernel.org>; Thu,  9 Jun 2022 18:01:24 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id b6-20020a252e46000000b0065d5168f3f0so21405811ybn.21
        for <linux-media@vger.kernel.org>; Thu, 09 Jun 2022 18:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=QYe0YNaDrqn9xNNDITlfQOJZvENwHWr/GVq8VLmKoHw=;
        b=nzu5jeRjSwB+hwYZ2n+1nSVkThEudYCQ3Q+vMVPmmUaek+nmgbaCVE8jNEs9K/IN0b
         QpbUo4Ph7trRGk3I65gDRjU97oQ/wqa374pNoYHBL+bV3xf1bAOP4P6iLe6Fw+mDbEPB
         gNjsY6qYvJEUHZ6cWXXjjgUsGNwtImQ6nb4cjtoB4ZvlAoejVFflGOxEdaWSQ5Kcr/LU
         XJi07LNUjoBrtXmR+gQc7SOlEeR9w6cdQxc554mOXqIezTKs5DY/fQW5OmybcMrcuyIR
         1EKUWbeRCRjUPQ03mL110zV7Qk7qexrfac10nnZXRK6+hnnQV4WH483gKQjiaYOpe9eY
         gyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=QYe0YNaDrqn9xNNDITlfQOJZvENwHWr/GVq8VLmKoHw=;
        b=jxLscC3z70NXgTLKc7b2nGS4EC7Ybf1uREQQoGlsfnms5za8ycj5HJrIkSIMGzgfZz
         iSFAjI0mIjrxXw76havtgMzejOwvjXWfqgpNHh8p8w5iP6kmmVqSjuqFrHjIFjPmy7Kz
         krRMaNRC3h6yczqjDQmLG3Nax+0x7TS0OrSkjH2CSmZr2bzWKg2M5wOFNBe9rSnS7Bee
         haUL9mkSf/OOLCoge1lq2CJcBC6YGw33SEXifXEw1F9SMuCao4ABrSH2OwrjCCV/v3zD
         AlO6o7Qio2ZsMD0/+cfLZk2maJWdAR5DmjS1h1x8SrwGN7ASBKvtddDqHD3TwWLO3OrV
         5O0g==
X-Gm-Message-State: AOAM530w0u8hXraOeKgodetD9ahJyIxIP20ONIsQHcG6TG37pnROA5VZ
        mh6Ej6f9kNK/v4zkh0/2agXBeIe9OYc=
X-Google-Smtp-Source: ABdhPJxv5zCrP1NZBEyQ+gVa4cVrls4SWlvdqrBPpxUgiq9qgObOv/AISmF1+FzPxr/Yr5QRq2qAhGP7AhA=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:5900:89c0:d4c3:d2e])
 (user=yunkec job=sendgmr) by 2002:a5b:4a:0:b0:663:7c5b:a5ba with SMTP id
 e10-20020a5b004a000000b006637c5ba5bamr23350182ybp.81.1654822883916; Thu, 09
 Jun 2022 18:01:23 -0700 (PDT)
Date:   Fri, 10 Jun 2022 10:01:10 +0900
In-Reply-To: <20220610010111.3418214-1-yunkec@google.com>
Message-Id: <20220610010111.3418214-2-yunkec@google.com>
Mime-Version: 1.0
References: <20220610010111.3418214-1-yunkec@google.com>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH v1 1/2 RESEND] media: vimc: add ancillary lens
From:   Yunke Cao <yunkec@google.com>
To:     Shuah Khan <skhan@linuxfoundation.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
        USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a basic version of vimc lens.
Link lens with sensors using ancillary links.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Yunke Cao <yunkec@google.com>
---
 drivers/media/test-drivers/vimc/Makefile      |   2 +-
 drivers/media/test-drivers/vimc/vimc-common.h |   1 +
 drivers/media/test-drivers/vimc/vimc-core.c   |  86 +++++++++++----
 drivers/media/test-drivers/vimc/vimc-lens.c   | 102 ++++++++++++++++++
 4 files changed, 170 insertions(+), 21 deletions(-)
 create mode 100644 drivers/media/test-drivers/vimc/vimc-lens.c

diff --git a/drivers/media/test-drivers/vimc/Makefile b/drivers/media/test-drivers/vimc/Makefile
index a53b2b532e9f..9b9631562473 100644
--- a/drivers/media/test-drivers/vimc/Makefile
+++ b/drivers/media/test-drivers/vimc/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 vimc-y := vimc-core.o vimc-common.o vimc-streamer.o vimc-capture.o \
-		vimc-debayer.o vimc-scaler.o vimc-sensor.o
+		vimc-debayer.o vimc-scaler.o vimc-sensor.o vimc-lens.o
 
 obj-$(CONFIG_VIDEO_VIMC) += vimc.o
 
diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
index ba1930772589..37f6b687ce10 100644
--- a/drivers/media/test-drivers/vimc/vimc-common.h
+++ b/drivers/media/test-drivers/vimc/vimc-common.h
@@ -171,6 +171,7 @@ extern struct vimc_ent_type vimc_sen_type;
 extern struct vimc_ent_type vimc_deb_type;
 extern struct vimc_ent_type vimc_sca_type;
 extern struct vimc_ent_type vimc_cap_type;
+extern struct vimc_ent_type vimc_len_type;
 
 /**
  * vimc_pix_map_by_index - get vimc_pix_map struct by its index
diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
index 06edf9d4d92c..166323406c6b 100644
--- a/drivers/media/test-drivers/vimc/vimc-core.c
+++ b/drivers/media/test-drivers/vimc/vimc-core.c
@@ -24,7 +24,7 @@ MODULE_PARM_DESC(allocator, " memory allocator selection, default is 0.\n"
 
 #define VIMC_MDEV_MODEL_NAME "VIMC MDEV"
 
-#define VIMC_ENT_LINK(src, srcpad, sink, sinkpad, link_flags) {	\
+#define VIMC_DATA_LINK(src, srcpad, sink, sinkpad, link_flags) {	\
 	.src_ent = src,						\
 	.src_pad = srcpad,					\
 	.sink_ent = sink,					\
@@ -32,8 +32,13 @@ MODULE_PARM_DESC(allocator, " memory allocator selection, default is 0.\n"
 	.flags = link_flags,					\
 }
 
-/* Structure which describes links between entities */
-struct vimc_ent_link {
+#define VIMC_ANCILLARY_LINK(primary, ancillary) {	\
+	.primary_ent = primary,			\
+	.ancillary_ent = ancillary		\
+}
+
+/* Structure which describes data links between entities */
+struct vimc_data_link {
 	unsigned int src_ent;
 	u16 src_pad;
 	unsigned int sink_ent;
@@ -41,12 +46,20 @@ struct vimc_ent_link {
 	u32 flags;
 };
 
+/* Structure which describes ancillary links between entities */
+struct vimc_ancillary_link {
+	unsigned int primary_ent;
+	unsigned int ancillary_ent;
+};
+
 /* Structure which describes the whole topology */
 struct vimc_pipeline_config {
 	const struct vimc_ent_config *ents;
 	size_t num_ents;
-	const struct vimc_ent_link *links;
-	size_t num_links;
+	const struct vimc_data_link *data_links;
+	size_t num_data_links;
+	const struct vimc_ancillary_link *ancillary_links;
+	size_t num_ancillary_links;
 };
 
 /* --------------------------------------------------------------------------
@@ -91,32 +104,49 @@ static struct vimc_ent_config ent_config[] = {
 		.name = "RGB/YUV Capture",
 		.type = &vimc_cap_type
 	},
+	{
+		.name = "Lens A",
+		.type = &vimc_len_type
+	},
+	{
+		.name = "Lens B",
+		.type = &vimc_len_type
+	},
 };
 
-static const struct vimc_ent_link ent_links[] = {
+static const struct vimc_data_link data_links[] = {
 	/* Link: Sensor A (Pad 0)->(Pad 0) Debayer A */
-	VIMC_ENT_LINK(0, 0, 2, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
+	VIMC_DATA_LINK(0, 0, 2, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
 	/* Link: Sensor A (Pad 0)->(Pad 0) Raw Capture 0 */
-	VIMC_ENT_LINK(0, 0, 4, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
+	VIMC_DATA_LINK(0, 0, 4, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
 	/* Link: Sensor B (Pad 0)->(Pad 0) Debayer B */
-	VIMC_ENT_LINK(1, 0, 3, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
+	VIMC_DATA_LINK(1, 0, 3, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
 	/* Link: Sensor B (Pad 0)->(Pad 0) Raw Capture 1 */
-	VIMC_ENT_LINK(1, 0, 5, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
+	VIMC_DATA_LINK(1, 0, 5, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
 	/* Link: Debayer A (Pad 1)->(Pad 0) Scaler */
-	VIMC_ENT_LINK(2, 1, 7, 0, MEDIA_LNK_FL_ENABLED),
+	VIMC_DATA_LINK(2, 1, 7, 0, MEDIA_LNK_FL_ENABLED),
 	/* Link: Debayer B (Pad 1)->(Pad 0) Scaler */
-	VIMC_ENT_LINK(3, 1, 7, 0, 0),
+	VIMC_DATA_LINK(3, 1, 7, 0, 0),
 	/* Link: RGB/YUV Input (Pad 0)->(Pad 0) Scaler */
-	VIMC_ENT_LINK(6, 0, 7, 0, 0),
+	VIMC_DATA_LINK(6, 0, 7, 0, 0),
 	/* Link: Scaler (Pad 1)->(Pad 0) RGB/YUV Capture */
-	VIMC_ENT_LINK(7, 1, 8, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
+	VIMC_DATA_LINK(7, 1, 8, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
+};
+
+static const struct vimc_ancillary_link ancillary_links[] = {
+	/* Link: Sensor A -> Lens A */
+	VIMC_ANCILLARY_LINK(0, 9),
+	/* Link: Sensor B -> Lens B */
+	VIMC_ANCILLARY_LINK(1, 10),
 };
 
 static struct vimc_pipeline_config pipe_cfg = {
-	.ents		= ent_config,
-	.num_ents	= ARRAY_SIZE(ent_config),
-	.links		= ent_links,
-	.num_links	= ARRAY_SIZE(ent_links)
+	.ents		     = ent_config,
+	.num_ents	     = ARRAY_SIZE(ent_config),
+	.data_links	     = data_links,
+	.num_data_links	     = ARRAY_SIZE(data_links),
+	.ancillary_links     = ancillary_links,
+	.num_ancillary_links = ARRAY_SIZE(ancillary_links),
 };
 
 /* -------------------------------------------------------------------------- */
@@ -135,8 +165,8 @@ static int vimc_create_links(struct vimc_device *vimc)
 	int ret;
 
 	/* Initialize the links between entities */
-	for (i = 0; i < vimc->pipe_cfg->num_links; i++) {
-		const struct vimc_ent_link *link = &vimc->pipe_cfg->links[i];
+	for (i = 0; i < vimc->pipe_cfg->num_data_links; i++) {
+		const struct vimc_data_link *link = &vimc->pipe_cfg->data_links[i];
 
 		struct vimc_ent_device *ved_src =
 			vimc->ent_devs[link->src_ent];
@@ -150,6 +180,22 @@ static int vimc_create_links(struct vimc_device *vimc)
 			goto err_rm_links;
 	}
 
+	for (i = 0; i < vimc->pipe_cfg->num_ancillary_links; i++) {
+		const struct vimc_ancillary_link *link = &vimc->pipe_cfg->ancillary_links[i];
+
+		struct vimc_ent_device *ved_primary =
+			vimc->ent_devs[link->primary_ent];
+		struct vimc_ent_device *ved_ancillary =
+			vimc->ent_devs[link->ancillary_ent];
+		struct media_link *ret_link =
+			media_create_ancillary_link(ved_primary->ent, ved_ancillary->ent);
+
+		if (IS_ERR(ret_link)) {
+			ret = PTR_ERR(link);
+			goto err_rm_links;
+		}
+	}
+
 	return 0;
 
 err_rm_links:
diff --git a/drivers/media/test-drivers/vimc/vimc-lens.c b/drivers/media/test-drivers/vimc/vimc-lens.c
new file mode 100644
index 000000000000..dfe824d3addb
--- /dev/null
+++ b/drivers/media/test-drivers/vimc/vimc-lens.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * vimc-lens.c Virtual Media Controller Driver
+ * Copyright (C) 2022 Google, Inc
+ * Author: yunkec@google.com (Yunke Cao)
+ */
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-subdev.h>
+
+#include "vimc-common.h"
+
+#define VIMC_LEN_MAX_FOCUS_POS	1023
+#define VIMC_LEN_MAX_FOCUS_STEP	1
+
+struct vimc_len_device {
+	struct vimc_ent_device ved;
+	struct v4l2_subdev sd;
+	struct v4l2_ctrl_handler hdl;
+	u32 focus_absolute;
+};
+
+static const struct v4l2_subdev_core_ops vimc_len_core_ops = {
+	.log_status = v4l2_ctrl_subdev_log_status,
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
+static const struct v4l2_subdev_ops vimc_len_ops = {
+	.core = &vimc_len_core_ops
+};
+
+static int vimc_len_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct vimc_len_device *vlen =
+		container_of(ctrl->handler, struct vimc_len_device, hdl);
+	if (ctrl->id == V4L2_CID_FOCUS_ABSOLUTE) {
+		vlen->focus_absolute = ctrl->val;
+		return 0;
+	}
+	return -EINVAL;
+}
+
+static const struct v4l2_ctrl_ops vimc_len_ctrl_ops = {
+	.s_ctrl = vimc_len_s_ctrl,
+};
+
+static struct vimc_ent_device *vimc_len_add(struct vimc_device *vimc,
+					    const char *vcfg_name)
+{
+	struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
+	struct vimc_len_device *vlen;
+	int ret;
+
+	/* Allocate the vlen struct */
+	vlen = kzalloc(sizeof(*vlen), GFP_KERNEL);
+	if (!vlen)
+		return ERR_PTR(-ENOMEM);
+
+	v4l2_ctrl_handler_init(&vlen->hdl, 1);
+
+	v4l2_ctrl_new_std(&vlen->hdl, &vimc_len_ctrl_ops,
+			  V4L2_CID_FOCUS_ABSOLUTE, 0,
+			  VIMC_LEN_MAX_FOCUS_POS, VIMC_LEN_MAX_FOCUS_STEP, 0);
+	vlen->sd.ctrl_handler = &vlen->hdl;
+	if (vlen->hdl.error) {
+		ret = vlen->hdl.error;
+		goto err_free_vlen;
+	}
+	vlen->ved.dev = vimc->mdev.dev;
+
+	ret = vimc_ent_sd_register(&vlen->ved, &vlen->sd, v4l2_dev,
+				   vcfg_name, MEDIA_ENT_F_LENS, 0,
+				   NULL, &vimc_len_ops);
+	if (ret)
+		goto err_free_hdl;
+
+	return &vlen->ved;
+
+err_free_hdl:
+	v4l2_ctrl_handler_free(&vlen->hdl);
+err_free_vlen:
+	kfree(vlen);
+
+	return ERR_PTR(ret);
+}
+
+static void vimc_len_release(struct vimc_ent_device *ved)
+{
+	struct vimc_len_device *vlen =
+		container_of(ved, struct vimc_len_device, ved);
+
+	v4l2_ctrl_handler_free(&vlen->hdl);
+	media_entity_cleanup(vlen->ved.ent);
+	kfree(vlen);
+}
+
+struct vimc_ent_type vimc_len_type = {
+	.add = vimc_len_add,
+	.release = vimc_len_release
+};
-- 
2.36.1.476.g0c4daa206d-goog

