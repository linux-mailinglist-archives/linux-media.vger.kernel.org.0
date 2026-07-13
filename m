Return-Path: <linux-media+bounces-67476-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WP2ZHJ/WVGqBfgAAu9opvQ
	(envelope-from <linux-media+bounces-67476-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 14:14:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F41174ACD9
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 14:14:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Nq2R3WEk;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67476-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-67476-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8CB75302B22A
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 12:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC9D3FC5AB;
	Mon, 13 Jul 2026 12:10:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEA840683F
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 12:10:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944611; cv=none; b=DKwL0gA4ZdiYywu/aikT+22YAqa/gntwR15uBhSuojSAhftqQICys1MqpB4RAQtphkgkIIm0g50zfc5BXwgh/53beElK4lljsP0bD30TzKfGJQVv1zKNZuv80u/rqHXyBQvY3uoGKA6EBiupuXEQUzj9epwT3vkzjApV+j2tO4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944611; c=relaxed/simple;
	bh=jmgoQL+MH+cHI2abCHhSjB4sQPbvNKTxgke0bczlm7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fwkLQiGUpkDuhKzyKuw26E+opwErFfx8ydjhGBEEzjhINNCmQCNzlTDdOECBkynLw0YPnZH3KrDdsZ2ye6x6EIKj+6J+XofJVuKNYpZ/sv1IOwXoKsOglppcR5hn9EuKL5daDkI4MM1HDrSGQuyAaCcjuLXw6IQfHij2mZ45SGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nq2R3WEk; arc=none smtp.client-ip=209.85.215.176
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ca965de53baso1549986a12.0
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 05:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944608; x=1784549408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cz2FSgCZR0hsmFPhKS7OSCHd3SyOY5Jhxrt1826LFDI=;
        b=Nq2R3WEkPiz8hNUV5yOa5w+XAeChi13GOGHCW94/1P9IuCfm940PzbejHMn9pQzC+T
         Z6LY5UKdtKMvzVkmV54x4wSMFg6A3X7uH6r+0eZ9jcsakp58gKSjYdUu50CGRNq0WioN
         peGp7X2cfdHl/qXDKFJO3KwqvxjQUrx/MTShuEzBTC5qKYDMSITVn4lLw0AeMnZ6JkB0
         1BMq/HFFQjDPjbWQXBt2uLV7r6fj3Pbwd4YqmoIa1Z/vbaJiY9AQuTqp0mkL5Ocv1ZiZ
         QWrwrtVMeejJMEviBxPf8iE8F57E2yKPnvXD3hLT9g7b5bg7moUBFBMpKW+MC5cWfOms
         nKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944608; x=1784549408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cz2FSgCZR0hsmFPhKS7OSCHd3SyOY5Jhxrt1826LFDI=;
        b=TFuDqqboroCwqGBN+CrjhVRSJWD6xAQDLdMpxQIEVZpJFcXzCv7mowDGBKoqdeAtvy
         /bBMJQsy2Mrp1dRWq4/lxvQhyPHt6e0v56vxA9oGTTWStoIImtoO2iR7tw42ndRgQF54
         KwrtEk7nWcGlB2uyiTuLATF8T+IHi5BXUcg0n0LCYD5ufhI+HWT5xg0zNSSGbCt6KVVm
         TwlPWTiMe8VBso++I5hlhlICj0uppwRDmxpr8gakVUE5vXvpmwpzgYn036M6eKhEqQIL
         1YsfOwawBgwLcelbxMbYNNrwUcLeFBVbkUQMXg0SPkFc3zoE+6wcJmpZ3YGJcZZxaPBb
         ExBQ==
X-Forwarded-Encrypted: i=1; AHgh+RpNuJHcKfnICoaiATlc1s4wjXUP30uLvni8AEDC7eteGqQvO2r5CKlnLAZ+TArNMVfDHjkl8WHBsM26TQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaJ8sN16FXVMPPl9YNBTzftxuLESmyp9TqMMxCbJrL0pMKa6kR
	0ZwYCQpmmfbEa99CESaZ1tsqt6ZOf9aFloH6SkLHny1WUGY6ghdXkd4X
X-Gm-Gg: AfdE7ckloy43NBRK8LimQYeMJAs94KmbhoO/muarmvtMxvAtXHJQP3UJhoS9tkdAXZz
	pIf9ieeyg/C3Beq8jPFCkjudPLzCZKjI5wXpd2RVmM+PSHULI13OGMjflTdKED850ErXCJVV1m5
	MLlTSnSXr8kVIWaOEToCFNaNxt37X+3Y6bYv6It5iREHqxxhJG+J2qCjVReGUBWzyP95NdgRrAF
	caa/E5SKeTz8p99Vg4eOD8F8QQZV95P9AkbDURR22bCumjCDuRG1ISHkLefr3fisDtHK3yzLpSf
	sd3dUxcCakmnCs8MkTOW/ZLEtkPs9d57z02mf+wC1DJCXcSffuUPjtuj/3BLdUtUQNqZdxQzkP3
	jCKQ1ZoltZ8j8cfUY5HvVUJLYlKhfguFrEqgf2QJYdiieDU99ggNsh0DPVa1XAQ0tzZQG4oHTKZ
	ylD1rpozOl7g==
X-Received: by 2002:a05:6a21:140a:b0:3c0:9c19:b27d with SMTP id adf61e73a8af0-3c110cfefa5mr9580843637.75.1783944607855;
        Mon, 13 Jul 2026 05:10:07 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:10:07 -0700 (PDT)
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
Subject: [PATCH v7 07/19] media: meson: vdec: Refactor esparser work queue and fix teardown race
Date: Mon, 13 Jul 2026 17:37:02 +0530
Message-ID: <20260713120840.17427-8-linux.amoon@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-67476-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ndufresne.ca:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F41174ACD9

Rework the esparser work queue logic to prevent concurrent queue mutations
and fix a race condition during streaming teardown.

The previous implementation relied on v4l2_m2m_for_each_src_buf_safe(),
which held the session mutex across the entire queue traversal. This
blocked concurrent operations, caused inaccurate buffer mapping, and
triggered 100+ second watchdog freezes due to an unyielding polling loop.
Additionally, the low-level parser handled buffer ownership adjustments
and completion callbacks directly, leading to inconsistent error paths and
races between streamon and streamoff.

Fix this by utilizing the modern scoped_guard(mutex) mechanism inside the
main worker loop. This allows the session lock to be automatically
dropped on any conditional breakout path, preventing voluntary scheduling
bugs while invoking cond_resched(). De-couple buffer lifecycles from the
hardware parser routine by leveraging safe, linear fetches via
v4l2_m2m_next_src_buf() and v4l2_m2m_src_buf_remove(), ensuring orderly
frame transactions. Refactor esparser_queue() to return explicit error
codes (such as -EBADMSG, -EIO, and -EAGAIN) to safely handle buffer states.

Clean up teardown paths: Execute cancel_work_sync() inside
vdec_stop_streaming() and vdec_close() immediately after
synchronize_irq(). This ensures any pending scheduled queue work is fully
flushed and canceled before the driver destroys hardware instances.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/esparser.c | 69 +++++++++++++++------
 1 file changed, 49 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
index 37749ede308c6..e5d3d817b9b2b 100644
--- a/drivers/staging/media/meson/vdec/esparser.c
+++ b/drivers/staging/media/meson/vdec/esparser.c
@@ -328,15 +328,11 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
 		return -EAGAIN;
 	}
 
