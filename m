Return-Path: <linux-media+bounces-52059-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QB9GHmkAgWlyDgMAu9opvQ
	(envelope-from <linux-media+bounces-52059-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 20:52:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B119DD0C68
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 20:52:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 512543077B92
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 19:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B091930C35C;
	Mon,  2 Feb 2026 19:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpqV9rqg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4684336AB76
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 19:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770061628; cv=none; b=bHdp53dZZutZ7mYi5PK9vT32tvHh49PNq3H0bffofC9JDsXhpSXDVzgVIftB4oALswhs1BQGKkmoKmX/I7H1mDhFD9U/DGkyNkAHtev3lH9QcbzuyjEC4cPqUNdkeOigjzWXPZ8BXT3HvQOOk9Y3xvNp37fALzRJzBiyppp2tr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770061628; c=relaxed/simple;
	bh=A4QX7qpdZ4pw6/6kLNBSFEv85l8O5Qi78oGZ32/sVuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oEtSWgoJIKkAJ73xwHwvQV2XZPqSsEw6ZmYGeuDyURuNS3DskL1IpuCuB41L5tL3p0J2HlVVsn2KtI0Ft1SmfMtnnicGuEcHbMc8+F2IbjKRjyd4a649ZLs2raHYtOb+BaGI96c4udI5K1MWlKb3cZ7pazJM8jwMcH6PwESehio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpqV9rqg; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-81e9dd8fe25so117613b3a.0
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 11:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770061624; x=1770666424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4RAohPMInpYRdZFPRVpri9RKwD42GbQUWynv/gE4tBc=;
        b=FpqV9rqgksDmwxNG8k9/xBp0CKWNvNHBvmGAj7pW4cLj8kVzD6NqTFjpVNBOZC9/NX
         445OhRXj706kUfDCpXKOGRf9e07e2+B/Qz4jp2QgD9R6L3Dluz5m+affosnANOaED+Nt
         vp8E5eoMBi1KfEsnPNfw0rKTgJKMSdRqZY5SAtfQCUyDRxwkoVeTjdaMDcynZSVMJ9ta
         k1JSwb+G+MdHRzpRvJoWPR2XuFxUvjRLJORk9aT7BS1iL2/YY9cFEUzlpIlH9DDOeh8w
         lm/FPa7J+v4s3dDDcUZZmKIl6z/3iO4sL0huG4C8DDvomwr/sgyJ/Zfhc6gw/Ehy37Mv
         bZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770061624; x=1770666424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4RAohPMInpYRdZFPRVpri9RKwD42GbQUWynv/gE4tBc=;
        b=RlxO3WtS4vsBR4oBYhtaAMlwVK1xsq4JhizqhGmqS6raHNz83ZPbMSQQjsDRtZltUp
         /idE5UIt/xCYqtqAv5kcuzSHyf+nwhvnOgzu0Zqo/3ZZaNtL+RdUx9XsL0LQ4UU16QUL
         php/XDgc7O3coBZOmmjsZr7awe7gKTB3NGNb1oLla4zEjuJ63qp6/jDG3IRAsWTdmmXN
         4tOvStdG+iJ3F1tEcSBPHJDMDrZRcXrvxLlNycK39W82bnvj/JXHebaLNp2vPcDcs8kf
         wX93Cb55ldecEyJSate45TnsmbTEgy6meR3P+obyYBQMghrl+WA8RA2Kw8T0PzodNnhb
         3SMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsTkACCk1D4Sm5DBv78k4QiEqvLbkyY1wqaVrNpARxBs7kE1Q8d5LgzIosh+BxOQZ0uPZB8+ympHgLTg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8epLvo+J/wdN0YVOuI+JSgtwl0kxlRjAKcU+CZ5VyvgvgkkC/
	ZXLaGTywJpK1xfRFCpY7un7uHQPxWZwGqaf4u7Gm8I2Gg/PmjetMZU6j
X-Gm-Gg: AZuq6aJZ3Qc/3EIKlYp3OAG3hcb7S/xZ1XdBMp2pi9sNK1jl6yvKceu8M32J51xG+oQ
	pk4zYbsPI5OTz4pOR0OlAUNCuaYrSiR1MqV5CZDD6YIZugKVmcDR8CYLP1cx+TRSh5Zs2bwAnXn
	8kQPthyz8XkuomiVPcARARrVM7yuPD5sVyGdd2owJe/LNMyX/cY+mxqi1vK9v0DJFcyHcRt9pvO
	mFQmN5aeA+X5CXOiJ2O296Fz+dgS8+gtCckvpJY9VEFdV+v4clY1RJKTnpHfyhw77ZCTTfZj1gQ
	P0teGD6vYc6uSoFv++ImZgwCP94oVKHcBkAsc+FoGECinkoZkVLKCbsZGfujlBVrtWsTE8cy9K9
	9Op76lH6WQJ4DtnFaOpsDufkj2kkQYqcacrFN3b2TMPVo8+6gQLfuhcW3J5EcxaRQtfuMJadpVh
	OQENXYeYQX/cPwPjfZ1oRuRl30i6DDBdOBniozADlk3aY=
X-Received: by 2002:a05:6a00:3d4e:b0:808:434f:ba80 with SMTP id d2e1a72fcca58-823aa6ef828mr10305790b3a.3.1770061624631;
        Mon, 02 Feb 2026 11:47:04 -0800 (PST)
Received: from FAIZEL-KB.. ([2001:569:5999:dc00:af0:4465:b482:1e01])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82379b1bc68sm16667416b3a.2.2026.02.02.11.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 11:47:04 -0800 (PST)
From: Faizel K B <faizel.kb@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	libcamera-devel@lists.libcamera.org,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH v2 1/3] media: vimc: sensor: Move vimc_sensor_device to common header
Date: Mon,  2 Feb 2026 11:46:43 -0800
Message-ID: <20260202194645.1287757-2-faizel.kb@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260202194645.1287757-1-faizel.kb@gmail.com>
References: <20260202194645.1287757-1-faizel.kb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-52059-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,lists.libcamera.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[faizelkb@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B119DD0C68
X-Rspamd-Action: no action

Move the vimc_sensor_device structure from vimc-sensor.c to
vimc-common.h to make it accessible to the vimc-streamer component.

Signed-off-by: Faizel K B <faizel.kb@gmail.com>
---
 drivers/media/test-drivers/vimc/vimc-common.h | 28 +++++++++++++++++++
 drivers/media/test-drivers/vimc/vimc-sensor.c | 26 -----------------
 2 files changed, 28 insertions(+), 26 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
index 7a45a2117748..35789add6b4a 100644
--- a/drivers/media/test-drivers/vimc/vimc-common.h
+++ b/drivers/media/test-drivers/vimc/vimc-common.h
@@ -12,6 +12,8 @@
 #include <linux/slab.h>
 #include <media/media-device.h>
 #include <media/v4l2-device.h>
+#include <media/tpg/v4l2-tpg.h>
+#include <media/v4l2-ctrls.h>
 
 #define VIMC_PDEV_NAME "vimc"
 
@@ -159,6 +161,32 @@ struct vimc_ent_config {
 	const struct vimc_ent_type *type;
 };
 
+enum vimc_sensor_osd_mode {
+	VIMC_SENSOR_OSD_SHOW_ALL = 0,
+	VIMC_SENSOR_OSD_SHOW_COUNTERS = 1,
+	VIMC_SENSOR_OSD_SHOW_NONE = 2
+};
+
+struct vimc_sensor_device {
+	struct vimc_ent_device ved;
+	struct v4l2_subdev sd;
+	struct tpg_data tpg;
+	struct v4l2_ctrl_handler hdl;
+	struct media_pad pad;
+
+	u8 *frame;
+
+	/*
+	 * Virtual "hardware" configuration, filled when the stream starts or
+	 * when controls are set.
+	 */
+	struct {
+		struct v4l2_area size;
+		enum vimc_sensor_osd_mode osd_value;
+		u64 start_stream_ts;
+	} hw;
+};
+
 /**
  * vimc_is_source - returns true if the entity has only source pads
  *
diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
index 027767777763..2b07dc1f1278 100644
--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
@@ -14,32 +14,6 @@
 
 #include "vimc-common.h"
 
-enum vimc_sensor_osd_mode {
-	VIMC_SENSOR_OSD_SHOW_ALL = 0,
-	VIMC_SENSOR_OSD_SHOW_COUNTERS = 1,
-	VIMC_SENSOR_OSD_SHOW_NONE = 2
-};
-
-struct vimc_sensor_device {
-	struct vimc_ent_device ved;
-	struct v4l2_subdev sd;
-	struct tpg_data tpg;
-	struct v4l2_ctrl_handler hdl;
-	struct media_pad pad;
-
-	u8 *frame;
-
-	/*
-	 * Virtual "hardware" configuration, filled when the stream starts or
-	 * when controls are set.
-	 */
-	struct {
-		struct v4l2_area size;
-		enum vimc_sensor_osd_mode osd_value;
-		u64 start_stream_ts;
-	} hw;
-};
-
 static const struct v4l2_mbus_framefmt fmt_default = {
 	.width = 640,
 	.height = 480,
-- 
2.43.0


