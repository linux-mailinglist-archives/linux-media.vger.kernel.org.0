Return-Path: <linux-media+bounces-32055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B6BAB0299
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 20:22:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E8C03B84E0
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 18:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0EB128851A;
	Thu,  8 May 2025 18:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sHcj5pQL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF412882D8
	for <linux-media@vger.kernel.org>; Thu,  8 May 2025 18:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746728456; cv=none; b=kMQAw5anHV7tQEe6gTN/Y5Xn7Im1RXEJUXYR5cux7/OGcAjmg+BNiCG0b6MnLD35IWE8B+daLcgTZmWDMgsn5281W82ePeMu8SjCcAcQY4+BMQFrdNouJy35z6LTHMadW5DQb7IMUpbNv/VG6PPoTkPYlyIei8+3eX22+nx4+8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746728456; c=relaxed/simple;
	bh=zGEqoJsnLxoyqxrZghaDObefQCOgPWpmlTZqfwBdN/g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YVYD8yveCvr18Cap+IOeSiEKlkjkYdBEwdUiO8wuUfbND3tCJtTaUmk0JPvsnOHGNUCLWWPZTWdqM7Wgx0IrTC6mhRYTodLAQnOC8DKW3S2IrbXP2//IKP7mqi4ZYHvMwHjjWvz5odJ0iVkCICDPAZ860ANe/1t/qCt7WkF8fFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sHcj5pQL; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-22e3abea7e8so17029435ad.2
        for <linux-media@vger.kernel.org>; Thu, 08 May 2025 11:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746728453; x=1747333253; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OWA0exWT2PF9Bwdd6zODqvQVYBXl/Ht/Vugb+Sflr70=;
        b=sHcj5pQL90NiaMSQxm4Ay9AwYM3eTir31wG1WCHGxQ5+lEOOcAbpdmnSKLYei6KyNA
         2Mb9b8SgUuvFgN8hJjxNSC9Vr0CZqlpVzBmBz6Eo5piMeI42nMLPPVb49d2GyqhirwVd
         f+LXP8qu6JiwxViF4kUcE5r7nrFhcyP2sXqOJZ46jED1XJUeUW00Toq82czLD5eO++ek
         BDlI6Bj8mFOXz2cZdkxlZPyf1I5zR87q3TwQF7JITYkHpJSZvbYIvy5WEeeT0ue0PKhD
         A1SsZxO6q7Oi7ehEV78t+3OMmYOoCVv9tlIQe838fXOSLe4HzK9sfyJ5dLRrw0P6NUyj
         ITHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746728453; x=1747333253;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OWA0exWT2PF9Bwdd6zODqvQVYBXl/Ht/Vugb+Sflr70=;
        b=F8RU6ctmzj6054MZDv0QY/B3dBxHziqoXoSll+J/JJNbmoyEi9/5hj1qPK35gyO6AY
         0lwPlfA+whVuv1g6OCGgLyrbVPBEi8IOBuXuUs8Nu0Y4pQESsc4TlzvhLMbb9xmdUGRv
         n+KLqg1ZchIXi/QlOK4F5hphJbha0g2H1CVSMaSVsTB9UwIHbAde+CmVYZnir/Ie/tbI
         fnZL8m1UuI0sFhkpdpU5i2OmhCUOKjEoegDnqyemHrREXRdmlV8irRmkMoKWfqCGtIQN
         k1ya1gTMQKT5k/dctTTNWwo3typ2pugt8elRxgwIRQsZSrNlAH2D5jNmrIjsQpmT8SHQ
         x6mg==
X-Forwarded-Encrypted: i=1; AJvYcCWSSomcQByHy/1oOK+OX5ifWOSeLIkfQYG16aEwW7dGYIlhjbhgCa1l44qVF2GeSpvRaztsB7GzTaIY3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw97hxSz2w3tGcRVQU7x5EVY6H+uNOCXO3MF3ARIUfJb3lj6hnc
	bmXjTMquudBxqi3yyPvXGyBcu9mYsqItwuB6mhIueKkKxMOqBbBGb2q84U3eL+jub90ltDwvvPs
	27aAoG7RGnK6tJw==
X-Google-Smtp-Source: AGHT+IEeAsbdgzwNcuStC5o0lsQE+GcpWguKPjE5+maPyPUAIOXS6rnVv8L8CoEgWNh3XZFUrNpQz3jUw6fJs5g=
X-Received: from plb16.prod.google.com ([2002:a17:903:4410:b0:22f:b333:1bd9])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ecc2:b0:211:e812:3948 with SMTP id d9443c01a7336-22fc8946f85mr6138175ad.0.1746728453022;
 Thu, 08 May 2025 11:20:53 -0700 (PDT)
Date: Thu,  8 May 2025 18:20:22 +0000
In-Reply-To: <20250508182025.2961555-1-tjmercier@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250508182025.2961555-1-tjmercier@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250508182025.2961555-4-tjmercier@google.com>
Subject: [PATCH bpf-next v4 3/5] bpf: Add open coded dmabuf iterator
From: "T.J. Mercier" <tjmercier@google.com>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	skhan@linuxfoundation.org, alexei.starovoitov@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, android-mm@google.com, 
	simona@ffwll.ch, eddyz87@gmail.com, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	jolsa@kernel.org, mykolal@fb.com, shuah@kernel.org, song@kernel.org, 
	"T.J. Mercier" <tjmercier@google.com>
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
index 96b4ba7f0b2c..8049bdbc9efc 100644
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
+		kit->dmabuf = dma_buf_iter_next(kit->dmabuf);
+	else
+		kit->dmabuf = dma_buf_iter_begin();
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
2.49.0.1015.ga840276032-goog


