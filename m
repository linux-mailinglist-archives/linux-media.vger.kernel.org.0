Return-Path: <linux-media+bounces-62711-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHNAE+YcFGoGJwcAu9opvQ
	(envelope-from <linux-media+bounces-62711-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 11:56:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C185C8D84
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 11:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27D20303F7E5
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 09:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9703E8341;
	Mon, 25 May 2026 09:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9B78uoN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B7D3E5EE3
	for <linux-media@vger.kernel.org>; Mon, 25 May 2026 09:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779702787; cv=none; b=TdQfojFv7vM6d+dY1XNeR6e8RMLOxdw9Wg+a07T7Fljz0O9+Bi4Ddu60I9HO9bwyVRmfIooNtjFEJql2uKPqzoUH8nBCXcM5kycHYuyWD5u6tOiq8ayklGyTPNNEV4kP9Q2v0K/rphw8pwn1QKiWkVSlG7ULlewfFOkcEh3TnR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779702787; c=relaxed/simple;
	bh=QRfnZAsf4fSDp5/JMDhDg9a0MSoVbrVjv3/Xv8G0CJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oqEji+JCJwfSKfM+OzV1ygE4GWuACvtN/W4SRT92WYAl18bJxyO80NYszu4UIcTKGbJbxLu19e0uQSXoi/pADDW7T7XZNn0kdQLk6sne0lKTx+Lsow+l4kR1jiZpfSzfAMQdc3Pou0djtOWi8iU0yYC5f3u6icPbQs8P4ukQYD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9B78uoN; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b788a98557so59979775ad.2
        for <linux-media@vger.kernel.org>; Mon, 25 May 2026 02:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779702786; x=1780307586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ib1oZbigCdwlVvPfRDEBvGe4OjSQvC3V53nI1f6TImU=;
        b=f9B78uoNHb8vUqbZY6bPi9y8gjEyERgSaOn/9gqMy1ODBY/TEhNVRtFcLX8gfiOTX4
         GcW+BLpc4VZVjcOj39jN7eqhZiXQx7RWyMXM15gg+g6dDi0wR08pB7gmUSInAOgLKbQX
         4Lx75GGRYpMc36X7VIVX8g30oiIvygren6LX3zKW7sjjc6QNT0Ixbi24JoA6ccw1Wg2I
         B5tE8L4SRPTqIqCuC97G4ussaJYp7zemkBKgG7a0TDJyvYeo1xtYCd9eSR7Kq7dRycZf
         qUqLqheaH1JYtwoOwuwVqzp7zrIq8Ug4KHxHB1AlG5muqlmnPV2mGck3+GmUchUbjqvu
         y/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779702786; x=1780307586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ib1oZbigCdwlVvPfRDEBvGe4OjSQvC3V53nI1f6TImU=;
        b=CWON7A7ngh81jxpfyzKDe03ZL6kkS3mv17Cq8+28teZ97b+2GbpxTda9J7MO98sWjj
         a8DkgGMuGgWC1AnCh5C8DtZiHE6/teZIdrR9KYg5pIB0rp2XcSb2AhGntem2sM5k8AXY
         VyskeLfccC+O/PqRusA8kChl+/zkeoSnlPgZeozg7fFhDNyNx/ry2cKOXz+Kri7ftsFu
         uJJ408UrYnya7hxIJXfkiLP6kSZ9a3d3FHcX4JCVuNV1XAnpw9d5nu56aUzy2WCM2o+L
         LqJthMT/GX56c5q0VXuPikkYwa5cX9WhhXtoybbbO6IgoDXyEEA6tppGDdgE8zn90RiH
         VVCA==
X-Forwarded-Encrypted: i=1; AFNElJ8hhp+Jo8hcPTbxVmYfXLNl+R0dZi+/dhuUmHw45GYfpKo/7VeoSyhqNE0lNg1hwgWf1StmT6NRnH6lqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqOIhEu+wl0HqettZNLqC3aelF4e1IKCg5Fq28etmo85YCYQdZ
	CMNe0v1z07OswVFVvghKfa2nmFgp3jWabefDfxuVNUIiKmj9srYSR2MTP59k9g==
X-Gm-Gg: Acq92OGMurWeO5poZhXzICG13wb/pH4CPXOZwInjTICz3rq1UneEAwiKLo9TdIQ7Gf4
	Dw5QUr8BheRAScWaDG29YpxTJAtECkGCZZ84+3qkIQd28wYsGvYVq6U68V5YRAEXJolP5gxtAR2
	9LFosQiJg87ssP2N+qrCMkxOnQ1wIQqzgBCT0/6j58eID1BZK1MJpI6osCXaBFm1yixYFVUcWFS
	4K7QyoN/lp44fXJZk2V8RwgXoB6TZCGguvzxmrVGRfNaA+XPPUVILexCmOhzGmfE3g9p1vclUtu
	JKQ4KosMha5wP6EQiC6Ua8WLviJTvRfU0gxX6yBJ5z4qCOCQlmFI0LSN4fUNz6rcXSu0DNBX7Vs
	LoaOiWG6D9TRJr9hp4IpgU6Aq9G6f88ZK+Ss/MmXFPtvlETaY59IJMTyjjd24tLscmmXax1RuC9
	AX6PNntwJ8YSHIl50lx8u9
X-Received: by 2002:a17:903:2f90:b0:2bd:ef15:9fce with SMTP id d9443c01a7336-2beb063227emr153939475ad.20.1779702785924;
        Mon, 25 May 2026 02:53:05 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2cd6sm92533615ad.52.2026.05.25.02.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:53:05 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v5 4/6] media: meson: vdec: Handle kthread error and free codec private data
Date: Mon, 25 May 2026 15:21:52 +0530
Message-ID: <20260525095216.12078-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260525095216.12078-1-linux.amoon@gmail.com>
References: <20260525095216.12078-1-linux.amoon@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62711-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,ndufresne.ca,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,linuxfoundation.org,baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: E0C185C8D84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

vdec_start_streaming() launches a recycle thread when required by the
codec. If kthread_run() fails, the previous error path only powered off
the hardware, leaving sess->priv and codec state allocated. This caused
a permanent leak of the codec context and associated DMA buffers.

Fix this by adding an err_cleanup path: if thread creation fails, call
codec_ops->stop() to release the codec context and clear sess->priv,
then power off the hardware. Also reset core->cur_sess and sess->status
to avoid stale references.

This change closes the memory leak on kthread_run() failure and ensures
proper cleanup of codec resources.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v5: The vdec_poweron() function invoked earlier allocates dynamic memory for
the codec context and assigns it to sess->priv. When kthread_run() fails,
this new error path calls vdec_poweroff() which stops the hardware but
doesn't free sess->priv.
---
 drivers/staging/media/meson/vdec/vdec.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 52ace4de967c..b31bf08af88e 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -345,13 +345,25 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 
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
+	if (codec_ops && codec_ops->stop && sess->priv) {
+		codec_ops->stop(sess);
+		sess->priv = NULL;
+	}
+	vdec_poweroff(sess);
 vififo_free:
 	mutex_lock(&core->lock);
 	core->cur_sess = NULL;
-- 
2.50.1


