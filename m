Return-Path: <linux-media+bounces-66977-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vH7CDaA+TmpYJgIAu9opvQ
	(envelope-from <linux-media+bounces-66977-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 14:12:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 717807262AE
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 14:12:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=alP9CjWa;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66977-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66977-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6B63300B610
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 12:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36DC043B6CD;
	Wed,  8 Jul 2026 12:08:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E42E3F54C5
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 12:08:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783512524; cv=none; b=g0psTc3y6H5wJfjf1PJz52sm4Pcx51RD2MODlxG8Sb49URec7D3EPaDONtks+uYn0rClT0SHPyXwOJybJtdlUc1lukdlzLDcv3ckG4HSR3436Jdq3ZuVhQX3mZ238dlG6V/fF4OFzkW/nsuwKzekNJXjCIYOpU1k1KyJkapayA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783512524; c=relaxed/simple;
	bh=PZdxUgVPTH97DqcK6+oUruofjz7CC0UhzdFau+lZCJo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gbe3S9I+Zxz+RO6sYEuGwyEvF6IGz+/6sWtMEI6FKzUXdvGSv+MAACVyHChIXyurd5PwcD3kB4XtSklJa4u3wByUuyul8ZYrvk+mRUyUPSfWrDwWcg9bFl4PL7vSdn2XWnfHPLCOBV5HvdBCvGXGb6FnrnRMHheaBvLNT3H93nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=alP9CjWa; arc=none smtp.client-ip=209.85.214.169
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2caf228a910so4067455ad.2
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 05:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783512523; x=1784117323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X/P0XI2f+jIz2x5Bw9cZxHv5AndciwcR9koDyZ8FmdY=;
        b=alP9CjWaVrxIDJobh7MbpJTFard37z6Yd3PgdpAsp2tussZqW4umAkUTZxJoI4r1pv
         kexbgWSs2QOIuu/u/6sYFkwiXBfzMw1RR0rOLxIGqSX9XtWakR4qir5nLCEJKAreKGns
         bIzl7ee/4MpygArizlurMeb1a/mSytKAjHB0PWTLu3z9IjV2ldPGgkzXVDCmkJ4rJamv
         D8Fbf2F+T/yFgazvCTYglyrI91xGA51t4j6vhk0Ze6Vl85e5HKArJYTr8dQlNNOW8J/H
         YN6ABbQtwz8jmbu23NEPFOLX5t3ZgHm5jBM+dtPLB3UlfUypOuHf+U18F0CvuhPfurPr
         4fdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783512523; x=1784117323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X/P0XI2f+jIz2x5Bw9cZxHv5AndciwcR9koDyZ8FmdY=;
        b=bOSCNH7W9I5KomIOfGgc/Ya3GPL2j7fgDZYc25JC73CB+Sf1ZUOCeS3RcOx3hTyYh2
         W5bR3gFxIIkwrwAZXvRyNeCyo2LQ0mGuXiWEzmNDtb6KAZ+BXOFCCHZSFRV+cG29pGKb
         T+ETOC2W4+y17k/Z7a9zfAvhqRFx7RON5JtADcHK9Qy2sjHTSC2tTlXBXP21YBQlX92r
         YcGdqsCNjOIVigUS6WBj03D4DbkPHfVfDBzTbrD9EfC5FlCZrm5TGWyiusI1/YL4Jxvu
         3ndVtvBfFPqW+mpZgx/ORyull66oN7q+pgvxrgHKV/0qezm51/ZRg+gmosBVIhYlbsxZ
         jzRQ==
X-Forwarded-Encrypted: i=1; AHgh+RplOHbJjDshnJkGZnIjqXXr2tS4+FTImPmrnS5GrJRMBca1rtaI7c/zyH0akkWgZ/faJEJ3JJZ99rjH4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGXxqOOH5tveF+4ivj0V6fTCznNn0a15F9LMLVWPbQXtxMQKc/
	dbPFy1BIShoBJVIT+IdR7b9VVbgxO8zkAGP5gU+EiRNh8EiEPgk6NleD
X-Gm-Gg: AfdE7ckPY5qtW0hKKAQDXN2G+iP3Ux9hIr9xkSSRqffhOQ6iT/mfjUqPzRzEDC5hG3j
	nigH37qHJjlze0y5HbdEUYKoNvgL4ONMo3CeXMiq61VfKfvz/igegbmDSBpVbc2nZm71PulIfkU
	DFzYhGHWxcTBBOI8n33AMPaJx5hwrGzlyk8a4rlai8Csoh0usbtntsm+54yukJjwpKbrEbezFod
	G9N8FegqtELZYoLdVuK8jIHegSX511SYA+MF8wY70zrrHpe3htKd7z7sOWn8OEPcfWmFg7mTxID
	Vaoc904mDZd2JrQgms237X7BXrvTYqYuYvIw2x7cwPebxb8CBjQWGCCl/20sKc0KzUd02lifnJf
	fvJw7D3gq7Jz9qd0/5a87aX4EhltQv/eFFTFEXQ6Sy02y4lkL44raKeGrQdmjsY95yex/hyebBe
	iUMzgf+K1ca26PAQ==
X-Received: by 2002:a17:903:fa5:b0:2cc:a977:4260 with SMTP id d9443c01a7336-2ccea3b0e5bmr25272395ad.21.1783512522781;
        Wed, 08 Jul 2026 05:08:42 -0700 (PDT)
Received: from lgs.. ([101.36.109.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1f030sm27088705ad.51.2026.07.08.05.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:08:42 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Bin Liu <bin.liu@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Fan Wu <fanwu01@zju.edu.cn>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: mtk-jpeg: drain hardware completion before freeing context
Date: Wed,  8 Jul 2026 20:08:33 +0800
Message-ID: <20260708120833.755998-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66977-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[mediatek.com,kernel.org,gmail.com,collabora.com,zju.edu.cn,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bin.liu@mediatek.com,m:mchehab@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:nicolas.dufresne@collabora.com,m:fanwu01@zju.edu.cn,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:lgs201920130244@gmail.com,m:matthiasbgg@gmail.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 717807262AE

The change referenced by the Fixes tag cancels ctx->jpeg_work before
freeing the JPEG context from mtk_jpeg_release().

That prevents a queued or running JPEG worker from dereferencing the
context after it has been freed. However, on multi-core hardware the
worker can program a hardware instance, arm the per-hardware timeout
work, store the context in hw_param.curr_ctx and then return while the
hardware completion is still pending.

In that state cancel_work_sync(&ctx->jpeg_work) can complete even though
the IRQ handler or timeout work can still recover the same context from
hw_param.curr_ctx. If userspace closes the file before the hardware
completion path has run, release can free the context and a later IRQ or
timeout work can dereference the freed ctx while updating the done queues.

Drain the in-flight hardware completion state associated with the context
before freeing it.

Fixes: 34c519feef3e ("media: mtk-jpeg: fix use-after-free in release path due to uncancelled work")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index d147ec483081..bc9eea0483ce 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1202,8 +1202,11 @@ static int mtk_jpeg_release(struct file *file)
 	struct mtk_jpeg_dev *jpeg = video_drvdata(file);
 	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 
-	if (jpeg->variant->jpeg_worker)
+	if (jpeg->variant->jpeg_worker) {
 		cancel_work_sync(&ctx->jpeg_work);
+		mtk_jpeg_release_hw(jpeg, ctx);
+	}
+
 	mutex_lock(&jpeg->lock);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
-- 
2.43.0


