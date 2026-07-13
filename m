Return-Path: <linux-media+bounces-67470-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3UhZGb3WVGqFfgAAu9opvQ
	(envelope-from <linux-media+bounces-67470-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 14:14:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B303C74ACE7
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 14:14:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=lwh7FtS4;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67470-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67470-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADDA830EBB82
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 12:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B63140680F;
	Mon, 13 Jul 2026 12:09:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538913F482A
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 12:09:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944544; cv=none; b=aBsT2tg2cgbNJU+8Z8jXRYbtl1Ih4UFxwCMxPJDDQ/h8ruNCkQRhdGAZI1kf5pHaWW0sjODC5FTMnI4+L0AZ4D6eJLTyfiQk5FTSwAhBnVgV6BJqbqsaPvUx6gS89+wPsdn+O9i2L+/16VQioE8WwWiPiCwSl1F6rtBre7/E5tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944544; c=relaxed/simple;
	bh=cl53inObwN0kZLnRPY3uNUdKQLoT80ggd4q5F9Ek/xc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=avmX5be5QBWW7ogeLyiJja1hlg/0v5qp2vXidUHeMwI8e5iVgF+40ODzNBOlY6nvjpa3mP6aFfKxqmuAww3hvAO53JIJgoFXbEsaahYZvAfjEv+pnC0hHqVXnLHZDtaFqXI63A/ocN406Pq3cgv67W2yUGNM9bzBknfSVydJdF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lwh7FtS4; arc=none smtp.client-ip=209.85.216.51
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso2388226a91.1
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 05:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944543; x=1784549343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ARrER7TwdRrsnOsOCnXp0K3Qc6DycIa1Bph8QCPIN4s=;
        b=lwh7FtS4MKKS5Ar5VP37XNnQrWU2tumbNNZttckGP63JEYxbpgBOgWoqtt/mjmVkB5
         lJ9ELshh/dO12kUCcllOChR7/SJZQIXyi5S2DWvAw9lLmDdd4oCz5n9UOJvY8iR3FFfS
         Su86cEtZwIAv/D0QLTbc21z/wem7iOIdem8TyByXkWGq70YTdMeJYJNfTDY7FIsStApg
         z64aaV5cAbHL2pRNsfQnv+3yzc5H97moeeNUi17rqfNn4B1SGKxwpo9p78TkGrErYzz7
         pVWU94Ekb20VbPbMwBssHH2YYgqhB6bkQNzAnw49xXSJaGUqycKjmGoYXnrr59jfP9Ue
         JgrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944543; x=1784549343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ARrER7TwdRrsnOsOCnXp0K3Qc6DycIa1Bph8QCPIN4s=;
        b=EoFq2u542nwneyv1F8dHTewj5tPA6dapc+DvCrJExas6kbs56XsmMTcxVKkLsppPa2
         URcWrEyE8xy7Mi4htTw4xHJx4a4P9VYLH0kQdxrIVeLGSC9T8MATDX6SvNYw/tg/N4jh
         W+/Kyee7L6bSqUw4k/IFvU+XZd8ZzIgsxsGgFpj55zTJBTIEkwMgGqSm31O6+I6tvbbJ
         kAFDrjFm9b4l7t13eTPpM42dM6qHPUUb6fcX+HvCYPAiX9NsZ9CiEZSZpLln3wH6r9g4
         oMY467cvYxtRcNkFUBDVIkKT/c2aNIqHuOSKnVch8tcvv7pXO1Jp/bBRCgPQgj4SherY
         bAdQ==
X-Forwarded-Encrypted: i=1; AHgh+RrB2kfnpRDBSm/FtanYgKYReY3mkmyougFcnyaI6jlTWJaH2DGDo7/So8M3RTs0n6CGjMxqXObCXeGbAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9o65CIB6zH1X0pPFTEnd9RZeQKJkmIC0wsB4E7ivs/HTmNCV5
	HQQGGDCLk/AEjThslAD6NOm5bhaiaBVFaAT0wTjpZPRu9eVwZ7Mx36pf
X-Gm-Gg: AfdE7cnY6A4V4M5nVxoLtBNF+ttXTo25l+vyh2QQ0kGYgDqbyFAlP22+nnh7JOErN7+
	lkmA4qPnDtP4cELHT6Coqq559HcPL5XoVEbG5gQg3bPoESZDZQ3s525GtB51wLoo3mxTSRqvBCT
	SK3XRJrPYVJWKrSzspRz1CLZNA0agaszfNysG1ibVUioCSbJkofhvTMqviHd9hKJmuha667Fecv
	dSD9byYyfkB330FV4xm8Ul9z7VfcJgn3x9DpfbwgWMmsDzYDIH8eVwue75iqY8uH4+cKE2NQJDG
	gz4PF+WCphls4c0IELzY93olHjVoMnZvqQjtdH1oi9muPSiINtqstjw2p7vTHrZbqMiSgWSJiob
	2q+5C6e6Idd9apwmde9maVuLTe3nwukA+J07Pd0dOQM0MRzxU1Qk6ULYslQXcUoAwxlI2dmvTmU
	dEXy9R5F1IqA==
X-Received: by 2002:a17:90b:2750:b0:37c:18e0:90dc with SMTP id 98e67ed59e1d1-38dc75ebea3mr8633908a91.16.1783944542617;
        Mon, 13 Jul 2026 05:09:02 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:09:01 -0700 (PDT)
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
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v7 01/19] media: meson: vdec: Fix m2m device lifetime and cleanup path
Date: Mon, 13 Jul 2026 17:36:56 +0530
Message-ID: <20260713120840.17427-2-linux.amoon@gmail.com>
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
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-67470-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:dri-devel@lists.freedesktop.org,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux.amoon@gmail.com,m:doruk@0sec.ai,m:sashiko-bot@kernel.org,m:martinblumenstingl@gmail.com,m:linuxamoon@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,baylibre.com,googlemail.com,linuxfoundation.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,0sec.ai,kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B303C74ACE7

