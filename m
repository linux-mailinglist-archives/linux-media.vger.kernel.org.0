Return-Path: <linux-media+bounces-67471-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z5HcI8vWVGqNfgAAu9opvQ
	(envelope-from <linux-media+bounces-67471-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 14:15:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D200074AD0C
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 14:15:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="N/mOfQ3D";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67471-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67471-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F238311B2B8
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 12:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D394071D9;
	Mon, 13 Jul 2026 12:09:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE4A406804
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 12:09:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944556; cv=none; b=Mnf4b4gTcrYanAcZkKDAP2WSa1CIvktrmxPOHHuTEAJ2U8BYgqBJPYF3Ek+b8n1C21Z8gKJKN+eTI3Nuv00SmegzM+8vAOAhtMCKtj3p5BC5KIJqo2rHbeo1z3gDCoP/LyGlJFKn7on7iKTp2lipdHJhUcabdgWnUcUs2yK9Yuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944556; c=relaxed/simple;
	bh=N3uewV9p1wEkq7IBGmE047BkMIsp0re4khks6TNRAIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q2yWIVYLpeybW19vkmP4mvlwOleKg6Gxx9ASABuNyeJierOv3ZeeIjw5gNIq/xH3rDXrAx9zonksHFbQv2kYfuz9dY19Qfi75x3mGmQmJRcjIigkh/RarSdwxZUJAemB4VvjQyDQRLhOwuERw3e+dAuMIJBd2ggIH7caonza9Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/mOfQ3D; arc=none smtp.client-ip=209.85.216.43
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-384c94c9414so2757189a91.3
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 05:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944554; x=1784549354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O9YYyee56RYzJH/7lhC6WY6QS3lP6Hx70/PxBzEZ1WM=;
        b=N/mOfQ3D2FKU41gWawBnyoSlMWiQK75gyErFJfHUsnMpFajxXnSQf+w+Ada+WkSTBg
         yMSPJ6BRBA/f7sGh40e42zutsruTGOg7/C82yCLM2ZAshtBzg0C5+2GD6xvyJxyS/5H3
         iuclQvnHwZYAUwM3DIgbGo2JKaal7kf2iMYnuFH7Y9tvr28CDrmcAMkqOimpEg5b1OwB
         OZWr8fHESAXBq/fdTxJBZwVbMPJbNJUBwKynnkKv1GfaesS2seThg9/sALsTI7UNA1qA
         NGuJe3rLky8ssUUmYFXMVQTDcwxnJb1IlmkFi7l0eXVpymfL8h5GHGD4WpaLU616wgie
         RAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944554; x=1784549354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O9YYyee56RYzJH/7lhC6WY6QS3lP6Hx70/PxBzEZ1WM=;
        b=hUQDY2WPm/z0AyT2gvADrnfL+N2diaPK9lhmMie/rK46jJPeyVvf2/Mm/6yPtf8zc1
         3M/CJOoufUwiaLZEWay/82JgljHiLYfn9hjLKeZgATH/z1qc+zfPKM32lNm3IkW51UBF
         d4/N9Sv3nPDURwNTLDUgxk0Gr2HrMA3V6KbwIN/NNZhBnWhuU33MW1GxpPbTaW961MIQ
         upzXQ7341kQ0gCpo9J8ctr20I6O1HFMviTJcW2wOaeP8/P7+8xODiAvZTeJefhY5PdNd
         Ku52vS85Z7EyEI4eAGyn1Fue+mqZL0RooMA/AueSsSRok0EUbKTnD1n/3zg/uQZSqh4/
         RFGA==
X-Forwarded-Encrypted: i=1; AHgh+RoauaxFS0Apaz6bQvvcCqKQIENA9VzO8Jrlk2HZMfr+SqeSnEzhwX9UAUs0zl/9QXH4wwm8AJ+ypEAkwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQcQRt/DwvntRIZ1RN+Dc3Tdv8ToayOGgFeszc/wbamyjZttPx
	cmKtgMoCZ1CBA/yC1NlQu21W3NgdE9TlLgnW+JJanD91fH2vDHDdu/YN
X-Gm-Gg: AfdE7cnj0Y/FowLMflE8wryBfxMh2BpVjd09/iSgAuwvZiT3G0mIGcvEuuDADMveZ3v
	EOS9quY0765YiP/lFW9/5wNAa2ovxeeT8gRarGP2qSolrAYNfcHFEM2J9iZ0REi0hvmhd5HvzEM
	cXpdavWZtC1XjPv/tzd96gl6sL6VgYn5yICrwifx+aAFJoBqFNwtGsfxVtBgK5FMVNm09hQ1BvM
	8i4DDace76XaQ4vvKbknPXpZwABfQOvEW4e8A3uoVSv4mR7adAfsln05hH/j4CHz1TSAqyzemXf
	3zBjXTMyj0ShHlgiRDvSY9UFvHHCct5QtHbj47vAdmp94n7GRe+icAOzVQinXFfvLSzj9+WDtN6
	Lefn0zDtMhIS4/Z9ZSKR+hAen40UT1v7vQ2Da/YeIR8WkYZNlqoSOO1U0+4f01rIPL3v9pUJoFC
	OOVEhPLizyWL4XkWz5XUIi
X-Received: by 2002:a17:90b:58f0:b0:387:e0db:bc23 with SMTP id 98e67ed59e1d1-38dc77b82bemr9015022a91.35.1783944553867;
        Mon, 13 Jul 2026 05:09:13 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:09:13 -0700 (PDT)
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
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Doruk Tan Ozturk <doruk@0sec.ai>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v7 02/19] media: meson: vdec: Fix STREAMON / STREAMOFF race conditions and session teardown
Date: Mon, 13 Jul 2026 17:36:57 +0530
Message-ID: <20260713120840.17427-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-67471-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:dri-devel@lists.freedesktop.org,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux.amoon@gmail.com,m:doruk@0sec.ai,m:nicolas@ndufresne.ca,m:sashiko-bot@kernel.org,m:martinblumenstingl@gmail.com,m:linuxamoon@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,baylibre.com,googlemail.com,linuxfoundation.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,0sec.ai,ndufresne.ca,kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne.ca:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D200074AD0C

