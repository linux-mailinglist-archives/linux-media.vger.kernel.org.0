Return-Path: <linux-media+bounces-64915-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NsQzOLsGMGoJMAUAu9opvQ
	(envelope-from <linux-media+bounces-64915-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 16:05:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E597A686EBB
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 16:05:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=0sec.ai header.s=google header.b=ZWOerHzS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64915-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64915-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AC8CA30074E5
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 14:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E5E13F54C3;
	Mon, 15 Jun 2026 14:05:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34BE3F660E
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 14:05:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781532335; cv=none; b=pNUJ8xYegXEITjKme9kxea1y6BtcANN6izmVOGT7YaMnKMHi2+sbuaol8UPjyE+m7/5G55ZhuAZe4sXaAwOc+8+IYe9hxZ9Km2QZkoGJlel5scS7hs0IFBtzg6GxaW7XZwXpJ/utYKFbKYpWnbiCqUSv5qgVJvS4Brc9fD9ZMNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781532335; c=relaxed/simple;
	bh=wNlRLgc+VfgMCDRAIjUgYi0AoA49S8oofmEjD+i/wcM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BU3xjU8YHmcHn7BnvMiVXqvZTgXenJrXFcNE/kKFsIPvWHy4XgKpayeX1/bpvR3zmAzvwf8rppm154Efjz9ueO3TqW25QlcRNb+/444qbrE+6TDVu/VcsFEYGdjB+8o/0o3r8jnymyQTuAlsW4eGV83rKeE12RIqkT46SvTdcl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=ZWOerHzS; arc=none smtp.client-ip=209.85.221.50
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45fd461e4a5so2735412f8f.0
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 07:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1781532332; x=1782137132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6MN3j+7e1dFG2jfIP/6dw1N/4Etu3I0/uUny4h6HJVI=;
        b=ZWOerHzSZ938gXKvVOH4NC1cgH1XBk5z17+ek9oivHagntLg0w7XazcPwzCv+B25D8
         rlI4yzMl+u2NLsEikki7kUhMGLCLyeoODNyOHoFr5c6tufbF1QpW0t+kOGefTK70Wcow
         AG04xN8tTYWURz4pZk1c59Y+8P7sUuKEEb0wPthZIXTHBl8aJk4oI9WStlyziqTeaPmq
         wxwLcOdHtEg8gKBOSI8S93m1VjrDxRWG7AxMt6QNvTit5FmkbqttONtfLubxOHT7RUJ3
         e/Yp3k1eT+Fr21yUjFWXNs9SZwYEKl6tnS3n6+lqMxSzmwnoaqWZEcqZc5mhkcEyduaD
         6H3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781532332; x=1782137132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MN3j+7e1dFG2jfIP/6dw1N/4Etu3I0/uUny4h6HJVI=;
        b=cUR1eu9PJ239phoTnyRDTF8ahhgNv+ykbtpFFQs0PpasgJIlt+AfKect1bLUlIkVEl
         0ooRbxPwp7lh2mH7nsWjw6/ystDq0Q3C5qkmV5Xngc4afb1g2BTF6ZV2SlELiuIa8Lma
         ZX07cuY0vUonM5ZOsLQm7Fy66+1vwbTVzbfx2v6teDmeFpYw/ADc4+qlMXiPB+KkWsPC
         bhfmL5XViPWYi9tpHhvd+vxfvbvd/3gAe7awXhQe4K//NL/agJrblr7nm1SIxEHSGHr7
         /yN48ZpvMS7XVWpDhsKqNA0SzqFMN3Ek0aLIjxcEvtdlkyC2i54pVoQXjb69gl65w3Gg
         80Yw==
X-Forwarded-Encrypted: i=1; AFNElJ9RNTYoz0+meHxmgX+f9UBxlJ51eTYLo3dxeRyKQ2s9QHWDEIdBhE5I1KhP3j87Ow12jmafeYnpQdAvAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKhPRjSYqHvaABcGOQW9SoGb6UviIn8wgr7OxsMcpNmuR1BPv7
	/mHwQN92nHcMoYkFAtN/wqsJidEdYKc0BabspbxQ04Bo6sJQY+JC6OyMJENJgjYgVzTY
X-Gm-Gg: Acq92OGPDa5JyE4BYjB+zTftCJkVdD4jqLzJI3wIvCuhooPS85rWpa1Okb2VboXCG8H
	lYwaAZG3gWCWc1hGhPV4D3QrlZWjqispJkHveFvC0sPh4RWAU4ZN1h8V51ORCIpAclDrJVIz84U
	3QeGP7GzsrKCq/GlKLjnULBcKl09RIFwMiRyMKuZyHElmG6fW3DvKA6yjSJ4nOC6sgcwEKB2SeQ
	mURoXoa8UluX9aE/FTs0YzWLGJie/+QMeSyoy7GYE+J1xK8A5k3Lw9OWNg3oxflYwzAOewsxPwt
	Lh001G6fkx/+A+L71XmvL1p269MRdpbAWzRPgfVqez/qtyyH+a4fU3XOYTrLhjRjkQwoNDe6CrR
	DAMsZBJTBJ2iRKxeES/esL+mXmbKNefPz02c3MmZsOoAO0V4Yd3DuxO0xhU51nNGB/y0SU6I9Fj
	5nZ4PlMR86qFBMuWCUU+SHsZS5OfTFy8Nz7SbZMWULJLH1uWQZzHx2MlT9WLryxYr5dkSMHo4/D
	HCQIyv61syufKzwf+eEeHgSVXNoE4mD/uwpw5iMw58Daw==
X-Received: by 2002:a05:6000:1844:b0:439:c18f:5aaf with SMTP id ffacd0b85a97d-4606dbf15f5mr21550537f8f.34.1781532332022;
        Mon, 15 Jun 2026 07:05:32 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f3basm33177359f8f.12.2026.06.15.07.05.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 15 Jun 2026 07:05:31 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: neil.armstrong@linaro.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	khilman@baylibre.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	mjourdan@baylibre.com,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>,
	stable@vger.kernel.org
Subject: [PATCH] media: meson: vdec: fix use-after-free of decode work in stop/close path
Date: Mon, 15 Jun 2026 16:05:29 +0200
Message-ID: <20260615140529.52653-1-doruk@0sec.ai>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64915-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:mjourdan@baylibre.com,m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-staging@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:doruk@0sec.ai,m:stable@vger.kernel.org,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E597A686EBB

vdec_close() calls v4l2_m2m_ctx_release() and then kfree(sess) without
ever cancelling sess->esparser_queue_work. The worker
esparser_queue_all_src() takes sess->lock and walks the source buffers
of sess->m2m_ctx, so if it is still pending or running when the session
is torn down it dereferences freed memory.

The work is (re-)armed from several places, including amvdec_buf_done(),
which runs from the decode-completion/IRQ path. That makes the obvious
fixes insufficient:

  - v4l2_m2m_ctx_release() frees m2m_ctx (and runs stop_streaming via
    vb2_queue_release()), but never cancels the work. Cancelling in
    vdec_close() after v4l2_m2m_ctx_release() would wait on a worker that
    may already be dereferencing the now-freed m2m_ctx.

  - Cancelling in vdec_close() before v4l2_m2m_ctx_release() keeps
    m2m_ctx valid, but the hardware is still live, so amvdec_buf_done()
    can re-arm the work right after the cancel, reintroducing the UAF.

Cancel the work in vdec_stop_streaming() instead, right after
vdec_poweroff() has quiesced the hardware (so its IRQ can no longer
re-arm the work) and while sess->m2m_ctx is still valid. Because
v4l2_m2m_ctx_release() always tears the queues down through
vb2_queue_release() -> __vb2_queue_cancel() -> stop_streaming, this
single cancel covers both the STREAMOFF and the close paths.

This does not deadlock: the queue lock (sess->lock, shared by both vb2
queues) is taken by the worker, but neither the STREAMOFF path
(video_ioctl2 serialises on vdev->lock == core->lock, and
v4l2_m2m_streamoff() calls the lockless vb2_streamoff()) nor the close
path (vb2_queue_release()) holds sess->lock when stop_streaming runs, so
cancel_work_sync() can safely wait for the worker.

Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Cc: stable@vger.kernel.org
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/staging/media/meson/vdec/vdec.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4b77ec1af5a7..42822064cf8d 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -419,6 +419,16 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 		sess->status = STATUS_STOPPED;
 	}
 
+	/*
+	 * The esparser_queue_work worker dereferences sess->m2m_ctx and
+	 * sess->lock. The hardware (and its IRQ, which re-arms the work via
+	 * amvdec_buf_done()) has been quiesced by vdec_poweroff() above, so
+	 * no new work can be scheduled past this point. m2m_ctx is still
+	 * valid here. Wait for any in-flight worker to finish before the
+	 * buffers and (on the close path) m2m_ctx are torn down.
+	 */
+	cancel_work_sync(&sess->esparser_queue_work);
+
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
 			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_ERROR);
-- 
2.43.0


