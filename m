Return-Path: <linux-media+bounces-67477-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sggFNRbXVGqjfgAAu9opvQ
	(envelope-from <linux-media+bounces-67477-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 14:16:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEDD74AD4E
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 14:16:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=US4ZGXHz;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67477-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67477-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D17F4304C04E
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 12:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6532B40756E;
	Mon, 13 Jul 2026 12:10:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D883FF8BD
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 12:10:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944620; cv=none; b=ZshVJwRZ1IWy6dixRa3PrYk8fXsZpQKxcnQ0lWSGI9cXCpNLI+bApzCuMKj41hMtGYwNJSZ92r3Hmp+xWeOJ7uk5rtNHHnljeJ+PyA92N8a5E5ubKcWBAFQPxBEhwN2J0jlCfaN/n5VlNyKoSHPBTSjJnv7CxOOcJdNBsgbwZJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944620; c=relaxed/simple;
	bh=bhI4E6oc6F1Tv+IuuQmSjw+SHYMiXdNdT/xsno/HW2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rV3ozCYCaol2TMVAE/2wPkLc/JT1dm8Yf2aYxeJWoD7Ma0N/QfEfV8mTjjUeEnn7ljzj+7ewxf/4/OtyYbhEc7fwB6v9Z3nnScXrzH21iX0aQ936M6zpW9JX80AOwYwUg3d7e/rJ1ujDKMhOFQndOVu0oKA58C4rtC0NAvSNtf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=US4ZGXHz; arc=none smtp.client-ip=209.85.216.51
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38759bcd877so2456430a91.2
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 05:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944619; x=1784549419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M52KCQrGH2efvkkWtyT/9Kw89ZxEs+AuVcYa54xJZ9k=;
        b=US4ZGXHzWEKuVcfIlfgLCY+KKGahmAu1MF4e7LChw2ZiQQhtEviiF89+52QlNlSwkL
         YbhEV4eyrqVICWl7A7elwjJqmb9WqGRJNWFQGh+N3VfXrQWZPHb04dTrL9oKKFluse7F
         QM1CShn0fHAiqriaxpRX7oGDVTr5k/HZSsYJCGfElx7tKLMeWVN2alNNGVBD++FLQCNC
         CfCCrXAIjMYJbwfi2JQW+CY5LselYJMShV+9qGrWzN8NXpdSlrPyBC1VgFCOZDiAjVqc
         WQr40WYNT0zdUxaAnSNbUPFItgiyr8D/EWItM8JWEoj/OM68LIQpjR3c2jhs6DpPIY6C
         rwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944619; x=1784549419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M52KCQrGH2efvkkWtyT/9Kw89ZxEs+AuVcYa54xJZ9k=;
        b=ZDNICLVGDvZRFApk7LoRBlwJ5Y2qYH2wF+x0S1dFzi6/OaW59JqCdZnYfX1LHnXnG2
         a3HFwkFrTKZ0wbaQUEMYlEY8FgYV0pJmSDzUXC3fOfJFOK4/MOtUoyDkL6iYEskC8E4r
         UzDMKfAAoSz/Iy73mv63O1Iom850Evhtr6LuoQQgXbTz5/N0pwgXxvQcZdtINpJrpIEx
         qw7lXMknWigSUWstEBBRkVI8+ETUamhZe1otIP/9YeonKm/3oCpO7Au6BvCtr9lK5d/r
         ucGYUgu8K8+LQKUx2p4IFrwuoqu8b7LfnjwEVFXHIGPl9KK5zM/aaycKI+r0uENHv6MD
         47CA==
X-Forwarded-Encrypted: i=1; AHgh+RrKq+lSw16cwEzHOa6gouVI5YVraJkC8w3l+1bdHaMcdQ0187Z91KCSi9rk9Nfy0oYDRj3/1Sb3kTV3aA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjyi72cqKCZfW/THiQ6IVR0IHOZ7uCO8zUdWnWnp4XRKMCYu2a
	ulXj6bxOBldSddt8mIBRckPgBclTDYkHryrN11Va7j6iPHbHpCD7pbP2
X-Gm-Gg: AfdE7ck1WODYIxuGUQs3wAW4zOa2xAGiBIShDrlW6jQaV3h31f4pkScqzMjhDj0Hr8u
	38V/3P55EN/ToBzkBkKBLTFx3EqCwvktBFD4vh6GDDvpUD5eaGlEkW9T4+a7rhF50qROTWgDExH
	AkePzoCLd8pZkb0rhYt+Dw+SnG77RGnWhwzmsV3Ab6VMKrNl8DLD1ZgI4hmix8BafMKXKVOSBba
	tPaoDjdQNrJRmDoe2+YynNJHNoILV1GgEixjhydUSzEThIfh3zgEt8xpu616qqgiD12yOJ6IgVl
	AapSDQVDcGW9X/lqTYHmluBkSHNqTqgI3fTa/Qiy0MRecx87i36LC95GwfTltpESPFr1WM5TMrM
	tCxZ7SUbpHTfLrAi7amIQMwp0IyGeO+HMM2XbHbI41zAUwQ/WmIZmmbAg/I3fjiMNWTGJU01aK+
	j1vwMJsBoBuA==
X-Received: by 2002:a17:90b:58cc:b0:380:540:d499 with SMTP id 98e67ed59e1d1-38dc78224a5mr7942822a91.6.1783944618568;
        Mon, 13 Jul 2026 05:10:18 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:10:17 -0700 (PDT)
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
	Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v7 08/19] media: meson: vdec: Fix concurrent execution races and unsafe teardown
