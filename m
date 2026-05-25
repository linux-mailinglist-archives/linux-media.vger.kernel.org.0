Return-Path: <linux-media+bounces-62710-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBuECr4cFGoGJwcAu9opvQ
	(envelope-from <linux-media+bounces-62710-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 11:56:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E15F5C8D67
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 11:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4BAD3037DE8
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 09:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A7DC3E8328;
	Mon, 25 May 2026 09:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTD236eX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDE93E3C79
	for <linux-media@vger.kernel.org>; Mon, 25 May 2026 09:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779702779; cv=none; b=uxOrwCkaLRGvv+lxPSK6Yp/Xgb+HrRVtRmCv3KKVTLUxXC4XlktzQXM3P3ZeVl+QI2iLHN3S72isy5D3bRusVLjmtRo9r1oErKXORRnD5tctd2raxxhZXDfOxr22Dbw+VSZwAdChVMD/FfqRN8vv6Bgbfp+tpWYMqlKtOvPDx20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779702779; c=relaxed/simple;
	bh=YXwLVmvrPT3CxIUwe1z2kjZT4+cCRWaplcDqgHQKXS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EDR8ZQ+LyBhRFzYsjidDQuc45O3XtW3cmNBuS2a4/L6AWSEHvarI1qTdskdX5qS0gm5IaazR5B1F3jK3trmAg2LbSVU5mL7WFIsckzeCkphrJHGvUSw5CQbz5nqAUqJQxnLEDLudy+Xqr9KWUCjcmZRLo5wfFobVU4XZnrlv33E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTD236eX; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ba0714574fso51121155ad.2
        for <linux-media@vger.kernel.org>; Mon, 25 May 2026 02:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779702778; x=1780307578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2KznrLCQ77VZ51Z4KvrxVufB2DqA7HTlU0nEjlF/zw=;
        b=CTD236eXwI4Dgzt3N534Wd/Pr09C2fNX4w8CgDnjYyvNwOUbyIk8mCi13rUVwz1Rr0
         rxKXmosAkTxyjxA4ezwiAAEoAhUaXteqaAmzD1ferJ0iDZMJpCkYFQABO+Nx3PBElMLc
         CX8BEDb7+s9L/LEhHzQHGvYRzDBBQzlDxplR7UECqvRbRlntVChEogoqvdfRz7ulr7P8
         IECb5UHV0HJjI9YVQ6Uujy5HGNtyOpZ/+fMOa7NCqPMh02htLyMKU6qw6wWonDrtav4K
         6zpTBJYpup7AlGWgAM7qHh/D3/FedlnqgBxpsTr/nOPiXJ6Lw5EwnMK6a3INOMG6LNcA
         0tIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779702778; x=1780307578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v2KznrLCQ77VZ51Z4KvrxVufB2DqA7HTlU0nEjlF/zw=;
        b=LiY2ZA07T1goX/y8zOq5UOh/U9lAoeSAa8GUe6ll2pd5C4m83BG/fXTATyOUf5ZAhr
         1VCg6BW4tnzdd7OkJjVgu8rZjsIal5RnwdFEyJl5jFqOzP7g2M4vkT7AREjoXEFhviGs
         +3jIBfEvDED4drRN/RrxjObMlPuE6NfXTBgj74Y2vx4sDN98v6/1yfEiav3JF7hbeAKo
         jNUbzhgtjQhmV7rGlwD8az3dHjljiWDZNNmETKsoUIog6l5bNnv4LnCQ09Bt5eVtoCrC
         6WWO8acj3sdctZC3cQx8mAXfh5WZe5eTFUT5sQaWEriuJ2SrnEdIRS8f1nRG8d/L40JS
         0TmQ==
X-Forwarded-Encrypted: i=1; AFNElJ8N3POyVgfSIAS5W4RZkpeyx6zcx+oFPk4TxKhI7K0MH1C7kQTG7bnmCJx4xgC29mnviw4j5OoSH6vHbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHPQKEvtfFBCGMocXCfbCN96Y62x5JwuHU8+YfI34Vy1aOVCDQ
	5oNoQLWNJ8IHUPcNRvEV4MmYI2iLNuzIlDTBLKiVs72afzmi7jRbLy4E
X-Gm-Gg: Acq92OEUkR+wMYkW6kOeLD0Je2sry95F7SxN1BlNHGzRRmF3rhoVILmT2I9Gay2wdFL
	FWfx32VrNFqQC2GFqWYGaXLMbf17ZjhGof7pcoE+lvXBUjTo3d2oV2nyuV+2FHgx0oYSDEZ1MbA
	knOSkziZohUmx8SeKaZJBsHUgiUWzSbCiBz/ZubcHpPI6lXLn/YuecbpvP8qTjoNbqP674ZWW/+
	KkewCewnEP2Q6goJPBCy7S0aysJriDNZdOteVpl3j7sFCJHS8NfvHAd7v8STy8goBZF7GpSeJMo
	F7wuxgvm2ReUlk2q0/ptCCtGk4XHIF+XjCkc+Ic41W4PY4tmHe3h2bGgec2/P1MCXo3aTjvoyWU
	Xt0I0bbreAckpupl2hkZ2xQdDtrr2PyghguUZY1EsTqa0TXIE/U2GpSSN05TihKHIXAFhYKMihJ
	X/Etylj2sUdLTuFMR/wSxA
X-Received: by 2002:a17:903:1ae3:b0:2ba:bfc:76a8 with SMTP id d9443c01a7336-2beb057f8c9mr151250385ad.16.1779702777738;
        Mon, 25 May 2026 02:52:57 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2cd6sm92533615ad.52.2026.05.25.02.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:52:56 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v5 3/6] media: meson: vdec: Set cur_sess before hardware vdec_poweron()
