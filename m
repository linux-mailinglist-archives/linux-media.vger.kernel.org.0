Return-Path: <linux-media+bounces-65310-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /RHnHnqZNmqXBgcAu9opvQ
	(envelope-from <linux-media+bounces-65310-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 15:45:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DEE6A8F58
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 15:45:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=H2iyMMSQ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65310-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-65310-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 046F13006231
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 13:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 018391BBBFC;
	Sat, 20 Jun 2026 13:45:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BB3199931
	for <linux-media@vger.kernel.org>; Sat, 20 Jun 2026 13:45:21 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781963124; cv=pass; b=lrLKZgFLXohLjRpuli8qkO5DchaLqiyCtAUoVgZVXJtR0r9RFiYZ47N0NAky+tbh8LaQC/VakXddfEq0F3ujW6LRtb9/rnyZKU+JPbmjUl5P+GOHWv9QT8QicBOLYUOc43ljdFzKhCAdukOCtmX7MdLT6Y53dlAy7Ib5pstNbBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781963124; c=relaxed/simple;
	bh=Wzkfo1PCI6yYI3BNtzflo3vLt1B+B8Ol/QtG8nHmE84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UIXA/2fYuhxn0kCdU5SoRqIKj4+IQXZWjsvj5kUwqc9Whjbe44Hd6oO8+4O5MEmbR5+HgcqcDx6cZGFErmIa0J+S1q+FqwDy0sGqj9hsKXjrWoLNK7rHcdYwRnKPUHNqM7to16HYBOZEmeUK5yEkoOtavNX5FHu7xAmZ0To+Lew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2iyMMSQ; arc=pass smtp.client-ip=209.85.218.44
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c07a6527453so370452566b.0
        for <linux-media@vger.kernel.org>; Sat, 20 Jun 2026 06:45:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781963120; cv=none;
        d=google.com; s=arc-20240605;
        b=POYmpYqyQ5/dxLQIbilRomXnyOw3gnBvQ93rSH7tiMaI00VwpYIvZIC9e0yd72CY2b
         Q3scgjH6Sy9WPRahBcZ42kfrJ7BhcNajq6kMroWhUwyPTvIyU76jOvuGxh9E8jfSHtDA
         18JnvI6gAdY8N1UL11OYg7s8doKZinA/e1laKodhiaxHp3773ihww13pUOsE/imFizVq
         kbgfYNFuv//TcBeVlUAVhCuVavgqPOFbVLO2bAPWnqLPJyu7N/gy+QKEPTnCDVXU4Yn1
         VVW1lQmcyaKu3eEDQ76d9uUw1vGABl1oLz73H6B2mU/4pyBNcPDO7hCU2jJKg+vOush2
         O7rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=utXWx3oSNzw96wlO+XOiybZZ9LJhhovVhCeiDDuSymI=;
        fh=NRs2w66u+MgX8wm3J+GNOj0desAifimx92jJAt4+UkA=;
        b=b84DQZIDSdZZs73p0YKsvAbc0NyGe2rN98uZ3CI0IBExz2OKR+C9z4w0OaIMFmL+xd
         TNb4620qYX+F0gbPJ2wzXM9njEc7RD4CGlodtxzrIXipecbT+l847yACf/dDFkyDbSDU
         be1Li41A78XVkIpA0zIrftGEi9LGuH4hjl0RZZBesfKBwZIl7YG48t/VBSEu/BR7GLGu
         HHFQiY2gCgF2VprZCO0yNdT7GpV8w7bIrjr/bs74nzdiO/ZZ3W6l630FA1LMEp7GGnQ2
         QmXGRThJAwRdIgvIZavjGDEMk33/VODRnBnTXz5dp7BFATpf6WJzTQQRx4Z8smjg/Y6y
         du4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781963120; x=1782567920; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=utXWx3oSNzw96wlO+XOiybZZ9LJhhovVhCeiDDuSymI=;
        b=H2iyMMSQb0Jyyg2YnxAy7OpI//F8pQj783JZqKskKP7GMSZOAlK08PZQInEC+ko1sV
         WPoujzdQLS1R9j3IAhfncvFE0khCctd+98C/rFPzh5cgNEHa8owTWEAyMOdPTtX8NdQW
         hMG2YhPfmO9gokzYPCpMe5VaSTzlkBrVL2fZbnQ9OB5+OHsEmcOHoCx1XpnbKGxrPNW7
         5qSfG/6i7+5hlrimnSgoAwYfOjB8p0kWdDAZg5QlJ/BqnziesKD8h9TfTxuKDwTvY8w9
         P78BpKj8ytIf6XEPCt0rGje7497IJkxBrjjKs0SWQMycuLp274k0kfY8YeWAdeg2U8Po
         lNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781963120; x=1782567920;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utXWx3oSNzw96wlO+XOiybZZ9LJhhovVhCeiDDuSymI=;
        b=d5R/mrLsoygtc/bvr2g7RH5cqbJKrEWoQdMJpumkWZhpz7I9N/V8gDrE8thBn6alhT
         J04rHMMQijQh8kjFAL9WUlTRB58uLYIvXLIRu5XtbuPL4jUREwuKOYPeGdeGZyC+tNbR
         aD9DHe1TH86FDexsLpshvmFSU57GSF6zb3YPv3oVLJpUseli3mGKBf+tNHJUyUVNiW7q
         +Kzc1nKL3PdtiNuEyaSiup+Ez2B7bC3XLdjhboCT2BvYetC0WP2whI2FoXiw6aH3qPK7
         WT07rSKJRbKiu62uhIOIi1NLWmBYSfgy/96RTZkqmf60xMcsJuykf9tE2GRGNzcQsrkh
         101w==
X-Forwarded-Encrypted: i=1; AFNElJ/hPp8NDBzPWX8RtmAIxSyoEtAJGUHI9m5CyifBHCq6PlgH0tEMhOhmWCD82tc45YZXFjp7JNmLF/zwgA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5IQiVlZupkmVk2qlFO3zQrmP3ffzW4ccnspx5Od/mxSgqAXYK
	V+4iQVFhJuFWhqU3xYtSm01SR8sW9BrHQRKeL8fZXlJho3ItK9dXzaSK8G8NgBzj8ZG+F11QO2W
	vO6fkZx8X2v8OZ9HjZxs/lK7gWcZjz24=
X-Gm-Gg: AfdE7clCvjfWOCPPZep9OSjiGweM2xVsufMfmyjLXBeMlGYJixMZy16gAe4FoRneQLi
	crPaNcqo7AGUZuCsdGQO9HJtRny9KSxTYn09Bab9cIxwFvCdgOpeictsP/rt9L4cG56R3dtNqLv
	O8U3lIl4Sh5TP8s4uTiUH8sJkM5SwLIdcRvzL3HY6s7tUDRwifnlDDA8EDXpNuLJwA5jyBn8yoo
	TLw9aBUstcX7+vYlhtO7qbUpOwLtRiB3r7mbbqHSvPH1g+9mpEhv7VxjkbwQmr3UDqGrFJvfLhT
	YBxv0w==
X-Received: by 2002:a17:907:e110:b0:c0c:63bb:f422 with SMTP id
 a640c23a62f3a-c0c63bbf546mr86176966b.43.1781963119757; Sat, 20 Jun 2026
 06:45:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616074952.93076-1-doruk@0sec.ai> <20260617074123.32464-1-doruk@0sec.ai>
In-Reply-To: <20260617074123.32464-1-doruk@0sec.ai>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 20 Jun 2026 19:15:04 +0530
X-Gm-Features: AVVi8Ceek5KHZhoQI3N5eXAU25nCx3k1CHygVioQTDscbsZIHW26iKArybAPhdM
Message-ID: <CANAwSgQ0FdonxfZ8V=tPB8rBiyFj3fV-1tqJA0-RN9=AYvoBpQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: meson: vdec: fix use-after-free of decode work
 in stop/close path
To: Doruk Tan Ozturk <doruk@0sec.ai>
Cc: neil.armstrong@linaro.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	hverkuil@kernel.org, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, 
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:doruk@0sec.ai,m:neil.armstrong@linaro.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:hverkuil@kernel.org,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:linux-media@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-staging@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65310-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,linuxfoundation.org,baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,infradead.org:url,infradead.org:email,0sec.ai:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 53DEE6A8F58

Hi Doruk,

On Wed, 17 Jun 2026 at 13:11, Doruk Tan Ozturk <doruk@0sec.ai> wrote:
>
> Please drop v1 and v2 -- both are wrong, and the sashiko review was right
> about the deadlock.
>
> The underlying bug is real: vdec_close() does kfree(sess) (and
> v4l2_m2m_ctx_release() frees sess->m2m_ctx) without cancelling
> sess->esparser_queue_work, whose worker dereferences sess->lock and
> sess->m2m_ctx -> UAF if it is pending/running at teardown.
>
> But cancelling on the streamoff/poweroff path can't work:
>
> 1) Deadlock. The worker takes sess->lock. For an m2m fh the ioctl core
>    takes m2m_ctx->q_lock (== sess->lock) for VIDIOC_STREAMOFF and holds it
>    across the handler, so vdec_stop_streaming() -> vdec_poweroff() already
>    runs under sess->lock; cancel_work_sync() there waits on a worker blocked
>    on that same lock.
>
> 2) Use-after-power-down. v2 also cancelled after vdec_ops->stop(), which
>    power-gates VDEC1 (__vdec_1_stop()), while the worker still reads a VDEC1
>    register (vdec_1_vififo_level() -> VLD_MEM_VIFIFO_LEVEL).
>
> The only deadlock-free point I see is vdec_close() (the ->release fop, not
> under sess->lock), cancelling before v4l2_m2m_ctx_release() -- but that
> still leaves the threaded VDEC ISR (amvdec_dst_buf_done() ->
> schedule_work()) able to re-arm the worker, and there are adjacent teardown
> issues (esparser_isr() vs the dos_parser_clk disable;
> vdec_decoder_cmd()/esparser_queue_eos() without sess->lock).
>
> I don't have Meson hardware to validate a corrected fix. Is a
> vdec_close()-only cancel (plus quiescing the VDEC IRQ outside sess->lock)
> the direction you'd want, or would you rather take it given the HW testing
> and the surrounding teardown concerns?
>
Actually, I've been working on this issue for a while and have made a few
changes. I really like your approach, so I'd like to integrate
it alongside my cleanup changes. It should solve this issue.

