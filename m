Return-Path: <linux-media+bounces-55558-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNJFNK1Js2n4UAAAu9opvQ
	(envelope-from <linux-media+bounces-55558-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 00:18:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4247427B3B4
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 00:18:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2468F3151E6E
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 23:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14A0F3B3BF0;
	Thu, 12 Mar 2026 23:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXx8BKvj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7692539DBC4
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 23:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773357466; cv=none; b=VNnfpSPab4P9dejO1bW61l+aoxwXE+Z8Z2FXGjgnH4cTDx2aXEfgBYYWAKY8yX55/eTiJwjuvVK7TV6gZMwMOo38ijzQNYyGQ/FDB5kThpw7P0pxzMFBRky6PdNUf+dmBLiuaPgJvaeyY4NqvqX33ee0vzSAqYhIB1E3oG4Ul74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773357466; c=relaxed/simple;
	bh=zM2jjtHMPs4+8aplZN0ABHRV7dP8Eiz5rvTqssZiL54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jmhG+fCiNp2+EtYryXwDYAxTbpN4zuqV4DikNzcL2iUQbfKRINNYsvOVm6+hS8qsjcsMK7CzrF7jtNVzsdMrqMa5rBeFPOQqzcLfBv+X5q5UqMo29aDApJDKWG2ds0A7llmitEXCCUzklOs2PoRUg5DW8V74xhLEcylm2leFm3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EXx8BKvj; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ad2b375e58so1350075ad.3
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 16:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773357465; x=1773962265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvVwdLZlh8MPfXBeT9fb7vVP3darfYnE88ZGrjLridM=;
        b=EXx8BKvj4s+e6luUWmGC7OgdfTebr165WnxNXOS1nGPAa9tWqGpY1Aujce20+dqeyR
         +Zx44qHoky1q+IufhnMKLWqnmCQ6SEXKk0HNzKIpKpfLH0KaIXMn8FFg7PnWYZQ8q716
         PXqR1Yh0c4pEM2AYgggQtK7q5rDv/uUQZkhivFt01DmDOQLpsTDFb50YWpI4vZ/8KmyU
         ukukLLVyLUYaXKw+l9DQioFRJkANTb51xoaG/SoE1X2FJUVR2I5wsVc8tqs855/QYfJC
         70z2/fgZ7PrcoRlEyN3V1SA86jDd6sV23zS/bwJBhYgtSaRoEQkM7+b9yUA3uAqjalP6
         daJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773357465; x=1773962265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PvVwdLZlh8MPfXBeT9fb7vVP3darfYnE88ZGrjLridM=;
        b=YkC1jLVzJzTwc0x95hwG0CTs+thJ7DyEGJU7gpIULwO5aHhJSDMT4jPpoR2niVjK1t
         um9Kpn5pcOhNJ2Rwy8g/zcHaOJ3xyBCVJvL4sXxB5ACQmfX6jloOoSPx+z0WKP4m3Wd3
         ic2h1bjBTJy6qZbvqZNzBF6MosCgaF9utHZBQCVBqYF6Df4pdzV7ASaIVvmHNoa9/HwW
         MrDyRsBSsvqoBeMO+x7Fv0PrBM6FaQmevOnccDA5Vzs5N1U8kaz7fZHJMYUggnp/Kvuk
         67QE53wIRJ0Vfi9TAM+M16C2Z2tpEcGN6kEW7m3HWJ/OgXFXEItUEojgyw61p7id7yeB
         UcXA==
X-Forwarded-Encrypted: i=1; AJvYcCXd68VQvnvr55PhsAR50PY3GKAFQQ5adi1zRXozfGHdyWSLYrco5WokazgJCl6ejG4WZje2zEXnxtbyuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQPq/0mBgygMOyjdTeRvt//oR22ulxJ3+XC0R7lj3ntRhoOagb
	DgZVdrxTSiOCp/JLT0h2GIsdc8QBmwiP+lpJPtK6ZXmhYjxzs14um+4B
X-Gm-Gg: ATEYQzwtCw/bR4krRHQIzxk4qdihtThlBY+dmPIMcAk080Dm0OW45FGGYE+Z+gU0Los
	kTVAQueqZruMARzrq6A+Q2WQ2vTUsZA5VF7HlJAqldA3RdCKYM5JldZNggTiqiuLNxR7gJP+610
	apAEWk2Ptxi442EMAzO/Tq6aHYOG/VqIAkBw1ukGsBlChD3fo3YP4+Mir4mumqxRyY51FU14R7q
	0Flv75KWpiLet3agob0N0FUNRt7atNxehorxC2RmkrGCD6Ed8qfkUK3NczGDESR6GBe5gmZzCbr
	cXyrxqiVwPtycejYzrH1bnYl6Q34EdYo9zlZBwVsmigR8tqDxwyeayeb/Hn/pKD+3bphmUIwdDn
	KcNCP3/NiDprC4c+qgy2sRpc44XOGRFAYQU9+KldhH41GlerZqx3Hui/UYmgYoHmGNYOjmogthO
	eK0oJRkiEDVliadVgJt+4DMQrkZzvYY3KJXucMhroxz9oXKJh0dgsLseU3u960MkwMPw==
X-Received: by 2002:a17:902:e550:b0:2ae:7ed6:7d19 with SMTP id d9443c01a7336-2aecaad2c12mr6749555ad.4.1773357464899;
        Thu, 12 Mar 2026 16:17:44 -0700 (PDT)
Received: from FAIZEL-KB.. ([2001:569:5b64:e100:3685:315:53bf:61fc])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2aece81cde8sm619395ad.70.2026.03.12.16.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 16:17:44 -0700 (PDT)
From: Faizel K B <faizel.kb@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	libcamera-devel@lists.libcamera.org,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH RESEND v3 3/3] media: vimc: streamer: Apply sensor frame rate in streamer thread
Date: Thu, 12 Mar 2026 16:16:16 -0700
Message-ID: <20260312231616.3590215-4-faizel.kb@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-55558-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 4247427B3B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use the sensor's pre-calculated jiffies value to add appropriate
delay between frames according to the configured timing value.
The actual frame rate  will vary depending on processing delays in
other media pipeline components.

Tested using yavta frame rate display with QCIF resolution:
yavta <video-node> --capture=<no_of_frames>

Signed-off-by: Faizel K B <faizel.kb@gmail.com>
---
 .../media/test-drivers/vimc/vimc-streamer.c   | 33 +++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-streamer.c b/drivers/media/test-drivers/vimc/vimc-streamer.c
index 15d863f97cbf..3ebf5798fa3d 100644
--- a/drivers/media/test-drivers/vimc/vimc-streamer.c
+++ b/drivers/media/test-drivers/vimc/vimc-streamer.c
@@ -139,6 +139,29 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
 	return -EINVAL;
 }
 
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
 /**
  * vimc_streamer_thread - Process frames through the pipeline
  *
@@ -154,25 +177,31 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
 static int vimc_streamer_thread(void *data)
 {
 	struct vimc_stream *stream = data;
+	struct vimc_sensor_device *vsensor;
 	u8 *frame = NULL;
 	int i;
+	unsigned long fps_jiffies;
+	const unsigned long default_jiffies = HZ / 30;
 
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


