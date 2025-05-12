Return-Path: <linux-media+bounces-32316-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EEEAB3F6E
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 19:42:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0A6A19E4245
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 17:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BEAF29713E;
	Mon, 12 May 2025 17:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tnGPzv2S"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66093297117
	for <linux-media@vger.kernel.org>; Mon, 12 May 2025 17:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747071660; cv=none; b=BXt05sjz3RDn5eBJ+FjKbTTix1AXBjudRvlsN2W+qBQEp3Ok2UJbCOs0QTC88IRwDqNTOg9iJcQEYeySkxbl6VaBhYJnnNK/jlqpbfDrek+OHjUCwbrdkS6oyjBCG81B98k7WMgMH6seQlRmFnCQfuME2y60xILn+Fa9nPF6J8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747071660; c=relaxed/simple;
	bh=LoopqmbJs5Vnk3r2GqCH3tKa+epZcqS8UrpFqFIMmhs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Rzgtmuzhjc5HEAh53npukVoMXZt8Jt1lRdu/2QFmXH37Tb1/tzogaNOjwZycAyBzJD7OE4jPdsnZO1fLCyksDMDFH1Ckm68Zz5uGvzAX2sqrlsSFlWJCwC1d+RGiaFWNwgHIIUm4kboN03NtYxadEbC3jkttbcOAcMB/kSi0/bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tnGPzv2S; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-30adbe9b568so4311609a91.1
        for <linux-media@vger.kernel.org>; Mon, 12 May 2025 10:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747071659; x=1747676459; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xt8CAY1hcGS6Lny9EEFatzo77hxl+1XNQzM/j34oESs=;
        b=tnGPzv2SghvCTAz/6kZdNA6gSGtTYW1Y8VtU1vdkOxn7vr8YZ2I/+HXXHi9x0/ZegM
         1r6ZmzUnC5+ZYaM7JvcIZxqZXRexROGALkPZQJ+1nNtZN2jmvvDEvQdN20jekI9g59Dk
         16CD7uoKfm6GjcCWsu6uSsqoSGmSmrvFEiWyF8Z5skj6r8rGvM0gea83nImDS+TGkEvZ
         AbzgxpeKPKjgmby6cZkzlQD0a3JMRueByx2PHrj6oQtoDjqAKuC5Q+YuFBhgMa07ghJZ
         C2mwrf7FwETCsR8cp/4/NjbtKfrUj2A4ZCtX0KSmGzZDujymTfDlJqtgzuLmON2EQ6js
         Rcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747071659; x=1747676459;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xt8CAY1hcGS6Lny9EEFatzo77hxl+1XNQzM/j34oESs=;
        b=N9GX6GMUHjE5hUsvFpfPj6w7YAMMV+MPc28TK2JozA8/xOrbpJyyRFYEmlkPg8nWxy
         QsylYERFe4ECGfMokbZ6ScbACrhvyVTiQe7waVoQS2LzXcZaP94oWQsyUAmLSZbQ95W1
         ljrQSqKOg7CYKSIQ2sD7ccW147/dDxi89ppbQ5L6nCnJNwEmVMDOnR6DOZxg62kWt2oa
         mwQNA+lUeAeTyqljWP9B3ECBSmLhR0Jt1JeDQ86zgcAIWXYpPhPqsLxGagEXCTVgM+hK
         rv6VyeFGMh8rVGzNbOUuodM9rIajC43/iCnCHOShc4L0nmZPdUhM7OARTJPCUYAVg38I
         BCQQ==
X-Forwarded-Encrypted: i=1; AJvYcCX89/DZkbzw+zcrMgiOIPZLjphHw8XY8+OATI3/PdiYtHk0R1R8aVJF3WL0ZcO7ghh7bl5GMYjw1uOtIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyB+Se8AZCDVLQ6Pz83ojIqiznjF/9znYmZLeg2xHbxQH0ZKYFl
	ZAxNFZ7rFiliQ82SEAHfKefCTCzsOYx37EjX/i1iapFPvM+rnLoxNpBHF6prFwqnB9ak914woRS
	aEhLfZ01INJqF2A==
