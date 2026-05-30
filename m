Return-Path: <linux-media+bounces-63103-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wE7UJnaxGmoH7ggAu9opvQ
	(envelope-from <linux-media+bounces-63103-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 11:44:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1552860BED7
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 11:44:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDDE3303075E
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 09:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355D339B958;
	Sat, 30 May 2026 09:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="byffR4+2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4662137B014
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 09:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780134253; cv=none; b=eS++XVhth04bs5dmWQAgegd1JmvnVj/iYaETF1Y7e2XoCG1xi5ics+/M9ilLK479cmoyUDquPEBN+i5/fazJWm9011EdAJd6xn2alpKmclsdAxd6YpjVWwgPRIc4O7/b6R+yBJNH7e2CR/yrFYw7QA4ForiZKOlIXUqcR1Ru9RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780134253; c=relaxed/simple;
	bh=HYi1dtSNwzPp1FXVv49GKGwG1ZIMD4+G6LyXrGDm/rw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iJqTebfYaJ6ETLkaN9jJaorvByHwemkaKRRnFJPk3OVFo5tytGfy+3eNU3MHeSoU2ZLNkFkpyxE3aqJJPJYyCvmS36JBtxSc2q2ei7tjbttbVEbP7FivQcBMSINbATotOq5quG0e918YNKe1XlcbLX5w9b1ZXHuvLs9WIkuRkl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=byffR4+2; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36bb3551f6eso1626232a91.1
        for <linux-media@vger.kernel.org>; Sat, 30 May 2026 02:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134250; x=1780739050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOGv5iwSngrj41XE+piVh0d8DY2B1AD5Rx86ecpnAxY=;
        b=byffR4+2rGbHlikIOuweFyEuI0iJ0feUTL/vvPSwgaSyAGgr4L+tLcpYdaVGZ2unfc
         4P4sC3yORjnDO2DeMSjeM0cvOsOGU8pTJ8RmY2MGZzJk+rnFjl0oUFcjyvFSUTNKbiIk
         /AzqPwtR7xIEkGjgJjm+CGTCBL3GjbxSJvfzLMAmyY5Z6kj9BH/nQQHLvgvBuJ/wozXv
         kFaaXBE2GjWe7LpUG8BbmOdztmq6JiYbhWsJMl6vY58OKI4Bt1ZWBkD2NWxcz5chUA9W
         40kzUZtzvPUD/U3Mdknf/A/+baq9ECYwlFzdpRYKTNRAbBttMB+ob1jSDI5fowooFUWa
         DOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134250; x=1780739050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MOGv5iwSngrj41XE+piVh0d8DY2B1AD5Rx86ecpnAxY=;
        b=Zwey1YRpRUQMbcAAL1Dpk3hCPOf0mnKBeDkdcFcTIL5PgNJ5WCKQxuCxgDNRMfkGaE
         W6wz5HiJJikyAw5eoHvGhYvqFFZkx0uOPPXB+bylcs1t5FWCKXYFABjqj0xaf7waRR2O
         UeKPk5+hNmUYEYDy9w2s7PoUmJzqg+gpw3Dc6tUlZeGT5ISVAa2QsEhFclnHgxYhYyKQ
         1YZKTyUeIEeNcLk8sVbAerMfRNUpPrXCYAG81Q3sfbtJGoRhSyYTZOqQfJDs8hHQjv5l
         pxcIN4aJb0Hhj1ihm/Bs3CmzHIzBUFRUZzL032/hAHWeHnMiKCTOwxR70zHPLbErvFQq
         Hzkw==
X-Forwarded-Encrypted: i=1; AFNElJ8E6Hhr/8Obh/mHBn4rTDEK1tsGrSOfxbbQiUshJrwnK/8ML2Hrp0jejfMCSGEonX5xS2/jcC14Sbcm2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0+FYmRti84BlqVdbRDjhG4DU5no5Gv1twMIZorK2D36aruz0y
	kSvzKYEktG0AaCFnysHSb25nmKgvZaPZclfKzYb+GJXllTlbUu7rvoWl
X-Gm-Gg: Acq92OFeQBXUwMWpSfvXchYHUdlqN0OCxN+WdkyCOAsINbZSXx99bSmp1i1UZncMK89
	alRmBmQCjt9z0YZGerZXAYCMGapIOkArZSASb23bu05wAB3VdCuM2D/vVJeEOq6SwC8LYkBL+ZK
	+Ea3dTHckBR5jqc77tKcmGOg+YYL6mnAT459DQmSSzAMvH2a5S7l/U+A6a28aBN5YK/qNXGQobg
	nN3MeU7fNjeA1xk/anK3A9WIG6rCF/B9C12bsywIZ0lFD/IG2wQbJgPv8ZUmOwID+dUf1qm22jJ
	lvNODsdJ1qW6i1yDsohwlJQj00/+SWSRgyIW/5jtoW+OYubIr+u+aUU8PX4Aipbf0AKrsGQVRU6
	y7FJJfvA+5Df0KySem4gC8chWnyQXsDcohxCZDgBVLQHCZLkUHTw1Xa0RUhR7a0zKiKkFIRwkgq
	rz4nb/bGv7Y9VJQJOQwaIbuRxIJLXf+iM=
X-Received: by 2002:a17:903:a8f:b0:2b0:7531:b61e with SMTP id d9443c01a7336-2bf36889991mr42155535ad.41.1780134250482;
        Sat, 30 May 2026 02:44:10 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm61529945ad.10.2026.05.30.02.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 02:44:09 -0700 (PDT)
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
Subject: [PATCH v6 1/8] media: meson: vdec: Fix memory leaks and lifetime of m2m device
Date: Sat, 30 May 2026 15:12:47 +0530
Message-ID: <20260530094326.11892-2-linux.amoon@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-63103-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ndufresne.ca,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,baylibre.com,googlemail.com,linuxfoundation.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1552860BED7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The driver was initializing the v4l2 m2m device instance per-session
within vdec_open() and releasing it inside vdec_close(). This approach
is faulty because the m2m device represents the hardware context and
should persist across multiple open sessions.

Fix this design flaw by shifting v4l2_m2m_init() to vdec_probe() and
v4l2_m2m_release() to vdec_remove(). Correspondingly, move the m2m_dev
pointer from struct amvdec_session to struct amvdec_core.

Additionally, this patch addresses two critical resource leaks:
1. Adds a missing v4l2_ctrl_handler_free() in vdec_close() to clean up
   allocated control handlers upon session closure.
2. Introduces proper unwinding logic via a new 'err_fh_del' label in
   vdec_open() to ensure that file handles (v4l2_fh) are fully deregistered
   if subsequent session resource allocations fail.

This was identified via kmemleak:
unreferenced object 0xffff0000205d6878 (size 8):
  comm "v4l_id", pid 5289, jiffies 4294938580
  hex dump (first 8 bytes):
    40 d2 49 18 00 00 ff ff                          @.I.....
  backtrace (crc d3204599):
    kmemleak_alloc+0xc8/0xf0
    __kvmalloc_node_noprof+0x60c/0x850
    v4l2_ctrl_handler_init_class+0x1b4/0x2e8 [videodev]
    vdec_open+0x1f4/0x788 [meson_vdec]
    v4l2_open+0x144/0x460 [videodev]
    chrdev_open+0x1ac/0x500
    do_dentry_open+0x3f0/0xfe8
    vfs_open+0x68/0x320
    do_open+0x2d8/0x9a8
    path_openat+0x1d0/0x4f0
    do_filp_open+0x190/0x380
    do_sys_openat2+0xf8/0x1b0
    __arm64_sys_openat+0x13c/0x1e8
    invoke_syscall+0xdc/0x268
    el0_svc_common.constprop.0+0x178/0x258
    do_el0_svc+0x4c/0x70

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260520045905.6ACBA1F000E9@smtp.kernel.org/#t
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 33 ++++++++++++++-----------
 drivers/staging/media/meson/vdec/vdec.h |  4 +--
 2 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4b77ec1af5a7..4ffebba2341d 100644
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
+		goto err_fh_del;
 	}
 
 	ret = vdec_init_ctrls(sess);
 	if (ret)
