Return-Path: <linux-media+bounces-67472-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XqfIFTHWVGpifgAAu9opvQ
	(envelope-from <linux-media+bounces-67472-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 14:12:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4759B74AC8B
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 14:12:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=WCCGJmj+;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67472-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-67472-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B8502301D238
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 12:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8272840683F;
	Mon, 13 Jul 2026 12:09:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98928400E0C
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 12:09:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944567; cv=none; b=FrnCJ4jFEqxd0RPUy9meM0RoldZo5qXZfy3h91Qnaqrck+Ww1oMHNZ4YLm0CXpieCV+uOBN7+a0FTez6nBOdTlyUWS8DiLR5Uj3eege6NvOWxxA7vm5q9ms0Cl4mvkkzYqHVh0Gps1DvigHSoAY+wU1o2daMv5qcRxw+BfIjpmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944567; c=relaxed/simple;
	bh=TtOqSQ0jC946LW7XV7taMYwKwsUHhdUDq21osqmB4CA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nmLCmol6KTLrNXMfMKjBFVjaDhutzCR5mtSC6r2vB/7Itb6qt267rv+apmmnnwzGkObrzcLFQXkrASJGcta/pZOYm+7CfVtmQoSue8JGPHSiVLBV1kPVWjZomQzF7g8YWDjwqeJ5RDBKZ3qCF2NPOTIRAD2hIsTIt0bdohLdF+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCCGJmj+; arc=none smtp.client-ip=209.85.216.53
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so533619a91.0
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 05:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944565; x=1784549365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Pn+IHk1Sk762XTDH7lvSm6CZZGNFHunM58OnD0jYLk=;
        b=WCCGJmj+AH1UNy71cbLmHQ1p35uz6fnVqyVBX2CBKC46whZ2P3mAyFq0zsCNDQ49g7
         hTMTZvAYd+cMPIDhqOwywH4Rtcw83a9Oeek/N+G2b3T/7H3M4IuWQ+rf9RnkI+gYuUs2
         BA3SrixtcALM70dtNFSLJzPsfM9YGkqbTgNjeQdQSuq1WGbyVPzskYho7wfCICABYRnk
         zRO4G0EZz3625QZRY2xbnTFmqDo5PKAqbnlcHDpqKQJ1nUP4aSF74ox7jSu99PJl362t
         lKjNKJ/e97D6ajML4J02YWn+I/lDn3NVfGsUVe31MyLDhWar5F0uRX8Wx5wiaoOQ02mb
         RFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944565; x=1784549365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Pn+IHk1Sk762XTDH7lvSm6CZZGNFHunM58OnD0jYLk=;
        b=sYgoO+Jz50wNPFD2zXdXu226cdyry2dH8ECMw4KawhXjvir8ezlbZkqDO48L2t/PZ/
         S+m33WBZ4zHgVo3aaIqJYgh+LTUlR5amN4rP86qVqyu4uKh+SY0ZVEVqUCq2pe3e1qOb
         DoJTt5/UVdiIbkg7zNRaIrojeX0LXfkVyHZ8ROAyqEXB56EqdLwWjS733dvtnVWT7ppm
         5Wx4PMLQOPljd3oqER8sPNgMlxSwnsCau75edQV1zSzc065iViOYQmfjdrrJY688M8Cs
         IXlw/JvUUpqXbXAYA7o/9pW/J4C0AX3DQzMRBY/62D3HOfFztp8OWCEh6Vcv/wC+Rwkh
         j4qA==
X-Forwarded-Encrypted: i=1; AHgh+RrLCQhXGWJYKRlD3kTK23czOmx0MggKSZvOzl8d+ajQ1CJgwcsZYr9hjVoWgjJNsU8zXf2kMLstucxoXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzicj0yRy5TIkO33EZ25E8U7xZ3vd22ckj8hMAutTLqJFs84x09
	+5T7s6rnBbteKB/hlxJzals3RoKPXUJjueSd6Oi1cXWzSSDYjtjFISAQ
X-Gm-Gg: AfdE7cmmXvvEoCOj2E9++w9yPLPhhJEggFcgicVU/S5QT5ldNrxH4T7bphNQa0/mLQv
	PQ8PpcqRFOg01dR1UXugrIoy0DCPMz8f3xLFhgikmYGBN2Lx2gEaREnBTJf7GuIFcwDXooCt6Wb
	qR+kko8DFOk9NX6msEF66pH5T8Neiwm9M2+5tkSnXRcaG42oKbel4yaMfVjGF/9o4CbclNaf6po
	j450lT7zv+VVtU0Fjh9dlTKstXFjYvNUZ1lT4E+Hyd5vTkOMxbaG6MOtFlOEkkm6V2PW5XlK5Sb
	rYVdEVuccb+eLQY17Nffuyh1xPQ23hy3+kHsjfmURPQGLGDGfhHAP/0CBS0Mw3Mj0fO4gDpqV2v
	ZbHDIMwSdtFMdguOH+t6jRtLXsooYR/wKjOK+7fpuXHoJ6Xjl+jHp1mi2jjFDa/SpE/v/c5ZFZ3
	RgI88zjn06zdLFT7o38Rww
X-Received: by 2002:a17:90b:2884:b0:387:e0db:bc22 with SMTP id 98e67ed59e1d1-38dc77b3846mr9100073a91.34.1783944564932;
        Mon, 13 Jul 2026 05:09:24 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:09:24 -0700 (PDT)
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
Subject: [PATCH v7 03/19] media: meson: vdec: Fix lifecycle leaks and race conditions in recycle_thread
Date: Mon, 13 Jul 2026 17:36:58 +0530
Message-ID: <20260713120840.17427-4-linux.amoon@gmail.com>
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
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-67472-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ndufresne.ca:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4759B74AC8B

Validate the return status of kthread_run() during decoder recycling
thread initialization to prevent memory leaks, and enforce robust state
checking before invoking kthread_stop() to prevent kernel panics.

If the system operates under severe memory constraints, the previous
implementation silently accepted error pointers returned by a failed
kthread_run() operation. Attempting to pass these invalid error pointers
downstream to kthread_stop() during streaming stop or application
teardown routines triggered instant kernel panics.

Furthermore, when thread initialization failed, the lack of an explicit
unwinding path leaked the session's private context (sess->priv) and its
associated firmware memory block allocations. Because sess->status was
never transitioned to STATUS_INIT, any subsequent call to stop streaming
or close the driver file node failed its state validation checks,
permanently orphaning active platform DMA assets and codec parameters.

Fix these thread lifetime and memory leak bugs via the following:

1. In vdec_start_streaming(), add an explicit IS_ERR() verification
   barrier immediately following the recycling kthread launch. If thread
   creation fails, capture the error code via PTR_ERR(), clear the
   dangling pointer tracking entry to NULL, and jump to a newly added
   'err_poweroff' label to unwind hardware settings and clear out
   allocated structural components cleanly.

2. In vdec_stop_streaming(), protect the teardown execution track by
   wrapping the kthread_stop() invocation inside a safe !IS_ERR_OR_NULL()
   conditional block to ensure the target thread structure actually exists
   in system memory before stopping it.

3. In vdec_close(), cleanly wind down and terminate any lingering
   recycling threads at the absolute entry boundary of the routine
   before flushing data framework contexts and releasing the file
   descriptor matrices to user space.

Together, these changes ensure predictable driver behavior, prevent
kernel panics during low-memory conditions, and guarantee that memory
and DMA assets are fully reclaimed during teardown.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 48 +++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index d1f35fc893de1..7fc73d5cdebbf 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -32,6 +32,10 @@ struct dummy_buf {
 /* 16 MiB for parsed bitstream swap exchange */
 #define SIZE_VIFIFO SZ_16M
 
+static void vdec_free_canvas(struct amvdec_session *sess);
+static void vdec_reset_timestamps(struct amvdec_session *sess);
+static void vdec_reset_bufs_recycle(struct amvdec_session *sess);
+
 static u32 get_output_size(u32 width, u32 height)
 {
 	return ALIGN(width * height, SZ_64K);
@@ -353,13 +357,23 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	sess->sequence_cap = 0;
 	sess->sequence_out = 0;
 
-	if (vdec_codec_needs_recycle(sess))
+	if (vdec_codec_needs_recycle(sess) && !sess->recycle_thread) {
 		sess->recycle_thread = kthread_run(vdec_recycle_thread, sess,
 						   "vdec_recycle");
-
+		if (IS_ERR(sess->recycle_thread)) {
+			ret = PTR_ERR(sess->recycle_thread);
+			sess->recycle_thread = NULL;
+			goto err_poweroff;
+		}
+	}
 	schedule_work(&sess->esparser_queue_work);
 	return 0;
 
+err_poweroff:
+	vdec_poweroff(sess);
+	vdec_free_canvas(sess);
+	vdec_reset_timestamps(sess);
+	vdec_reset_bufs_recycle(sess);
 err_free_vififo:
 	if (sess->vififo_vaddr) {
 		dma_free_coherent(sess->core->dev, sess->vififo_size,
@@ -464,7 +478,10 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 	if (full_cleanup) {
 		if ((q->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
 		     !sess->streamon_out) && vdec_codec_needs_recycle(sess)) {
-			kthread_stop(sess->recycle_thread);
+			if (!IS_ERR_OR_NULL(sess->recycle_thread)) {
+				kthread_stop(sess->recycle_thread);
+				sess->recycle_thread = NULL;
+			}
 		}
 
 		vdec_poweroff(sess);
@@ -970,6 +987,31 @@ static int vdec_open(struct file *file)
 static int vdec_close(struct file *file)
 {
 	struct amvdec_session *sess = file_to_amvdec_session(file);
+	struct amvdec_core *core = sess->core;
+
+	if (!IS_ERR_OR_NULL(sess->recycle_thread)) {
+		kthread_stop(sess->recycle_thread);
+		sess->recycle_thread = NULL;
+	}
+
+	mutex_lock(&core->lock);
+
+	vdec_poweroff(sess);
+	vdec_free_canvas(sess);
+	core->cur_sess = NULL;
+
+	if (sess->vififo_vaddr) {
+		dma_free_coherent(core->dev, sess->vififo_size,
+				  sess->vififo_vaddr, sess->vififo_paddr);
+		sess->vififo_vaddr = NULL;
+		sess->vififo_paddr = 0;
+	}
+	vdec_reset_timestamps(sess);
+	vdec_reset_bufs_recycle(sess);
+	kfree(sess->priv);
+	sess->priv = NULL;
+
+	mutex_unlock(&core->lock);
 
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
 	v4l2_fh_del(&sess->fh, file);
-- 
2.50.1


