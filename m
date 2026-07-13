Return-Path: <linux-media+bounces-67501-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M4/yBHMrVWpRkwAAu9opvQ
	(envelope-from <linux-media+bounces-67501-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 20:16:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA5374E658
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 20:16:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bDGoJv4Q;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67501-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67501-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 07EA73025A4E
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 18:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4880347BA7;
	Mon, 13 Jul 2026 18:16:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8A9274658
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 18:16:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783966570; cv=none; b=c5Kqo5Mhml+FVBU93m1Yjuwlq2WEllZ9FhSnJzaaoItnW3dWrR6vts94juxE6cRnv61ni66aw9kCwEZlS2QIkisDuSlciu7FrRTAI/+dpAQmW8ovhPQdx5sWBuiaXSjSF+5pVPy3knCTSC+zzCoWDkgpgq30vZjmxxTCflZtSIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783966570; c=relaxed/simple;
	bh=gSjk27UngxHFgxLqEz5c9KeEZrWZg/n3SsyZhOlpWs0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SqAqSyViO/BlWs02v5AEFKu/sfMaoEViMVggNvCEjlzgVQ9Ywa164naNFTvAzfrgbZv7EuktyT4zs5hbKLRFMTfM9ojWxg4R1iUU7aEE7s/a0MW19Ra0M9Ch7+szywBvkAcLIMSm1n81HbjtwxH5PjzVtlfaovt+LZ/1/SPsWRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDGoJv4Q; arc=none smtp.client-ip=209.85.216.43
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso3376660a91.2
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 11:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783966566; x=1784571366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z3c/yE/l+w1at/ZT+pvqXlNnRIdMThIY4z+heQB6BsE=;
        b=bDGoJv4QGf8HkVUTPx7BcJ4yk9/chTEMYgr52oYfk4+WQu/9z2kMns706N1olmjgHA
         2Y5T50jJ0Xt1Z54Lc0nCqb1TWkMSqJeFcl4dUHo2bCqmkIUV9L5XSqVbRdSeW1jrZrTz
         pNPLXLdjspcvM7DC2npUIN1gdtSuDfshafRXe9ieZRf6L1HhY/C7BhEKGMotyIC6THoi
         l7WOSYMWOPgarhjh9wQNzoN2bFE1J6R/srOPPD28Tm6rjwTcUaOeYZ+BBDTtbOSZm0sF
         mP0e3nIIjGIHjd3jFunYzg+BrwKnOLckpBGCjlAXwN7EDXGVWKEhzQeJmbTXBMtORgqj
         keoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783966566; x=1784571366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z3c/yE/l+w1at/ZT+pvqXlNnRIdMThIY4z+heQB6BsE=;
        b=Gv8c6nkZTIuYkPUuPj1/8ysmUja9FHCN+i05m1SzXBjWU1kDTZHqTE+fUdxYSdjT90
         KneooBYKF1Nmx2vsUMChFMf/DJZAZUL5SaBlmkmjuEtEMYa8NvX0ArkcDnRvmoM2C3tn
         zSKFdSimAvqpdD9iJ2pldzg79MFnkKbCtBKMcTqO3nivr2HfO0FH7hcoHrTdjM1NI6aO
         VFHGWb7TaIj72/VeKuGSgbI+Hc5ItwDhvpO1kLx4/UdRHlRCufIUD5jsasM2cSvXQgvj
         3d2cpK/SC+EmqMoeyJlfDdeB1q8goX67BKQa8SxtVNgMcJpzxTz5pOecvAS2a/VAenld
         z0Ig==
X-Forwarded-Encrypted: i=1; AHgh+RpioQX+SvNiWs/+efM4Uceu+0WjqRDYC96aGnjcXnUI0Jb6Pi2xRpCPGv9nAUOYm47dWHwKL6lbLdXSYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yycu0nXg7VG0pcnWNCAHKZRtcuKK+ExrDRxJMVSaYZXf7FHXX7J
	9us7aT2MzSfPUF0k905kBLLhsPWQAGCbJf2NgS6aFGrHU+/wJJJYzmBV
X-Gm-Gg: AfdE7cklVqgg41Y82bZc/k3nP5l+7ZhICrlmWVgwloE+600rRCX6GldfHSqrehywTjF
	oQdQZ3XzMfVRXAOiBCAC85WpIg1DvKchD+E7TDNBezOtk3qu+d6sSzBMnuqyRb30gFb0k5MmNfh
	PqokdYmPyy8sc4v+1mv3HkvHpL4z8PB/sK688f1Kd2A4ka/+oluxHPn+ALCYIK8X2UUuuxuQElw
	WK5BnTjiw9Yv2nc+kCT8Qd4K63yLor9y1hOLxaASDuGbV8+NQMVYWBg/bdNyHPuhbOdbX/QcE8/
	zv3xjUfk/201moUTFMSWsegRquKaBdOs7rwOlle6w5fq/h8QpzGiJUpgtdW1TYEvrL8RBOqsDd3
	tLZpBPGyySyC8Kdmz/O6GrOhsRoE4S0QRbBCx9Eo4WVEIL9MIazeeAtPcUflix9bfgHwLai/k8i
	8MTvqmbd03eUTbGT0JigGh907RXE9ZbaurFvdSpvBVqhCtLQO2EEW77WvpMGI9X71qzU1cVilFu
	GVRB3SFOL4lS/OcRsdaQ7b7bXqM1G3QtHD3ZkX0q6BVOA0=
X-Received: by 2002:a17:90b:5102:b0:380:7688:fbe9 with SMTP id 98e67ed59e1d1-38dc74c4c42mr9088514a91.8.1783966566337;
        Mon, 13 Jul 2026 11:16:06 -0700 (PDT)
Received: from OMEN ([103.184.238.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b4b97661sm40154345eec.7.2026.07.13.11.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 11:16:05 -0700 (PDT)
From: Alfie Varghese <alfievarghese22@gmail.com>
To: neil.armstrong@linaro.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Alfie Varghese <alfievarghese22@gmail.com>
Subject: [PATCH v2] staging: media: meson: vdec: fix advanced concurrency and UAF bugs
Date: Mon, 13 Jul 2026 23:46:02 +0530
Message-ID: <20260713181602.773-1-alfievarghese22@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67501-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:alfievarghese22@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alfievarghese22@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alfievarghese22@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,baylibre.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6EA5374E658

This commit fixes several deep concurrency and race condition issues identi=
fied
in the Amlogic video decoder driver:

1. Fix a Use-After-Free window in vdec_close() by moving
   cancel_work_sync(&sess->esparser_queue_work) to execute after the hardwa=
re
   is stopped via v4l2_m2m_ctx_release(), preventing interrupts from re-arm=
ing it.
2. Fix a Use-After-Free relating to v4l2_m2m_release(). The driver incorrec=
tly
   allocated the m2m_dev per-session rather than per-device. Moved the
   m2m_dev allocation to vdec_probe() and cleanup to vdec_remove() to fix
   the structural UAF when background m2m jobs were pending.
3. Fix a TOCTOU race condition in vdec_isr() by adding synchronize_irq()
   in vdec_stop_streaming() after clearing core->cur_sess, ensuring that
   running interrupt handlers finish before freeing session data.
4. Fix a potential NULL/ERR pointer dereference in vdec_start_streaming()
   by checking the return value of kthread_run() and handling errors gracef=
ully.
5. Fix a memory leak in vdec_close() by freeing the session control
   handler via v4l2_ctrl_handler_free().
6. Prevent a potential NULL pointer dereference in vdec_probe() by adding
   a NULL check for of_match_node().

Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c |  52 ++-
 drivers/staging/media/meson/vdec/vdec.h | 586 ++++++++++++------------
 2 files changed, 331 insertions(+), 307 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/medi=
a/meson/vdec/vdec.c
index a039d925c0fe..f57c473da5e1 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -337,9 +337,16 @@ static int vdec_start_streaming(struct vb2_queue *q, u=
nsigned int count)
=20
 	sess->sequence_cap =3D 0;
 	sess->sequence_out =3D 0;
-	if (vdec_codec_needs_recycle(sess))
+	if (vdec_codec_needs_recycle(sess)) {
 		sess->recycle_thread =3D kthread_run(vdec_recycle_thread, sess,
 						   "vdec_recycle");
+		if (IS_ERR(sess->recycle_thread)) {
+			ret =3D PTR_ERR(sess->recycle_thread);
+			sess->recycle_thread =3D NULL;
+			vdec_poweroff(sess);
+			goto vififo_free;
+		}
+	}
=20
 	sess->status =3D STATUS_INIT;
 	core->cur_sess =3D sess;
@@ -404,7 +411,7 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 	    sess->status =3D=3D STATUS_INIT ||
 	    (sess->status =3D=3D STATUS_NEEDS_RESUME &&
 	     (!sess->streamon_out || !sess->streamon_cap))) {
-		if (vdec_codec_needs_recycle(sess))
+		if (vdec_codec_needs_recycle(sess) && sess->recycle_thread)
 			kthread_stop(sess->recycle_thread);
=20
 		vdec_poweroff(sess);
@@ -416,6 +423,7 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 		kfree(sess->priv);
 		sess->priv =3D NULL;
 		core->cur_sess =3D NULL;
+		synchronize_irq(core->irq);
 		sess->status =3D STATUS_STOPPED;
 	}
=20
@@ -873,18 +881,11 @@ static int vdec_open(struct file *file)
=20
 	sess->core =3D core;
=20
-	sess->m2m_dev =3D v4l2_m2m_init(&vdec_m2m_ops);
-	if (IS_ERR(sess->m2m_dev)) {
-		dev_err(dev, "Fail to v4l2_m2m_init\n");
-		ret =3D PTR_ERR(sess->m2m_dev);
-		goto err_free_sess;
-	}
-
-	sess->m2m_ctx =3D v4l2_m2m_ctx_init(sess->m2m_dev, sess, m2m_queue_init);
+	sess->m2m_ctx =3D v4l2_m2m_ctx_init(core->m2m_dev, sess, m2m_queue_init);
 	if (IS_ERR(sess->m2m_ctx)) {
 		dev_err(dev, "Fail to v4l2_m2m_ctx_init\n");
 		ret =3D PTR_ERR(sess->m2m_ctx);
-		goto err_m2m_release;
+		goto err_free_sess;
 	}
=20
 	ret =3D vdec_init_ctrls(sess);
@@ -915,8 +916,6 @@ static int vdec_open(struct file *file)
=20
 err_m2m_ctx_release:
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
-err_m2m_release:
-	v4l2_m2m_release(sess->m2m_dev);
 err_free_sess:
 	kfree(sess);
 	return ret;
@@ -927,10 +926,12 @@ static int vdec_close(struct file *file)
 	struct amvdec_session *sess =3D file_to_amvdec_session(file);
=20
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
-	v4l2_m2m_release(sess->m2m_dev);
+	cancel_work_sync(&sess->esparser_queue_work);
 	v4l2_fh_del(&sess->fh, file);
 	v4l2_fh_exit(&sess->fh);
=20
+	v4l2_ctrl_handler_free(&sess->ctrl_handler);
+
 	mutex_destroy(&sess->lock);
 	mutex_destroy(&sess->bufs_recycle_lock);
=20
@@ -953,6 +954,9 @@ static irqreturn_t vdec_isr(int irq, void *data)
 	struct amvdec_core *core =3D data;
 	struct amvdec_session *sess =3D core->cur_sess;
=20
+	if (!sess)
+		return IRQ_NONE;
+
 	sess->last_irq_jiffies =3D get_jiffies_64();
=20
 	return sess->fmt_out->codec_ops->isr(sess);
@@ -963,6 +967,9 @@ static irqreturn_t vdec_threaded_isr(int irq, void *dat=
a)
 	struct amvdec_core *core =3D data;
 	struct amvdec_session *sess =3D core->cur_sess;
=20
+	if (!sess)
+		return IRQ_NONE;
+
 	return sess->fmt_out->codec_ops->threaded_isr(sess);
 }
=20
@@ -1020,6 +1027,8 @@ static int vdec_probe(struct platform_device *pdev)
 		return PTR_ERR(core->canvas);
=20
 	of_id =3D of_match_node(vdec_dt_match, dev->of_node);
+	if (!of_id)
+		return -ENODEV;
 	core->platform =3D of_id->data;
=20
 	if (core->platform->revision =3D=3D VDEC_REVISION_G12A ||
@@ -1049,6 +1058,8 @@ static int vdec_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
=20
+	core->irq =3D irq;
+
 	ret =3D devm_request_threaded_irq(core->dev, irq, vdec_isr,
 					vdec_threaded_isr, IRQF_ONESHOT,
 					"vdec", core);
@@ -1065,10 +1076,17 @@ static int vdec_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
=20
+	core->m2m_dev =3D v4l2_m2m_init(&vdec_m2m_ops);
+	if (IS_ERR(core->m2m_dev)) {
+		dev_err(dev, "Failed to init v4l2 m2m dev\n");
+		ret =3D PTR_ERR(core->m2m_dev);
+		goto err_v4l2_unreg;
+	}
+
 	vdev =3D video_device_alloc();
 	if (!vdev) {
 		ret =3D -ENOMEM;
-		goto err_vdev_release;
+		goto err_m2m_release;
 	}
=20
 	core->vdev_dec =3D vdev;
@@ -1096,6 +1114,9 @@ static int vdec_probe(struct platform_device *pdev)
=20
 err_vdev_release:
 	video_device_release(vdev);
+err_m2m_release:
+	v4l2_m2m_release(core->m2m_dev);
+err_v4l2_unreg:
 	v4l2_device_unregister(&core->v4l2_dev);
 	return ret;
 }
@@ -1105,6 +1126,7 @@ static void vdec_remove(struct platform_device *pdev)
 	struct amvdec_core *core =3D platform_get_drvdata(pdev);
=20
 	video_unregister_device(core->vdev_dec);
+	v4l2_m2m_release(core->m2m_dev);
 	v4l2_device_unregister(&core->v4l2_dev);
 }
