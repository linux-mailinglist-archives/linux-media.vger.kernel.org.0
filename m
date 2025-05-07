Return-Path: <linux-media+bounces-31883-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2438AAD1F5
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 02:11:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69FFC982A47
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 00:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C5235973;
	Wed,  7 May 2025 00:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TmPVv/Ix"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93102AE90
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 00:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746576652; cv=none; b=PSRrAynPqA1tdsbaUolNL/GJuocLthP2eaL4fpE1O3MLWQpPjHRXJ8iIGwSjfWvmqJ5OCkpmrkhUyrgvDZ+Mnpvdm812NQ8miidNehR5G5qkcQOmqrSMXRhHY0qZxrrbL4IRCkymYyRFYQs5BsAcFpARDfzrl19nMvfV0sSEofA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746576652; c=relaxed/simple;
	bh=pyse2+fm36nrb8svFIqyM73W2uIjgmXGZFlVg/8fUik=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jJ+ZkHT5yGBgOJJHnz5p9/XnRbdBwC2lvGUGBfvqYKd9E0BRI7wXF/Q3Y2uCxlAPZawrFQDwXyKfQ1vZz/5+Y4BPmcSMojlZMH0BJFMN1OAuII7jPR8sEEvgbMqsoIj+Vq2qpNHG0I5YsQyR9foV0Og8laP9xLIRx4TpMu6smb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TmPVv/Ix; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-22651aca434so51274485ad.1
        for <linux-media@vger.kernel.org>; Tue, 06 May 2025 17:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746576650; x=1747181450; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SkxID+WP7mb4sg4ZUV6PaZg3RytzLGPGnjFriQZ17Hk=;
        b=TmPVv/IxE+dGkeNFkVIjRbpAcx+Lb38uM2KaL3fYaffMXCOO7Jm7WjXYSKxVf+gTEz
         mwLP84RgxcpuATRe6ave9DGu/lkNCGUoqnyxm1tX1pr1KTSsnXgFZmcb09IYI1lWvjWU
         S2kniz9scC3wOqg4RfStqBNbSCEo5IvOQwVeAgM4yZBT4WF8n67ivVojYNidD3xvGYQh
         LA6TVHDRZQl8Os5dFVKf1rhEbZfuv3mTCM24WkJDJALDNJhUwAiqSDzqU3rN8fWL/3Gs
         BypoGKT9Ts2B06hGw6gmqHnFmwW54U8VHbyG0mWAWsMOErBe+G9VtpiTUmguADjaODf+
         lhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746576650; x=1747181450;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SkxID+WP7mb4sg4ZUV6PaZg3RytzLGPGnjFriQZ17Hk=;
        b=ef7b/+0ai5MwfAZ2bkR9JBB64+vd4P+gEQ2Zz+APiz4FgC98BSHhfa/FufdvKFh4XO
         r9mVbjKotZ8YSsxMzocTNXFkYyIRogpOrpI0ilESkcR57btRJaTsyBzHTe900OChGxD2
         9ouX5DoGUjETNrYc1ONj/0yhATMub2IJn4fZpW/qcel4arRpWr+e5QHf9/xgnHuAsGIA
         y0NNlD44SOISFeqwrD3RRcq+rcJXPOcbW1RtdhM7lWQ3Z/Cfj/7vtLrtNAoDMvO7hGcd
         NcGZfFtfwzpUBQM9vxG4pITcq8l4t0gfzNuph6vxujJkYW3fWO1V/jGPR3SbmSW6TTcf
         DM5g==
X-Forwarded-Encrypted: i=1; AJvYcCWVKmjwyIWv9DdnQBV87JD/Aa7Tjm30aYyvbxLo7RgwAUZSqzHU+lpmPGF3c1CMWTtWrl0PAaFW9EUTFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWVAQ9bWccaAla89M2zB0vIIRrr5+Baaju8riA6bPYN8RuUxLQ
	qxb6WthXXdZts4gyqUQJKXHGKrmdsNyTjB+Gs35WmNYZAD8gl/5gKjU12XP/WIfn7vHCrPjotDK
	NRE4g+6dOIRd0GQ==
X-Google-Smtp-Source: AGHT+IEx7hDcQzk8ELF2Wf/YDX+04BAayFsjqz8ketxueOqk4IMFJhrgD4+bT2AOspb/6AKarjrhAJ8dHZy5bPA=
X-Received: from pjbsi7.prod.google.com ([2002:a17:90b:5287:b0:2fb:fa85:1678])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ecc6:b0:22e:1740:e561 with SMTP id d9443c01a7336-22e5ea501ccmr19570925ad.19.1746576649869;
 Tue, 06 May 2025 17:10:49 -0700 (PDT)
