Return-Path: <linux-media+bounces-47451-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B82C72F43
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 09:50:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id D75EE2A8CB
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 08:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206913101B7;
	Thu, 20 Nov 2025 08:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YgzcJ80C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5F130FC1C
	for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 08:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763628587; cv=none; b=fWBwZ26QgUDJbnoRj1AK4qYgbUpmqhppQAU7MrHaI/cTEVLHxrOBQSShu9YsSPoe8UrN18EZNuM6SobgoqG0x3crCrlJn8yd3IIXBHZFuURcaxYCO1dogNoFfy3ek+VarQFXi9i1Fq2s+H17DqyU4JyzcrPh68YzTETQO8K1+pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763628587; c=relaxed/simple;
	bh=+GZ9/pl+8tJmcSAdMKK7yphZtxzKGCjQy/GcNEI0V8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jj1xWKdiP4/yyPcXs18SHU24ezZAtLYjgK6ZLerbE9zKfHKbbI00v1NYNLB9+ZMDDktLqAeVCjYWaxyRXCL7ZSaGKdy3RoVXg+eAcC9KmQCBOrrLCpg162m0cNh2w1LQ4zDQmXzk2oehbcizAsycB4HNbqPBRgwoAS4arVjx5SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YgzcJ80C; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso520506b3a.3
        for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 00:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763628585; x=1764233385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/ptnNT0Ywe4s6PcYyycXyPs8DpHI02oawu5aekCWR0=;
        b=YgzcJ80CMKifbcbzFZqciA/V9Nqj4RY2B3jLB5ApDHUFAy+O5DRxf1CvALO91ultxC
         U2OsHiUT72YAewqETTxFOtgxuEEdmJ4riExfO96GJWsWc5NvAIuju/lMOHW9VxXcDDzv
         SldVyy5BSWHzCmHNaBRAK1S69KwsLSDKFNzXAOcanbrANUUjvyRtMMZRDX9lEiKSSMQU
         cm3DDREiRRKPq/dfuKdbodJgjx6+Ftg9EqKYhmTvOiaA1ltdqUo9QPpCTmYg3YbSlYXL
         0uSp9wOUV0oCxiHGJpDR2cYSrx10+DzXfj6vSd9nfTac5r3WjxFy8C9/sAyKLQoZz1Kz
         28sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763628585; x=1764233385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z/ptnNT0Ywe4s6PcYyycXyPs8DpHI02oawu5aekCWR0=;
        b=dU14Hb/mx6YLbCUpKsbxw+8Ou0YnBOTKeedUYHZW3rVsDer/Wqw9EhemedYYazb+7t
         UTwU1ukKv84nw9N4XVvcd4Kh4tt/yvzY4mZA+TAYjlxyrl6RXnfmg8ezwyCfOOfXXafP
         FwTnCjVqNygvuN5TY3pTpev1jmrMMSwdEd3ZxU9+cvHs7Tc5DdZEuRMz5bSNwtvuGIGS
         CeT4EtwF/j5MpXBngwkYJC4C5JJij3sWLG31IPZ9u9blbe8UPmF1FVVrRET2VF+7tlDk
         4sdIDxc7irQ7KBNoDpRL7Fxmx/ArphUZhZEAXbsIwrPwSwtKI6veOegL/7+dDhjj1FCZ
         lhGw==
X-Forwarded-Encrypted: i=1; AJvYcCW5Vb/q86ZVIkZ9bfsRFGzcTMF4XO/yMnnCynEtAP1LNgh1VexgX15oCaLjD0njJGHYIMmFQd0zUFuZ8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYWUgLxxLnzBV2VONaaUXcNUzRtPdCdJ583hPvo38WHBs/yDQH
	y5pvA63we1fEugEbfTN0Svd3qZA1dDssf0YfZ42gDpgR+0vQbgxE8Ck3
