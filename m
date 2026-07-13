Return-Path: <linux-media+bounces-67473-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Nn6BMcvWVGqOfgAAu9opvQ
	(envelope-from <linux-media+bounces-67473-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 14:15:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EA374AD0D
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 14:15:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=G5rMzgOs;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67473-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67473-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E3BFF300B3DC
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 12:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CAD24071E0;
	Mon, 13 Jul 2026 12:09:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84997403EA0
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 12:09:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944578; cv=none; b=hJ9kqqNUx4jighnbPZnsVT2nfuYqXERb+B9gT6Dt+HqXYeGyJvLtiTQZpPVWBPnAmPEKRY3oZuxdcCr+rNjZ6AZjSuHHmh+Na4gITRaWF/sjtNSFrBqs14vjisms3TpGVwsSX6kLnnAGhf2dEMPA7796X4HA9z/p6e7yz+LDIE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944578; c=relaxed/simple;
	bh=w1FVvyBSHnItHZLCaA4u0+0Ud64qWBuiALT5aaHxYAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UmlFcwMg21QrZ+yffGC7lmDOKvzOCHfSXd/XNTE0f3nZA6X2LDABSd0ozu3FuG38CKUZ/a4BHvCQSWPviMvZZbIc3okGeK3CoeIdvwHI4Qn2Ex0LXPRxLjeuCEUf8csVRzJWgGD3/8sIHTMCVv6N9azU2QHInz8d6gMAJJHLbcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5rMzgOs; arc=none smtp.client-ip=209.85.216.44
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso3934067a91.1
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 05:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944576; x=1784549376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3WTyPeomnpShciKNumkAzLHLjjvlL0zze6H3PBXARM=;
        b=G5rMzgOsTZIMBe8X91OXIqp31fowVMYh5+W+8NhYy1XVDf8MXAX3kWUPM0moLCDMcI
         7rrbKW+GSnQfJJUihaMphg4Xf9iYcI0vUx77cYVEe8MltMX0HNLr4uIHDjDF8DQGV6Vz
         vm1go7g8AfsZzt3aFhZkerO8DzVgj5On9MD7fGj6G95mwyDaCXZIqDLEJ4lqqaraerfz
         7CP3RPyB+GIaTORt+rwiGS2VzFF7bmEq66OCSPyEQO94AVmjmGfTvhgtm9i11XVJLF2+
         IPjsZy9Hdfd5WrIzBdjg9+HLSfL3hAQ6ncZeOqWIcDNDXGOLZrtTL6KoALfWt8YHCRA+
         H1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944576; x=1784549376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K3WTyPeomnpShciKNumkAzLHLjjvlL0zze6H3PBXARM=;
        b=S7lFVGoCru3QzJ6rCJHSHA7m7g86iR0IkOWw8/UVaOWKiikDW85+eoE9S7h4lfP5P4
         2VMcfW7ErMnmJof+SdemVZt1l/sFRWdnfhA30mz+hmtBeDUL8crQ8J5OYRRgLwpUJOPu
         LSLZ7okupPkBO0YOoNV4xqP2chIm7PY8zJLihli4UqFGKRhI1tF3dH/rMSsvd3T76yh9
         k3SX/HXt5yl+LdQcHckIvNKuBTp5+2ePjtE4Ehybb7mbk+WwQWDL8ZWFlC2MeyOYcDL9
         bwpB8pX7awiyGciK7unNyQVWAdaX2lJ9PPtYEzUfSHbjsvKN202ZF33VrT4mYjz522sP
         2KXA==
X-Forwarded-Encrypted: i=1; AHgh+Rqp9Q8TFNC7FSsTG4YZnzLFiTqfx0GEGEzqGCCIjMR7ZjGH0k2hsQpGwSVMDKQJw65ad9XEPM3iCd4v3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKPBVCiiaV6EbbLQdCHq5cw3T6ZXcTS1CtXp+i/9KIYqSkKxAX
	/B2lrvCSxziRGhzeiRysJLnE7dxK0Iem9TNEJedlBUuG1mrQ/DrmuYd1
X-Gm-Gg: AfdE7clT0V8qgwF5OPssUA8HwSz/XbXKnp8cD3nik6u33dkou5wowMkrM0LQvhNhQiq
	Ew7Yrn4Iim5MPNY9rrenad3Ak85tKJU+bDwYisC+MH3Ppxwq1OX4VDDzFSc7+YqVk4BLyiXJLE1
	dnWFUH53SWPcd9wmm0ekqQRAp9IhPZJoVwlZ9CJEduVhhN1x17Mvlj1NIdXNkBs2Q/+xDydbFka
	0OCqIwWsra+vNF3DoI2WSXX3YvIvwQSQi5H7rAg59e0WNTgP7/bO3To1DZCTKNiJWxBUgZYvWA7
	IYlq5P1P3WS+ubE7sLXNS7zljVoINmqdHKWgozRgdJ+rGZTGlckl785+9kbwG0Kph0hV7Fu4Lxy
	1prJ3c7kA3Jzu7jktstT+EPva3Ijf+xpRYwwRTdH9SyepNPeRNXdeFRFHL0MYc3HceUX2G0jets
	THgDags676xw==
X-Received: by 2002:a17:90b:2248:b0:387:e0db:3fae with SMTP id 98e67ed59e1d1-38dc7779d32mr8371305a91.39.1783944575701;
        Mon, 13 Jul 2026 05:09:35 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:09:34 -0700 (PDT)
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
Subject: [PATCH v7 04/19] media: meson: vdec: Fix use-after-free race between teardown and ISR routines
Date: Mon, 13 Jul 2026 17:36:59 +0530
Message-ID: <20260713120840.17427-5-linux.amoon@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-67473-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne.ca:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0sec.ai:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 57EA374AD0D

Prevent critical race conditions and null pointer dereferences inside
the Amlogic video decoder driver by synchronizing the interrupt service
routines during session teardown and file descriptor release phases.

The hardware interrupt handler (vdec_isr) and threaded handler
(vdec_threaded_isr) read 'core->cur_sess' without proper synchronization.
During a streaming teardown sequence via vdec_stop_streaming() or session
release inside vdec_close(), the underlying session structures can be
modified or freed concurrently. This creates a transient window where a
late-stage hardware interrupt can wake up, read 'core->cur_sess', and
dereference an invalid or NULL session pointer, causing a kernel panic.

Update both the hard and threaded interrupt service routines to capture
the current session reference using an smp_load_acquire() barrier snapshot.
If the snapshot resolves to NULL, terminate immediately with IRQ_HANDLED
to guarantee execution contexts do not process stale structures.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Suggested-by: Druk Tan Ozturk <doruk@0sec.ai>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 22 ++++++++++++++++++++--
 drivers/staging/media/meson/vdec/vdec.h |  2 ++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 7fc73d5cdebbf..7ae3d5a9dd6ab 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -484,6 +484,9 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 			}
 		}
 
