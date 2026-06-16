Return-Path: <linux-media+bounces-64962-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hsdwLC8AMWoIaQUAu9opvQ
	(envelope-from <linux-media+bounces-64962-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 09:50:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAD468CF2B
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 09:50:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=0sec.ai header.s=google header.b=Hbq4baE1;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64962-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64962-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 920BB302E0EE
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 07:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662E340E8FB;
	Tue, 16 Jun 2026 07:49:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B6540B6E0
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 07:49:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781596198; cv=none; b=AxGLHc60vAcpLVyuB/5MuI+qYvQJQjqolQ1+qUstVUHvPJeloQhERFTn+pvacwXEjNF2lRlP50/KmvyQ8SkFbryRWe4+QoapXPxF9NwuX6gB4Z+rgg7ayvAbsvlHZcvhg1cMsg9cyCJwVv+GrqjqV4d0SQKzJRZ6a4E4WGQUu0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781596198; c=relaxed/simple;
	bh=oGgWXj8gVkwv4KfYrvvS3qIYC4JcwZ6jY8+B1j5PPsM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IyDtk16a+g5IXSx4lVlXx4OUiIZr4cZ8Dq7veEqfryTjBYacuLN6+qt0zjwNnApdsxFiQVgaQI2q8BC5fQj+PCOSQdq0uAab/A15mFkZmMo1/kkwcWCwmA3HqwyeGAjA3wbFm0C78ICTMrGwog8IY+2BeJEESN7800PgWRWsjto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=Hbq4baE1; arc=none smtp.client-ip=209.85.221.51
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45eeba68948so3113707f8f.1
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1781596195; x=1782200995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fw23X1FwjGe46vUwZBuX/t+y72XuixGwM1Rny5Zyri0=;
        b=Hbq4baE1sojA5KfF2v9P4S/RZKlCxdihiJtCWddYFA0auWHnJbyRxUxcPqN9rb2clK
         20se9FlIa+hDI7eGLi4rbLbW61TINhJjp0HXHgWi0vt8xqRokcbf+qZathlDa7d/vcpd
         YOav13yFcxSJ16xe7R0OZ1SUh9NJxfkAq+/+fRMmPzkLMDs0W+5TlreAn4OfiL8cVht9
         BtgQXhLxaexPDXwGdeq7FbEafeliFrUTXtsvhjSfduwqaMIETMJWFcsjCO+MfkF04RIS
         pw+GLBo6EBLuLlQczfZSkenEimlx3NjnxIWhtD01yb+VmLkM9XDoeQRwMelDBLpUEOZF
         DmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781596195; x=1782200995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fw23X1FwjGe46vUwZBuX/t+y72XuixGwM1Rny5Zyri0=;
        b=Z7YZ8FTMYl740yI+Ly5hzNSKAZn339gTvRQgElPa4vYBQxRa2ZiI1iQ6tYe10m1HZ6
         mUJXDWwYhgcDapvY7kq/nD0g+tCGCx6NnZlOlL6YsTwx2P44LVVuXh8cOoOcy25UNjkY
         LC+6VunPxfksUSBPrTWmPvzyoVsCOFX7jfZ/KF08ry9iY3k+UsHmhr/paNwMVr14RhWP
         oj84BI996SGBS9/mc/eR4b+O1fpONdM3y3hJho2NMfOuC6wVWY6uRLvn4KBRjl45khte
         blrh1u0s71QJwpn0982F7coMwMmMl0blwVQyRq3B7K/V2vM4skG7m1bNpc59qpvh1f9q
         5GlA==
X-Forwarded-Encrypted: i=1; AFNElJ/P9eIJlbfb8ywEZQVCPJ8S5O8MHNlWrN3rBW6YJ3SmHwLYCNMvrIsDhMF+NVUsDsDVAMBYNmyBVO/sUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZA44iMP03HQyU6xPFLhF4Sxw2yl2xA1bhVOotbBM6qfWsyJJ6
	r47NuNNnhMCTCpkqulmLBaAxanei70B3y+79wKALNSZrwH3TROVRTXbxizB/Kt9xn6wt
X-Gm-Gg: Acq92OFG1JUNnZhUVXwOgH1EPtK6P0SXnjkcb4gaN7fZB1sis92RjHJLc3Ja7S5DMPb
	8ICfje13D07Yzd5h8wBvHL7bDZXs+eAQb7ANx/6jKzqcenWei9JEua+1g3OKxPjeVif8xmFSLHY
	g4iqsOqsmRxYP/9FqdleAfCMax/W/FoiwQpih1Ysgli5lxpqFsoiKAf/6N2CUnElH3xer+trjac
	vUwZ8sMWbGfCM6PAgB7LEG2sn4lrS4fdmVbdaAGRi9UYYHlRD6suY4O4/GD+uhh6jOOpYzQC/T6
	45m1xfZWlg011N8rdYFdTXWqZ18bH/QEYRfHLSa4jptGTTAgnKtdWCgHXuLNnsco9P40GURfWf6
	S5zotEnGEhp08zPA48pKHuPxrRM9k1CM00alsyWR1+5NDPGD6i8LWtvPjuthGJqwjDuDp6j80uV
	Ox6B5cz0CF+w2JptynA5J9tb7QtyEduSt5kxYWdc/TF89i/16Bcun4tBdB3JE+pnG/T1JfI/M/j
	kIxM+4Ii7u2LDkwDXtYBUJE2Srzpjtx4cP7oLUdUpGqXRBMBN/Gadc+
X-Received: by 2002:a05:600c:6286:b0:490:b355:9c70 with SMTP id 5b1f17b1804b1-4922ff93b2cmr36681535e9.11.1781596194984;
        Tue, 16 Jun 2026 00:49:54 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f20e77asm44475179f8f.0.2026.06.16.00.49.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 16 Jun 2026 00:49:54 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: neil.armstrong@linaro.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	khilman@baylibre.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: meson: vdec: fix use-after-free of decode work in stop/close path
Date: Tue, 16 Jun 2026 09:49:52 +0200
Message-ID: <20260616074952.93076-1-doruk@0sec.ai>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[0sec.ai:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64962-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-staging@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:doruk@0sec.ai,m:stable@vger.kernel.org,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	DMARC_NA(0.00)[0sec.ai];
	FREEMAIL_CC(0.00)[baylibre.com,googlemail.com,kernel.org,vger.kernel.org,lists.infradead.org,lists.linux.dev,0sec.ai];
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
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,0sec.ai:dkim,0sec.ai:email,0sec.ai:mid,0sec.ai:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2AAD468CF2B

The ESPARSER worker (esparser_queue_all_src(), scheduled via
sess->esparser_queue_work) dereferences sess->m2m_ctx and accesses the
ESPARSER/DOS registers. On the stop_streaming()/release() paths the
buffers and, on close, the m2m context are torn down while this worker
may still be pending or running, leading to a use-after-free of the
freed session state.

vdec_poweroff() previously only called vdec_ops->stop() and disabled the
clocks; it never synchronized against the worker. Two problems follow:

  - The decode (VDEC) interrupt is threaded
    (devm_request_threaded_irq(.., vdec_isr, vdec_threaded_isr, ..)) and
    its threaded handler re-arms the worker through amvdec_dst_buf_done()
    -> schedule_work(&sess->esparser_queue_work). A handler that is still
    in flight can therefore queue the worker again after teardown has
    begun.

  - The worker touches ESPARSER/DOS registers, so it must not run after
    the clocks have been disabled.

Quiesce everything in vdec_poweroff(), in order, before disabling the
clocks: vdec_ops->stop() masks the VDEC interrupt in hardware so no new
IRQ can be raised; synchronize_irq() on the VDEC line then drains any
threaded handler still in flight (the only context that re-arms the
worker); cancel_work_sync() finally cancels/waits for the worker. After
this nothing can re-arm the work, and the worker can no longer run with
clocks disabled or against a freed m2m context.

Only the VDEC interrupt is synchronized: the ESPARSER interrupt handler
(esparser_isr()) only acknowledges the start-code-found status and wakes
the internal wait queue used by esparser_write_data(); it never touches
the session or schedules the worker, so it cannot re-arm it.

stop_streaming()/release() run under the video device lock, not under
sess->lock (the mutex the worker takes), so cancel_work_sync() here
cannot deadlock against the worker.

The VDEC IRQ number is now stored in struct amvdec_core so it is
available to synchronize_irq() at teardown.

Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Cc: stable@vger.kernel.org
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
v2: also synchronize_irq() before cancelling the work, so a delayed
    threaded IRQ cannot re-arm it after cancel_work_sync() (raised by
    automated review). Only the VDEC IRQ is synchronized, as the
    ESPARSER IRQ handler does not touch the session or schedule the work.
v1: https://lore.kernel.org/linux-media/20260615140529.52653-1-doruk@0sec.ai/

 drivers/staging/media/meson/vdec/vdec.c | 21 +++++++++++++++++++++
 drivers/staging/media/meson/vdec/vdec.h |  3 +++
 2 files changed, 24 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4b77ec1af5a7..5304987546fa 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -123,6 +123,25 @@ static void vdec_poweroff(struct amvdec_session *sess)
 		codec_ops->drain(sess);
 
 	vdec_ops->stop(sess);
+
+	/*
+	 * vdec_ops->stop() masks the VDEC interrupt at the hardware level, so
+	 * no new IRQ can be raised past this point. The threaded ISR re-arms
+	 * the ESPARSER worker via amvdec_dst_buf_done() (schedule_work()), so
+	 * drain any in-flight handler before cancelling the worker, otherwise
+	 * a late threaded IRQ could schedule it again after the cancel.
+	 *
+	 * The worker dereferences sess->m2m_ctx and touches the ESPARSER/DOS
+	 * registers, so it must be cancelled while m2m_ctx is still valid and
+	 * the clocks are still enabled, i.e. before the clk_disable below.
+	 *
+	 * This runs from the stop_streaming()/release() paths, which are
+	 * serialized by the video device lock, not by sess->lock (the lock the
+	 * worker takes), so cancel_work_sync() cannot deadlock here.
+	 */
+	synchronize_irq(sess->core->vdec_irq);
+	cancel_work_sync(&sess->esparser_queue_work);
+
 	clk_disable_unprepare(sess->core->dos_clk);
 	clk_disable_unprepare(sess->core->dos_parser_clk);
 }
@@ -1053,6 +1072,8 @@ static int vdec_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	core->vdec_irq = irq;
+
 	ret = esparser_init(pdev, core);
 	if (ret)
 		return ret;
diff --git a/drivers/staging/media/meson/vdec/vdec.h b/drivers/staging/media/meson/vdec/vdec.h
index 7a5d8e871d70..9a50116a2665 100644
--- a/drivers/staging/media/meson/vdec/vdec.h
+++ b/drivers/staging/media/meson/vdec/vdec.h
@@ -66,6 +66,8 @@ struct amvdec_session;
  * @v4l2_dev: v4l2 device
  * @cur_sess: current decoding session
  * @lock: video device lock
+ * @vdec_irq: IRQ line of the VDEC, used to synchronize the threaded ISR
+ *	      against teardown
  */
 struct amvdec_core {
 	void __iomem *dos_base;
@@ -91,6 +93,7 @@ struct amvdec_core {
 
 	struct amvdec_session *cur_sess;
 	struct mutex lock;
+	int vdec_irq;
 };
 
 /**
-- 
2.43.0


