Return-Path: <linux-media+bounces-62712-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPl0MwodFGoGJwcAu9opvQ
	(envelope-from <linux-media+bounces-62712-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 11:57:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 321385C8DA2
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 11:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04FA2304D5EF
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 09:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7323E8330;
	Mon, 25 May 2026 09:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gy4iUtU8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21B53E2AA3
	for <linux-media@vger.kernel.org>; Mon, 25 May 2026 09:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779702795; cv=none; b=BvT0ESPqTiQsmRjlClnHesJXdU5hhfQyHRSQ2fRYDiciEtxC1OWaMPOYPJzLBOEQC0URXwNMSoKw0OmnwxrlkoBMyDhpuZKkGrBy5Fv43bUf9P49ZRM17/wQwns/Pd08YzYfxv1YeusNa+ljXsdwoswwVSOiVrP9YIAR6cvBWWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779702795; c=relaxed/simple;
	bh=Mdlv4jporUZmlLf4lx7rproUzpgtFGaAxxp4Y+lMBaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CH5QKwEzM0ofiIgOImN27mG0Iyll1W1Pg3xS2HTfI3FuitT2Db0UXKBHMWsNygjWWD2gNjZydi/wX/rqZjC0tIxypm5qz1VxRWAMqsIHj9kXG54toyiUx7T4A3G5VAw9uYUobo8XIrThfRcgZFbV69PjmnDx26FDDm4VBohKGto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gy4iUtU8; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2b9fcf7c91bso107096455ad.0
        for <linux-media@vger.kernel.org>; Mon, 25 May 2026 02:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779702794; x=1780307594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ez92gLCG1+yJIQjG46e8Hvs9v1kkCpJ4jicfjTVkky4=;
        b=Gy4iUtU8TgUq2ggD09CiuB+YALvZU6JbW/+IrnNzx4xBwvlTjjrBzVO7TOlUM0Bpzr
         PspLApYpWnNM4CfFYygh/smiomrCR6ExBcZ8vkr9t+YWr+dj1zq/o6L0h7gStgTcwOth
         caZ/OM74edl3el9wzXnpUexsgGWeCDkW0toGmZP3z6kKPGbA4E+ViF5CFmDttVIhfoIi
         KNHbbsZXyO2P9JKgOpUtlEoJKxvde02GKIdu0tXfX4ev3db2/FZhpauNoncYVSk6tM2l
         w7Cyf3pAzyCbz+njgpy1zLOs7m0BxGVe2Vm4r0m77ndvSSBC26A6m3lipwtlLZlB5Yuk
         076Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779702794; x=1780307594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ez92gLCG1+yJIQjG46e8Hvs9v1kkCpJ4jicfjTVkky4=;
        b=kS/BkzMwokTs3vhrEdIf9ncIJ86HNyC9rurxyAlcpsli/WAIw9cV1C/gznfkxXW7SP
         2X+16FE2exT8zM5h1FgGfj4siXc+tBxD+Ieanwi835Oxyi//EeBcypZ8n66odcIoXzw9
         +pGyWg317HmBvWtaq32fR3jhYITX0ih5ZVjjBDjFCn90PhzxI7GvYODo8XT5U/HNj2oC
         lQVUfHDapFQBhVAEdJMl7zh0pyGSBy/Qofw6UvsMUUoPo3lIF52foOFZN4vvAzaMaiib
         cQy+1gr4sOhrMKNhRzwYBuynSlvUneCbZkq/0DakJ6EjNszlYveA08RvdGx5yZ6Zf4d2
         +6FA==
X-Forwarded-Encrypted: i=1; AFNElJ+o/5Y3jwbCG/xBYYvwQdKtlmOEkIxYm5qkggdnKZMvUdGhQEeL+adGRX8+zUwudLOMeGW66ZKsFWqPGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/7vqsBJUvmyOJIsuSkQUl4Ht6BlMu85SBGp7JKEuZ4NB+OBT2
	MmGQIdImlXecX9vi2sTt6Jgn9lIzIfuAOB+4e90alXakWMx84VCXgy+G
X-Gm-Gg: Acq92OFL6dHKsC0+wwqI57oXwt/Zyop6Taef6yNyqXtFeiSPjN2rkU148c3m/iPIxOx
	ojfgS+Ama758gFDE4nAODbrNrbV9pfFH/nuOU+DOVKEid/SQNOEYUE4BORGVgsnA262q4Xl6jfw
	BkseG0LB89GaiATrKeOwjGBtv3+UuOVTmbuZKaI6gVojGuLjuAzsjc+prJ8Kvx0WIOs3/sXzle3
	m4fkU/gUY09fASmHBU9HUWnnTVzkAINq/23YMEBO/QH3yL7oZhwC4TlCI7wle3lLq0gpO2bj3U/
	+OL6Ar2/mG48D4afuBYcHU8o1VWJsBkUAlphGdHFS7Vu84q5bB3G706X4BS3B+bmvgABWsOmrBa
	gGRvbrxxH2a8vHWGBoTgQLqiIDFi9ZS5cmTlYZPcyO7IKQy8NAsb/NWmaR3jKWOvgMqASzpOXfh
	MFyOJd+5fZo5a/AGEVTFYG0b5bcLQNGYfYjO+D48oOpw==
X-Received: by 2002:a17:902:e548:b0:2ba:78a6:7dec with SMTP id d9443c01a7336-2beb05c07aemr160215525ad.13.1779702794227;
        Mon, 25 May 2026 02:53:14 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2cd6sm92533615ad.52.2026.05.25.02.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:53:13 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v5 5/6] media: meson: vdec: Isolate error path buffer flush to the active queue
Date: Mon, 25 May 2026 15:21:53 +0530
Message-ID: <20260525095216.12078-6-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260525095216.12078-1-linux.amoon@gmail.com>
References: <20260525095216.12078-1-linux.amoon@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62712-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,ndufresne.ca,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,linuxfoundation.org,baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 321385C8DA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When vdec_start_streaming() fails, the error path clears buffers from both
the source and destination queues unconditionally. If one queue was already
streaming successfully from a prior invocation, flushing its buffers behind
its back leaves videobuf2 deadlocked waiting for completions.

Fix this by only sweeping buffers from the specific queue type container
that failed to initialize.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v5:
This is a pre-existing issue, but will returning buffers for both queues upon
a single-queue failure orphan active queue buffers?

If the CAPTURE queue was successfully started in a previous call, returning
its buffers puts them back into the vb2 queued list while the driver
discards its references. Because the CAPTURE queue remains active,
userspace calling DQBUF will hang indefinitely waiting for frames that
the driver will never process.
---
 drivers/staging/media/meson/vdec/vdec.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index b31bf08af88e..925537bd4d0b 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -372,15 +372,15 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	dma_free_coherent(sess->core->dev, sess->vififo_size,
 			  sess->vififo_vaddr, sess->vififo_paddr);
 bufs_done:
-	while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
-		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
-	while ((buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
-		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
-
-	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		sess->streamon_out = 0;
-	else
+		while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
+			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
+	} else {
 		sess->streamon_cap = 0;
+		while ((buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
+			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
+	}
 
 	return ret;
 }
-- 
2.50.1


