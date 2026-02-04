Return-Path: <linux-media+bounces-52217-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIa7Bjyug2lOswMAu9opvQ
	(envelope-from <linux-media+bounces-52217-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 21:38:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEC5EC802
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 21:38:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 00D0330046B7
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 20:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067BF436353;
	Wed,  4 Feb 2026 20:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E77xcGs/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B63C27B4FA
	for <linux-media@vger.kernel.org>; Wed,  4 Feb 2026 20:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770237494; cv=none; b=PWMTfQgUEMxxWhThOyHD3Rtq+6eEhTEIBHhA0c9ajb9UhklChLreCeMUocRn9x4+cAtjtWmpxDekE6puVVaKBwuByhnmLUdfuM/C9tpI9SFZYVniQWItfjX+u9kLrjSSnv1h1XUVX/BLaqgbUrYuaSmfXkgUKvDDxvHTs/AV65Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770237494; c=relaxed/simple;
	bh=zM2jjtHMPs4+8aplZN0ABHRV7dP8Eiz5rvTqssZiL54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kGVv0RUnIr0QT4v0x8siPvc1YY1VAUnZn4CV/ETY7i96J/1Hv1qK00C6Zko/2DpuXTYaOGzIb0EI3ETLkvzltUh1m7OAxho9cuoIdAJTfD10s2aoSVszKk8UDp9V4ojCO0IETAjpl8V6v+P4I4uWl/1Dj/RefGLUsVKqZq+gr4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E77xcGs/; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29f2d829667so404885ad.0
        for <linux-media@vger.kernel.org>; Wed, 04 Feb 2026 12:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770237494; x=1770842294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvVwdLZlh8MPfXBeT9fb7vVP3darfYnE88ZGrjLridM=;
        b=E77xcGs/z40HFfzYu1vMCZOOBXB0x1vzwjJucIcg5ddkBlAIK0fK+qqBDd1zcOoalB
         n4tXDX8NJbhvtmp8bRsOl7G3pc741lfn3CkGlgKk+9uPsFTh7qfX1ghdFnMh7fB915Uh
         MV+nJ402VzDARpw5BQvWW7GSjMDj0iVWcuAeOywwmSl4yQkzmpBSjRk9i4ne+8wAI0Mb
         WD+wCbgBi6QHvCjB436ucphrj54zRz9hmPkY7veI6NiRcECbgrGxe9/WPpvdvNyDL8Tm
         /7OTIL9OKNR+hvET03qKPp2363gQ3ELvDtlh5nbEd9OF3gmSGp425aH7mPqNa4JMNz8H
         4kAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770237494; x=1770842294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PvVwdLZlh8MPfXBeT9fb7vVP3darfYnE88ZGrjLridM=;
        b=h050EwYWo/lHSV2CUoW/bVo6u2jX6DPJ3cIJJKWRaJKiOH4ovIhOId6blFw0XT/r8n
         mIYW36s3Bz0sh305PplVeJ+KnNznAPvrlHprRo3JHNuPyRr4v8tNpBhkUIBuex0VmcBf
         H9OP5L3+olNsjhhgkRotWNmJkHaN+I/9BtgkBlE0N7gcqGQRbLQI8OEccM/nsdXDh6b0
         5kUDP8Atl/+xGM3lZ+MaLVWCByYlCc7zbkocY2Y/GFC10HLIKlr5fOthcbbvDDQ1BwdP
         Pv9Jh9TllPEK9c7lIidRimM34v9ReXloyoUz1SEh7PmYA3y1Hq75OH+OUmRmB880J8eW
         M3VA==
X-Forwarded-Encrypted: i=1; AJvYcCWvSEbQlgkBGCCKwbDaBR9ij2/gziTvptbgqL+PRzvPq9S6MLHO5xA3v04bHwp5UsNwD2l2YGl+IZshfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxCY56nURp4486/E+a94BW5KFIQhtCdEwXNj/HR/leXOJnQQ7F
	/jJXqKLF+iXCfnFNdpENSyz67G8icmY6e1DSaOUHeeXlyKCHEvSjOmwa
X-Gm-Gg: AZuq6aKv23ao4Usrwff6Wp1AZbTD6Mh/xKRkm5RLv5XsXkjGEMGfUm9aowMPI8o/LbS
	6ZwcoyNXH161LbnAd1/is8p21xH6xSlpYcVkvvQQNWTn5GxB5gGOqEAOWu2Cma/uokOaUx+FW7/
	JSVBGGcTE4GIw4ZMnjtJCZ9U2rrCqViyivP+uaz4Si2bHub97vZUz+VYZJYRWpsbvIHe773oyAC
	260CDUJLItM56bNaord2HMr3v55xNUwMmIU+qv06lg9t68lRaSB+cZEkbPtf3gb+XoE+W1gjdLS
	11NjBBavrVvJQsv5/1sjFGlv/dAHU51Qpum8Xq76tloa66gKo4mbz9rWIsXZ7WqYAgP3na0SWi/
	SskNCzcwTjSJkqhnmQ03xPl4DHlxl09QtEFtiIJVSnHrse2XY6UnfNObutofsZYw1M8uWlm/b4x
	tzktJ94ZydV6uMFhoWN7KjwSZ9/raTBdq1QP/ca/mBnnrk
X-Received: by 2002:a17:902:c411:b0:2a0:f0c7:9998 with SMTP id d9443c01a7336-2a933fb7ed4mr30227995ad.6.1770237493772;
        Wed, 04 Feb 2026 12:38:13 -0800 (PST)
Received: from FAIZEL-KB.. ([2001:569:5999:dc00:876b:c389:85e5:7957])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a933974884sm31136955ad.83.2026.02.04.12.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 12:38:13 -0800 (PST)
From: Faizel K B <faizel.kb@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	libcamera-devel@lists.libcamera.org,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH v3 3/3] media: vimc: streamer: Apply sensor frame rate in streamer thread
Date: Wed,  4 Feb 2026 12:37:26 -0800
Message-ID: <20260204203726.1820226-4-faizel.kb@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-52217-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 2CEC5EC802
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