The vdec driver suffered from unsafe state transitions and race
conditions when handling concurrent STREAMON / STREAMOFF calls and
dynamic resolution change (DRC) events. Global context pointers
(e.g. core->cur_sess) and session status flags were updated outside
proper lock boundaries, allowing parallel threads to corrupt hardware
state under load.

Address these architectural stability flaws with the following changes:

1. In vdec_start_streaming(), safely encapsulate hardware occupancy
   evaluations and target session context claims within a secure mutex
   lock (core->lock). This blocks overlapping multi-threaded STREAMON
   calls from creating concurrent assignment conflicts.

2. Restructure initialization error path handlers to avoid global memory
   maps cross-contamination. Segregate buffer flushes cleanly based
   strictly on the active vb2 queue type (OUTPUT vs CAPTURE) to avoid
   incorrectly reclaiming undecoded ready blocks.

3. In vdec_stop_streaming(), introduce state-aware tracking to
   accurately identify DRC conditions. If a resolution modification
   forces a capture queue reset while the output stream is still live,
   preserve the driver's inner runtime states and bypass premature
   hardware power-off sweeps.

4. Enforce strict null-pointer safety limits inside DMA unmapping
   sequences. Explicitly clear tracking metadata entries
   (sess->vififo_vaddr = NULL) inside the VIFIFO freeing routines to
   neutralize accidental double-free risks.

Together these changes harden the driver against concurrency bugs,
eliminate memory leaks, and ensure predictable session lifecycle
management under multi threaded workloads.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260530100841.9CEBA1F00893@smtp.kernel.org/
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 136 +++++++++++++++++-------
 1 file changed, 95 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 6ae3471155a87..d1f35fc893de1 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -286,11 +286,6 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	struct vb2_v4l2_buffer *buf;
 	int ret;
 
-	if (core->cur_sess && core->cur_sess != sess) {
-		ret = -EBUSY;
-		goto bufs_done;
-	}
-
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		sess->streamon_out = 1;
 	else
@@ -308,9 +303,29 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	}
 
 	if (sess->status == STATUS_RUNNING ||
-	    sess->status == STATUS_NEEDS_RESUME ||
-	    sess->status == STATUS_INIT)
+	    sess->status == STATUS_NEEDS_RESUME)
+		return 0;
+
+	/*
+	 * Secure the core hardware lock before checking availability
+	 * and updating session states to prevent STREAMON race conditions.
+	 */
+	mutex_lock(&core->lock);
+	if (core->cur_sess && core->cur_sess != sess) {
+		ret = -EBUSY;
+		mutex_unlock(&core->lock);
+		goto err_unlock_no_hw;
+	}
+
+	/* If already half-initialized, do not re-initialize */
+	if (sess->status == STATUS_INIT) {
+		mutex_unlock(&core->lock);
 		return 0;
+	}
+
+	sess->status = STATUS_INIT;
+	core->cur_sess = sess;
+	mutex_unlock(&core->lock);
 
 	sess->vififo_size = SIZE_VIFIFO;
 	sess->vififo_vaddr =
@@ -319,7 +334,7 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	if (!sess->vififo_vaddr) {
 		dev_err(sess->core->dev, "Failed to request VIFIFO buffer\n");
 		ret = -ENOMEM;
-		goto bufs_done;
+		goto err_cleanup_session;
 	}
 
 	sess->should_stop = 0;
@@ -333,33 +348,43 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 
 	ret = vdec_poweron(sess);
 	if (ret)
