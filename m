Return-Path: <linux-media+bounces-50815-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA7CD2816A
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 20:29:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B8725306A255
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 19:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F5F26A1B9;
	Thu, 15 Jan 2026 19:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQPJxyvG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881102E0923
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 19:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768504272; cv=none; b=PX/zNWLvK0HCTNlir/OxmnBDIbGqIhdcMlyT6H23mN9uXIMgcFEfreY5IxY+ovq4sDpCPPRt5z3sC5RObJ11SXqt6hjx+RIGDRFcWBWdKQ14tDeg2R1hTey4SSdB4EOj7zWf9f3XaYXm70L7/FSeKU1+b7kY9t55HrHGSw7NN44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768504272; c=relaxed/simple;
	bh=j50m4RFmptBm0BwvlYOAQjc45u8uz0s4o7sOVRHLkyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OQWZpJcY6s1Lkj4OsKvI8qIXQ11kPpSckppHcpgRQ6nN9hALVvpPCsVmw9/xGFvu/UlIh0yap7xmW36ArS8lLwwlXmApuJQRCP4beCY271BWG9N9EnBY66Sv4glvelPN4mOUmnNZSanCmspc9rWek+2PQ1oRpYiow5tz+WEFH7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQPJxyvG; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-81ddb75b66fso19356b3a.2
        for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 11:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768504270; x=1769109070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhKmSLZooXapxtC9LVCl9LsIsYtUuIWJDO7ikImyFEA=;
        b=bQPJxyvGUPDpkJz7ToacexyNKHBzvfxU8ChDu22gEiu7J+pV4ch0SK72GcnhqICWco
         tEzBCiPv1opCxG2mIGK7+RBID166NO0/gpDEeE735G5A09B8K/OPYANccSA0Ve9BK9l9
         YCVBGdP5XoCnc4SRYLVTi3u4NnUA/PWulEcN6vbAJitjtn5N8fvM78cWnRVDhxbNMnir
         nsax7w1oKryGTwqqBWEn4+RZw3qULfafgjlZ+LGKS3TKU6mbYmKudDV/w1L67p+lmHSv
         b6X3mXIQ41FghkdHMxjBVKkMbeiclOdTc2iOU6ZbJLMtxdNZJa3acil9/AEx92wzJIhZ
         GBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768504270; x=1769109070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GhKmSLZooXapxtC9LVCl9LsIsYtUuIWJDO7ikImyFEA=;
        b=s8t57Q7A5OYlrH1Fwmi3/snfOk1Q89d9EjcsIFiV14kmZr3W3pa/je73uUVp9Vd0H/
         phO5qkuo4jMQ4zxZyccLOt7RbT+6rC0HcKv6C8iiOik9hbAV6kT7CcDdYSvVvb2lbi1O
         9+q2oIE72tcGmpToa9fu028GADczk0FTuIXU+kEafmgUGTRc8+dlDslN+dAIJVmZkNmZ
         e1vy1KAQKUymF7rsrABXNkUPesU3gSfFgaeb+Nh0zmNirYduTpPQ2U/Kxf87/GQtaFp2
         S1pdAA2/hMb39IbA6ssVNjtNyKT7ZKmeNQ+xoEsnLNE/MgyTmROLvq64dRYN/beec7jB
         JE4w==
X-Forwarded-Encrypted: i=1; AJvYcCVgmq/dACsy70/aI/Q2sYMBEQCa1xCPs5BFHFHkrEeahpToq071HCqQCdH6VUTHEpf/LCCgqR3/S/HgGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLB1Xz9wWtuRaRrqeJtN913KJsXSGhSOH6GDYOyEA1PWq+emR4
	2s75wBpL1v6RyF/km05KcMVKVMXdlE0NSg9fXnCxzSQUQIusNJUAtABN
