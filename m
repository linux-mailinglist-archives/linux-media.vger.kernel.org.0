Return-Path: <linux-media+bounces-50814-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AB396D27F47
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 20:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 597B430101F1
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 19:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35BC330BBA5;
	Thu, 15 Jan 2026 19:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QdrKIahC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D33635FF64
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 19:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768504271; cv=none; b=oU3M5wagU/7kUGJ+GwtAsEJ+0GPEcf86ShM9KW0Xczy01piWqVeNDqW6OXwIjSOND+5opRfHrYktpEpf1q7BWL7Gz30pThD3drlFZvO3X+ePRfO/WF2adjXCTl83AJ0DVicOKsyRIobiuxR8f3KVwQWUdt4WIbtx70EAHn9utJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768504271; c=relaxed/simple;
	bh=Pf6aUhq/A5fnZS4P/3LJTBZTV+YzE+3pz/b+VfuDnm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YOIA9qIM985Wt25MQWNnTyieyheBIHHEQeZFJ866BmdhzbicmtvOMGM+2NhaI2AOTc+DlxuaMP/qHhqnx3+W3o42KnWR2CfLX15DYRP59TO91lh4j5Uf9Lq/2JkYqgOcsHakdSohhh4f2gsk55y0MYMkRVaSgNir9MvKnkWMjZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QdrKIahC; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-81f391aeedbso22735b3a.0
        for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 11:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768504268; x=1769109068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DirXpAW9RYTjZxbF/k/gs74kpmtHhQI6l/Y1yiztIks=;
        b=QdrKIahCuNBIYiUyDAa3G+hxNbwp7noEX7QMb41Ivphcpra4Appf9nPZYIE1wXrTxH
         TG/fCOdgkxpQnueRlxoQ8hrjUZhPN+8OR0U1Z5wNB4fKmOrxzYxlVIW6MfPzzVlSoXBv
         n6MefQyGpS6Yjwv4WnwZK4V4OtqAcSIbVjn82Drmbu7Nyyr4XNBoWwjkuoDX7k87zk3M
         99k1E7kZSfeeAkROudpXS4CVh6dPBICfbSpRvDWQToDLxnZpuagja+drb7ytS4ilTDie
         c/iP6djAipqHJR2wcaN5tsqJIIA43iyenCc6zOdZRlBuxyByRr+woSHy3vNo+4YQA/Ei
         OA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768504268; x=1769109068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DirXpAW9RYTjZxbF/k/gs74kpmtHhQI6l/Y1yiztIks=;
        b=GJ0BKNatBoK+gdy11Jf2IROL9qye/gQta/96+icB8lAK1UpWA04wfr7TQA3ay//PIN
         cd3CSugrJ94ed7jqJH011zvWOOVCh1QeenzU9k2C032IcEtpOOckJ/1LVVZfQExuQQwU
         nSPszdcYcJbeLtlfqzMGyhBQCkd+yxRN6MT6g/XTBStuY31530QeqxbYCVWwSHxPc6/N
         5jkMbzjDH7fA3nm/yUo7x8sT/LS32XnlwS9diAZFA3lzsMCaGPr2nOxX0ZqrR5KNG68D
         pYlk+mK6AslTbShljuyKbsKEU6ntJ4yzdP5ZSFzzZECx+av3MzQw1A50cRgco2lik15d
         NugA==
X-Forwarded-Encrypted: i=1; AJvYcCW2sLWJ6AS2Jk02pg/aLEgEz0U7lQq/VUJpzOO/Lh7ocvnuYmRWWbBhq9HLlvZVXb2FiuDCdKVap+vxoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLd1Fj4km2xKRcJMVnSqGn0k24pvNwpxeKLII3i/giS8KqBl18
	90+yAcdltlFSMS6PM4qsNCxwY2ryaCf7pbQLs9oNJhWJBBVilqk0K4mq
X-Gm-Gg: AY/fxX6PNRpwzwKyCFkzizkLQUirPP79eZuviiFpQQJRzfMZ2dT5u6fGLl2bfy+ZEhD
	9MOFytp/c4FHzowp1C1blCk3cfWRgXf9zx75gB+ffZdtBiw9UN2fteltFzDaHc2YvRHVr16vZSs
	0iZLuUKbfSodl78SQh3YKFICpXfyHBe+mP+1WzCA4Fo5WIHEMAN1eeY5sL7kmv4hhb/Crc7/+fg
	QOjdfXvhAA0r/VhcQQwGDUctCVcKHQa2S4xX6QVFq4SLFzdWUJsTY59YmmVq0q7vyGMMkZfvXmR
	20shHtFKkHEo+SikbnN8nJW8GK11vT2PYCMg66+GFmMhzJNhzZMlv4rqpp2UhBX6VwLWpqDJ079
	sq4y6fY3TRYOtQ/r8vZUB0EgjtgAfWD5RmviLkEWSJURkFY6QpV1JjxxbKSzgGTj3aMDf4iAeGa
	TdNVtL7L4iQtt4uoxs3kc=
