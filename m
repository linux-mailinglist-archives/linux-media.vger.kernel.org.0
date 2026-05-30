Return-Path: <linux-media+bounces-63107-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDHXHNuxGmoH7ggAu9opvQ
	(envelope-from <linux-media+bounces-63107-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 11:46:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CA54E60BF36
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 11:46:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45E3C306D59D
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 09:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BAA539D6CA;
	Sat, 30 May 2026 09:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Py+qmQt1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F93369D47
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 09:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780134295; cv=none; b=FZiJOfnCqRS6btu4DdfPnUFLH4jt2h226BMqijp8Hw6ocA7mVfCnv4/uc19G8N1FmPF906rWG/lMwIncf5n1EYuA9t2u15TCt79RR22TmmOwMJM8gILsoBdtwJIlJx2Pp7GGSOEx0qs3EUY1BVPpOMb25TNDo1vW/BthHIIzjaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780134295; c=relaxed/simple;
	bh=U+d2jT76hbERqFnnuLcNz9UQ38hwXQfEMVzxXIG/jas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fPc1+JZrfHSAmaZhUo6RmJq2wZfqb2a4+WwJJQJdmlk0iiqvD6QS84oIdRiim0mukG19nbLQZAXT7d18ouuYF8cgz1mgD11xow11uCTVaqf7uiSAcXUuxeGKxJeeCIO4L336mo7zRSctwolALzUnznWUxStW2iUIPSbGjvMDl2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Py+qmQt1; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bab82d75fdso75061045ad.2
        for <linux-media@vger.kernel.org>; Sat, 30 May 2026 02:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134293; x=1780739093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eg9ggvkEkoQKR+hIDJPnP9lc/gF7VRqufBdsoqX52Vc=;
        b=Py+qmQt1TCI9VuVFPFxZqIK0ucZ5osbRuCLbGsbcwf9yracV8aHsS2IHYGgEYyW7Xv
         JelEr0HMgLgPbFSKUwOQQt7HQx6x1LcVNwSe7Cia9+TWaZV3VUhBZGrNzsTWdOoSbc4B
         3qgzmBLfFfP25MYyc2BubYcsPeMQoZGjr6Tp4vdlJ1GQucsB9uY2vNsaydJsq8aOwEYC
         QorhlZ9DG/XQ4tAwVBcs+NhjGTrfDF9Pnu2QvYRZhwyIwy/2nYsrkL62t2EXNvRGXE2g
         o3MdFEsJuazJBT+IANL1Gyj5HczDAFwZElrM/j8aDhGTyxVZn4xuaudaXiFdfKm/88sk
         frhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134293; x=1780739093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Eg9ggvkEkoQKR+hIDJPnP9lc/gF7VRqufBdsoqX52Vc=;
        b=ISKM/G3RPUnfZrxCVc0nKRaYMvC2fEG2j8ifQuih3g40zVVNSX/ic6Wl+ltrTZ0PuF
         N8pL2U0BO4qtRwbBLcA3RKK6eIsrfsJ3h2uHjBWedEjdzEiROU8x4cTk9Pijax5APLr/
         +56UyUw1Pr+s5Gw+bcs3/ZFsloWOBOWZndlawM096OWZK7ps0pbGY2Nl3FflUb82HDOB
         D5cGzAjC9YnyHtbQ05G+kegeSVg5lagiYdkJ1PpoWrKz3aM6l54XjXTyVBFzEsCdJ6ci
         AAotuFqMgZp7Gz+mZKMyt1alNStVfHcDQaL63VZMkWesrPRL7w8sTFWDLoVTYa0GsTKz
         XDkw==
X-Forwarded-Encrypted: i=1; AFNElJ9XFyNQ3ioFRNxlv7nL2BEhRk9yCXy64gc7bxZvBTQvMXX8Jm2fvgCtH7u1hFnsTIL8Y7D9JXmX1ZQWgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEiVd+fJP3VvzTw6HFNzrzfpch++UDZZwatK0kqAuxuN53fArT
	yqAqI11J2rwqAmLFZb0IqUq9J1z25NBTFdFxF4NeVbEbCnZDTP/b4/N8
X-Gm-Gg: Acq92OEwy2mkxOuTA+5bU5M7pqAj/gRIzvBrmoQc1M6C7clfF27cvxvr8gjAErYJGEw
	YLSQLoaHpsQwzGWhPQ93IAlUw0O3+rJVn3f2IXguw2v82LV0VumonB5BUcLprfRZ7A+QRAOC4+a
	/X0iGndcVgcQVHwkISuYuBwSKnmFogdb7Daj2qPMdxBmwocRksL2ls9V5POqFOlVinMpKcOeWtA
	ftaeCUC1krMSARvqw2QQvjIaJMMkn3hiJh2lU3YmdaPk4mg2tnPTiDqYonyIjY5B54BAF4ZzKmm
	aO06H9HBBQgVeJKHXA5mxP0PB3H12RxRg8MYLYfb9ZpyqPdQN7PYEUIXc92gP0+KGS/69Ol8/Sx
	3y6JSz5cGYG//LdeduIhmT00fJNnZ8HrA5ez2ND2Wp/x1+tuGSdNsOiclQ92u9ooj+uFAdpV/Wc
	Zg82wHwUvdSsvXjBgs6ygH9XbXyW6cJOA=
X-Received: by 2002:a17:902:c94c:b0:2b2:be01:5532 with SMTP id d9443c01a7336-2bf3686d1dcmr41074635ad.35.1780134293228;
        Sat, 30 May 2026 02:44:53 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm61529945ad.10.2026.05.30.02.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 02:44:52 -0700 (PDT)
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
Subject: [PATCH v6 5/8] media: meson: vdec: Cancel esparser work during teardown
Date: Sat, 30 May 2026 15:12:51 +0530
Message-ID: <20260530094326.11892-6-linux.amoon@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-63107-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: CA54E60BF36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The esparser workqueue could remain active during error unwind,
streaming stop, or device close, leading to use‑after‑free when
work items accessed freed session memory.

Fix this by explicitly cancelling the work in all teardown paths:

- Call cancel_work_sync(&sess->esparser_queue_work) in
  vdec_start_streaming() error unwind, vdec_stop_streaming(),
  and vdec_close().
- Ensure the workqueue is drained before releasing session
  state and buffers.
- Move codec_ops->drain() evaluation earlier in stop_streaming()
  using the status snapshot, so draining occurs before buffer
  cleanup.

Following change prevents dangling work execution, eliminates
use‑after‑free hazards, and ensures orderly teardown of decoder
resources.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 698a95566ad2..4884ee04b352 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -380,6 +380,8 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 			  sess->vififo_vaddr, sess->vififo_paddr);
 	sess->vififo_vaddr = NULL;
 bufs_done:
