Return-Path: <linux-media+bounces-63104-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPcsCo2xGmoH7ggAu9opvQ
	(envelope-from <linux-media+bounces-63104-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 11:44:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BA78A60BEF8
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 11:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F250304B927
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 09:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B0AB39BFE7;
	Sat, 30 May 2026 09:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pCoaPL8u"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D441368D79
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 09:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780134264; cv=none; b=oGT/JFfNsaR6lrTpXm74f11tp+zB0kOK/kfrb0ABOa9LgKc3QSShGkgPKb3AyElfWQpFa67cHlgUPqCan99RsOVoJoePa4urq90wM7qgBXUo3FVicZXaF7rJ9iDGqDFPUwE8vNr3zFo6xXFOOcby3rrRSwbd8xVetXY6wNl5e60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780134264; c=relaxed/simple;
	bh=G9B1EJrVgntwzA18R6iCzm5tNIqmGP+wgdzFWEsJR3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MzbnogA5YNkEtHpXScprosrwH/hjIyr937vy3Xp/D2sxbHcR2P5V7uNKDXP/KRfR8qLpp1LpOTfVeOHlraNaeUgEtSwxlja0ZGFEb58FMI4nHuMG99G6X/YWKt4UBkF9q0Nu8l1U6p+ucI2YTCHfs3J0ZBvd3W2fsaDVAKmsq54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pCoaPL8u; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3697f25d26eso7963516a91.1
        for <linux-media@vger.kernel.org>; Sat, 30 May 2026 02:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134263; x=1780739063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YD6axKKp8wDht90VyqGQ3zjwLyfLDF+g7zoFDStjFGA=;
        b=pCoaPL8uKiAkDTSJSc2S24T52GL7LcLrNPxgC42CW16leS0zN7FbLdJdJqOMeZ82Lq
         OT9aiGcCpTj4quxYnxUeGtTTr4y9SMZsTv87DXdO9HD+Xzi9TNh7ipyak7wgRmon7Zcf
         PxbsExX7eS6yJwYuo4dAoWJi9Ew4N4O9R71pPBMTIMgQPl+VBYOviugSL7vHzyidFSCX
         xgmUnKKDSo1uu4kR3hN317D0o2yRuIobO6/m91LKBcK2lHBHYou0rcNrVWz29G24zEhd
         8H/ka2+kGqSQ1EGuCTCaBswd5AgbYJ3YzYZ5HddszydB9hn1gzBJTOdStoGttzqPUlSt
         /gtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134263; x=1780739063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YD6axKKp8wDht90VyqGQ3zjwLyfLDF+g7zoFDStjFGA=;
        b=s9kQpedANd3J8Iec/IJqaep+qPGPgzQETl/D6Z2NbAnZG4JmS30ktuten8LpF+iB/g
         amURqAb2XMW+FDE0UgSZewGzmPdt4O7EVr591eKUpDkZG5bGMDlmczu4mgyw99bZLWdY
         YP+4Jpp41CX2L/v3uT8sLPDT/QNCtSq/bUJpULI4vyo1nGxelLUtrd2B7lbUHGYkRtAm
         YQ/26z35fcijvRlX3rRpMIevf/pkR5pR8oj/0XYRvcwZRqATI0B+fqGnGRjPxLAihbr5
         F02wgMSKSFSmRGjP96GLkbC7RhI2/eXPusQv9nXZz1Ysq9jOSl5xp2PSSnyZd80ShvoJ
         ssGg==
X-Forwarded-Encrypted: i=1; AFNElJ8YnI08a2tGjgVrJ8c5psENUm/RYbX63TNpXbbNNXURsx+ZvSMKPdT0PLLjSB0lUQPPcctw8ZEkT382nw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywabe6DQqTnLJJB/4nPWmnLCpwhOtjvi5Wm5gv31rXP7yRp7H8y
	jMRVO4RKRmLGrGwm8FMHFQNeNiEC1JG/Qr6sMwIZtpdUw9jXN/7zUcXk
X-Gm-Gg: Acq92OGfUyeaBV3exSeNXWLINuoPswXmIdp8/339QUReDJxNxncDM9a1IBa5AMRRFI5
	wcqeTDUBbt95sRIkGD9D2LH36zTowo+AkvgablsGO789eo3Bey6GZs0XEMa2Me48xtLo94+CzAE
	GqrGqixtiHBiLFYDSjgAhEbCJsdi4iZSl+BM8EWlJdbwX35HHoQW5+eJNHgubl8Ya2qkbFrqbQj
	MdXGTxZ+8KhszO+buWvuEphEaVhTZRRnSThrCKRjg61rJK5AOEe2O7sJqNCgCJbTQMw4YsCnPwQ
	Qjcm4EQ/04PxtPa5D34/kE/xRRpwyhG+EkRO93THeGkoNO83Du8kI5UeTSYcMRswiiCFc6KgAig
	3EpjIZx67vuu36BnKZoz7mcopApYP/CfS4ZiBPqg6n8DeI2Hkv8NNij0dXSrxY5tNVB3eQeQuGF
	h6DFs3p8CQrE1+h68fET0lfff0Vis0RqU=
X-Received: by 2002:a17:903:2305:b0:2ba:7881:948d with SMTP id d9443c01a7336-2bf367b214fmr38817185ad.1.1780134262731;
        Sat, 30 May 2026 02:44:22 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm61529945ad.10.2026.05.30.02.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 02:44:22 -0700 (PDT)
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
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v6 2/8] media: meson: vdec: Fix concurrent STREAMON / STREAMOFF race conditions
Date: Sat, 30 May 2026 15:12:48 +0530
Message-ID: <20260530094326.11892-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260530094326.11892-1-linux.amoon@gmail.com>
References: <20260530094326.11892-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63104-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,baylibre.com,googlemail.com,linuxfoundation.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,ndufresne.ca,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ndufresne.ca:email]
X-Rspamd-Queue-Id: BA78A60BEF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Meson VDEC driver’s start/stop streaming paths previously
updated core->cur_sess and sess->status without synchronization,
leaving a race window between concurrent STREAMON/STREAMOFF calls.

