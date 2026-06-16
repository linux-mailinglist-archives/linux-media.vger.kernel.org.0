Return-Path: <linux-media+bounces-64963-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a5j6KfkBMWpXaQUAu9opvQ
	(envelope-from <linux-media+bounces-64963-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 09:57:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7EC68CFEA
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 09:57:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=0sec.ai header.s=google header.b=RtvsuO0Y;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64963-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64963-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E47730344DE
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 07:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4C7F40E8DE;
	Tue, 16 Jun 2026 07:57:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD8B35F180
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 07:56:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781596622; cv=none; b=RUocQG4yCr5O5BkH9o2YLdQNJLlQFB5t67mmTSQEnOnemW1Sce9bnDWnxtKsW75hnYyEOZdu/RwhpA9ZGN/Im/vKcOHlD0jUMkuelfPvIM0VMdoPeZ26Q8YoWXw0IX2NViSPQorxDeo2vjV74K7NFNRxWIqiEBjIBlaC5y4o2+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781596622; c=relaxed/simple;
	bh=S+cQwh2yJbBgde+xZGNmhIizPfb/Q5tWp6DjLRWqx7U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=toTZ2eq3uM7JHCC20BU0aiIblOONo20KrPiCN4iFnH0PQCl3yncq6QPrEpwUig3scvOFlBGkvoHVy20ham7pS+F6xeV6DRHrXUBs68CB7XtpquIF3alnutTBQPdLiFh5WbFdbmdU6gQoopiOcZL+sAMIroV+1ie+MgyDSTO/ipA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=RtvsuO0Y; arc=none smtp.client-ip=209.85.221.43
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ef4223be7so2387944f8f.2
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1781596618; x=1782201418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tvO6+MpilClcYNX4EokLZGsJsErKgA+iDUMEt0HQsM4=;
        b=RtvsuO0Yz1sXz6hRJG0RJMCiIV0cIJ161Rr6gPJwCq9LyV5hcTJ+rYI9veOjkLSTWr
         HKnsEeiUI8qoW570nUh2/aQAAwyGKQVI99xqcgC1Bu8oUbcrpsUiwemWzcF+DwVNHpr/
         uPlxtpf+Lrhclz6Bv64qrHbj66zL9qhfufJzBYXPvnY20HQ7/xGqt41M4VX02CtyIAFb
         f/ggkiMwPnFKYS3HnoEYqQOzn0Y+p9C0v+rpQ5qNAY0xI4VyT+qGKE0ub946guxHWpMV
         1XioTZvHs7Kw4k2Uja640LUOfaUnHhboBwPbJxLtPxnaDNveD1UCWDLi6558kZK56Wjn
         cFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781596618; x=1782201418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvO6+MpilClcYNX4EokLZGsJsErKgA+iDUMEt0HQsM4=;
        b=Cx9NFcssaVTx3+CZp/kvG1ObKk2Dz8dTrIGBm9Py6Y4MAWITR9JlOH0hRAY4d0OPBS
         5AjOFFIhocGVDvEpUsqEwOCiNnDxZ9LRGZYl9AWSs9ZWQ/ljMQ9FPvFzMUvBqTjTC3aA
         CXddokNWIi/70JR9ecYWNZlynmv+1PwtDQzeYG6w72N2HvPa+rznfybRUWRn+BQViHxo
         xdFVWpHP6lxv5YCut6YBDY+yPRv81a5JDSWnT4/9BA6eDO5VFfHFLrufdM6230pcy7EK
         pROBnJE+4Ca+GBD6ee1oEGAESsvvwcuHl9E/sh0vS9BnG9lvc7AI+ZaXgbTzdx5+Qef7
         nkeA==
X-Forwarded-Encrypted: i=1; AFNElJ+oQmsba/cf6/uXri8TRK/87isfcJvZgakBnF7Rc3+MksCKFJVU9fKTsZieEU8Mf2Enm+azPxtbsVTY0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNX2hq5oi1npO6oMh23rWIQoG4Q8raznkH9wU0D2lIbLncunvs
	8/wngQmGVjgfZmdwCEChemZ7ATHD8veV5w1ZXyNoaSpYF9DukZO4Gkwua57YR9Sp0q6D
X-Gm-Gg: Acq92OF4rQrrg4ckCZ5nhN72H0b/e2bh6FRQrz/vQE5t2qtlEkCuw2/6IOnvmyO7QTV
	D9x63K9pEaxTRDWSo/7MuUNtGoINWM9/paZHFGKvnEv+supt5CeEV7moIRVz68SyzeivvF2MPj/
	NYm0xT+DnQUX6NutMvHhrpra/WssCHVEYplBR5voJpo4DB2SlUX/QDqnX7HvekBJmDhWBej/LrE
	pFUvcGJHpAJ3Uttgob27RrSfyREd9E6H2UORgfY/84FU5kK+VlSzcsCH2MXANk0YFEs3Qkfj7BY
	H1qHbhTsTF0d0T85GfUnqKsQ14q2tcTGmUvqCZweWXldX3UJ/HzEoBAsfsnhywT+v5kcuGtcfQE
	E7jc7fkhfiNfuvfUAZFQw67Ppq+XAFDg9sa6CtRMNekgcjI98P4ZzgPCmy3Nco9Y6+WE+QKlof6
	ucNDuvV4xqNcQOLVx5HKqIamZCzXaB8C+KiMwtHkU9rJd0aDVzzThFaEdLQtwXYAEjDoI7Qdd2I
	o1cscIeOlQCqD9e+3vx7k1J6jy3d3ourQnWHT156pTs2w==
X-Received: by 2002:a05:6000:1862:b0:461:b44c:a7a6 with SMTP id ffacd0b85a97d-461b44ca88dmr403954f8f.34.1781596618356;
        Tue, 16 Jun 2026 00:56:58 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0c35sm43503294f8f.22.2026.06.16.00.56.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 16 Jun 2026 00:56:57 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>,
	stable@vger.kernel.org
Subject: [PATCH] media: mediatek: vcodec: fix use-after-free in decoder release path
Date: Tue, 16 Jun 2026 09:56:55 +0200
Message-ID: <20260616075655.95711-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[0sec.ai:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64963-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tiffany.lin@mediatek.com,m:andrew-ct.chen@mediatek.com,m:yunfei.dong@mediatek.com,m:mchehab@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:doruk@0sec.ai,m:stable@vger.kernel.org,m:matthiasbgg@gmail.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[0sec.ai];
	FORGED_SENDER(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[mediatek.com,kernel.org,gmail.com,collabora.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[0sec.ai:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,0sec.ai:dkim,0sec.ai:email,0sec.ai:mid,0sec.ai:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A7EC68CFEA

fops_vcodec_release() frees the decoder context with kfree(ctx) but
never cancels the per-context decode_work worker first. Although
v4l2_m2m_ctx_release() waits for any in-flight m2m job to finish, the
workqueue handler (mtk_vdec_worker) may still be running and accessing
the context after v4l2_m2m_job_finish() returns. Once kfree(ctx) runs,
that worker dereferences freed memory, resulting in a use-after-free.

Cancel the pending decode work with cancel_work_sync(&ctx->decode_work)
after the controls and m2m context are torn down and before kfree(ctx),
mirroring the fix already applied to the encoder release path in
commit 76e35091ffc7 ("media: mediatek: vcodec: fix use-after-free in
encoder release path").

decode_work is always initialised before release can run:
fops_vcodec_open() calls mtk_vcodec_dec_set_default_params() (its only
caller) unconditionally after a successful v4l2_m2m_ctx_init(), and that
function runs INIT_WORK(&ctx->decode_work, ...). A context can only reach
fops_vcodec_release() via an open() that returned 0, i.e. one that passed
that INIT_WORK. cancel_work_sync() on a properly initialised work_struct
is therefore always safe, even if the work was never queued. This is
unlike the 2023 msg_queue->core_work regression, where the work item
could be uninitialised at cancel time.

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
v2: reword the commit message to stay within 75 columns (no functional
    change; checkpatch).
v1: https://lore.kernel.org/linux-media/20260615140526.52617-1-doruk@0sec.ai/

 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c         | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index e936ed8dffbaf..30906b24c608a 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -313,6 +313,15 @@ static int fops_vcodec_release(struct file *file)
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
 
+	/*
+	 * Cancel any pending decode work before freeing the context.
+	 * Although v4l2_m2m_ctx_release() waits for m2m job completion,
+	 * the workqueue handler (mtk_vdec_worker) may still be accessing
+	 * the context after v4l2_m2m_job_finish() returns. Without this,
+	 * a use-after-free occurs when the worker accesses ctx after kfree.
+	 */
+	cancel_work_sync(&ctx->decode_work);
+
 	mtk_vcodec_dbgfs_remove(dev, ctx->id);
 	spin_lock_irqsave(&dev->dev_ctx_lock, flags);
 	list_del_init(&ctx->list);
-- 
2.43.0


