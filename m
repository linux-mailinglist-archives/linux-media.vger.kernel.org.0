Return-Path: <linux-media+bounces-63105-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WD++CYyxGmoH7ggAu9opvQ
	(envelope-from <linux-media+bounces-63105-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 11:44:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEE960BEF1
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 11:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D1ECC3018880
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 09:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB0B39D6D9;
	Sat, 30 May 2026 09:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3IfSn+7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F12385D84
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 09:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780134274; cv=none; b=okOwGkwCs7wOp/QwPggbkni2enEDu/yUAOO7E4M04ei2ODv4xDgXKqyFKUB61OH8OzM03hpomEExgMlr0kwW52KbmqV8gpnqHg6nODmzo43HamjSesoFx124Mx/uL1Fzp/0CeqENLStvKpBGaOCwNsr2y2yzzFrtERbJGvo3g/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780134274; c=relaxed/simple;
	bh=+strja15rp5bfFyNtAbt1Pazm6s+foPib4qovmXYo1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WZOa6qGNI5gRG3p5Btz+79g5iBDXqrH4PIc4Wd8u+6gZrGy62vaigaMUmNo1bAr/msia6RFFYInAMDJaYTHYxNsPn41msBLMvZnVkw9JOm+wNOF91dbS4OZAkY50jHC2g6Gw0TKZi0OG5aLMR6XQBn+L6OB7pNWxVWMdmnyubyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3IfSn+7; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36ba285e98bso2173480a91.2
        for <linux-media@vger.kernel.org>; Sat, 30 May 2026 02:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134273; x=1780739073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrXJFZmxeXg5CYXAWJIPwYaWF/wPAlGFj3atI5I4qIQ=;
        b=F3IfSn+7zeA3Odoo0qJwJVkqrYF/NGXaWVK7pzn8ADyENFKgyH8pNpF5f5I+KD8U2k
         cC4ftNJYnLA54/E9U6KXVgqNfVmwu3N88XqMWF0CTXjTpIVUAJDVbg5ZvNsmMNrAV5V6
         PHdilS4zW2mIqEXcOvg2mL+QyHeLLr9+QCYMpa7IENOxbuElThu+CkVb/TgODxb1gBTC
         rOTmes5QGSDMVzDcrrq5RJnpT36uEykKZCqOrg1EeFBnNnc1bBqINOYMkiEPdjuquc1z
         /Tp/Znq+UaIth+mZLwyTUKXQFoHibzxVJzFXq9PV5rspdDBFUNxd68NRA5dDqkMBhrh1
         466w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134273; x=1780739073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BrXJFZmxeXg5CYXAWJIPwYaWF/wPAlGFj3atI5I4qIQ=;
        b=kmTMDvKDTUtru6vZkgdpIEdZ3vkW+3euSUrUao8Fn23tiDOU9QvEu8dpP9y7zt/IF3
         GElduXIRcmegnk7FOSDUNS0zeygsnGGxdWF3sI5pVy1GyAM+NJWLu95LEgYeWlWk1JKi
         ti3BSd+MZPQqd49+XEemFeAab7Tldsq9dQQe6V3jVww1KHdEZwQMMCxedkvDoVuKFNHZ
         P8LIK8LB6SIZNr1TmY5P9thJPCh8huQn4s6SX0xAT6+1ecZ+3cnmUzV843DR4n3tGOfm
         9YXaY63polLyYgExP9AoWfju/A9iFOAecNSNTucRsT96pjU9zF8uSgjd9Rdnmto1ye+g
         Ipqw==
X-Forwarded-Encrypted: i=1; AFNElJ/VUp3Q2+FUOjvXh7/YqBw9zhprcEdzCqCuGNMMn8/3ogrFmxeGWfF0LOzpCSuix6uU0U47Sd3ul377sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyY0YMcxp77/EJ2q1reDu/frvUy4LEQ2xV9H12LbMNPvaVN0WHR
	M+qLO60Oo5SO2zVcNKEs8OD6wAMs+39YKOFuOZwHyWPKTLVc9i7hqjiH
X-Gm-Gg: Acq92OEmqhDriXrNJl8I5dezfqVTDgt3Sn2kd8SPoPd5UIYK2V1limDo0OkbzKn0Qx5
	v02SrfoyWlkUr3kHOMps9SQwSol7AxZJTqsinOK8+gGUFW/pnlzdiZaKZpYoo4KXX/nw/BECmoL
	GJUk35BsvlkRnKUd8PfqZOCqW1O4xNggB2AOjCKft2cstLbRtcqaTyFeRGb/juLF7GAUmNABKjJ
	TPjcg2SiAEqqhWLtc/vBPeY/IAhF7bwvP34IqoJkzX3HIil4t363kBkFYPLzWNelXqk8Jv0rtoV
	9ZlKW2fBW2iMmYSKh22PqVo7hx4fh+U3C4AlbzZr7ujq7lZwL4MN/rOxagSWiie5sTzyBkGWe/H
	Cf14Q+rIYpqIf/ap6b97SECqDf77JFKJDeuMwpGPng7dtkCw48CH0Y41hXN95wVE9bLvuLsSiBB
	IW/32FYtDfIcu7GMGE+i3n4xEVEVo9bD8=
X-Received: by 2002:a17:902:da8e:b0:2bf:356f:4e0c with SMTP id d9443c01a7336-2bf36793916mr38435335ad.1.1780134272635;
        Sat, 30 May 2026 02:44:32 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm61529945ad.10.2026.05.30.02.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 02:44:31 -0700 (PDT)
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
Subject: [PATCH v6 3/8] media: meson: vdec: Handle kthread failure and free codec state
Date: Sat, 30 May 2026 15:12:49 +0530
Message-ID: <20260530094326.11892-4-linux.amoon@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63105-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne.ca:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0FEE960BEF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

vdec_start_streaming() launches a recycle thread when required by the
codec. If kthread_run() fails, the previous error path only powered off
the hardware, leaving sess->priv and codec state allocated. This caused
a permanent leak of the codec context and associated DMA buffers.

Fix this by introducing a dedicated err_cleanup path:

- Call codec_ops->stop() to release the codec context and clear sess->priv.
- Power off the hardware before freeing buffers to avoid DMA faults.
- Free canvas IDs explicitly and set sess->vififo_vaddr = NULL after
  dma_free_coherent() to guard against double‑free in fallback stop paths.
- Reset core->cur_sess and sess->status to prevent stale references.

Following change closes the memory leak on kthread_run() failure and ensures
robust cleanup of codec resources in both error and stop paths.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 26 ++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 7233000e2232..8a5bf1a96830 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -32,6 +32,8 @@ struct dummy_buf {
 /* 16 MiB for parsed bitstream swap exchange */
 #define SIZE_VIFIFO SZ_16M
 
+static void vdec_free_canvas(struct amvdec_session *sess);
+
 static u32 get_output_size(u32 width, u32 height)
 {
 	return ALIGN(width * height, SZ_64K);
@@ -352,16 +354,31 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 
 	sess->sequence_cap = 0;
 	sess->sequence_out = 0;
-	if (vdec_codec_needs_recycle(sess))
+	if (vdec_codec_needs_recycle(sess)) {
 		sess->recycle_thread = kthread_run(vdec_recycle_thread, sess,
 						   "vdec_recycle");
+		if (IS_ERR(sess->recycle_thread)) {
+			ret = PTR_ERR(sess->recycle_thread);
+			sess->recycle_thread = NULL;
+			goto err_cleanup;
+		}
+	}
 
 	schedule_work(&sess->esparser_queue_work);
 	return 0;
 
+err_cleanup:
+	vdec_free_canvas(sess);
+	vdec_poweroff(sess);
+	if (codec_ops && codec_ops->stop && sess->priv) {
+		codec_ops->stop(sess);
+		kfree(sess->priv);
+		sess->priv = NULL;
+	}
 vififo_free:
 	dma_free_coherent(sess->core->dev, sess->vififo_size,
 			  sess->vififo_vaddr, sess->vififo_paddr);
+	sess->vififo_vaddr = NULL;
 bufs_done:
 	mutex_lock(&core->lock);
 	if (core->cur_sess == sess)
@@ -441,8 +458,11 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 
 		vdec_poweroff(sess);
 		vdec_free_canvas(sess);
-		dma_free_coherent(sess->core->dev, sess->vififo_size,
-				  sess->vififo_vaddr, sess->vififo_paddr);
+		if (sess->vififo_vaddr) {
+			dma_free_coherent(sess->core->dev, sess->vififo_size,
+					  sess->vififo_vaddr,
+					  sess->vififo_paddr);
+		}
 		vdec_reset_timestamps(sess);
 		vdec_reset_bufs_recycle(sess);
 		kfree(sess->priv);
-- 
2.50.1


