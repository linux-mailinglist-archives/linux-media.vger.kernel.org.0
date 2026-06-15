Return-Path: <linux-media+bounces-64914-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h+piKLoGMGoIMAUAu9opvQ
	(envelope-from <linux-media+bounces-64914-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 16:05:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6CC686EB8
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 16:05:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=0sec.ai header.s=google header.b=fGLS6Syd;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64914-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64914-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 487E33076B3A
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 14:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D153F3F65E7;
	Mon, 15 Jun 2026 14:05:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A425C3F4DC6
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 14:05:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781532333; cv=none; b=fxQuhtScLkxnNq3Rk9wp/bvvt9IrGvyi90Je1xzXXNsUqjoHBuO4NzOo70xxdAO8kVGI+uyGoW31I6WMdFCl77PLSRC3h0FjvqpCAIgF5CMBWVpxqu/ytZipOirfcRej/P1S295Dfwf4wmH1N5ipwmc1m7ugl2xlO7YQVhv/Y8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781532333; c=relaxed/simple;
	bh=xI4wpcGzBLNVDobrh+mh7oauWpw6MFYfwjQLeCAf9tk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aG8/yoADqESc//z0iPbhM5CpLuc6fRHKt4/+SShchoyKQsgGtTs6GpTafdfl+jz7oCctIRwKbhBGipMEzsFjsUs3NvgvYOM4pS16QVUzuLT00ZWEm4uUw6iZAVE2U81s5yYfXUSQbnYf1i9lyBJtRmXIGjTG3mDbtRawbRPyeNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=fGLS6Syd; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b613a17bso30762755e9.3
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 07:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1781532330; x=1782137130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cWcO4px56bciI2pw+C/GD4p6lsmnspj/GXwm9bAVCbo=;
        b=fGLS6SydEuYONujiwQ5f7Ut8sI3BivGjb8qKC0SE8v5YDy4F+c8uEh2lbKoz7MgGLm
         gDRRqbmASB6wpi4G5C6w/sqbVrDk4EUwdbDIp6l210Gvc5rIkPASLZnCfZHxUm17jDWB
         G322h7TYGD/JC3EEowbgClzcqIibkGH2YCIsXrUuJO2ZgN/5r4N3BFxgv4dU1ZUaQ6G/
         NhDzTF0lB9C+Ev0dmJWEWGEMn+ueh4QUSdl/u4q9UIsDEiffzYZxOaPYblWsm5EXwMH8
         bid5QvYupkzb1LVJQ0e/Rb8x9WedF5a0Q0YxdoCYBJ1HH8PzUQFGWSK5u/wd3lpdZHfz
         Zn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781532330; x=1782137130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWcO4px56bciI2pw+C/GD4p6lsmnspj/GXwm9bAVCbo=;
        b=S6NcXxiQ++sFY2hiIfR//HGZAobUAr0oO43Z6Dll0+iTzJSdPHrJJj/0XGy0FOjo9p
         Ke248GPL4OTd9eYNxUW/d2BKb9u3l6LFGAYBBFdwKJ3iW2ooD37OcI4IoLxvdCDaFuh0
         OmDTXMILI9/JMNfIv/6s+IL5ONe3erZMpBqDIFUrh2F7r17rid6rl5Oke/PVYF0sa0R+
         NN/cgpALcuA2+qoW5IYtb+dnYZg+Om2uHSUeC6gLtwqhxAK9AsPcbtYEkMvdnFpUpFWd
         GLLs+YL9sUTmoG+J5sVPOIokA2n6zCZlrIOqn1XW3R6TDXSdkwqdOXvIgVeXGUU6a/eJ
         Blzg==
X-Forwarded-Encrypted: i=1; AFNElJ9Hmhf31Vs43vB37WuaA7uzcmVnqITv6qlApmgdu+ldLfl+rouWjGM6n3KOztRobumbin6WCE+AzoBpCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqEVPQYoZtP0vMHMRNqA8X5DlktyM1Zt77dV+eyLsfADA/owTr
	b3IfPBnutntrxlEYGlne6MwLXRWIsdLD72QH1q6+ChK2I50ygnVTSivTX6fF+wmfvCq+
X-Gm-Gg: Acq92OHTHjCWvMhoTy5CLHP5zMWFhdi4Yzqr6voOFz/VpTPIpIOr7VQBEkhtlDSVvdP
	PtWGoUvCPdPgLkvGZm1I8naUjaN04EecDFf7TWAFxonpBI0bru4E/bL3o0/rQy4lHhVpIbCIh8H
	A38Ls6NodAYZy6x+epeJcUtoV2h/rlNOSm5QCKCoYaSj8Ep50eOZs43TB0lyT3SSUunpeHrw+99
	x7ozh/ZHW/weluEGBEmDmx3ld4TJyPIqWJpsIFoJtpXtb8UWTTDJv07FwQWKEsFpqO1uyccqhU7
	ccPrLqo+uMIV0DqYSjtlbzSbNKVnSvGt8XdtIVMutg8RumQpi4wcg5Eql+Xw8tNA/6ZAj1R0TgL
	Ot/0z9ujOgo5C2hE+5o96g0IFLOKOY1PGL9WyjDqjBmiuoILfWRLWj61AYxwIaUGiStrwKjpQ/D
	5e9qarHtktjVRiny+QE59Cr6bBgyalWtQvD3xbIyxZRkO8fxEa/4KJdT/nr2Q8yFGC5K/jUYHhI
	k1FS+O8Okv8Xo+N6J9OiM3wwMZaxRz4wtIKC6kqhs2m3Q==
X-Received: by 2002:a05:600c:6b69:b0:490:b642:ce2c with SMTP id 5b1f17b1804b1-490ec4df221mr128435735e9.14.1781532329599;
        Mon, 15 Jun 2026 07:05:29 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203d05d1sm350721705e9.12.2026.06.15.07.05.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 15 Jun 2026 07:05:29 -0700 (PDT)
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
Date: Mon, 15 Jun 2026 16:05:26 +0200
Message-ID: <20260615140526.52617-1-doruk@0sec.ai>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[0sec.ai:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64914-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D6CC686EB8

fops_vcodec_release() frees the decoder context with kfree(ctx) but
never cancels the per-context decode_work worker first. Although
v4l2_m2m_ctx_release() waits for any in-flight m2m job to finish, the
workqueue handler (mtk_vdec_worker) may still be running and accessing
the context after v4l2_m2m_job_finish() returns. Once kfree(ctx) runs,
that worker dereferences freed memory, resulting in a use-after-free.

Cancel the pending decode work with cancel_work_sync(&ctx->decode_work)
after the controls and m2m context are torn down and before kfree(ctx),
mirroring the fix already applied to the encoder release path in
commit 76e35091ffc7 ("media: mediatek: vcodec: fix use-after-free in encoder release path").

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


