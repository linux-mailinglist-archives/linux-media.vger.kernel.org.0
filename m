Return-Path: <linux-media+bounces-52215-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKsyCzuug2lOswMAu9opvQ
	(envelope-from <linux-media+bounces-52215-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 21:38:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF626EC801
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 21:38:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 320E8301AD11
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 20:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D716436352;
	Wed,  4 Feb 2026 20:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZA1vE1Y6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC44627B4FA
	for <linux-media@vger.kernel.org>; Wed,  4 Feb 2026 20:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770237490; cv=none; b=eBryPFGv1cEqLJEvhrUC/fx8nDyGWbq9SaHJvRJy3h5q5rGn3zjY5sebR7lcRaA5fZSEQJ4pHv0NCg3csQYJ2/iZUaytzQ8wNkwf8zUnGUFKGMnE1yIHtsiPQkd8VIoGDLMij782wx40pS8qwdFtT6bRAFDPbHhX8NmzJrSIzFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770237490; c=relaxed/simple;
	bh=A4QX7qpdZ4pw6/6kLNBSFEv85l8O5Qi78oGZ32/sVuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C6zEIVetd08vKkgDJYJMu9R/mMEdem2mECdGs1fsrCGvfl7A1XXCnq1eEyg2I6xgWBmpi/1vc+p/C1x07lDHHqDzbrEHdV/KsYAbVhSMDuB8KWfrCc0xNxfFcORtYaHkmfwK2T2VVmO+WXmfQPbFaXzMUczci8W+Trn/4PIAyHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZA1vE1Y6; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29f3018dfc3so329655ad.0
        for <linux-media@vger.kernel.org>; Wed, 04 Feb 2026 12:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770237489; x=1770842289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4RAohPMInpYRdZFPRVpri9RKwD42GbQUWynv/gE4tBc=;
        b=ZA1vE1Y6tPl/nHbIsmHiiZcFUUufkJKijwWgw/c09BSnqvRry8W2oVN0ECCiPF1oSD
         ++iKFEDbHbujHcW9cvcQHN4rme09Tg6iwX2sB+RrIrqrPBk4ZiMWEDCS4DrTChkl0kdt
         /TZWbIZ60Z6H7Tr1FHXK7AA3LlV6o07yGedhiLZumUsqox3NA5jYJJUgikFvQui7sJdT
         cqGg63GhUoygPgYrZLyptvFRBIwwaDxlhPDJFLi65klQeTPhkFLtaHHmOBOHeNfpH2eA
         dz9JY8bgheKAFg9cASEHDyPZu0ervmOVdrYBLj+xjOjJFKFuVnI1fG1al3DAW7MHm9DF
         PJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770237489; x=1770842289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4RAohPMInpYRdZFPRVpri9RKwD42GbQUWynv/gE4tBc=;
        b=L/ehAg0oRtLgXd7ooAAv7CqpcvHu61R5CtSGqBYdTF6RsmAHRSppygRAVarI895jVS
         5cZOTEX00YMI485i0SQw9AjGzCeB7LLWHU8vf1CaFc/ZdEmhjPiWbQYpPJ0XVOqoMOgr
         IxBk7wmQ6WbEKn05nghUEbGM/zko9VkKgi8iiUQBvWZQizfpNMALJpZ58jDGagJwZuKZ
         PhI6v/3pyqrRc85erP+wflURodd7Y103Ir1xUtTahvbr1BkFsgSaEKr+R8G8z8MOlEV/
         t0meNMu6E/8g9iZ6n536IdLYhzF7V1cFMCOOL3GPdGCX5L/BSyn0OCm04E/rYjSwMvvw
         h/NA==
X-Forwarded-Encrypted: i=1; AJvYcCUP9TKmpVAs8tUP24YuoAl0lGC8BCwGDXSIthfYM/ZPhyyOlzsbeHKCR25S97DsEWKAai3cD+kK4EYX8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDflwEnIgKkh/0+5Bq6BzDru4/+WD2J7N+FniULHlAM6poJyUH
	PVd53MDFPkAq5/XljvkiMElzfdZ5q5FfrP2Pbhvp+q80yDTdGH8v4XcD
X-Gm-Gg: AZuq6aI/SyfnRlIaTP6Uj25mlnUvMTn96J/XNDk1GQs3JP4NttkO50ZizonSoKcQdCU
	1NsoSWtQK+YeS5B28ilhohKvQr2o2vzarqwyMG8ZRtahPxSW6exS0CFRcxESl4N8byfRVn5psSJ
	JLt+HObNjZSKodQP2pEG5SK6xGKaLz1s0FgAWSUzi50H/DOWY2Ux3bjBVpbd79VhtlxZ4YfliD2
	NszU7aE5xH56Pjq9piSezBH4By9WhMzG6pfRP4BhWNyKYvdNbrMiunwXodf+EvsHSb/+1jQeUBv
	aRM7iIJ8sICBOTiePc1wWPRlQhEicTIUvTkdXgu/8zK0ZoIZet/Gtx0jLaPksMKh25oWKMkfg7F
	rqQolnfpj7U72Dyjdpj15rfC5S/88GO4GN2sVe+g5aKMQEZnfUmYqe19YqRgCe+mBX5YBVF1LL7
	GUcX1YsaedEl5ZqTOTthAGFcNvLPP88J/gEVU6TVcVQgHf
X-Received: by 2002:a17:902:e806:b0:2a7:cbe3:a6e3 with SMTP id d9443c01a7336-2a935bd69a2mr25281315ad.2.1770237489266;
        Wed, 04 Feb 2026 12:38:09 -0800 (PST)
Received: from FAIZEL-KB.. ([2001:569:5999:dc00:876b:c389:85e5:7957])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a933974884sm31136955ad.83.2026.02.04.12.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 12:38:08 -0800 (PST)
From: Faizel K B <faizel.kb@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	libcamera-devel@lists.libcamera.org,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH v3 1/3] media: vimc: sensor: Move vimc_sensor_device to common header
Date: Wed,  4 Feb 2026 12:37:24 -0800
Message-ID: <20260204203726.1820226-2-faizel.kb@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204203726.1820226-1-faizel.kb@gmail.com>
References: <20260204203726.1820226-1-faizel.kb@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-52215-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: AF626EC801
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


