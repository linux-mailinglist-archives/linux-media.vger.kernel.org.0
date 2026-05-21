Return-Path: <linux-media+bounces-62410-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFJwEje2DmrBBgYAu9opvQ
	(envelope-from <linux-media+bounces-62410-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:37:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FC85A036D
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0517A30166A9
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 07:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8F039B964;
	Thu, 21 May 2026 07:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HdhxFlHb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175C7351C1E
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 07:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779348934; cv=none; b=Ny6UD6h5Ib0FvpEIloJupqhEuC3ooM5uzxArO81t0Zu4vWhcIM1K8uLuL5W3euNe888mcG9EpXbjTPY0+L5FOyDRqAbYoi0Xd8N4k6kD8XGvlNvojTmV5H1mN7/8lCOqUmf58XEY7//yuDapGYA71qp/xSQQSvmRitNvSiaWaos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779348934; c=relaxed/simple;
	bh=R3voIaLtl2BRlPPKHEPBQ78/UAuVNbWj0w+ZXJI+bb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BtUmPlDj0xba8fToKe+0tWYKKnqV4Hdwu44ytDnx+iOkgijomCLwC3pF2FmZEF9QFD4qt5/asF5Lfyz//g4xTPOb3EtPH8DvDr5mebZ6skOJccKJm+EGGIyfL42vg14tMGZRCgLBWmoAnKrvo9Dy46jnhKlGOUJErojq7giFMdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HdhxFlHb; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-368f25ff4c4so3022104a91.2
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 00:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779348932; x=1779953732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3NPvLu4dxOkoKdNg46+oSXq3CipWU7w/mHnMaydoddU=;
        b=HdhxFlHb31qKSbw27ge6zqBrW4qTzLoC4CW/JbK43OvWrcjicwns75bxemt9fj+IgV
         GGvCY7l3A6EhurN+LbhTOAtMK7RaSlK6SsfaDLlHelN+suwbL31p8I9m6H2lOY8QqRe1
         WWzefx+wcraTGqStv8XGslVhzVn7tm+yn3dIOZw4JkSrs0djgV8x3GgU42tQ/8Fh6+tk
         PS6BtHs44rp5K8YPbDSZXg9vgXmskDFp58+n8YqSo/Y8Zc2dVcNd5/CT+70aYvF78QGQ
         Axp05AWf5gP333QI8+3w7BCJS2E10u+SYavOSkQGoOC/K6hfMhkBqtOjBcjrbygtUED+
         66OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779348932; x=1779953732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3NPvLu4dxOkoKdNg46+oSXq3CipWU7w/mHnMaydoddU=;
        b=OFr8mQfmAT718wBwKUhADVOMnjl45IdUaWFXjhlU0iA4ECYb3uxDVVKtRHJQN0Vpmr
         W/ssqbp4gSSl1RtfDEQYEdpFRgPrRvaG+YptfXRh3axQs90LsIcRXMZKzuQoXqjpQMKq
         qz9Mu40hhBVhs5CYFbwMLnpmjKYQze9ERZHxgPibxl/5nhYDWrufnWg8p47DepeJ5f88
         3jrGualEQq1StvJc+348b0TXQm5FrxB0yu67osVxUviJaQeIYAUyqYa+hWgWpHKGnSD0
         2wtdLZ/bGvA/AnEVGgocT8x8NhnXA2WGuk4rWhuHhTgpOzhNuyOSZxJsy8SAlGftQtpv
         +55A==
X-Forwarded-Encrypted: i=1; AFNElJ9WlYyIKMPTegqHvLBmcnqnK/EIoat+kfFM2HIhH1bo5QxrpKdXWH3hYG1NZK0t6DsWMXMXikY6Zss7GA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDVJywRBl8lDLE5CepPxMs7UoIAZc5tNs+oitKdVep3fn6JbZS
	RGMn20hw0KxiPc8EfnVfhur6EL+y4swFWNyWJWtnLnti1BnVOzx/RZD/
X-Gm-Gg: Acq92OFCNdGRuJie6xKSCk7fUy0ONYrQmRIP2HmBIMwPRPI7eE7zOTCfFYaMe4nxSg4
	jAjGDHrg2nQjGuOAZIRdPnmIkofgZX9zcEcn/07NO9mz/7sNONtZAgXnRTJD67ndiLYgl2sJgmB
	Js/u5mB8+6a/CO3ysOBSPc2m97THWAjWsVKLxzFbkb0DSTbh4MwgNikcvCYGfz0Ig4szI5rprw8
	uVEuxQ8mDvj9lDuxmxQmDEIDAIOvyQIiA0kMiSsmSeEGocWy76b2W1na/MsbZBs23xgJWRH5MEC
	W2VdYX2F3oplfe8P/uNZV0OXLxmoctzzauHF/kjtor8sz8hl6A1/iPimWCliybR5fo7x/KJuo8J
	EdbGjrRtzmuSdI48ru5FuYfK6jOHwe1DJkm452K7Hc0cRtfzorCB+0T4nq2iZPR3FdK6dY5Axrh
	T2Nze2ObY0JCQIKh397fgexCVnNlNw49Y=
X-Received: by 2002:a17:90b:3c08:b0:35d:a3b4:2f0d with SMTP id 98e67ed59e1d1-36a45137990mr1777189a91.6.1779348932255;
        Thu, 21 May 2026 00:35:32 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a45c5decesm783833a91.1.2026.05.21.00.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 00:35:31 -0700 (PDT)
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
Subject: [PATCH v4 2/3] media: meson: vdec: Add error handling for recycle thread creation
Date: Thu, 21 May 2026 13:04:12 +0530
Message-ID: <20260521073449.10057-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260521073449.10057-1-linux.amoon@gmail.com>
References: <20260521073449.10057-1-linux.amoon@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-62410-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ndufresne.ca,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,linuxfoundation.org,baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne.ca:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 50FC85A036D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add proper error handling for kthread_run() in vdec_start_streaming().
If thread creation fails and returns an ERR_PTR, record the error,
reset sess->recycle_thread to NULL, and unwind resources via err_cleanup.
This prevents later calls to kthread_stop() in vdec_stop_streaming() from
dereferencing an ERR_PTR and causing a kernel panic. Fix this by adding the
label and invoking vdec_poweroff() to prevent hardware power leaks.

Additionally, reorder the error path to properly mirror the allocation
sequence clear the streamon status flags before emptying the M2M buffers
to avoid race conditions, and ensure DMA buffers are released gracefully
relative to the hardware state lifecycle.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260520045905.6ACBA1F000E9@smtp.kernel.org/#t
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v4: new patch
[Severity: High]
This isn't a bug introduced by this patch, but does the driver verify if
kthread_run() returns an ERR_PTR when starting the recycle thread?

If thread creation fails in vdec_start_streaming() and returns an ERR_PTR,
could a later call to kthread_stop(sess->recycle_thread) in
vdec_stop_streaming() attempt to dereference that ERR_PTR and cause a
kernel panic?
---
 drivers/staging/media/meson/vdec/vdec.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 9244fb09eb36..8615a935e86d 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -337,29 +337,37 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 
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
 
 	sess->status = STATUS_INIT;
 	core->cur_sess = sess;
 	schedule_work(&sess->esparser_queue_work);
 	return 0;
 
+err_cleanup:
+	vdec_poweroff(sess);
 vififo_free:
 	dma_free_coherent(sess->core->dev, sess->vififo_size,
 			  sess->vififo_vaddr, sess->vififo_paddr);
 bufs_done:
-	while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
-		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
-	while ((buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
-		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
-
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		sess->streamon_out = 0;
 	else
 		sess->streamon_cap = 0;
 
+	while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
+		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
+	while ((buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
+		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
+
 	return ret;
 }
 
-- 
2.50.1


