Return-Path: <linux-media+bounces-62411-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHG6D/+2DmrBBgYAu9opvQ
	(envelope-from <linux-media+bounces-62411-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:40:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C845A041B
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82C9E30B5869
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 07:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9DE39D3DB;
	Thu, 21 May 2026 07:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BReiTv5l"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8340D39D3C1
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 07:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779348944; cv=none; b=DV86GTc5Dm3Fsb/HwxKsqOxO+qO+LqnjL0gWYsmx4/ofFvoDQQR4EtzHJPrVsQZLW9cwEB54iqPFU/48EXLt1B/k93D8KVPAwvjdAtMhyY+Jx277hikie//8pdTW3hK6MUTLFj0diM7vbnv8o+xwqHkT2Zbpioz4OPzt6luxR6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779348944; c=relaxed/simple;
	bh=n31stoUzsPX4RNMyRRmVvUZVj4OVkqdnAHTSrpxgKN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZJE7cUqL/Jsd8YvNGK5ZOJgsNOVmd9ngbYbi9eIB0ZfMtM3sL3mgRwCtc+hWUVo3YaHdpZ/cQjHxnI9sPoIJ5XXZmM7yN9ULeYwfrjYwSDQqMg4pFz1NclzxXaRdivp6NaLpeHoeT8ofJT4t9ef/vg6BPvCeDxk9wkYBveAD64w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BReiTv5l; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36a35e4eefeso744729a91.1
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 00:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779348943; x=1779953743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mklgo4SEnQFqu5UeBwzviEPZFhn2UwuL3rIfaoDrBUI=;
        b=BReiTv5l5jwJGf+pPJh0ibysy0fl5IgAyt95k6NX2mOKB1W+Gmks7y/lgPKodMQOa3
         Z9k7XSJnyKH8Y2wFTkt90QFTpWr4gG4YH897CJaoz3ltCr95QozNn0e6p1jcIbKnHPCj
         dYdg9rCY0RICFAwOH4zKb8hob5ip3wYkq4+ok+DdMpN/sGs+kQ5xiT3t+rCdBAFZjel4
         AafJodmspQx2GrO8ZrbRROntnjupiBoJCzDuhW2ft7ItuSaH4uTdnflALBAP378N9Y3D
         oSh6FVVLw9hvNgo4fGEnjcDw151WGIg8iQcOMlIjTU4NOhigYVueei0F6jYHWyXHA4cR
         /aJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779348943; x=1779953743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mklgo4SEnQFqu5UeBwzviEPZFhn2UwuL3rIfaoDrBUI=;
        b=KkDedpSl+7EIb9DI01/ITDiMiCOnTdckSk2aPi+YwqlvgP4qBx3yDbKi+4PxuWujBq
         X0bLir0gOVKEl0rUUK1GiRfw8yUSGYc+DSEDaZdhVZ7diSFz2jsfhl6gkHoQL4HPk8Yi
         szCLuxaBerlQIHtwTg4lj3fZQAMENWj7EYVTfU4x8IppcyH9wBY8F2nR/U7VOmmdK4xo
         Y9k9GlWKMA+Sdd3ReA+N+obCwjpV/y+c6pJ3dKHq52GqF0xMmrAzJds17GT+glF5vNLx
         IpOKhyFuVJCikCx+Glvi926JHfGuDc0Nlh4Cao9LIGlTXq8W0X8g4XlEhtYhaYweUD6s
         x/OQ==
X-Forwarded-Encrypted: i=1; AFNElJ88HqpEoWlkb88I9dA//Ub6cA4huW/nq70Yz8/GniqUTv2iBRH1uVOPcIFUlpuDNqlCQDomXjjEHVtXeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+MWO0iEnyNGLVretTifrhAoX9J7DvAxAkt64lmmkPMTKSphrQ
	NjoH+Ede/gLNGQEh+/9bK2uCB0uljMslaH76qX7iXuQQZtTAosi60F0z
X-Gm-Gg: Acq92OFK50UjOhMN2bJCsvxMHQ9Fd7vefFQDDh01EGwa1oDGecnu0MooZdUg7Yr9D5A
	o3GFBVE6+XghP/aAn6mzYC4ID3ys429ILsb5WYiwa6rUgcHGw5TDpcNxEolcldGdIvyIT/OCNwh
	otlmkL/hyu8TYsHetxRqtl47996GD81QtbQRSo1Q2CuGb2BC5DtqSDZkwv+512keX+BSSLxH2Fj
	D8stmOPZywS6jkHgHChJXsFx6UKuLJgTpiAT1mrDs4hf8DSiH5iowDHsIuFH1Ma77PslU+k9oY0
	IIGkb6EcQMbc7RYhNTZTy6+xd4MDQULYZYGEllOyZ8BQ3/EcdL8fkVavdD3ltsjLz8RGPTJ9R8I
	4ry5ZoNfP5W81yCmECTPt3iSqFTQsKZEekR3D1vP7UByUK3c85iD+67hgjm8tUDcLd2qaP50zaI
	UxzQ7qVaFKproc4w4LJFUuOZBvCryEwzY=
X-Received: by 2002:a17:90b:540e:b0:369:223a:cb60 with SMTP id 98e67ed59e1d1-36a4514fbcdmr1729123a91.8.1779348942657;
        Thu, 21 May 2026 00:35:42 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a45c5decesm783833a91.1.2026.05.21.00.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 00:35:42 -0700 (PDT)
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
Subject: [PATCH v4 3/3] media: meson: vdec: Cancel esparser work in error and stop paths
Date: Thu, 21 May 2026 13:04:13 +0530
Message-ID: <20260521073449.10057-4-linux.amoon@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-62411-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ndufresne.ca,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,linuxfoundation.org,baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne.ca:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 97C845A041B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ensure that esparser_queue_work is canceled before freeing the
session context. Add cancel_work_sync() in both the error path
of vdec_close() and vdec_start_streaming() and in vdec_stop_streaming().

This prevents background work from dereferencing a freed sess
structure and triggering a use-after-free.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260520045905.6ACBA1F000E9@smtp.kernel.org/#t
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v4: new patch
 If vdec_close() calls kfree(sess) without first stopping or synchronizing
with this background work via cancel_work_sync(), could a concurrently
running esparser_queue_all_src() dereference the freed sess structure and
trigger a use-after-free?
---
 drivers/staging/media/meson/vdec/vdec.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 8615a935e86d..a57bd4a8e33c 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -358,6 +358,8 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	dma_free_coherent(sess->core->dev, sess->vififo_size,
 			  sess->vififo_vaddr, sess->vififo_paddr);
 bufs_done:
+	cancel_work_sync(&sess->esparser_queue_work);
+
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		sess->streamon_out = 0;
 	else
@@ -415,6 +417,7 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 		if (vdec_codec_needs_recycle(sess))
 			kthread_stop(sess->recycle_thread);
 
+		cancel_work_sync(&sess->esparser_queue_work);
 		vdec_poweroff(sess);
 		vdec_free_canvas(sess);
 		dma_free_coherent(sess->core->dev, sess->vififo_size,
@@ -937,6 +940,7 @@ static int vdec_close(struct file *file)
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
 	v4l2_m2m_release(sess->m2m_dev);
 	v4l2_ctrl_handler_free(&sess->ctrl_handler);
+	cancel_work_sync(&sess->esparser_queue_work);
 	v4l2_fh_del(&sess->fh, file);
 	v4l2_fh_exit(&sess->fh);
 
-- 
2.50.1