Date: Wed,  7 May 2025 00:10:34 +0000
In-Reply-To: <20250507001036.2278781-1-tjmercier@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250507001036.2278781-1-tjmercier@google.com>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250507001036.2278781-4-tjmercier@google.com>
Subject: [PATCH bpf-next v3 3/5] bpf: Add open coded dmabuf iterator
From: "T.J. Mercier" <tjmercier@google.com>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	skhan@linuxfoundation.org, alexei.starovoitov@gmail.com, song@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, android-mm@google.com, 
	simona@ffwll.ch, eddyz87@gmail.com, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	jolsa@kernel.org, mykolal@fb.com, "T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"

This open coded iterator allows for more flexibility when creating BPF
programs. It can support output in formats other than text. With an open
coded iterator, a single BPF program can traverse multiple kernel data
structures (now including dmabufs), allowing for more efficient analysis
of kernel data compared to multiple reads from procfs, sysfs, or
multiple traditional BPF iterator invocations.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 kernel/bpf/dmabuf_iter.c | 47 ++++++++++++++++++++++++++++++++++++++++
 kernel/bpf/helpers.c     |  5 +++++
 2 files changed, 52 insertions(+)

diff --git a/kernel/bpf/dmabuf_iter.c b/kernel/bpf/dmabuf_iter.c
index 80bca8239c6d..b0478b4875ed 100644
--- a/kernel/bpf/dmabuf_iter.c
+++ b/kernel/bpf/dmabuf_iter.c
@@ -100,3 +100,50 @@ static int __init dmabuf_iter_init(void)
 }
 
 late_initcall(dmabuf_iter_init);
+
+struct bpf_iter_dmabuf {
+	/* opaque iterator state; having __u64 here allows to preserve correct
+	 * alignment requirements in vmlinux.h, generated from BTF
+	 */
+	__u64 __opaque[1];
+} __aligned(8);
+
+/* Non-opaque version of bpf_iter_dmabuf */
+struct bpf_iter_dmabuf_kern {
+	struct dma_buf *dmabuf;
+} __aligned(8);
+
+__bpf_kfunc_start_defs();
+
+__bpf_kfunc int bpf_iter_dmabuf_new(struct bpf_iter_dmabuf *it)
+{
+	struct bpf_iter_dmabuf_kern *kit = (void *)it;
+
+	BUILD_BUG_ON(sizeof(*kit) > sizeof(*it));
+	BUILD_BUG_ON(__alignof__(*kit) != __alignof__(*it));
+
+	kit->dmabuf = NULL;
+	return 0;
+}
+
+__bpf_kfunc struct dma_buf *bpf_iter_dmabuf_next(struct bpf_iter_dmabuf *it)
+{
+	struct bpf_iter_dmabuf_kern *kit = (void *)it;
+
+	if (kit->dmabuf)
+		kit->dmabuf = get_next_dmabuf(kit->dmabuf);
+	else
+		kit->dmabuf = get_first_dmabuf();
+
+	return kit->dmabuf;
+}
+
+__bpf_kfunc void bpf_iter_dmabuf_destroy(struct bpf_iter_dmabuf *it)
+{
+	struct bpf_iter_dmabuf_kern *kit = (void *)it;
+
+	if (kit->dmabuf)
+		dma_buf_put(kit->dmabuf);
+}
+
+__bpf_kfunc_end_defs();
diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
index 78cefb41266a..39fe63016868 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -3346,6 +3346,11 @@ BTF_ID_FLAGS(func, bpf_iter_kmem_cache_next, KF_ITER_NEXT | KF_RET_NULL | KF_SLE
 BTF_ID_FLAGS(func, bpf_iter_kmem_cache_destroy, KF_ITER_DESTROY | KF_SLEEPABLE)
 BTF_ID_FLAGS(func, bpf_local_irq_save)
 BTF_ID_FLAGS(func, bpf_local_irq_restore)
+#ifdef CONFIG_DMA_SHARED_BUFFER
+BTF_ID_FLAGS(func, bpf_iter_dmabuf_new, KF_ITER_NEW | KF_SLEEPABLE)
+BTF_ID_FLAGS(func, bpf_iter_dmabuf_next, KF_ITER_NEXT | KF_RET_NULL | KF_SLEEPABLE)
+BTF_ID_FLAGS(func, bpf_iter_dmabuf_destroy, KF_ITER_DESTROY | KF_SLEEPABLE)
+#endif
 BTF_KFUNCS_END(common_btf_ids)
 
 static const struct btf_kfunc_id_set common_kfunc_set = {
-- 
2.49.0.1045.g170613ef41-goog