diff --git a/drivers/staging/media/meson/vdec/esparser.c
b/drivers/staging/media/meson/vdec/esparser.c
index 4632346f04a9..c5b909c6a2b7 100644
--- a/drivers/staging/media/meson/vdec/esparser.c
+++ b/drivers/staging/media/meson/vdec/esparser.c
@@ -375,6 +375,9 @@ void esparser_queue_all_src(struct work_struct *work)
        struct amvdec_session *sess =
                container_of(work, struct amvdec_session, esparser_queue_work);

+       if (READ_ONCE(sess->should_stop))
+               return;
+
        mutex_lock(&sess->lock);
        v4l2_m2m_for_each_src_buf_safe(sess->m2m_ctx, buf, n) {
                if (sess->should_stop)
diff --git a/drivers/staging/media/meson/vdec/vdec.c
b/drivers/staging/media/meson/vdec/vdec.c
index 51ea7beef811..de3a660d22b1 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -448,6 +448,9 @@ static void vdec_stop_streaming(struct vb2_queue *q)
        enum amvdec_status old_status;
        bool full_cleanup = false;

+       sess->should_stop = 1;
+       cancel_work_sync(&sess->esparser_queue_work);
+
        /*
         * Secure the hardware lock for the ENTIRE state evaluation
         * sequence to block concurrent start_streaming() callers.
@@ -1000,6 +1003,9 @@ static int vdec_close(struct file *file)
 {
        struct amvdec_session *sess = file_to_amvdec_session(file);

+       sess->should_stop = 1;
+       cancel_work_sync(&sess->esparser_queue_work);
+
        if (!IS_ERR_OR_NULL(sess->recycle_thread)) {
                kthread_stop(sess->recycle_thread);
                sess->recycle_thread = NULL;

> Doruk
>
Thanks
-Anand
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