-		goto err_m2m_release;
+		goto err_free_sess;
 
 	sess->pixfmt_cap = formats[0].pixfmts_cap[0];
 	sess->fmt_out = &formats[0];
@@ -913,8 +906,8 @@ static int vdec_open(struct file *file)
 
 	return 0;
 
-err_m2m_release:
-	v4l2_m2m_release(sess->m2m_dev);
+err_fh_del:
+	v4l2_fh_exit(&sess->fh);
 err_free_sess:
 	kfree(sess);
 	return ret;
@@ -925,9 +918,9 @@ static int vdec_close(struct file *file)
 	struct amvdec_session *sess = file_to_amvdec_session(file);
 
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
-	v4l2_m2m_release(sess->m2m_dev);
 	v4l2_fh_del(&sess->fh, file);
 	v4l2_fh_exit(&sess->fh);
+	v4l2_ctrl_handler_free(&sess->ctrl_handler);
 
 	mutex_destroy(&sess->lock);
 	mutex_destroy(&sess->bufs_recycle_lock);
@@ -1057,10 +1050,17 @@ static int vdec_probe(struct platform_device *pdev)
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
@@ -1095,6 +1095,8 @@ static int vdec_probe(struct platform_device *pdev)
 err_vdev_release:
 	video_device_release(vdev);
 	v4l2_device_unregister(&core->v4l2_dev);
+err_m2m_release:
+	v4l2_m2m_release(core->m2m_dev);
 	return ret;
 }
 
@@ -1104,6 +1106,7 @@ static void vdec_remove(struct platform_device *pdev)
 
 	video_unregister_device(core->vdev_dec);
 	v4l2_device_unregister(&core->v4l2_dev);
+	v4l2_m2m_release(core->m2m_dev);
 }
 
 static struct platform_driver meson_vdec_driver = {
diff --git a/drivers/staging/media/meson/vdec/vdec.h b/drivers/staging/media/meson/vdec/vdec.h
index 7a5d8e871d70..cc0cfafb8a95 100644
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


