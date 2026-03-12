Return-Path: <linux-media+bounces-55556-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKOMKqBJs2kJUQAAu9opvQ
	(envelope-from <linux-media+bounces-55556-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 00:17:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA6C27B3A6
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 00:17:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 951FE3172492
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 23:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F37823A545E;
	Thu, 12 Mar 2026 23:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hnFLrtlm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F86330B0B
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 23:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773357452; cv=none; b=KkNt6wWSvYlTDj5H8LE3/lT0RGdpJT/d7nPdv5IeVr1GJ6f/IlZs02zLfG4cOpITtOaKdamMlPfYbe0u+sFRiBRcY9deJkXgpNCc9DH9ZXgRD4ERXLH1OFBv01DDD2RXr8qHsq4Ncq4fvcVVpLJuETdmFknXTOfu6IH4tLI0dWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773357452; c=relaxed/simple;
	bh=+NYJq1KAApnUYlllIiS8Ky3neikMCujlFkU83AcCD18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dkkx+Awnqgg3zcRN7IuJiBpM2Md/4NedOgPNml11DxzQDl2dOtM3EzDehjv61bsnjSyfg1sONUiDozwldNrG53gmPRGH3XigsMRyNcKbRRbHoEhW9lK+o/IJLb/OCQOlcf6S8cW2XsaE0YNoc2H51iw8ZQvjNK+Nw4fUqeL7psg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hnFLrtlm; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-359bc103812so109577a91.2
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 16:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773357451; x=1773962251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Crj5/i72nEqbooeaF7oZTjBVdiKVVLm5IQ4dcnP9qgM=;
        b=hnFLrtlm2tdrTNJaxPc7MKyfDzKJ3ZQmlX2H++AJeNDn80dZflmiUrF8HMp0+tpPHK
         AQEJ+p8leI6RM56QkiFm5YxvApGPJMdS6xLqhCzI0w8275CbM0MYS3gu0VS3JYSf5vTq
         54o9daoqa4Zt2Zy0173udRyeN3ZOeuQmilmq0UFbdKryFxFIlMQhY81AgyUuNOJuRAnj
         D37nXObCOL64qNNV8rRaTj4kYqUAyZeAkhkAnCaXMYXu8sAqTXUs2SFpDCuYiWj8Tlj0
         kdhcdMTSU+LONHTLVqNqBXuQ7hhNbrLcJDAIcaaFT6PmuPSoqLUnhnaCDktOeSWKkvW+
         rXJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773357451; x=1773962251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Crj5/i72nEqbooeaF7oZTjBVdiKVVLm5IQ4dcnP9qgM=;
        b=aAgFYZ1aJdURDN63D7df+N904qUas2VAGUIeqvkjZPkLrAEc6qU57sORUQGeM+0h1j
         KOqNXrHGPqDnUBvy4jO7MsA/kHSo4sBR6mYlpiKtzm+PAzfft2vukG7Uum13UrzmJkXr
         Bpg1Pnrdct8Ig9PyRLiy9sUAcPpskEIvCaFt6OmH+kb8xUsV8odfZC6KB7a/pWdywp2K
         XhHbSMWlIz+6UlpRgEz4ImdUYtjmeRUfdI45lLdDkkVsWMtru3zEm++OepWQAtiHJMnp
         7IZs6JicPGlqJ2AgrMKsxaNhu9Qm+rJHgpcLvm0imOYLQveKJ0I52QGkW3HDEdKGd6tt
         jrjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyORrJsldz1gNn1yi/Aye8HdURUf0NgifxrR4WCozIScfxVynMn6FVKTYckcGe0Gb1/h2zYts0xDWR0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcX3XJzW4wPTFwl6bxwXSXL66JH8t30o+Ze8gR4Osn4kkhXFmB
	kuK2C3R5/pTOKpaxkMV3U4akM08DFe1UFnTwf3CzxrMtzosSZh9Gi2XT
X-Gm-Gg: ATEYQzwa1g7WRevm6vkQ7IV7z0m5e29l/1YRhXy6zW0hKRmY8K4z1KPeGiBkoihCAqY
	TM9URi0Hu1W1Ri8MYwQ4SCf2AAhp85/RQSO5JSfPkjHB7GeHctoL7bgLzX5q9AXbnaPWBmbqer1
	AmQ5xG4uyw8yyJ3l0o8QFNHmKPHJqagnJ6iI2BLG7oe9+OWvzGN051Xw9CP0P90QNRkAAX0rqw5
	OqYukVTdXU5PgdDwIwPKZPag305p2bxKjt5fLNXxZiMr2hsAjoHKUpE/9CH4vzp5oskgdowwTKL
	PfXWFLshLFXl05I7UW/W4vGGpxWtciA0C53CVt0QJNDGgmHHnU/9cElAXpMdCxOErTido6oVEnP
	MQ8UwEgE+dk/TrdjSnpSx6ZDd1GZ2Ex3M3RFTlkTvZxmJLxZ71wzIJGn4T7Zi85/bK1irF6VkkK
	YLAppDidnFg/2KGJ4cdV5c2gNSAibQ2uojfCxZeC+uqCgpDXto8VYebRo=
X-Received: by 2002:a17:902:f546:b0:2ae:4f95:df56 with SMTP id d9443c01a7336-2aecaa3eb84mr7530795ad.3.1773357450767;
        Thu, 12 Mar 2026 16:17:30 -0700 (PDT)
Received: from FAIZEL-KB.. ([2001:569:5b64:e100:3685:315:53bf:61fc])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2aece81cde8sm619395ad.70.2026.03.12.16.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 16:17:30 -0700 (PDT)
From: Faizel K B <faizel.kb@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	libcamera-devel@lists.libcamera.org,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH RESEND v3 1/3] media: vimc: sensor: Move vimc_sensor_device to common header
Date: Thu, 12 Mar 2026 16:16:14 -0700
Message-ID: <20260312231616.3590215-2-faizel.kb@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312231616.3590215-1-faizel.kb@gmail.com>
References: <20260312231616.3590215-1-faizel.kb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	TAGGED_FROM(0.00)[bounces-55556-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 0FA6C27B3A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 69e714d4f228..4c64cdab8cda 100644
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