+		/* Synchronize and flush pending hardware interrupt service routines */
+		synchronize_irq(core->vdec_irq);
+
 		vdec_poweroff(sess);
 		vdec_free_canvas(sess);
 
@@ -989,6 +992,9 @@ static int vdec_close(struct file *file)
 	struct amvdec_session *sess = file_to_amvdec_session(file);
 	struct amvdec_core *core = sess->core;
 
+	/* Synchronize and flush pending hardware interrupt service routines */
+	synchronize_irq(core->vdec_irq);
+
 	if (!IS_ERR_OR_NULL(sess->recycle_thread)) {
 		kthread_stop(sess->recycle_thread);
 		sess->recycle_thread = NULL;
@@ -1038,7 +1044,12 @@ static const struct v4l2_file_operations vdec_fops = {
 static irqreturn_t vdec_isr(int irq, void *data)
 {
 	struct amvdec_core *core = data;
-	struct amvdec_session *sess = core->cur_sess;
+	struct amvdec_session *sess;
+
+	/* Secure an atomic acquire snapshot to protect against concurrent teardown */
+	sess = smp_load_acquire(&core->cur_sess);
+	if (!sess)
+		return IRQ_HANDLED;
 
 	sess->last_irq_jiffies = get_jiffies_64();
 
@@ -1048,7 +1059,12 @@ static irqreturn_t vdec_isr(int irq, void *data)
 static irqreturn_t vdec_threaded_isr(int irq, void *data)
 {
 	struct amvdec_core *core = data;
-	struct amvdec_session *sess = core->cur_sess;
+	struct amvdec_session *sess;
+
+	/* Prevent late-stage threaded interrupts from dereferencing a NULL session */
+	sess = smp_load_acquire(&core->cur_sess);
+	if (!sess)
+		return IRQ_HANDLED;
 
 	return sess->fmt_out->codec_ops->threaded_isr(sess);
 }
@@ -1136,6 +1152,8 @@ static int vdec_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	core->vdec_irq = irq;
+
 	ret = devm_request_threaded_irq(core->dev, irq, vdec_isr,
 					vdec_threaded_isr, IRQF_ONESHOT,
 					"vdec", core);
diff --git a/drivers/staging/media/meson/vdec/vdec.h b/drivers/staging/media/meson/vdec/vdec.h
index cc0cfafb8a951..d165c343fd022 100644
--- a/drivers/staging/media/meson/vdec/vdec.h
+++ b/drivers/staging/media/meson/vdec/vdec.h
@@ -67,6 +67,7 @@ struct amvdec_session;
  * @v4l2_dev: v4l2 device
  * @cur_sess: current decoding session
  * @lock: video device lock
+ * @vdec_irq: irq for video decoding
  */
 struct amvdec_core {
 	void __iomem *dos_base;
@@ -93,6 +94,7 @@ struct amvdec_core {
 
 	struct amvdec_session *cur_sess;
 	struct mutex lock;
+	int vdec_irq;
 };
 
 /**
-- 
2.50.1