+	cancel_work_sync(&sess->esparser_queue_work);
+
 	mutex_lock(&core->lock);
 	if (core->cur_sess == sess)
 		core->cur_sess = NULL;
@@ -437,6 +439,8 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 	struct vb2_v4l2_buffer *buf;
 	enum amvdec_status old_status;
 
+	cancel_work_sync(&sess->esparser_queue_work);
+
 	/*
 	 * Safely snapshot the status and clear the hardware owner inside
 	 * the mutex to prevent data races with concurrent STREAMON requests.
@@ -448,7 +452,11 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 	sess->status = STATUS_STOPPED;
 	mutex_unlock(&core->lock);
 
-	/* Evaluate the hardware state using our snapshot */
+	if (q->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		if (old_status >= STATUS_RUNNING && codec_ops->drain)
+			codec_ops->drain(sess);
+	}
+
 	if (old_status == STATUS_RUNNING ||
 	    old_status == STATUS_INIT ||
 	    (old_status == STATUS_NEEDS_RESUME &&
@@ -472,16 +480,10 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
 			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_ERROR);
-
 		sess->streamon_out = 0;
 	} else {
-		/* Drain remaining refs if was still running using the snapshot */
-		if (old_status >= STATUS_RUNNING && codec_ops->drain)
-			codec_ops->drain(sess);
-
 		while ((buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
 			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_ERROR);
-
 		sess->streamon_cap = 0;
 	}
 }
@@ -967,6 +969,8 @@ static int vdec_close(struct file *file)
 {
 	struct amvdec_session *sess = file_to_amvdec_session(file);
 
+	cancel_work_sync(&sess->esparser_queue_work);
+
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
 	v4l2_fh_del(&sess->fh, file);
 	v4l2_fh_exit(&sess->fh);
-- 
2.50.1