Date: Mon, 13 Jul 2026 17:37:03 +0530
Message-ID: <20260713120840.17427-9-linux.amoon@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-67477-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:dri-devel@lists.freedesktop.org,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux.amoon@gmail.com,m:doruk@0sec.ai,m:nicolas@ndufresne.ca,m:martinblumenstingl@gmail.com,m:linuxamoon@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,baylibre.com,googlemail.com,linuxfoundation.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,0sec.ai,ndufresne.ca];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne.ca:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1FEDD74AD4E

Address data races involving 'should_stop' and prevent multi-session
hardware clobbering by enforcing atomic tracking and strict owner
validation during device teardown.

The esparser work queue reads 'sess->should_stop' outside of critical
regions without serialization primitives, risking data races or visibility
delays. Furthermore, vdec_close() and vdec_stop_streaming() blindly
shut down hardware components (via poweroff and canvas frees) and nullify
'core->cur_sess' without confirming that the executing session actually
owns the active hardware context. In multi-session scenarios, this allows
a closing inactive session to inadvertently break a running session.

To fix these synchronization and lifecycle issues with the following
changes use thread-safe flagging: Wrap reads and writes of
'sess->should_stop' in READ_ONCE() and WRITE_ONCE() to prevent compiler
optimizations from caching the condition variables across scheduling
boundaries and optimizations across workqueue execution threads.

Also safe context releasing: transition 'core->cur_sess' pointer
clearings to use smp_store_release(). This ensures all prior internal
memory structures are entirely flushed and visible to other execution
cores.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/esparser.c |  2 +-
 drivers/staging/media/meson/vdec/vdec.c     | 88 ++++++++++++++-------
 2 files changed, 59 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
index e5d3d817b9b2b..959673742e699 100644
--- a/drivers/staging/media/meson/vdec/esparser.c
+++ b/drivers/staging/media/meson/vdec/esparser.c
@@ -379,7 +379,7 @@ void esparser_queue_all_src(struct work_struct *work)
 
 		scoped_guard(mutex, &sess->lock) {
 			/* Safe atomic tracking check: exit loop if session is shutting down */
-			if (sess->should_stop)
+			if (READ_ONCE(sess->should_stop))
 				return;
 
 			/* Queue completely empty: exit work loop cleanly */
diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 6fe9722577179..83a9b1238972a 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -287,9 +287,13 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	struct amvdec_session *sess = vb2_get_drv_priv(q);
 	struct amvdec_codec_ops *codec_ops = sess->fmt_out->codec_ops;
 	struct amvdec_core *core = sess->core;
+	struct device *dev = core->dev_dec;
 	struct vb2_v4l2_buffer *buf;
 	int ret;
 
+	/* Reset workqueue loop shutdown signal to allow streaming */
+	WRITE_ONCE(sess->should_stop, 0);
+
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		sess->streamon_out = 1;
 	else
@@ -336,7 +340,7 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 		dma_alloc_coherent(sess->core->dev, sess->vififo_size,
 				   &sess->vififo_paddr, GFP_KERNEL);
 	if (!sess->vififo_vaddr) {
-		dev_err(sess->core->dev, "Failed to request VIFIFO buffer\n");
+		dev_err(dev, "Failed to request VIFIFO buffer\n");
 		ret = -ENOMEM;
 		goto err_cleanup_session;
 	}
@@ -388,10 +392,12 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 		sess->streamon_cap = 0;
 
 	mutex_lock(&core->lock);
-	if (core->cur_sess == sess)
-		core->cur_sess = NULL;
-	if (sess->status != STATUS_NEEDS_RESUME)
-		sess->status = STATUS_STOPPED;
+	if (core->cur_sess == sess) {
+		/* Safely clear hardware ownership since we were confirmed as the owner */
+		smp_store_release(&core->cur_sess, NULL);
+		if (sess->status != STATUS_NEEDS_RESUME)
+			sess->status = STATUS_STOPPED;
+	}
 	mutex_unlock(&core->lock);
 err_unlock_no_hw:
 	while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
@@ -441,6 +447,9 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 	enum amvdec_status old_status;
 	bool full_cleanup = false;
 
+	/* Signal workqueue loop to abort instantly */
+	WRITE_ONCE(sess->should_stop, 1);
+
 	/* flush buffers to kill background workqueue thread */
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
@@ -493,26 +502,33 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 		cancel_work_sync(&sess->esparser_queue_work);
 		mutex_lock(&core->lock);
 
-		vdec_poweroff(sess);
-		vdec_free_canvas(sess);
+		if (core->cur_sess == sess) {
+			vdec_poweroff(sess);
+			vdec_free_canvas(sess);
+
+			if (sess->vififo_vaddr) {
+				dma_free_coherent(sess->core->dev,
+						  sess->vififo_size,
+						  sess->vififo_vaddr,
+						  sess->vififo_paddr);
+				sess->vififo_vaddr = NULL;
+				sess->vififo_paddr = 0;
+			}
 
-		if (sess->vififo_vaddr) {
-			dma_free_coherent(sess->core->dev, sess->vififo_size,
-					  sess->vififo_vaddr, sess->vififo_paddr);
-			sess->vififo_vaddr = NULL;
-			sess->vififo_paddr = 0;
-		}
+			vdec_reset_timestamps(sess);
+			vdec_reset_bufs_recycle(sess);
 
-		vdec_reset_timestamps(sess);
-		vdec_reset_bufs_recycle(sess);
-		core->cur_sess = NULL;
+			kfree(sess->priv);
+			sess->priv = NULL;
 
-		kfree(sess->priv);
-		sess->priv = NULL;
+			/* Safely clear hardware ownership since we were confirmed as the owner */
+			smp_store_release(&core->cur_sess, NULL);
+		}
 	} else {
 		if (sess->status == STATUS_NEEDS_RESUME)
 			sess->changed_format = 0;
 	}