-		goto vififo_free;
+		goto err_free_vififo;
 
 	sess->sequence_cap = 0;
 	sess->sequence_out = 0;
+
 	if (vdec_codec_needs_recycle(sess))
 		sess->recycle_thread = kthread_run(vdec_recycle_thread, sess,
 						   "vdec_recycle");
 
-	sess->status = STATUS_INIT;
-	core->cur_sess = sess;
 	schedule_work(&sess->esparser_queue_work);
 	return 0;
 
-vififo_free:
-	dma_free_coherent(sess->core->dev, sess->vififo_size,
-			  sess->vififo_vaddr, sess->vififo_paddr);
-bufs_done:
-	while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
-		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
-	while ((buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
-		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
-
+err_free_vififo:
+	if (sess->vififo_vaddr) {
+		dma_free_coherent(sess->core->dev, sess->vififo_size,
+				  sess->vififo_vaddr, sess->vififo_paddr);
+		sess->vififo_vaddr = NULL;
+		sess->vififo_paddr = 0;
+	}
+err_cleanup_session:
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		sess->streamon_out = 0;
 	else
 		sess->streamon_cap = 0;
 
+	mutex_lock(&core->lock);
+	if (core->cur_sess == sess)
+		core->cur_sess = NULL;
+	if (sess->status != STATUS_NEEDS_RESUME)
+		sess->status = STATUS_STOPPED;
+	mutex_unlock(&core->lock);
+err_unlock_no_hw:
+	while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
+		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
+	while ((buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
+		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
+
 	return ret;
 }
 
@@ -399,30 +424,13 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 	struct amvdec_codec_ops *codec_ops = sess->fmt_out->codec_ops;
 	struct amvdec_core *core = sess->core;
 	struct vb2_v4l2_buffer *buf;
+	enum amvdec_status old_status;
+	bool full_cleanup = false;
 
-	if (sess->status == STATUS_RUNNING ||
-	    sess->status == STATUS_INIT ||
-	    (sess->status == STATUS_NEEDS_RESUME &&
-	     (!sess->streamon_out || !sess->streamon_cap))) {
-		if (vdec_codec_needs_recycle(sess))
-			kthread_stop(sess->recycle_thread);
-
-		vdec_poweroff(sess);
-		vdec_free_canvas(sess);
-		dma_free_coherent(sess->core->dev, sess->vififo_size,
-				  sess->vififo_vaddr, sess->vififo_paddr);
-		vdec_reset_timestamps(sess);
-		vdec_reset_bufs_recycle(sess);
-		kfree(sess->priv);
-		sess->priv = NULL;
-		core->cur_sess = NULL;
-		sess->status = STATUS_STOPPED;
-	}
-
+	/* flush buffers to kill background workqueue thread */
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
 			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_ERROR);
-
 		sess->streamon_out = 0;
 	} else {
 		/* Drain remaining refs if was still running */
@@ -431,9 +439,55 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 
 		while ((buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
 			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_ERROR);
-
 		sess->streamon_cap = 0;
 	}
+
+	/* Hold core lock continuously for the state and resource processing */
+	mutex_lock(&core->lock);
+	old_status = sess->status;
+
+	if (old_status == STATUS_RUNNING || old_status == STATUS_INIT ||
+	    (old_status == STATUS_NEEDS_RESUME && (!sess->streamon_out ||
+						   !sess->streamon_cap))) {
+		/*
+		 * If it's a DRC event (Capture queue streamoff only), preserve
+		 * the status
+		 */
+		if (old_status == STATUS_NEEDS_RESUME && sess->streamon_out) {
+			full_cleanup = false;
+		} else {
+			full_cleanup = true;
+			sess->status = STATUS_STOPPED;
+		}
+	}
+
+	if (full_cleanup) {
+		if ((q->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
+		     !sess->streamon_out) && vdec_codec_needs_recycle(sess)) {
+			kthread_stop(sess->recycle_thread);
+		}
+
+		vdec_poweroff(sess);
+		vdec_free_canvas(sess);
+
+		if (sess->vififo_vaddr) {
+			dma_free_coherent(sess->core->dev, sess->vififo_size,
+					  sess->vififo_vaddr, sess->vififo_paddr);
+			sess->vififo_vaddr = NULL;
+			sess->vififo_paddr = 0;
+		}
+
+		vdec_reset_timestamps(sess);
+		vdec_reset_bufs_recycle(sess);
+		core->cur_sess = NULL;
+
+		kfree(sess->priv);
+		sess->priv = NULL;
+	} else {
+		if (sess->status == STATUS_NEEDS_RESUME)
+			sess->changed_format = 0;
+	}
+	mutex_unlock(&core->lock);
 }
 
 static int vdec_vb2_buf_prepare(struct vb2_buffer *vb)
-- 
2.50.1