X-Google-Smtp-Source: AGHT+IGSf3qT9YvheOr4I3XzP14hYOrPMaTHP/OGAQDR4qmiHA2sveVJ+nyVBauT4udhHi7fyZ4qbN95CQx57ik=
X-Received: from pjbsn16.prod.google.com ([2002:a17:90b:2e90:b0:2fa:15aa:4d2b])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2413:b0:30c:5617:7475 with SMTP id 98e67ed59e1d1-30c5617928fmr14088307a91.18.1747071658988;
 Mon, 12 May 2025 10:40:58 -0700 (PDT)
Date: Mon, 12 May 2025 17:40:34 +0000
In-Reply-To: <20250512174036.266796-1-tjmercier@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250512174036.266796-1-tjmercier@google.com>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250512174036.266796-4-tjmercier@google.com>
Subject: [PATCH bpf-next v5 3/5] bpf: Add open coded dmabuf iterator
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
Content-Transfer-Encoding: quoted-printable

This open coded iterator allows for more flexibility when creating BPF
programs. It can support output in formats other than text. With an open
coded iterator, a single BPF program can traverse multiple kernel data
structures (now including dmabufs), allowing for more efficient analysis
of kernel data compared to multiple reads from procfs, sysfs, or
multiple traditional BPF iterator invocations.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
Acked-by: Song Liu <song@kernel.org>
---
 kernel/bpf/dmabuf_iter.c | 48 ++++++++++++++++++++++++++++++++++++++++
 kernel/bpf/helpers.c     |  5 +++++
 2 files changed, 53 insertions(+)

diff --git a/kernel/bpf/dmabuf_iter.c b/kernel/bpf/dmabuf_iter.c
index 83ef54d78b62..4dd7ef7c145c 100644
--- a/kernel/bpf/dmabuf_iter.c
+++ b/kernel/bpf/dmabuf_iter.c
@@ -100,3 +100,51 @@ static int __init dmabuf_iter_init(void)
 }
=20
 late_initcall(dmabuf_iter_init);
+
+struct bpf_iter_dmabuf {
+	/*
+	 * opaque iterator state; having __u64 here allows to preserve correct
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
+	struct bpf_iter_dmabuf_kern *kit =3D (void *)it;
+
+	BUILD_BUG_ON(sizeof(*kit) > sizeof(*it));
+	BUILD_BUG_ON(__alignof__(*kit) !=3D __alignof__(*it));
+
+	kit->dmabuf =3D NULL;
+	return 0;
+}
+
+__bpf_kfunc struct dma_buf *bpf_iter_dmabuf_next(struct bpf_iter_dmabuf *i=
t)
+{
+	struct bpf_iter_dmabuf_kern *kit =3D (void *)it;
+
+	if (kit->dmabuf)
+		kit->dmabuf =3D dma_buf_iter_next(kit->dmabuf);
+	else
+		kit->dmabuf =3D dma_buf_iter_begin();
+
+	return kit->dmabuf;
+}
+
+__bpf_kfunc void bpf_iter_dmabuf_destroy(struct bpf_iter_dmabuf *it)
+{
+	struct bpf_iter_dmabuf_kern *kit =3D (void *)it;
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
@@ -3346,6 +3346,11 @@ BTF_ID_FLAGS(func, bpf_iter_kmem_cache_next, KF_ITER=
_NEXT | KF_RET_NULL | KF_SLE
 BTF_ID_FLAGS(func, bpf_iter_kmem_cache_destroy, KF_ITER_DESTROY | KF_SLEEP=
ABLE)
 BTF_ID_FLAGS(func, bpf_local_irq_save)
 BTF_ID_FLAGS(func, bpf_local_irq_restore)
+#ifdef CONFIG_DMA_SHARED_BUFFER
+BTF_ID_FLAGS(func, bpf_iter_dmabuf_new, KF_ITER_NEW | KF_SLEEPABLE)
+BTF_ID_FLAGS(func, bpf_iter_dmabuf_next, KF_ITER_NEXT | KF_RET_NULL | KF_S=
LEEPABLE)
+BTF_ID_FLAGS(func, bpf_iter_dmabuf_destroy, KF_ITER_DESTROY | KF_SLEEPABLE=
)
+#endif
 BTF_KFUNCS_END(common_btf_ids)
=20
 static const struct btf_kfunc_id_set common_kfunc_set =3D {
--=20
2.49.0.1045.g170613ef41-goog


