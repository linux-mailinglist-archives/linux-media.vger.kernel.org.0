Return-Path: <linux-media+bounces-52061-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDNmIQkBgWlyDgMAu9opvQ
	(envelope-from <linux-media+bounces-52061-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 20:54:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED5DD0D88
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 20:54:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BE1253069A5D
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 19:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C360F385531;
	Mon,  2 Feb 2026 19:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfSrN6o7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78B230C35E
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 19:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770061633; cv=none; b=A7lqSn87Aigk3x20quz0rYp2xjfcB5C/qbTYmbHrWEyoX9hR6StNse/NMociah/O3Bi2MnNJaC/WTTHth+gaGccDzZEM1913Mm6PmS2r1d+yvyGQyRNoBBddGf7xdWNn8C0jEWy9sw/tnhPc3nv1DkOgcUM0Vj6XF7czccv+OxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770061633; c=relaxed/simple;
	bh=zM2jjtHMPs4+8aplZN0ABHRV7dP8Eiz5rvTqssZiL54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eArJYBlKbuFKPHHmAXOstWTl8XCK3yu8YhPpTFzB3izTI0qKOE3/w9QkBEPYAdV9OI/NOfSI8X05ZIavHasS1HUjY27lLMjbZTrWtHuYquOR2jogrK+3Qe7v5GtFZMniv2hVaxi50WQ3Sl6+KRYp1teE4TxoqDnJCU5g7A75YBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SfSrN6o7; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8230c8aac41so279215b3a.2
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 11:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770061631; x=1770666431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvVwdLZlh8MPfXBeT9fb7vVP3darfYnE88ZGrjLridM=;
        b=SfSrN6o7qbuTYD1ZkcgjNb2EGLgrf4EPLq9BhWIYSESqrEBTdHKl5hlgJFxBtwXYYc
         Da7SmSkRbcqcXdHzGj6Lq4PHIlsepjSVpbkuMRDRRWanOLGzc93rJ/uCxmvxKDQEQFTf
         fEmYBzZg1gk13AlC/rih7aC8tiwQmRB1CLFTaloi8LSehGtP8aS374NfK/Dc2hCgpxyg
         4TKamaYXYr3Gcu+aAbfNlAqYZVjKIxonawDrTQYuLZcKpVAnt9JaXnL3FaPdjO/KFNf4
         KOduVW993T7sbjn+7uEgC4nef1yhGajiOnFHJMzRgGbMvqzoRhQbKFUgwKsvasoigaLa
         2lvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770061631; x=1770666431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PvVwdLZlh8MPfXBeT9fb7vVP3darfYnE88ZGrjLridM=;
        b=twaZTFgE3Y8YNO0cD9a2pexSXwsvF2PtEIKIBZGJOwW8pb5xlRisNKax8pclmfT34t
         xcBPJOV2/aKEgRfXZR/NBM9ifwpTk8QQYFlsGDTl3eV6SBT73bLXcTZ/85/x+B6PTDlA
         64RGpBcuHjznJYeeHF64n0HMQNu3u/nJRNPf132kh6vRXFuT9ysYD+VOd/+J3/1culs/
         9hCS2uJqzEfTny1VI2xtye6QRf8wo4VFEHuluVp1qjlAVtRgtjdn6PTmPAO5WXhyhUdZ
         MaJBt2m3P5T6ANuo3CmxJmWlA59T2Js0ylthvrsg3gj4U7n/znZUflcyv2gkyiALnLrt
         zK2w==
X-Forwarded-Encrypted: i=1; AJvYcCVffonZgexHbU7TGzBeYPfzyRzQ5yMnOhV3YZ46ViX5hVymE118E6r8DGbZQJka+4APUIL2St67roM4Dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUmuDZq2HdhO+pNvTFS2W4T4xHOUL2UBX30Cws67Of5aSdJo0r
	DzTlLQk6IfpVhDGUfePDeb6coPzYzalJ4aNI1UZdHOszpC+6rUoPzLtc
X-Gm-Gg: AZuq6aKgHjnt5awkEnKOaWzmvVc8JcdGLoRVluJ8sOxYWr4YK940HPhNGqCbQciExLl
	4J9Vq2ZYBzfSZEIK3QKSA4TQwhImT9R9+v1aqvkiRh8z5z9/b2f+90UOOqnxuIR/rHrW5IyeN+i
	1KYTR47SRgaidQJhEJhbaRBesM379XWt6VqHb2HOZA0f/ffo3HA4fR5mu8X9cJPzQCE8PQgIjZl
	oWKr+sLUt3jZnbBi2aFQTaJn4Vin2KFfsQaQ8gOZ2xAaQvoil5ESrMSO5G2J2T3QYyoJgx7RCRX
	it9IpOpDQbptbmbHo2mFxxhWmEYWvjcPWsRoJ+bJhwKwxrDJDUc114YRKirbNJS7LsildbOZ3eq
	gi9a5c+Aq3HecXpOja+tEcglDhgrbwgDtK7W+SBCsEhPhxyy80aCZrQIuAV1SCPgJWQaFFFwndE
	ThGWEgqJ2xt8uryYMsxZ1RSPrjbKoTJEh6kGnCq9A2gD4=
X-Received: by 2002:a05:6a00:12d0:b0:81e:74a6:542d with SMTP id d2e1a72fcca58-823ab74b844mr7612034b3a.5.1770061631287;
        Mon, 02 Feb 2026 11:47:11 -0800 (PST)
Received: from FAIZEL-KB.. ([2001:569:5999:dc00:af0:4465:b482:1e01])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82379b1bc68sm16667416b3a.2.2026.02.02.11.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 11:47:10 -0800 (PST)
From: Faizel K B <faizel.kb@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	libcamera-devel@lists.libcamera.org,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH v2 3/3] media: vimc: streamer: Apply sensor frame rate in streamer thread
Date: Mon,  2 Feb 2026 11:46:45 -0800
Message-ID: <20260202194645.1287757-4-faizel.kb@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-52061-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9ED5DD0D88
X-Rspamd-Action: no action

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