+
 	mutex_unlock(&core->lock);
 }
 
@@ -802,7 +818,7 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
 
 	if (cmd->cmd == V4L2_DEC_CMD_START) {
 		v4l2_m2m_clear_state(sess->m2m_ctx);
-		sess->should_stop = 0;
+		WRITE_ONCE(sess->should_stop, 0);
 		return 0;
 	}
 
@@ -812,7 +828,7 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
 
 	dev_dbg(dev, "Received V4L2_DEC_CMD_STOP\n");
 
-	sess->should_stop = 1;
+	WRITE_ONCE(sess->should_stop, 1);
 
 	v4l2_m2m_mark_stopped(sess->m2m_ctx);
 
@@ -998,6 +1014,9 @@ static int vdec_close(struct file *file)
 	struct amvdec_session *sess = file_to_amvdec_session(file);
 	struct amvdec_core *core = sess->core;
 
+	/* Signal workqueue loop to abort instantly */
+	WRITE_ONCE(sess->should_stop, 1);
+
 	/* Synchronize and flush pending hardware interrupt service routines */
 	synchronize_irq(core->vdec_irq);
 	/* Ensure esparser ISR finishes executing */
@@ -1012,21 +1031,30 @@ static int vdec_close(struct file *file)
 
 	mutex_lock(&core->lock);
 
-	vdec_poweroff(sess);
-	vdec_free_canvas(sess);
-	core->cur_sess = NULL;
+	if (core->cur_sess == sess) {
+		vdec_poweroff(sess);
+		vdec_free_canvas(sess);
 
-	if (sess->vififo_vaddr) {
-		dma_free_coherent(core->dev, sess->vififo_size,
-				  sess->vififo_vaddr, sess->vififo_paddr);
-		sess->vififo_vaddr = NULL;
-		sess->vififo_paddr = 0;
+		if (sess->vififo_vaddr) {
+			dma_free_coherent(core->dev,
+					  sess->vififo_size,
+					  sess->vififo_vaddr,
+					  sess->vififo_paddr);
+			sess->vififo_vaddr = NULL;
+			sess->vififo_paddr = 0;
+		}
+		vdec_reset_timestamps(sess);
+		vdec_reset_bufs_recycle(sess);
 	}
-	vdec_reset_timestamps(sess);
-	vdec_reset_bufs_recycle(sess);
+
 	kfree(sess->priv);
 	sess->priv = NULL;
 
+	/* Unconditionally set our local status to stopped */
+	sess->status = STATUS_STOPPED;
+	/* Safely clear hardware ownership since we were confirmed as the owner */
+	smp_store_release(&core->cur_sess, NULL);
+
 	mutex_unlock(&core->lock);
 
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
-- 
2.50.1