Following change introduces proper locking discipline:

- Hold core->lock when checking or updating core->cur_sess and
  sess->status in vdec_start_streaming().
- Snapshot sess->status under the lock in vdec_stop_streaming()
  to safely evaluate hardware state after releasing the mutex.
- Ensure error unwind paths clear core->cur_sess and reset
  sess->status inside the lock.

This prevents TOCTOU races, avoids data corruption when multiple
sessions contend for the hardware, and ensures consistent session
lifecycle management.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260525104345.C8D501F00A3C@smtp.kernel.org/
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 62 ++++++++++++++++++-------
 1 file changed, 46 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4ffebba2341d..7233000e2232 100644
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
+		mutex_unlock(&core->lock);
+		ret = -EBUSY;
+		goto bufs_done;
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
@@ -341,8 +356,6 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 		sess->recycle_thread = kthread_run(vdec_recycle_thread, sess,
 						   "vdec_recycle");
 
-	sess->status = STATUS_INIT;
-	core->cur_sess = sess;
 	schedule_work(&sess->esparser_queue_work);
 	return 0;
 
@@ -350,6 +363,12 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	dma_free_coherent(sess->core->dev, sess->vififo_size,
 			  sess->vififo_vaddr, sess->vififo_paddr);
 bufs_done:
+	mutex_lock(&core->lock);
+	if (core->cur_sess == sess)
+		core->cur_sess = NULL;
+	sess->status = STATUS_STOPPED;
+	mutex_unlock(&core->lock);
+
 	while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
 		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
 	while ((buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
@@ -399,10 +418,23 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 	struct amvdec_codec_ops *codec_ops = sess->fmt_out->codec_ops;
 	struct amvdec_core *core = sess->core;
 	struct vb2_v4l2_buffer *buf;
+	enum amvdec_status old_status;
 
-	if (sess->status == STATUS_RUNNING ||
-	    sess->status == STATUS_INIT ||
-	    (sess->status == STATUS_NEEDS_RESUME &&
+	/*
+	 * Safely snapshot the status and clear the hardware owner inside
+	 * the mutex to prevent data races with concurrent STREAMON requests.
+	 */
+	mutex_lock(&core->lock);
+	old_status = sess->status;
+	if (core->cur_sess == sess)
+		core->cur_sess = NULL;
+	sess->status = STATUS_STOPPED;
+	mutex_unlock(&core->lock);
+
+	/* Evaluate the hardware state using our snapshot */
+	if (old_status == STATUS_RUNNING ||
+	    old_status == STATUS_INIT ||
+	    (old_status == STATUS_NEEDS_RESUME &&
 	     (!sess->streamon_out || !sess->streamon_cap))) {
 		if (vdec_codec_needs_recycle(sess))
 			kthread_stop(sess->recycle_thread);
@@ -415,8 +447,6 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 		vdec_reset_bufs_recycle(sess);
 		kfree(sess->priv);
 		sess->priv = NULL;
-		core->cur_sess = NULL;
-		sess->status = STATUS_STOPPED;
 	}
 
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
@@ -425,8 +455,8 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 
 		sess->streamon_out = 0;
 	} else {
-		/* Drain remaining refs if was still running */
-		if (sess->status >= STATUS_RUNNING && codec_ops->drain)
+		/* Drain remaining refs if was still running using the snapshot */
+		if (old_status >= STATUS_RUNNING && codec_ops->drain)
 			codec_ops->drain(sess);
 
 		while ((buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
-- 
2.50.1