Date: Mon, 25 May 2026 15:21:51 +0530
Message-ID: <20260525095216.12078-4-linux.amoon@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-62710-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 7E15F5C8D67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

vdec_poweron() initializes hardware and unmasks device interrupts. If an
interrupt fires before core->cur_sess is set, vdec_isr() dereferences a
NULL pointer when updating sess->last_irq_jiffies, leading to a kernel
panic.

Fix this by assigning core->cur_sess and updating sess->status under
core->lock before calling vdec_poweron(). This ensures the interrupt
handler always sees a valid session pointer. On the error path, clear
core->cur_sess and reset sess->status to STATUS_STOPPED to avoid stale
references.

Following change also strengthens the hardware exclusivity check by
holding core->lock during session assignment, preventing concurrent
sessions from racing through cur_sess == NULL and corrupting hardware
state.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v5: [Critical] Race condition between hardware power-on and `core->cur_sess`
 initialization leads to a NULL pointer dereference in the IRQ handler.
---
 drivers/staging/media/meson/vdec/vdec.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index e72f54af026e..52ace4de967c 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -334,6 +334,11 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	atomic_set(&sess->esparser_queued_bufs, 0);
 	v4l2_ctrl_s_ctrl(sess->ctrl_min_buf_capture, 1);
 
+	mutex_lock(&core->lock);
+	core->cur_sess = sess;
+	sess->status = STATUS_INIT;
+	mutex_unlock(&core->lock);
+
 	ret = vdec_poweron(sess);
 	if (ret)
 		goto vififo_free;
@@ -344,12 +349,14 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 		sess->recycle_thread = kthread_run(vdec_recycle_thread, sess,
 						   "vdec_recycle");
 
-	sess->status = STATUS_INIT;
-	core->cur_sess = sess;
 	schedule_work(&sess->esparser_queue_work);
 	return 0;
 
 vififo_free:
+	mutex_lock(&core->lock);
+	core->cur_sess = NULL;
+	sess->status = STATUS_STOPPED;
+	mutex_unlock(&core->lock);
 	dma_free_coherent(sess->core->dev, sess->vififo_size,
 			  sess->vififo_vaddr, sess->vififo_paddr);
 bufs_done:
-- 
2.50.1


