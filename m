Return-Path: <linux-media+bounces-31679-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB87EAA89DC
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 00:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FADF3B1DC3
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 22:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D5C246775;
	Sun,  4 May 2025 22:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UpjTLyji"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0570424EA8D
	for <linux-media@vger.kernel.org>; Sun,  4 May 2025 22:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746398565; cv=none; b=QjfHRS4D3MDQ5A9GO/MSLbHCnoytbE7LgOd/Uaezdu+j6hiebOIw0tENSrPTvAhjwJESGOe58X7mEV9Gka42mT52PUQHK2TBDGMnX20ygSnnj/6dni2c/sxf15iM/8oHZYK/z+NrgHXIBfwULef4bWPCjknhBE2vaky4ZIaD7xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746398565; c=relaxed/simple;
	bh=hpi+1WKsldoD7aaDq11Ugd6+x4oQPbat+b3N9LvEESI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=L+VxEiDYjCe1CIwzkO0M0lmpLWzTfBaUFRDh7YPXR5GsXhT3o4vf1OoAd7vDssUtqBxQ2YlnOup5BFC7rjbiTE5MxnMY9yGJkdQgxQIsGlb3XQXjSDgQO9pHlUF9ulnUS4BwxEqgO9jVffj0+7ru3Ensu/h2TF53Wdhf53WlaBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UpjTLyji; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff6aaa18e8so3033818a91.1
        for <linux-media@vger.kernel.org>; Sun, 04 May 2025 15:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746398563; x=1747003363; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DXDdbmilM6kw4tmaPJb1OY6Nmv5TWjsHKnabAlzq4nA=;
        b=UpjTLyjiXAgxj0kUulgUa99ZWXz3Y3322TUQbjjL/SFYMpRX3ufBEtRG0gcxRrKs5K
         egF5zO1jpCJCsTgXlICnlDi42rr8o3/9A4EbJGdmpWLCwb6wpH67NXrphGpMKu9iZqfS
         zYudNS+m6MOGqUtBz3BfwNiYkluWFexOTrptMobyqyGJ51rrIDaJ0YIUGcrV3Ij31TV9
         95DmSmuFMeR2LIZa8G7UqqgfMDHwBClBDZcaHKpIT5JkzsKs7s0Ysbaw42Wt1IzyK1aY
         emsnzXrKdalZoMoF7VKPlScvE+fswcQ3PF06w0rcXnyxuvd7642IyPLeqlX8vd8gPN+0
         PS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746398563; x=1747003363;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DXDdbmilM6kw4tmaPJb1OY6Nmv5TWjsHKnabAlzq4nA=;
        b=Bgrw+1P/VxYqvDv7c2ytSP0apWYo2WLRqzUVVGElwAB43ykH18Gx5ggDBSgMgLNHI4
         uVx4OSFGEdgRRduMwcVUpk1DAA50ZGagmyh4Gjnhj0Hdoj8lfBV65iS8OWjO6WCdtq02
         ffJThPvxlE7Oe8rdKCTeJkHQj4D2TP9smo8V86eBtsyomfaSzhiaeOwAfBezNSwP98Tl
         TCWZOcSDthQwvdj3UuHkHC5ZeBtMOC4fOgUI/D9UgWkJSdbAwZdg0CVQNYwP5TCqqukY
         wou9K/JdpzSzVJ9VxZj98woK6lItybAwvilIp5ch4znzXNfG5gKQ//c5uv/tgRtrH8bv
         le3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUf0SPOxqXJPqjP8uYYw1iPH0PxFVlYQK9YQxHqM7GHrZ3YHhO7DZsOQa9qD0mMz2k9sESmkjvX4AlDFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzJFTo8ccAeAOmfudu3j8enM/TqhvWFUosNQ+c8Q0zZfXWXaGW
	nT8zr0kSxKEDP62B/OK4VfMOU9DT5xOshEwsgH4uY1z7nLG/OvnjB8Mdb+UKeyszR3s4OEYUp2X
	T8woKLc0PxjIGdQ==
X-Google-Smtp-Source: AGHT+IHeuhPkqCORnCnlODfZEgoM3mxo+4Qkj5bGxDZDkA2AvS1Wg0vNaQ4AA42Kn2PJNuaQSmzdVlm4/hxRO/Q=
X-Received: from pjbee11.prod.google.com ([2002:a17:90a:fc4b:b0:2fb:fa85:1678])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1f8c:b0:305:5f32:d9f0 with SMTP id 98e67ed59e1d1-30a4e5c5e9dmr15101935a91.19.1746398563275;
 Sun, 04 May 2025 15:42:43 -0700 (PDT)
Date: Sun,  4 May 2025 22:41:39 +0000
In-Reply-To: <20250504224149.1033867-1-tjmercier@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250504224149.1033867-1-tjmercier@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250504224149.1033867-4-tjmercier@google.com>
Subject: [PATCH v2 3/6] bpf: Add open coded dmabuf iterator
From: "T.J. Mercier" <tjmercier@google.com>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	skhan@linuxfoundation.org, song@kernel.org, alexei.starovoitov@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, android-mm@google.com, simona@ffwll.ch, 
	corbet@lwn.net, eddyz87@gmail.com, yonghong.song@linux.dev, 
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
 kernel/bpf/dmabuf_iter.c | 43 ++++++++++++++++++++++++++++++++++++++++
 kernel/bpf/helpers.c     |  5 +++++
 2 files changed, 48 insertions(+)

diff --git a/kernel/bpf/dmabuf_iter.c b/kernel/bpf/dmabuf_iter.c
index 968762e11f73..ebf9794241ef 100644
--- a/kernel/bpf/dmabuf_iter.c
+++ b/kernel/bpf/dmabuf_iter.c
@@ -132,3 +132,46 @@ static int __init dmabuf_iter_init(void)
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
+	kit->dmabuf = get_next_dmabuf(kit->dmabuf);
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
index e3a2662f4e33..49de5eae44da 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -3294,6 +3294,11 @@ BTF_ID_FLAGS(func, bpf_iter_kmem_cache_next, KF_ITER_NEXT | KF_RET_NULL | KF_SLE
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
2.49.0.906.g1f30a19c02-goog