-	v4l2_m2m_src_buf_remove_by_buf(sess->m2m_ctx, vbuf);
-
 	offset = esparser_get_offset(sess);
 
 	ret = amvdec_add_ts(sess, vb->timestamp, vbuf->timecode, offset, vbuf->flags);
-	if (ret) {
-		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
+	if (ret)
 		return ret;
-	}
 
 	dev_dbg(core->dev, "esparser: ts = %llu pld_size = %u offset = %08X flags = %08X\n",
 		vb->timestamp, payload_size, offset, vbuf->flags);
@@ -348,12 +344,10 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
 	if (sess->fmt_out->pixfmt == V4L2_PIX_FMT_VP9) {
 		payload_size = vp9_update_header(core, vb);
 
-		/* If unable to alter buffer to add headers */
 		if (payload_size == 0) {
+			dev_err(core->dev, "esparser: VP9 header update failed\n");
 			amvdec_remove_ts(sess, vb->timestamp);
-			v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
-
-			return 0;
+			return -EBADMSG;
 		}
 	}
 
@@ -363,33 +357,68 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
 	if (ret <= 0) {
 		dev_warn(core->dev, "esparser: input parsing error\n");
 		amvdec_remove_ts(sess, vb->timestamp);
-		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
 		amvdec_write_parser(core, PARSER_FETCH_CMD, 0);
-
-		return 0;
+		return -EIO;
 	}
 
 	atomic_inc(&sess->esparser_queued_bufs);
-	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
 
 	return 0;
 }
 
 void esparser_queue_all_src(struct work_struct *work)
 {
-	struct v4l2_m2m_buffer *buf, *n;
 	struct amvdec_session *sess =
 		container_of(work, struct amvdec_session, esparser_queue_work);
+	struct device *dev = sess->core->dev_dec;
+	int ret;
 
-	mutex_lock(&sess->lock);
-	v4l2_m2m_for_each_src_buf_safe(sess->m2m_ctx, buf, n) {
-		if (sess->should_stop)
-			break;
+	while (1) {
+		struct vb2_v4l2_buffer *vbuf = NULL;
+		bool processed_frame = false;
+
+		scoped_guard(mutex, &sess->lock) {
+			/* Safe atomic tracking check: exit loop if session is shutting down */
+			if (sess->should_stop)
+				return;
+
+			/* Queue completely empty: exit work loop cleanly */
+			vbuf = v4l2_m2m_next_src_buf(sess->m2m_ctx);
+			if (!vbuf)
+				break;
+
+			/* Stop processing if we hit the end-of-stream drain buffer */
+			if (vbuf->flags & V4L2_BUF_FLAG_LAST)
+				break;
+
+			/* Check hardware FIFO limits safely inside the locks */
+			ret = esparser_queue(sess, vbuf);
+			if (ret == -EAGAIN)
+				break;
+
+			/* Pop the buffer from the source queue since it is now processed */
+			vbuf = v4l2_m2m_src_buf_remove(sess->m2m_ctx);
+			if (!vbuf) {
+				dev_dbg(dev, "Buffer missing during queue removal\n");
+				break;
+			}
+
+			/* Complete the buffer transaction based on parser results */
+			if (ret < 0)
+				v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
+			else
+				v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
 
-		if (esparser_queue(sess, &buf->vb) < 0)
+			/* Set tracking flag indicating transaction completion */
+			processed_frame = true;
+		}
+
+		if (processed_frame)
 			break;
+
+		/* Give other threads and IRQ routines a window to execute while unlocked */
+		cond_resched();
 	}
-	mutex_unlock(&sess->lock);
 }
 
 int esparser_power_up(struct amvdec_session *sess)
-- 
2.50.1