X-Received: by 2002:a05:6a00:cc1:b0:81b:6dd5:cb30 with SMTP id d2e1a72fcca58-81fa03bc106mr424413b3a.7.1768504268063;
        Thu, 15 Jan 2026 11:11:08 -0800 (PST)
Received: from FAIZEL-KB.. ([2001:569:5999:dc00:538a:c0c9:9ac1:2b99])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-81fa12b51d9sm121409b3a.65.2026.01.15.11.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 11:11:07 -0800 (PST)
From: faizel.kb@gmail.com
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH 2/3] media: vimc: sensor: Add frame rate configuration support
Date: Thu, 15 Jan 2026 11:10:49 -0800
Message-ID: <20260115191050.1370387-3-faizel.kb@gmail.com>
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

Implement set_frame_interval and get_frame_interval callbacks in
v4l2_subdev_pad_ops to enable frame rate configuration from 1-240 FPS.
The default frame rate is 60 FPS.

The configured frame interval is pre-calculated into jiffies and
stored in the sensor's hw structure for efficient access by the
streamer thread.

Signed-off-by: Faizel K B <faizel.kb@gmail.com>
---
 drivers/media/test-drivers/vimc/vimc-common.h |  2 +
 drivers/media/test-drivers/vimc/vimc-sensor.c | 45 +++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
index 7f5f008e407b..a71ef761fa77 100644
--- a/drivers/media/test-drivers/vimc/vimc-common.h
+++ b/drivers/media/test-drivers/vimc/vimc-common.h
@@ -173,6 +173,7 @@ struct vimc_sensor_device {
 	struct tpg_data tpg;
 	struct v4l2_ctrl_handler hdl;
 	struct media_pad pad;
+	struct v4l2_fract frame_interval;
 
 	u8 *frame;
 
@@ -184,6 +185,7 @@ struct vimc_sensor_device {
 		struct v4l2_area size;
 		enum vimc_sensor_osd_mode osd_value;
 		u64 start_stream_ts;
+		unsigned long fps_jiffies;
 	} hw;
 };
 
diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
index 2b07dc1f1278..d54425ff28a1 100644
--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
@@ -140,12 +140,53 @@ static int vimc_sensor_set_fmt(struct v4l2_subdev *sd,
 
 	return 0;
 }
+static int vimc_sensor_get_frame_interval(struct v4l2_subdev *sd,
+					  struct v4l2_subdev_state *state,
+					  struct v4l2_subdev_frame_interval *fi)
+{
+	struct vimc_sensor_device *vsensor = v4l2_get_subdevdata(sd);
+
+	fi->interval = vsensor->frame_interval;
+
+	return 0;
+}
+
+static int vimc_sensor_set_frame_interval(struct v4l2_subdev *sd,
+					  struct v4l2_subdev_state *state,
+					  struct v4l2_subdev_frame_interval *fi)
+{
+	struct vimc_sensor_device *vsensor = v4l2_get_subdevdata(sd);
+	u32 fps;
+
+	/* Sanitize to default if invalid */
+	if (unlikely(!fi->interval.numerator || !fi->interval.denominator)) {
+		fi->interval.numerator = 1;
+		fi->interval.denominator = 60;
+	} else {
+		/* Clamp FPS to 1-240 range */
+		fps = fi->interval.denominator / fi->interval.numerator;
+		fps = clamp(fps, 1U, 240U);
+
+		fi->interval.numerator = 1;
+		fi->interval.denominator = fps;
+	}
+
+	vsensor->frame_interval = fi->interval;
+
+	/* Update hardware timing configuration */
+	vsensor->hw.fps_jiffies = (HZ * vsensor->frame_interval.numerator) /
+				  vsensor->frame_interval.denominator;
+
+	return 0;
+}
 
 static const struct v4l2_subdev_pad_ops vimc_sensor_pad_ops = {
 	.enum_mbus_code		= vimc_sensor_enum_mbus_code,
 	.enum_frame_size	= vimc_sensor_enum_frame_size,
 	.get_fmt		= v4l2_subdev_get_fmt,
 	.set_fmt		= vimc_sensor_set_fmt,
+	.get_frame_interval     = vimc_sensor_get_frame_interval,
+	.set_frame_interval     = vimc_sensor_set_frame_interval,
 };
 
 static void *vimc_sensor_process_frame(struct vimc_ent_device *ved,
@@ -400,6 +441,10 @@ static struct vimc_ent_device *vimc_sensor_add(struct vimc_device *vimc,
 
 	vsensor->ved.process_frame = vimc_sensor_process_frame;
 	vsensor->ved.dev = vimc->mdev.dev;
+	/* Initialize to 60 FPS */
+	vsensor->frame_interval.numerator = 1;
+	vsensor->frame_interval.denominator = 60;
+	vsensor->hw.fps_jiffies = HZ / 60;
 
 	return &vsensor->ved;
 
-- 
2.43.0