X-Gm-Gg: ASbGncujAco2IXtmiaSbJsYh8Sb9cjwrw0aSgrUUbpjm6uUeg014/XO29KurMNFeC2l
	cSVfyzLjYiutc9GqJsF7gMfEC12VUMM1b+/flWOINrMq5ofbEiV0kzX6w1wECT7tufidv7vDM5u
	ZkJSoD/nOWAG+Ed3n8RDhN6z4h5yiL70/l51PwMp/4gw1Vk58en05k5K/zeIJrHziQ1+TXY4t6C
	eKSJWLEtaNBSblCejlbkcl8XrKH6QYdMcp8A4DPl94CswKsp4tTNB+EMObxKR/edtJ4wqaFfsN7
	Dmr7NLy6ZFayAuApzZx8x9TFYjRe7yPAckm1/Q4PgAObtnDlGc9Dsz6rK3o0brOLJWfQ7MEb/OM
	efvBHQjZSbDXepnGGbgWCqRwF3It744Pw8StB0+YJgRG/BiU6N3kSAQLPnNptWmIbLz+XGMOxDQ
	cucJbk5OoXnGn9j6OzCd40YodKFMZ9PUHqkcg043fM/6Jyc/Bi
X-Google-Smtp-Source: AGHT+IEALagsCqhTRCRlW+YucKP93SC8UvQZZ3c8uhGdG1xhbcDAVp6w1UfBjYuS8RMQv2QHfKnBEQ==
X-Received: by 2002:a05:6a00:22d5:b0:781:2291:1045 with SMTP id d2e1a72fcca58-7c3eee84759mr3037945b3a.8.1763628584944;
        Thu, 20 Nov 2025 00:49:44 -0800 (PST)
Received: from opensource206.. ([157.50.102.16])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f023fba8sm1974900b3a.41.2025.11.20.00.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 00:49:44 -0800 (PST)
From: Pavan Bobba <opensource206@gmail.com>
To: skhan@linuxfoundation.org,
	kieran.bingham@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH 1/5] media: vimc: add RGB/YUV input entity implementation
Date: Thu, 20 Nov 2025 14:19:22 +0530
Message-ID: <20251120084926.18620-2-opensource206@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251120084926.18620-1-opensource206@gmail.com>
References: <20251120084926.18620-1-opensource206@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a new vimc-input entity to simulate a color frame source in the
Virtual Media Controller (VIMC) pipeline. This entity outputs RGB888 frames
and allows testing of pipelines that start from a pre-processed RGB/YUV
source instead of a raw Bayer sensor.

The patch adds vimc-input.c with basic pad operations for format
enumeration, get/set, and stream enable/disable handlers. The entity is
registered in the VIMC core configuration, replacing the previous temporary
use of vimc-sensor. Frame generation is not yet implemented and remains a
TODO for future work.

This change enables link validation and format negotiation for the
RGB/YUV input path, paving the way for software frame injection and
test-pattern generation.

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/media/test-drivers/vimc/Makefile      |   3 +-
 drivers/media/test-drivers/vimc/vimc-common.h |   1 +
 drivers/media/test-drivers/vimc/vimc-core.c   |   3 +-
 drivers/media/test-drivers/vimc/vimc-input.c  | 210 ++++++++++++++++++
 4 files changed, 214 insertions(+), 3 deletions(-)
 create mode 100644 drivers/media/test-drivers/vimc/vimc-input.c

diff --git a/drivers/media/test-drivers/vimc/Makefile b/drivers/media/test-drivers/vimc/Makefile
index 9b9631562473..7e1fdb2f2a78 100644
--- a/drivers/media/test-drivers/vimc/Makefile
+++ b/drivers/media/test-drivers/vimc/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 vimc-y := vimc-core.o vimc-common.o vimc-streamer.o vimc-capture.o \
-		vimc-debayer.o vimc-scaler.o vimc-sensor.o vimc-lens.o
+		vimc-debayer.o vimc-scaler.o vimc-sensor.o vimc-lens.o \
+		vimc-input.o
 
 obj-$(CONFIG_VIDEO_VIMC) += vimc.o
 
diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
index 7a45a2117748..6c94b1635fa8 100644
--- a/drivers/media/test-drivers/vimc/vimc-common.h
+++ b/drivers/media/test-drivers/vimc/vimc-common.h
@@ -172,6 +172,7 @@ extern const struct vimc_ent_type vimc_debayer_type;
 extern const struct vimc_ent_type vimc_scaler_type;
 extern const struct vimc_ent_type vimc_capture_type;
 extern const struct vimc_ent_type vimc_lens_type;
+extern const struct vimc_ent_type vimc_input_type;
 
 /**
  * vimc_pix_map_by_index - get vimc_pix_map struct by its index
diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
index f632c77e52f5..2f6846facb23 100644
--- a/drivers/media/test-drivers/vimc/vimc-core.c
+++ b/drivers/media/test-drivers/vimc/vimc-core.c
@@ -107,9 +107,8 @@ static const struct vimc_ent_config ent_config[] = {
 		.type = &vimc_capture_type
 	},
 	[RGB_YUV_INPUT] = {
-		/* TODO: change this to vimc-input when it is implemented */
 		.name = "RGB/YUV Input",
-		.type = &vimc_sensor_type
+		.type = &vimc_input_type
 	},
 	[SCALER] = {
 		.name = "Scaler",
diff --git a/drivers/media/test-drivers/vimc/vimc-input.c b/drivers/media/test-drivers/vimc/vimc-input.c
new file mode 100644
index 000000000000..cedcc450d59e
--- /dev/null
+++ b/drivers/media/test-drivers/vimc/vimc-input.c
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * vimc-input.c Virtual Media Controller Driver
+ *
+ * Copyright (C) 2025 Virtual Input Entity Implementation
+ */
+
+#include <linux/v4l2-mediabus.h>
+#include <media/v4l2-subdev.h>
+
+#include "vimc-common.h"
+
+struct vimc_input_device {
+	struct vimc_ent_device ved;
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+};
+
+static const struct v4l2_mbus_framefmt fmt_default = {
+	.width = 640,
+	.height = 480,
+	.code = MEDIA_BUS_FMT_RGB888_1X24,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = V4L2_COLORSPACE_SRGB,
+};
+
+static int vimc_input_init_state(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_mbus_framefmt *mf;
+	unsigned int i;
+
+	for (i = 0; i < sd->entity.num_pads; i++) {
+		mf = v4l2_subdev_state_get_format(sd_state, i);
+		*mf = fmt_default;
+	}
+
+	return 0;
+}
+
+static int vimc_input_enum_mbus_code(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *sd_state,
+				     struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index > 0)
+		return -EINVAL;
+
+	code->code = MEDIA_BUS_FMT_RGB888_1X24;
+
+	return 0;
+}
+
+static int vimc_input_enum_frame_size(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *sd_state,
+				      struct v4l2_subdev_frame_size_enum *fse)
+{
+	const struct vimc_pix_map *vpix;
+
+	if (fse->index)
+		return -EINVAL;
+
+	/* Only accept code in the pix map table */
+	vpix = vimc_pix_map_by_code(fse->code);
+	if (!vpix)
+		return -EINVAL;
+
+	fse->min_width = VIMC_FRAME_MIN_WIDTH;
+	fse->max_width = VIMC_FRAME_MAX_WIDTH;
+	fse->min_height = VIMC_FRAME_MIN_HEIGHT;
+	fse->max_height = VIMC_FRAME_MAX_HEIGHT;
+
+	return 0;
+}
+
+static int vimc_input_get_fmt(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state,
+			      struct v4l2_subdev_format *fmt)
+{
+	struct v4l2_mbus_framefmt *mf;
+
+	mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
+
+	fmt->format = *mf;
+
+	return 0;
+}
+
+static int vimc_input_set_fmt(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state,
+			      struct v4l2_subdev_format *fmt)
+{
+	struct v4l2_mbus_framefmt *mf;
+
+	mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
+
+	/* Set the new format */
+	*mf = fmt->format;
+
+	return 0;
+}
+
+static int vimc_input_enable_streams(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state,
+				     u32 pad, u64 streams_mask)
+{
+	/* For input entity, we don't allocate frames since we expect
+	 * external frame injection. Just mark that streaming is active.
+	 *
+	 * TODO: For future enhancement, consider implementing frame generation
+	 * or userspace frame injection mechanism. This would require:
+	 * - Frame buffer allocation (similar to vimc-sensor.c)
+	 * - Interface for userspace to inject frames (e.g., via sysfs/debugfs)
+	 * - Frame rate control for generated test patterns
+	 * - Integration with VIMC's streaming infrastructure
+	 * This would make the input entity suitable for more testing scenarios.
+	 */
+	return 0;
+}
+
+static int vimc_input_disable_streams(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state,
+				      u32 pad, u64 streams_mask)
+{
+	/* Streaming stopped - no cleanup needed for input entity */
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops vimc_input_pad_ops = {
+	.enum_mbus_code		= vimc_input_enum_mbus_code,
+	.enum_frame_size	= vimc_input_enum_frame_size,
+	.get_fmt		= vimc_input_get_fmt,
+	.set_fmt		= vimc_input_set_fmt,
+	.enable_streams		= vimc_input_enable_streams,
+	.disable_streams	= vimc_input_disable_streams,
+};
+
+static const struct v4l2_subdev_ops vimc_input_ops = {
+	.pad = &vimc_input_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops vimc_input_internal_ops = {
+	.init_state = vimc_input_init_state,
+};
+
+static void vimc_input_release(struct vimc_ent_device *ved)
+{
+	struct vimc_input_device *vinput =
+		container_of(ved, struct vimc_input_device, ved);
+
+	v4l2_subdev_cleanup(&vinput->sd);
+	media_entity_cleanup(vinput->ved.ent);
+	kfree(vinput);
+}
+
+/*
+ * Input process frame function
+ * For an input entity, just return the received frame unchanged
+ */
+static void *vimc_input_process_frame(struct vimc_ent_device *ved,
+				      const void *frame)
+{
+	/* For an input entity, just return the received frame unchanged.
+	 *
+	 * TODO: Future enhancement could implement:
+	 * - Frame validation and format checking
+	 * - Frame transformation or processing
+	 * - Frame injection from userspace buffers
+	 * - Frame rate limiting or buffering
+	 * Currently, this is a simple pass-through for external frame sources.
+	 */
+	return (void *)frame;
+}
+
+static struct vimc_ent_device *vimc_input_add(struct vimc_device *vimc,
+					      const char *vcfg_name)
+{
+	struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
+	struct vimc_input_device *vinput;
+	int ret;
+
+	/* Allocate the vinput struct */
+	vinput = kzalloc(sizeof(*vinput), GFP_KERNEL);
+	if (!vinput)
+		return ERR_PTR(-ENOMEM);
+
+	/* Initialize the media pad */
+	vinput->pad.flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = vimc_ent_sd_register(&vinput->ved, &vinput->sd, v4l2_dev,
+				   vcfg_name,
+				   MEDIA_ENT_F_IO_V4L, 1, &vinput->pad,
+				   &vimc_input_internal_ops, &vimc_input_ops);
+	if (ret)
+		goto err_free_vinput;
+
+	vinput->ved.process_frame = vimc_input_process_frame;
+	vinput->ved.dev = vimc->mdev.dev;
+
+	return &vinput->ved;
+
+err_free_vinput:
+	kfree(vinput);
+
+	return ERR_PTR(ret);
+}
+
+const struct vimc_ent_type vimc_input_type = {
+	.add = vimc_input_add,
+	.release = vimc_input_release
+};
-- 
2.43.0