=20
diff --git a/drivers/staging/media/meson/vdec/vdec.h b/drivers/staging/medi=
a/meson/vdec/vdec.h
index 7a5d8e871d70..b2a606e965b4 100644
--- a/drivers/staging/media/meson/vdec/vdec.h
+++ b/drivers/staging/media/meson/vdec/vdec.h
@@ -1,292 +1,294 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * Copyright (C) 2018 BayLibre, SAS
- * Author: Maxime Jourdan <mjourdan@baylibre.com>
- */
-
-#ifndef __MESON_VDEC_CORE_H_
-#define __MESON_VDEC_CORE_H_
-
-#include <linux/irqreturn.h>
-#include <linux/regmap.h>
-#include <linux/list.h>
-#include <media/videobuf2-v4l2.h>
-#include <media/v4l2-ctrls.h>
-#include <media/v4l2-device.h>
-#include <linux/soc/amlogic/meson-canvas.h>
-
-#include "vdec_platform.h"
-
-/* 32 buffers in 3-plane YUV420 */
-#define MAX_CANVAS (32 * 3)
-
-struct amvdec_buffer {
-	struct list_head list;
-	struct vb2_buffer *vb;
-};
-
-/**
- * struct amvdec_timestamp - stores a src timestamp along with a VIFIFO of=
fset
- *
- * @list: used to make lists out of this struct
- * @tc: timecode from the v4l2 buffer
- * @ts: timestamp from the VB2 buffer
- * @offset: offset in the VIFIFO where the associated packet was written
- * @flags: flags from the v4l2 buffer
- * @used_count: times this timestamp was checked for a match with a dst bu=
ffer
- */
-struct amvdec_timestamp {
-	struct list_head list;
-	struct v4l2_timecode tc;
-	u64 ts;
-	u32 offset;
-	u32 flags;
-	u32 used_count;
-};
-
-struct amvdec_session;
-
-/**
- * struct amvdec_core - device parameters, singleton
- *
- * @dos_base: DOS memory base address
- * @esparser_base: PARSER memory base address
- * @regmap_ao: regmap for the AO bus
- * @dev: core device
- * @dev_dec: decoder device
- * @platform: platform-specific data
- * @canvas: canvas provider reference
- * @dos_parser_clk: DOS_PARSER clock
- * @dos_clk: DOS clock
- * @vdec_1_clk: VDEC_1 clock
- * @vdec_hevc_clk: VDEC_HEVC clock
- * @vdec_hevcf_clk: VDEC_HEVCF clock
- * @esparser_reset: RESET for the PARSER
- * @vdev_dec: video device for the decoder
- * @v4l2_dev: v4l2 device
- * @cur_sess: current decoding session
- * @lock: video device lock
- */
-struct amvdec_core {
-	void __iomem *dos_base;
-	void __iomem *esparser_base;
-	struct regmap *regmap_ao;
-
-	struct device *dev;
-	struct device *dev_dec;
-	const struct vdec_platform *platform;
-
-	struct meson_canvas *canvas;
-
-	struct clk *dos_parser_clk;
-	struct clk *dos_clk;
-	struct clk *vdec_1_clk;
-	struct clk *vdec_hevc_clk;
-	struct clk *vdec_hevcf_clk;
-
-	struct reset_control *esparser_reset;
-
-	struct video_device *vdev_dec;
-	struct v4l2_device v4l2_dev;
-
-	struct amvdec_session *cur_sess;
-	struct mutex lock;
-};
-
-/**
- * struct amvdec_ops - vdec operations
- *
- * @start: mandatory call when the vdec needs to initialize
- * @stop: mandatory call when the vdec needs to stop
- * @conf_esparser: mandatory call to let the vdec configure the ESPARSER
- * @vififo_level: mandatory call to get the current amount of data
- *		  in the VIFIFO
- */
-struct amvdec_ops {
-	int (*start)(struct amvdec_session *sess);
-	int (*stop)(struct amvdec_session *sess);
-	void (*conf_esparser)(struct amvdec_session *sess);
-	u32 (*vififo_level)(struct amvdec_session *sess);
-};
-
-/**
- * struct amvdec_codec_ops - codec operations
- *
- * @start: mandatory call when the codec needs to initialize
- * @stop: mandatory call when the codec needs to stop
- * @load_extended_firmware: optional call to load additional firmware bits
- * @num_pending_bufs: optional call to get the number of dst buffers on ho=
ld
- * @can_recycle: optional call to know if the codec is ready to recycle
- *		 a dst buffer
- * @recycle: optional call to tell the codec to recycle a dst buffer. Must=
 go
- *	     in pair with @can_recycle
- * @drain: optional call if the codec has a custom way of draining
- * @resume: optional call to resume after a resolution change
- * @eos_sequence: optional call to get an end sequence to send to esparser
- *		  for flush. Mutually exclusive with @drain.
- * @isr: mandatory call when the ISR triggers
- * @threaded_isr: mandatory call for the threaded ISR
- */
-struct amvdec_codec_ops {
-	int (*start)(struct amvdec_session *sess);
-	int (*stop)(struct amvdec_session *sess);
-	int (*load_extended_firmware)(struct amvdec_session *sess,
-				      const u8 *data, u32 len);
-	u32 (*num_pending_bufs)(struct amvdec_session *sess);
-	int (*can_recycle)(struct amvdec_core *core);
-	void (*recycle)(struct amvdec_core *core, u32 buf_idx);
-	void (*drain)(struct amvdec_session *sess);
-	void (*resume)(struct amvdec_session *sess);
-	const u8 * (*eos_sequence)(u32 *len);
-	irqreturn_t (*isr)(struct amvdec_session *sess);
-	irqreturn_t (*threaded_isr)(struct amvdec_session *sess);
-};
-
-/**
- * struct amvdec_format - describes one of the OUTPUT (src) format support=
ed
- *
- * @pixfmt: V4L2 pixel format
- * @min_buffers: minimum amount of CAPTURE (dst) buffers
- * @max_buffers: maximum amount of CAPTURE (dst) buffers
- * @max_width: maximum picture width supported
- * @max_height: maximum picture height supported
- * @flags: enum flags associated with this pixfmt
- * @vdec_ops: the VDEC operations that support this format
- * @codec_ops: the codec operations that support this format
- * @firmware_path: Path to the firmware that supports this format
- * @pixfmts_cap: list of CAPTURE pixel formats available with pixfmt
- */
-struct amvdec_format {
-	u32 pixfmt;
-	u32 min_buffers;
-	u32 max_buffers;
-	u32 max_width;
-	u32 max_height;
-	u32 flags;
-
-	struct amvdec_ops *vdec_ops;
-	struct amvdec_codec_ops *codec_ops;
-
-	char *firmware_path;
-	u32 pixfmts_cap[4];
-};
-
-enum amvdec_status {
-	STATUS_STOPPED,
-	STATUS_INIT,
-	STATUS_RUNNING,
-	STATUS_NEEDS_RESUME,
-};
-
-/**
- * struct amvdec_session - decoding session parameters
- *
- * @core: reference to the vdec core struct
- * @fh: v4l2 file handle
- * @m2m_dev: v4l2 m2m device
- * @m2m_ctx: v4l2 m2m context
- * @ctrl_handler: V4L2 control handler
- * @ctrl_min_buf_capture: V4L2 control V4L2_CID_MIN_BUFFERS_FOR_CAPTURE
- * @lock: cap & out queues lock
- * @fmt_out: vdec pixel format for the OUTPUT queue
- * @pixfmt_cap: V4L2 pixel format for the CAPTURE queue
- * @src_buffer_size: size in bytes of the OUTPUT buffers' only plane
- * @width: current picture width
- * @height: current picture height
- * @colorspace: current colorspace
- * @ycbcr_enc: current ycbcr_enc
- * @quantization: current quantization
- * @xfer_func: current transfer function
- * @pixelaspect: Pixel Aspect Ratio reported by the decoder
- * @esparser_queued_bufs: number of buffers currently queued into ESPARSER
- * @esparser_queue_work: work struct for the ESPARSER to process src buffe=
rs
- * @streamon_cap: stream on flag for capture queue
- * @streamon_out: stream on flag for output queue
- * @sequence_cap: capture sequence counter
- * @sequence_out: output sequence counter
- * @should_stop: flag set if userspace signaled EOS via command
- *		 or empty buffer
- * @keyframe_found: flag set once a keyframe has been parsed
- * @num_dst_bufs: number of destination buffers
- * @changed_format: the format changed
- * @canvas_alloc: array of all the canvas IDs allocated
- * @canvas_num: number of canvas IDs allocated
- * @vififo_vaddr: virtual address for the VIFIFO
- * @vififo_paddr: physical address for the VIFIFO
- * @vififo_size: size of the VIFIFO dma alloc
- * @bufs_recycle: list of buffers that need to be recycled
- * @bufs_recycle_lock: lock for the bufs_recycle list
- * @recycle_thread: task struct for the recycling thread
- * @timestamps: chronological list of src timestamps
- * @ts_spinlock: spinlock for the timestamps list
- * @last_irq_jiffies: tracks last time the vdec triggered an IRQ
- * @last_offset: tracks last offset of vififo
- * @wrap_count: number of times the vififo wrapped around
- * @fw_idx_to_vb2_idx: firmware buffer index to vb2 buffer index
- * @status: current decoding status
- * @priv: codec private data
- */
-struct amvdec_session {
-	struct amvdec_core *core;
-
-	struct v4l2_fh fh;
-	struct v4l2_m2m_dev *m2m_dev;
-	struct v4l2_m2m_ctx *m2m_ctx;
-	struct v4l2_ctrl_handler ctrl_handler;
-	struct v4l2_ctrl *ctrl_min_buf_capture;
-	struct mutex lock;
-
-	const struct amvdec_format *fmt_out;
-	u32 pixfmt_cap;
-	u32 src_buffer_size;
-
-	u32 width;
-	u32 height;
-	u32 colorspace;
-	u8 ycbcr_enc;
-	u8 quantization;
-	u8 xfer_func;
-
-	struct v4l2_fract pixelaspect;
-
-	atomic_t esparser_queued_bufs;
-	struct work_struct esparser_queue_work;
-
-	unsigned int streamon_cap, streamon_out;
-	unsigned int sequence_cap, sequence_out;
-	unsigned int should_stop;
-	unsigned int keyframe_found;
-	unsigned int num_dst_bufs;
-	unsigned int changed_format;
-
-	u8 canvas_alloc[MAX_CANVAS];
-	u32 canvas_num;
-
-	void *vififo_vaddr;
-	dma_addr_t vififo_paddr;
-	u32 vififo_size;
-
-	struct list_head bufs_recycle;
-	struct mutex bufs_recycle_lock; /* bufs_recycle list lock */
-	struct task_struct *recycle_thread;
-
-	struct list_head timestamps;
-	spinlock_t ts_spinlock; /* timestamp list lock */
-
-	u64 last_irq_jiffies;
-	u32 last_offset;
-	u32 wrap_count;
-	u32 fw_idx_to_vb2_idx[32];
-
-	enum amvdec_status status;
-	void *priv;
-};
-
-static inline struct amvdec_session *file_to_amvdec_session(struct file *f=
ilp)
-{
-	return container_of(file_to_v4l2_fh(filp), struct amvdec_session, fh);
-}
-
-u32 amvdec_get_output_size(struct amvdec_session *sess);
-
-#endif
+/* SPDX-License-Identifier: GPL-2.0+ */=0D
+/*=0D
+ * Copyright (C) 2018 BayLibre, SAS=0D
+ * Author: Maxime Jourdan <mjourdan@baylibre.com>=0D
+ */=0D
+=0D
+#ifndef __MESON_VDEC_CORE_H_=0D
+#define __MESON_VDEC_CORE_H_=0D
+=0D
+#include <linux/irqreturn.h>=0D
+#include <linux/regmap.h>=0D
+#include <linux/list.h>=0D
+#include <media/videobuf2-v4l2.h>=0D
+#include <media/v4l2-ctrls.h>=0D
+#include <media/v4l2-device.h>=0D
+#include <linux/soc/amlogic/meson-canvas.h>=0D
+=0D
+#include "vdec_platform.h"=0D
+=0D
+/* 32 buffers in 3-plane YUV420 */=0D
+#define MAX_CANVAS (32 * 3)=0D
+=0D
+struct amvdec_buffer {=0D
+	struct list_head list;=0D
+	struct vb2_buffer *vb;=0D
+};=0D
+=0D
+/**=0D
+ * struct amvdec_timestamp - stores a src timestamp along with a VIFIFO of=
fset=0D
+ *=0D
+ * @list: used to make lists out of this struct=0D
+ * @tc: timecode from the v4l2 buffer=0D
+ * @ts: timestamp from the VB2 buffer=0D
+ * @offset: offset in the VIFIFO where the associated packet was written=0D
+ * @flags: flags from the v4l2 buffer=0D
+ * @used_count: times this timestamp was checked for a match with a dst bu=
ffer=0D
+ */=0D
+struct amvdec_timestamp {=0D
+	struct list_head list;=0D
+	struct v4l2_timecode tc;=0D
+	u64 ts;=0D
+	u32 offset;=0D
+	u32 flags;=0D
+	u32 used_count;=0D
+};=0D
+=0D
+struct amvdec_session;=0D
+=0D
+/**=0D
+ * struct amvdec_core - device parameters, singleton=0D
+ *=0D
+ * @dos_base: DOS memory base address=0D
+ * @esparser_base: PARSER memory base address=0D
+ * @regmap_ao: regmap for the AO bus=0D
+ * @dev: core device=0D
+ * @dev_dec: decoder device=0D
+ * @platform: platform-specific data=0D
+ * @canvas: canvas provider reference=0D
+ * @dos_parser_clk: DOS_PARSER clock=0D
+ * @dos_clk: DOS clock=0D
+ * @vdec_1_clk: VDEC_1 clock=0D
+ * @vdec_hevc_clk: VDEC_HEVC clock=0D
+ * @vdec_hevcf_clk: VDEC_HEVCF clock=0D
+ * @esparser_reset: RESET for the PARSER=0D
+ * @vdev_dec: video device for the decoder=0D
+ * @v4l2_dev: v4l2 device=0D
+ * @m2m_dev: v4l2 m2m device=0D
+ * @cur_sess: current decoding session=0D
+ * @lock: video device lock=0D
+ * @irq: decoder irq=0D
+ */=0D
+struct amvdec_core {=0D
+	void __iomem *dos_base;=0D
+	void __iomem *esparser_base;=0D
+	struct regmap *regmap_ao;=0D
+=0D
+	struct device *dev;=0D
+	struct device *dev_dec;=0D
+	const struct vdec_platform *platform;=0D
+=0D
+	struct meson_canvas *canvas;=0D
+=0D
+	struct clk *dos_parser_clk;=0D
+	struct clk *dos_clk;=0D
+	struct clk *vdec_1_clk;=0D
+	struct clk *vdec_hevc_clk;=0D
+	struct clk *vdec_hevcf_clk;=0D
+=0D
+	struct reset_control *esparser_reset;=0D
+=0D
+	struct video_device *vdev_dec;=0D
+	struct v4l2_device v4l2_dev;=0D
+	struct v4l2_m2m_dev *m2m_dev;=0D
+=0D
+	struct amvdec_session *cur_sess;=0D
+	struct mutex lock;=0D
+	int irq;=0D
+};=0D
+=0D
+/**=0D
+ * struct amvdec_ops - vdec operations=0D
+ *=0D
+ * @start: mandatory call when the vdec needs to initialize=0D
+ * @stop: mandatory call when the vdec needs to stop=0D
+ * @conf_esparser: mandatory call to let the vdec configure the ESPARSER=0D
+ * @vififo_level: mandatory call to get the current amount of data=0D
+ *		  in the VIFIFO=0D
+ */=0D
+struct amvdec_ops {=0D
+	int (*start)(struct amvdec_session *sess);=0D
+	int (*stop)(struct amvdec_session *sess);=0D
+	void (*conf_esparser)(struct amvdec_session *sess);=0D
+	u32 (*vififo_level)(struct amvdec_session *sess);=0D
+};=0D
+=0D
+/**=0D
+ * struct amvdec_codec_ops - codec operations=0D
+ *=0D
+ * @start: mandatory call when the codec needs to initialize=0D
+ * @stop: mandatory call when the codec needs to stop=0D
+ * @load_extended_firmware: optional call to load additional firmware bits=
=0D
+ * @num_pending_bufs: optional call to get the number of dst buffers on ho=
ld=0D
+ * @can_recycle: optional call to know if the codec is ready to recycle=0D
+ *		 a dst buffer=0D
+ * @recycle: optional call to tell the codec to recycle a dst buffer. Must=
 go=0D
+ *	     in pair with @can_recycle=0D
+ * @drain: optional call if the codec has a custom way of draining=0D
+ * @resume: optional call to resume after a resolution change=0D
+ * @eos_sequence: optional call to get an end sequence to send to esparser=
=0D
+ *		  for flush. Mutually exclusive with @drain.=0D
+ * @isr: mandatory call when the ISR triggers=0D
+ * @threaded_isr: mandatory call for the threaded ISR=0D
+ */=0D
+struct amvdec_codec_ops {=0D
+	int (*start)(struct amvdec_session *sess);=0D
+	int (*stop)(struct amvdec_session *sess);=0D
+	int (*load_extended_firmware)(struct amvdec_session *sess,=0D
+				      const u8 *data, u32 len);=0D
+	u32 (*num_pending_bufs)(struct amvdec_session *sess);=0D
+	int (*can_recycle)(struct amvdec_core *core);=0D
+	void (*recycle)(struct amvdec_core *core, u32 buf_idx);=0D
+	void (*drain)(struct amvdec_session *sess);=0D
+	void (*resume)(struct amvdec_session *sess);=0D
+	const u8 * (*eos_sequence)(u32 *len);=0D
+	irqreturn_t (*isr)(struct amvdec_session *sess);=0D
+	irqreturn_t (*threaded_isr)(struct amvdec_session *sess);=0D
+};=0D
+=0D
+/**=0D
+ * struct amvdec_format - describes one of the OUTPUT (src) format support=
ed=0D
+ *=0D
+ * @pixfmt: V4L2 pixel format=0D
+ * @min_buffers: minimum amount of CAPTURE (dst) buffers=0D
+ * @max_buffers: maximum amount of CAPTURE (dst) buffers=0D
+ * @max_width: maximum picture width supported=0D
+ * @max_height: maximum picture height supported=0D
+ * @flags: enum flags associated with this pixfmt=0D
+ * @vdec_ops: the VDEC operations that support this format=0D
+ * @codec_ops: the codec operations that support this format=0D
+ * @firmware_path: Path to the firmware that supports this format=0D
+ * @pixfmts_cap: list of CAPTURE pixel formats available with pixfmt=0D
+ */=0D
+struct amvdec_format {=0D
+	u32 pixfmt;=0D
+	u32 min_buffers;=0D
+	u32 max_buffers;=0D
+	u32 max_width;=0D
+	u32 max_height;=0D
+	u32 flags;=0D
+=0D
+	struct amvdec_ops *vdec_ops;=0D
+	struct amvdec_codec_ops *codec_ops;=0D
+=0D
+	char *firmware_path;=0D
+	u32 pixfmts_cap[4];=0D
+};=0D
+=0D
+enum amvdec_status {=0D
+	STATUS_STOPPED,=0D
+	STATUS_INIT,=0D
+	STATUS_RUNNING,=0D
+	STATUS_NEEDS_RESUME,=0D
+};=0D
+=0D
+/**=0D
+ * struct amvdec_session - decoding session parameters=0D
+ *=0D
+ * @core: reference to the vdec core struct=0D
+ * @fh: v4l2 file handle=0D
+ * @m2m_ctx: v4l2 m2m context=0D
+ * @ctrl_handler: V4L2 control handler=0D
+ * @ctrl_min_buf_capture: V4L2 control V4L2_CID_MIN_BUFFERS_FOR_CAPTURE=0D
+ * @lock: cap & out queues lock=0D
+ * @fmt_out: vdec pixel format for the OUTPUT queue=0D
+ * @pixfmt_cap: V4L2 pixel format for the CAPTURE queue=0D
+ * @src_buffer_size: size in bytes of the OUTPUT buffers' only plane=0D
+ * @width: current picture width=0D
+ * @height: current picture height=0D
+ * @colorspace: current colorspace=0D
+ * @ycbcr_enc: current ycbcr_enc=0D
+ * @quantization: current quantization=0D
+ * @xfer_func: current transfer function=0D
+ * @pixelaspect: Pixel Aspect Ratio reported by the decoder=0D
+ * @esparser_queued_bufs: number of buffers currently queued into ESPARSER=
=0D
+ * @esparser_queue_work: work struct for the ESPARSER to process src buffe=
rs=0D
+ * @streamon_cap: stream on flag for capture queue=0D
+ * @streamon_out: stream on flag for output queue=0D
+ * @sequence_cap: capture sequence counter=0D
+ * @sequence_out: output sequence counter=0D
+ * @should_stop: flag set if userspace signaled EOS via command=0D
+ *		 or empty buffer=0D
+ * @keyframe_found: flag set once a keyframe has been parsed=0D
+ * @num_dst_bufs: number of destination buffers=0D
+ * @changed_format: the format changed=0D
+ * @canvas_alloc: array of all the canvas IDs allocated=0D
+ * @canvas_num: number of canvas IDs allocated=0D
+ * @vififo_vaddr: virtual address for the VIFIFO=0D
+ * @vififo_paddr: physical address for the VIFIFO=0D
+ * @vififo_size: size of the VIFIFO dma alloc=0D
+ * @bufs_recycle: list of buffers that need to be recycled=0D
+ * @bufs_recycle_lock: lock for the bufs_recycle list=0D
+ * @recycle_thread: task struct for the recycling thread=0D
+ * @timestamps: chronological list of src timestamps=0D
+ * @ts_spinlock: spinlock for the timestamps list=0D
+ * @last_irq_jiffies: tracks last time the vdec triggered an IRQ=0D
+ * @last_offset: tracks last offset of vififo=0D
+ * @wrap_count: number of times the vififo wrapped around=0D
+ * @fw_idx_to_vb2_idx: firmware buffer index to vb2 buffer index=0D
+ * @status: current decoding status=0D
+ * @priv: codec private data=0D
+ */=0D
+struct amvdec_session {=0D
+	struct amvdec_core *core;=0D
+=0D
+	struct v4l2_fh fh;=0D
+	struct v4l2_m2m_ctx *m2m_ctx;=0D
+	struct v4l2_ctrl_handler ctrl_handler;=0D
+	struct v4l2_ctrl *ctrl_min_buf_capture;=0D
+	struct mutex lock;=0D
+=0D
+	const struct amvdec_format *fmt_out;=0D
+	u32 pixfmt_cap;=0D
+	u32 src_buffer_size;=0D
+=0D
+	u32 width;=0D
+	u32 height;=0D
+	u32 colorspace;=0D
+	u8 ycbcr_enc;=0D
+	u8 quantization;=0D
+	u8 xfer_func;=0D
+=0D
+	struct v4l2_fract pixelaspect;=0D
+=0D
+	atomic_t esparser_queued_bufs;=0D
+	struct work_struct esparser_queue_work;=0D
+=0D
+	unsigned int streamon_cap, streamon_out;=0D
+	unsigned int sequence_cap, sequence_out;=0D
+	unsigned int should_stop;=0D
+	unsigned int keyframe_found;=0D
+	unsigned int num_dst_bufs;=0D
+	unsigned int changed_format;=0D
+=0D
+	u8 canvas_alloc[MAX_CANVAS];=0D
+	u32 canvas_num;=0D
+=0D
+	void *vififo_vaddr;=0D
+	dma_addr_t vififo_paddr;=0D
+	u32 vififo_size;=0D
+=0D
+	struct list_head bufs_recycle;=0D
+	struct mutex bufs_recycle_lock; /* bufs_recycle list lock */=0D
+	struct task_struct *recycle_thread;=0D
+=0D
+	struct list_head timestamps;=0D
+	spinlock_t ts_spinlock; /* timestamp list lock */=0D
+=0D
+	u64 last_irq_jiffies;=0D
+	u32 last_offset;=0D
+	u32 wrap_count;=0D
+	u32 fw_idx_to_vb2_idx[32];=0D
+=0D
+	enum amvdec_status status;=0D
+	void *priv;=0D
+};=0D
+=0D
+static inline struct amvdec_session *file_to_amvdec_session(struct file *f=
ilp)=0D
+{=0D
+	return container_of(file_to_v4l2_fh(filp), struct amvdec_session, fh);=0D
+}=0D
+=0D
+u32 amvdec_get_output_size(struct amvdec_session *sess);=0D
+=0D
+#endif=0D
--=20
2.54.0.windows.1


