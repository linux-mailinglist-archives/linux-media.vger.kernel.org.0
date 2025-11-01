Return-Path: <linux-media+bounces-46111-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19171C2788C
	for <lists+linux-media@lfdr.de>; Sat, 01 Nov 2025 06:28:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B43893BBD41
	for <lists+linux-media@lfdr.de>; Sat,  1 Nov 2025 05:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ECA12749F2;
	Sat,  1 Nov 2025 05:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9Bxb1Z/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623A426CE2F
	for <linux-media@vger.kernel.org>; Sat,  1 Nov 2025 05:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761974881; cv=none; b=jwYgL/EMa4yLIpQ9YitRZYt5fLJgbEkoLAVOIcyXVNB0J7mc9PfLqakYUsqb5CAlVxr5GMi0bWaujzr1oiZ0L3epszx9I0/el11Stc2HEHva2EEHlSC6j1aFmBNRnnaiEiSPa2pq6NP140jzKcvSIfrbVT8fSofVR7eCzX31qCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761974881; c=relaxed/simple;
	bh=+GZ9/pl+8tJmcSAdMKK7yphZtxzKGCjQy/GcNEI0V8c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hFMMOjzzBiM8XnOG6mWRe3uFS9dyRnjAe2MI8SVAzNt3v0GhFantje+nHgYGXw37Dirz2ckdxFFlSzFch8tzwNa80ZhA2422MWCPP8s2M5kfmKtxv8rgLa0++I1c9fNY3zKMrWbuKQxIngHRkxECWsgE+csLb9KuYa8RvZn8d1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X9Bxb1Z/; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b5579235200so2136600a12.3
        for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 22:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761974878; x=1762579678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z/ptnNT0Ywe4s6PcYyycXyPs8DpHI02oawu5aekCWR0=;
        b=X9Bxb1Z/0QXoU8q3d9yG78L+a5bNqc8F+1sNinz6pRbRvmqpwSkIInKT9C7mwhm5Zk
         OIHmYD03+YjBtcARD+Ewh7CjzkqzaMWThZJiKx1uKlBRgot4/9FO/X2GXz6Cli/0gv70
         2TR8F0bf1szviSuxLGsrVPFEWP+GF86qJ9UAIJ9exgmSIpWBkF8DSu1smfEPypN9C8xl
         nC6KxC4JOhwCreC8KK2ugSYyt/vZtYaRgFvvhXYp3Em6WaPHHmqB7bKpNnKPm4/hx9Pj
         eBj5JOJFV09iABW3AgdjJ293mOxSe+VIgzGgEUs0nRGNHuyB+4ilwmGjTDPyi1Efr+oN
         sUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761974878; x=1762579678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z/ptnNT0Ywe4s6PcYyycXyPs8DpHI02oawu5aekCWR0=;
        b=tde7SBK2kQGVE3bQT3l+2L0/srsbEY1usMXAY26+y0QEowF+d3bgKaVuR3xaCWeWmP
         +IA/NCLy2ZECF4n+Z+4c71FmBy8KwRdHhCUpWDORg6AvvPVyIfxeitU6ncCsT1Gz3ol6
         Bj07bW7ixhOqB3s5ZxTcYOGAgxQyaVIhLYTyj5odfAYmPtAOK3/J1ALHa90hvvlr1CoD
         isv0m2b404KztkWhshB4+vDnVO04lvDJu0yncPMdBFc7CAtAWKVm0upLsAu+HvO5yT8F
         /ZX2Cf132PZqnbQNoEJBOESBIbZx0RevO4ZmwucyzGctp7/aKu7l3ec/gjQX6Z+XlbUF
         0sRg==
X-Gm-Message-State: AOJu0YyFxjRiqE1Cjy0daZgZ4aEoU+/LeDNtFdLQI7yMlZ1bFeQdrhhv
	iXfEnmPShxx9RNvtWNld40/fOUiV+gKuXk4EQnPJpyFqWZ1L5/VCQ5b6
X-Gm-Gg: ASbGncu2jujGIoRU63Yd1M71l9FBcQ8MIHwl6fSNzNQbAdEI4ZlnxJVzCMVRlkAPINQ
	ozDlIoi0TDimGVjCZHfYMMPVPOsJ+SnIIxEN/Qima0scUFO22nnWmF0zDqQmzCm8LgdV+kbnnX3
	eNRs+DND1WJhVwKs9XKzQpbGyl+PTZgMsqyKlhfqTfUMYZ+iC5ibgSdsuQlVeOGxcYjBCpBwjWj
	CLh5ZycKzImBy2qkdyvtCHR6gwBsp6FhLi3FVxOR02oZj7vTMjZogECJEXkbQ8QI88K568VuAj+
	fqptV+8ZXGbZEMZ9vbKt0wdKDY1LZxbd5QcnqITColMGNA37z/UGn9V/C2t2qhw/u4DRlPvhYRR
	Uw+GL2EYvWu+42wWypIFnQE8b0toFRhseRcjEbV2DUkbcYuSGDyoPCdm3Oy4NQGMEWr8n0b7X1t
	gE916rF7kkiEnAUQa9RCPsb9pURzJgXunbfVyV5jygQborn6jfJL+X1e4hcNoWQjjy0aipDOHdZ
	NbJWOmHQo7KENYLFeB0X7XoCw==
X-Google-Smtp-Source: AGHT+IGsr0iWlw76pddp4ckfx5jyzC4ernwO/7Dv/NG7LUkw/+6xWR4R4woGmK7aLj+ui0CQBbPtug==
X-Received: by 2002:a17:903:3c23:b0:294:7048:643 with SMTP id d9443c01a7336-2951a3981fcmr77796005ad.15.1761974878463;
        Fri, 31 Oct 2025 22:27:58 -0700 (PDT)
Received: from opensource206.. ([106.222.234.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3407f24ee93sm2041158a91.9.2025.10.31.22.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 22:27:58 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: skhan@linuxfoundation.org,
	kieran.bingham@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH] media: vimc: add RGB/YUV input entity implementation
Date: Sat,  1 Nov 2025 10:56:51 +0530
Message-ID: <20251101052651.6197-1-opensource206@gmail.com>
X-Mailer: git-send-email 2.43.0
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