X-Gm-Gg: AY/fxX6lDnjsVCuAVUj0xniz8EHdMBlJQcRgyow2RxDcBxhd+CI0hzEsTvAkBkA2X1X
	7Utb+wAlnX0eXhip0w9mM0je9y7b7MPXr0Kic+hjVDciEhIa6AFzD2XrsCdZZiTbb9Ic3eIQu91
	iVVHA+BtAVWwzY2pLvS8a06wN92sLt4zwD5EVPy9jX93YtXOVe7Lq1+d/Os2R4T05g76/ZOI6zF
	AbKl/2QR5a/+sRSXVcLxpvtTaU48kb6BEsuEd7xqELGSzpoIFVz5UrHV0sZ0LD02vjaVN9ovFb+
	awzGixJpas9ck5Sxi233Y9ywy6Y4t13tZlS23vH3Gw2uuVaOgSzt6fbCNmsidUUmXZdn3WOJ1+l
	HBUuIF5eYDa0z5xfqHrvF5K4ZfpZ9W8VVnzgm9hiWD3gMtPKkKDvHmY57XYR8PS0rvNfRvQ5pov
	iiKt6NkDXdyKuY2NjAC511XGLv+hjarg==
X-Received: by 2002:a05:6a00:4b86:b0:81f:72ef:27f0 with SMTP id d2e1a72fcca58-81fa038b4bamr301903b3a.6.1768504269763;
        Thu, 15 Jan 2026 11:11:09 -0800 (PST)
Received: from FAIZEL-KB.. ([2001:569:5999:dc00:538a:c0c9:9ac1:2b99])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-81fa12b51d9sm121409b3a.65.2026.01.15.11.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 11:11:09 -0800 (PST)
From: faizel.kb@gmail.com
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH 3/3] media: vimc: streamer: Apply sensor frame rate in streamer thread
Date: Thu, 15 Jan 2026 11:10:50 -0800
Message-ID: <20260115191050.1370387-4-faizel.kb@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260115191050.1370387-1-faizel.kb@gmail.com>
References: <20260115191050.1370387-1-faizel.kb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Faizel K B <faizel.kb@gmail.com>

Use the sensor's pre-calculated jiffies value to add appropriate
delay between frames according to the configured frame rate.

Note: The actual frame rate may vary slightly depending on processing
delays in other media pipeline components.

Tested using yavta frame rate display with CIF resolution:
yavta <video-node> --capture=<no_of_frames>

Signed-off-by: Faizel K B <faizel.kb@gmail.com>
---
 .../media/test-drivers/vimc/vimc-streamer.c   | 35 +++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-streamer.c b/drivers/media/test-drivers/vimc/vimc-streamer.c
index 15d863f97cbf..e4af6e0916b5 100644
--- a/drivers/media/test-drivers/vimc/vimc-streamer.c
+++ b/drivers/media/test-drivers/vimc/vimc-streamer.c
@@ -139,6 +139,31 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
 	return -EINVAL;
 }
 
+
+/**
+ * vimc_streamer_get_sensor() - Get sensor from pipeline
+ * @stream: the pipeline
+ *
+ * Helper function to find the sensor device in the pipeline.
+ * Returns pointer to sensor device or NULL if not found.
+ */
+static struct vimc_sensor_device *vimc_streamer_get_sensor(struct vimc_stream *stream)
+{
+	int i;
+
+	for (i = 0; i < stream->pipe_size; i++) {
+		struct vimc_ent_device *ved = stream->ved_pipeline[i];
+
+		if (ved && ved->ent &&
+		    ved->ent->function == MEDIA_ENT_F_CAM_SENSOR) {
+			return container_of(ved, struct vimc_sensor_device, ved);
+		}
+	}
+
+	return NULL;
+}
+
+
 /**
  * vimc_streamer_thread - Process frames through the pipeline
  *
@@ -154,25 +179,31 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
 static int vimc_streamer_thread(void *data)
 {
 	struct vimc_stream *stream = data;
+	struct vimc_sensor_device *vsensor;
 	u8 *frame = NULL;
 	int i;
+	unsigned long fps_jiffies;
+	const unsigned long default_jiffies = HZ / 60;
 
 	set_freezable();
+	vsensor = vimc_streamer_get_sensor(stream);
 
 	for (;;) {
 		try_to_freeze();
 		if (kthread_should_stop())
 			break;
 
+		/* Read from hardware configuration */
+		fps_jiffies = vsensor ? vsensor->hw.fps_jiffies : default_jiffies;
+
 		for (i = stream->pipe_size - 1; i >= 0; i--) {
 			frame = stream->ved_pipeline[i]->process_frame(
 					stream->ved_pipeline[i], frame);
 			if (!frame || IS_ERR(frame))
 				break;
 		}
-		//wait for 60hz
 		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ / 60);
+		schedule_timeout(fps_jiffies);
 	}
 
 	return 0;
-- 
2.43.0