The vdec driver was incorrectly initializing a new v4l2_m2m device
instance per session inside vdec_open() and releasing it in vdec_close().
This design is faulty because the m2m device models the core hardware
engine and must persist across multiple sessions.

Fix the lifetime by moving v4l2_m2m_init() into vdec_probe() and
releasing it in vdec_remove() which resolves passing the global
core->m2m_dev down to session contexts so all sessions share the
same hardware instance.

This change aligns the driver with proper v4l2_m2m usage, ensuring
the hardware device lifetime is tied to the platform driver core,
not individual sessions, and making teardown safe and predictable.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260520045905.6ACBA1F000E9@smtp.kernel.org/#t
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 36 +++++++++++++------------
 drivers/staging/media/meson/vdec/vdec.h |  4 +--
 2 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index a039d925c0fe5..6ae3471155a87 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -153,7 +153,7 @@ static void vdec_m2m_job_abort(void *priv)
 {
 	struct amvdec_session *sess = priv;
 
-	v4l2_m2m_job_finish(sess->m2m_dev, sess->m2m_ctx);
+	v4l2_m2m_job_finish(sess->core->m2m_dev, sess->m2m_ctx);
 }
 
 static const struct v4l2_m2m_ops vdec_m2m_ops = {
@@ -873,23 +873,16 @@ static int vdec_open(struct file *file)
 
 	sess->core = core;
 
-	sess->m2m_dev = v4l2_m2m_init(&vdec_m2m_ops);
-	if (IS_ERR(sess->m2m_dev)) {
-		dev_err(dev, "Fail to v4l2_m2m_init\n");
-		ret = PTR_ERR(sess->m2m_dev);
-		goto err_free_sess;
-	}
-
-	sess->m2m_ctx = v4l2_m2m_ctx_init(sess->m2m_dev, sess, m2m_queue_init);
+	sess->m2m_ctx = v4l2_m2m_ctx_init(core->m2m_dev, sess, m2m_queue_init);
 	if (IS_ERR(sess->m2m_ctx)) {
 		dev_err(dev, "Fail to v4l2_m2m_ctx_init\n");
 		ret = PTR_ERR(sess->m2m_ctx);
-		goto err_m2m_release;
+		goto err_free_sess;
 	}
 
 	ret = vdec_init_ctrls(sess);
 	if (ret)
-		goto err_m2m_ctx_release;
+		goto err_release_ctx;
 
 	sess->pixfmt_cap = formats[0].pixfmts_cap[0];
 	sess->fmt_out = &formats[0];
@@ -913,10 +906,8 @@ static int vdec_open(struct file *file)
 
 	return 0;
 
-err_m2m_ctx_release:
+err_release_ctx:
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
-err_m2m_release:
-	v4l2_m2m_release(sess->m2m_dev);
 err_free_sess:
 	kfree(sess);
 	return ret;
@@ -927,9 +918,9 @@ static int vdec_close(struct file *file)
 	struct amvdec_session *sess = file_to_amvdec_session(file);
 
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
-	v4l2_m2m_release(sess->m2m_dev);
 	v4l2_fh_del(&sess->fh, file);
 	v4l2_fh_exit(&sess->fh);
+	v4l2_ctrl_handler_free(&sess->ctrl_handler);
 
 	mutex_destroy(&sess->lock);
 	mutex_destroy(&sess->bufs_recycle_lock);
@@ -1059,16 +1050,23 @@ static int vdec_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	core->m2m_dev = v4l2_m2m_init(&vdec_m2m_ops);
+	if (IS_ERR(core->m2m_dev)) {
+		dev_err(dev, "Failed to initialize v4l2 m2m device\n");
+		return PTR_ERR(core->m2m_dev);
+	}
+
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret) {
 		dev_err(dev, "Couldn't register v4l2 device\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_m2m_release;
 	}
 
 	vdev = video_device_alloc();
 	if (!vdev) {
 		ret = -ENOMEM;
-		goto err_vdev_release;
+		goto err_v4l2_unregister;
 	}
 
 	core->vdev_dec = vdev;
@@ -1096,7 +1094,10 @@ static int vdec_probe(struct platform_device *pdev)
 
 err_vdev_release:
 	video_device_release(vdev);
+err_v4l2_unregister:
 	v4l2_device_unregister(&core->v4l2_dev);
+err_m2m_release:
+	v4l2_m2m_release(core->m2m_dev);
 	return ret;
 }
 
