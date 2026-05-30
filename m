Return-Path: <linux-media+bounces-63106-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LYqA7WxGmoH7ggAu9opvQ
	(envelope-from <linux-media+bounces-63106-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 11:45:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F408460BF08
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 11:45:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 818F83021B75
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 09:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7227639DBD6;
	Sat, 30 May 2026 09:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RaMrO2ns"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D81388E55
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 09:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780134285; cv=none; b=aIP43bN2Jns1BQr7nRrR4j/s1gt7bTWG1nzP8voFjlLzg9J+O7LX3dirXZBBcjNnvvjFuN819OQGCeTa1h/w+ZkNJdBIcg0/w8aWkDuk+zeJJUIy+vr0yyEnzOb94z4+eSBroRnDecssZyZKoJyxjBsKnp8RR1Su1CzlSyu5vmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780134285; c=relaxed/simple;
	bh=G4dcvjVYZuF9c1fC6zIr8U0LMJapQ16RTisqEjiIVMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n9HH4vD+SH4uO9U4uxb5kel7cPcFEBpLtpbhtct22KLSZjuCrKLgrIuHyas0nTt7NVq17/Bj4vzntVQDYzBN+kCG46bkzFZCeg7wxnrKUD6FBH97LxxGSHpoMS/hCAnTERmn+oMBGcjdc6QvCIM9z0jx6XLmGSqjc1DNEuPVmZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RaMrO2ns; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf02708e8fso19325585ad.2
        for <linux-media@vger.kernel.org>; Sat, 30 May 2026 02:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134283; x=1780739083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Je0r03zFWDk/tHsmcp50GPWfnKiSAfNBSvNM4tTawBM=;
        b=RaMrO2nsu+JcwG39o8p1nRoB4dy1j0JbydQGlqwiVo/cbZc0Jj90rPfoWnr4bhKBK7
         wHhH0dyxS1Z9ydeFyVUQ9KTa3rZHhR414I5rziFu/TTiWdK5ewhrgV1yS9uMpOAbpGCm
         T5sJr3RKypIhq7Ym/pih2WbKv0gYQKsnSCs+Z8qFLkxhvi4wMvOtC41EhEPczbxD3mgg
         JpSNdKxDVLWET8hvZw1B3mB4OS2d3ixgXcgD7WHk+O0g+CaxtkeA11ltuIxoW6Lbxs3X
         kWotwn2iRaeLEi/1VPMnxjLAykM9IBjZjWBkUom0GlGpEZBkTd542+tior/xu45VvHkH
         n71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134283; x=1780739083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Je0r03zFWDk/tHsmcp50GPWfnKiSAfNBSvNM4tTawBM=;
        b=EbrI14XPSf92LWVpO5lDqW81phpyOTlVPely5zJeDfEKa1qMUfGP6vf426yAXMELgl
         BKFuubzWAAan+gtznpDBFiMNeXSExxE8uHbktESMqWx0PCK3C4J9scO6+z5ctec9lLIa
         pZ5YfmatMgo+I+H9hkenHuDQsAPvhmwL8uTHwJsdPnEmvF2zt9ScT2PiqMF30IX5BYLE
         qnr7wUl1cvCJjhzlQfq3GMZYo7V3MWF9TrhUwCSvqbvAcq4jLibowVaHJoz2qsgk74JL
         7cMsyaS4M1p1fysvsxLf+knbcE/6BEuARzunOzfW3YyG4wwVVJHxR5WfqSHeLZU1jLsJ
         f1MA==
X-Forwarded-Encrypted: i=1; AFNElJ9t6nccC6yJZsZTB9py4L7Hq8P97fkN+OHzyrEpjQgL3xmOw6g4KUBKmtmOIF33FQOqp++uKI1qYmfOwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYCbpfVQctlE7LXg3OxNKQ/douMmUsXFhqmZgsZBX1Ym2ArmiL
	T0X2ZLM+ZHD9ewkrg1LslsSUh3Cob7/LbKF4k36YNkg3fhHv72H5vuRp
X-Gm-Gg: Acq92OHJvP0bmNrJ1JmjjmhzpJhZePI6JAnkLwXoKSt86iXMJhvZrqURVlD6Xrs2ZJq
	1BspWfNdXfLclQeRVp7FN9HLVe1ze6swfsZ5Mz2cxdRumZZ9norKReYnyegFzuocRSxUYKs779k
	DjkevSASdmO7urGZF6MmboMGP+KSDAd3Q1dDlYiJAysjX+94TdyIbZxCMp7Rm8VksVypHBq5a1i
	h9M/LNV085KTUd2Fs5DkI8bo0y1REXZQqB1MgLJjzfEx9sFqMRUIecK11YQ5nskxZRgaN64T3PJ
	RzOabdh09BvSQ4rdCuHjTQD62Lhbtz0AScsZqDbIdI0AMPiShG95bFMAlnFNkqpH9Th4aiVMmf3
	rhAdacWWCm2k/CF6QBYTXNqxZPR1Y+FekChntUOYfWYlgq/QxFuDEhtAFssdD5VOuhOA2IydmkG
	xUW8zkeEYDM82pgrGybcWNnUVAFwFQ+9vA0Y6Ix9ZSOg==
X-Received: by 2002:a17:903:2450:b0:2bc:e2ed:fd03 with SMTP id d9443c01a7336-2bf368a3dabmr36524785ad.39.1780134283084;
        Sat, 30 May 2026 02:44:43 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm61529945ad.10.2026.05.30.02.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 02:44:42 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v6 4/8] media: meson: vdec: Condition buffer flushing on queue type in start_streaming
Date: Sat, 30 May 2026 15:12:50 +0530
Message-ID: <20260530094326.11892-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260530094326.11892-1-linux.amoon@gmail.com>
References: <20260530094326.11892-1-linux.amoon@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-63106-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ndufresne.ca,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,baylibre.com,googlemail.com,linuxfoundation.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ndufresne.ca:email]
X-Rspamd-Queue-Id: F408460BF08
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
 drivers/staging/media/meson/vdec/vdec.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 8a5bf1a96830..698a95566ad2 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -386,15 +386,15 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	sess->status = STATUS_STOPPED;
 	mutex_unlock(&core->lock);
 
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