@@ -1105,6 +1106,7 @@ static void vdec_remove(struct platform_device *pdev)
 	struct amvdec_core *core = platform_get_drvdata(pdev);
 
 	video_unregister_device(core->vdev_dec);
+	v4l2_m2m_release(core->m2m_dev);
 	v4l2_device_unregister(&core->v4l2_dev);
 }
 
diff --git a/drivers/staging/media/meson/vdec/vdec.h b/drivers/staging/media/meson/vdec/vdec.h
index 7a5d8e871d708..cc0cfafb8a951 100644
--- a/drivers/staging/media/meson/vdec/vdec.h
+++ b/drivers/staging/media/meson/vdec/vdec.h
@@ -63,6 +63,7 @@ struct amvdec_session;
  * @vdec_hevcf_clk: VDEC_HEVCF clock
  * @esparser_reset: RESET for the PARSER
  * @vdev_dec: video device for the decoder
+ * @m2m_dev: v4l2 m2m device
  * @v4l2_dev: v4l2 device
  * @cur_sess: current decoding session
  * @lock: video device lock
@@ -87,6 +88,7 @@ struct amvdec_core {
 	struct reset_control *esparser_reset;
 
 	struct video_device *vdev_dec;
+	struct v4l2_m2m_dev *m2m_dev;
 	struct v4l2_device v4l2_dev;
 
 	struct amvdec_session *cur_sess;
@@ -183,7 +185,6 @@ enum amvdec_status {
  *
  * @core: reference to the vdec core struct
  * @fh: v4l2 file handle
- * @m2m_dev: v4l2 m2m device
  * @m2m_ctx: v4l2 m2m context
  * @ctrl_handler: V4L2 control handler
  * @ctrl_min_buf_capture: V4L2 control V4L2_CID_MIN_BUFFERS_FOR_CAPTURE
@@ -230,7 +231,6 @@ struct amvdec_session {
 	struct amvdec_core *core;
 
 	struct v4l2_fh fh;
-	struct v4l2_m2m_dev *m2m_dev;
 	struct v4l2_m2m_ctx *m2m_ctx;
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct v4l2_ctrl *ctrl_min_buf_capture;
-- 
2.50.1


